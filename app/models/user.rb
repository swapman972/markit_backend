class User < ApplicationRecord
    has_many :ratings
    has_many :events, through: :ratings
    validates :firstN, presence: true
    validates :lastN, presence: true
    validates :zipcode, presence: true
end
