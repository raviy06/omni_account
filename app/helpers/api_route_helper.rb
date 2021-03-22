module ApiRouteHelper
  extend ActiveSupport::Concern
  include Rails.application.routes.url_helpers

  class_methods do
    def self_url object
      Rails.application.routes.url_helpers.api_v1_account_url(object, only_path: true)
    end
  end
end