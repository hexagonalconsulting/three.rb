module THREE
  class DirectionalLight
    include Native

    def initialize(arg_hash = {})
      color      = arg_hash[:hex] || 0xffffff
      intensity  = arg_hash[:intensity] || 1

      @native = `new THREE.DirectionalLight(color, intensity)`
    end

    alias_native :position

  end
end