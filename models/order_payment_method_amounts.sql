--option 3: variable and Use whitespace control to tidy up compiled code
--{%- set payment_methods = ["bank_transfer", "credit_card", "gift_card"] -%}
--option 4: marco
{% set payment_methods = get_payment_methods() %}

select
order_id,

--option 1: Normal sql
/*sum(case when payment_method = 'bank_transfer' then amount end) as bank_transfer_amount,
sum(case when payment_method = 'credit_card' then amount end) as credit_card_amount,
sum(case when payment_method = 'gift_card' then amount end) as gift_card_amount,*/

--option 2: Use a for loop in models for repeated SQL
/*{% for payment_method in ["bank_transfer", "credit_card", "gift_card"] %}
sum(case when payment_method = '{{payment_method}}' then amount end) as {{payment_method}}_amount,
{% endfor%}*/

--option 3: Set variables at the top of a model
{% for payment_method in payment_methods %}
sum(case when payment_method = '{{payment_method}}' then amount end) as {{payment_method}}_amount
{%- if not loop.last %},{% endif -%}
{% endfor %}
--sum(amount) as total_amount
--from {{ ref('stg_payments') }}
from {{ source('DBT_PRACTICE', 'stg_payments') }}
group by 1