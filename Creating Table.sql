CREATE DATABASE e_Commerce;
USE e_Commerce;
CREATE TABLE Purchaser
(
    purchaser_id INT NOT NULL
    ,name VARCHAR(30)
    ,phoneNumber VARCHAR(30)
    ,PRIMARY KEY(purchaser_id)
);
CREATE TABLE Consumer 
(
    purchaser_id INT NOT NULL
    ,PRIMARY KEY(purchaser_id)
    ,FOREIGN KEY(purchaser_id) REFERENCES purchaser(purchaser_id)
);
CREATE TABLE Vendor
(
    purchaser_id INT NOT NULL
    ,PRIMARY KEY(purchaser_id)
    ,FOREIGN KEY(purchaser_id) REFERENCES purchaser(purchaser_id)
);
CREATE TABLE Banking_Card 
(
    cardNumber VARCHAR(20) NOT NULL
    ,runoutDate DATE
    ,bank VARCHAR(30)
    ,PRIMARY KEY(cardNumber)
);
CREATE TABLE Credit_Card 
(   cardNumber VARCHAR(20) NOT NULL
    ,purchaser_id INT NOT NULL
    ,organization VARCHAR(30)
    ,PRIMARY KEY(cardNumber)
    ,FOREIGN KEY(cardNumber) REFERENCES Banking_Card(cardNumber)
    ,FOREIGN KEY(purchaser_id) REFERENCES purchaser(purchaser_id)
);
CREATE TABLE Debit_Card 
(
    cardNumber VARCHAR(20) NOT NULL
    ,purchaser_id INT NOT NULL
    ,PRIMARY KEY(cardNumber)
    ,FOREIGN KEY(cardNumber) REFERENCES Banking_Card(cardNumber)
    ,FOREIGN KEY(purchaser_id) REFERENCES purchaser(purchaser_id)
);
CREATE TABLE Shipping_Address 
(
    address_id INT NOT NULL
    ,purchaser_id INT NOT NULL
    ,name VARCHAR(100)
    ,contact_PhoneNumber VARCHAR(15)
    ,territory VARCHAR(100)
    ,city VARCHAR(100)
    ,streetaddress VARCHAR(100)
    ,postalCode VARCHAR(15)
    ,PRIMARY KEY(address_id)
    ,FOREIGN KEY(purchaser_id) REFERENCES Purchaser(purchaser_id)
);
CREATE TABLE Stockpile 
(
    sp_id INT NOT NULL
    ,name VARCHAR(30)
    ,territory VARCHAR(100)
    ,city VARCHAR(100)
    ,streetaddress VARCHAR(100)
    ,customertier INT
    ,startingTime DATE
    ,PRIMARY KEY(sp_id)
);
CREATE TABLE Trademark 
(
    brand_Name VARCHAR(30) NOT NULL
    ,PRIMARY KEY (brand_Name)
);
CREATE TABLE Products 
(
    pro_id INT NOT NULL
    ,sp_id INT NOT NULL
    ,brand VARCHAR(70) NOT NULL
    ,name VARCHAR(100)
    ,type VARCHAR(70)
    ,referenceNumber VARCHAR(50)
    ,color VARCHAR(50)
    ,amount INT
    ,price INT
    ,PRIMARY KEY(pro_id)
    ,FOREIGN KEY(sp_id) REFERENCES Stockpile(sp_id)
    ,FOREIGN KEY(brand) REFERENCES Trademark(brand_Name)
);
CREATE TABLE OrderItems
(
    item_id INT NOT NULL
    ,pro_id INT NOT NULL
    ,price INT
    ,creation_Time DATE
    ,PRIMARY KEY(item_id)
    ,FOREIGN KEY(pro_id) REFERENCES Products(pro_id)
);
CREATE TABLE Onlineorders 
(
    order_Number INT NOT NULL
    ,payment_State VARCHAR(20)
    ,creation_Time DATE
    ,whole_Amount INT
    ,PRIMARY KEY (order_Number)
);
CREATE TABLE Servicehub 
(
    sh_id INT NOT NULL
    ,streetaddress VARCHAR(100)
    ,city VARCHAR(30)
    ,territory VARCHAR(100)
    ,startingTime VARCHAR(50)
    ,endingTime VARCHAR(50)
    ,PRIMARY KEY(sh_id)
);
CREATE TABLE Feedback 
(
    creationTime DATE NOT NULL
    ,purchaser_id INT NOT NULL
    ,pro_id INT NOT NULL
    ,grade FLOAT
    ,content VARCHAR(1000)
    ,PRIMARY KEY(creationTime,purchaser_id,pro_id)
    ,FOREIGN KEY(purchaser_id) REFERENCES Consumer(purchaser_id)
    ,FOREIGN KEY(pro_id) REFERENCES Products(pro_id)
);
CREATE TABLE Add_to_wishlist 
(
    purchaser_id INT NOT NULL
    ,pro_id INT NOT NULL
    ,addTime DATE
    ,volume INT
    ,PRIMARY KEY (purchaser_id,pro_id)
    ,FOREIGN KEY(purchaser_id) REFERENCES Consumer(purchaser_id)
    ,FOREIGN KEY(pro_id) REFERENCES Products(pro_id)
);
CREATE TABLE Contain 
(
    order_Number INT NOT NULL
    ,item_id INT NOT NULL
    ,volume INT
    ,PRIMARY KEY (order_Number,item_id)
    ,FOREIGN KEY(order_Number) REFERENCES Onlineorders(order_Number)
    ,FOREIGN KEY(item_id) REFERENCES OrderItems(item_id)
);
CREATE TABLE Payments 
(
    order_Number INT NOT NULL
    ,credit_cardNumber VARCHAR(30) NOT NULL
    ,pay_Time DATE
    ,PRIMARY KEY(order_Number,credit_cardNumber)
    ,FOREIGN KEY(order_Number) REFERENCES Onlineorders(order_Number)
    ,FOREIGN KEY(credit_cardNumber) REFERENCES Credit_Card(cardNumber)
);
CREATE TABLE Ship_To 
(
    address_id INT NOT NULL
    ,order_Number INT NOT NULL
    ,Time_Delivered DATE
    ,PRIMARY KEY(address_id,order_Number)
    ,FOREIGN KEY(address_id) REFERENCES Shipping_Address(address_id)
    ,FOREIGN KEY(order_Number) REFERENCES Onlineorders(order_Number)
);
CREATE TABLE Oversee 
(
    purchaser_id INT NOT NULL
    ,sp_id INT NOT NULL
    ,initiate_Time DATE
    ,PRIMARY KEY(purchaser_id,sp_id)
    ,FOREIGN KEY(purchaser_id) REFERENCES Vendor(purchaser_id)
    ,FOREIGN KEY(sp_id) REFERENCES Stockpile(sp_id)
);
CREATE TABLE After_Sales_Care 
(
    brand_Name VARCHAR(30) NOT NULL
    ,sh_id INT NOT NULL
    ,PRIMARY KEY(brand_Name, sh_id)
    ,FOREIGN KEY(brand_Name) REFERENCES Trademark(brand_Name)
    ,FOREIGN KEY(sh_id) REFERENCES Servicehub(sh_id)
    );