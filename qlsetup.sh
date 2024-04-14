#!/bin/bash

export QL_DIR="${QL_DIR:-~/quicklisp}"
export CURL="${CURL:-$(which curl)}"
export SBCL="${SBCL:-$(which sbcl)}"
export QL_SYSTEMS=":fiveam"

if [! -x "${CURL}" ]; then
    echo "error: curl not found or not executable!"
    exit 100
fi
if [! -x "${SBCL}" ]; then
    echo "error: sbcl not found or not executable!"
    exit 101
fi

if [ -x "${QL_DIR}" ]; then
    rm -fr "${QL_DIR}"
fi

mkdir -p "${QL_DIR}"
"${CURL}" \
    -o "${QL_DIR}/quicklisp.lisp" \
    "https://beta.quicklisp.org/quicklisp.lisp"
"${SBCL}" \
    --load "${QL_DIR}/quicklisp.lisp" \
    --eval "(quicklisp-quickstart:install)" \
    --eval "(ql:add-to-init-file :without-prompting t)" \
    --eval "(ql:quickload '(:alexandria :uiop))" \
    --quit
if [ "${QL_SYSTEMS}" != "" ]; then 
    "${SBCL}" \
    --eval "(ql:quickload ${QL_SYSTEMS})" \
    --quit
fi
