class Test < ApplicationRecord
  scope :after_cursor, -> (cursor) { Test.order(:created_at).where(id >= cursor).limit(records_number) }

  def self.after(cursor, limit = page_limit)
    result = order(:created_at).where("id > #{cursor}").limit(limit)
  end

  def self.before(cursor, limit = page_limit)
    result = order(created_at: :desc).where("id < #{cursor}").limit(limit).reverse
  end

  def self.page_limit
    20
  end
end
