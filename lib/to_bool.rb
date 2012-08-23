##
# Monkey-patch to provide handy to_bool method, to make dealing with arbitrary
# parsing of HTTP parameters when we just want booleans.
#
class Object
  ##
  # Monkey-patch for `Object` to turn certain values into `true` or `false`
  # based on what you'd intuitively expect when dealing with HTTP request
  # parameters.  Specifically, things that coerce to strings like "true", "t",
  # or "1" becomes `true`, things that coerce to strings like "false", "",
  # "no", or "0" become `false` -- and anything that's not fairly unambiguous
  # causes an exception.
  #
  # Specifically:
  #
  # * Returns `true`, if `#to_s =~ /^(true|t|yes|y|1)$/i`
  # * Returns `false`, if `#to_s =~ /^(false|f|no|n|0|)$/i`
  #   * Note that the empty string is considered `false`.
  # * Otherwises, raises `ArgumentError`.
  #
  def to_bool
    return true if (self.to_s =~ /^(true|t|yes|y|1)$/i)
    return false if (self.to_s =~ /^(false|f|no|n|0|)$/i)
    raise ArgumentError.new("don't know how to convert to a bool.")
  end
end

##
# Monkey-patch to provide handy to_bool method, to make dealing with arbitrary
# parsing of HTTP parameters when we just want booleans.
#
class Fixnum
  ##
  # Monkey-patch for `Fixnum` to turn non-zero values into `true`, and zero into
  # `false`.  Matches the API for the `Object#to_bool` monkey-patch.
  #
  def to_bool
    return (self != 0)
  end
end

##
# Monkey-patch to provide handy to_bool method, to make dealing with arbitrary
# parsing of HTTP parameters when we just want booleans.
#
class NilClass
  ##
  # Monkey-patch for `NilClass` to match the API for the `Object#to_bool`
  # monkey patch.  Returns `false`.
  #
  def to_bool
    return false
  end
end

##
# Monkey-patch to provide handy to_bool method, to make dealing with arbitrary
# parsing of HTTP parameters when we just want booleans.
#
class TrueClass
  ##
  # Monkey-patch for `TrueClass` to match the API for the `Object#to_bool`
  # monkey patch.  Returns `true`.
  #
  def to_bool
    return self
  end
end

##
# Monkey-patch to provide handy to_bool method, to make dealing with arbitrary
# parsing of HTTP parameters when we just want booleans.
#
class FalseClass
  ##
  # Monkey-patch for `FalseClass` to match the API for the `Object#to_bool`
  # monkey patch.  Returns `false`.
  #
  def to_bool
    return self
  end
end
