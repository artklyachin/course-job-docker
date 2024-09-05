#!/bin/bash

cd course-settings
git pull
cd ..

pip3 install -r course-settings/requirements.txt
cp ./course-settings/clang-format.json .clang-format
cp ./course-settings/clang-tidy.json .clang-tidy

python3 course-settings/checker/main.py

