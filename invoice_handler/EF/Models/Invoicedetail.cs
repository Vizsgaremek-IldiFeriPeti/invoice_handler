using System;
using System.Collections.Generic;

namespace invoice_handler.EF.Models;

public partial class Invoicedetail
{
    public int InvoicedetailsId { get; set; }

    /// <summary>
    /// NORMAL
    /// SIMPLIFIED
    /// AGGREGATE
    /// </summary>
    public string? InvoiceCategory { get; set; }

    public DateTime? InvoiceDeliveryDate { get; set; }

    public DateTime? PaymentDate { get; set; }

    /// <summary>
    /// TRANSFER
    /// CASH
    /// CARD
    /// VOUCHER
    /// OTHER
    /// </summary>
    public string? PaymentMethod { get; set; }

    public string? CurrencyCode { get; set; }

    public decimal? ExchangeRate { get; set; }

    public sbyte? SmallBusinessIndicator { get; set; }

    public decimal InvoiceNetAmount { get; set; }

    public decimal InvoiceVatAmount { get; set; }

    public decimal InvoiceGrossAmount { get; set; }

    public virtual ICollection<Invoicehead> Invoiceheads { get; set; } = new List<Invoicehead>();

    public virtual ICollection<Invoiceline> Invoicelines { get; set; } = new List<Invoiceline>();
}
