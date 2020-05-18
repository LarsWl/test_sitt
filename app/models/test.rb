class Test < ApplicationRecord
  scope :after_cursor, -> (cursor) { Test.order(:created_at).where(id >= cursor).limit(records_number) }

  def self.after(cursor)
    result = order(:created_at).where("id > #{cursor}").limit(page_limit)
  end

  def self.page_limit
    20
  end
end
