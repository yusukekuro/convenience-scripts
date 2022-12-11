#!/usr/bin/env bash
# Usage:
#     git-exec git branch
find . -type d -name .git -exec sh -c "cd \"{}\"/../ && pwd && $*" \;
