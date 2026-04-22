CREATE OR REPLACE PACKAGE GRC_ASSET_MANAGER IS
    FUNCTION GET_ASSET_RISK (p_asset_id IN NUMBER) RETURN NUMBER;
    PROCEDURE TRANSFER_ASSET (p_asset_id IN NUMBER, p_new_owner_id IN NUMBER);
END GRC_ASSET_MANAGER;
/

CREATE OR REPLACE PACKAGE BODY GRC_ASSET_MANAGER IS

    FUNCTION GET_ASSET_RISK (p_asset_id IN NUMBER) 
    RETURN NUMBER 
    IS
        v_total_risk NUMBER;
    BEGIN
        SELECT NVL(SUM(v.severity_score), 0)
        INTO v_total_risk
        FROM ASSET_VULNERABILITIES av
        JOIN VULNERABILITIES v ON av.vuln_id = v.vuln_id
        WHERE av.asset_id = p_asset_id;

        RETURN v_total_risk;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN 0;
    END GET_ASSET_RISK;

    PROCEDURE TRANSFER_ASSET (
        p_asset_id IN NUMBER,
        p_new_owner_id IN NUMBER
    )
    IS
    BEGIN
        UPDATE IT_ASSETS
        SET owner_id = p_new_owner_id,
            valid_from = CURRENT_TIMESTAMP
        WHERE asset_id = p_asset_id;

        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20001, 'Error occurred during asset transfer.');
    END TRANSFER_ASSET;

END GRC_ASSET_MANAGER;
/