---Grafico 3
---Função que retorna as 5 marcas mais vendidas do mes

create function top5mensal(mes1 int,ano1 int)
returns table(
	quantidade BIGINT,
	marca text,
	mes int,
	ano int
)
LANGUAGE sql
as $$
with tabela1 as (
select
	count(t1.product_id) as Quantidade,
	t2.brand,
	extract('month' from t1.paid_date)::int as mes,
	extract('year' from t1.paid_date)::int as ano
from sales.funnel as t1 left join sales.products as t2
on t1.product_id=t2.product_id
where t1.paid_date is not null
group by t2.brand,mes,ano
)
select 
sum(Quantidade),
brand as Marca,
mes,
ano
from tabela1
where (mes = mes1) and (ano = ano1)
and mes1 between 1 and 12
group by brand,ano,mes
order by sum(quantidade) desc
limit 5
$$;
