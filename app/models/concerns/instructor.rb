class Instructor < ApplicationRecord
    has_many :students, dependent: :destroy
    validates :name, presence: true, allow_nil: true
end
