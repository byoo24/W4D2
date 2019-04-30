# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date
#  color       :string
#  name        :string           not null
#  sex         :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ApplicationRecord 
    validates :name, presence: true
    validates :color, inclusion: { in: %w(red orange yellow green blue indigo violet)}
    


    has_many :cat_rental_requests,
        foreign_key: :cat_id,
        class_name: :CatRentalRequest,
        dependent: :destroy
end
