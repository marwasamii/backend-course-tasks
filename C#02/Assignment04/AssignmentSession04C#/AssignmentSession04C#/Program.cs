using System.Diagnostics.Metrics;
using System.Numerics;
using System.Runtime.Intrinsics.X86;
using System.Text;

namespace AssignmentSession04C_
{
    internal class Program
    {
        static void Main(string[] args)
        {
            #region Q1
            var watch01 = System.Diagnostics.Stopwatch.StartNew();
            string productList = "";
            for (int i = 0; i <= 5000; i++)
            {
                productList += "PROD-" + i + ",";
            }
            //Console.WriteLine(productList);
            watch01.Stop();
            Console.WriteLine($"string time : {watch01.ElapsedMilliseconds}");
            //  code is inefficient because string DT isimmutable which means its content cannot modify after creation
            // string make new object in stack and reference the value of that object from heap and the latest object beacame unreachable

            // code using stringbuilder
            var watch02 = System.Diagnostics.Stopwatch.StartNew();
            StringBuilder proList = new StringBuilder();
            for (int i = 0; i <= 5000; i++)
            {
                proList.Append("PROD-" + i + ",");
            }
            //Console.WriteLine(proList);
            watch02.Stop();
            Console.WriteLine($"stringBuilder time : {watch02.ElapsedMilliseconds}");
            #endregion

            #region Q2
            double price = 0;
            double finalPrice;
            string breakdown = "";

            // Input age
            Console.Write("Enter age: ");
            int age = int.Parse(Console.ReadLine());

            // Input day of week
            Console.Write("Enter day of week (1-7, 6=Fri, 7=Sat): ");
            int day = int.Parse(Console.ReadLine());

            // Input student ID
            Console.Write("Do you have a student ID? (yes/no): ");
            string isStudent = Console.ReadLine().ToLower();


            if (age < 5)
            {
                price = 0;
                breakdown += "Age under 5: Ticket is Free\n";
            }
            else if (age >= 5 && age <= 12)
            {
                price = 30;
                breakdown += "Age between 5 and 12: Base price = 30 LE\n";
            }
            else if (age >= 13 && age <= 59)
            {
                price = 50;
                breakdown += "Age between 13 and 59: Base price = 50 LE\n";
            }
            else
            {
                price = 25;
                breakdown += "Age 60 or above: Base price = 25 LE\n";
            }

            if (price > 0 && (day == 6 || day == 7))
            {
                price += 10;
                breakdown += "Weekend surcharge (Fri/Sat): +10 LE\n";
            }

            if (price > 0 && isStudent == "yes")
            {
                double discount = price * 0.20;
                price -= discount;
                breakdown += $"Student discount (20%): -{discount} LE\n";
            }

            finalPrice = price;
            // Output
            Console.WriteLine("\n----- Ticket Price Breakdown -----");
            Console.WriteLine(breakdown);
            Console.WriteLine($"Final Ticket Price: {finalPrice} LE");
            #endregion

            #region Q3
            string fileExtension = ".pdf";
            string fileType;
            switch (fileExtension)
            {
                case ".pdf":
                    fileType = "PDF Document";
                    break;
                case ".docx":
                case ".doc":
                    fileType = "Word Document";
                    break;
                case ".xlsx":
                case ".xls":
                    fileType = "Excel Document";
                    break;
                case ".jpg":
                case ".png":
                case ".gif":
                    fileType = "Image File";
                    break;
                default:
                    fileType = "Unknown File Type.";
                    break;

            }
            fileType = fileExtension switch
            {
                ".pdf" => "PDF Document",
                ".docx" or ".doc" => "Word Document",
                ".xlsx" or ".xls" => "Excel Document",
                ".jpg" or ".png" or ".gif" => "Image File",
                _ => "Unknown File Type."
            };
            #endregion

            #region Q4
            int temprature = 35;
            string weatherAdvice;
            weatherAdvice = temprature < 0 ? "Freezing!! Stay indoors." : temprature < 15 ? "Cold. Wear a jacket" : temprature < 25 ? "Pleasant Weather." : temprature < 35 ? "Warm. Stay hydrated." : "Hot! Avoid sun exposure.";
            Console.WriteLine(weatherAdvice);

            //The ternary operator is better for simple, short conditions that fit in one line.
            //Use if/else when the logic is complex or has multiple conditions for better readability. 
            #endregion

            #region Q5
            int attempt = 0;
            bool isValid;
            do
            {
                Console.Write("Enter Password : ");
                string password = Console.ReadLine();
                attempt++;

                bool hasUpper = false,
                    hasDigit = false,
                    hasSpace = false;
                foreach (char c in password)
                {
                    if (char.IsUpper(c))
                        hasUpper = true;
                    if (char.IsDigit(c))
                        hasDigit = true;
                    if (char.IsWhiteSpace(c))
                        hasSpace = true;

                    isValid = true;
                    if (password.Length < 8)
                    {
                        Console.WriteLine("Password must be at least 8 characters.");
                        isValid = false;
                    }
                    if (!hasUpper)
                    {
                        Console.WriteLine("Password must contain at least one uppercase letter.");
                        isValid = false;
                    }

                    if (!hasDigit)
                    {
                        Console.WriteLine("Password must contain at least one digit.");
                        isValid = false;
                    }

                    if (hasSpace)
                    {
                        Console.WriteLine("Password must not contain spaces.");
                        isValid = false;
                    }
                    if (isValid)
                    {
                        Console.WriteLine("Password accepted!");
                        return;
                    }

                    if (attempt == 5)
                    {
                        Console.WriteLine("Account locked");
                        return;
                    }

                    Console.WriteLine($"Attempts left: {5 - attempt}\n");
                }


            } while (true);
            #endregion

            #region Q6
            int[] scores = { 85, 42, 91, 67, 55, 78, 39, 88, 72, 95, 60, 48 };

            Console.WriteLine("Failing scores are : ");
            foreach (int c in scores)
            {
                if (c < 50)
                {
                    Console.WriteLine(c);
                }
            }
            Console.WriteLine("First score above 90 is : ");
            foreach (int c in scores)
            {
                if (c > 90)
                    Console.WriteLine(c);
            }
            int sum = 0, count = 0;
            foreach (int c in scores)
            {
                if (c >= 40)
                {
                    sum += c;
                    count++;
                }
            }

            Console.WriteLine($" Class average, excluding any scores below 40 = {(double)sum / count}");

            int A = 0, B = 0, C = 0, D = 0, F = 0;
            foreach (int c in scores)
            {
                if (c >= 90 && c <= 100) A++;
                else if (c >= 80 && c < 90) B++;
                else if (c >= 70 && c < 80) C++;
                else if (c >= 60 && c < 70) D++;
                else F++;
            }
            Console.WriteLine("\nGrade distribution:");
            Console.WriteLine($"A: {A}");
            Console.WriteLine($"B: {B}");
            Console.WriteLine($"C: {C}");
            Console.WriteLine($"D: {D}");
            Console.WriteLine($"F: {F}");


            #endregion
        }
    }
}
