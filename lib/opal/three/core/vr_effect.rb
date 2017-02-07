module THREE
  class VrEffect
    include Native

    def initialize(renderer)
      @native = `new THREE.VREffect(renderer)`
    end

    alias_native :request_animation_frame, :requestAnimationFrame
    alias_native :setVRDisplay
    alias_native :requestPresent
    alias_native :render
  end
end