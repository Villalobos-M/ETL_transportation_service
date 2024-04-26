-- Active: 1713537195020@@127.0.0.1@3306@transportation_service_db
-- Active: 1713537195020@@127.0.0.1@3306@transportation_service_db
use transportation_service_db;

start transaction;

insert into locations
(country, currency)
values 
  ('United States', 'US Dollar'),
  ('Ecuador', 'US Dollar'),
  ('Panama', 'US Dollar')
;

insert into prices
(location_id, unit, price)
values
  (1, 'Mile', '2.00'),
  (2, 'Kilometer', '0.70'),
  (3, 'Kilometer', '1.00')
;

insert into languages
(language)
values
  ('English'),
  ('Spanish')
;

insert into users
(first_name, last_name, phone_number, email, identity_number, location_id, language_id, rating)
values
  ('Harry', 'Potter', '2124567890', 'harry.potter@example.com', '123456789', 1, 1, 0),
  ('Ronald', 'Weasley', '2134880615', 'ronald.weasley@example.com', '987654321', 1, 1, 0),
  ('Hermione', 'Granger', '2316704389', 'hermione.granger@example.com', '123459876', 1, 1, 0),
  ('Juan', 'Perez', '0987654321', 'juan.perez@example.com', '1718161514', 2, 2, 0),
  ('Pedro', 'Montenegro', '0999888777', 'pedro.montenegro@example.com', '1122334455', 2, 2, 0),
  ('Jose', 'Valdez', '8338148', 'jose.valdez@example.com', '89052306', 3, 2, 0),
  ('Jorge', 'Sanchez', '8355456', 'jorge.sanchez@example.com', '88070623', 3, 2, 0)
;

insert into drivers
(first_name, last_name, phone_number, email, identity_number, location_id, language_id, rating, driving_license_number)
values
  ('Dunald', 'Trump', '2124561540', 'donald.trump@example.com', '123458090', 1, 1, 0, '123458090'),
  ('Joe', 'Biden', '2134887020', 'joe.bideny@example.com', '987654545', 1, 1, 0, '987654545'),
  ('Elon', 'Musk', '2316701123', 'elon.musk@example.com', '123458989', 1, 1, 0, '123458989'),
  ('Marco', 'Solis', '0987658765', 'marco.solis@example.com', '1718163456', 2, 2, 0, '1718163456'),
  ('David', 'Ramirez', '0999899725', 'david.ramirez@example.com', '1122339110', 2, 2, 0, '1122339110'),
  ('Miguel', 'Duran', '8336723', 'miguel.duran@example.com', '89054533', 3, 2, 0, '89054533'),
  ('Carlos', 'Alvarez', '8356712', 'carlos.alvarez@example.com', '88073740', 3, 2, 0, '88073740')
;

insert into vehicles
(brand, model, color, registration, year, tax_token, insurance_due_date, driver_id)
values
  ('Toyota', 'Corolla', 'Black', '6LNE878', 2014, null, STR_TO_DATE('18-04-2025', '%d-%m-%Y'), 1),
  ('Nissan', 'Versa', 'White', '7PEN191', 2013, null, STR_TO_DATE('21-05-2025', '%d-%m-%Y'), 2),
  ('Mitsubishi', 'Lancer', 'Red', '8ABN240', 2015, null, STR_TO_DATE('10-08-2025', '%d-%m-%Y'), 3),
  ('Ford', 'Escape', 'White', 'PBT5331', 2019, null, STR_TO_DATE('11-09-2024', '%d-%m-%Y'), 4),
  ('Honda', 'Acura', 'Blue', 'IBA2425', 2013, null, STR_TO_DATE('11-09-2024', '%d-%m-%Y'), 5),
  ('Kia', 'Rio', 'Green', 'AK0722', 2019, null, STR_TO_DATE('11-09-2024', '%d-%m-%Y'), 6),
  ('Huyndai', 'Elantra', 'Black', 'AA7507', 2021, null, STR_TO_DATE('11-09-2024', '%d-%m-%Y'), 7)
;

insert into discounts
(code, `percentage`, expiration_date, user_id)
values
  ('DXB-TRSD', 25, null, 2),
  ('DXB-84RT', 30, null, 3),
  ('DXB-3A3A', 15, null, 5)
;

insert into payment_types
(type, brand)
values
  ('Credit card', 'Mastercard'),
  ('Credit card', 'Visa'),
  ('Credit card', 'Discover'),
  ('Credit card', 'American Express'),
  ('Gitf card', null),
  ('App cash', null),
  ('Cash', null),
  ('Voucher', null)
;

insert into user_payment_methods
(user_id, payment_type_id, is_default)
values
  (1, 1, 1),
  (1, 2, 0),
  (1, 3, 0),
  (1, 4, 0),
  (1, 5, 0),
  (1, 6, 0),
  (1, 7, 0),
  (1, 8, 0),
  (2, 1, 0),
  (2, 2, 1),
  (2, 3, 0),
  (2, 4, 0),
  (2, 5, 0),
  (2, 6, 0),
  (2, 7, 0),
  (2, 8, 0),
  (3, 1, 0),
  (3, 2, 0),
  (3, 3, 0),
  (3, 4, 0),
  (3, 5, 0),
  (3, 6, 0),
  (3, 7, 1),
  (3, 8, 0),
  (4, 1, 0),
  (4, 2, 0),
  (4, 3, 0),
  (4, 4, 0),
  (4, 5, 0),
  (4, 6, 0),
  (4, 7, 0),
  (4, 8, 1),
  (5, 1, 0),
  (5, 2, 0),
  (5, 3, 0),
  (5, 4, 0),
  (5, 5, 1),
  (5, 6, 0),
  (5, 7, 0),
  (5, 8, 0),
  (6, 1, 0),
  (6, 2, 0),
  (6, 3, 0),
  (6, 4, 0),
  (6, 5, 0),
  (6, 6, 1),
  (6, 7, 0),
  (6, 8, 0),
  (7, 1, 0),
  (7, 2, 0),
  (7, 3, 0),
  (7, 4, 1),
  (7, 5, 0),
  (7, 6, 0),
  (7, 7, 0),
  (7, 8, 0)
;

insert into gift_cards
(code, amount, expiration_date, user_payment_method_id)
values
  ('LJJVL540586', 50, null, 5),
  ('LJJVL540567', 50, null, 13),
  ('LJJVL540598', 50, null, 21),
  ('LJJVL540541', 50, null, 29),
  ('LJJVL540522', 50, null, 37),
  ('LJJVL540515', 50, null, 45),
  ('LJJVL540502', 50, null, 53)
;

insert into app_cash
(amount, user_payment_method_id)
values
  (50, 6),
  (50, 14),
  (50, 22),
  (50, 30),
  (50, 38),
  (50, 46),
  (50, 53)
;

insert into vouchers
(code, expiration_date, user_payment_method_id)
values
  ('LVXTL540586', null, 8),
  ('LVXTL540567', null, 16),
  ('LVXTL540598', null, 24),
  ('LVXTL540541', null, 32),
  ('LVXTL540522', null, 40),
  ('LVXTL540515', null, 48),
  ('LVXTL540502', null, 56)
;

insert into credit_cards
(card_number, card_holder, expiration_date_year, expiration_date_month, cvv, nickname, location_id, user_payment_method_id)
values
  ('1234567890123456', 'John Doe', 2023, 12, '123', NULL, 1, 1),
  ('9876543210987654', 'Jane Smith', 2024, 08, '456', NULL, 1, 2),
  ('5678901234567890', 'Bob Johnson', 2025, 03, '789', NULL, 1, 3),
  ('0987654321098765', 'Alice Williams', 2026, 11, '234', NULL, 2, 4),
  ('6543210987654321', 'Mike Davis', 2027, 07, '567', NULL, 2, 9),
  ('3210987654321098', 'Sarah Wilson', 2028, 02, '890', NULL, 3, 10),
  ('7890123456789012', 'Chris Brown', 2029, 10, '123', NULL, 3, 11),
  ('1234567890123455', 'Lily White', 2030, 05, '345', NULL, 1, 12),
  ('9876543210987655', 'David Lee', 2031, 09, '678', NULL, 1, 17),
  ('5678901234567891', 'Emily Johnson', 2032, 04, '901', NULL, 1, 18),
  ('0987654321098766', 'Daniel Clark', 2033, 08, '234', NULL, 2, 19),
  ('6543210987654322', 'Jessica Miller', 2034, 06, '567', NULL, 2, 20),
  ('3210987654321099', 'Ryan Taylor', 2035, 01, '890', NULL, 3, 25),
  ('7890123456789013', 'Samantha Brown', 2036, 07, '123', NULL, 3, 26),
  ('1234567890123454', 'Michael Johnson', 2037, 03, '456', NULL, 1, 27),
  ('9876543210987653', 'Laura Martinez', 2038, 11, '789', NULL, 1, 28),
  ('5678901234567892', 'Matthew Wilson', 2039, 02, '012', NULL, 1, 33),
  ('0987654321098767', 'Amanda Thompson', 2040, 10, '345', NULL, 2, 34),
  ('6543210987654323', 'Olivia Anderson', 2041, 01, '678', NULL, 2, 35),
  ('3210987654321090', 'William Hernandez', 2042, 12, '901', NULL, 3, 36),
  ('7890123456789014', 'Elizabeth Garcia', 2043, 05, '234', NULL, 3, 41),
  ('1234567890123453', 'Christopher Martinez', 2044, 08, '567', NULL, 1, 42),
  ('9876543210987652', 'Jennifer Thomas', 2045, 09, '890', NULL, 1, 43),
  ('5678901234567893', 'James Rodriguez', 2046, 04, '123', NULL, 1, 44),
  ('0987654321098768', 'Megan Lewis', 2047, 07, '456', NULL, 2, 49),
  ('6543210987654324', 'Natalie Allen', 2048, 02, '789', NULL, 2, 50),
  ('3210987654321091', 'Justin Hall', 2049, 10, '012', NULL, 3, 51),
  ('7890123456789015', 'Nicole King', 2050, 06, '345', NULL,3, 52)
;

insert into trips
(price_id, user_id, driver_id, initial_price, total_distance, final_price, driver_rating, user_rating, start_time, end_time, cancelation_time, reservation_date)
values
  (1, 1, 7, null, null, null, 5, 3, '2024-01-01 00:00:01', '2024-01-01 00:10:01', null, null),
  (1, 2, 6, null, null, null, 4, 4, '2024-01-02 01:10:01', '2024-01-02 01:22:01', null, '2024-01-01 23:15:41'),
  (1, 3, 5, null, null, null, 3, 5, '2024-01-03 02:20:01', '2024-01-03 02:32:01', null, null),
  (2, 4, 4, null, null, null, 5, 4, null, null, '2024-01-04 03:30:01', '2024-01-04 03:44:01'),
  (2, 5, 3, null, null, null, 4, 5, '2024-01-05 04:40:01', '2024-01-05 04:55:01', null, null),
  (3, 6, 2, null, null, null, 3, 4, null, null, '2024-01-06 05:50:01', '2024-01-06 05:05:01'),
  (3, 7, 1, null, null, null, 5, 5, '2024-01-07 06:00:16', '2024-01-07 06:16:16', null, null)
;

insert into stops
(trip_id, pickup_spot, destination, distance, `order`)
values
  (1, point(30.467488, -84.272885), point(30.4578812, -84.2802750), 1.1, 1),
  (1, point(30.4578812, -84.2802750), point(30.454709, -84.287458), 0.6, 2),
  (1, point(30.454709, -84.287458), point(30.455801, -84.292620), 0.5, 3),
  (2, point(30.461151, -84.290091), point(30.456706, -84.288399), 0.4, 1),
  (3, point(30.475612, -84.347916), point(30.468367, -84.335839), 1.2, 1),
  (4, point(-0.132956, -78.495085), point(-0.130664, -78.485822), 2.2, 1),
  (5, point(-0.118449, -78.499170), point(-0.118778, -78.486890), 1.8, 1),
  (6, point(9.030758, -79.528455), point(9.034864, -79.525181), 0.8, 1),
  (7, point(9.043631, -79.525139), point(9.012029, -79.526231), 5, 1)
;

update trips
set 
  initial_price = round((
    select price
    from prices
    where price_id = 1
  ) *
  (
    select sum(distance)
    from stops
    where trip_id = 1
  ), 2),
  total_distance = round((
    select sum(distance)
    from stops
    where trip_id = 1
  ), 1)
where trip_id = 1;

update trips
set 
  initial_price = round((
    select price
    from prices
    where price_id = 1
  ) *
  (
    select sum(distance)
    from stops
    where trip_id = 2
  ), 2),
  total_distance = round((
    select sum(distance)
    from stops
    where trip_id = 2
  ), 2)
where trip_id = 2;

update trips
set 
  initial_price = round((
    select price
    from prices
    where price_id = 1
  ) *
  (
    select sum(distance)
    from stops
    where trip_id = 3
  ), 2),
  total_distance = round((
    select sum(distance)
    from stops
    where trip_id = 3
  ), 2)
where trip_id = 3;

update trips
set 
  initial_price = round((
    select price
    from prices
    where price_id = 2
  ) *
  (
    select sum(distance)
    from stops
    where trip_id = 4
  ), 2),
  total_distance = round((
    select sum(distance)
    from stops
    where trip_id = 4
  ), 2)
where trip_id = 4;

update trips
set 
  initial_price = round((
    select price
    from prices
    where price_id = 2
  ) *
  (
    select sum(distance)
    from stops
    where trip_id = 5
  ), 2),
  total_distance = round((
    select sum(distance)
    from stops
    where trip_id = 5
  ), 2)
where trip_id = 5;

update trips
set 
  initial_price = round((
    select price
    from prices
    where price_id = 3
  ) *
  (
    select sum(distance)
    from stops
    where trip_id = 6
  ), 2),
  total_distance = round((
    select sum(distance)
    from stops
    where trip_id = 6
  ), 2)
where trip_id = 6;

update trips
set 
  initial_price = round((
    select price
    from prices
    where price_id = 3
  ) *
  (
    select sum(distance)
    from stops
    where trip_id = 7
  ), 2),
  total_distance = round((
    select sum(distance)
    from stops
    where trip_id = 7
  ), 2)
where trip_id = 7;

update trips
set 
  final_price = round(initial_price * 1.05, 2),
  total_distance = round(total_distance * 1.05, 1)
where trip_id = 1;

update trips
set 
  final_price = round(initial_price * 1.03, 2),
  total_distance = round(total_distance * 1.03, 1)
where trip_id = 2;

update trips
set 
  final_price = round(initial_price * 1.04, 2),
  total_distance = round(total_distance * 1.04, 1)
where trip_id = 3;

update trips
set 
  final_price = round(initial_price * 1.05, 2),
  total_distance = round(total_distance * 1.05, 1)
where trip_id = 4;

update trips
set 
  final_price = round(initial_price * 1.02, 2),
  total_distance = round(total_distance * 1.02, 1)
where trip_id = 5;

update trips
set 
  final_price = round(initial_price * 1.04, 2),
  total_distance = round(total_distance * 1.04, 1)
where trip_id = 6;

update trips
set 
  final_price = round(initial_price * 1.03, 2),
  total_distance = round(total_distance * 1.03, 1)
where trip_id = 7;

insert into payments
(trip_id, user_payment_method_id, discount_id, sub_total, discount, total, payment_time, refund_time)
values
  (
    1,
    (
      select user_payment_method_id
      from user_payment_methods
      where user_id = 1
      and is_default = 1
    ),
    null,
    (
      select final_price
      from trips
      where trip_id = 1
    ),
    0,
    (
      select final_price
      from trips
      where trip_id = 1
    ),
    (
      select end_time
      from trips
      where trip_id = 1
    ),
    (
      select cancelation_time
      from trips
      where trip_id = 1
    )
  )
;

insert into payments
(trip_id, user_payment_method_id, discount_id, sub_total, discount, total, payment_time, refund_time)
values
  (
    2,
    (
      select user_payment_method_id
      from user_payment_methods
      where user_id = 2
      and is_default = 1
    ),
    1,
    (
      select final_price
      from trips
      where trip_id = 2
    ),
    round(
      (
        (select final_price from trips where trip_id = 2) *
        (select (`percentage`/100) from discounts where discount_id = 1)
      )
    , 2),
    round(
      (
        (select final_price from trips where trip_id = 2) -
        ((select final_price from trips where trip_id = 2) *
        (select (`percentage`/100) from discounts where discount_id = 1))
      )
    , 2),
    (
      select end_time
      from trips
      where trip_id = 2
    ),
    (
      select cancelation_time
      from trips
      where trip_id = 2
    )
  )
;

insert into payments
(trip_id, user_payment_method_id, discount_id, sub_total, discount, total, payment_time, refund_time)
values
  (
    3,
    (
      select user_payment_method_id
      from user_payment_methods
      where user_id = 3
      and is_default = 1
    ),
    2,
    (
      select final_price
      from trips
      where trip_id = 3
    ),
    round(
      (
        (select final_price from trips where trip_id = 3) *
        (select (`percentage`/100) from discounts where discount_id = 2)
      )
    , 2),
    round(
      (
        (select final_price from trips where trip_id = 3) -
        ((select final_price from trips where trip_id = 3) *
        (select (`percentage`/100) from discounts where discount_id = 2))
      )
    , 2),
    (
      select end_time
      from trips
      where trip_id = 3
    ),
    (
      select cancelation_time
      from trips
      where trip_id = 3
    )
  )
;

insert into payments
(trip_id, user_payment_method_id, discount_id, sub_total, discount, total, payment_time, refund_time)
values
  (
    4,
    (
      select user_payment_method_id
      from user_payment_methods
      where user_id = 4
      and is_default = 1
    ),
    null,
    (
      select final_price
      from trips
      where trip_id = 4
    ),
    0,
    (
      select final_price
      from trips
      where trip_id = 4
    ),
    (
      select end_time
      from trips
      where trip_id = 4
    ),
    (
      select cancelation_time
      from trips
      where trip_id = 4
    )
  )
;

insert into payments
(trip_id, user_payment_method_id, discount_id, sub_total, discount, total, payment_time, refund_time)
values
  (
    5,
    (
      select user_payment_method_id
      from user_payment_methods
      where user_id = 5
      and is_default = 1
    ),
    3,
    (
      select final_price
      from trips
      where trip_id = 5
    ),
    round(
      (
        (select final_price from trips where trip_id = 5) *
        (select (`percentage`/100) from discounts where discount_id = 3)
      )
    , 2),
    round(
      (
        (select final_price from trips where trip_id = 5) -
        ((select final_price from trips where trip_id = 5) *
        (select (`percentage`/100) from discounts where discount_id = 3))
      )
    , 2),
    (
      select end_time
      from trips
      where trip_id = 5
    ),
    (
      select cancelation_time
      from trips
      where trip_id = 5
    )
  )
;

insert into payments
(trip_id, user_payment_method_id, discount_id, sub_total, discount, total, payment_time, refund_time)
values
  (
    6,
    (
      select user_payment_method_id
      from user_payment_methods
      where user_id = 6
      and is_default = 1
    ),
    null,
    (
      select final_price
      from trips
      where trip_id = 6
    ),
    0,
    (
      select final_price
      from trips
      where trip_id = 6
    ),
    (
      select end_time
      from trips
      where trip_id = 6
    ),
    (
      select cancelation_time
      from trips
      where trip_id = 6
    )
  )
;

insert into payments
(trip_id, user_payment_method_id, discount_id, sub_total, discount, total, payment_time, refund_time)
values
  (
    7,
    (
      select user_payment_method_id
      from user_payment_methods
      where user_id = 7
      and is_default = 1
    ),
    null,
    (
      select final_price
      from trips
      where trip_id = 7
    ),
    0,
    (
      select final_price
      from trips
      where trip_id = 7
    ),
    (
      select end_time
      from trips
      where trip_id = 7
    ),
    (
      select cancelation_time
      from trips
      where trip_id = 7
    )
  )
;

update drivers
set rating = (
  select avg(driver_rating)
  from trips
  where driver_id = 1
)
where driver_id = 1;

update drivers
set rating = (
  select avg(driver_rating)
  from trips
  where driver_id = 2
)
where driver_id = 2;

update drivers
set rating = (
  select avg(driver_rating)
  from trips
  where driver_id = 3
)
where driver_id = 3;

update drivers
set rating = (
  select avg(driver_rating)
  from trips
  where driver_id = 4
)
where driver_id = 4;

update drivers
set rating = (
  select avg(driver_rating)
  from trips
  where driver_id = 5
)
where driver_id = 5;

update drivers
set rating = (
  select avg(driver_rating)
  from trips
  where driver_id = 6
)
where driver_id = 6;

update drivers
set rating = (
  select avg(driver_rating)
  from trips
  where driver_id = 7
)
where driver_id = 7;


update users
set rating = (
  select avg(user_rating)
  from trips
  where user_id = 1
)
where user_id = 1;

update users
set rating = (
  select avg(user_rating)
  from trips
  where user_id = 2
)
where user_id = 2;

update users
set rating = (
  select avg(user_rating)
  from trips
  where user_id = 3
)
where user_id = 3;

update users
set rating = (
  select avg(user_rating)
  from trips
  where user_id = 4
)
where user_id = 4;

update users
set rating = (
  select avg(user_rating)
  from trips
  where user_id = 5
)
where user_id = 5;

update users
set rating = (
  select avg(user_rating)
  from trips
  where user_id = 6
)
where user_id = 6;

update users
set rating = (
  select avg(user_rating)
  from trips
  where user_id = 7
)
where user_id = 7;

commit;

-- rollback;