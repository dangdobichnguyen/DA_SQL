create table SALES_DATASET_RFM_PRJ
(
  ordernumber VARCHAR,
  quantityordered VARCHAR,
  priceeach        VARCHAR,
  orderlinenumber  VARCHAR,
  sales            VARCHAR,
  orderdate        VARCHAR,
  status           VARCHAR,
  productline      VARCHAR,
  msrp             VARCHAR,
  productcode      VARCHAR,
  customername     VARCHAR,
  phone            VARCHAR,
  addressline1     VARCHAR,
  addressline2     VARCHAR,
  city             VARCHAR,
  state            VARCHAR,
  postalcode       VARCHAR,
  country          VARCHAR,
  territory        VARCHAR,
  contactfullname  VARCHAR,
  dealsize         VARCHAR

--này tạo bảng xong lúc import vô dư 1 dòng tên cột nên em xoá
SELECT *FROM public.sales_dataset_rfm_prj
DELETE FROM public.sales_dataset_rfm_prj
WHERE status='STATUS'
--thay đổi kiểu dữ liệu (em chạy nó báo lỗi) 
ALTER TABLE public.sales_dataset_rfm_prj
ALTER COLUMN ordernumber TYPE INT
ALTER COLUMN quantityordered TYPE INT
ALTER COLUMN priceeach TYPE FLOAT
ALTER COLUMN orderlinenumber TYPE INT
ALTER COLUMN sales TYPE numeric
ALTER COLUMN status TYPE text
ALTER COLUMN orderdate TYPE date 
ALTER COLUMN productline TYPE text
ALTER COLUMN msrp TYPE text
ALTER COLUMN productcode TYPE text
ALTER COLUMN customername TYPE text	
ALTER COLUMN phone TYPE text
ALTER COLUMN addressline1 TYPE text
ALTER COLUMN addressline2 TYPE text
ALTER COLUMN city TYPE text
ALTER COLUMN state TYPE text
ALTER COLUMN postalcode TYPE text
ALTER COLUMN country TYPE text
ALTER COLUMN territory TYPE text
ALTER COLUMN contactfullname TYPE text
ALTER COLUMN dealsize TYPE text
-- loại bỏ null 
SELECT *FROM public.sales_dataset_rfm_prj
WHERE ORDERNUMBER IS NOT NULL
AND QUANTITYORDERED IS NOT NULL
AND PRICEEACH IS NOT NULL
AND ORDERLINENUMBER IS NOT NULL 
AND SALES IS NOT NULL
AND ORDERDATE IS NOT NULL

	
-- thêm cột 
ALTER TABLE public.sales_dataset_rfm_prj
ADD COLUMN contactfirstname varchar	
UPDATE public.sales_dataset_rfm_prj
SET contactfirstname= LEFT (contactfullname, POSITION('-' IN contactfullname)-1)

	
ALTER TABLE public.sales_dataset_rfm_prj
ADD COLUMN contactlastname varchar
INSERT INTO public.sales_dataset_rfm_pr
	
