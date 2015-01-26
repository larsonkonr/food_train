module AlexFactory
  def create_user(options = {}, &block)
    default_options = { full_name: "Jorghay" }
    User.create! default_options.merge(options), &(block || proc{})
  end

  def create_group(options = {}, &block)
    default_options = { name: "Turing #{rand(2000)}" }
    Group.create! default_options.merge(options), &(block || proc{})
  end

  def create_train(options = {}, &block)
    default_options = { departure_time: Time.now }
    Train.create! default_options.merge(options), &(block || proc{})
  end

  def create_train_option(options = {}, &block)
    default_options = { place: "Brought Lunch" }
    TrainOption.create! default_options.merge(options), &(block || proc{})
  end

  def create_vote(options = {}, &block)
    default_options = {  }
    Vote.create! default_options.merge(options), &(block || proc{})
  end

  def create_yelp_business(options = {}, &block)
    default_options = { rating: "4", phone: "123-456-7890", address: "12345 fake st", category: "food" }
    YelpBusiness.create! default_options.merge(options), &(block || proc{})
  end
end
