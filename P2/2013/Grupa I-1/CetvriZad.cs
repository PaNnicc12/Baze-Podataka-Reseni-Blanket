using Oracle.ManagedDataAccess.Client;
using System;
using System.Data;

namespace BazeLab
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

                Console.Write("Naziv dokumenta za koji se prikazuje tabela: ");
                string naziv = Console.ReadLine();

                string strSQL = "SELECT z.mbr, z.ime, z.prezime " +
                                "FROM zaposleni z INNER JOIN pravo_pristupa pp ON z.mbr = pp.zaposleni " +
                                "INNER JOIN dokument d ON pp.dokument = d.id_dokumenta " +
                                "WHERE d.naziv = '" + naziv + "'";

                OracleCommand cmd = new OracleCommand(strSQL, con);
                OracleDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                    while (dr.Read())
                        Console.WriteLine(dr.GetString(0) + " " + dr.GetString(1) + " " + dr.GetString(2));
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
