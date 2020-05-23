#!/bin/sh -l

CODE_INSPECTOR_BIN="/usr/bin/code-inspector-github-action"

TOKEN=$1
MIN_QUALITY_GRADE=$2
MIN_QUALITY_SCORE=$3
MAX_DEFECTS_RATE=$4
MAX_COMPLEX_FUNCTIONS_RATE=$5
MAX_LONG_FUNCTIONS_RATE=$6
PROJECT_NAME=$7
MAX_TIMEOUT_SEC=$8


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



CODE_INSPECTOR_ACCESS_KEY=${INPUT_CODE_INSPECTOR_ACCESS_KEY} \
CODE_INSPECTOR_SECRET_KEY=${INPUT_CODE_INSPECTOR_SECRET_KEY} \
${CODE_INSPECTOR_BIN} \
  --token "${INPUT_GITHUB_TOKEN}" \
  --actor "${GITHUB_ACTOR}" \
  --repository "${GITHUB_REPOSITORY}" \
  --sha "${GITHUB_SHA}" \
  --ref "${GITHUB_REF}" \
  --project "${PROJECT_NAME}" \
  --min-quality-score "${MAX_TIMEOUT_SEV}" \
  --min-quality-grade "${MIN_QUALITY_GRADE}" \
  --max-defects-rate "${MAX_DEFECTS_RATE}" \
  --max-complex-functions-rate "${MAX_COMPLEX_FUNCTIONS_RATE}" \
  --max-long-functions-rate "${MAX_LONG_FUNCTIONS_RATE}" \
  --max-timeout-sec "${MAX_TIMEOUT_SEC}" \

