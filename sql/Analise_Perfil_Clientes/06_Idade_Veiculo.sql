--6  Idade do Veiculo 

with tabela1 as (
select 
	(2021 - (t2.model_year::int)) as Idade
from sales.funnel as t1 left join sales.products as t2
on t1.product_id=t2.product_id
where t1.paid_date is not null
),
tabela2 as (
select 
 case
 	when idade >= 0 and idade<2 then 'Até 2 Anos'
	when idade>=2 and idade<4 then 'de 2 à 4 Anos'
	when idade>=4 and idade<6 then 'de 4 à 6 Anos'
	when idade>=6 and idade<8 then 'de 6 à 8 Anos'
	when idade>=8 and idade<=10 then 'de 8 à 10 Anos'
	when idade>10 then 'Acima de 10 Anos'
	ELSE 'Error__ValorInvalido'
end as Idade
from tabela1
)
select 
count(*) as Quantidade_Veiculos,
idade
from tabela2
group by idade
