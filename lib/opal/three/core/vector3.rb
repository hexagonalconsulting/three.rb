module THREE
  class Vector3
    include Native

    def initialize
      @native = `new THREE.Vector3()`
    end

    alias_native :multiply_scalar, :multiplyScalar

  end
end