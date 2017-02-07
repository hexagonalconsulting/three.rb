class WebVr
  include Native

  def self.get_button(effect)
    @native = `WEBVR.getButton( effect )`
  end
end
