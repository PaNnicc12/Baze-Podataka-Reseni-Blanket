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
            string strCon = "Data Source=160.99.12.92/gislab_pd;User Id=;Password=;";
            try { 
                con = new OracleConnection(strCon);
                con.Open();

                Console.Write("Uneti registarsku oznaku: ");
                string registracija = Console.ReadLine();

                string strSQL = "SELECT k.ime, k.prezime " +
                                "FROM klijent k INNER JOIN klijent_vozilo kv ON k.id = kv.klijent_id " +
                                "INNER JOIN vozilo v ON v.id = kv.vozilo_id " +
                                "WHERE k.drzava = 'Srbija' AND v.registracija = '" + registracija + "'";
                OracleCommand cmd = new OracleCommand(strSQL, con);
                OracleDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                    while (dr.Read())
                        Console.WriteLine(dr.GetString(0) + " " + dr.GetString(1));
                else
                    Console.WriteLine("Nema podataka u bazi");
                dr.Close();
            }
            catch (Exception ex) { 
                Console.WriteLine("Doslo je do greske prilikom pristupanja bazi podataka: " + ex.Message);
            }
            finally { 
                if (con != null && con.State == ConnectionState.Open)
                    con.Close();
                con = null;
            }
        }
    }
}
