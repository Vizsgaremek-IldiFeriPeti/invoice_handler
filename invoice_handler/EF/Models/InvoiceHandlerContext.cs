using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace invoice_handler.EF.Models;

public partial class InvoiceHandlerContext : DbContext
{
    public InvoiceHandlerContext()
    {
    }

    public InvoiceHandlerContext(DbContextOptions<InvoiceHandlerContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Invoicedetail> Invoicedetails { get; set; }

    public virtual DbSet<Invoicehead> Invoiceheads { get; set; }

    public virtual DbSet<Invoiceline> Invoicelines { get; set; }

    public virtual DbSet<Taxnumber> Taxnumbers { get; set; }

    public virtual DbSet<Taxpayer> Taxpayers { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        => optionsBuilder.UseMySQL("server=localhost;user=root;database=invoice_handler");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Invoicedetail>(entity =>
        {
            entity.HasKey(e => e.InvoicedetailsId).HasName("PRIMARY");

            entity.ToTable("invoicedetails");

            entity.Property(e => e.InvoicedetailsId)
                .HasColumnType("int(11)")
                .HasColumnName("invoicedetails_id");
            entity.Property(e => e.CurrencyCode)
                .HasMaxLength(3)
                .HasDefaultValueSql("'''HUF'''")
                .HasColumnName("currencyCode");
            entity.Property(e => e.ExchangeRate)
                .HasPrecision(14, 6)
                .HasDefaultValueSql("'1.000000'")
                .HasColumnName("exchangeRate");
            entity.Property(e => e.InvoiceCategory)
                .HasMaxLength(50)
                .HasDefaultValueSql("'NULL'")
                .HasComment("NORMAL\nSIMPLIFIED\nAGGREGATE")
                .HasColumnName("invoiceCategory");
            entity.Property(e => e.InvoiceDeliveryDate)
                .HasDefaultValueSql("'NULL'")
                .HasColumnType("date")
                .HasColumnName("invoiceDeliveryDate");
            entity.Property(e => e.InvoiceGrossAmount).HasColumnName("invoiceGrossAmount");
            entity.Property(e => e.InvoiceNetAmount).HasColumnName("invoiceNetAmount");
            entity.Property(e => e.InvoiceVatAmount).HasColumnName("invoiceVatAmount");
            entity.Property(e => e.PaymentDate)
                .HasDefaultValueSql("'NULL'")
                .HasColumnType("date")
                .HasColumnName("paymentDate");
            entity.Property(e => e.PaymentMethod)
                .HasMaxLength(50)
                .HasDefaultValueSql("'NULL'")
                .HasComment("TRANSFER\nCASH\nCARD\nVOUCHER\nOTHER")
                .HasColumnName("paymentMethod");
            entity.Property(e => e.SmallBusinessIndicator)
                .HasDefaultValueSql("'0'")
                .HasColumnType("tinyint(4)")
                .HasColumnName("smallBusinessIndicator");
        });

        modelBuilder.Entity<Invoicehead>(entity =>
        {
            entity.HasKey(e => e.InvoiceId).HasName("PRIMARY");

            entity.ToTable("invoicehead");

            entity.HasIndex(e => e.CustomerId, "customer_id");

            entity.HasIndex(e => new { e.InvoiceId, e.InvoicedetailsId, e.SupplierId, e.CustomerId }, "invoice_id").IsUnique();

            entity.HasIndex(e => e.InvoicedetailsId, "invoicedetails_id");

            entity.HasIndex(e => e.SupplierId, "supplier_id");

            entity.Property(e => e.InvoiceId)
                .HasColumnType("int(11)")
                .HasColumnName("invoice_id");
            entity.Property(e => e.CustomerId)
                .HasDefaultValueSql("'NULL'")
                .HasColumnType("int(11)")
                .HasColumnName("customer_id");
            entity.Property(e => e.InvoiceIssueDate)
                .HasColumnType("date")
                .HasColumnName("invoiceIssueDate");
            entity.Property(e => e.InvoiceNumber)
                .HasMaxLength(50)
                .HasColumnName("invoiceNumber");
            entity.Property(e => e.InvoicedetailsId)
                .HasColumnType("int(11)")
                .HasColumnName("invoicedetails_id");
            entity.Property(e => e.SupplierId)
                .HasDefaultValueSql("'NULL'")
                .HasColumnType("int(11)")
                .HasColumnName("supplier_id");

            entity.HasOne(d => d.Customer).WithMany(p => p.InvoiceheadCustomers)
                .HasForeignKey(d => d.CustomerId)
                .OnDelete(DeleteBehavior.Restrict)
                .HasConstraintName("customer_id");

            entity.HasOne(d => d.Invoicedetails).WithMany(p => p.Invoiceheads)
                .HasForeignKey(d => d.InvoicedetailsId)
                .OnDelete(DeleteBehavior.Restrict)
                .HasConstraintName("invoicedetails_id");

            entity.HasOne(d => d.Supplier).WithMany(p => p.InvoiceheadSuppliers)
                .HasForeignKey(d => d.SupplierId)
                .OnDelete(DeleteBehavior.Restrict)
                .HasConstraintName("supplier_id");
        });

        modelBuilder.Entity<Invoiceline>(entity =>
        {
            entity.HasKey(e => e.LineId).HasName("PRIMARY");

            entity.ToTable("invoicelines");

            entity.HasIndex(e => e.InvoiceId, "invoice_id");

            entity.HasIndex(e => new { e.LineId, e.InvoiceId }, "line_id").IsUnique();

            entity.Property(e => e.LineId)
                .HasColumnType("int(11)")
                .HasColumnName("line_id");
            entity.Property(e => e.InvoiceId)
                .HasColumnType("int(11)")
                .HasColumnName("invoice_id");
            entity.Property(e => e.LineDescription)
                .HasMaxLength(512)
                .HasDefaultValueSql("'NULL'")
                .HasColumnName("lineDescription");
            entity.Property(e => e.LineGrossAmount).HasColumnName("lineGrossAmount");
            entity.Property(e => e.LineNatureIndicator)
                .HasMaxLength(50)
                .HasDefaultValueSql("'NULL'")
                .HasComment("PRODUCT\nSERVICE\nOTHER")
                .HasColumnName("lineNatureIndicator");
            entity.Property(e => e.LineNetAmount).HasColumnName("lineNetAmount");
            entity.Property(e => e.LineNumber)
                .HasColumnType("int(11)")
                .HasColumnName("lineNumber");
            entity.Property(e => e.LineVatAmount).HasColumnName("lineVatAmount");
            entity.Property(e => e.Quantity)
                .HasPrecision(22, 6)
                .HasDefaultValueSql("'NULL'")
                .HasColumnName("quantity");
            entity.Property(e => e.UnitOfMeasure)
                .HasMaxLength(50)
                .HasDefaultValueSql("'NULL'")
                .HasComment("PIECE\nKILOGRAM\nTON\nKWH\nDAY\nHOUR\nMINUTE\nMONTH\nLITER\nKILOMETER\nCUBIC_METER\nMETER\nLINEAR_METER\nCARTON\nPACK\nOWN")
                .HasColumnName("unitOfMeasure");
            entity.Property(e => e.UnitPrice)
                .HasPrecision(22, 6)
                .HasColumnName("unitPrice");
            entity.Property(e => e.VatPercentage)
                .HasPrecision(5, 4)
                .HasColumnName("vatPercentage");

            entity.HasOne(d => d.Invoice).WithMany(p => p.Invoicelines)
                .HasForeignKey(d => d.InvoiceId)
                .OnDelete(DeleteBehavior.Restrict)
                .HasConstraintName("invoice_id");
        });

        modelBuilder.Entity<Taxnumber>(entity =>
        {
            entity.HasKey(e => e.TaxnumberId).HasName("PRIMARY");

            entity.ToTable("taxnumber");

            entity.HasIndex(e => e.TaxnumberId, "taxnumber_id").IsUnique();

            entity.Property(e => e.TaxnumberId)
                .HasColumnType("int(11)")
                .HasColumnName("taxnumber_id");
            entity.Property(e => e.CountyCode)
                .HasMaxLength(2)
                .HasDefaultValueSql("'NULL'")
                .HasColumnName("countyCode");
            entity.Property(e => e.TaxpayerId)
                .HasMaxLength(8)
                .HasColumnName("taxpayerId");
            entity.Property(e => e.VatCode)
                .HasMaxLength(1)
                .HasDefaultValueSql("'NULL'")
                .HasColumnName("vatCode");
        });

        modelBuilder.Entity<Taxpayer>(entity =>
        {
            entity.HasKey(e => e.TaxpayerId).HasName("PRIMARY");

            entity.ToTable("taxpayer");

            entity.HasIndex(e => e.GroupmemberTaxnumberId, "groupmember_taxpayer_id");

            entity.HasIndex(e => e.TaxnumberId, "taxnumber_id");

            entity.HasIndex(e => new { e.TaxpayerId, e.TaxnumberId }, "taxpayer_id").IsUnique();

            entity.Property(e => e.TaxpayerId)
                .HasColumnType("int(11)")
                .HasColumnName("taxpayer_id");
            entity.Property(e => e.AdditionalAddressDetail)
                .HasMaxLength(255)
                .HasDefaultValueSql("'NULL'")
                .HasColumnName("additionalAddressDetail");
            entity.Property(e => e.BankAccountNumber)
                .HasMaxLength(255)
                .HasDefaultValueSql("'NULL'")
                .HasColumnName("bankAccountNumber");
            entity.Property(e => e.City)
                .HasMaxLength(255)
                .HasColumnName("city");
            entity.Property(e => e.CommunityVatNumber)
                .HasMaxLength(20)
                .HasDefaultValueSql("'NULL'")
                .HasColumnName("communityVatNumber");
            entity.Property(e => e.GroupmemberTaxnumberId)
                .HasDefaultValueSql("'NULL'")
                .HasColumnType("int(11)")
                .HasColumnName("groupmember_taxnumber_id");
            entity.Property(e => e.Incorporation)
                .HasMaxLength(50)
                .HasDefaultValueSql("'NULL'")
                .HasComment("ORGANIZATION,SELF_EMPLOYED,TAXABLE_PERSON")
                .HasColumnName("incorporation");
            entity.Property(e => e.IndividualExemption)
                .HasDefaultValueSql("'0'")
                .HasColumnType("tinyint(4)")
                .HasColumnName("individualExemption");
            entity.Property(e => e.Number)
                .HasMaxLength(50)
                .HasDefaultValueSql("'NULL'")
                .HasColumnName("number");
            entity.Property(e => e.PostalCode)
                .HasMaxLength(10)
                .HasColumnName("postalCode");
            entity.Property(e => e.PublicPlaceCategory)
                .HasMaxLength(50)
                .HasDefaultValueSql("'NULL'")
                .HasColumnName("publicPlaceCategory");
            entity.Property(e => e.StreetName)
                .HasMaxLength(255)
                .HasDefaultValueSql("'NULL'")
                .HasColumnName("streetName");
            entity.Property(e => e.TaxPayerName)
                .HasMaxLength(512)
                .HasColumnName("taxPayerName");
            entity.Property(e => e.TaxPayerrVatStatus)
                .HasMaxLength(50)
                .HasDefaultValueSql("'NULL'")
                .HasComment("DOMESTIC,OTHER,PRIVATE_PERSON")
                .HasColumnName("taxPayerrVatStatus");
            entity.Property(e => e.TaxnumberId)
                .HasDefaultValueSql("'NULL'")
                .HasColumnType("int(11)")
                .HasColumnName("taxnumber_id");

            entity.HasOne(d => d.GroupmemberTaxnumber).WithMany(p => p.TaxpayerGroupmemberTaxnumbers)
                .HasForeignKey(d => d.GroupmemberTaxnumberId)
                .OnDelete(DeleteBehavior.Restrict)
                .HasConstraintName("groupmember_taxpayer_id");

            entity.HasOne(d => d.Taxnumber).WithMany(p => p.TaxpayerTaxnumbers)
                .HasForeignKey(d => d.TaxnumberId)
                .OnDelete(DeleteBehavior.Restrict)
                .HasConstraintName("taxnumber_id");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
