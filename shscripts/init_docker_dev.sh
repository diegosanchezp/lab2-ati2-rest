#!/bin/bash

source .venv/bin/activate && gunicorn --log-level DEBUG --bind 0.0.0.0:8000 django_src.wsgi
