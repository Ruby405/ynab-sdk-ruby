=begin
#YNAB API Endpoints

#Our API uses a REST based design, leverages the JSON data format, and relies upon HTTPS for transport. We respond with meaningful HTTP response codes and if an error occurs, we include error details in the response body.  API Documentation is at https://api.youneedabudget.com

OpenAPI spec version: 1.0.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.0-SNAPSHOT

=end

require 'date'

module YnabApi
  class Account
    attr_accessor :id

    attr_accessor :name

    # The type of account. Note: payPal, merchantAccount, investmentAccount, and mortgage types have been deprecated and will be removed in the future.
    attr_accessor :type

    # Whether this account is on budget or not
    attr_accessor :on_budget

    # Whether this account is closed or not
    attr_accessor :closed

    attr_accessor :note

    # The current balance of the account in milliunits format
    attr_accessor :balance

    # The current cleared balance of the account in milliunits format
    attr_accessor :cleared_balance

    # The current uncleared balance of the account in milliunits format
    attr_accessor :uncleared_balance

    # Whether or not the account has been deleted.  Deleted accounts will only be included in delta requests.
    attr_accessor :deleted

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
        :'name' => :'name',
        :'type' => :'type',
        :'on_budget' => :'on_budget',
        :'closed' => :'closed',
        :'note' => :'note',
        :'balance' => :'balance',
        :'cleared_balance' => :'cleared_balance',
        :'uncleared_balance' => :'uncleared_balance',
        :'deleted' => :'deleted'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'id' => :'String',
        :'name' => :'String',
        :'type' => :'String',
        :'on_budget' => :'BOOLEAN',
        :'closed' => :'BOOLEAN',
        :'note' => :'String',
        :'balance' => :'Float',
        :'cleared_balance' => :'Float',
        :'uncleared_balance' => :'Float',
        :'deleted' => :'BOOLEAN'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.has_key?(:'id')
        self.id = attributes[:'id']
      end

      if attributes.has_key?(:'name')
        self.name = attributes[:'name']
      end

      if attributes.has_key?(:'type')
        self.type = attributes[:'type']
      end

      if attributes.has_key?(:'on_budget')
        self.on_budget = attributes[:'on_budget']
      end

      if attributes.has_key?(:'closed')
        self.closed = attributes[:'closed']
      end

      if attributes.has_key?(:'note')
        self.note = attributes[:'note']
      end

      if attributes.has_key?(:'balance')
        self.balance = attributes[:'balance']
      end

      if attributes.has_key?(:'cleared_balance')
        self.cleared_balance = attributes[:'cleared_balance']
      end

      if attributes.has_key?(:'uncleared_balance')
        self.uncleared_balance = attributes[:'uncleared_balance']
      end

      if attributes.has_key?(:'deleted')
        self.deleted = attributes[:'deleted']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @id.nil?
        invalid_properties.push('invalid value for "id", id cannot be nil.')
      end

      if @name.nil?
        invalid_properties.push('invalid value for "name", name cannot be nil.')
      end

      if @type.nil?
        invalid_properties.push('invalid value for "type", type cannot be nil.')
      end

      if @on_budget.nil?
        invalid_properties.push('invalid value for "on_budget", on_budget cannot be nil.')
      end

      if @closed.nil?
        invalid_properties.push('invalid value for "closed", closed cannot be nil.')
      end

      if @note.nil?
        invalid_properties.push('invalid value for "note", note cannot be nil.')
      end

      if @balance.nil?
        invalid_properties.push('invalid value for "balance", balance cannot be nil.')
      end

      if @cleared_balance.nil?
        invalid_properties.push('invalid value for "cleared_balance", cleared_balance cannot be nil.')
      end

      if @uncleared_balance.nil?
        invalid_properties.push('invalid value for "uncleared_balance", uncleared_balance cannot be nil.')
      end

      if @deleted.nil?
        invalid_properties.push('invalid value for "deleted", deleted cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @id.nil?
      return false if @name.nil?
      return false if @type.nil?
      type_validator = EnumAttributeValidator.new('String', ['checking', 'savings', 'cash', 'creditCard', 'lineOfCredit', 'otherAsset', 'otherLiability', 'payPal', 'merchantAccount', 'investmentAccount', 'mortgage'])
      return false unless type_validator.valid?(@type)
      return false if @on_budget.nil?
      return false if @closed.nil?
      return false if @note.nil?
      return false if @balance.nil?
      return false if @cleared_balance.nil?
      return false if @uncleared_balance.nil?
      return false if @deleted.nil?
      true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] type Object to be assigned
    def type=(type)
      validator = EnumAttributeValidator.new('String', ['checking', 'savings', 'cash', 'creditCard', 'lineOfCredit', 'otherAsset', 'otherLiability', 'payPal', 'merchantAccount', 'investmentAccount', 'mortgage'])
      unless validator.valid?(type)
        fail ArgumentError, 'invalid value for "type", must be one of #{validator.allowable_values}.'
      end
      @type = type
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          id == o.id &&
          name == o.name &&
          type == o.type &&
          on_budget == o.on_budget &&
          closed == o.closed &&
          note == o.note &&
          balance == o.balance &&
          cleared_balance == o.cleared_balance &&
          uncleared_balance == o.uncleared_balance &&
          deleted == o.deleted
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [id, name, type, on_budget, closed, note, balance, cleared_balance, uncleared_balance, deleted].hash
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
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map { |v| _deserialize($1, v) })
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
        value.compact.map { |v| _to_hash(v) }
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
