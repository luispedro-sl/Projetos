---Grafico 4
---Função que retorna as 5 lojas com mais vendas no mes 

create function top5_lojasmensal(mes1 int,ano1 int)
returns table(
	quantidade BIGINT,
	loja text,
	mes int,
	ano int
)
LANGUAGE sql
as $$
with tabela1 as (
select
	count(t1.product_id) as Quantidade,
	t2.store_name,
	extract('month' from t1.paid_date)::int as mes,
	extract('year' from t1.paid_date)::int as ano
from sales.funnel as t1 left join sales.stores as t2
on t1.store_id=t2.store_id
where t1.paid_date is not null
group by t2.store_name,mes,ano
)
select 
sum(Quantidade),
store_name as Marca,
mes,
ano
from tabela1
where (mes = mes1) and (ano = ano1)
and mes1 between 1 and 12
group by store_name,ano,mes
order by sum(quantidade) desc
limit 5
$$;
