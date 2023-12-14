using System;
using System.Collections.Generic;

namespace invoice_handler.EF.Models;

public partial class Invoiceline
{
    public int LineId { get; set; }

    public int InvoiceId { get; set; }

    public int LineNumber { get; set; }

    public string? LineDescription { get; set; }

    /// <summary>
    /// PRODUCT
    /// SERVICE
    /// OTHER
    /// </summary>
    public string? LineNatureIndicator { get; set; }

    public decimal? Quantity { get; set; }

    /// <summary>
    /// PIECE
    /// KILOGRAM
    /// TON
    /// KWH
    /// DAY
    /// HOUR
    /// MINUTE
    /// MONTH
    /// LITER
    /// KILOMETER
    /// CUBIC_METER
    /// METER
    /// LINEAR_METER
    /// CARTON
    /// PACK
    /// OWN
    /// </summary>
    public string? UnitOfMeasure { get; set; }

    public decimal UnitPrice { get; set; }

    public decimal LineNetAmount { get; set; }

    public decimal VatPercentage { get; set; }

    public decimal LineVatAmount { get; set; }

    public decimal LineGrossAmount { get; set; }

    public virtual Invoicedetail Invoice { get; set; } = null!;
}
