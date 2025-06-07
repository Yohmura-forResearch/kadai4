#!/bin/bash

#最大公約数を求める関数
saidaikouyakusu() {
	local a=$1
	local b=$2

	while [[ $b -ne 0 ]];do
		local temp=$b
		b=$((a % b))
		a=$temp
	done

	echo $a
}

# 引数のチェック
if [[ $# -ne 2 ]]; then
	echo "エラー必ず2つの数値を指定してください" >&2
	exit 1
fi

# 負の数・小数・ゼロ・非数値をチェック
for arg in "$1" "$2"; do
  if ! [[ "$arg" =~ ^[1-9][0-9]*$ ]]; then
    echo "エラー 正の整数のみ使用できます。（入力: $arg）" >&2
    exit 1
  fi
done

# 計算実行
saidaikouyakusu "$1" "$2"
