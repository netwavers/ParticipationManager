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

本アプリはPython製のバックエンド (`pytchat_server.exe`) を同梱する必要があります。ビルド前に以下の手順でPython環境の準備とexe化を行ってください。

1. **Python環境の準備**  
   `..\YouTubeCommentViewer\.venv` (または任意のPython環境) に `pyinstaller` と `pytchat` がインストールされていることを確認してください。

   ```bash
   .venv\Scripts\pip install pyinstaller pytchat
   ```

2. **Pythonサーバーのexe化**  
   PyInstallerを使って `pytchat_server.py` をexe化します。

   ```bash
   .venv\Scripts\pyinstaller --onefile --distpath dist-py --name pytchat_server pytchat_server.py
   ```
   ※ これにより `dist-py/pytchat_server.exe` が生成されます。`package.json` の設定により、このファイルがインストーラーに含まれます。

3. **Electronアプリのビルド**
   以下のコマンドを実行すると `dist` フォルダにインストーラー (`.exe`) が生成されます。
   ユーザープロファイルパスに日本語が含まれている場合や、権限の問題を回避するために、作成済みのヘルパースクリプトを使用することを推奨します。

   ```powershell
   .\build_installer.ps1
   ```

   ヘルパースクリプトを使用しない場合（標準コマンド）:
   ```bash
   npm run dist -- --win
   ```

   > [!NOTE]
   > `build_installer.ps1` は、キャッシュディレクトリを `C:\eb_temp` に設定し、署名検証を無効化することで、日本語パス環境でのビルドエラーを回避します。

### macOS用 (.dmg / .app)

以下のコマンドを実行すると `dist` フォルダにディスクイメージ (`.dmg`) が生成されます。

```bash
# Mac用のPyInstallerビルドコマンド（参考）
# python3 -m PyInstaller --onefile --distpath dist-py --name pytchat_server pytchat_server.py
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
