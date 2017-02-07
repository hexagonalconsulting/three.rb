module THREE
  class MeshLambertMaterial
    include Native

    def initialize(arg_hash = {})

      @native = `new THREE.MeshLambertMaterial(#{arg_hash.to_n})`
    end
  end
end