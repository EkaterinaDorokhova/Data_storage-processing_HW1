CREATE TABLE "customers" (
  "customer_id" serial PRIMARY KEY,
  "first_name" varchar(50),
  "last_name" varchar(50),
  "gender" varchar(10),
  "DOB" date
);

CREATE TABLE "customer_wealth" (
  "id" serial PRIMARY KEY,
  "customer_id" integer,
  "job_title" varchar(100),
  "job_industry_category" varchar(100),
  "wealth_segment" varchar(50),
  "deceased_indicator" char(1),
  "owns_car" varchar(3)
);

CREATE TABLE "customer_geo" (
  "id" serial PRIMARY KEY,
  "customer_id" integer,
  "address" varchar(255),
  "postcode" varchar(20),
  "state" varchar(100),
  "country" varchar(100),
  "property_valuation" integer
);

CREATE TABLE "transactions" (
  "transaction_id" serial PRIMARY KEY,
  "product_id" integer,
  "customer_id" integer,
  "transaction_date" date,
  "online_order" boolean,
  "order_status" varchar(50)
);

CREATE TABLE "products" (
  "product_id" serial PRIMARY KEY,
  "brand" varchar(100),
  "product_line" varchar(100),
  "product_class" varchar(50),
  "product_size" varchar(50),
  "list_price" decimal(10,2),
  "standard_cost" decimal(10,2)
);

ALTER TABLE "customer_wealth" ADD FOREIGN KEY ("customer_id") REFERENCES "customers" ("customer_id");

ALTER TABLE "customer_geo" ADD FOREIGN KEY ("customer_id") REFERENCES "customers" ("customer_id");

ALTER TABLE "transactions" ADD FOREIGN KEY ("product_id") REFERENCES "products" ("product_id");

ALTER TABLE "transactions" ADD FOREIGN KEY ("customer_id") REFERENCES "customers" ("customer_id");
