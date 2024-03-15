# app/models/category.rb
class Category < ApplicationRecord
  has_many :lakes
end
