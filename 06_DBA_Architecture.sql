SELECT name, open_mode, log_mode FROM v$database;

SELECT tablespace_name, file_name, bytes/1024/1024 AS Size_MB 
FROM dba_data_files;

SELECT name, bytes/1024/1024 AS Size_MB 
FROM v$sga;