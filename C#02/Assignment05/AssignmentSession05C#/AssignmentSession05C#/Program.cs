using AssignmentSession05C_.Enums;

namespace AssignmentSession05C_
{
    internal class Program
    {
        static void Main(string[] args)
        {
            //#region Q1 : Day of the Week
            //int dayNumber;
            //bool isParsed;
            //do
            //{
            //    Console.Write("Enter a day number (0-6): ");
            //    isParsed = int.TryParse(Console.ReadLine(), out dayNumber);

            //}
            //while (!isParsed || !Enum.IsDefined(typeof(MyDayOfWeek), dayNumber));

            //MyDayOfWeek day = (MyDayOfWeek)dayNumber;
            //Console.WriteLine($"Day Name: {day}");

            //switch (day)
            //{
            //    case MyDayOfWeek.Saturday:
            //    case MyDayOfWeek.Sunday:
            //        Console.WriteLine("it's a Weekend");
            //        break;
            //    default:
            //        Console.WriteLine("it's a Workday");
            //        break;

            //}
            //#endregion

            //#region Q1 : Array Statistics
            //Console.Write("Enter array size: ");
            //int s = int.Parse(Console.ReadLine());
            //int[] arr = new int[s];


            //int sum = 0;
            //for (int i = 0; i < s; i++)
            //{
            //    Console.Write($"Enter element[{i}]: ");
            //    arr[i] = int.Parse(Console.ReadLine());
            //    sum += arr[i];

            //}
            //double avg = (double)sum / s;
            //int min = arr[0], max = arr[0];
            //for (int i = 1; i < s; i++)
            //{
            //    if (arr[i] > max)
            //    {
            //        max = arr[i];
            //    }
            //    if (arr[i] < min)
            //    {
            //        min = arr[i];
            //    }

            //}
            //Console.WriteLine($"Sum = {sum}");
            //Console.WriteLine($"Average = {avg}");
            //Console.WriteLine($"Max = {max}");
            //Console.WriteLine($"Min = {min}");
            //Console.Write("Reverse = ");
            //for (int i = s - 1; i >= 0; i--)
            //{
            //    Console.Write($"{arr[i]}");
            //    if (i != 0)
            //        Console.Write(", ");
            //} 
            //#endregion

            //#region Q2 : Student Grades Matrix
            //double[,] grades = new double[3, 4];
            //double overallSum = 0;

            //// Reading grades
            //for (int i = 0; i < 3; i++)
            //{
            //    Console.WriteLine($"\nEnter grades for Student {i + 1}:");

            //    for (int j = 0; j < 4; j++)
            //    {
            //        Console.Write($"Subject {j + 1}: ");
            //        grades[i, j] = double.Parse(Console.ReadLine());
            //    }
            //}

            //Console.WriteLine("\n--- Student Averages ---");

            //// Calculating student averages
            //for (int i = 0; i < 3; i++)
            //{
            //    double studentSum = 0;

            //    for (int j = 0; j < 4; j++)
            //    {
            //        studentSum += grades[i, j];
            //    }

            //    double studentAverage = studentSum / 4;
            //    overallSum += studentSum;

            //    Console.WriteLine($"Student {i + 1} Average = {studentAverage}");
            //}

            //// Overall class average
            //double overallAverage = overallSum / (3 * 4);

            //Console.WriteLine($"\nOverall Class Average = {overallAverage}"); 
            //#endregion

            //#region Q1 : Basic Calculator Functions
            //double num1, num2;
            //bool validInput;

            //// Read First Number
            //do
            //{
            //    Console.Write("Enter first number: ");
            //    validInput = double.TryParse(Console.ReadLine(), out num1);
            //} while (!validInput);

            //// Read Second Number
            //do
            //{
            //    Console.Write("Enter second number: ");
            //    validInput = double.TryParse(Console.ReadLine(), out num2);
            //} while (!validInput);

            //Console.Write("Choose operation (+, -, *, /): ");
            //char operation = Console.ReadKey().KeyChar;
            //Console.WriteLine();

            //double result = 0;

            //try
            //{
            //    switch (operation)
            //    {
            //        case '+':
            //            result = Add(num1, num2);
            //            break;

            //        case '-':
            //            result = Subtract(num1, num2);
            //            break;

            //        case '*':
            //            result = Multiply(num1, num2);
            //            break;

            //        case '/':
            //            result = Divide(num1, num2);
            //            break;

            //        default:
            //            Console.WriteLine("Invalid operation!");
            //            return;
            //    }

            //    Console.WriteLine($"Result = {result}");
            //}
            //catch (DivideByZeroException ex)
            //{
            //    Console.WriteLine(ex.Message);
            //} 
            //#endregion

            //#region Q2 : Circle Calculator with out
            //double radius;
            //bool isValid;

            //do
            //{
            //    Console.Write("Enter circle radius: ");
            //    isValid = double.TryParse(Console.ReadLine(), out radius);
            //}
            //while (!isValid || radius < 0);

            //double area, circumference;

            //CalculateCircle(radius, out area, out circumference);

            //Console.WriteLine($"Area = {area}");
            //Console.WriteLine($"Circumference = {circumference}"); 
            //#endregion

            //#region Console Application project
            //int[] scores = new int[5];

            //// Read scores
            //for (int i = 0; i < 5; i++)
            //{
            //    int input;
            //    bool isValid;

            //    do
            //    {
            //        Console.Write($"Enter score for student {i + 1}: ");
            //        isValid = int.TryParse(Console.ReadLine(), out input);
            //    }
            //    while (!isValid || input < 0 || input > 100);

            //    scores[i] = input;
            //}

            //Console.WriteLine("\n--- Student Results ---");

            //// Print each student's grade
            //for (int i = 0; i < 5; i++)
            //{
            //    Grade grade = GetGrade(scores[i]);
            //    Console.WriteLine($"Student {i + 1}: Score = {scores[i]}, Grade = {grade}");
            //}

            //// Class average
            //double average = CalculateAverage(scores);

            //// Min and max
            //GetMinMax(scores, out int min, out int max);

            //Console.WriteLine($"\nClass Average = {average}");
            //Console.WriteLine($"Minimum Score = {min}");
            //Console.WriteLine($"Maximum Score = {max}");

            //#endregion


        }
        static double Add(double x, double y) {
            return x + y;
        }
        static double Subtract(double x, double y)
        {
            return x - y;
        }
        static double Multiply(double x, double y)
        {
            return x * y;
        }
        static double Divide(double x, double y)
        {
            if (y == 0)
            {
                throw new DivideByZeroException("Cannot divide by zero.");
            }

            return x / y;
        }

        static void CalculateCircle(double radius, out double area, out double circumference)
        {
            area = Math.PI * radius * radius;
            circumference = 2 * Math.PI * radius;
        }
        static Grade GetGrade(int score)
        {
            if (score >= 90) return Grade.A;
            if (score >= 80) return Grade.B;
            if (score >= 70) return Grade.C;
            if (score >= 60) return Grade.D;
            return Grade.F;

        }

        static double CalculateAverage(int[] scores)
        {
            int sum = 0;
            foreach (int score in scores)
            {
                sum += score;
            }
            return (double)sum / scores.Length; ;
        }
        static void GetMinMax(int[] scores, out int min, out int max)
        {
            min = scores[0];
            max = scores[0];

            foreach (int score in scores)
            {
                if (score < min) min = score;
                if (score > max) max = score;
            }
        }

    }
}
