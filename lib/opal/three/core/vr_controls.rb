module THREE
  class VrControls
    include Native

    def initialize(camera)
      @native = `new THREE.VRControls(camera)`
    end

    alias_native :setVRDisplay
    alias_native :update
  end
end