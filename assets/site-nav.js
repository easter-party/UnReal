/**
 * TOPページと同じナビゲーションを描画する（メニューに載っているページ用）
 *
 * 読み込み時に data-root でサイトのルートへの相対パスを渡すこと。
 *   <script src="../assets/site-nav.js" data-root="../"></script>
 */
(function () {
    'use strict';

    // currentScript はこの場で読まないと後から取得できない
    var thisScript = document.currentScript;
    var root = (thisScript && thisScript.getAttribute('data-root')) || '';

    var MENU = [
        { label: 'TOP', href: 'index.html' },
        { label: 'NEWS', href: 'pages/news.html' },
        { label: 'PROFILE', href: 'pages/profile.html' },
        { label: 'DISCOGRAPHY', href: 'pages/discography.html' },
        { label: 'BLOG', href: 'pages/blog.html' },
        { label: 'GALLERY', href: 'pages/gallery.html' },
        { label: 'PRODUCTION', href: 'pages/about.html' },
        { label: 'FC LOGIN', href: 'pages/fc.html', className: 'desktop-fc-login' }
    ];

    var SEARCH_ICON =
        '<svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor"'
        + ' stroke-width="2" stroke-linecap="round" stroke-linejoin="round">'
        + '<circle cx="11" cy="11" r="8"></circle>'
        + '<path d="m21 21-4.35-4.35"></path></svg>';

    function buildNav() {
        var nav = document.createElement('nav');
        nav.className = 'main-nav';

        var items = MENU.map(function (m) {
            var cls = m.className ? ' class="' + m.className + '"' : '';
            return '<li><a href="' + root + m.href + '"' + cls + '>' + m.label + '</a></li>';
        }).join('');

        nav.innerHTML =
            '<div class="nav-container">'
            + '<div class="logo">'
            + '<a href="' + root + 'index.html">'
            + '<img src="' + root + 'images/logo/unreal.png" alt="UnRe:al" class="logo-image">'
            + '</a></div>'
            + '<ul class="nav-menu">' + items + '</ul>'
            + '<div class="nav-right">'
            + '<div class="search-container">'
            + '<input type="text" class="search-box" placeholder="SEARCH" id="searchBox">'
            + '<button class="search-btn" type="button" aria-label="検索">' + SEARCH_ICON + '</button>'
            + '</div>'
            + '<a href="' + root + 'pages/fc.html" class="fc-login-btn">FC LOGIN</a>'
            + '</div>'
            + '<div class="mobile-menu-toggle"><span></span><span></span><span></span></div>'
            + '</div>';

        document.body.insertBefore(nav, document.body.firstChild);
        return nav;
    }

    function bindEvents(nav) {
        var input = nav.querySelector('.search-box');
        var toggle = nav.querySelector('.mobile-menu-toggle');
        var menu = nav.querySelector('.nav-menu');

        // 検索はトップページの検索処理に渡す
        function submit() {
            var keyword = input.value.trim();
            if (keyword) {
                window.location.href = root + 'index.html?search=' + encodeURIComponent(keyword);
            }
        }

        nav.querySelector('.search-btn').addEventListener('click', submit);
        input.addEventListener('keypress', function (e) {
            if (e.key === 'Enter') {
                submit();
            }
        });

        // モバイルメニューの開閉
        toggle.addEventListener('click', function () {
            menu.classList.toggle('active');
            toggle.classList.toggle('active');
        });

        menu.querySelectorAll('a').forEach(function (link) {
            link.addEventListener('click', function () {
                menu.classList.remove('active');
                toggle.classList.remove('active');
            });
        });
    }

    function init() {
        bindEvents(buildNav());
    }

    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', init);
    } else {
        init();
    }
})();
