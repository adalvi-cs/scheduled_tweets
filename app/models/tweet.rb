class Tweet < ApplicationRecord
  # belongs to requires user and twitter_account to be always present (not null)
  belongs_to :user
  belongs_to :twitter_account
  # ensure body text is 1 to 280 chars
  validates :body, length: { minimum: 1, maximum: 280 }
  # ensure there is always a publish_at
  validates :publish_at, presence: true

  # this ensures that when a model is created in memory and initialized, we can do some work. eg setting default values
  after_initialize do
    # ||=  no equals operator  ie if publish_at is set, leave it, else set to 24 hrs from now
    self.publish_at ||= 24.hours.from_now
  end

end
