require "test_helper"

class YelpBusinessTest < ActiveSupport::TestCase
  def test_it_belongs_to_train_option
    train_option  = create_train_option
    yelp_business = create_yelp_business train_option: train_option
    assert_equal train_option, yelp_business.train_option
    assert_equal yelp_business, train_option.yelp_business
  end
end
