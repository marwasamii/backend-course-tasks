using Microsoft.VisualBasic;
using System;
using System.Drawing;
using System.Reflection.Metadata;

namespace Assignment02_C_
{
    internal class Program
    {
        static void Main(string[] args)
        {
            #region Q1
            //double d = 9.99;
            //int x = (int)d;  // Explicit casting 
            //Console.WriteLine(x);

            // output = 9
            // Casting from double to int removes the decimal part. 
            #endregion

            #region Q2
            //int n = 5;
            //double d2 = (double)n / 2;
            ////double d2 = n / 2.0;
            //Console.WriteLine(d2);
            #endregion

            #region Q3
            //int age = int.Parse(Console.ReadLine());
            #endregion

            #region Q4
            //string s = "12a";
            //int x = int.Parse(s); // Runtime Error : throw format exception => string contain non numeric character so it cannot be parsed to int
            //Console.WriteLine(x); 
            #endregion

            #region Q5
            //string s = "12a";
            //if (int.TryParse(s, out int ss))
            //{
            //    Console.WriteLine(ss);
            //}
            //else
            //{
            //    Console.WriteLine("Invalid");
            //}
            #endregion

            #region Q6
            //object o = 10;  //Boxing
            //int a = (int)o; //UnBoxing
            //Console.WriteLine(a + 1);

            // output = 11 : 10 is boxed into an object and then unboxed back to an integer.
            #endregion


            #region Q7
            //object o = 10;
            //long x = (long)o;
            //Console.WriteLine(x);

            //there is no output : because an object containing an int cannot be directly unboxed to a long.
            //The value must first be unboxed to int, then converted to long 
            #endregion


            #region Q8
            //object o = 10;
            //long x;
            //try
            //{
            //    x = (long)(o is int ? (int)o : o);
            //}
            //catch
            //{
            //    Console.WriteLine(-1);
            //}
            #endregion

            #region Q9
            string? name = null;  //Nullable reference type
            Console.WriteLine(name?.Length);
            // output = null
            //null - conditional operator (?.) checks if the object is null before accessing a member.
            //Since name is null, name?.Length returns null and nothing is printed 
            #endregion

            #region Q10
            string? name2 = null;
            int length = name2?.Length ?? 0;

            //output = 0
            //null-conditional operator (?.) safely returns null if the object is null.
            //The null-coalescing operator (??) then provides a default value (0) if the result is null 
            #endregion

            #region Q11
            //string? s = null; 
            //int x = int.Parse(s ?? "0"); 
            //Console.WriteLine(x); 

            string? s = null;
            int x;

            if (int.TryParse(s, out int result))
            {
                x = result;
            }
            else
            {
                x = 0; // default value if parsing fails
            }

            Console.WriteLine(x);
            #endregion

            #region Q12
            //string? s = null; 
            //Console.WriteLine(s!.Length);  // Runtime error : null reference exception

            string? ss = null;
            int len = ss?.Length ?? 0;
            Console.WriteLine(len);
            #endregion

            #region Q13
            //string? s = null;
            //int x = Convert.ToInt32(s);
            //Console.WriteLine(x);
            //output = 0 
            #endregion

            #region Q14
            //string? s = null; 

            // A 
            // int a = int.Parse(s);   // will throw an exception 

            // B 
            //int b = Convert.ToInt32(s);  // work without an exception and printrd 0 as an output
            //Console.WriteLine(b); 
            #endregion

            #region Q15
            string? user = null;
            Console.WriteLine((user ?? "Guest").ToUpper()); 
            #endregion
        }
    }
}
