class AdminMailer < ApplicationMailer

def update_email(current_user, admin)
  @current_admin = current_user
  @admin = admin
  mail(to: @admin.email, subject: "Seus dados foram alterados")
end

def send_message(current_user, recipient, subject, message)
  @current_admin = current_user
  @recipient = recipient
  @subject = subject
  @message = message
  mail(to: @recipient, subject: @subject)
end

end
