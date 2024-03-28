import { Given, When, Then } from '@cucumber/cucumber';
import { Item, computeGrandTotal, EmailSummary, sendEmail } from '../../src'

function assert(condition: any, message: string = "Assertion failed"): asserts condition {
  if (!condition) {
    throw new Error(message);
  }
}

var items: Item[];
var grandTotal: number;
var errorHappened: boolean;

Given('a set of items', function(table) {
  const data = table.hashes()
  items = data.map((row: { [x: string]: any; }) => {
    return {
      name: row['name'],
      quantity: row['quantity'],
      price: row['price']
    }
  });
})

When('we compute the grand total', function() {
  try {
    grandTotal = computeGrandTotal(items)
    errorHappened = false
  } catch (error) {
    errorHappened = true
  }
})

Then('we will have a grand total of {float}', function(number: number) {
  assert(grandTotal === number)
})

Then('we show an error', function() {
  assert(errorHappened === true)
})

var emailSummary: EmailSummary;

When('we have a computed grand total of {float}', function(number: number) {
  emailSummary = {
    grandTotal: number
  }
})

Then('we send an email containing the grand total', function() {
  assert(sendEmail(emailSummary) === true)
})

When('we have an error computing the grand total', function() {
  emailSummary = {
    error: 'An error occured computing grand total'
  }
})

Then('we don\'t send an email containing the grand total', function() {
  assert(sendEmail(emailSummary) === false)
})
