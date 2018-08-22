using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace AccountNumber.Console
{
    class Program
    {
        static string[] _validAccountNumberReferenceList = {"CF00000019",
            "CF00000176",
            "CF00000242",
            "CF00000279",
            "CF00000345",
            "CF00000381",
            "CF00000439",
            "CF00000532",
            "CF00000550",
            "CF00000587"
        };
        static string[] _invalidAccountNumberReferenceList = {"CF00000017",
            "CF00000178",
            "CF00000240",
            "CF00000277",
            "CF00000343",
            "CF00000383",
            "CF00000437",
            "CF00000538"
        };
        static void Main(string[] args)
        {
            System.Console.WriteLine("I was not sure whether the user was supposed enter values or run over list. ");
            System.Console.WriteLine("So I wrote code for oth Scenarios.");
            System.Console.WriteLine("Checking logic with invalid acccount numbers");
            foreach (var accountNumber in _invalidAccountNumberReferenceList)
            {
                CDVCheck(accountNumber);
            }
            System.Console.WriteLine("Checking logic with valid acccount numbers");
            foreach (var accountNumber in _validAccountNumberReferenceList)
            {
                CDVCheck(accountNumber);
            }
            System.Console.WriteLine("Enter your own account number to");
            while (true)
            {
                var valueToValidate = System.Console.ReadLine();
                CDVCheck(valueToValidate);
                
                if (valueToValidate.ToLower().Contains("exit"))
                {
                    break;
                }
            }
        }
        private static bool IsAlphaNumeric(string AccountNumber)
        {
            Regex regex = new Regex("^[0-9a-zA-Z ]+$");
            if (regex.IsMatch(AccountNumber))
            { return true; }
            return false;
        }
        private static void CDVCheck(string accountNumber)
        {
            if (accountNumber.Length < 10)
            {
                return;
            }
            if (!IsAlphaNumeric(accountNumber))
            {
                System.Console.WriteLine("failure");
            }
            if (!IsFirstTwoCharactersCF(accountNumber))
            {
                System.Console.WriteLine("failure");
            }
            if (!AreOtherCharactersNumeric(accountNumber))
            {
                System.Console.WriteLine("failure");
            }
            else
            {
                var totalCalculated = CalculatedWeighting(accountNumber);
                totalCalculated = GetDivision(totalCalculated);
                var lastDigitToCheck = accountNumber.Substring(accountNumber.Length - 1);
                if (totalCalculated.ToString().Equals(lastDigitToCheck))
                {
                    System.Console.WriteLine("success");
                }
                else
                {
                    System.Console.WriteLine("failure");
                }
            }
        }

        private static bool IsFirstTwoCharactersCF(string AccountNumber)
        {
            var cfValue = AccountNumber.Substring(0, 2);
            if (cfValue.ToLower().Equals("cf"))
            { return true; }
            return false;
        }
        private static bool AreOtherCharactersNumeric(string AccountNumber)
        {
            var numericValue = AccountNumber.Substring(AccountNumber.Length - 8);
            int number = 0;
            if (int.TryParse(numericValue, out number))
            { return true; }
            return false;
        }
        private static int CalculatedWeighting(string AccountNumber)
        {
            string numberWeightString = "1371371";
            var numericValue = AccountNumber.Substring(AccountNumber.Length - 8);
            int checkTotal = 0;
            int numberWeight = 0;
            for (var i = 0; i < (numericValue.Length - 1); i++)
            {
                int number = 0;
                if (int.TryParse(numericValue[i].ToString(), out number))
                {
                    number = int.Parse(numericValue[i].ToString());
                    numberWeight = int.Parse(numberWeightString[i].ToString());
                    checkTotal = checkTotal + (number * numberWeight);
                }
            }

            return checkTotal;
        }
        private static int GetDivision(int CheckTotal)
        {
            int valueToDivideWith = 10;
            int finalCheckTotal = CheckTotal % valueToDivideWith;
            finalCheckTotal = valueToDivideWith - finalCheckTotal;
            return finalCheckTotal;
        }
    }
}
