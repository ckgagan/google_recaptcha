
module Renderer
  include ActionView::Helpers::TagHelper

  def recaptcha_html
    "<div class='g-recaptcha' data-sitekey='#{GoogleRecaptcha.configuration.site_key}'></div>".html_safe
  end

end