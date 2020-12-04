class User
  def initialize(name, bio, age, password)
    @name = name
    @bio = bio
    @age = age
    @authenticator = Authenticator.new(password)
  end

  def authenticate(candidate_password)
    @authenticator.authenticate(candidate_password)
  end

  def profile
    "#{@name}, born in #{birth_year}: #{@bio}"
  end

  private

  def birth_year
    Time.new.year - @age
  end
end

class Authenticator

  def initialize(password)
    @password = password
  end

  def authenticate(candidate_password)
    return true if candidate_password == @password
    false
  end

end