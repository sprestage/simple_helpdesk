class TestMailer < ActionMailer::Base

  def new_ticket_alert_mail(ticket)
    email_sender = Postmark::ApiClient.new(ENV['POSTMARK_API_KEY'])

    email_sender.deliver(from: "admin@unofficialtrakehnerdatabase.com",
                         to: "susan.prestage@gmail.com",
                         subject: "New Help Ticket: #{ticket.summary}",
                         text_body: ticket.problem)
  end

end
