--4 Grafico de Faixa Etaria 

with tabela1 as (
select 
	((('01-08-2020')::date-t1.birth_date)/365)::INT as Anos
from sales.customers as t1 left join sales.funnel as t2
on t1.customer_id=t2.customer_id
where paid_date is not null
),
tabela2 as (
select 
CASE 
	WHEN anos >0 and anos<=20 then '0 - 20'
	WHEN anos >20 and anos<=40 then '40 - 20'
	WHEN anos >40 and anos<=60 then '60 - 40'
	WHEN anos >60 and anos<=80 then '80 - 60'
	WHEN anos >80 then '80 +'
	ELSE 'Error_Valor_desconhecido'
end as faixa_etaria
from tabela1
)
select 
count(*) as Quantidade,
faixa_etaria
from tabela2
group by faixa_etaria
order by faixa_etaria
