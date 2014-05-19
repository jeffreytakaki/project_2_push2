class Wedding
  include Mongoid::Document

    belongs_to :person1, class_name: "User", inverse_of: :person1s
	belongs_to :person2, class_name: "User", inverse_of: :person2s
	has_many :attendees, class_name: "User", inverse_of: :wedding2
end


