class CommentSerializer < ActiveModel::Serializer
  attributes :id, :commenter, :descr
  has_one :article
end
