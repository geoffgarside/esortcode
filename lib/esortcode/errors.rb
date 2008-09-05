module Esortcode #:nodoc:
  # Raised when the result of an eSortCode
  # request returns an error value.
  class ResponseError < ::Exception; end
  
  # :stopdoc:
  class ResponseInvalid < ::Exception; end
  # :startdoc:
  
  # A generic validation error, check the
  # message for the reason for this error
  # being raised.
  class ValidationError < ::Exception; end
  
  # Raised when a sort code is found to be invalid.
  # A valid sort code is composed of six digits, anything
  # else will result in this error being raised.
  class InvalidSortcode < ::Exception; end
  
  # Raised when an account number is found to
  # be invalid. A valid account number is composed of
  # eight digits.
  class InvalidAccountNumber < ::Exception; end
  
  # Raised when a credit card number is found
  # to be invalid. A valid credit card number
  # is composed of digits.
  class InvalidCreditCardNumber < ::Exception; end
end
