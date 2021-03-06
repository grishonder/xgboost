#!/usr/bin/env bash
set -e

cd python-package
python setup.py install --user
cd ..
pytest -v -s --fulltrace -m "(not slow) and mgpu" tests/python-gpu
./build/testxgboost --gtest_filter=*.MGPU_*

cd tests/distributed
./runtests-gpu.sh
