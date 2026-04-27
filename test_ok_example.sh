#!/usr/bin/env sh
# test_ok_example.sh - Tests for ok_example.sh
#
# Test with:
#   ./test_ok_example.sh
# or:
#   make test

VERSION=1.0.0

. ./ok.sh

TEST_VERBOSE=true

SCRIPT=./ok_example.sh

test_help() {
    run -h
    assert_exit 0 "-h exits 0"
    assert_contains "Usage:" "$_out" "-h shows usage"

    run --help
    assert_exit 0 "--help exits 0"
    assert_contains "Usage:" "$_out" "--help shows usage"
}

test_version() {
    run -V
    assert_exit 0 "-V exits 0"
    assert_contains "0.1.0" "$_out" "-V shows version"

    run --version
    assert_exit 0 "--version exits 0"
    assert_contains "0.1.0" "$_out" "--version shows version"
}

test_no_args() {
    run
    assert_exit 1 "no args exits 1"
    assert_contains "Usage:" "$_out" "no args shows usage"
}

test_run_cmd() {
    run run
    assert_exit 0 "run exits 0"
    assert_contains "exec run cmd" "$_out" "run prints expected output"
}

test_unknown_cmd() {
    run badcmd
    assert_exit 1 "unknown cmd exits 1"
    assert_contains "command not found" "$_out" "unknown cmd prints error"
}

run_tests
