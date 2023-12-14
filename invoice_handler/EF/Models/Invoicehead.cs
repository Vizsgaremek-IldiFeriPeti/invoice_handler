using System;
using System.Collections.Generic;

namespace invoice_handler.EF.Models;

public partial class Invoicehead
{
    public int InvoiceId { get; set; }

    public int InvoicedetailsId { get; set; }

    public int? SupplierId { get; set; }

    public int? CustomerId { get; set; }

    public string InvoiceNumber { get; set; } = null!;

    public DateTime InvoiceIssueDate { get; set; }

    public virtual Taxpayer? Customer { get; set; }

    public virtual Invoicedetail Invoicedetails { get; set; } = null!;

    public virtual Taxpayer? Supplier { get; set; }
}
