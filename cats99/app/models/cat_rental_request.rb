# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :bigint           not null, primary key
#  cat_id     :integer          not null
#  start_date :date
#  end_date   :date
#  status     :string           default("PENDING")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CatRentalRequest < ApplicationRecord
    validates :status, inclusion: { in: %w(PENDING APPROVED DENIED)}
    validate :overlapping_requests


    
    belongs_to :cat,
        foreign_key: :cat_id,
        class_name: :Cat

    def overlapping_requests
        CatRentalRequest.where.not(id: self.id)
                .where(cat_id: self.cat_id).where.not('start_date > :end_date OR end_date < :start_date', start_date: self.start_date, end_date: self.end_date)

    end
end
