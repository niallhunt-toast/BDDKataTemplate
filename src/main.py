from dataclasses import dataclass
from typing import Optional, List


@dataclass
class Item:
    name: str
    price: float
    quantity: int


@dataclass
class EmailSummary:
    grand_total: Optional[float] = None
    error: Optional[str] = None


def compute_grand_total(items: List[Item]):
    raise NotImplementedError("TODO!!! your code here")


def send_email(summary: EmailSummary):
    if summary.error is not None or summary.grand_total is None:
        print('Do not send an email because there is an error or no grand total provided')
        return False

    print(f'Sending an email with the grand total {summary.grand_total}')
    return True
