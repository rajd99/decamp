class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include DeviseWhitelist
  include SetSource
  include CurrentUserConcern
  include DefaultPageContent
end



  def set_copyright
    @copyright =  DevcampViewTool::Renderer.copyright 'Ambala Jattan', 'All rights reserved'
  end


module DevcampViewTool
  class Renderer
    def self.copyright name, msg
      "&copy; #{Time.now.year} | <b>#{name}</b> #{msg}".html_safe
    end
  end
end
