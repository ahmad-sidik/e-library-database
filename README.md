# E library Management System

SQL database implementation of e-library workflow

# Database Specification

* Purpose
* Business Rules
* Design Requirements
* ERD diagram

## Database's Purpose

* To design and maintain books, multiple libraries, library members (users), loans, holding, and rating' books
* It includes categories of books, where books are available, and the data privacy of users.
* Reports are generated to visualize the data in a better manner.

## Business Rules

* Each library has a unique name.
* A book can be stored in multiple libraries.
* A book consist of title, author, publisher, publish date, category, and ISBN.
* A user consist of a unique username, a unique email, password, and name.
* Users can loan books from a library as long as the books are available.
* Users can loan a maximum of two books at a time.
* Users have 2 weeks to return books.
* Users who want to loan books but books are not available can hold books for one week.
* Users can hold a maximum of two books at a time.
* After users loan books, they can rate the books that they loaned.
* Loaners can rate books from 1 to 10.

# Design Requirements

* Using Crow' notation.
* 
test



