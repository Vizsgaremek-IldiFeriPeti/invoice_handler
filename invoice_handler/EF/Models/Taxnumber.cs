using System;
using System.Collections.Generic;

namespace invoice_handler.EF.Models;

public partial class Taxnumber
{
    public int TaxnumberId { get; set; }

    public string TaxpayerId { get; set; } = null!;

    public string? VatCode { get; set; }

    public string? CountyCode { get; set; }

    public virtual ICollection<Taxpayer> TaxpayerGroupmemberTaxnumbers { get; set; } = new List<Taxpayer>();

    public virtual ICollection<Taxpayer> TaxpayerTaxnumbers { get; set; } = new List<Taxpayer>();
}
