#!/bin/bash

# 簡易ページテンプレート作成関数
create_simple_page() {
    local file_path=$1
    local page_no=$2
    local title=$3
    local content=$4
    
    cat > "$file_path" << EOF
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>$title - UnReal</title>
    <style>
        body {
            background: #1a1a1a;
            color: #fff;
            font-family: Arial, sans-serif;
            padding: 40px;
            min-height: 100vh;
        }
        .page-number {
            position: fixed;
            top: 20px;
            right: 20px;
            color: #666;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
        }
        h1 {
            color: #667eea;
            margin-bottom: 30px;
        }
        .content {
            background: rgba(255,255,255,0.1);
            padding: 30px;
            border-radius: 10px;
        }
        a {
            color: #667eea;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="page-number">$page_no/50</div>
    <div class="container">
        <h1>$title</h1>
        <div class="content">
            <p>$content</p>
            <p style="margin-top: 30px;">
                <a href="../index.html">← TOPに戻る</a>
            </p>
        </div>
    </div>
</body>
</html>
EOF
}

# ページ作成
create_simple_page "pages/top.html" "1" "TOP" "UnRe:al オフィシャルサイト（仮）"
create_simple_page "pages/discography.html" "4" "DISCOGRAPHY" "ディスコグラフィーページ（仮）"
create_simple_page "pages/blog.html" "5" "BLOG" "ブログ選択ページ（仮）"
create_simple_page "pages/gallery.html" "6" "GALLERY" "ギャラリーページ（仮）"
create_simple_page "pages/about.html" "7" "ABOUT" "会社概要（仮）"
create_simple_page "pages/fc.html" "8" "FC LOGIN" "ファンクラブログイン（仮）"
create_simple_page "pages/message_log.html" "9" "メッセージログ" "失踪に関するメッセージ（仮）"
create_simple_page "pages/haitani_resume.html" "10" "灰谷の履歴書" "マネージャー灰谷の情報（仮）"

echo "Pages created successfully!"