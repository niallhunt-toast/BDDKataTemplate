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
# total income for each ROS file.
# Thus, the contents of one example ROS file can be found under the dashed line below
# --------------------------------------------------------------------------------
Feature: sending an email to Mr Bean with the grand total of a ROS file

  Scenario: grand total should add up
    Given a set of items
      | name      | quantity | price |
      | apple     |        1 |    10 |
      | beef loin |        2 |    30 |
    When we compute the grand total
    Then we will have a grand total of 70
    Given a set of items
      | name      | quantity | price |
      | apple     |        1 |   -10 |
      | beef loin |        2 |    30 |
    When we compute the grand total
    Then we show an error

  Scenario: sending an email
    When I have a computed grand total
      | grand total |
      |          41 |
    Then send an email containing the grand total
    When I have a computed grand total
      | grand total |
      | Error       |
    Then don't send an email containing the grand total
