﻿using System;
using System.Configuration;
using WDAdmin.Domain.Entities;
using System.Net.Mail;
using WDAdmin.Resources;

namespace WDAdmin.WebUI.Infrastructure
{
    /// <summary>
    /// Implementation of MailListener class
    /// </summary>
    public class MailListener : IMailListener
    {
        /// <summary>
        /// The _host
        /// </summary>
        private readonly string _host = ConfigurationManager.AppSettings["Host"];
        /// <summary>
        /// The _port
        /// </summary>
        private readonly int _port = int.Parse(ConfigurationManager.AppSettings["Port"]);
        /// <summary>
        /// The _username
        /// </summary>
        private readonly string _username = ConfigurationManager.AppSettings["Username"];
        /// <summary>
        /// The _password
        /// </summary>
        private readonly string _password = ConfigurationManager.AppSettings["Password"];
        /// <summary>
        /// The _address from
        /// </summary>
        private readonly string _addressFrom = ConfigurationManager.AppSettings["AddressFrom"];
        /// <summary>
        /// The _display name
        /// </summary>
        private readonly string _displayName = ConfigurationManager.AppSettings["DisplayName"];
        /// <summary>
        /// The _test email to
        /// </summary>
        private readonly string _testEmailTo = ConfigurationManager.AppSettings["TestEmailTo"];

        /// <summary>
        /// Send email when user created in WD - username (user's email) and password (autogenerated)
        /// </summary>
        /// <param name="email">E-mail address</param>
        /// <param name="password">Auto generated password</param>
        public void SendEmailNewUser(string email, string password)
        {
            var mailSubject = LangResources.PasswordMailSubject;
            var mailBody = LangResources.PasswordMailBody + "<br /><br />" + LangResources.PasswordMailUsername + email + "<br />" + LangResources.PasswordMailPassword + password + "<br /><br />" + LangResources.GreetingsFromWelfareDenmark;
            SmtpMail(email, mailSubject, mailBody);
        }

        /// <summary>
        /// Email with new generated password, in case user forgets the current
        /// </summary>
        /// <param name="email">E-mail address</param>
        /// <param name="newPassword">Re-set password</param>
        public void SendForgottenPassEmail(string email, string newPassword)
        {
            var mailSubject = LangResources.NewPasswordMailTitle;
            var mailBody = LangResources.NewPasswordMailBody + newPassword + "<br /><br />" + LangResources.GreetingsFromWelfareDenmark;
            SmtpMail(email, mailSubject, mailBody);
        }

        /// <summary>
        /// Email with new generated password, for user who forgot password and has no e-mail registered
        /// </summary>
        /// <param name="email">E-mail address</param>
        /// <param name="user">The user.</param>
        /// <param name="groupName">Name of the group.</param>
        /// <param name="newPassword">Re-set password</param>
        public void SendForgottenPassEmailResponsible(string email, User user, string groupName, string newPassword)
        {
            var mailSubject = LangResources.NewPasswordResponsibleMailTitle + ": " + user.Firstname + " " + user.Lastname;
            var mailBody = LangResources.NewPasswordResponsibleMailBody1 + ": <strong>" + user.Firstname + " " + user.Lastname + "</strong> (" +
                                    LangResources.UserGroup + ": " + groupName + ", " + LangResources.SalaryNumber + ": " + user.SalaryNumber + ") " +
                                    LangResources.NewPasswordResponsibleMailBody2 + "<br /><br />" +
                                    LangResources.NewPasswordResponsibleMailBody3 + ": <strong>" + newPassword + "</strong><br /><br />" +
                                    LangResources.GreetingsFromWelfareDenmark;

            SmtpMail(email, mailSubject, mailBody);
        }

        /// <summary>
        /// Send "OK" message for finished action
        /// </summary>
        /// <param name="action">Function which triggered the message</param>
        public void SendOKMessage(string action)
        {
            var mailSubject = action + " OK - " + DateTime.Now;
            var mailBody = string.Empty;
            string email = _testEmailTo;
            SmtpMail(email, mailSubject, mailBody);
        }

        /// <summary>
        /// Send "Error" message for finished action
        /// </summary>
        /// <param name="action">Function which triggered the message</param>
        /// <param name="error">Error message</param>
        public void SendErrorMessage(string action,string error)
        {
            var mailSubject = action + " Error - " + DateTime.Now;
            var mailBody = error;
            var email = _testEmailTo;
            SmtpMail(email, mailSubject, mailBody);
        }

        #region //-------------Helper methods-----------------//

        /// <summary>
        /// Helper method for sending mails
        /// </summary>
        /// <param name="email">E-mail address</param>
        /// <param name="mailSubject">E-mail subject</param>
        /// <param name="mailBody">E-mail body</param>
        private void SmtpMail(string email, string mailSubject, string mailBody)
        {
            //Set-up SmtpClient
            var client = new SmtpClient(_host, _port)
                             {
                                 EnableSsl = false, 
                                 Credentials = new System.Net.NetworkCredential(_username, _password)
                             };

            //Set address from
            var from = new MailAddress(_addressFrom, _displayName, System.Text.Encoding.UTF8);

            // Set destinations for the e-mail message.
            var to = new MailAddress(email);

            // Specify the message content.
            var message = new MailMessage(from, to)
                              {
                                  Subject = mailSubject,
                                  SubjectEncoding = System.Text.Encoding.UTF8,
                                  Body = mailBody,
                                  BodyEncoding = System.Text.Encoding.UTF8,
                                  IsBodyHtml = true
                              };

            //Send message
            try
            {
                client.Send(message);
                //Logging
                Logger.Log("MailSendout OK", LogType.MailSendOk, LogEntryType.Info);
            }
            catch (Exception ex)
            {
                Logger.Log("MailSendout Error", ex.ToString(), LogType.MailSendError, LogEntryType.Error);
            }
            
            //Clean up
            message.Dispose();
            client.Dispose();
        }

        #endregion
    }
}