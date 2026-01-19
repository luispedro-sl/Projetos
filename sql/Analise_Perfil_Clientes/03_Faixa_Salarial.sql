--3 Grafico de Faixa Salarial

with tabela1 as (
select 
	t1.income,
	case 
		when income >0 and income<= 5000  then '0 - 5000'
		when income >5000 and income<= 10000  then '5000-10000'
		when income >10000 and income<= 15000  then '10000 - 15000'
		when income >15000 and income<= 20000  then '15000 - 20000'
		when income >20000 then ('+ 20000')
		else 'Error_Valor_invalido'
END AS Faixa_Salarial
from sales.customers as t1 left join sales.funnel as t2
on t1.customer_id=t2.customer_id
where paid_date is not null
)
select 
count(*) as quantidade,
faixa_salarial
from tabela1
group by faixa_salarial
