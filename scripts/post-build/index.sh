#!/usr/bin/env bash

LOG_LEVEL=INFO
export LOG_LEVEL

pagefind-indexer -c pagefind-index.yaml
