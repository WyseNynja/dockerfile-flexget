#!/bin/sh

# TODO: proper entrypoint script

exec flexget "$@" daemon start
