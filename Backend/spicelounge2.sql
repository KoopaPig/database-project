-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 25, 2023 at 05:45 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spicelounge2`
--

-- --------------------------------------------------------

--
-- Table structure for table `allergy`
--

CREATE TABLE `allergy` (
  `Tag` char(20) NOT NULL,
  `User_ID` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `allergy`
--

INSERT INTO `allergy` (`Tag`, `User_ID`) VALUES
('tag1', 'user1'),
('tag2', 'user2'),
('tag3', 'user3'),
('tag4', 'user4'),
('tag5', 'user5'),
('tag6', 'user6'),
('tag7', 'user7'),
('tag8', 'user8');

-- --------------------------------------------------------

--
-- Table structure for table `food`
--

CREATE TABLE `food` (
  `Tag` char(20) NOT NULL,
  `Distinct_Food` varchar(30) NOT NULL,
  `Category` varchar(20) NOT NULL,
  `Nutritional_Info` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `food`
--

INSERT INTO `food` (`Tag`, `Distinct_Food`, `Category`, `Nutritional_Info`) VALUES
('tag1', 'chicken breast', 'Meat', 'Lean source of protein, low in fat and calories.'),
('tag10', 'orange', 'Fruit', 'High in vitamin C, fiber, and natural sugars.'),
('tag11', 'beef', 'Meat', 'Good source of protein and iron.'),
('tag12', 'carrot', 'Vegetable', 'Rich in vitamin A, fiber, and antioxidants.'),
('tag13', 'mozzarella cheese', 'Dairy', 'High in calcium and protein, low in fat.'),
('tag14', 'white rice', 'Grain', 'Good source of carbohydrates, low in fiber.'),
('tag15', 'apple', 'Fruit', 'High in fiber, antioxidants, and natural sugars.'),
('tag16', 'shrimp', 'Fish', 'Low in calories, high in protein, and omega-3 fatty acids.'),
('tag17', 'tomato', 'Vegetable', 'Rich in vitamin C, antioxidants, and lycopene.'),
('tag18', 'butter', 'Dairy', 'High in fat and calories, used for cooking and flavoring.'),
('tag19', 'olive oil', 'Oil', 'Good source of healthy fats, used for cooking and dressing.'),
('tag2', 'broccoli', 'Vegetable', 'High in fiber, vitamins, and minerals.'),
('tag20', 'honey', 'Sweetener', 'Natural sweetener, high in carbohydrates and antioxidants.'),
('tag21', 'salt', 'Seasoning', 'Commonly used for seasoning and preserving food.'),
('tag22', 'pepper', 'Seasoning', 'Commonly used for seasoning and adding heat to dishes.'),
('tag23', 'garlic', 'Herb', 'Used for flavoring in cooking, contains antioxidants.'),
('tag24', 'thyme', 'Herb', 'Used for flavoring in cooking, has a strong aromatic flavor.'),
('tag25', 'cumin', 'Seasoning', 'Used for flavoring in cooking, has a warm and earthy taste.'),
('tag26', 'paprika', 'Seasoning', 'Used for flavoring in cooking, has a sweet and smoky taste.'),
('tag27', 'mustard', 'Condiment', 'Tangy and slightly spicy condiment, commonly used in dressings and sauces.'),
('tag28', 'ketchup', 'Condiment', 'Sweet and tangy condiment, commonly used as a dip or sauce.'),
('tag29', 'mayonnaise', 'Condiment', 'Creamy condiment, commonly used in sandwiches and salads.'),
('tag3', 'cheddar cheese', 'Dairy', 'Rich in calcium and protein, high in fat.'),
('tag30', 'hot sauce', 'Sauce', 'Spicy sauce, commonly used to add heat to dishes or as a condiment.'),
('tag4', 'brown rice', 'Grain', 'Good source of complex carbohydrates and fiber.'),
('tag5', 'banana', 'Fruit', 'High in potassium, fiber, and natural sugars.'),
('tag6', 'salmon', 'Fish', 'Rich in omega-3 fatty acids, high in protein.'),
('tag7', 'spinach', 'Vegetable', 'High in iron, vitamins, and minerals.'),
('tag8', 'yogurt', 'Dairy', 'Contains probiotics, high in calcium and protein.'),
('tag9', 'quinoa', 'Grain', 'High in protein, fiber, and essential amino acids.');

-- --------------------------------------------------------

--
-- Table structure for table `instructions`
--

CREATE TABLE `instructions` (
  `Post_ID` char(20) NOT NULL,
  `Step_Num` int(2) NOT NULL,
  `Step_Description` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `instructions`
--

INSERT INTO `instructions` (`Post_ID`, `Step_Num`, `Step_Description`) VALUES
('post1', 1, 'Boil water and cook spaghetti according to package instructions.'),
('post1', 2, 'Heat olive oil in a large skillet over medium heat.'),
('post1', 3, 'Add garlic and cook for 1-2 minutes until fragrant.'),
('post10', 1, 'Preheat oven to 375 degrees Fahrenheit.'),
('post10', 2, 'In a large bowl, mix together flour, sugar, and baking powder.'),
('post10', 3, 'In a separate bowl, whisk together eggs, milk, and melted butter.'),
('post2', 1, 'Preheat oven to 375 degrees Fahrenheit.'),
('post2', 2, 'In a large bowl, combine flour, baking soda, and salt.'),
('post2', 3, 'In a separate bowl, cream together butter, white sugar, and brown sugar.'),
('post3', 1, 'Preheat grill to medium-high heat.'),
('post3', 2, 'Season steak with salt and pepper on both sides.'),
('post3', 3, 'Grill steak for 4-5 minutes per side for medium-rare.'),
('post4', 1, 'Preheat oven to 350 degrees Fahrenheit.'),
('post4', 2, 'In a large pot, cook macaroni according to package directions.'),
('post4', 3, 'In a separate pot, melt butter over medium heat.'),
('post5', 1, 'Preheat oven to 400 degrees Fahrenheit.'),
('post5', 2, 'In a large bowl, whisk together flour, baking powder, and salt.'),
('post5', 3, 'In a separate bowl, whisk together eggs and milk.'),
('post6', 1, 'Preheat grill to medium heat.'),
('post6', 2, 'In a small bowl, combine olive oil, garlic, salt, and pepper.'),
('post6', 3, 'Brush mixture onto each side of the portobello mushrooms.'),
('post7', 1, 'Preheat oven to 375 degrees Fahrenheit.'),
('post7', 2, 'In a large bowl, mix together ground beef, breadcrumbs, and egg until well combined.'),
('post7', 3, 'Shape the meat mixture into small balls and place on a baking sheet.'),
('post8', 1, 'Preheat oven to 350 degrees Fahrenheit.'),
('post8', 2, 'In a mixing bowl, cream together butter and sugar.'),
('post8', 3, 'Add eggs, one at a time, and vanilla extract. Mix well.'),
('post9', 1, 'Preheat a large skillet over medium-high heat.'),
('post9', 2, 'Add diced onions and bell peppers. Cook until softened.'),
('post9', 3, 'Add ground beef and cook until browned.');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `Post_ID` char(20) NOT NULL,
  `Title` varchar(40) NOT NULL,
  `Description` varchar(200) NOT NULL,
  `Images` blob NOT NULL,
  `Posted_On` date NOT NULL,
  `User_ID` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`Post_ID`, `Title`, `Description`, `Images`, `Posted_On`, `User_ID`) VALUES
('post1', 'Spaghetti Carbonara', 'Delicious pasta dish made with eggs, cheese, pancetta, and black pepper.', 0x30783146384230383030303030303030303030343030, '2023-04-15', 'user1'),
('post10', 'Blueberry Muffins', 'Tender and moist muffins bursting with fresh blueberries.', 0x30783146384230383030303030303030303030343030, '2022-10-30', 'user10'),
('post2', 'Chocolate Chip Cookies', 'Classic homemade cookies with gooey chocolate chips.', 0x30783146384230383030303030303030303030343030, '2022-02-10', 'user2'),
('post3', 'Grilled Steak', 'Juicy and flavorful steak cooked to perfection on the grill.', 0x30783146384230383030303030303030303030343030, '2022-03-05', 'user3'),
('post4', 'Baked Macaroni and Cheese', 'Creamy and cheesy pasta dish baked to golden perfection.', 0x30783146384230383030303030303030303030343030, '2022-04-20', 'user4'),
('post5', 'Blueberry Pancakes', 'Fluffy pancakes studded with fresh blueberries.', 0x30783146384230383030303030303030303030343030, '2022-05-18', 'user5'),
('post6', 'Grilled Portobello Mushrooms', 'Savory and smoky mushrooms marinated and grilled to perfection.', 0x30783146384230383030303030303030303030343030, '2022-06-12', 'user6'),
('post7', 'Spaghetti and Meatballs', 'Classic Italian dish with tender meatballs in marinara sauce served over spaghetti.', 0x30783146384230383030303030303030303030343030, '2022-07-08', 'user7'),
('post8', 'Vanilla Cupcakes', 'Moist and fluffy cupcakes with sweet vanilla frosting.', 0x30783146384230383030303030303030303030343030, '2022-08-25', 'user8'),
('post9', 'Beef Stroganoff', 'Creamy and flavorful beef dish served over egg noodles.', 0x30783146384230383030303030303030303030343030, '2022-09-17', 'user9');

-- --------------------------------------------------------

--
-- Table structure for table `postequipment`
--

CREATE TABLE `postequipment` (
  `Equipment` varchar(30) NOT NULL,
  `Post_ID` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `postequipment`
--

INSERT INTO `postequipment` (`Equipment`, `Post_ID`) VALUES
('Knife', 'post1'),
('Blender', 'post10'),
('Spatula', 'post2'),
('Mixing Bowl', 'post3'),
('Cutting Board', 'post4'),
('Oven', 'post5'),
('Whisk', 'post6'),
('Grill', 'post7'),
('Measuring Cups', 'post8'),
('Baking Sheet', 'post9');

-- --------------------------------------------------------

--
-- Table structure for table `rated`
--

CREATE TABLE `rated` (
  `Post_ID` char(20) NOT NULL,
  `User_ID` char(20) NOT NULL,
  `Rating` int(1) NOT NULL,
  `Comment` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rated`
--

INSERT INTO `rated` (`Post_ID`, `User_ID`, `Rating`, `Comment`) VALUES
('post1', 'user1', 5, 'Great recipe!'),
('post2', 'user2', 4, 'Delicious!'),
('post3', 'user3', 3, 'Needs improvement.'),
('post4', 'user4', 5, 'Amazing dish!'),
('post5', 'user1', 4, 'Impressive flavors!'),
('post6', 'user3', 3, 'Interesting twist on a classic recipe.'),
('post7', 'user2', 5, 'Mouthwatering!'),
('post8', 'user5', 4, 'Simple yet tasty.'),
('post1', 'user5', 2, 'Meh. Its aight');

-- --------------------------------------------------------

--
-- Stand-in structure for view `recent_posts_view`
-- (See below for the actual view)
--
CREATE TABLE `recent_posts_view` (
`Post_ID` char(20)
,`Title` varchar(40)
,`Description` varchar(200)
,`Images` blob
,`Posted_On` date
,`User_ID` char(20)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `recent_posts_view_with_displayname`
-- (See below for the actual view)
--
CREATE TABLE `recent_posts_view_with_displayname` (
`Post_ID` char(20)
,`Title` varchar(40)
,`Description` varchar(200)
,`Images` blob
,`Posted_On` date
,`User_ID` char(20)
,`Display_Name` varchar(30)
);

-- --------------------------------------------------------

--
-- Table structure for table `savedrecipe`
--

CREATE TABLE `savedrecipe` (
  `Post_ID` char(20) NOT NULL,
  `User_ID` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `savedrecipe`
--

INSERT INTO `savedrecipe` (`Post_ID`, `User_ID`) VALUES
('post1', 'user1'),
('post2', 'user2'),
('post3', 'user3'),
('post4', 'user4'),
('post5', 'user1'),
('post6', 'user3'),
('post7', 'user2');

-- --------------------------------------------------------

--
-- Table structure for table `userprofile`
--

CREATE TABLE `userprofile` (
  `User_ID` char(20) NOT NULL,
  `Display_Name` varchar(30) NOT NULL,
  `Bio` varchar(200) NOT NULL,
  `Password` varchar(15) NOT NULL,
  `Email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userprofile`
--

INSERT INTO `userprofile` (`User_ID`, `Display_Name`, `Bio`, `Password`, `Email`) VALUES
('user1', 'John Doe', 'I love cooking!', 'mypassword', 'john.doe@example.com'),
('user10', 'Sophia Wilson', 'Food blogger', 'foodblog123', 'sophia.wilson@example.com'),
('user2', 'Jane Smith', 'Food enthusiast', 'myp@ssword', 'jane.smith@example.com'),
('user3', 'Mark Johnson', 'Chef in training', 'password123', 'mark.johnson@example.com'),
('user4', 'Sarah Williams', 'Passionate foodie', 'pass123', 'sarah.williams@example.com'),
('user5', 'Michael Brown', 'Home cook extraordinaire', 'cookingislife', 'michael.brown@example.com'),
('user6', 'Emily Davis', 'Food lover and traveler', 'foodie456', 'emily.davis@example.com'),
('user7', 'David Lee', 'Culinary adventurer', 'tasteexplorer', 'david.lee@example.com'),
('user8', 'Olivia Smith', 'Baking enthusiast', 'baking123', 'olivia.smith@example.com'),
('user9', 'Jacob Johnson', 'Gourmet chef in training', 'gourmetchef1', 'jacob.johnson@example.com');

-- --------------------------------------------------------

--
-- Structure for view `recent_posts_view`
--
DROP TABLE IF EXISTS `recent_posts_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `recent_posts_view`  AS SELECT `post`.`Post_ID` AS `Post_ID`, `post`.`Title` AS `Title`, `post`.`Description` AS `Description`, `post`.`Images` AS `Images`, `post`.`Posted_On` AS `Posted_On`, `post`.`User_ID` AS `User_ID` FROM `post` ORDER BY `post`.`Posted_On` DESC LIMIT 0, 1212  ;

-- --------------------------------------------------------

--
-- Structure for view `recent_posts_view_with_displayname`
--
DROP TABLE IF EXISTS `recent_posts_view_with_displayname`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `recent_posts_view_with_displayname`  AS SELECT `post`.`Post_ID` AS `Post_ID`, `post`.`Title` AS `Title`, `post`.`Description` AS `Description`, `post`.`Images` AS `Images`, `post`.`Posted_On` AS `Posted_On`, `post`.`User_ID` AS `User_ID`, `userprofile`.`Display_Name` AS `Display_Name` FROM (`post` join `userprofile` on(`post`.`User_ID` = `userprofile`.`User_ID`)) ORDER BY `post`.`Posted_On` DESC LIMIT 0, 1212  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `allergy`
--
ALTER TABLE `allergy`
  ADD KEY `Tag` (`Tag`),
  ADD KEY `User_ID` (`User_ID`);

--
-- Indexes for table `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`Tag`);

--
-- Indexes for table `instructions`
--
ALTER TABLE `instructions`
  ADD PRIMARY KEY (`Post_ID`,`Step_Num`),
  ADD KEY `Post_ID` (`Post_ID`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`Post_ID`),
  ADD KEY `User_ID` (`User_ID`);

--
-- Indexes for table `postequipment`
--
ALTER TABLE `postequipment`
  ADD PRIMARY KEY (`Equipment`),
  ADD KEY `Post_ID` (`Post_ID`);

--
-- Indexes for table `rated`
--
ALTER TABLE `rated`
  ADD KEY `Post_ID` (`Post_ID`),
  ADD KEY `User_ID` (`User_ID`);

--
-- Indexes for table `savedrecipe`
--
ALTER TABLE `savedrecipe`
  ADD KEY `Post_ID` (`Post_ID`),
  ADD KEY `User_ID` (`User_ID`);

--
-- Indexes for table `userprofile`
--
ALTER TABLE `userprofile`
  ADD PRIMARY KEY (`User_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `allergy`
--
ALTER TABLE `allergy`
  ADD CONSTRAINT `allergy_ibfk_1` FOREIGN KEY (`Tag`) REFERENCES `food` (`Tag`),
  ADD CONSTRAINT `allergy_ibfk_2` FOREIGN KEY (`User_ID`) REFERENCES `userprofile` (`User_ID`);

--
-- Constraints for table `instructions`
--
ALTER TABLE `instructions`
  ADD CONSTRAINT `instructions_ibfk_1` FOREIGN KEY (`Post_ID`) REFERENCES `post` (`Post_ID`);

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `post_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `userprofile` (`User_ID`);

--
-- Constraints for table `postequipment`
--
ALTER TABLE `postequipment`
  ADD CONSTRAINT `postequipment_ibfk_1` FOREIGN KEY (`Post_ID`) REFERENCES `post` (`Post_ID`);

--
-- Constraints for table `rated`
--
ALTER TABLE `rated`
  ADD CONSTRAINT `rated_ibfk_1` FOREIGN KEY (`Post_ID`) REFERENCES `post` (`Post_ID`),
  ADD CONSTRAINT `rated_ibfk_2` FOREIGN KEY (`User_ID`) REFERENCES `userprofile` (`User_ID`);

--
-- Constraints for table `savedrecipe`
--
ALTER TABLE `savedrecipe`
  ADD CONSTRAINT `savedrecipe_ibfk_1` FOREIGN KEY (`Post_ID`) REFERENCES `post` (`Post_ID`),
  ADD CONSTRAINT `savedrecipe_ibfk_2` FOREIGN KEY (`User_ID`) REFERENCES `userprofile` (`User_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
