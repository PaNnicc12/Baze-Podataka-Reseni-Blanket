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

                Console.Write("Uneti naziv hotela: ");
                string hotel = Console.ReadLine();

                string strSQL = "SELECT t.ime, t.prezime " +
                                "FROM turista t INNER JOIN turista_hotel th ON t.id=th.turista_id " +
                                "WHERE th.hotel_id IN (SELECT id FROM hotel WHERE naziv = '" + hotel + "')" +
                                "AND t.drzava = 'Srbija'";
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
