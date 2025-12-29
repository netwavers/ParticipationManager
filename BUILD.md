# Participation Manager Desktop App Build Instructions

## 前提条件 (Prerequisites)

- Node.js (v14以上推奨) がインストールされていること。

## セットアップ (Setup)

プロジェクトのルートディレクトリで以下のコマンドを実行し、依存パッケージをインストールします。

```bash
npm install
```

## 開発実行 (Development)

アプリをローカルで起動して動作確認します。

```bash
npm start
``` 

## ビルド (Build)

### Windows用 (.exe)

以下のコマンドを実行すると `dist` フォルダにインストーラー (`.exe`) が生成されます。

```bash
npm run dist -- --win
```

### macOS用 (.dmg / .app)

以下のコマンドを実行すると `dist` フォルダにディスクイメージ (`.dmg`) が生成されます。

```bash
npm run dist -- --mac
```

※ macOS用のビルドは、原則としてmacOS上で行う必要があります。Windows上で行う場合、署名などの制限により正しく動作しない可能性があります。

## 設定 (Configuration)

`package.json` の `build` セクションで、アプリケーション名やアイコンなどを変更できます。

```json
"build": {
  "appId": "com.participation.manager",
  "productName": "Participation Manager",
  ...
}
```

- アイコンを変更する場合は、`icon.ico` (Windows用) や `icon.icns` (Mac用) をプロジェクトルートに配置してください。
