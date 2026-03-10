#!/usr/bin/env bash
set -uo pipefail
run() {
	out=logs/out/$2.log
	err=logs/err/$2.log
	racket "$1" \
		1> "$out" \
		2> "$err"
}
rm -rf logs
mkdir -p logs/{out,err}
run src/main.rkt run
find . -empty -delete
