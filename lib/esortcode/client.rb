module Esortcode
  class Client
    include HTTParty
    
    base_uri 'https://ws.esortcode.com/bankdetails.asmx'
    default_params :sIPAddress => ''
    format :xml
    
    # Creates an instance of the client.
    # 
    # +account_name+::
    #   The name of your account with esortcode.com. This 
    #   is sent to you via email and is listed as 
    #   AccountName and is uppercase.
    # +license_id+::
    #   The license ID of your account. This is a string 
    #   of letters and numbers intersperced with hyphens.
    def initialize(account_name, license_id)
      self.class.default_params :sUserName => account_name,
                                :sGUID => license_id
    end
    
    # This function is used to Validate a UK Bank Sortcode and Account Number.
    # 
    # :call-seq: validate_account(sort_code, account_number) -> (true|false)
    # 
    # *Raises*
    # * InvalidSortcode if +sort_code+ is not valid
    # * InvalidAccountNumber if +account_number+ is not valid
    # * ResponseError with the error message if there was an eSortCode.com error
    # 
    #--
    # Currently no way to access the reason why the details are invalid.
    #++
    def validate_account(sort_code, account_number)
      validate_sort_code(sort_code)
      validate_account_number(account_number)
      
      resp = get_response('/ValidateAccount',
              { :sSortcode => sort_code,
                :sAccountNumber => account_number})
      return resp.valid?
    end
    
    # This function is used to return the Branch Details for a Sort Code.
    # 
    # *Raises*
    # * InvalidSortcode if +sort_code+ is not valid
    def branch_details(sort_code)
      validate_sort_code(sort_code)
      
      resp = get_response('BranchDetails', {:sSortcode => sort_code})
      
    end
    
    # This function is used to transpose Non-standard 
    # (i.e. 6, 7, 9 & 10 digit) Account Numbers into 
    # Standard (i.e. 8 digit) Account Numbers.
    # 
    # *Raises*
    # * InvalidSortcode if +sort_code+ is not valid
    # * InvalidAccountNumber if +account_number+ is not valid
    # 
    #--
    # Uses the +validate_account_number_flex method which checks
    # to see if the account number is between 6 and 10 digits long.
    #++
    def standardise_account(sort_code, account_number)
      validate_sort_code(sort_code)
      validate_account_number_flex(account_number)
      
      get_response('StandardiseAccount',
        { :sSortcode => sort_code,
          :sAccountNumber => account_number})
    end
    
    # This function incorporates the StandardiseAccount, ValidateAccount
    # and BranchDetails web services into one web service.
    # 
    # *Raises*
    # * InvalidSortcode if +sort_code+ is not valid
    # * InvalidAccountNumber if +account_number+ is not valid
    # 
    #--
    # Uses the +validate_account_number_flex method which checks
    # to see if the account number is between 6 and 10 digits long.
    #++
    def validate_account_get_branch_details(sort_code, account_number)
      validate_sort_code(sort_code)
      validate_account_number_flex(account_number)
      
      get_response('ValidateAccountGetBranchDetails',
        { :sSortcode => sort_code,
          :sAccountNumber => account_number})
    end
    
    # This function is used to Validate a Credit Card Number.
    # 
    # :call-seq: validate_credit_card(credit_card_number) -> (true|false)
    # 
    # *Raises*
    # * InvalidCreditCardNumber if +credit_card_number+ is not valid.
    # * ResponseError with the error message if there was an error.
    #--
    # FIXME: The return type for this request is a CardType in the
    # ValidationMessage field. We might want to change XMLResponse#valid?
    # to check for INVALID instead of VALID.
    # Once we know if its valid or not we then need to get the
    # Card Type and return that.
    #++
    def validate_credit_card(credit_card_number)
      validate_credit_card(credit_card_number)
      
      resp = get_response('ValidateCreditCard',
                {:sCreditCardNumber => credit_card_number})
      return resp.valid?
    end
    
    private
      def get_response(path, options = {})
        resp = XMLResponse.new(self.class.get(path, {:query => options}))
        raise ResponseError, resp.error_message if resp.error?
        resp
      end
      def validate_sort_code(sc)
        unless sc.match(/^[0-9]{6}$/)
          raise InvalidSortcode, "#{sc} is not valid"
        end
      end
      def validate_account_number(an)
        unless an.match(/^[0-9]{8}$/)
          raise InvalidAccountNumber, "#{an} is not valid"
        end
      end
      def validate_account_number_flex(an)
        unless an.match(/^[0-9]{6,10}$/)
          raise InvalidAccountNumber, "#{an} is not valid"
        end
      end
      def validate_credit_card(cc)
        unless cc.match(/[0-9]+/)
          raise InvalidCreditCardNumber, "#{cc} is not valid"
        end
      end
  end
end
