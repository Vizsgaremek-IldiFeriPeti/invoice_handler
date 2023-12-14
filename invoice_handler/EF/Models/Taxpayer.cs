 
using System;
using System.Collections.Generic;

namespace invoice_handler.EF.Models;

public partial class Taxpayer
{
    public int TaxpayerId { get; set; }

    public int? TaxnumberId { get; set; }

    public int? GroupmemberTaxnumberId { get; set; }

    public string? CommunityVatNumber { get; set; }

    public sbyte? IndividualExemption { get; set; }

    /// <summary>
    /// ORGANIZATION,SELF_EMPLOYED,TAXABLE_PERSON
    /// </summary>
    public string? Incorporation { get; set; }

    /// <summary>
    /// DOMESTIC,OTHER,PRIVATE_PERSON
    /// </summary>
    public string? TaxPayerrVatStatus { get; set; }

    public string? BankAccountNumber { get; set; }

    public string TaxPayerName { get; set; } = null!;

    public string PostalCode { get; set; } = null!;

    public string City { get; set; } = null!;

    public string? StreetName { get; set; }

    public string? PublicPlaceCategory { get; set; }

    public string? Number { get; set; }

    public string? AdditionalAddressDetail { get; set; }

    public virtual Taxnumber? GroupmemberTaxnumber { get; set; }

    public virtual ICollection<Invoicehead> InvoiceheadCustomers { get; set; } = new List<Invoicehead>();

    public virtual ICollection<Invoicehead> InvoiceheadSuppliers { get; set; } = new List<Invoicehead>();

    public virtual Taxnumber? Taxnumber { get; set; }
}
