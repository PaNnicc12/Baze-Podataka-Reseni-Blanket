using Oracle.ManagedDataAccess.Client;
using System;
using System.Data;

namespace Zadatak4
{
    internal class Program
    {
        static void Main(string[] args)
        {
            OracleConnection con = null;
            string strCon = "Data Source=160.99.12.92/gislab_pd;User Id=;Password=";
            try {
                con = new OracleConnection(strCon);
                con.Open();

                Console.Write("Uneti naslov knjige: ");
                string naslov = Console.ReadLine();

                string strSQL = "SELECT b.naziv " +
                                "FROM biblioteka b INNER JOIN knjiga_u_biblioteci kub ON b.id = kub.id_biblioteke " +
                                "INNER JOIN knjiga k ON k.isbn = kub.isbn_knjige " +
                                "WHERE k.naslov = '" + naslov + "'";
                OracleCommand cmd = new OracleCommand(strSQL, con);
                OracleDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                    while (dr.Read())
                        Console.WriteLine(dr.GetString(0));
                dr.Close();
            }
            catch (Exception ex) {
                Console.WriteLine("Doslo je do greske prilikom povezivanja na bazu podataka: " + ex.Message);
            }
            finally {
                if (con != null && con.State == ConnectionState.Open)
                    con.Close();
                con = null;
            }
        }
    }
}
