# PostgreSQL Lab

## 개요

db1~5 5대에서 cascading replication, pgpool 실습

* 환경:
   - PostgreSQL 9.3
   - pgpool 3.4

## 사용방법

### postgres 계정 셸 진입

```
$ sudo -u postgres -i
```

### DB 시작 / 종료

```
postgres@db* $ pg_ctl -D /data/pg_data start
postgres@db* $ pg_ctl -D /data/pg_data stop
```

### 데이터 디렉터리 복제

```
postgres@db3 $ pg_basebackup --host=db2 --username=repl  --verbose --progress --xlog --pgdata=/data/pg_data
```

* `--host`: 원본 호스트
* `--username`: replication DB 계정
* `--progress`: 진행 프로그레스 바 표시
* `--xlog`: 복제를 진행하면서 변경된 WAL LOG도 같이 복제
* `--pgdata`: 대상 디렉터리 명

온라인으로 원본 호스트로부터 데이터 디렉터리를 통째로 복제.

### SSH 접속

```
$ vagrant ssh vm-name
# ex) $ vagrant ssh db1
```

### VM 구동

```
$ vagrant up [vm-name] # 미지정시 전체 대상
```

자동으로 db1~db5 5대의 VM이 설정되고 프로비저닝 스크립트가 수행된다.


### VM 종료

```
$ vagrant halt [vm-name] # 미지정시 전체 대상
```

### 프로비저닝 재수행

프로비저닝 스크립트가 변경되었거나 오류 등으로 중단되어 다시 실행하고자 할 경우.

```
$ vagrant provision [vm-name] # 미지정시 전체 대상
```




## 참고자료

### 백업 및 복원

* [공식 문서, 24. Backup and Restore](http://www.postgresql.org/docs/9.3/static/backup.html) / [번역](http://postgresql.kr/docs/9.4/backup.html)


### 복제

* [공식 문서, 25. High Availability, Load Balancing, and Replication ](http://www.postgresql.org/docs/9.3/static/high-availability.html) / [번역](http://postgresql.kr/docs/9.4/high-availability.html)
* [공식 문서, 18.6. Replication (파라메터)](http://www.postgresql.org/docs/9.3/static/runtime-config-replication.html) / [번역](http://postgresql.kr/docs/9.4/runtime-config-replication.html)


* [Amit Kapila, "WAL Internals Of PostgreSQL", PGCon 2012 ](https://www.pgcon.org/2012/schedule/attachments/258_212_Internals%20Of%20PostgreSQL%20Wal.pdf)
* [Heikki Linnakangas, "pg_rewind", 2015](http://hlinnaka.iki.fi/presentations/NordicPGDay2015-pg_rewind.pdf) / [공식 문서](http://www.postgresql.org/docs/9.5/static/app-pgrewind.html) / [블로그](http://hlinnaka.iki.fi/2015/03/23/pg_rewind-in-postgresql-9-5/)

### 튜닝

* [공식 문서, 18.4. Resource Consumption](http://www.postgresql.org/docs/9.3/static/runtime-config-resource.html) / [번역](http://postgresql.kr/docs/9.4/runtime-config-resource.html)
* [PgTune](http://pgtune.leopard.in.ua/): 설정파일 자동 계산

### 로깅

* [공식 문서, 18.8. Error reporting and logging](http://www.postgresql.org/docs/9.3/static/runtime-config-logging.html) / [번역](http://postgresql.kr/docs/9.4/runtime-config-logging.html)

* [pgFouine](http://pgfouine.projects.pgfoundry.org/tutorial.html) - a PostgreSQL log analyzer


### Vagrant

* [Getting started](https://docs.vagrantup.com/v2/getting-started/index.html)
