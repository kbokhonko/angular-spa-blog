class UserSerializer < ActiveModel::Serializer
  attributes :id, :short_email, :email

  def short_email
    object.email.split('@')[0]
  end
end