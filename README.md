1. compile
./rebar compile

2. edit accout.txt, format:
> name username password<br/>
> name1 username password<br/>
> ...

3. ./main.sh will run every 15 minutes using crontab.
it will check all account in account.txt.

Cloudant APIs: [https://docs.cloudant.com/api/index.html](https://docs.cloudant.com/api/index.html)<br/>
Couchdb APIs: [http://docs.couchdb.org/en/latest/api/index.html](http://docs.couchdb.org/en/latest/api/index.html)
