---5 Grafico Classificação de Veiculos em Novos e Seminovos 

with tabela1 as (
select 
	t1.product_id,
	CASE
		WHEN (2021 - (t2.model_year::int))<=3 then 'Novo'
		WHEN (2021 - (t2.model_year::int))>3 then 'Seminovo'
		ELSE 'Nulo'
	END as Classificacao
from sales.funnel as t1 left join sales.products as t2
on t1.product_id=t2.product_id
where t1.paid_date is not null
)
select 
count(Classificacao),
Classificacao
from tabela1
group by classificacao
