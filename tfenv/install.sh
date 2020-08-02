#! /bin/bash

echo "  > Install tfenv latest version"
tfenv install latest

echo "  > SetUp tfenv latest version"
tfenv use latest

terraform --version
