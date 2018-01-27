class User < ActiveRecord::Base
	validates :name , presence: true, length: {minimum: 5, maximum: 20}
	validates :field , presence: true, length: {minimum: 5, maximum: 20}


end