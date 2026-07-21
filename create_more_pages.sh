#!/bin/bash

# クローン取引証明書 (25)
cat > "pages/clonedeal.html" << 'HTML'
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>クローン取引証明書 - UnReal</title>
    <style>
        body { background: #2a2a2a; color: #0f0; font-family: monospace; padding: 40px 20px; }
        .page-number { position: fixed; top: 20px; right: 20px; }
        .container { max-width: 800px; margin: 0 auto; }
        .redacted { background: #000; color: #000; }
    </style>
</head>
<body>
    <div class="page-number">25/50</div>
    <div class="container">
        <h1>[機密] クローン取引証明書</h1>
        <p>取引ID: n005</p>
        <p>黒澤宏一 承認</p>
        <p class="redacted">████████████</p>
    </div>
</body>
</html>
HTML

# クローン資料 (26)
cat > "pages/clone_n005.html" << 'HTML'
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>クローン資料 N005 - UnReal</title>
    <style>
        body { background: #001100; color: #00ff00; font-family: monospace; padding: 40px 20px; }
        .page-number { position: fixed; top: 20px; right: 20px; }
        .container { max-width: 800px; margin: 0 auto; }
    </style>
</head>
<body>
    <div class="page-number">26/50</div>
    <div class="container">
        <h1>実験体N005</h1>
        <p>コードネーム: 翠彩葉</p>
        <p>ベース: 桧翠いろは</p>
        <p>状態: 実験継続中</p>
    </div>
</body>
</html>
HTML

# 最終試験結果 (28)
cat > "pages/test_report_iroha.html" << 'HTML'
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>翠彩葉 最終試験結果 - UnReal</title>
    <style>
        body { background: #f0f0f0; font-family: serif; padding: 40px 20px; }
        .page-number { position: fixed; top: 20px; right: 20px; }
        .container { max-width: 800px; margin: 0 auto; background: white; padding: 30px; }
        .pass { color: green; font-weight: bold; }
    </style>
</head>
<body>
    <div class="page-number">28/50</div>
    <div class="container">
        <h1>最終試験結果</h1>
        <p>受験者: 翠彩葉（桧翠いろは）</p>
        <p>結果: <span class="pass">合格</span></p>
        <p>デビュー許可</p>
    </div>
</body>
</html>
HTML

# あきニュース記事 (37)
cat > "c_doc/aki.html" << 'HTML'
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ニュース記事 - UnReal</title>
    <style>
        body { background: #fff; font-family: serif; padding: 40px 20px; }
        .page-number { position: fixed; top: 20px; right: 20px; }
        .container { max-width: 800px; margin: 0 auto; }
        .headline { font-size: 24px; font-weight: bold; margin-bottom: 20px; }
    </style>
</head>
<body>
    <div class="page-number">37/50</div>
    <div class="container">
        <div class="headline">アイドル燈真あき、練習中の事故で入院</div>
        <p>三月の秘密...</p>
        <p>新生総合病院にて治療中</p>
    </div>
</body>
</html>
HTML

# 脳機能実験資料 (40)
cat > "c_doc/experiment.html" << 'HTML'
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>脳機能解放実験 - UnReal</title>
    <style>
        body { background: #000033; color: #00ffff; font-family: monospace; padding: 40px 20px; }
        .page-number { position: fixed; top: 20px; right: 20px; }
        .container { max-width: 800px; margin: 0 auto; }
        .warning { color: red; animation: blink 1s infinite; }
        @keyframes blink { 50% { opacity: 0; } }
    </style>
</head>
<body>
    <div class="page-number">40/50</div>
    <div class="container">
        <h1 class="warning">【極秘】脳機能解放実験</h1>
        <p>被験者: 藤野凪紗</p>
        <p>実験コード: MYSTIC</p>
        <p>結果: 成功</p>
    </div>
</body>
</html>
HTML

# みれいドラフトブログ (41)
mkdir -p blog_ex/mirei
cat > "blog_ex/mirei/draft.html" << 'HTML'
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>りんちゃんのこと - 下書き</title>
    <style>
        body { background: #fffacd; font-family: serif; padding: 40px 20px; }
        .page-number { position: fixed; top: 20px; right: 20px; }
        .container { max-width: 700px; margin: 0 auto; }
        .draft { background: white; padding: 30px; border-left: 5px solid #ffd700; }
        .keyword { color: red; font-weight: bold; }
    </style>
</head>
<body>
    <div class="page-number">41/50</div>
    <div class="container">
        <div class="draft">
            <h1>りんちゃんのこと（非公開）</h1>
            <p>日付: 20060719</p>
            <p>りんちゃんは本当は...</p>
            <p class="keyword">風香</p>
        </div>
    </div>
</body>
</html>
HTML

# RN016完成報告書 (43)
cat > "c_doc/rn016.html" << 'HTML'
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RN016型完成報告書 - UnReal</title>
    <style>
        body { background: #000; color: #ff0000; font-family: monospace; padding: 40px 20px; }
        .page-number { position: fixed; top: 20px; right: 20px; }
        .container { max-width: 800px; margin: 0 auto; }
        .classified { background: red; color: white; padding: 5px; }
    </style>
</head>
<body>
    <div class="page-number">43/50</div>
    <div class="container">
        <h1 class="classified">【最高機密】RN016型完成報告書</h1>
        <p>開発者: 明石凛 & 椎名蘭</p>
        <p>対象: 暁月りん</p>
        <p>コード: U81220401</p>
    </div>
</body>
</html>
HTML

# 研究施設概要 (45)
cat > "pages/map_laboratory.html" << 'HTML'
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>研究施設概要 - UnReal</title>
    <style>
        body { background: #001122; color: #00ff00; font-family: monospace; padding: 40px 20px; }
        .page-number { position: fixed; top: 20px; right: 20px; }
        .container { max-width: 800px; margin: 0 auto; }
        .map { border: 2px solid #00ff00; padding: 20px; margin: 20px 0; }
    </style>
</head>
<body>
    <div class="page-number">45/50</div>
    <div class="container">
        <h1>地下研究施設マップ</h1>
        <div class="map">
            <p>B1F: 管理室</p>
            <p>B2F: 実験室A-E</p>
            <p>B3F: 保管庫</p>
            <p>B4F: [アクセス制限]</p>
        </div>
    </div>
</body>
</html>
HTML

# りんとなぎさの会話ログ (47)
mkdir -p pages/r_n
cat > "pages/r_n/log.html" << 'HTML'
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>会話ログ - UnReal</title>
    <style>
        body { background: #1a1a2e; color: #eee; font-family: monospace; padding: 40px 20px; }
        .page-number { position: fixed; top: 20px; right: 20px; }
        .container { max-width: 700px; margin: 0 auto; }
        .message { margin: 20px 0; padding: 15px; background: rgba(255,255,255,0.1); border-radius: 10px; }
        .rin { border-left: 3px solid #ff0000; }
        .nagisa { border-left: 3px solid #9370db; }
    </style>
</head>
<body>
    <div class="page-number">47/50</div>
    <div class="container">
        <h1>会話ログ - R&N</h1>
        <div class="message rin">りん: 本当のこと、話さなきゃ...</div>
        <div class="message nagisa">なぎさ: 大丈夫、私も知ってるから</div>
    </div>
</body>
</html>
HTML

# 新型クローン開発報告書 (48)
cat > "c_doc/fuka_report.html" << 'HTML'
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>新型クローン開発報告書 - UnReal</title>
    <style>
        body { background: #000; color: #fff; font-family: monospace; padding: 40px 20px; }
        .page-number { position: fixed; top: 20px; right: 20px; }
        .container { max-width: 800px; margin: 0 auto; }
        .title { color: #ff00ff; }
    </style>
</head>
<body>
    <div class="page-number">48/50</div>
    <div class="container">
        <h1 class="title">新型クローン開発報告書</h1>
        <p>開発者: 明石凛 & 椎名蘭</p>
        <p>プロジェクト: FUKA</p>
        <p>最終段階到達</p>
    </div>
</body>
</html>
HTML

# 調査ログex (49) - 最終ページ
cat > "pages/log_49.html" << 'HTML'
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>調査ログ Ex - UnReal</title>
    <style>
        body { background: linear-gradient(135deg, #667eea, #764ba2); color: #fff; font-family: Arial, sans-serif; padding: 40px 20px; min-height: 100vh; }
        .page-number { position: fixed; top: 20px; right: 20px; }
        .container { max-width: 800px; margin: 0 auto; text-align: center; }
        h1 { font-size: 48px; margin-bottom: 30px; }
        .truth { background: rgba(255,255,255,0.2); padding: 30px; border-radius: 20px; margin: 30px 0; }
        .members { font-size: 48px; margin: 30px 0; }
        .continue-btn { padding: 15px 40px; background: #fff; color: #667eea; border: none; border-radius: 30px; font-size: 18px; cursor: pointer; margin-top: 30px; }
    </style>
</head>
<body>
    <div class="page-number">49/50</div>
    <div class="container">
        <h1>真実の調査ログ</h1>
        <div class="truth">
            <p>全ての真実が明らかになりました。</p>
            <p>8人目のメンバーの存在...</p>
            <p>風香、そしてりんの本当の姿。</p>
        </div>
        <div class="members">❤️🩷🧡💛💚💙💜🤍</div>
        <button class="continue-btn" onclick="window.location.href='../hidden/ending_eight.html'">TRUE ENDINGへ</button>
    </div>
</body>
</html>
HTML

echo "All additional pages created!"
