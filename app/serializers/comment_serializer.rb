class CommentSerializer < ActiveModel::Serializer
  attributes :id, :text, :post_id, :created_at

  has_one :user, serializer: UserSerializer

end