CREATE TABLE "User_Registration" ("UID" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "First_Name" VARCHAR (55), "Last_Name" VARCHAR (55), "Phone_Num" VARCHAR (55), "Date_of_Birth" VARCHAR (55), "Gender" VARCHAR (55), "Email_Id" VARCHAR (55), "Shipping_Address" VARCHAR (55), "Permanent_Address" VARCHAR (55), "Regd_status" VARCHAR (55), "Tin_Num" VARCHAR (55), "ST_Num" VARCHAR (55), "CST_Num" VARCHAR (55), "PAN_Num" VARCHAR (55), "User_type" VARCHAR);
CREATE TABLE "User_Category" ("User_Category_Id" INTEGER PRIMARY KEY AUTOINCREMENT, "User_Category_Name" CHAR (25))
CREATE TABLE "Product_Category" ("Product_Catg_Id" VARCHAR (100) PRIMARY KEY, "UID_Seller" INTEGER  REFERENCES "User_Registration" ("UID"), "User_Category_Id" INTEGER REFERENCES "User_Category" ("User_Category_Id") , "Product_Sub_Catg_Id" VARCHAR (100), "Product_Catg_Name" VARCHAR (100), "Product_Sub_Catg_Name" VARCHAR (250));
CREATE TABLE "price_detail" ("price_id" INTEGER PRIMARY KEY AUTOINCREMENT, "uid_seller" INTEGER , "user_category_id" INTEGER , "product_id" INTEGER, "product_price" DOUBLE);
CREATE TABLE "product_detail" ("product_id" INTEGER PRIMARY KEY AUTOINCREMENT, "uid_seller" INTEGER , "product_category_id" TEXT, "product_sub_catg_id" VARCHAR (100), "product_price_id" VARCHAR (100), "Product_Img_Id1" LONGBLOB, "Product_Img_Id2" LONGBLOB, "Product_Img_Id3" LONGBLOB, "product_min_age_usage" CHAR (20), "product_max_age_usage" CHAR (20), "product_ideal_for" VARCHAR (50), "product_name" VARCHAR (50), "product_desc" VARCHAR (200), "product_size" VARCHAR (20), "product_exp_date" DATE, "product_mfc_name" VARCHAR (100), "product_mfc_country" VARCHAR (200), "product_min_qty" VARCHAR (20), "product_user_age_grp" VARCHAR (25), "product_dom_warranty" VARCHAR (100), "product_intl_warranty" VARCHAR (100), "product_warranty_summary" VARCHAR (100), "product_color" VARCHAR (50), "product_Style" VARCHAR (50), "product_form_factor" VARCHAR (50), "product_display_status" VARCHAR (25), "product_enroll_date" DATE, "product_assembly_reqd" VARCHAR (20), "product_width" INTEGER (30), "product_height" INTEGER (30), "Product_Depth" INTEGER (30), "product_weight" INTEGER (30), "product_othr_feature" VARCHAR (200), "product_video_url" VARCHAR (200), "product_key_feature" VARCHAR (200), "product_pack_size" VARCHAR (50), "product_battery_type" VARCHAR (200), "product_no_of_battery" VARCHAR (200), "product_hazard_status" VARCHAR (200), "product_hazard_detail" VARCHAR (200));
CREATE TABLE "order_detail_temp" ("order_id" INTEGER PRIMARY KEY AUTOINCREMENT, "uid_buyer" INTEGER, "product_id" VARCHAR (100) REFERENCES "product_detail" ("product_id"), "price_id" INTEGER , "order_qty" INTEGER , "order_date" DATE, "order_price" INTEGER , "order_tot_amount" INTEGER, "order_status" VARCHAR (40), "order_dispatch_date" DATE, "order_track_num" INTEGER , "Order_Receive_Date" DATE, "Order_Status_Status" VARCHAR (100), "order_qty_type" varchar (20), "uid_seller" VARCHAR, "order_ref_id" integer);

insert into order_detail_temp (uid_buyer,product_id,price_id,order_qty,order_date,order_price,order_tot_amount,order_status,uid_seller)
       values (1942,1,2,4,'29-May-2015',200,800,'New',1002);

insert into order_detail_temp (uid_buyer,product_id,price_id,order_qty,order_date,order_price,order_tot_amount,order_status,uid_seller)
       values (1942,1,2,3,'29-May-2015',300,900,'New',1002);


insert into order_detail_temp (uid_buyer,product_id,price_id,order_qty,order_date,order_price,order_tot_amount,order_status,uid_seller) values (?,?,?,?,?,?,?,?,?)

uid_buyer: $scope.buyerId,
product_id: value.product_id,
price_id: 2,
order_qty: value.product_min_qty,
order_date: new Date("MM/DD/YY"),
order_price: 750,
order_tot_amount: 750,
order_status: "new",
uid_seller: 1001


//Get all sellers for a given Buyer ID

select uid,first_name,last_name,user_type,regd_status from user_detail ud , trans_connect tc 
where  tc.buyer_uid= 101  and ud.uid = tc.uid_seller and ud.user_type="seller";

//Get All product Categories

select uid_seller,seller_skuid,product_catg_id,product_sub_catg_id,product_catg_name,product_sub_catg_name from prod_category where uid_seller=103 order by product_catg_id,product_sub_catg_id;

//Get all products associated with filters
select  pd.product_id,pd.product_catg_id,product_sub_catg_id,pd.product_name,product_desc,product_min_qty,product_price, pd.price_id,Product_Img_Id1 from prod_detail  pd , price_detail prd where pd.uid_seller=103 and product_sub_catg_id='AC01' and pd.product_id  = prd.product_id and pd.price_id  = prd.price_id;


select  pd.product_id,pd.product_catg_id,product_sub_catg_id,pd.product_name,product_desc,product_min_qty from prod_detail  pd where pd.uid_seller=103 and product_sub_catg_id='AC01' and pd.product_id  = prd.product_id and pd.price_id  = prd.price_id


CREATE TABLE order_detail_temp ("order_id" INTEGER PRIMARY KEY  NOT NULL , "uid_buyer" INTEGER NOT NULL , "uid_seller" INTEGER NOT NULL , "product_id" INTEGER NOT NULL , "price_id" VARCHAR NOT NULL , "order_qty" INTEGER NOT NULL , "order_date" DATETIME NOT NULL , "order_price" INTEGER NOT NULL , "order_tot_amount" INTEGER NOT 
NULL , "order_status" VARCHAR NOT NULL , "order_dispatch_date" DATETIME , "order_track_num" INTEGER , "order_qty_type" VARCHAR, "order_fulfil_status" VARCHAR, "order_receive_date" DATETIME , "order_ref_id" VARCHAR,
FOREIGN KEY(Product_Id) REFERENCES Product_detail(Product_Id),
FOREIGN KEY(Price_Id) REFERENCES Price_detail(Price_Id));

