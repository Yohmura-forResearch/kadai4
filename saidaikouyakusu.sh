#!/bin/bash

# まずは引数のチェック
if [[ $# -ne 2 ]]; then
        echo "エラー必ず2つの数値を指定してください" >&2
        unset a b # 不要な変数をクリア
        exit 1
fi

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
	unset a b # 不要な変数をクリア
	exit 1
fi

# 計算実行
saidaikouyakusu "$1" "$2"
