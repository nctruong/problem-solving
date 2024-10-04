# ============================================== CLOSE
class AirPlaneFactory
  @registry = {}

  def self.register(name, klass)
    @registry[name] = klass
  end

  def self.create_plane(type)
    @registry[type] ? @registry[type].new : raise("Not registered #{type} yet")
  end
end

# This interface is the key to make sure new code work on legacy code.
# Let's say the legacy use 'fly' interface thousands times.
# Create new Airplane with this fly interface that makes sure it works well when it injected to legacy code.
# Imagine it not only has fly but also has many other interfaces.
# 1. create new airplane
# 2. register it with factory.
class AirPlane
  def fly
    raise NotImplementedError
  end
end

class B40 < AirPlane
  def fly; end
end

class B50 < AirPlane
  def fly; end
end

# ========================================= OPEN
class B60 < AirPlane
  def fly; end
end
AirPlaneFactory.register(:B60, B60)
AirPlaneFactory.create_plane(:B60)

#OR

class B60 < AirPlane
  def self.register
    AirPlaneFactory.register(:B60, self)
  end

  def fly; end
end

B60.register
AirPlaneFactory.create_plane(:B60)