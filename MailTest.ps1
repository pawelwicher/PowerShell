$Source = @”
using System;
using System.Collections.Generic;
using System.Text;
using System.Net;

namespace TestProject
{
    public static class TestClass12
    {
        public static void Test()
        {
            bool ret = SendEmail("10.6.70.18", 25, "", "", false, false, "pawel.wicher@op.pl", "test567890@o2.pl", "test", "test");
            
            Console.WriteLine(ret ? "OK" : "Error");
        }

        public static bool SendEmail(string host, int port, string userName, string password, bool authorization, bool bySsl, string fromAddr, string toAddr, string subject, string body)
        {
            bool ret = true;

            try
            {
                System.Net.Mail.MailMessage message = new System.Net.Mail.MailMessage(fromAddr, toAddr);
                System.Net.Mail.SmtpClient smtpClient = new System.Net.Mail.SmtpClient(host, port);

                message.IsBodyHtml = true;
                smtpClient.EnableSsl = bySsl;

                message.Subject = subject;
                message.Body = body;

                if (authorization)
                    smtpClient.Credentials = new NetworkCredential(userName, XorText(password, 5));
                smtpClient.Send(message);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                onsole.WriteLine(ex.InnerException.Message);
                ret = false;
            }
            return ret;
        }
        private static string XorText(string text, int key)
        {
            return "";
        }
    }
}
"@


Add-Type -ReferencedAssemblies $RefAssem -TypeDefinition $Source -Language CSharp 
[TestProject.TestClass12]::Test()