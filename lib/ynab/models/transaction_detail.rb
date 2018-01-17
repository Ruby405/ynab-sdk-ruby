=begin
#YNAB API Endpoints

#Our API uses a REST based design, leverages the JSON data format, and relies upon HTTPS for transport. We respond with meaningful HTTP response codes and if an error occurs, we include error details in the response body.  API Documentation is at https://api.youneedabudget.com

OpenAPI spec version: 1.0.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.3.1

=end

require 'date'

module YnabApi

  class TransactionDetail
    attr_accessor :id

    attr_accessor :date

    # The transaction amount in milliunits format
    attr_accessor :amount

    attr_accessor :memo

    # The cleared status of the transaction
    attr_accessor :cleared

    # Whether or not the transaction is approved
    attr_accessor :approved

    attr_accessor :flag

    attr_accessor :account_id

    attr_accessor :payee_id

    attr_accessor :category_id

    attr_accessor :transfer_account_id

    # If a split transaction, the sub-transactions.
    attr_accessor :subtransactions

    class EnumAttributeValidator
      attr_reader :datatype
      attr_reader :allowable_values

      def initialize(datatype, allowable_values)
        @allowable_values = allowable_values.map do |value|
          case datatype.to_s
          when /Integer/i
            value.to_i
          when /Float/i
            value.to_f
          else
            value
          end
        end
      end

      def valid?(value)
        !value || allowable_values.include?(value)
      end
    end

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'id' => :'id',
        :'date' => :'date',
        :'amount' => :'amount',
        :'memo' => :'memo',
        :'cleared' => :'cleared',
        :'approved' => :'approved',
        :'flag' => :'flag',
        :'account_id' => :'account_id',
        :'payee_id' => :'payee_id',
        :'category_id' => :'category_id',
        :'transfer_account_id' => :'transfer_account_id',
        :'subtransactions' => :'subtransactions'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'id' => :'String',
        :'date' => :'Date',
        :'amount' => :'Float',
        :'memo' => :'String',
        :'cleared' => :'String',
        :'approved' => :'BOOLEAN',
        :'flag' => :'String',
        :'account_id' => :'String',
        :'payee_id' => :'String',
        :'category_id' => :'String',
        :'transfer_account_id' => :'String',
        :'subtransactions' => :'Array<SubTransaction>'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}){|(k,v), h| h[k.to_sym] = v}

      if attributes.has_key?(:'id')
        self.id = attributes[:'id']
      end

      if attributes.has_key?(:'date')
        self.date = attributes[:'date']
      end

      if attributes.has_key?(:'amount')
        self.amount = attributes[:'amount']
      end

      if attributes.has_key?(:'memo')
        self.memo = attributes[:'memo']
      end

      if attributes.has_key?(:'cleared')
        self.cleared = attributes[:'cleared']
      end

      if attributes.has_key?(:'approved')
        self.approved = attributes[:'approved']
      end

      if attributes.has_key?(:'flag')
        self.flag = attributes[:'flag']
      end

      if attributes.has_key?(:'account_id')
        self.account_id = attributes[:'account_id']
      end

      if attributes.has_key?(:'payee_id')
        self.payee_id = attributes[:'payee_id']
      end

      if attributes.has_key?(:'category_id')
        self.category_id = attributes[:'category_id']
      end

      if attributes.has_key?(:'transfer_account_id')
        self.transfer_account_id = attributes[:'transfer_account_id']
      end

      if attributes.has_key?(:'subtransactions')
        if (value = attributes[:'subtransactions']).is_a?(Array)
          self.subtransactions = value
        end
      end

    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @id.nil?
        invalid_properties.push("invalid value for 'id', id cannot be nil.")
      end

      if @date.nil?
        invalid_properties.push("invalid value for 'date', date cannot be nil.")
      end

      if @amount.nil?
        invalid_properties.push("invalid value for 'amount', amount cannot be nil.")
      end

      if @memo.nil?
        invalid_properties.push("invalid value for 'memo', memo cannot be nil.")
      end

      if @cleared.nil?
        invalid_properties.push("invalid value for 'cleared', cleared cannot be nil.")
      end

      if @approved.nil?
        invalid_properties.push("invalid value for 'approved', approved cannot be nil.")
      end

      if @flag.nil?
        invalid_properties.push("invalid value for 'flag', flag cannot be nil.")
      end

      if @account_id.nil?
        invalid_properties.push("invalid value for 'account_id', account_id cannot be nil.")
      end

      if @payee_id.nil?
        invalid_properties.push("invalid value for 'payee_id', payee_id cannot be nil.")
      end

      if @category_id.nil?
        invalid_properties.push("invalid value for 'category_id', category_id cannot be nil.")
      end

      if @transfer_account_id.nil?
        invalid_properties.push("invalid value for 'transfer_account_id', transfer_account_id cannot be nil.")
      end

      if @subtransactions.nil?
        invalid_properties.push("invalid value for 'subtransactions', subtransactions cannot be nil.")
      end

      return invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @id.nil?
      return false if @date.nil?
      return false if @amount.nil?
      return false if @memo.nil?
      return false if @cleared.nil?
      cleared_validator = EnumAttributeValidator.new('String', ["Cleared", "Uncleared", "Reconciled"])
      return false unless cleared_validator.valid?(@cleared)
      return false if @approved.nil?
      return false if @flag.nil?
      return false if @account_id.nil?
      return false if @payee_id.nil?
      return false if @category_id.nil?
      return false if @transfer_account_id.nil?
      return false if @subtransactions.nil?
      return true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] cleared Object to be assigned
    def cleared=(cleared)
      validator = EnumAttributeValidator.new('String', ["Cleared", "Uncleared", "Reconciled"])
      unless validator.valid?(cleared)
        fail ArgumentError, "invalid value for 'cleared', must be one of #{validator.allowable_values}."
      end
      @cleared = cleared
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          id == o.id &&
          date == o.date &&
          amount == o.amount &&
          memo == o.memo &&
          cleared == o.cleared &&
          approved == o.approved &&
          flag == o.flag &&
          account_id == o.account_id &&
          payee_id == o.payee_id &&
          category_id == o.category_id &&
          transfer_account_id == o.transfer_account_id &&
          subtransactions == o.subtransactions
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [id, date, amount, memo, cleared, approved, flag, account_id, payee_id, category_id, transfer_account_id, subtransactions].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.swagger_types.each_pair do |key, type|
        if type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map{ |v| _deserialize($1, v) } )
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        end # or else data not found in attributes(hash), not an issue as the data can be optional
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :DateTime
        DateTime.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :BOOLEAN
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        temp_model = YnabApi.const_get(type).new
        temp_model.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        next if value.nil?
        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map{ |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end

  end

end
