Example AWK program that filters values from one file based on another.

Usage:

gawk -f customer-orders.awk customers.csv orders.csv

Will print rows in orders.csv that match rows in customers.csv based on a common "customer ID" field.
