-- ============================
-- Insert 5 Categories
-- ============================

INSERT INTO category (id, name, description)
VALUES
    (nextval('category_seq'), 'Electronics', 'Electronic devices and gadgets'),
    (nextval('category_seq'), 'Books', 'Books and printed media'),
    (nextval('category_seq'), 'Clothing', 'Apparel and fashion items'),
    (nextval('category_seq'), 'Home', 'Home appliances and furniture'),
    (nextval('category_seq'), 'Sports', 'Sports and fitness equipment');

-- ============================
-- Electronics (5 products)
-- ============================

INSERT INTO product (id, name, description, available_quantity, price, category_id)
VALUES
    (nextval('product_seq'), 'Laptop', 'High performance laptop', 15, 1500.00,
     (SELECT id FROM category WHERE name = 'Electronics')),
    (nextval('product_seq'), 'Smartphone', 'Latest model smartphone', 30, 900.00,
     (SELECT id FROM category WHERE name = 'Electronics')),
    (nextval('product_seq'), 'Tablet', '10-inch tablet', 20, 600.00,
     (SELECT id FROM category WHERE name = 'Electronics')),
    (nextval('product_seq'), 'Smartwatch', 'Wearable smart device', 25, 250.00,
     (SELECT id FROM category WHERE name = 'Electronics')),
    (nextval('product_seq'), 'Headphones', 'Noise cancelling headphones', 40, 180.00,
     (SELECT id FROM category WHERE name = 'Electronics'));

-- ============================
-- Books (5 products)
-- ============================

INSERT INTO product (id, name, description, available_quantity, price, category_id)
VALUES
    (nextval('product_seq'), 'Java Book', 'Java programming guide', 50, 45.00,
     (SELECT id FROM category WHERE name = 'Books')),
    (nextval('product_seq'), 'Spring Boot Book', 'Spring Boot in depth', 35, 55.00,
     (SELECT id FROM category WHERE name = 'Books')),
    (nextval('product_seq'), 'Database Systems', 'Intro to databases', 40, 60.00,
     (SELECT id FROM category WHERE name = 'Books')),
    (nextval('product_seq'), 'Clean Code', 'Best coding practices', 45, 50.00,
     (SELECT id FROM category WHERE name = 'Books')),
    (nextval('product_seq'), 'Design Patterns', 'Software design patterns', 30, 65.00,
     (SELECT id FROM category WHERE name = 'Books'));

-- ============================
-- Clothing (5 products)
-- ============================

INSERT INTO product (id, name, description, available_quantity, price, category_id)
VALUES
    (nextval('product_seq'), 'T-Shirt', 'Cotton T-Shirt', 100, 20.00,
     (SELECT id FROM category WHERE name = 'Clothing')),
    (nextval('product_seq'), 'Jeans', 'Blue denim jeans', 60, 45.00,
     (SELECT id FROM category WHERE name = 'Clothing')),
    (nextval('product_seq'), 'Jacket', 'Winter jacket', 30, 120.00,
     (SELECT id FROM category WHERE name = 'Clothing')),
    (nextval('product_seq'), 'Sneakers', 'Casual sneakers', 50, 85.00,
     (SELECT id FROM category WHERE name = 'Clothing')),
    (nextval('product_seq'), 'Cap', 'Baseball cap', 70, 15.00,
     (SELECT id FROM category WHERE name = 'Clothing'));

-- ============================
-- Home (5 products)
-- ============================

INSERT INTO product (id, name, description, available_quantity, price, category_id)
VALUES
    (nextval('product_seq'), 'Microwave', '800W microwave oven', 10, 250.00,
     (SELECT id FROM category WHERE name = 'Home')),
    (nextval('product_seq'), 'Vacuum Cleaner', 'Powerful vacuum cleaner', 20, 300.00,
     (SELECT id FROM category WHERE name = 'Home')),
    (nextval('product_seq'), 'Coffee Maker', 'Automatic coffee machine', 15, 180.00,
     (SELECT id FROM category WHERE name = 'Home')),
    (nextval('product_seq'), 'Desk Lamp', 'LED desk lamp', 40, 45.00,
     (SELECT id FROM category WHERE name = 'Home')),
    (nextval('product_seq'), 'Sofa', 'Comfortable 3-seat sofa', 5, 850.00,
     (SELECT id FROM category WHERE name = 'Home'));

-- ============================
-- Sports (5 products)
-- ============================

INSERT INTO product (id, name, description, available_quantity, price, category_id)
VALUES
    (nextval('product_seq'), 'Running Shoes', 'Lightweight running shoes', 25, 120.00,
     (SELECT id FROM category WHERE name = 'Sports')),
    (nextval('product_seq'), 'Dumbbells', 'Adjustable dumbbells set', 30, 90.00,
     (SELECT id FROM category WHERE name = 'Sports')),
    (nextval('product_seq'), 'Yoga Mat', 'Non-slip yoga mat', 50, 35.00,
     (SELECT id FROM category WHERE name = 'Sports')),
    (nextval('product_seq'), 'Tennis Racket', 'Professional tennis racket', 15, 140.00,
     (SELECT id FROM category WHERE name = 'Sports')),
    (nextval('product_seq'), 'Football', 'Official size football', 60, 25.00,
     (SELECT id FROM category WHERE name = 'Sports'));
