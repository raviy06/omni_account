class Account < ApplicationRecord

  before_create :generate_uid
  before_create :set_opened_at

  private
    def generate_uid
      self.uid = SecureRandom.hex
    end

    def set_opened_at
      self.opened_at = Time.current
    end
end
