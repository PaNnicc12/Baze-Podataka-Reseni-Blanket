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

                Console.Write("Uneti naziv odeljenja: ");
                string naziv = Console.ReadLine();

                string strSQL = "SELECT z.ime, z.prezime, z.plata FROM zaposleni z " +
                                "INNER JOIN istorija_radnih_mesta irm ON irm.id_zap = z.id " +
                                "INNER JOIN odeljenje o ON o.id = irm.id_odelj " +
                                "WHERE (irm.datum_kraja-irm.datum_poc) > 100 " +
                                "AND o.naziv = '" + naziv + "'";
                OracleCommand cmd = new OracleCommand(strSQL, con);
                OracleDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                    while (dr.Read())
                        Console.WriteLine(dr.GetString(0) + " " + dr.GetString(1) + " " + dr.GetInt32(2));
                else
                    Console.WriteLine("Nema podataka");
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