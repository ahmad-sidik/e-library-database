CREATE TABLE libraries (
    library_id INT NOT NULL UNIQUE PRIMARY KEY,
    library_name VARCHAR(255) NOT NULL UNIQUE,
    library_location VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE books (
    book_id INT NOT NULL UNIQUE PRIMARY KEY,
    title VARCHAR(500) NOT NULL,
    author VARCHAR(500) NOT NULL,
    publisher VARCHAR(500) NOT NULL,
    publish_date DATE,
    ISBN VARCHAR(500)
);

CREATE TABLE users (
    user_id INT NOT NULL UNIQUE PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE book_categories (
    book_id INT NOT NULL UNIQUE PRIMARY KEY,
    categories TEXT[],
    CONSTRAINT fk_book_id FOREIGN KEY (book_id) REFERENCES books(book_id)
);

CREATE TABLE book_availability (
    book_availability_id INT NOT NULL UNIQUE PRIMARY KEY,
    library_id INT NOT NULL,
    book_id INT NOT NULL,
    copies INT DEFAULT 0,
    CONSTRAINT fk_library_id FOREIGN KEY (library_id) REFERENCES libraries(library_id),
    CONSTRAINT fk_book_id FOREIGN KEY (book_id) REFERENCES books(book_id)
);

CREATE TABLE loans (
    loan_id INT NOT NULL UNIQUE PRIMARY KEY,
    user_id INT NOT NULL,
    book_id INT NOT NULL,
    book_availability_id INT NOT NULL,
    total_copies INT NOT NULL CHECK(total_copies >= 1 AND total_copies <= 2),
    loan_date TIMESTAMP NOT NULL,
    due_date TIMESTAMP NOT NULL,
    return_date TIMESTAMP NOT NULL,
    CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users(user_id),
    CONSTRAINT fk_book_id FOREIGN KEY (book_id) REFERENCES books(book_id),
    CONSTRAINT fk_book_availability_id FOREIGN KEY (book_availability_id) REFERENCES book_availability(book_availability_id)
);

CREATE TABLE holds (
    hold_id INT NOT NULL UNIQUE PRIMARY KEY,
    user_id INT NOT NULL,
    book_id INT NOT NULL,
    book_availability_id INT NOT NULL,
    total_copies INT NOT NULL CHECK(total_copies >= 1 AND total_copies <= 2),
    hold_date TIMESTAMP NOT NULL,
    exp_date TIMESTAMP NOT NULL,
    CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users(user_id),
    CONSTRAINT fk_book_id FOREIGN KEY (book_id) REFERENCES books(book_id),
    CONSTRAINT fk_book_availability_id FOREIGN KEY (book_availability_id) REFERENCES book_availability(book_availability_id)
);

CREATE TABLE rating (
    rating_id INT NOT NULL UNIQUE PRIMARY KEY,
    user_id INT NOT NULL,
    book_id INT NOT NULL,
    book_availability_id INT NOT NULL,
    rating_date TIMESTAMP NOT NULL,
    rating INT DEFAULT 0,
    CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users(user_id),
    CONSTRAINT fk_book_id FOREIGN KEY (book_id) REFERENCES books(book_id),
    CONSTRAINT fk_book_availability_id FOREIGN KEY (book_availability_id) REFERENCES book_availability(book_availability_id)
);


