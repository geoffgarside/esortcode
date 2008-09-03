module Esortcode
  class Client
    include HTTParty
    
    base_uri 'https://ws.esortcode.com/bankdetails.asmx'
    default_params :sIPAddress => ''
    
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
    # If either +sort_code+ or +account_number+ are invalid an exception will
    # be raised, they are +InvalidSortcode+ and +InvalidAccountNumber+
    # respectively.
    def validate_account(sort_code, account_number)
      validate_sort_code(sort_code)
      validate_account_number(account_number)
      
      self.class.post('ValidateAccount',
        { :sSortcode => sort_code,
          :sAccountNumber => account_number})
    end
    
    # This function is used to return the Branch Details for a Sort Code.
    # 
    # If +sort_code+ is invalid an exception +InvalidSortcode+ will be
    # raised.
    def branch_details(sort_code)
      validate_sort_code(sort_code)
      
      self.class.post('BranchDetails', {:sSortcode => sort_code})
    end
    
    # This function is used to transpose Non-standard 
    # (i.e. 6, 7, 9 & 10 digit) Account Numbers into 
    # Standard (i.e. 8 digit) Account Numbers.
    # 
    # If either +sort_code+ or +account_number+ are invalid an exception will
    # be raised, they are +InvalidSortcode+ and +ValidationError+
    # respectively. The +ValidationError+ is raised in the case that
    # the +account_number+ is not composed of only digits.
    def standardise_account(sort_code, account_number)
      validate_sort_code(sort_code)
      unless account_number.match(/[0-9]+/)
        raise ValidationError, "#{account_number} is not valid."
      end
      
      self.class.post('StandardiseAccount',
        { :sSortcode => sort_code,
          :sAccountNumber => account_number})
    end
    
    # This function incorporates the StandardiseAccount, ValidateAccount
    # and BranchDetails web services into one web service.
    # 
    # If either +sort_code+ or +account_number+ are invalid an exception will
    # be raised, they are +InvalidSortcode+ and +InvalidAccountNumber+
    # respectively.
    def validate_account_get_branch_details(sort_code, account_number)
      validate_sort_code(sort_code)
      validate_account_number(account_number)
      
      self.class.post('ValidateAccountGetBranchDetails',
        { :sSortcode => sort_code,
          :sAccountNumber => account_number})
    end
    
    # This function is used to Validate a Credit Card Number.
    # 
    # If +credit_card_number+ is invalid an exception 
    # +InvalidCreditCardNumber+ will be raised.
    def validate_credit_card(credit_card_number)
      validate_credit_card(credit_card_number)
      
      self.class.post('ValidateCreditCard',
        {:sCreditCardNumber => credit_card_number})
    end
    
    private
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
      def validate_credit_card(cc)
        unless cc.match(/[0-9]+/)
          raise InvalidCreditCardNumber, "#{cc} is not valid"
        end
      end
  end
end
