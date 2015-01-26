class TrainOption < ActiveRecord::Base
  belongs_to :train
  has_many :votes
  has_one :yelp_business

  before_create :set_yelp_business

  def vote_count
    votes.count
  end

  def yelp_content
"Rating:  #{yelp_business.rating}
Phone:    #{yelp_business.phone}
Address:  #{yelp_business.address}
Category: #{yelp_business.category}"
  end

  def set_yelp_business
    self.yelp_business = YelpReader.create(train_option: self)
    true
  end
end
