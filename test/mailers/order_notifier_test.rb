require 'test_helper'

class OrderNotifierTest < ActionMailer::TestCase
  test "received" do
    mail = OrderNotifier.received(orders(:one))
    assert_equal "Подтверждение заказа в Pragmatik Store", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["depot@example.com"], mail.from
    assert_match /1 x Programming Ruby 2.0/, mail.body.encoded
  end

  test "shipped" do
    mail = OrderNotifier.shipped(orders(:one))
    assert_equal "Заказ из Pragmatic Store отправлен", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["depotm@example.com"], mail.from
    assert_match /<td>1&times;<\/td>\s*<td>Programming Ruby 2.0</td>/, mail.body.encoded
    mail.body.encoded
  end

end
