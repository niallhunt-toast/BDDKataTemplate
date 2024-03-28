export type Item = {
  name: string;
  quantity: number;
  price: number;
}

export function computeGrandTotal(items: Item[]): number {
  throw new Error('Not implemented yet. Your code goes here!')
}

export type EmailSummary = {
  grandTotal?: number;
  error?: string;
}

export function sendEmail(summary: EmailSummary): boolean {
  if (summary.error || !summary.grandTotal) {
    console.log('No email sent because there was an error or no total was given', summary.error)
    return false
  }

  console.log('Email sent with grandTotal: ', summary.grandTotal)
  return true
}
