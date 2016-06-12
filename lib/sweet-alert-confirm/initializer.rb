require 'sweet-alert-confirm/view_helpers'
module SweetAlertConfirm
  class Initializer
    def self.enable
      ActionView::Base.send :include, SweetAlertConfirm::ViewHelpers
    end
  end
end
