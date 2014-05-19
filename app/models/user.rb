require 'bcrypt'

class User
  include Mongoid::Document
  field :attendance, type: Boolean
  field :name, type: String
  field :email, type: String
  field :phoneNum, type: String
  field :message, type: String
  field :password_digest, type: String


  validates :name, presence: true
  validates_length_of :message, minimum: 5, maximum: 9999
  validates :email, presence: true
  validates_length_of :phoneNum, minimum: 10, maximum: 10

  has_many :person1s, class_name: "Wedding", inverse_of: :person1
  has_many :person2s, class_name: "Wedding", inverse_of: :person2
  belongs_to :wedding2, class_name: "Wedding", inverse_of: :attendees

  def password
  	@password
  end

  def password=(new_password)
  	 @password = new_password
    self.password_digest = BCrypt::Password.create(new_password)
  end

  def authenticate(test_password)
    if BCrypt::Password.new(self.password_digest) == test_password
      self
    else
      false
    end
  end

end


