module SweetAlertConfirm
  module ViewHelpers
    def link_to(*args, &block)
      html_options = args[block_given? ? 1 : 2] || {}

      if options_has_confirm?(html_options)
        html_options['data-sweet-alert-confirm'] = confirm_data(html_options)
      end
      super *args, &block
    end

    def submit_tag(value = 'Save changes', options = {})
      if options_has_confirm?(options)
        options['data-sweet-alert-confirm'] =  confirm_data(options)
      end
      super value, options
    end

    def button_tag(*args, &block)
      html_options = args[block_given? ? 0 : 1] || {}

      if options_has_confirm?(html_options)
        html_options['data-sweet-alert-confirm'] = confirm_data(html_options)
      end
      super *args, &block
    end

    def button_to(*args, &block)
      html_options = args[block_given? ? 1 : 2] || {}

      if options_has_confirm?(html_options)
        html_options['data-sweet-alert-confirm'] = confirm_data(html_options)
      end
      super *args, &block
    end

    protected

    def confirm_data(options)
      options.delete(:confirm) || options[:data].delete(:confirm)
    end

    def options_has_confirm?(options)
      confirm_present = options[:confirm] || (options[:data] && options[:data][:confirm])
      return true if confirm_present.present?
      false
    end
  end
end
