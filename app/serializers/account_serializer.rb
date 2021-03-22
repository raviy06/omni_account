class AccountSerializer
  include JSONAPI::Serializer
  include ApiRouteHelper

  attributes :uid, :account_type, :customer_id, :customer_name, :minor_indicator, :opened_at, :branch

  link :self do |object|
    self_url(object)
  end
end
