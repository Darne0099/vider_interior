#!/usr/bin/env bash
set -o errexit
pip install -r requirements.txt
python manage.py collectstatic --noinput
python manage.py migrate


# Then push it to GitHub:
# git add build.sh
# git commit -m "add build.sh for render"
# git push