module SmsManager
  class Version
    MAJOR = 0
    MINOR = 3
    PATCH = 4

    class << self
      def to_s
        [MAJOR, MINOR, PATCH].compact.join('.')
      end
    end
  end
end
