# PDF単一フィールド自動更新プロジェクト

## 概要
このプロジェクトはGnosticeライブラリを用いてPDFの特定のフィールド（`r5bun_01_input_manual.pdf`内）を自動的に更新するデモです。

## 前提条件
- Gnostice PDFtoolkitが必要です。
- Windows環境で動作確認済み。

### Gnostice PDFtoolkitのインストール
- 試用版は[こちら](https://www.gnostice.com/PDFtoolkit_VCL.asp?show=downloads)からダウンロード。
- "Select a file"で「PDFtoolkit VCL Trial」を選択。

### ライブラリドキュメント
- [公式ドキュメント](https://www.gnostice.com/docs/pdftoolkit_vcl/frames.html)

## 使用方法
1. Gnosticeをインストール。
2. プロジェクトを実行。
3. 「自動更新」ボタンをクリック。
4. 処理完了後、修正されたPDFが自動で開きます。

## ソースコードの主な機能
- `TgtPDFDocument`クラスでPDFを読み込む。
- `GetFormField`メソッドで特定のフィールドを取得。
- フィールドの値を「test」で更新。
- 更新されたPDFを保存。

## 注意点
- このプロジェクトはデモです。
- 最終製品では各フィールドに対応する具体的な値を設定する必要があります。
