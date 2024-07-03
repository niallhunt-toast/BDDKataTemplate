# Welcome to the Grocery store, we have some pretty nice cash registers which have an
# interface to a ROM containing daily sale info, through which we can collect the sales
# reports from all the tills at the end of the day. You see, there is this script which
# connects to the registers and reads the daily transactions, generating a
# Record Of Sales (ROS) which is a file containing an item name, quantity sold of this
# item, and the price per unit.
# We collect all of these ROS's and email them for manual processing by the accountant,
# Mr Bean.C.Ounter. However, we will team you up with Mr Bean, so you can facilitate
# his job a bit, as we plan to open 30 new Grocery stores.
# Your first task is to write a program that reads ROS files and generates the grand
# total income for each ROS file, and email it to Mr Bean.C.Ounter
# --------------------------------------------------------------------------------


# In a real project we would want to spend more time defining the features and scenarios
# but for the sake of this exercise we will keep it simple.


Feature: sending an email to Mr Bean with the grand total of a ROS file

    Scenario: grand total should add up
        Given a set of items
            | name                                     | quantity | price |
            | bread                                    | 1        | 2     |
            | 12-pack of eggs                          | 1        | 2     |
            | milk (1L)                                | 4        | 2     |
            | coca cola (33cl)                         | 10       | 1     |
            | chicken clubs (frozen)                   | 1        | 4     |
            | carrots                                  | 4        | 0.25  |
            | apples (red, 1Kg bag)                    | 1        | 2     |
            | butter (500 g)                           | 3        | 2     |
            | cheese (1Kg)                             | 1        | 7     |
            | bacon ("tasty" brand, 3 pack)            | 2        | 3.5   |
            | orange juice (1L)                        | 2        | 1.5   |
            | cheese (gouda, 1Kg)                      | 1        | 5     |
            | bottled water (1.5L)                     | 5        | 1     |
            | twixies (1 whole box, 3 rows, 5 per row) | 1        | 20    |
            | sirloin (100g)                           | 1        | 30    |
            | tomatoes                                 | 12       | 0.25  |
            | bananas                                  | 3        | 0.5   |
        When we compute the grand total
        Then we will have a grand total of 116.5

        Given a set of items
            | name      | quantity | price |
            | apple     | 1        | 10    |
            | beef loin | 2        | 30    |
        When we compute the grand total
        Then we will have a grand total of 70
        
        Given a set of items
            | name      | quantity | price |
            | apple     | 1        | -10   |
            | beef loin | 2        | 30    |
        When we compute the grand total
        Then we show an error

    Scenario: sending an email
        When we have a computed grand total of 41
        Then we send an email containing the grand total
        
        When we have an error computing the grand total
        Then we don't send an email containing the grand total
        
    Scenario: merging two ROS files should add quantities and average prices
        Given a set of items
            | name                                     | quantity | price |
            | carrots                                  | 4        | 0.25  |
            | apples (red, 1Kg bag)                    | 2        | 2.3   |
            | butter (500 g)                           | 3        | 2     |
            | cheese (1Kg)                             | 1        | 7     |
            | tomatoes                                 | 12       | 0.25  |
            | bananas                                  | 1        | 0.55  |
            | apples (red, 1Kg bag)                    | 6        | 1.9   |
            | bananas                                  | 9        | 0.45  |
        When we merge the two ROS files
        Then we should have the following data
            | name                                     | quantity | average price |
            | carrots                                  | 4        | 0.25          |
            | apples (red, 1Kg bag)                    | 8        | 2             |
            | butter (500 g)                           | 3        | 2             |
            | cheese (1Kg)                             | 1        | 7             |
            | tomatoes                                 | 12       | 0.25          |
            | bananas                                  | 10       | 0.46          |
