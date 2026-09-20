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

    // currentScript はこの場で読まないと後から取得できない
    var thisScript = document.currentScript;
    var root = (thisScript && thisScript.getAttribute('data-root')) || '';

    // 到達済みのページへ飛べるようにするためのリンク先
    var PAGE_URLS = {
        0: 'hidden/dm-log.html',
        1: 'pages/top.html',
        2: 'pages/news.html',
        3: 'pages/profile.html',
        4: 'pages/discography.html',
        5: 'pages/blog.html',
        6: 'pages/gallery.html',
        7: 'pages/about.html',
        8: 'pages/fc.html',
        9: 'pages/message_log.html',
        10: 'pages/haitani_resume.html',
        11: 'medical_record/yuno.html',
        12: 'medical_record/ran.html',
        13: 'c_doc/agreement_ichinose.html',
        14: 'c_doc/report_r2.html',
        15: 'c_doc/like.html',
        16: 'pages/eggs_academy.html',
        17: 'medical_record/mirei.html',
        18: 'c_doc/cpm.html',
        19: 'blog/rin/index.html',
        20: 'blog/yuno/index.html',
        21: 'blog/aki/index.html',
        22: 'blog/mirei/index.html',
        23: 'blog/iroha/index.html',
        24: 'blog/ran/index.html',
        25: 'blog/nagisa/index.html',
        26: 'pages/clonedeal.html',
        27: 'pages/clone_n005.html',
        28: 'medical_record/iroha.html',
        29: 'pages/test_report_iroha.html',
        30: 'blog_ex/rin.html',
        31: 'blog_ex/yuno.html',
        32: 'blog_ex/aki.html',
        33: 'blog_ex/mirei.html',
        34: 'blog_ex/iroha.html',
        35: 'blog_ex/ran.html',
        36: 'blog_ex/nagisa.html',
        37: 'c_doc/aki.html',
        38: 'medical_record/aki.html',
        39: 'c_doc/rfx.html',
        40: 'medical_record/nagisa.html',
        41: 'c_doc/experiment.html',
        42: 'passcode/m.html',
        43: 'medical_record/rin.html',
        44: 'c_doc/adaptation.html',
        45: 'c_doc/report_r2_full.html',
        46: 'c_doc/nxa.html',
        47: 'passcode/r.html',
        48: 'hidden/found_me.html',
        49: 'pages/r_n/log.html',
        50: 'medical_record/fuka.html',
        51: 'c_doc/rn016.html',
        52: 'c_doc/fuka_report.html',
        53: 'pages/map_laboratory.html',
        54: 'c_doc/living_adaptation.html',
        55: 'pages/log_49.html'
    };

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

            // 到達済みのページはリンクにして飛べるようにする
            var title = '???';
            if (isVisited) {
                title = PAGE_URLS[no]
                    ? '<a href="' + root + PAGE_URLS[no] + '">' + PAGE_TITLES[no] + '</a>'
                    : PAGE_TITLES[no];
            }

            row.innerHTML =
                '<span class="ph-no">#' + label + '</span>'
                + '<span class="ph-mark">' + (isVisited ? '✓' : '○') + '</span>'
                + '<span class="ph-title">' + title + '</span>';

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
        badge.addEventListener('click', function (e) {
            e.stopPropagation();
            setOpen(true);
        });

        // パネルの外側をタップしたら閉じる
        panel.addEventListener('click', function (e) { e.stopPropagation(); });
        document.addEventListener('click', function () {
            if (!panel.hidden) {
                setOpen(false);
            }
        });

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
