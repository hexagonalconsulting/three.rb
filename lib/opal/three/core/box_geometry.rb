module THREE
  class BoxGeometry
    include Native

    def initialize(arg_hash = {})
      width           = arg_hash[:width]
      height          = arg_hash[:height]
      depth           = arg_hash[:depth]
      widthSegments   = arg_hash[:widthSegments] || 1
      heightSegments  = arg_hash[:heightSegments] || 1
      depthSegments   = arg_hash[:depthSegments] || 1

      @native = `new THREE.BoxGeometry(width, height, depth, widthSegments, heightSegments, depthSegments)`
    end
  end
end