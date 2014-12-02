class InquiryNotifier < ActionMailer::Base
  default from: "Pragmatic Book Store <depot@example.com>"

  def registered(inquiry)
    @inquiry = inquiry
    mail to: inquiry.user_email, subject: 'Pragmatic Store Inquiry Registered.'
  end

  def answered(inquiry)
    @inquiry = inquiry
    mail to: inquiry.user_email, subject: 'Pragmatic Store Inquiry Response.'
  end

  def new_query_added(inquiry)
    @inquiry = inquiry
    mail to: 'aishmita@vinsol.com', subject: 'Pragmatic Store New Inquiry Registered.'
  end
end
