CREATE OR REPLACE TRIGGER TRG_ASSET_AUDIT
AFTER UPDATE OF owner_id ON IT_ASSETS
FOR EACH ROW
BEGIN
    IF :OLD.owner_id <> :NEW.owner_id THEN
        INSERT INTO ASSET_AUDIT_LOG (asset_id, old_owner_id, new_owner_id, changed_by_user)
        VALUES (:OLD.asset_id, :OLD.owner_id, :NEW.owner_id, USER);
    END IF;
END;
/