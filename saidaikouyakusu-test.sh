#!/bin/bash

# テスト関数
run_test() {
  local input1=$1
  local input2=$2
  local expected=$3
  local description=$4

  result=$(./saidaikouyakusu.sh "$input1" "$input2")
  
  if [[ "$result" -eq "$expected" ]]; then
    echo "PASS: $description"
  else
    echo "FAIL: $description - Expected: $expected, Got: $result" >&2
    exit 1
  fi
}

# エラーチェック（異常系テスト）
run_error_test() {
  local input1=$1
  local input2=$2
  local description=$3

 
  # エラーメッセージをキャッチ
  error_message=$(./saidaikouyakusu.sh "$input1" "$input2" 2>&1)

  # 終了コードをチェック
  exit_status=$?

  if [[ "$exit_status" -eq 1 ]]; then
    echo "PASS: $description (期待通りエラー終了)"
  else
    echo "FAIL: $description (期待通りのエラー終了にならなかった) - 出力: $error_message" >&2
    exit 1
  fi
}

# 正常系テスト
run_test 48 18 6 "通常ケース（48, 18）"
run_test 7 13 1 "互いに素な数（7, 13）"
run_test 48 180 12 "複雑なケース（48, 180）"

# 異常系テスト（期待するエラー終了）
run_error_test 48 "" "引数が1つしかない"
run_error_test "" 18 "引数が1つしかない（逆パターン）"
run_error_test 48 18 12 "引数が3つある"
run_error_test -48 18 "負の数を含む"
run_error_test 12.5 3.2 "小数を含む"
run_error_test 0 18 "ゼロを含む"
run_error_test "abc" 18 "非数値を含む"

echo "全テスト成功"
exit 0
