-- List all_purchaser names and their cities

SELECT p.purchaser_id,p.name,sa.city
FROM Purchaser AS p
JOIN shipping_address AS sa ON p.name=sa.name;

-- Find all banking cards issued by ‘HDFC Bank’

SELECT cardNumber,runoutDate
FROM Banking_Card
WHERE Bank='HDFC Bank';


-- update the phone number of shipping_address same as purchaser

UPDATE Shipping_Address AS s, purchaser AS p
SET s.contact_PhoneNumber =p.phoneNumber
WHERE s.purchaser_id=p.purchaser_id;

-- Get details 

SELECT * FROM Shipping_Address;


-- Get all debit card number and the names of the purchasers who own them

SELECT cardNumber,name
FROM Debit_Card AS dc
JOIN purchaser AS p ON dc.purchaser_id=p.purchaser_id;



-- List all shipping address for purchaser_id=5

SELECT streetaddress,city,postalcode
FROM shipping_address 
WHERE purchaser_id=5;


-- Display the purchaser id and name of all purchasers who have a debit card and show their credit card details if available

SELECT p.purchaser_id,p.name
FROM Purchaser AS p 
LEFT JOIN Credit_Card AS cc ON p.purchaser_id= cc.purchaser_id
JOIN Debit_Card AS dc ON p.purchaser_id = dc.purchaser_id;


-- Get purchaser details along with their bank name for all credit card holgers

SELECT p.name,bc.bank,cc.organization
FROM purchaser AS p 
JOIN Credit_Card AS cc ON p.purchaser_id= cc.purchaser_id
JOIN Banking_Card AS bc ON cc.cardNumber= bc.cardNumber;


-- Find the total number of shipping address per city

SELECT city, COUNT(*) AS total_address
FROM Shipping_address
GROUP BY city;


-- Find all purchaser whose debit_card expires before 20228

 SELECT DISTINCT p.name,bc.runoutDate
 FROM Debit_Card as dc
 JOIN Banking_Card AS bc ON dc.cardNumber=bc.cardNumber
 JOIN purchaser as p ON dc.purchaser_id = p.purchaser_id
 WHERE bc.runoutDate < '2028-01-01';


-- List the bank names with the total number of cards issued(cc+dc)

SELECT bc.bank,COUNT(*) AS total_cards
FROM Banking_Card AS bc
LEFT JOIN Credit_Card AS cc ON bc.cardNumber = cc.cardNumber
LEFT JOIN Debit_Card AS dc ON bc.cardNumber = dc.cardNumber
GROUP BY bc.bank;


-- Find the maximum and minimum card expiry dates for each bank

SELECT bank, MIN(runoutDate) AS earliest_expiry, MAX(runoutDate) AS latest_expiry
FROM Banking_Card
GROUP BY bank;

-- Find the average number of cards per purchaser

SELECT AVG(card_count) AS avg_cards
FROM (
    SELECT purchaser_id, COUNT(DISTINCT cardNumber) AS card_count
    FROM (
        SELECT purchaser_id, cardNumber FROM Credit_Card
        UNION
        SELECT purchaser_id, cardNumber FROM Debit_Card
    ) AS all_cards
    GROUP BY purchaser_id
) AS card_stats;
