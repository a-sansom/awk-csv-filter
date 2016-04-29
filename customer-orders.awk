BEGIN {
  # Before we start file processing, set field separator to be a comma.
  FS=","
}
{
  # Input files are read sequentially.
  # NR == FNR is only true while AWK is reading the customers.csv file.
  if (NR == FNR) {
    # First field is the customer identifier.
    customer_id = $1
    # Remove the quotes from the field value.
    gsub(/\"/, "", customer_id)
    # Store the ID in an array.
    customer_ids[customer_id]
    # Prevent further code being run, whilst reading the customers.csv file.
    next
  }
  {
    # Whilst reading the orders.csv file...
    # The customer identifier is the second field.
    order_customer_id = $2
    # Again, remove quotes from the field value.
    gsub(/\"/, "", order_customer_id)
  }
  # If the current order_customer_id value is in the customer_ids array, print the whole current orders.csv record.
  if (order_customer_id in customer_ids) {
    print $0
  }
}
