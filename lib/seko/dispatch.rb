module Seko
  class Dispatch

    def dispatches
      response.root_response["List"]["DispatchLineItem"]
    end

    # returns array of GUIDs
    def self.parse(response)
      # API is flawed and returns an array if multiple dispatches
      if dispatches.is_a?(Array)
        dispatches.collect { |h| h["GUID"] }
      else
        # and a singular object otherwise
        # so we wrap it as an array
        Array(dispatches["GUID"])
      end
    end

  end
end
