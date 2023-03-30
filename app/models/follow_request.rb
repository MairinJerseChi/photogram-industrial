class FollowRequest < ApplicationRecord
  belongs_to :recipient, class_name: "User"
  belongs_to :sender, class_name: "User"

  enum status: { pending: "pending", rejected: "rejected", accepted: "accepted" }
  scope :accepted, -> {where(status:"accepted")}
  scope :not_accepted, -> {where.not(status:"accepted")}

end
