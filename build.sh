# #!/usr/bin/env bash
# set -o errexit
# pip install -r requirements.txt
# python manage.py collectstatic --noinput
# python manage.py migrate

#!/usr/bin/env bash
set -o errexit
pip install -r requirements.txt
python manage.py collectstatic --noinput
python manage.py migrate
python manage.py shell -c "
import os
from django.contrib.auth import get_user_model
User = get_user_model()
username = os.environ.get('DJANGO_SUPERUSER_USERNAME', 'admin')
email = os.environ.get('DJANGO_SUPERUSER_EMAIL', '')
password = os.environ.get('DJANGO_SUPERUSER_PASSWORD', '')
if not User.objects.filter(username=username).exists():
    User.objects.create_superuser(username, email, password)
    print('Superuser created')
else:
    print('Superuser already exists')
"


# Then push it to GitHub:
# git add build.sh
# git commit -m "add build.sh for render"
# git push