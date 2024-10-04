# Two base classes: Class to build and Builder
class Profile
  attr_accessor :name, :address, :phone

  def to_s
    "#{name}, #{address}, #{phone}"
  end
end

class ProfileBuilder
  def set_name(name)
    raise NotImplementedError
  end

  def address(address)
    raise NotImplementedError
  end

  def phone(phone)
    raise NotImplementedError
  end
end

# ----------------------------------------
# Two classes: Concrete Builder and Director
class DevProfileBuilder < ProfileBuilder
  attr_reader :profile

  def initialize
    @profile = Profile.new
  end

  def set_name(name)
    @profile.name = name
  end

  def set_address(address)
    @profile.address = address
  end

  def set_phone(phone)
    @profile.phone = phone
  end
end

class Director
  def initialize(builder)
    @builder = builder.new
  end

  def build_profile
    @builder.set_name('Will')
    @builder.set_address('Tecco, VN')
    @builder.set_phone('234567656565')
  end

  def profile
    @builder.profile
  end
end

director = Director.new(DevProfileBuilder)
director.build_profile
puts director.profile.to_s
