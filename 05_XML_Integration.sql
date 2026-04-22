SELECT XMLELEMENT("RiskReport",
           XMLATTRIBUTES(CURRENT_DATE AS "GeneratedOn"),
           XMLAGG(
               XMLELEMENT("Asset",
                   XMLELEMENT("Name", asset_name),
                   XMLELEMENT("RiskLevel", GRC_ASSET_MANAGER.GET_ASSET_RISK(asset_id))
               )
           )
       ).getClobVal() AS XML_REPORT
FROM IT_ASSETS;