# Introduction to Smart Contracts (Nearx)

Hello, everyone!

This repository is an integral part of my learning journey through the course "Introduction to Smart Contracts" from Nearx.

It is here where I document the projects and smart contracts that I develop while exploring the fundamentals and advanced concepts of this technology.

## About This Repository

In this course-focused repository, you'll find a curated collection of my work, showcasing the progress I've made since beginning the "Introduction to Smart Contracts" course. Each project and smart contract here is a testament to the skills I've honed and the knowledge I've gained in the realm of blockchain and smart contract technology.

## Goals and Objectives

The primary goals of this repository are:
* To build a solid foundation in smart contract development.
* To document my learning process, making it easier for others to learn from my experiences.
* To create a portfolio of work that showcases my skills and understanding of blockchain technology.

## Projects and Contracts

### RealState project

This project is a blockchain-based solution to streamline property transactions, making them more transparent, secure, and efficient. It consists of two smart contracts: RealState and Property.

#### Key Features and Functions:

##### RealState Contract:
* Property Listing: Facilitates the addition of new properties to the market.
* Owner Privileges: Ensures only the owner of the contract can add new properties.
* Dynamic Array of Properties: Maintains a list of all properties available for sale.

##### Property Contract:
* Sale Approval Mechanism: Allows brokers to approve or revoke sale approvals for potential buyers.
* Secure Purchase Transactions: Manages property purchases, ensuring only approved buyers can buy and the payment meets the property price.
* Broker Commission Calculation: Implements a dynamic commission system, which can vary based on predefined conditions.

#### Learning Highlights

* Withdraw Pattern: To prevent reentrancy attacks and enhance the contract's security.
* Access Control: Showcases the use of modifiers for role-based functionality.
* Interface Implementation: Demonstrates the use of interfaces for contract interaction.
* Event Logging: Uses events to emit notifications upon significant actions like property addition and sale.
* Financial Logic: Implements complex financial transactions, including commission calculation and fund distribution.


### SupplyChainStore Smart Contract

This smart contract, named SupplyChainStore, is designed for a simplified supply chain scenario, specifically focused on selling products with age-restricted access. It's written in Solidity and demonstrates various key concepts in smart contract development, such as state management, conditional logic, error handling, and Ether transactions.

#### Key Features and Functions:
1. **Age-Restricted Access**: Implements an age verification system to ensure that only users above a specified age (18 years) can access certain functionalities, reflecting compliance with age-related restrictions.
2. **User Status Tracking**: Employs an enumerated type (enum) to track and manage the various states of user interaction within the contract, such as pending, logged in, made a purchase, or received a product.
3. **Secure String Comparison**: Utilizes cryptographic functions to safely compare strings, an essential feature for validating product names in transaction processes.
4. **Ether Transactions and Balance Management**: Designed to handle Ether transactions, allowing users to purchase products with Ether. It includes mechanisms for managing user balances and transferring funds based on transaction outcomes.
5. **Product Management**: Capable of handling multiple product listings, with the architecture to support a variety of products, each requiring different Ether values for transactions.
6. **Condition-Based Execution**: Incorporates condition checks (like user approval status and correct Ether amount) before executing purchase-related operations, ensuring transactions adhere to predefined rules.
7. **Custom Modifiers for Validation**: Uses custom modifiers to streamline validation processes, like checking product validity, which enhances code reusability and contract security.
8. **Error Handling and Reverts**: Implements error handling mechanisms, using reverts for situations where user inputs or actions do not meet the contract's requirements, ensuring the integrity and proper flow of operations.
