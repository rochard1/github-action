#!/bin/sh -l

CODE_INSPECTOR_BIN="/usr/bin/code-inspector-github-action"

MIN_QUALITY_GRADE=$1
MIN_QUALITY_SCORE=$2
MAX_DEFECTS_RATE=$3
MAX_COMPLEX_FUNCTIONS_RATE=$4
MAX_LONG_FUNCTIONS_RATE=$5
PROJECT_NAME=$6
MAX_TIMEOUT_SEC=$7


echo "Code Inspector GitHub action"
echo "Running with this parameters"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "MIN_QUALITY_GRADE:          ${MIN_QUALITY_GRADE}"
echo "MIN_QUALITY_SCORE:          ${MIN_QUALITY_SCORE}"
echo "MAX_DEFECTS_RATE:           ${MAX_DEFECTS_RATE}"
echo "MAX_COMPLEX_FUNCTIONS_RATE: ${MAX_COMPLEX_FUNCTIONS_RATE}"
echo "MAX_LONG_FUNCTIONS_RATE:    ${MAX_LONG_FUNCTIONS_RATE}"
echo "PROJECT_NAME:               ${PROJECT_NAME}"
echo "MAX_TIMEOUT_SEC:            ${MAX_TIMEOUT_SEC}"


export CODE_INSPECTOR_ACCESS_KEY=${INPUT_CODE-INSPECTOR-ACCESS-KEY}
export CODE_INSPECTOR_SECRET_KEY=${INPUT_CODE-INSPECTOR-SECRET-KEY}

echo "CI AK ${CODE_INSPECTOR_ACCESS_KEY}"
echo "CI SK ${CODE_INSPECTOR_SECRET_KEY}"

${CODE_INSPECTOR_BIN} \
  --token "${INPUT_REPO-TOKEN}" \
  --actor "${GITHUB_ACTOR}" \
  --repository "${GITHUB_REPOSITORY}" \
  --sha "${GITHUB_SHA}" \
  --ref "${GITHUB_REF}" \
  --project "${PROJECT_NAME}" \
  --min-quality-score "${MIN_QUALITY_SCORE}" \
  --min-quality-grade "${MIN_QUALITY_GRADE}" \
  --max-defects-rate "${MAX_DEFECTS_RATE}" \
  --max-complex-functions-rate "${MAX_COMPLEX_FUNCTIONS_RATE}" \
  --max-long-functions-rate "${MAX_LONG_FUNCTIONS_RATE}" \
  --max-timeout-sec "${MAX_TIMEOUT_SEC}" \

