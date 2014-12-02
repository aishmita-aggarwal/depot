class OrderNotifier < ActionMailer::Base
  default from: "Pragmatic Book Store <depot@example.com>"

  def received(order)
    @order = order
    mail to: order.email, subject: 'Pragmatic Store Order Confirmation'
  end

  def shipped(order)
    @order = order
    mail to: order.email, subject: 'Pragmatic Store Order shipped'
  end
end
