using invoice_handler.EF.Models;
using Microsoft.VisualBasic;

namespace invoice_handler
{
    internal class Program
    {
        static void Main(string[] args)
        {
            InvoiceHandlerContext context = new();
            /*
            Eladók/szolgáltatók adatainak lekérdezése gazdasági típusuk szerint. 
            */
            Console.WriteLine($"\nEladók/szolgáltatók adatainak lekérdezése gazdasági típusuk szerint: " +
                $"\n\tgazdasági társaság/egyéni vállalkozó/adószámos magánszemély");
             
            Console.Write($"\n\tGazdasági típus: ");
            string incorporation = null;
            while(incorporation == null)
            {
                incorporation = Console.ReadLine();

                switch (incorporation)
                {
                    case "gazdasági társaság": 
                        incorporation = "ORGANIZATION";
                        break;
                    case "egyéni vállalkozó": 
                        incorporation = "SELF_EMPLOYED";
                        break;
                    case "adószámos magánszemély": 
                        incorporation = "TAXABLE_PERSON";
                        break;
                    default: 
                        incorporation = null; 
                        Console.Write($"\tKérem, adjon meg valós gazdasági típust: ");
                        break;
                }
            }
            
            var taxpayers = context.Taxpayers
                .Where(taxpayer => taxpayer.Incorporation == incorporation)
                .Select(taxpayer => new
                {
                    taxpayer.TaxpayerId,
                    taxpayer.TaxPayerName,
                    taxpayer.BankAccountNumber,
                    taxpayer.TaxnumberId,
                    taxpayer.City,
                    taxpayer.PostalCode,
                    taxpayer.StreetName,
                    taxpayer.PublicPlaceCategory,
                    taxpayer.Number
                }).ToList();

            if (taxpayers.Count > 0 )
            {
                foreach (var taxpayer in taxpayers)
                {
                    Console.WriteLine($"\t{taxpayer.TaxpayerId}. Név: {taxpayer.TaxPayerName}\tBankszámlaszám: {taxpayer.BankAccountNumber}, " +
                        $"\n\tCím: {taxpayer.PostalCode}, {taxpayer.City} {taxpayer.StreetName} {taxpayer.PublicPlaceCategory} {taxpayer.Number}.");
                    var taxnumber = context.Taxnumbers
                    .Where(taxnumber => taxnumber.TaxnumberId == taxpayer.TaxnumberId).FirstOrDefault();
                    if (taxnumber != null) {
                    Console.WriteLine($"\tAdószám: {taxnumber.TaxpayerId}-{taxnumber.VatCode}-{taxnumber.CountyCode}");}
                }
            }
            else {Console.WriteLine("\tAz adatbázis nem tartalmaz a kiválasztott gazdasági típusnak megfelelő eladót vagy szolgáltatót.");}

            /*
            Eladó/szolgáltató hozzáadása az adatbázishoz, adatok módosítása, adószám hozzárendelése eladó/szolgáltatóhoz. 
            */
            Console.WriteLine("\nEladó/szolgáltató hozzáadása az adatbázishoz, adatok módosítása, adószám hozzárendelése");
            Console.WriteLine("\t- Ha új eladót/szolgáltatót szeretne az adatbázisba felvenni, írjon be egy I betűt, majd üsse le az Entert!");
            Console.WriteLine("\t- Ha egy eladó/szolgáltató adatait szeretné módosítani vagy adószámot hozzárendelni, írja be az azonosítóját, " +
                "majd üsse le az Entert!");
            Console.Write("\t- Egyébként hagyja üresen, és üsse le az Enter billentyűt!");
            string response = null;
            response = Console.ReadLine();
            InvoiceHandlerContext updateTaxpayerContext = new();

            Taxpayer UpdateTaxpayerContext(int taxPayerId)
            {
                var taxpayer = updateTaxpayerContext.Taxpayers
                    .Where(taxpayer => taxpayer.TaxpayerId == taxPayerId).FirstOrDefault();
                return taxpayer;
            }

            InvoiceHandlerContext updateTaxnumberContext = new();

            Taxnumber UpdateTaxnumberContext(int? taxNumberId)
            {
                var taxnumber = updateTaxnumberContext.Taxnumbers
                    .Where(taxnumber => taxnumber.TaxnumberId == taxNumberId).FirstOrDefault();
                return taxnumber;
            }

            if (response != null && response != "")
            {
                int taxPayerId;
                var taxpayer = int.TryParse(response, out taxPayerId) ? UpdateTaxpayerContext(taxPayerId) : null;

                Console.WriteLine("Eladó/szolgáltató hozzáadása vagy adatainak módosítása");
                Console.Write("\tAdó törzsszám (8 számjegyű): ");
                string taxpayerId = Console.ReadLine();
                Console.Write("\tÁfakód (1 számjegyű): ");
                string vatCode = Console.ReadLine();
                Console.Write("\tMegyekód (2 számjegyű): ");
                string countyCode = Console.ReadLine();
                Console.Write($"\tGazdasági típus: (gazdasági társaság/egyéni vállalkozó/adószámos magánszemély)");
                incorporation = null;
                while (incorporation == null)
                {
                    incorporation = Console.ReadLine();

                    switch (incorporation)
                    {
                        case "gazdasági társaság":
                            incorporation = "ORGANIZATION";
                            break;
                        case "egyéni vállalkozó":
                            incorporation = "SELF_EMPLOYED";
                            break;
                        case "adószámos magánszemély":
                            incorporation = "TAXABLE_PERSON";
                            break;
                        default:
                            if (response.ToLower() == "i")
                            {
                                incorporation = null;
                                Console.Write($"\tKérem, adjon meg valós gazdasági típust: ");
                            }
                            else { incorporation = taxpayer.Incorporation; };
                            break;
                    }
                }
                Console.Write("\tBankszámlaszám: ");
                string bankAccountNumber = Console.ReadLine();
                Console.Write("\tNév: ");
                string taxPayerName = Console.ReadLine();
                Console.Write("\tIrányítószám: ");
                string postalCode = Console.ReadLine();
                Console.Write("\tTelepülés: ");
                string city = Console.ReadLine();
                Console.Write("\tKözterület neve: ");
                string streetName = Console.ReadLine();
                Console.Write("\tKözterület jellege: ");
                string publicPlaceCategory = Console.ReadLine();
                Console.Write("\tHázszám: ");
                string number = Console.ReadLine();

                if (response.ToLower() == "i")
                {
                    InvoiceHandlerContext addToContext = new();
                    addToContext.Taxnumbers.Add(
                        new Taxnumber()
                        {
                            TaxpayerId = taxpayerId,
                            VatCode = vatCode,
                            CountyCode = countyCode
                        });

                    addToContext.SaveChanges();

                    var taxnumber = context.Taxnumbers
                        .Where(taxnumber => taxnumber.TaxpayerId == taxpayerId).FirstOrDefault();

                    addToContext.Taxpayers.Add(
                        new Taxpayer()
                        {
                            Incorporation = incorporation,
                            BankAccountNumber = bankAccountNumber,
                            TaxPayerName = taxPayerName,
                            PostalCode = postalCode,
                            City = city,
                            StreetName = streetName,
                            PublicPlaceCategory = publicPlaceCategory,
                            Number = number,
                            TaxnumberId = taxnumber.TaxnumberId
                        });

                    addToContext.SaveChanges();
                }
                else
                {
                    taxpayer.Incorporation = incorporation != null ? incorporation : taxpayer.Incorporation;
                    taxpayer.TaxPayerName = taxPayerName != "" ? taxPayerName : taxpayer.TaxPayerName;
                    taxpayer.BankAccountNumber = bankAccountNumber != "" ? bankAccountNumber : taxpayer.BankAccountNumber;
                    taxpayer.City = city != "" ? city : taxpayer.City;
                    taxpayer.PostalCode = postalCode != "" ? postalCode : taxpayer.PostalCode;
                    taxpayer.StreetName = streetName != "" ? streetName : taxpayer.StreetName;
                    taxpayer.PublicPlaceCategory = publicPlaceCategory != "" ? publicPlaceCategory : taxpayer.PublicPlaceCategory;
                    taxpayer.Number = number != "" ? number : taxpayer.Number;

                    if (taxpayerId != "" || vatCode != "" || countyCode != "")
                    {
                        if (taxpayer.TaxnumberId == null)
                        {
                            InvoiceHandlerContext addToContext = new();
                            addToContext.Taxnumbers.Add(
                                new Taxnumber()
                                {
                                    TaxpayerId = taxpayerId,
                                    VatCode = vatCode,
                                    CountyCode = countyCode
                                });

                            addToContext.SaveChanges();

                            var taxnum = context.Taxnumbers
                                .Where(taxnumber => taxnumber.TaxpayerId == taxpayerId).FirstOrDefault();
                            taxpayer.TaxnumberId = taxnum.TaxnumberId;
                        }
                        else
                        {
                            var taxnumber = UpdateTaxnumberContext(taxpayer.TaxnumberId);
                            taxnumber.TaxpayerId = taxpayerId != "" ? taxpayerId : taxnumber.TaxpayerId;
                            taxnumber.VatCode = vatCode != "" ? vatCode : taxnumber.VatCode;
                            taxnumber.CountyCode = countyCode != "" ? countyCode : taxnumber.CountyCode;

                            updateTaxnumberContext.SaveChanges();
                        }
                    }
                    updateTaxpayerContext.SaveChanges();
                }
            };

            /*
            A felhasználó által megadott fizetési módon kiegyenlített számlák időpontja, bruttó összege, valamint a
            számlák értékének összesítése");
            */
            Console.WriteLine($"\nSzámlák kiegyenlítésének ideje és értéke a fizetés módja szerint: " +
                $"\n\tutalás/készpénz/bankkártya/kupon/egyéb");

            Console.Write("\n\tFizetés módja: ");

            string paymentMethod = null;

            while (paymentMethod == null)
            {
                paymentMethod = Console.ReadLine();

                switch (paymentMethod)
                {
                    case "utalás":
                        paymentMethod = "TRANSFER";
                        break;
                    case "készpénz":
                        paymentMethod = "CASH";
                        break;
                    case "bankkártya":
                        paymentMethod = "CARD";
                        break;
                    case "kupon":
                        paymentMethod = "VOUCHER";
                        break;
                    case "egyéb":
                        paymentMethod = "OTHER";
                        break;
                    default:
                        paymentMethod = null;
                        Console.Write($"\tKérem, adjon meg valós fizetési módot: ");
                        break;
                }
            }
           
            var invoices = from invoicedetail in context.Invoicedetails
                           where invoicedetail.PaymentMethod == paymentMethod
                           select invoicedetail;

            if ( invoices.Count() > 0 )
            {
                decimal summaryGrossAmount = 0;
                foreach (var invoice in invoices)
                {
                    Console.WriteLine($"\tTeljesítés: {invoice.InvoiceDeliveryDate.Value.ToShortDateString().Trim()}\tBruttó összeg: {invoice.InvoiceGrossAmount} Ft.");
                    summaryGrossAmount += invoice.InvoiceGrossAmount;
                }
                Console.WriteLine($"\tKifizetett számlák összege: \t\t\t{summaryGrossAmount} Ft.");
            }
            else
            {
                Console.WriteLine("\tAz adatbázis nem tartalmaz a kiválasztott fizetési módnak megfelelő pénzforgalmat.");
            }

            /*
            Egész évben értékesített termékek mennyisége és összértéke. 
            */
            decimal numberOfSoldProducts = 0;
            decimal valueOfSoldProducts = 0;
            foreach (var invoiceLine in context.Invoicelines)
            {
                numberOfSoldProducts += Math.Round((decimal)invoiceLine.Quantity, 2);
                valueOfSoldProducts += Math.Round((decimal)invoiceLine.Quantity*invoiceLine.LineGrossAmount, 2);
            }
            Console.WriteLine($"\nEgész évben értékesített termékek mennyisége: \t{numberOfSoldProducts} adag.");
            Console.WriteLine($"\nEgész évben értékesített termékek összértéke: \t{valueOfSoldProducts} Ft.");
        }
    }
}