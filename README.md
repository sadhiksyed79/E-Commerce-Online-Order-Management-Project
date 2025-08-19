<p align="center">
  <img src="logo.png" alt="E-Commerce OMS Logo" width="200"/>
</p>

# 🛒 E-Commerce Online Order Management System (OMS)📦

A **relational SQL database project** designed to handle the **complete lifecycle of online orders** — from purchaser registration, product inventory, payments, and shipping, to post-sales support.  


---

## 📖 Abstract

The project implements a **robust E-Commerce Order Management System (OMS)** using a relational database schema.  
It supports:

- ✅ Accurate user profiling & payment processing (credit/debit cards, banking details).  
- ✅ Real-time inventory tracking across multiple warehouses.  
- ✅ Smooth order processing with item-level details & linked shipping info.  
- ✅ Post-purchase engagement (Feedback, Wishlist, After-Sales Care).  

This schema ensures **data integrity**, provides **efficient workflows**, and lays the foundation for a scalable **modern e-commerce platform**.

---

## 🎯 Project Purpose

The purpose of this project is to **design and implement a structured SQL-based database** that replicates the backend of an e-commerce platform.  

- To simulate **real-world order workflows** from purchase to delivery.  
- To provide a **hands-on understanding** of database design, normalization, and relational integrity.  
- To demonstrate how **SQL queries** can solve practical business problems like order tracking, payment management, and stock monitoring.  
- To build a **scalable foundation** that can be extended into a full-fledged e-commerce system with a UI and advanced analytics.  

---

## 👨‍💻 My Role

As the project developer, I was responsible for:

- 📌 **Requirement Analysis** – Identifying core entities (Purchaser, Vendor, Orders, Products, Payments, Shipping).  
- 📌 **Database Design** – Creating ER Diagrams, defining relationships, and ensuring normalization.  
- 📌 **Schema Implementation** – Writing SQL DDL commands to build 20+ tables with proper constraints (PKs, FKs).  
- 📌 **Data Population** – Inserting sample records for testing and validation.  
- 📌 **Query Writing** – Implementing business logic through SQL queries (e.g., card expiry checks, shipping counts, order tracking).  
- 📌 **Documentation** – Preparing a detailed project report with methodology, design, queries, and recommendations.  

---

## ⚡ Features

- Customer & Payment Handling (Purchaser, Consumer, Vendor, Credit/Debit Cards).  
- Order Management (Orders, OrderItems, Contain).  
- Inventory & Fulfillment (Products, Stockpile, Shipping Address, Ship_To).  
- Customer Experience (Feedback, Wishlist, After-Sales Care, Oversee).  
- Query support for analytics & reports (bank-wise cards, expiry dates, avg cards per user, shipping stats).  

---

## 🛠️ Database Design

### Key Components
- **20+ Entities** including Purchaser, Vendor, Products, Orders, Payments, Feedback, Shipping, Service Hubs.  
- **ER Diagram** mapping relationships (Purchaser → Orders → Payments → Shipping).  
- **Normalization** applied for eliminating redundancy & maintaining integrity.  

---

## 💻 Implementation

### Tools & Technologies
- **Database**: MySQL  
- **Language**: SQL (DDL & DML)  

### Steps
1. Create database & tables using provided schema.  
2. Insert sample data for testing.  
3. Run SQL queries for use cases.  

---

## 📂 Example Queries

- List all purchasers and their cities.  
- Find all banking cards issued by **HDFC Bank**.  
- Get debit card owners with their linked credit cards.  
- Count shipping addresses per city.  
- Find **min/max card expiry dates** per bank.  
- Compute **average number of cards per purchaser**.  

---


