BEGIN
    DBMS_SCHEDULER.CREATE_JOB (
        job_name        => 'PURGE_OLD_AUDIT_LOGS',
        job_type        => 'PLSQL_BLOCK',
        job_action      => 'BEGIN DELETE FROM ASSET_AUDIT_LOG WHERE change_date < SYSTIMESTAMP - INTERVAL ''365'' DAY; COMMIT; END;',
        start_date      => SYSTIMESTAMP,
        repeat_interval => 'FREQ=DAILY; BYHOUR=2; BYMINUTE=0; BYSECOND=0',
        enabled         => TRUE
    );
END;
/

SELECT job_name, state, next_run_date 
FROM dba_scheduler_jobs 
WHERE job_name = 'PURGE_OLD_AUDIT_LOGS';