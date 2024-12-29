## Readme

EFINIX社のFPGA、TrionシリーズのT8評価ボード"Xyloni"用のデザインサンプルになります。

Sapphire-SoCと呼ばれるRISC-VコアをFPGAで構築し、評価ボード上のLEDをRISC-Vの

ソフトウェアで光らせるだけのものです。EFINIX社の開発環境"Efinity"のチュートリアルの  
一つとして、RISC-Vコアの扱い方やPLLの扱い方を学習する目的で作られています。

  

設計ツールの操作に関してはコアスタッフ社（オンライン半導体商社）のWeb上にドキュメントを  
置いています。これに従って入力すれば、ここに置かれたのと同じデザインが作成できる  
はずです：

  

ドキュメントでは開発ツールEfinityのバージョン2023.2を使用していますが、GitHubに

置かれたデザインファイルはバージョン2024.2で作られています。  
  
GitHub上に置かれたファイルは：  

- sapphire\_lite.xml （projectファイル）
- sapphire\_lite.peri.xml （I/O・ペリフェラル定義ファイル）
- sapphire\_lite.sdc （SDC・タイミング制約ファイル）
- TOP.v （トップ・デザインファイル）
- Xyloni\_Test1.c （RISC-Vソースコード）
- sapphire\_lite.zip （デザイン用ディレクトリ全部のZipファイル）

.....となっています。  
  
EFINIX Xyloni評価ボード  
![](Files/xyloni-board-top.jpg)

  

2024/12/29 A.Shiraishi