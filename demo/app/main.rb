require 'opal'
require 'browser'
require 'three'
require 'pp'

  $cubes = []

  def animate(effect, clock, room, camera, scene, controls)
    effect.request_animation_frame( -> {send(:animate, effect, clock, room, camera, scene, controls)})
    render(clock, room, scene, camera, controls, effect);
  end

  def render(clock, room, scene, camera, controls, effect)
    delta = clock.get_delta * 60
    $cubes.each do |cube|
      cube.user_data.velocity.multiply_scalar( 1 - ( 0.001 * delta ) )
      cube.position.add( cube.user_data.velocity );

      if ( cube.position.x < - 3 || cube.position.x > 3 )
        cube.position.x = 3 if cube.position.x > 3
        cube.position.x = -3 if cube.position.x < -3
        cube.user_data.velocity.x = - cube.user_data.velocity.x;
      end

      if ( cube.position.y < - 3 || cube.position.y > 3 )
        cube.position.y = 3 if cube.position.y > 3
        cube.position.y = -3 if cube.position.y < -3
        cube.user_data.velocity.y = - cube.user_data.velocity.y
      end

      if ( cube.position.z < - 3 || cube.position.z > 3 )
        cube.position.z = 3 if cube.position.z > 3
        cube.position.z = -3 if cube.position.z < -3
        cube.user_data.velocity.z = - cube.user_data.velocity.z
      end

      cube.rotation.x += cube.user_data.velocity.x * 2 * delta;
      cube.rotation.y += cube.user_data.velocity.y * 2 * delta;
      cube.rotation.z += cube.user_data.velocity.z * 2 * delta;
    end
    controls.update
    effect.render( scene, camera );

  end

  container = $document.create_element( 'div' );
  $document.body << container

  scene  = THREE::Scene.new
  clock = THREE::Clock.new

  aspect_ratio = $$.innerWidth / $$.innerHeight
  camera = THREE::PerspectiveCamera.new(field_of_view: 70, aspect_ratio: aspect_ratio, near: 0.1, far: 10)
  scene.add(camera)


  box_room = THREE::BoxGeometry.new(width: 6,
                                    height: 6,
                                    depth: 6,
                                    widthSegments: 8,
                                    heightSegments: 8,
                                    depthSegments: 8)
  geo_room = THREE::MeshBasicMaterial.new( { color: 0x404040, wireframe: true })
  room = THREE::Mesh.new(box_room.to_n, geo_room.to_n)
  scene.add(room);

  scene.add( THREE::HemisphereLight.new( sky_color: 0x606060, ground_color: 0x404040 ) )


  light = THREE::DirectionalLight.new( hex: 0xffffff )
  light.position.set( 1, 1, 1 ).normalize()
  scene.add( light )


  geometry = THREE::BoxGeometry.new( width: 0.15, height: 0.15, depth: 0.15 )

  200.times do |i|

    object = THREE::Mesh.new( geometry.to_n, THREE::MeshLambertMaterial.new( { color: rand * 0xffffff } ).to_n)

    object.position.x = rand * 4 - 2
    object.position.y = rand * 4 - 2
    object.position.z = rand * 4 - 2

    object.rotation.x = rand * 2 * 3.14
    object.rotation.y = rand * 2 * 3.14
    object.rotation.z = rand * 2 * 3.14

    object.scale.x = rand + 0.5
    object.scale.y = rand + 0.5
    object.scale.z = rand + 0.5

    object.user_data.velocity = THREE::Vector3.new()
    object.user_data.velocity.x = rand * 0.01 - 0.005
    object.user_data.velocity.y = rand * 0.01 - 0.005
    object.user_data.velocity.z = rand * 0.01 - 0.005

    room.add( object.to_n )
    $cubes << object

  end



  renderer = THREE::WebGLRenderer.new({ antialias: true })
  renderer.set_size($$.innerWidth, $$.innerHeight)

  container << renderer.dom_element.to_n
  controls = THREE::VrControls.new(camera.to_n)
  effect = THREE::VrEffect.new(renderer.to_n)

  if $$.navigator.getVRDisplays
    $$.navigator.getVRDisplays().then do |displays|
      effect.setVRDisplay(displays[ 0 ])
      controls.setVRDisplay( displays[ 0 ])
    end
    $document.body << WebVr.get_button( effect.to_n )
  end

  animate(effect, clock, room, camera, scene, controls)
