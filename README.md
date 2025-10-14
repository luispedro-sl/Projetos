# Estudo de Caso: Análise de Atividade Física e Sono

Este repositório contém o estudo de caso de análise de dados de usuários de dispositivos **wearables**, com o objetivo de identificar os melhores dias e horários para publicar diferentes tipos de conteúdo com base nos padrões de atividade física e sono.

---

## 1. Objetivo

Identificar os melhores dias e horários para publicar conteúdo:
- **Posts rápidos / Stories**
- **Posts longos / Carrossel**
- **Vídeos (Reels / Shorts)**

Baseado nos padrões de atividade e sono dos usuários.

---

## 2. Dataset

O dataset foi obtido de uma fonte pública no [Kaggle](https://www.kaggle.com/), contendo:

- Minutos de atividade intensa, moderada e leve
- Minutos sedentários
- Minutos de sono

**Formatos:** `.csv` e `.txt`

---

## 3. Métricas Analisadas

- `VeryActiveMinutes` — minutos de atividade intensa  
- `FairlyActiveMinutes` — minutos de atividade moderada  
- `LightlyActiveMinutes` — minutos de atividade leve  
- `SedentaryMinutes` — minutos sedentários  
- `TotalMinutesAsleep` — minutos de sono  

---

## 4. ETL e BigQuery

As tabelas foram criadas no **Google BigQuery**, incluindo tratamento de dados e transformações:

- Padronização de datas (`DATE()`, `CAST`)  
- Criação de variáveis derivadas:
  - `TempoAtividadeTotal` = soma das atividades  
  - `SedentarioAcordado` = sedentarismo subtraído do sono  
- Junção entre tabelas de atividade e sono  

Exemplo de query:

```sql
CREATE OR REPLACE TABLE `StudyCase.AtividadeDiaria` AS
SELECT CAST(Id AS STRING) AS Id,
       ActivityDate,
       VeryActiveMinutes,
       LightlyActiveMinutes,
       FairlyActiveMinutes,
       SedentaryMinutes
FROM `StudyCase.AtividadeDiaria`;
