create or replace FUNCTION FN_VTA_ESTIMADA 
(
  P_TI_CVE_N IN NUMBER 
, P_ULT_SUST_DEF IN NUMBER 
, P_TA_CVE_N IN NUMBER 
, P_FECHA IN DATE 
) RETURN NUMBER AS
V_VTA_ESTIMADA NUMBER;
BEGIN
    SELECT
        r.ordenada + r.pendiente * ( sysdate - fecha ) 
        into V_VTA_ESTIMADA
    FROM  venta,
        (
            SELECT
                REGR_SLOPE(venta, sysdate - fecha) pendiente,
                REGR_INTERCEPT(venta, sysdate - fecha) ordenada
            FROM
                venta
            WHERE
                ti_cve_n = P_TI_CVE_N
                AND ult_sust_def = P_ULT_SUST_DEF
                AND ta_cve_n = P_TA_CVE_N
                AND fecha >= add_months(P_FECHA, -1)
                AND fecha <= add_months(P_FECHA, 1)            
                AND to_char(fecha, 'D') = to_char(P_FECHA, 'D')
                AND existencia > 0
            GROUP BY
                ti_cve_n,
                ult_sust_def,
                talla_ini_min,
                talla_fin_max,
                ta_cve_n
        ) r
    WHERE
        ti_cve_n = P_TI_CVE_N
        AND ult_sust_def = P_ULT_SUST_DEF
        AND ta_cve_n = P_TA_CVE_N
        AND fecha = P_FECHA;
        --AND existencia = 0;

  RETURN NVL(V_VTA_ESTIMADA,-1);
  EXCEPTION
    WHEN TOO_MANY_ROWS THEN
        --v_vta_estimada := -2;
        dbms_output.put_line('Ult_sust_def:' || P_ULT_SUST_DEF);
        RETURN NVL(-100,-1);
END FN_VTA_ESTIMADA;