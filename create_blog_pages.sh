#!/bin/bash

# ブログページ作成関数
create_blog_page() {
    local member=$1
    local name=$2
    local emoji=$3
    local color=$4
    local page_no=$5
    local bg_color1=$6
    local bg_color2=$7
    
    cat > "blog/$member/index.html" << EOF
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${name}のブログ - UnReal</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            background: linear-gradient(135deg, $bg_color1 0%, $bg_color2 100%);
            font-family: -apple-system, BlinkMacSystemFont, Arial, sans-serif;
            color: #333;
            min-height: 100vh;
        }
        .page-number {
            position: fixed;
            top: 20px;
            right: 20px;
            color: #999;
            font-size: 14px;
        }
        .blog-header {
            background: linear-gradient(135deg, $color, ${color}aa);
            padding: 60px 20px;
            text-align: center;
            color: white;
        }
        .member-icon {
            font-size: 72px;
            margin-bottom: 20px;
        }
        .blog-title {
            font-size: 36px;
            margin-bottom: 10px;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 40px 20px;
        }
        .blog-post {
            background: white;
            border-radius: 10px;
            padding: 30px;
            margin-bottom: 30px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            cursor: pointer;
            transition: transform 0.3s;
        }
        .blog-post:hover {
            transform: translateY(-5px);
        }
        .post-date {
            color: $color;
            font-size: 14px;
            margin-bottom: 10px;
        }
        .post-title {
            font-size: 24px;
            margin-bottom: 15px;
        }
        .post-excerpt {
            color: #666;
            line-height: 1.6;
        }
        .fc-post {
            position: relative;
            opacity: 0.6;
        }
        .fc-badge {
            position: absolute;
            top: 20px;
            right: 20px;
            background: $color;
            color: white;
            padding: 5px 10px;
            border-radius: 5px;
            font-size: 12px;
        }
        .back-link {
            display: inline-block;
            margin-top: 30px;
            padding: 10px 20px;
            background: $color;
            color: white;
            text-decoration: none;
            border-radius: 20px;
            transition: all 0.3s;
        }
    </style>
</head>
<body>
    <div class="page-number">$page_no/50</div>
    
    <div class="blog-header">
        <div class="member-icon">$emoji</div>
        <h1 class="blog-title">${name} Official Blog</h1>
    </div>
    
    <div class="container">
        <div class="blog-post">
            <div class="post-date">2025.02.14</div>
            <h2 class="post-title">今日のこと</h2>
            <p class="post-excerpt">
                今日もレッスン頑張りました！
                みんなの応援が力になっています。
            </p>
        </div>
        
        <div class="blog-post fc-post" onclick="checkFC()">
            <span class="fc-badge">FC限定</span>
            <div class="post-date">2025.02.12</div>
            <h2 class="post-title">【会員限定】特別メッセージ</h2>
            <p class="post-excerpt">
                FC会員限定記事です。ログインして続きを読む...
            </p>
        </div>
        
        <div class="blog-post">
            <div class="post-date">2025.02.01</div>
            <h2 class="post-title">UnRe:alとして</h2>
            <p class="post-excerpt">
                新しい挑戦が始まりました。
                これからもよろしくお願いします！
            </p>
        </div>
        
        <a href="../../pages/blog.html" class="back-link">ブログ一覧に戻る</a>
    </div>
    
    <script>
        function checkFC() {
            if (localStorage.getItem('fcLoggedIn') === 'true') {
                window.location.href = '../../blog_ex/$member.html';
            } else {
                alert('この記事はFC会員限定です。\\nFCログインページからログインしてください。');
                window.location.href = '../../pages/fc.html';
            }
        }
    </script>
</body>
</html>
EOF
}

# 各メンバーのブログページ作成
create_blog_page "yuno" "百瀬ゆの" "🩷" "#ff69b4" "19" "#fff0f7" "#ffe0f0"
create_blog_page "aki" "燈真あき" "🧡" "#ff8c00" "20" "#fff5e6" "#ffe0cc"
create_blog_page "mirei" "城崎みれい" "💛" "#ffd700" "21" "#fffef0" "#fff9e0"
create_blog_page "iroha" "桧翠いろは" "💚" "#00ced1" "22" "#f0ffff" "#e0f7f7"
create_blog_page "ran" "星名らん" "💙" "#4169e1" "23" "#f0f5ff" "#e0e8ff"
create_blog_page "nagisa" "詩藤なぎさ" "💜" "#9370db" "24" "#f5f0ff" "#e8e0ff"

echo "Blog pages created!"