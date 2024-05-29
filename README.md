# kozin

## coc-snippetsのスニペット定義の形式

snippet トリガーワード ["説明" [オプション]]
スニペットの内容
endsnippet

## オプション
- b - 行の先頭でのみ展開されるスニペット。
- i - 単語の中でも展開されるスニペット。
- w - 単語の境界でのみ展開されるスニペット。
- r - 正規表現によるトリガー。
- e - カスタムコンテキストスニペット。
- A - 条件が一致したときに自動的にトリガーされるスニペット。

## 基本的な例
以下に、emitterというトリガーワードを持つスニペットの例を示します。
このスニペットは行の先頭でのみ展開されます (b オプション)。

```vim
snippet emitter "emitter properties" b
private readonly ${1} = new Emitter<$2>()
public readonly ${1/^_(.*)/$1/}: Event<$2> = this.$1.event
endsnippet

```vim
snippet emitter "emitter properties" b
private readonly ${1} = new Emitter<$2>()
public readonly ${1/^_(.*)/$1/}: Event<$2> = this.$1.event
endsnippet

## 説明
1. snippet emitter "emitter properties" b:
snippetはスニペットの開始を示します。
emitterはトリガーワードです。これを入力してスニペットを展開します。
"emitter properties"はスニペットの説明です。
bは行の先頭でのみスニペットが展開されることを示します。

2. private readonly ${1} = new Emitter<$2>():
private readonly ${1} = new Emitter<$2>()はスニペットが展開されたときに挿入されるテキストです。
${1}と${2}はプレースホルダーです。スニペットが展開された後、これらの位置にカーソルが移動し、ユーザーが入力を行います。

3. public readonly ${1/^_(.*)/$1/}: Event<$2> = this.$1.event:
この行は、最初のプレースホルダーの値に基づいて変換を行う例です。
${1/^_(.*)/$1/}は、${1}の値が_で始まる場合、その_を取り除きます。

4. endsnippet:
endsnippetはスニペットの終了を示します。
