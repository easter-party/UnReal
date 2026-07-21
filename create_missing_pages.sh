#!/bin/bash

# 契約書ページ (13)
cat > "c_doc/agreement_ichinose.html" << 'HTML'
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>契約書 - UnReal</title>
    <style>
        body {
            background: #f5f5dc;
            font-family: serif;
            padding: 40px 20px;
            line-height: 1.8;
        }
        .page-number { position: fixed; top: 20px; right: 20px; opacity: 0.5; }
        .container { max-width: 800px; margin: 0 auto; background: white; padding: 40px; box-shadow: 0 0 20px rgba(0,0,0,0.1); }
        h1 { text-align: center; border-bottom: 3px double #000; padding-bottom: 20px; }
        .stamp { float: right; width: 100px; height: 100px; border: 2px solid red; border-radius: 50%; text-align: center; line-height: 100px; color: red; font-weight: bold; }
    </style>
</head>
<body>
    <div class="page-number">13/50</div>
    <div class="container">
        <div class="stamp">契約済</div>
        <h1>業務委託契約書</h1>
        <p>Easter Production（以下「甲」）と一ノ瀬家（以下「乙」）は、以下の通り契約を締結する。</p>
        <h2>第1条（目的）</h2>
        <p>本契約は、甲と乙との間における特別な業務提携に関する...</p>
        <p style="background: #000; color: #000;">████████████████████</p>
    </div>
</body>
</html>
HTML

# 鑑定結果 (14)
cat > "c_doc/report_r2.html" << 'HTML'
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DNA鑑定結果 - UnReal</title>
    <style>
        body {
            background: #e8f4f8;
            font-family: 'Courier New', monospace;
            padding: 40px 20px;
        }
        .page-number { position: fixed; top: 20px; right: 20px; opacity: 0.5; }
        .container { max-width: 800px; margin: 0 auto; background: white; padding: 30px; }
        table { width: 100%; border-collapse: collapse; margin: 20px 0; }
        th, td { border: 1px solid #ddd; padding: 10px; }
        .match { color: green; font-weight: bold; }
    </style>
</head>
<body>
    <div class="page-number">14/50</div>
    <div class="container">
        <h1>DNA鑑定結果報告書</h1>
        <p>検体ID: R1, R2</p>
        <table>
            <tr><th>項目</th><th>結果</th></tr>
            <tr><td>一致率</td><td class="match">99.9%</td></tr>
            <tr><td>関係性</td><td>一卵性双生児</td></tr>
        </table>
    </div>
</body>
</html>
HTML

# ゆののカルテ (11)
cat > "medical_record/yuno.html" << 'HTML'
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>百瀬ゆの - カルテ</title>
    <style>
        body { background: #fff0f7; font-family: serif; padding: 40px 20px; }
        .page-number { position: fixed; top: 20px; right: 20px; opacity: 0.5; }
        .medical-record { max-width: 700px; margin: 0 auto; background: white; padding: 30px; border: 2px solid #ff69b4; }
        .photo { width: 100px; height: 100px; background: #ff69b4; float: right; }
    </style>
</head>
<body>
    <div class="page-number">11/50</div>
    <div class="medical-record">
        <div class="photo"></div>
        <h1>診療記録</h1>
        <p>氏名: 百瀬ゆの</p>
        <p>ID: Y-002</p>
        <p>特記事項: 一ノ瀬関連</p>
    </div>
</body>
</html>
HTML

# らんのカルテ (12)
cat > "medical_record/ran.html" << 'HTML'
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>星名らん - カルテ</title>
    <style>
        body { background: #f0f5ff; font-family: serif; padding: 40px 20px; }
        .page-number { position: fixed; top: 20px; right: 20px; opacity: 0.5; }
        .medical-record { max-width: 700px; margin: 0 auto; background: white; padding: 30px; border: 2px solid #4169e1; }
    </style>
</head>
<body>
    <div class="page-number">12/50</div>
    <div class="medical-record">
        <h1>診療記録</h1>
        <p>氏名: 星名らん</p>
        <p>ID: R-002</p>
        <p>備考: reportR2参照</p>
    </div>
</body>
</html>
HTML

# みれいのカルテ (17)
cat > "medical_record/mirei.html" << 'HTML'
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>城崎みれい - カルテ</title>
    <style>
        body { background: #fffef0; font-family: serif; padding: 40px 20px; }
        .page-number { position: fixed; top: 20px; right: 20px; opacity: 0.5; }
        .medical-record { max-width: 700px; margin: 0 auto; background: white; padding: 30px; border: 2px solid #ffd700; }
    </style>
</head>
<body>
    <div class="page-number">17/50</div>
    <div class="medical-record">
        <h1>診療記録</h1>
        <p>氏名: 城崎みれい</p>
        <p>ID: M-003</p>
        <p>備考: 金城未怜</p>
    </div>
</body>
</html>
HTML

# いろはのカルテ (27)
cat > "medical_record/iroha.html" << 'HTML'
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>桧翠いろは - カルテ</title>
    <style>
        body { background: #f0ffff; font-family: serif; padding: 40px 20px; }
        .page-number { position: fixed; top: 20px; right: 20px; opacity: 0.5; }
        .medical-record { max-width: 700px; margin: 0 auto; background: white; padding: 30px; border: 2px solid #00ced1; }
    </style>
</head>
<body>
    <div class="page-number">27/50</div>
    <div class="medical-record">
        <h1>診療記録</h1>
        <p>氏名: 桧翠いろは</p>
        <p>ID: I-004</p>
        <p>特記: 翠彩葉 / 最終試験</p>
    </div>
</body>
</html>
HTML

# あきのカルテ (38)
cat > "medical_record/aki.html" << 'HTML'
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>燈真あき - カルテ</title>
    <style>
        body { background: #fff5e6; font-family: serif; padding: 40px 20px; }
        .page-number { position: fixed; top: 20px; right: 20px; opacity: 0.5; }
        .medical-record { max-width: 700px; margin: 0 auto; background: white; padding: 30px; border: 2px solid #ff8c00; }
    </style>
</head>
<body>
    <div class="page-number">38/50</div>
    <div class="medical-record">
        <h1>診療記録</h1>
        <p>氏名: 燈真あき</p>
        <p>ID: A-005</p>
        <p>新生総合病院</p>
    </div>
</body>
</html>
HTML

# なぎさのカルテ (39)
cat > "medical_record/nagisa.html" << 'HTML'
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>詩藤なぎさ - カルテ</title>
    <style>
        body { background: #f5f0ff; font-family: serif; padding: 40px 20px; }
        .page-number { position: fixed; top: 20px; right: 20px; opacity: 0.5; }
        .medical-record { max-width: 700px; margin: 0 auto; background: white; padding: 30px; border: 2px solid #9370db; }
    </style>
</head>
<body>
    <div class="page-number">39/50</div>
    <div class="medical-record">
        <h1>診療記録</h1>
        <p>氏名: 詩藤なぎさ</p>
        <p>本名: 藤野凪紗</p>
        <p>ID: N-006</p>
    </div>
</body>
</html>
HTML

# ふうかのカルテ (44)
cat > "medical_record/fuka.html" << 'HTML'
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>風香 - カルテ</title>
    <style>
        body { background: #000; color: #fff; font-family: serif; padding: 40px 20px; }
        .page-number { position: fixed; top: 20px; right: 20px; opacity: 0.5; }
        .medical-record { max-width: 700px; margin: 0 auto; background: #111; padding: 30px; border: 2px solid #fff; }
    </style>
</head>
<body>
    <div class="page-number">44/50</div>
    <div class="medical-record">
        <h1>診療記録 - 機密</h1>
        <p>氏名: 風香</p>
        <p>ID: F-008</p>
        <p>状態: [削除済]</p>
    </div>
</body>
</html>
HTML

echo "Medical records created"
