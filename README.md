Simple Helpdesk
=======

A simple rails application that acts as a minimal help desk.  Tickets get submitted, email gets sent to admin, admin replies to ticket via email.  Ticket and response are displayed.


Basic Install
=======
Clone this git repository.
  > clone http://github.com/sprestage/simple_helpdesk.git

Run the rails server
  > rails s

If you are going to run locally, you'll need to set up something like
UltraHook (www.ultrahook.com/‎) in order to receive webhooks on localhost
UltraHook is a simple command line tool that connects public endpoints
to private endpoints accessible from your computer.  Once you've set up
your API key with UltraHook , you can activate the forwarding this way
  > ultrahook postmark 3000

Also, to send outbound email using Postmark, you will need an email
address that is not in the public domain (so not @gmail, @yahoo, @hotmail,
etc).  This is a process that takes time and careful configuration.  You
need to follow PostmarkApp.com's instructions to configure MX and TXT
records with your DNS provider.  Once you have the records configured
correctly, you should be able to get your SPF and DKIM verified with
Postmark.  Then, they'll send your designated email address the API key
that you will need to use for your sender signature.  Also, be sure to
configure your inbound hook and check to see that you get an HTTP
status of 200 when your app is running.

Use the inbound email address that Postmark supplies you on their site.


Implementation
=======

The user goes to the help desk site and sees the list of help desk tickets,
with their responses.

The user can create and view tickets.

When the user creates a new ticket, the admin is automatically sent an
email containing the summary and text of the problem.

The admin then replies to the email, with the response as the entire body
of the email.

After the admin sends the email, the app receives the email, parses the
email, picks out the ticket id and the body of the email, then stores
the response (body of the email) in the ticket.response.
