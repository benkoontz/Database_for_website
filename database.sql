//// -- LEVEL 1
//// -- Tables and References

/* Creating tables */
Create Table users {
  id int NOT NULL AUTO_INCREMENT,
  full_name varchar(255),
  gender chara,
  age int,
  created_at timestamp
}

Create Table location {
  code int PRIMARY KEY, 
  name varchar,
  continent_name varchar
 }

//----------------------------------------------//

//// -- LEVEL 2
//// -- Adding column settings

Create Table order_items {
  order_id int [ref: > orders.id] // inline relationship (many-to-one)
  product_id int
  quantity int [default: 1] // default value
}

Ref: order_items.product_id > products.id

Create Table orders {
  id int [pk] // primary key
  user_id int [not null, unique]
  status varchar
  created_at varchar [note: 'When order created'] // add column note
}


Create Table merchant_periods {
  id int [pk]
  merchant_id int
  country_code int
  start_date datetime
  end_date datetime
}

Ref: products.merchant_id > merchants.id // many-to-one
//composite foreign key
Ref: merchant_periods.(merchant_id, country_code) > merchants.(id, country_code)
