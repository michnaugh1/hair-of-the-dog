# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '37014cf63659cc747b5d4b530a396e9c'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password

  include AuthenticatedSystem
  
  before_filter :get_pages_for_tabs
  
  def get_pages_for_tabs
    if logged_in?
      @tabs = Page.find(:all)
    else
      @tabs = Page.find(:all, :conditions => ["admin != ?", true])
    end
  
  end
end
