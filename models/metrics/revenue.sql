select *
from {{
    metric.calcuate(
        metric('revenue'),
        grain='day',
        dimensions=['customer_status']
    )
}}