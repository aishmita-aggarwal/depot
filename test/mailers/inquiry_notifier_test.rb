require 'test_helper'

class InquiryNotifierTest < ActionMailer::TestCase
  test "registered" do
    mail = InquiryNotifier.registered
    assert_equal "Registered", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "answered" do
    mail = InquiryNotifier.answered
    assert_equal "Answered", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
