module THREE
  class Mesh
    include Native

    def initialize(geometry, material)
      @native = `new THREE.Mesh(geometry, material)`
    end

    alias_native :rotation
    alias_native :position
    alias_native :scale
    alias_native :user_data, :userData
    alias_native :add
    alias_native :children
  end
end