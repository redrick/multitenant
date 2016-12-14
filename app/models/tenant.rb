class Tenant < ApplicationRecord
  has_and_belongs_to_many :users

  def self.current_ids=(id)
    Thread.current[:tenant_ids] = id
  end

  def self.current_ids
    Thread.current[:tenant_ids]
  end
end
