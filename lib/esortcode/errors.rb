module Esortcode #:nodoc:
  # Raised when the result of an eSortCode
  # request returns an error value.
  class ResponseError < RuntimeError
    attr_reader :response
    def initialize(msg, response)
      super(msg)
      @response = response
    end
  end

  # A generic validation error, check the
  # message for the reason for this error
  # being raised.
  class ValidationError < RuntimeError; end

  # Raised when a sort code is found to be invalid.
  # A valid sort code is composed of six digits, anything
  # else will result in this error being raised.
  class InvalidSortcode < RuntimeError
    attr_reader :sort_code
    def initialize(msg, sort_code)
      super(msg)
      @sort_code = sort_code
    end
  end

  # Raised when an account number is found to
  # be invalid. A valid account number is composed of
  # eight digits.
  class InvalidAccountNumber < RuntimeError
    attr_reader :account_number
    def initialize(msg, account_number)
      super(msg)
      @account_number = account_number
    end
  end

  # Raised when a credit card number is found
  # to be invalid. A valid credit card number
  # is composed of digits.
  class InvalidCreditCardNumber < RuntimeError
    attr_reader :card_number
    def initialize(msg, card_number)
      super(msg)
      @card_number = card_number
    end
  end
end
