SELECT
    ti_cve_n,
    ult_sust_def_n,
    talla_ini_min,
    talla_fin_max,
    ta_cve_n,
    fecha,
    existencia,
    venta,
    r.ordenada + r.pendiente * ( sysdate - fecha ) vta_estimada
FROM
    ventas,
    (
        SELECT
            REGR_SLOPE(venta,sysdate - fecha) pendiente,
            REGR_INTERCEPT(venta,sysdate - fecha) ordenada
        FROM
            ventas
        WHERE
            ult_sust_def_n = 1560
            AND ta_cve_n = 26
            AND existencia > 0
            AND to_char(fecha, 'D') = '7'
            AND fecha BETWEEN TO_DATE('01/03/19', 'DD/MM/YY') AND TO_DATE('30/04/19', 'DD/MM/YY')
        GROUP BY
            ti_cve_n,
            ult_sust_def_n,
            talla_ini_min,
            talla_fin_max,
            ta_cve_n
    ) r
WHERE
    ult_sust_def_n = 1560
    AND ta_cve_n = 26
    AND existencia = 0
    AND to_char(fecha, 'D') = '7'
    AND fecha BETWEEN TO_DATE('01/03/19', 'DD/MM/YY') AND TO_DATE('30/04/19', 'DD/MM/YY')