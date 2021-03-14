INSERT INTO `application_user` (`IDapplication_user`, `name`, `last_name`, `city_residence`, `subscribed`, `date_of_payment`, `IDsubscription`) VALUES (NULL, 'Anastasia', NULL, NULL, b'1', NULL, '1'), (NULL, 'Bridget', NULL, NULL, b'0', NULL, NULL);
INSERT INTO `application_user` (`IDapplication_user`, `name`, `last_name`, `city_residence`, `subscribed`, `date_of_payment`, `IDsubscription`) VALUES (NULL, 'Leland', NULL, NULL, b'1', NULL, '2'), (NULL, 'Rusty', NULL, NULL, b'0', NULL, NULL);
INSERT INTO `application_user` (`IDapplication_user`, `name`, `last_name`, `city_residence`, `subscribed`, `date_of_payment`, `IDsubscription`) VALUES (NULL, 'Rosetta', NULL, NULL, b'1', NULL, '2'), (NULL, 'Casimiro', NULL, NULL, b'0', NULL, NULL);
INSERT INTO `application_user` (`IDapplication_user`, `name`, `last_name`, `city_residence`, `subscribed`, `date_of_payment`, `IDsubscription`) VALUES (NULL, 'Anacleto', NULL, NULL, b'0', NULL, NULL), (NULL, 'Elena', NULL, NULL, b'1', NULL, '2');
INSERT INTO `application_user` (`IDapplication_user`, `name`, `last_name`, `city_residence`, `subscribed`, `date_of_payment`, `IDsubscription`) VALUES (NULL, 'Thera', NULL, NULL, b'0', NULL, NULL), (NULL, 'Robertina', NULL, NULL, b'1', NULL, '2');
SELECT * FROM `application_user` WHERE 1;

INSERT INTO `credit_card` (`IDcard`, `credit_number`, `cv`, `expire_date`, `IDapplication_user`) VALUES (NULL, '01234567891', '00022', '2025-01-18', '4'), (NULL, '01234567892', '00023', '2024-01-13', '3');
INSERT INTO `credit_card` (`IDcard`, `credit_number`, `cv`, `expire_date`, `IDapplication_user`) VALUES (NULL, '01234567894', '00024', '2025-01-30', '6'), (NULL, '01234567895', '00025', '2024-01-02', '5');
INSERT INTO `credit_card` (`IDcard`, `credit_number`, `cv`, `expire_date`, `IDapplication_user`) VALUES (NULL, '01234567896', '00026', '2025-03-06', '8'), (NULL, '01234567897', '00027', '2023-11-14', '7');
INSERT INTO `credit_card` (`IDcard`, `credit_number`, `cv`, `expire_date`, `IDapplication_user`) VALUES (NULL, '01234567898', '00028', '2025-03-28', '10'), (NULL, '01234567899', '00029', '2023-11-08', '9');
INSERT INTO `credit_card` (`IDcard`, `credit_number`, `cv`, `expire_date`, `IDapplication_user`) VALUES (NULL, '01234567900', '00030', '2025-03-28', '12'), (NULL, '01234567901', '00031', '2023-11-08', '11');
SELECT * FROM `credit_card` WHERE 1;