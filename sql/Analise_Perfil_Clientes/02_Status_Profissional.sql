---2  Grafico de Status professional 

with tabela1 as (
select 
	t1.first_name,
	case 
		when TRIM(t1.professional_status)='freelancer' then 'Freelancer'
		when TRIM(t1.professional_status)='retired' then  'Aposentado'
		when TRIM(t1.professional_status)='clt' then  'Empregado(CLT)'
		when TRIM(t1.professional_status)='self_employed' then  'Autonomo'
		when TRIM(t1.professional_status)='businessman' then  'Empresario'
		when TRIM(t1.professional_status)='civil_servant' then  'Servidor Publico'
		when TRIM(t1.professional_status)='other' then 'Outro'
		else 'Desconhecido'
END AS status_Profissional
from sales.customers as t1 left join sales.funnel as t2
on t1.customer_id=t2.customer_id
where paid_date is not null
)
select 
count(*) as quantidade,
status_profissional
from tabela1
group by status_profissional
order by quantidade DESC
