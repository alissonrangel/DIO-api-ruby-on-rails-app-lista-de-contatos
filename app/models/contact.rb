class Contact < ApplicationRecord

  validates :name, uniqueness: true
end
