--Grafico 2
---Calcula os leads e a taxa de conversão mes a mes 

with tabela2 as (
select
count(distinct visit_id) as Leads,
visit_page_date,
extract('month' from visit_page_date) as mes,
extract('year'from visit_page_date) as ano
from sales.funnel
group by visit_page_date
order by ano,mes
),
tabela3 as (
select 
count(paid_date) as compras,
visit_page_date
from sales.funnel
where paid_date is not null
group by visit_page_date
)
select 
	sum(t2.Leads) as Leads,
	round(sum(t3.compras)/sum(t2.leads),2) as Taxa_Conversao,
	t2.mes,
	t2.ano
from 
tabela2 as t2 left join 
tabela3 as t3 
on  t2.visit_page_date=t3.visit_page_date
group by t2.ano,t2.mes
order by t2.ano,t2.mes
