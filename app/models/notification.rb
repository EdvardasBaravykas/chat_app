class Notification < ApplicationRecord
  include Noticed::Model
  belongs_to :recipient, polymorphic: true
end


# 1. Run "rails db:migrate"
# 2. Add "has_many :notifications, as: :recipient" to your User model(s).
# 3. Generate notifications with "rails g noticed:notification"