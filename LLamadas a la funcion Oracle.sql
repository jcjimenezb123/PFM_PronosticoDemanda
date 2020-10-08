select TI_CVE_N,
       ULT_SUST_DEF,
       TALLA_INI_MIN,
       TALLA_FIN_MAX,
       TA_CVE_N,
       FECHA,
       EXISTENCIA,
       VENTA,
       VTA_ESTIMADA
from venta
where ult_sust_def=1560 
    and ta_cve_n=26
    and ti_cve_n = 1
    and fecha>=TO_DATE('01/03/19', 'DD/MM/YY') and fecha <=TO_DATE('30/04/19', 'DD/MM/YY');
    
    
select FN_VTA_ESTIMADA(P_TI_CVE_N => 1,
                       P_ULT_SUST_DEF=> 14339,
                       P_TA_CVE_N => 29,
                       P_FECHA => TO_DATE('14/11/19', 'DD/MM/YY'))
from dual; 
-- -0.33333333333333333333333333333333333333

select FN_VTA_ESTIMADA_V2(P_TI_CVE_N => 1,
                          P_ULT_SUST_DEF=> 14339,
                          P_TA_CVE_N => 29,
                          P_FECHA => TO_DATE('14/11/19', 'DD/MM/YY'))
from dual; 

select FN_VTA_ESTIMADA_V2(P_TI_CVE_N => 1,
                          P_ULT_SUST_DEF=> 1560,
                          P_TA_CVE_N => 26,
                          P_FECHA => TO_DATE('08/03/19', 'DD/MM/YY'))
from dual;
--0.7523809523809523809523809523809523809517


--Numero del dia del año
SELECT TO_NUMBER(TO_CHAR(SYSDATE, 'DDD')) from DUAL;
                

