#!/bin/bash

# エンディングページ作成
cat > "hidden/ending_bad.html" << 'EOF'
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bad End - UnReal</title>
    <style>
        body {
            background: #000;
            color: #ff0000;
            font-family: 'Courier New', monospace;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            text-align: center;
        }
        .ending-content {
            max-width: 600px;
            padding: 40px;
        }
        h1 {
            font-size: 48px;
            margin-bottom: 30px;
            animation: glitch 2s infinite;
        }
        @keyframes glitch {
            0%, 100% { text-shadow: 2px 0 #ff0000, -2px 0 #00ffff; }
            50% { text-shadow: -2px 0 #ff0000, 2px 0 #00ffff; }
        }
        .message {
            font-size: 18px;
            line-height: 1.8;
            margin-bottom: 30px;
        }
        .restart-btn {
            padding: 15px 30px;
            background: #ff0000;
            color: #000;
            border: none;
            cursor: pointer;
            font-size: 16px;
            transition: all 0.3s;
        }
        .restart-btn:hover {
            background: #000;
            color: #ff0000;
            border: 2px solid #ff0000;
        }
    </style>
</head>
<body>
    <div class="ending-content">
        <h1>BAD END</h1>
        <div class="message">
            <p>調査は失敗に終わった。</p>
            <p>真実は闇に葬られ、</p>
            <p>りんは帰ってこなかった...</p>
            <br>
            <p>事務所の秘密は永遠に守られることになる。</p>
        </div>
        <button class="restart-btn" onclick="restart()">最初からやり直す</button>
    </div>
    <script>
        function restart() {
            localStorage.clear();
            window.location.href = '../index.html';
        }
    </script>
</body>
</html>
EOF

cat > "hidden/ending_seven.html" << 'EOF'
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>True End? - UnReal</title>
    <style>
        body {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: #fff;
            font-family: Arial, sans-serif;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            text-align: center;
        }
        .ending-content {
            max-width: 700px;
            padding: 40px;
            background: rgba(255,255,255,0.1);
            border-radius: 20px;
        }
        h1 {
            font-size: 48px;
            margin-bottom: 30px;
        }
        .message {
            font-size: 18px;
            line-height: 1.8;
            margin-bottom: 30px;
        }
        .members {
            display: flex;
            justify-content: center;
            gap: 10px;
            font-size: 36px;
            margin: 30px 0;
        }
    </style>
</head>
<body>
    <div class="ending-content">
        <h1>ENDING - 7 Members</h1>
        <div class="members">
            ❤️🩷🧡💛💚💙💜
        </div>
        <div class="message">
            <p>真実が明らかになった。</p>
            <p>事務所の陰謀は暴かれ、</p>
            <p>7人のメンバーは自由を手に入れた。</p>
            <br>
            <p>新しい未来へ向かって、</p>
            <p>UnRe:alは再始動する。</p>
            <br>
            <p style="opacity: 0.7;">でも、何か忘れていない...？</p>
        </div>
    </div>
</body>
</html>
EOF

cat > "hidden/ending_eight.html" << 'EOF'
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>True End - UnReal</title>
    <style>
        body {
            background: linear-gradient(135deg, #ffd700, #ff6b6b);
            color: #fff;
            font-family: Arial, sans-serif;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            text-align: center;
        }
        .ending-content {
            max-width: 700px;
            padding: 40px;
            background: rgba(255,255,255,0.2);
            border-radius: 20px;
        }
        h1 {
            font-size: 48px;
            margin-bottom: 30px;
            animation: shine 3s infinite;
        }
        @keyframes shine {
            0%, 100% { opacity: 1; }
            50% { opacity: 0.7; }
        }
        .message {
            font-size: 18px;
            line-height: 1.8;
            margin-bottom: 30px;
        }
        .members {
            display: flex;
            justify-content: center;
            gap: 10px;
            font-size: 36px;
            margin: 30px 0;
        }
        .secret-member {
            animation: fadeIn 2s ease;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: scale(0); }
            to { opacity: 1; transform: scale(1); }
        }
    </style>
</head>
<body>
    <div class="ending-content">
        <h1>TRUE ENDING - 8 Members</h1>
        <div class="members">
            ❤️🩷🧡💛💚💙💜<span class="secret-member">🤍</span>
        </div>
        <div class="message">
            <p>全ての真実が明らかになった。</p>
            <p>隠されていた8人目のメンバー...</p>
            <p>りんの双子の姉妹、そして新たな仲間。</p>
            <br>
            <p>事務所は解体され、犯人は逮捕された。</p>
            <p>8人で新しい事務所を立ち上げ、</p>
            <p>本当の「UnRe:al」が始まる。</p>
            <br>
            <p style="font-size: 24px;">🎊 Congratulations! 🎊</p>
        </div>
    </div>
</body>
</html>
EOF

# FC限定記事作成
for member in rin yuno aki mirei iroha ran nagisa; do
cat > "blog_ex/${member}.html" << EOF
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FC限定 - ${member} - UnReal</title>
    <style>
        body {
            background: linear-gradient(135deg, #2a2a2a, #1a1a1a);
            color: #fff;
            font-family: Arial, sans-serif;
            padding: 40px 20px;
            min-height: 100vh;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
        }
        .fc-badge {
            display: inline-block;
            background: gold;
            color: #000;
            padding: 5px 15px;
            border-radius: 20px;
            font-weight: bold;
            margin-bottom: 20px;
        }
        h1 {
            margin-bottom: 30px;
        }
        .content {
            background: rgba(255,255,255,0.1);
            padding: 30px;
            border-radius: 10px;
            line-height: 1.8;
        }
        .secret-hint {
            background: rgba(255,0,0,0.2);
            padding: 20px;
            border-left: 4px solid #ff0000;
            margin-top: 30px;
        }
        a {
            color: gold;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <span class="fc-badge">FC会員限定</span>
        <h1>${member}の秘密</h1>
        <div class="content">
            <p>FC会員の皆様へ</p>
            <p>いつも応援ありがとうございます。</p>
            <p>この記事は特別な内容を含んでいます。</p>
            
            <div class="secret-hint">
                <p><strong>重要な手がかり：</strong></p>
                <p>事務所には隠された秘密があります。</p>
                <p>メンバーそれぞれのカルテを見つけてください。</p>
                <p>キーワード: <strong>下書き</strong></p>
            </div>
        </div>
        <p style="margin-top: 30px;">
            <a href="../pages/blog.html">← ブログ一覧に戻る</a>
        </p>
    </div>
    <script>
        // FC未ログインなら追い出す
        if (localStorage.getItem('fcLoggedIn') !== 'true') {
            alert('FC会員限定コンテンツです');
            window.location.href = '../pages/fc.html';
        }
    </script>
</body>
</html>
EOF
done

# 秘密文書作成
cat > "c_doc/like.html" << 'EOF'
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>週刊ライク - リーク記事</title>
    <style>
        body {
            background: #000;
            color: #0f0;
            font-family: 'Courier New', monospace;
            padding: 20px;
            line-height: 1.6;
        }
        .page-number {
            position: fixed;
            top: 20px;
            right: 20px;
            opacity: 0.7;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
        }
        h1 {
            color: #0f0;
            text-transform: uppercase;
            margin-bottom: 30px;
        }
        .classified {
            color: #f00;
            font-weight: bold;
        }
        .redacted {
            background: #0f0;
            color: #0f0;
        }
        .content {
            background: rgba(0,255,0,0.05);
            padding: 20px;
            border: 1px solid #0f0;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="page-number">15/50</div>
    <div class="container">
        <h1>【機密】週刊ライク - リーク記事</h1>
        <div class="content">
            <p class="classified">【極秘情報】</p>
            <p>Easter Productionとエッグスアカデミーの関係について</p>
            <p>両社は表向きは別会社だが、実は<span class="redacted">████████</span>によって繋がっている。</p>
            <p>エッグスアカデミーは<strong>実験体の選定機関</strong>として機能しており...</p>
            <br>
            <p>キーワード: <strong>エッグスアカデミー</strong></p>
        </div>
    </div>
</body>
</html>
EOF

echo "All remaining pages created!"