/**
 * 閲覧履歴パネル（全ページ共通）
 *
 * 各ページの .page-number から番号を読み取って訪問を記録し、
 * 到達済みのページ一覧を画面内に常時表示する。
 * 未訪問のページはタイトルを伏せて「???」と表示する。
 */
(function () {
    'use strict';

    var STORAGE_KEY = 'unreal_visited_pages';
    var PANEL_STATE_KEY = 'unreal_history_open';

    // CSV(UnRe_al.csv)の体系に基づくページ名
    var PAGE_TITLES = {
        0: 'DM',
        1: 'TOP',
        2: 'NEWS',
        3: 'PROFILE',
        4: 'DISCOGRAPHY',
        5: 'BLOG',
        6: 'GALLERY',
        7: 'ABOUT US',
        8: 'FC LOGIN',
        9: 'メッセージログ',
        10: '灰谷の履歴書',
        11: 'ゆののカルテ',
        12: 'らんのカルテ',
        13: '契約書',
        14: '鑑定結果',
        15: 'リーク記事',
        16: 'エッグスアカデミーのHP',
        17: 'みれいのカルテ',
        18: 'βCPM資料',
        19: 'りんBLOG',
        20: 'ゆのBLOG',
        21: 'あきBLOG',
        22: 'みれいBLOG',
        23: 'いろはBLOG',
        24: 'らんBLOG',
        25: 'なぎさBLOG',
        26: 'クローン取引証明書',
        27: 'クローン資料',
        28: 'いろはのカルテ',
        29: '翠彩葉 最終試験結果',
        30: 'りんBLOG_EX',
        31: 'ゆのBLOG_EX',
        32: 'あきBLOG_EX',
        33: 'みれいBLOG_EX',
        34: 'いろはBLOG_EX',
        35: 'らんBLOG_EX',
        36: 'なぎさBLOG_EX',
        37: 'ニュース記事',
        38: 'あきのカルテ',
        39: '治療薬RFXに関する資料',
        40: 'なぎさのカルテ',
        41: '脳機能解放実験に関する資料',
        42: 'パスワード入力画面／りんちゃんのこと',
        43: 'りんのカルテ',
        44: '適応に関する資料',
        45: '鑑定結果（完全版）',
        46: 'Nxaに関する資料',
        47: 'パスワード入力画面',
        48: '調査ページ',
        49: 'りんとなぎさの会話ログ',
        50: 'n001型完成報告書',
        51: 'RN016仕様書',
        52: 'RN016実験報告書',
        53: '研究施設概要',
        54: '生活適応室内実験報告書',
        55: '調査ログex'
    };

    var TOTAL = 55;

    function loadVisited() {
        try {
            var raw = JSON.parse(localStorage.getItem(STORAGE_KEY) || '[]');
            return Array.isArray(raw) ? raw : [];
        } catch (e) {
            return [];
        }
    }

    function saveVisited(list) {
        localStorage.setItem(STORAGE_KEY, JSON.stringify(list));
    }

    // このページの番号を .page-number（"53/55" 形式）から取り出す
    function currentPageNo() {
        var el = document.querySelector('.page-number');
        if (!el) {
            return null;
        }

        var m = el.textContent.replace(/\s/g, '').match(/^(?:No\.)?(\d+)\/\d+$/);
        return m ? Number(m[1]) : null;
    }

    function recordVisit(no) {
        if (no === null || !(no in PAGE_TITLES)) {
            return loadVisited();
        }

        var visited = loadVisited();
        if (visited.indexOf(no) === -1) {
            visited.push(no);
            visited.sort(function (a, b) { return a - b; });
            saveVisited(visited);
        }

        return visited;
    }

    function buildPanel(visited, currentNo) {
        var panel = document.createElement('div');
        panel.className = 'ph-panel';
        panel.id = 'phPanel';

        var head = document.createElement('div');
        head.className = 'ph-head';
        head.innerHTML = '<span>ページ一覧</span>';

        var close = document.createElement('button');
        close.type = 'button';
        close.className = 'ph-close';
        close.setAttribute('aria-label', 'ページ一覧を閉じる');
        close.textContent = '✕';
        head.appendChild(close);

        var list = document.createElement('div');
        list.className = 'ph-list';

        Object.keys(PAGE_TITLES).forEach(function (key) {
            var no = Number(key);
            var isVisited = visited.indexOf(no) !== -1;

            var row = document.createElement('div');
            row.className = 'ph-row'
                + (isVisited ? '' : ' is-unvisited')
                + (no === currentNo ? ' is-current' : '');

            var label = ('0' + no).slice(-2);
            row.innerHTML =
                '<span class="ph-no">#' + label + '</span>'
                + '<span class="ph-mark">' + (isVisited ? '✓' : '○') + '</span>'
                + '<span class="ph-title">' + (isVisited ? PAGE_TITLES[no] : '???') + '</span>';

            list.appendChild(row);
        });

        panel.appendChild(head);
        panel.appendChild(list);

        var badge = document.createElement('button');
        badge.type = 'button';
        badge.className = 'ph-badge';
        badge.id = 'phBadge';
        badge.textContent = visited.length + ' / ' + TOTAL;
        badge.hidden = true;

        document.body.appendChild(panel);
        document.body.appendChild(badge);

        // 開閉状態を保存して次のページでも引き継ぐ
        function setOpen(open) {
            panel.hidden = !open;
            badge.hidden = open;
            localStorage.setItem(PANEL_STATE_KEY, open ? '1' : '0');
        }

        close.addEventListener('click', function () { setOpen(false); });
        badge.addEventListener('click', function () { setOpen(true); });

        setOpen(localStorage.getItem(PANEL_STATE_KEY) !== '0');

        // 現在のページまでスクロールしておく
        var current = list.querySelector('.is-current');
        if (current) {
            list.scrollTop = current.offsetTop - list.clientHeight / 2;
        }
    }

    // 調査ログ一覧ページなど、他の画面からも同じデータを使えるようにする
    window.UnRealPageHistory = {
        titles: PAGE_TITLES,
        total: TOTAL,
        getVisited: loadVisited
    };

    function init() {
        var no = currentPageNo();
        var visited = recordVisit(no);
        buildPanel(visited, no);
    }

    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', init);
    } else {
        init();
    }
})();
