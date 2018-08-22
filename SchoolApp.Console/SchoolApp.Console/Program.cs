using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SchoolApp.Console
{
    class Program
    {
        static string folderName = @"C:\Test\CodingTest\C#\Applicant";
        static string fullPathString = System.IO.Path.Combine(folderName, "SchoolReports");
        static void Main(string[] args)
        {
            System.Console.WriteLine("please type exit to stop console.");

            while (true)
            {
                var valueToValidate = System.Console.ReadLine();

                if (valueToValidate.Contains("ChildMarkReport"))
                {
                    var newValue = valueToValidate.Replace("ChildMarkReport", "").Trim();
                    ChildMarkReport(newValue);
                }
                else if (valueToValidate.Contains("ClassAveragesReport"))
                {
                    ClassAveragesReport();
                }
                else if (valueToValidate.Contains("SportsTaken"))
                {
                    SportsTakenReport();
                }
                else if (valueToValidate.ToLower().Contains("exit"))
                {
                    break;
                }
            }
        }
        static string pathStringCreator()
        {
            string fileName = System.IO.Path.GetRandomFileName();
            return System.IO.Path.Combine(fullPathString, fileName + ".txt");
        }
                
        static string ConnectionString()
        {
            return "Data Source=.;Initial Catalog=SchoolApp;Integrated Security=True";
        }
        static void ChildMarkReport(string studentNameOrSurname)
        {
            using (SqlConnection conn = new SqlConnection(ConnectionString()))
            using (SqlCommand cmd = new SqlCommand("StudentSubjectsAndMarks", conn))
            {
                conn.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@StudentNameOrSurname", studentNameOrSurname);
                SqlDataReader rdr = cmd.ExecuteReader();
                CreateFolderPath(fullPathString);
                var pathString = pathStringCreator();
                while (rdr.Read())
                {
                    CreateAndWriteToFile(string.Format("StudentName: {0}, StudentSurname: {1}, Subject: {2}, Mark: {3}",
                        rdr["StudentName"],
                        rdr["StudentSurname"],
                        rdr["Subject"],
                        rdr["Mark"]), pathString);
                }
            }
        }
        static void ClassAveragesReport()
        {
            using (SqlConnection conn = new SqlConnection(ConnectionString()))
            using (SqlCommand cmd = new SqlCommand("StudentNameSurnameSubjectsTakenAndAverage", conn))
            {
                conn.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataReader rdr = cmd.ExecuteReader();
                CreateFolderPath(fullPathString);
                var pathString = pathStringCreator();
                while (rdr.Read())
                {
                    CreateAndWriteToFile(string.Format("StudentName: {0}, StudentSurname: {1}, NumberOfSubjects: {2}, Average: {3}",
                        rdr["StudentName"],
                        rdr["StudentSurname"],
                        rdr["NumberOfSubjects"],
                        rdr["Average"]), pathString);
                }
            }
        }
        static void SportsTakenReport()
        {
            using (SqlConnection conn = new SqlConnection(ConnectionString()))
            using (SqlCommand cmd = new SqlCommand("StudentsDoingSportsAndOthersDancing", conn))
            {
                conn.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataReader rdr = cmd.ExecuteReader();
                CreateFolderPath(fullPathString);
                var pathString = pathStringCreator();
                while (rdr.Read())
                {
                    CreateAndWriteToFile(string.Format("StudentAge: {0}, StudentName: {1}, StudentSurname: {2}, SportName: {3}",
                        rdr["StudentAge"],
                        rdr["StudentName"],
                        rdr["StudentSurname"],
                        rdr["SportName"]), pathString);
                }
            }
        }
        static void CreateFolderPath(string fullPathString) {
            try
            {
                if (Directory.Exists(fullPathString))
                {
                    return;
                }

                DirectoryInfo di = Directory.CreateDirectory(fullPathString);
            }
            catch (Exception e)
            {
                System.Console.WriteLine("The process failed: {0}", e.ToString());
            }
        }
        static void CreateAndWriteToFile(string dataToWrite, string pathString)
        {
            try
            {
                using (StreamWriter writer = new StreamWriter(pathString, true))
                {
                    writer.WriteLine(dataToWrite);
                }
                using (StreamWriter w = File.AppendText(pathString))
                {
                    w.WriteLine("hello");
                }
            }
            catch (Exception e)
            {
                System.Console.WriteLine("The process failed: {0}", e.ToString());
            }
        }
    }
}
