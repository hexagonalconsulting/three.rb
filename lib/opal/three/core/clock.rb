module THREE
  class Clock
    include Native

    def initialize
      @native = `new THREE.Clock()`
    end

    alias_native :get_delta, :getDelta
  end
end