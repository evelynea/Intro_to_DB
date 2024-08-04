-- Use the alx_book_store database
USE alx_book_store;

-- Create the 'Authors' table
CREATE TABLE IF NOT EXISTS Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(255) NOT NULL,
    bio TEXT
);

-- Create the 'books' table
CREATE TABLE IF NOT EXISTS Books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    unitPrice DECIMAL(10, 2) NOT NULL,
    thumbnail VARCHAR(255),
    author_id INT,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- Create the 'customers' table
CREATE TABLE IF NOT EXISTS customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(15),
    address TEXT
);

-- Create the 'orders' table
CREATE TABLE IF NOT EXISTS Oorders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

-- Create the 'Order_details' table
CREATE TABLE IF NOT EXISTS Order_details (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Oorders(id),
    FOREIGN KEY (book_id) REFERENCES Books(id)
);
