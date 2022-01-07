class Comment < ActiveRecord::Base
  validates :commenter, presence: true
  validates :descr, presence: true, length: { minimum: 3 }
  belongs_to :article
end
