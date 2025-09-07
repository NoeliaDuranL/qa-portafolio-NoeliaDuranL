# SQL Validation Queries – Expicación

I tried to insert some issues to my database example of ecommerce but it was not posible since the restrictions are violated, however I let the queries that I would use to test the DB.

1) **Duplicate emails**
Detects users with the same email more than once

2) **Orders without items**
Flags orders that have no related `order_items`, indicating incomplete checkouts or data corruption.

3) **Items referencing non-existing product**
Finds order items pointing to a product that does not exist.

4) **Negative prices or stock**
Validates business rules for product catalog integrity.

5) **Orphan orders referencing non-existing users**
Ensures orders always belong to a valid user.
