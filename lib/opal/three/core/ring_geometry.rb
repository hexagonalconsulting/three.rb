module THREE
  class RingGeometry
    include Native

    def initialize(arg_hash = {})
      innerRadius   = arg_hash[:innerRadius] || 0
      outerRadius   = arg_hash[:outerRadius] || 50
      thetaSegments = arg_hash[:thetaSegments] || 8
      phiSegments   = arg_hash[:phiSegments] || 8
      thetaStart    = arg_hash[:thetaStart] || 0
      thetaLength   = arg_hash[:thetaLength] || 3.141592653589793 * 2

      @native = `new THREE.RingGeometry(innerRadius, outerRadius, thetaSegments, phiSegments, thetaStart, thetaLength)`
    end
  end
end