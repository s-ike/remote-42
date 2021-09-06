# remote-42

## 機能

dockerコンテナで（Linuxで）C言語のプログラムをコンパイルし実行できます。

vim、42headerプラグイン、norminette、valgrindなども入っています。

## 使い方

**1. envファイルの用意**

:.envファイルが必要です。
以下の書式で書いてください。

IP_ADRESSはXQuartzを使用する場合必要です。
```
USER=sikeda
MAIL=sikeda@student.42tokyo.jp
IP_ADDRESS=221.241.100.100
YOUR_LOCAL_PROJECT_PATH=~/Documents/42tokyo/cursus/fract-ol/
```

**2. docker image作成**

`make iamge`

**3. docker 起動**

`make run`

**4. あなたのプロジェクトディレクトリに移動しコンパイル**

3を実行するとコンテナの/workというディレクトリにいます。lsするとあなたのプロジェクトディレクトリが確認できるはずです。cdしてコンパイルしてから実行してください。

注意：
macでコンパイルしたバイナリは実行できません。コンテナ内でコンパイルし直してください。


### ウインドウを出したいときは
cub3D, fract-ol...などを実行したいときはあなたのMacに[XQuartz](https://www.xquartz.org/)をインストールする必要があります。
[こちら](http://blog.eszett-design.com/2020/10/dockerpythontkinter.html)を参考に設定します。

要約すると、

XQuartzの環境設定を開き「ネットワーク・クライアントからの接続を許可」のチェックを入れXquartzを再起動、以後XQaurtzを起動状態にしておきます。
