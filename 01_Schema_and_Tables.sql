CREATE TABLE IT_ASSETS (
    asset_id NUMBER PRIMARY KEY,
    asset_name VARCHAR2(100),
    owner_id NUMBER,
    valid_from TIMESTAMP
);

CREATE TABLE VULNERABILITIES (
    vuln_id NUMBER PRIMARY KEY,
    vuln_name VARCHAR2(100),
    severity_score NUMBER
);

CREATE TABLE ASSET_VULNERABILITIES (
    asset_id NUMBER,
    vuln_id NUMBER,
    FOREIGN KEY (asset_id) REFERENCES IT_ASSETS(asset_id),
    FOREIGN KEY (vuln_id) REFERENCES VULNERABILITIES(vuln_id)
);

CREATE TABLE ASSET_AUDIT_LOG (
    log_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    asset_id NUMBER,
    old_owner_id NUMBER,
    new_owner_id NUMBER,
    change_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    changed_by_user VARCHAR2(50)
);