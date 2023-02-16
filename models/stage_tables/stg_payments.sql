select
ID,
ORDERID as order_id,
PAYMENTMETHOD as payment_method,
STATUS,
AMOUNT
from {{ source('DBT_PRACTICE', 'PAYMENT') }}