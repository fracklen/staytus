class PagesController < ApplicationController

  before_filter { prepend_view_path(File.join(Staytus::Config.theme_root, 'views')) }
  layout 'frontend'

  def index
    @services = Service.ordered.includes(:status, {:active_maintenances => :service_status}).to_a
    @issues = Issue.ongoing.ordered.to_a
    @active_maintenances = Maintenance.active_now.to_a
    @upcoming_maintenances = Maintenance.upcoming.to_a
  end

end
