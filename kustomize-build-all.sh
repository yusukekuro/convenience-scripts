#!/usr/bin/env bash
#
# This script performs following.
# 1. Make build directory in current directory
# 2. Find kustomization.yaml recursively under current directory
# 3. For each kustomization.yaml, perform kustomize build and output to build/{parent directory name}.yaml
#
# This is to be executed in the directory where overlays directory exists.
set -euo pipefail

BUILD_ROOT_DIR="build"

mkdir -p "${BUILD_ROOT_DIR}"

while read -r -d "" file_path; do
  src_dir=$(dirname "${file_path}" | cut -c3-) # Use cut to remove ./
  dest_dir="${BUILD_ROOT_DIR}/$(dirname "${src_dir}")"
  mkdir -p "${dest_dir}"
  kustomize build "${src_dir}" > "${BUILD_ROOT_DIR}/${src_dir}.yaml"
done < <(find . -type f -name kustomization.yaml -print0)
