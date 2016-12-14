class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :current_tenants

  private

  def current_tenants
    Tenant.current_ids = current_user.tenants.pluck(:id) if current_user
  end
end
