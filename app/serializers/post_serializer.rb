class PostSerializer < ActiveModel::Serializer
  attributes :id, :text, :title, :created_at

  has_one :user
end