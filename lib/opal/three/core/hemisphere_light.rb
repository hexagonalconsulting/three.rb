module THREE
  class HemisphereLight
    include Native

    def initialize(arg_hash = {})
      sky_color    = arg_hash[:sky_color] || 0xffffff
      ground_color = arg_hash[:ground_color] || 0xffffff
      depth        = arg_hash[:depth] || 1

      @native = `new THREE.HemisphereLight(sky_color, ground_color, depth)`
    end
  end
end