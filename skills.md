# UnRe:al プロジェクト 実装仕様書

## 🎮 実装済み機能

### 1. 初回アクセス制御
- **実装場所**: index.html (99-104行)
- **動作**: localStorage `hasVisitedDM`をチェック
- **未訪問時**: `hidden/dm-log.html`へ自動リダイレクト
- **2回目以降**: 通常のトップページ表示

### 2. DM会話システム 
- **実装場所**: hidden/dm-log.html
- **背景色**: 白 (#ffffff)
- **メッセージ色**: 
  - プレイヤー: 紫 (#7C3AED)
  - NPC: グレー (#6B7280)
- **名前入力**: 「りん」でのみ進行
- **保存データ**: 
  - `hasVisitedDM`: 訪問フラグ
  - `playerName`: 入力名

### 3. 検索システム
- **実装場所**: index.html (124-227行)
- **特殊コマンド**:
  - `CC` or `cc`: localStorage全削除
- **ページ番号検索**: 0-49で各ページへ直接移動
- **キーワード検索**: 約30種類のキーワードマッピング
- **404処理**: 該当なし時は `hidden/notfound.html`へ

### 4. FCログインシステム
- **実装場所**: pages/fc.html
- **実装済みログイン情報**:
  ```javascript
  { id: 'user1', pass: 'pass1' }
  { id: 'user2', pass: 'pass2' }  
  { id: 'fortune_ngs', pass: 'fortune' }
  { id: 'nagisa', pass: 'Mystic' }
  ```
- **ログイン後の動作**:
  - `fcLoggedIn`: true設定
  - CONTACTボタン表示
  - blog.htmlへリダイレクト
- **FC限定コンテンツ**: blog_ex/配下のページ

### 5. 訪問済みページ管理
- **実装場所**: pages/log_list.html
- **保存データ**: `visitedPages`配列
- **表示内容**:
  - 50ページグリッド表示
  - 訪問済みは緑色でハイライト
  - 進捗率表示 (0-100%)
- **ページ情報**: pageInfo配列で各ページ名定義

### 6. エンディング分岐
- **実装場所**: hidden/found_me.html (ページ46)
- **分岐条件**:
  - 「正解キーワード1」→ ending_seven.html
  - 「正解キーワード2」→ log_49.html → ending_eight.html
  - その他 → ending_bad.html

### 7. パスコードシステム
- **ページ29**: passcode/r.html
  - パスワード: `Signal`
  - クリア後: `passwordCleared29`フラグ保存
- **ページ31**: passcode/m.html  
  - パスワード: `20060719`
  - 成功時: blog_ex/mirei/draft.htmlへ

### 8. ヒントシステム
- **実装場所**: hidden/hint.html
- **アクセス方法**: `@fortune_ngs` または `fortune_ngs`検索
- **表示内容**: 現在のページ番号と進捗状況

### 9. レスポンシブデザイン
- **実装場所**: styles.css
- **ブレークポイント**: 768px
- **モバイル対応**:
  - ハンバーガーメニュー
  - 画像スライドショー (3秒間隔)
  - タッチ操作最適化

### 10. 画像管理
- **メンバー画像**: images/members/配下
- **ヒーロー画像**: 
  - デスクトップ: hero-image_web.png
  - モバイル: hero-image_mobile1/2.png
- **表示設定**: object-fit: contain (画像全体表示)

---

## 📄 ページ構成（実装済み50ページ）

### 公開ページ (1-8)
- TOP, NEWS, PROFILE, DISCOGRAPHY, BLOG, GALLERY, ABOUT, FC

### メッセージ・履歴書 (9-10)
- message_log.html, haitani_resume.html

### 医療記録 (11-12, 17, 27, 38-39, 42, 44)
- 各メンバーのカルテ（簡易版実装）

### 機密文書 (13-16, 25-26, 37, 40-41, 43, 45, 47-49)
- 契約書、リーク記事、実験資料等（簡易版実装）

### ブログ (18-24)
- 各メンバーの個人ブログ（3記事ずつ、うち1つはFC限定）

### FC限定 (30-36)
- FCログイン後のみアクセス可能なブログ記事

### パスコード (29, 31)
- キーワード入力で次ページへ

### エンディング (46→分岐)
- 3種類のエンディングページ

---

## ❌ 未実装機能（CSVには記載あるが未実装）

1. **ページ遷移の詳細リンク**
   - NEWS→カルテへの直接リンクなし
   - DISCOGRAPHY→Signalへのリンクなし
   - 各ページ内の「配置されたワード」からの遷移未実装

2. **カルテ一覧ページ**
   - シムネルカンパニーで表示される統合ページなし

3. **正式なキーワード**
   - エンディング分岐の正解キーワード未設定
   - FCログインの正式なID/Pass未確定

4. **詳細コンテンツ**
   - 各ページは簡易版（プレースホルダー）
   - ストーリーの詳細テキスト未実装

---

## 🔧 localStorage使用状況

```javascript
// 実装済みのlocalStorageキー
hasVisitedDM     // 初回訪問フラグ
playerName       // プレイヤー名
fcLoggedIn       // FCログイン状態  
fcUserId         // FCユーザーID
visitedPages     // 訪問済みページ配列 
currentLogPage   // 現在のページ番号
passwordCleared29 // パスコード29クリア
```

---

## 📝 メンバー情報（実装済み）

### 実装済みデータ
- 7人のメンバー名とカラー
- 各メンバーの画像ファイル配置済み
- 簡易的なプロフィールページ

### 未実装データ
- 詳細なプロフィール情報
- ソロ曲の音源
- ギャラリー画像
- メンバーの詳細設定テキスト