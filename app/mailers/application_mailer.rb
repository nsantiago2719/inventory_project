class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@local.com"
  layout "mailer"
end
