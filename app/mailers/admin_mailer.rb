class AdminMailer < ApplicationMailer
  default to: Rails.application.secrets.admin_mailer[:to]

  def user_details(user)
    @user = user
    application_name = t 'application_name'

    attachments["#{application_name} - User details.pdf"] = render_to_string

    mail(
      subject: t('.subject', application_name: application_name, id: user.id),
      body:    ''
    )
  end
end
