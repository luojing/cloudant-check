1. compile
./rebar compile

2. edit accout.txt, format:
name username password
name1 username password
...

3. ./main.sh will run every 15 minutes using crontab.
it will check all account in account.txt.

Cloudant APIs: https://docs.cloudant.com/api/index.html
Couchdb APIs: http://docs.couchdb.org/en/latest/api/index.html
