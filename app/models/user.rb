class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  scope :all_except, ->(user) { where.not(id: user) }

  has_many :messages
  has_many :notifications, as: :recipient
  after_update_commit {broadcast_update}

  enum status: %i[offline online]


  def broadcast_update
    broadcast_replace_to 'user_status', partial: 'shared/status', user: self
  end

  def status_to_css
    case status
    when 'online'
      'bg-success'
    when 'offline'
      'bg-grey'
    else
      'bg-dark'
    end
  end

end
