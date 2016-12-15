module Tenantable
  extend ActiveSupport::Concern

  included do
    default_scope { where(tenant: Tenant.current_ids) }

    belongs_to :tenant

    validates :tenant, presence: true
    before_validation :assign_tenant
  end

  private

  def assign_tenant
    return if tenant || Tenant.current_ids.count > 1
    self.tenant = Tenant.current_ids.first
  end
end
