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

                Console.Write("Uneti jedinstveni identifikator kompanije: ");
                int idk = Int32.Parse(Console.ReadLine());

                string strSQL = "SELECT z.ime, z.prezime " +
                                "FROM zaposleni z INNER JOIN radno_mesto rm ON rm.zjmbg=z.jmbg " +
                                "INNER JOIN kompanija k ON k.idk=rm.idk " +
                                "WHERE rm.datumdo IS NULL AND rm.pozicija = 'Prodavac' AND k.idk = " + idk;
                OracleCommand cmd = new OracleCommand(strSQL, con);
                OracleDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                    while (dr.Read())
                        Console.WriteLine(dr.GetString(0) + " " + dr.GetString(1));
                else
                    Console.WriteLine("Nema podataka");
                dr.Close();
            }
            catch (Exception ex) {
                Console.WriteLine("Doslo je do greske prilikom pristupa bazi podataka: " + ex.Message);
            }
            finally { 
                if (con != null && con.State == ConnectionState.Open)
                    con.Close();
                con = null;
            }
        }
    }
}
