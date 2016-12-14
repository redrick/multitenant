class Account < ApplicationRecord
  default_scope { where(tenant: Tenant.current_ids) }

  belongs_to :tenant
end
