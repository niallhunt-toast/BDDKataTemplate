import sys
from behave import given, when, then
from typing import List

from src.main import EmailSummary, Item, compute_grand_total, send_email


@given(u'a set of items')
def given_a_set_of_items(context):
    items: List[Item] = []
    for row in context.table:
        items.append(Item(row['name'], row['price'], row['quantity']))

    context.items = items


@when(u'we compute the grand total')
def we_compute_grand_total(context):
    try:
        items = [
            Item(item.name, float(item.price), int(item.quantity))
            for item in context.items
        ]

        context.grand_total = compute_grand_total(items)
        context.error_occured = False
    except Exception as e:
        print(e, sys.stderr)
        context.error_occured = True
        context.grand_total = None


@then(u'we will have a grand total of {number:g}')
def we_will_have_correct_total(context, number):
    assert context.grand_total == number


@then(u'we show an error')
def we_show_an_error(context):
    assert context.error_occured == True


@when(u'we have a computed grand total of {number:g}')
def we_have_a_grand_total(context, number):
    context.email_summary = EmailSummary(grand_total=number)


@then(u'we send an email containing the grand total')
def we_send_an_email(context):
    assert send_email(context.email_summary) == True


@when(u'we have an error computing the grand total')
def we_have_an_error(context):
    context.email_summary = EmailSummary(error="Error computing grand total")


@then(u'we don\'t send an email containing the grand total')
def we_dont_send_an_email(context):
    assert send_email(context.email_summary) == False
