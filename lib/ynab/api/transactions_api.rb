=begin
#YNAB API Endpoints

#Our API uses a REST based design, leverages the JSON data format, and relies upon HTTPS for transport. We respond with meaningful HTTP response codes and if an error occurs, we include error details in the response body.  API Documentation is at https://api.youneedabudget.com

OpenAPI spec version: 1.0.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.14

=end

require 'uri'

module YNAB
  class TransactionsApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Create a single transaction or multiple transactions
    # Creates a single transaction or multiple transactions.  If you provide a body containing a `transaction` object, a single transaction will be created and if you provide a body containing a `transactions` array, multiple transactions will be created.  Scheduled transactions cannot be created on this endpoint.
    # @param budget_id The id of the budget (\&quot;last-used\&quot; can be used to specify the last used budget and \&quot;default\&quot; can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget)
    # @param data The transaction or transactions to create.  To create a single transaction you can specify a value for the &#x60;transaction&#x60; object and to create multiple transactions you can specify an array of &#x60;transactions&#x60;.  It is expected that you will only provide a value for one of these objects.
    # @param [Hash] opts the optional parameters
    # @return [SaveTransactionsResponse]
    def create_transaction(budget_id, data, opts = {})
      data, _status_code, _headers = create_transaction_with_http_info(budget_id, data, opts)
      data
    end

    # Create a single transaction or multiple transactions
    # Creates a single transaction or multiple transactions.  If you provide a body containing a &#x60;transaction&#x60; object, a single transaction will be created and if you provide a body containing a &#x60;transactions&#x60; array, multiple transactions will be created.  Scheduled transactions cannot be created on this endpoint.
    # @param budget_id The id of the budget (\&quot;last-used\&quot; can be used to specify the last used budget and \&quot;default\&quot; can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget)
    # @param data The transaction or transactions to create.  To create a single transaction you can specify a value for the &#x60;transaction&#x60; object and to create multiple transactions you can specify an array of &#x60;transactions&#x60;.  It is expected that you will only provide a value for one of these objects.
    # @param [Hash] opts the optional parameters
    # @return [Array<(SaveTransactionsResponse, Fixnum, Hash)>] SaveTransactionsResponse data, response status code and response headers
    def create_transaction_with_http_info(budget_id, data, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TransactionsApi.create_transaction ...'
      end
      # verify the required parameter 'budget_id' is set
      if @api_client.config.client_side_validation && budget_id.nil?
        fail ArgumentError, "Missing the required parameter 'budget_id' when calling TransactionsApi.create_transaction"
      end
      # verify the required parameter 'data' is set
      if @api_client.config.client_side_validation && data.nil?
        fail ArgumentError, "Missing the required parameter 'data' when calling TransactionsApi.create_transaction"
      end
      # resource path
      local_var_path = '/budgets/{budget_id}/transactions'.sub('{' + 'budget_id' + '}', budget_id.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(data)
      auth_names = ['bearer']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'SaveTransactionsResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TransactionsApi#create_transaction\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Single transaction
    # Returns a single transaction
    # @param budget_id The id of the budget (\&quot;last-used\&quot; can be used to specify the last used budget and \&quot;default\&quot; can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget)
    # @param transaction_id The id of the transaction
    # @param [Hash] opts the optional parameters
    # @return [TransactionResponse]
    def get_transaction_by_id(budget_id, transaction_id, opts = {})
      data, _status_code, _headers = get_transaction_by_id_with_http_info(budget_id, transaction_id, opts)
      data
    end

    # Single transaction
    # Returns a single transaction
    # @param budget_id The id of the budget (\&quot;last-used\&quot; can be used to specify the last used budget and \&quot;default\&quot; can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget)
    # @param transaction_id The id of the transaction
    # @param [Hash] opts the optional parameters
    # @return [Array<(TransactionResponse, Fixnum, Hash)>] TransactionResponse data, response status code and response headers
    def get_transaction_by_id_with_http_info(budget_id, transaction_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TransactionsApi.get_transaction_by_id ...'
      end
      # verify the required parameter 'budget_id' is set
      if @api_client.config.client_side_validation && budget_id.nil?
        fail ArgumentError, "Missing the required parameter 'budget_id' when calling TransactionsApi.get_transaction_by_id"
      end
      # verify the required parameter 'transaction_id' is set
      if @api_client.config.client_side_validation && transaction_id.nil?
        fail ArgumentError, "Missing the required parameter 'transaction_id' when calling TransactionsApi.get_transaction_by_id"
      end
      # resource path
      local_var_path = '/budgets/{budget_id}/transactions/{transaction_id}'.sub('{' + 'budget_id' + '}', budget_id.to_s).sub('{' + 'transaction_id' + '}', transaction_id.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['bearer']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'TransactionResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TransactionsApi#get_transaction_by_id\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # List transactions
    # Returns budget transactions
    # @param budget_id The id of the budget (\&quot;last-used\&quot; can be used to specify the last used budget and \&quot;default\&quot; can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget)
    # @param [Hash] opts the optional parameters
    # @option opts [Date] :since_date If specified, only transactions on or after this date will be included.  The date should be ISO formatted (e.g. 2016-12-30).
    # @option opts [String] :type If specified, only transactions of the specified type will be included. \&quot;uncategorized\&quot; and \&quot;unapproved\&quot; are currently supported.
    # @option opts [Integer] :last_knowledge_of_server The starting server knowledge.  If provided, only entities that have changed since &#x60;last_knowledge_of_server&#x60; will be included.
    # @return [TransactionsResponse]
    def get_transactions(budget_id, opts = {})
      data, _status_code, _headers = get_transactions_with_http_info(budget_id, opts)
      data
    end

    # List transactions
    # Returns budget transactions
    # @param budget_id The id of the budget (\&quot;last-used\&quot; can be used to specify the last used budget and \&quot;default\&quot; can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget)
    # @param [Hash] opts the optional parameters
    # @option opts [Date] :since_date If specified, only transactions on or after this date will be included.  The date should be ISO formatted (e.g. 2016-12-30).
    # @option opts [String] :type If specified, only transactions of the specified type will be included. \&quot;uncategorized\&quot; and \&quot;unapproved\&quot; are currently supported.
    # @option opts [Integer] :last_knowledge_of_server The starting server knowledge.  If provided, only entities that have changed since &#x60;last_knowledge_of_server&#x60; will be included.
    # @return [Array<(TransactionsResponse, Fixnum, Hash)>] TransactionsResponse data, response status code and response headers
    def get_transactions_with_http_info(budget_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TransactionsApi.get_transactions ...'
      end
      # verify the required parameter 'budget_id' is set
      if @api_client.config.client_side_validation && budget_id.nil?
        fail ArgumentError, "Missing the required parameter 'budget_id' when calling TransactionsApi.get_transactions"
      end
      if @api_client.config.client_side_validation && opts[:'type'] && !['uncategorized', 'unapproved'].include?(opts[:'type'])
        fail ArgumentError, 'invalid value for "type", must be one of uncategorized, unapproved'
      end
      # resource path
      local_var_path = '/budgets/{budget_id}/transactions'.sub('{' + 'budget_id' + '}', budget_id.to_s)

      # query parameters
      query_params = {}
      query_params[:'since_date'] = opts[:'since_date'] if !opts[:'since_date'].nil?
      query_params[:'type'] = opts[:'type'] if !opts[:'type'].nil?
      query_params[:'last_knowledge_of_server'] = opts[:'last_knowledge_of_server'] if !opts[:'last_knowledge_of_server'].nil?

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['bearer']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'TransactionsResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TransactionsApi#get_transactions\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # List account transactions
    # Returns all transactions for a specified account
    # @param budget_id The id of the budget (\&quot;last-used\&quot; can be used to specify the last used budget and \&quot;default\&quot; can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget)
    # @param account_id The id of the account
    # @param [Hash] opts the optional parameters
    # @option opts [Date] :since_date If specified, only transactions on or after this date will be included.  The date should be ISO formatted (e.g. 2016-12-30).
    # @option opts [String] :type If specified, only transactions of the specified type will be included. \&quot;uncategorized\&quot; and \&quot;unapproved\&quot; are currently supported.
    # @option opts [Integer] :last_knowledge_of_server The starting server knowledge.  If provided, only entities that have changed since &#x60;last_knowledge_of_server&#x60; will be included.
    # @return [TransactionsResponse]
    def get_transactions_by_account(budget_id, account_id, opts = {})
      data, _status_code, _headers = get_transactions_by_account_with_http_info(budget_id, account_id, opts)
      data
    end

    # List account transactions
    # Returns all transactions for a specified account
    # @param budget_id The id of the budget (\&quot;last-used\&quot; can be used to specify the last used budget and \&quot;default\&quot; can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget)
    # @param account_id The id of the account
    # @param [Hash] opts the optional parameters
    # @option opts [Date] :since_date If specified, only transactions on or after this date will be included.  The date should be ISO formatted (e.g. 2016-12-30).
    # @option opts [String] :type If specified, only transactions of the specified type will be included. \&quot;uncategorized\&quot; and \&quot;unapproved\&quot; are currently supported.
    # @option opts [Integer] :last_knowledge_of_server The starting server knowledge.  If provided, only entities that have changed since &#x60;last_knowledge_of_server&#x60; will be included.
    # @return [Array<(TransactionsResponse, Fixnum, Hash)>] TransactionsResponse data, response status code and response headers
    def get_transactions_by_account_with_http_info(budget_id, account_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TransactionsApi.get_transactions_by_account ...'
      end
      # verify the required parameter 'budget_id' is set
      if @api_client.config.client_side_validation && budget_id.nil?
        fail ArgumentError, "Missing the required parameter 'budget_id' when calling TransactionsApi.get_transactions_by_account"
      end
      # verify the required parameter 'account_id' is set
      if @api_client.config.client_side_validation && account_id.nil?
        fail ArgumentError, "Missing the required parameter 'account_id' when calling TransactionsApi.get_transactions_by_account"
      end
      if @api_client.config.client_side_validation && opts[:'type'] && !['uncategorized', 'unapproved'].include?(opts[:'type'])
        fail ArgumentError, 'invalid value for "type", must be one of uncategorized, unapproved'
      end
      # resource path
      local_var_path = '/budgets/{budget_id}/accounts/{account_id}/transactions'.sub('{' + 'budget_id' + '}', budget_id.to_s).sub('{' + 'account_id' + '}', account_id.to_s)

      # query parameters
      query_params = {}
      query_params[:'since_date'] = opts[:'since_date'] if !opts[:'since_date'].nil?
      query_params[:'type'] = opts[:'type'] if !opts[:'type'].nil?
      query_params[:'last_knowledge_of_server'] = opts[:'last_knowledge_of_server'] if !opts[:'last_knowledge_of_server'].nil?

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['bearer']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'TransactionsResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TransactionsApi#get_transactions_by_account\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # List category transactions
    # Returns all transactions for a specified category
    # @param budget_id The id of the budget (\&quot;last-used\&quot; can be used to specify the last used budget and \&quot;default\&quot; can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget)
    # @param category_id The id of the category
    # @param [Hash] opts the optional parameters
    # @option opts [Date] :since_date If specified, only transactions on or after this date will be included.  The date should be ISO formatted (e.g. 2016-12-30).
    # @option opts [String] :type If specified, only transactions of the specified type will be included. \&quot;uncategorized\&quot; and \&quot;unapproved\&quot; are currently supported.
    # @option opts [Integer] :last_knowledge_of_server The starting server knowledge.  If provided, only entities that have changed since &#x60;last_knowledge_of_server&#x60; will be included.
    # @return [HybridTransactionsResponse]
    def get_transactions_by_category(budget_id, category_id, opts = {})
      data, _status_code, _headers = get_transactions_by_category_with_http_info(budget_id, category_id, opts)
      data
    end

    # List category transactions
    # Returns all transactions for a specified category
    # @param budget_id The id of the budget (\&quot;last-used\&quot; can be used to specify the last used budget and \&quot;default\&quot; can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget)
    # @param category_id The id of the category
    # @param [Hash] opts the optional parameters
    # @option opts [Date] :since_date If specified, only transactions on or after this date will be included.  The date should be ISO formatted (e.g. 2016-12-30).
    # @option opts [String] :type If specified, only transactions of the specified type will be included. \&quot;uncategorized\&quot; and \&quot;unapproved\&quot; are currently supported.
    # @option opts [Integer] :last_knowledge_of_server The starting server knowledge.  If provided, only entities that have changed since &#x60;last_knowledge_of_server&#x60; will be included.
    # @return [Array<(HybridTransactionsResponse, Fixnum, Hash)>] HybridTransactionsResponse data, response status code and response headers
    def get_transactions_by_category_with_http_info(budget_id, category_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TransactionsApi.get_transactions_by_category ...'
      end
      # verify the required parameter 'budget_id' is set
      if @api_client.config.client_side_validation && budget_id.nil?
        fail ArgumentError, "Missing the required parameter 'budget_id' when calling TransactionsApi.get_transactions_by_category"
      end
      # verify the required parameter 'category_id' is set
      if @api_client.config.client_side_validation && category_id.nil?
        fail ArgumentError, "Missing the required parameter 'category_id' when calling TransactionsApi.get_transactions_by_category"
      end
      if @api_client.config.client_side_validation && opts[:'type'] && !['uncategorized', 'unapproved'].include?(opts[:'type'])
        fail ArgumentError, 'invalid value for "type", must be one of uncategorized, unapproved'
      end
      # resource path
      local_var_path = '/budgets/{budget_id}/categories/{category_id}/transactions'.sub('{' + 'budget_id' + '}', budget_id.to_s).sub('{' + 'category_id' + '}', category_id.to_s)

      # query parameters
      query_params = {}
      query_params[:'since_date'] = opts[:'since_date'] if !opts[:'since_date'].nil?
      query_params[:'type'] = opts[:'type'] if !opts[:'type'].nil?
      query_params[:'last_knowledge_of_server'] = opts[:'last_knowledge_of_server'] if !opts[:'last_knowledge_of_server'].nil?

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['bearer']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'HybridTransactionsResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TransactionsApi#get_transactions_by_category\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # List payee transactions
    # Returns all transactions for a specified payee
    # @param budget_id The id of the budget (\&quot;last-used\&quot; can be used to specify the last used budget and \&quot;default\&quot; can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget)
    # @param payee_id The id of the payee
    # @param [Hash] opts the optional parameters
    # @option opts [Date] :since_date If specified, only transactions on or after this date will be included.  The date should be ISO formatted (e.g. 2016-12-30).
    # @option opts [String] :type If specified, only transactions of the specified type will be included. \&quot;uncategorized\&quot; and \&quot;unapproved\&quot; are currently supported.
    # @option opts [Integer] :last_knowledge_of_server The starting server knowledge.  If provided, only entities that have changed since &#x60;last_knowledge_of_server&#x60; will be included.
    # @return [HybridTransactionsResponse]
    def get_transactions_by_payee(budget_id, payee_id, opts = {})
      data, _status_code, _headers = get_transactions_by_payee_with_http_info(budget_id, payee_id, opts)
      data
    end

    # List payee transactions
    # Returns all transactions for a specified payee
    # @param budget_id The id of the budget (\&quot;last-used\&quot; can be used to specify the last used budget and \&quot;default\&quot; can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget)
    # @param payee_id The id of the payee
    # @param [Hash] opts the optional parameters
    # @option opts [Date] :since_date If specified, only transactions on or after this date will be included.  The date should be ISO formatted (e.g. 2016-12-30).
    # @option opts [String] :type If specified, only transactions of the specified type will be included. \&quot;uncategorized\&quot; and \&quot;unapproved\&quot; are currently supported.
    # @option opts [Integer] :last_knowledge_of_server The starting server knowledge.  If provided, only entities that have changed since &#x60;last_knowledge_of_server&#x60; will be included.
    # @return [Array<(HybridTransactionsResponse, Fixnum, Hash)>] HybridTransactionsResponse data, response status code and response headers
    def get_transactions_by_payee_with_http_info(budget_id, payee_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TransactionsApi.get_transactions_by_payee ...'
      end
      # verify the required parameter 'budget_id' is set
      if @api_client.config.client_side_validation && budget_id.nil?
        fail ArgumentError, "Missing the required parameter 'budget_id' when calling TransactionsApi.get_transactions_by_payee"
      end
      # verify the required parameter 'payee_id' is set
      if @api_client.config.client_side_validation && payee_id.nil?
        fail ArgumentError, "Missing the required parameter 'payee_id' when calling TransactionsApi.get_transactions_by_payee"
      end
      if @api_client.config.client_side_validation && opts[:'type'] && !['uncategorized', 'unapproved'].include?(opts[:'type'])
        fail ArgumentError, 'invalid value for "type", must be one of uncategorized, unapproved'
      end
      # resource path
      local_var_path = '/budgets/{budget_id}/payees/{payee_id}/transactions'.sub('{' + 'budget_id' + '}', budget_id.to_s).sub('{' + 'payee_id' + '}', payee_id.to_s)

      # query parameters
      query_params = {}
      query_params[:'since_date'] = opts[:'since_date'] if !opts[:'since_date'].nil?
      query_params[:'type'] = opts[:'type'] if !opts[:'type'].nil?
      query_params[:'last_knowledge_of_server'] = opts[:'last_knowledge_of_server'] if !opts[:'last_knowledge_of_server'].nil?

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['bearer']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'HybridTransactionsResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TransactionsApi#get_transactions_by_payee\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Import transactions
    # Imports transactions.
    # @param budget_id The id of the budget (\&quot;last-used\&quot; can be used to specify the last used budget and \&quot;default\&quot; can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget)
    # @param [Hash] opts the optional parameters
    # @return [TransactionsImportResponse]
    def import_transactions(budget_id, opts = {})
      data, _status_code, _headers = import_transactions_with_http_info(budget_id, opts)
      data
    end

    # Import transactions
    # Imports transactions.
    # @param budget_id The id of the budget (\&quot;last-used\&quot; can be used to specify the last used budget and \&quot;default\&quot; can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget)
    # @param [Hash] opts the optional parameters
    # @return [Array<(TransactionsImportResponse, Fixnum, Hash)>] TransactionsImportResponse data, response status code and response headers
    def import_transactions_with_http_info(budget_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TransactionsApi.import_transactions ...'
      end
      # verify the required parameter 'budget_id' is set
      if @api_client.config.client_side_validation && budget_id.nil?
        fail ArgumentError, "Missing the required parameter 'budget_id' when calling TransactionsApi.import_transactions"
      end
      # resource path
      local_var_path = '/budgets/{budget_id}/transactions/import'.sub('{' + 'budget_id' + '}', budget_id.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['bearer']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'TransactionsImportResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TransactionsApi#import_transactions\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Updates an existing transaction
    # Updates a transaction
    # @param budget_id The id of the budget (\&quot;last-used\&quot; can be used to specify the last used budget and \&quot;default\&quot; can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget)
    # @param transaction_id The id of the transaction
    # @param data The transaction to update
    # @param [Hash] opts the optional parameters
    # @return [TransactionResponse]
    def update_transaction(budget_id, transaction_id, data, opts = {})
      data, _status_code, _headers = update_transaction_with_http_info(budget_id, transaction_id, data, opts)
      data
    end

    # Updates an existing transaction
    # Updates a transaction
    # @param budget_id The id of the budget (\&quot;last-used\&quot; can be used to specify the last used budget and \&quot;default\&quot; can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget)
    # @param transaction_id The id of the transaction
    # @param data The transaction to update
    # @param [Hash] opts the optional parameters
    # @return [Array<(TransactionResponse, Fixnum, Hash)>] TransactionResponse data, response status code and response headers
    def update_transaction_with_http_info(budget_id, transaction_id, data, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TransactionsApi.update_transaction ...'
      end
      # verify the required parameter 'budget_id' is set
      if @api_client.config.client_side_validation && budget_id.nil?
        fail ArgumentError, "Missing the required parameter 'budget_id' when calling TransactionsApi.update_transaction"
      end
      # verify the required parameter 'transaction_id' is set
      if @api_client.config.client_side_validation && transaction_id.nil?
        fail ArgumentError, "Missing the required parameter 'transaction_id' when calling TransactionsApi.update_transaction"
      end
      # verify the required parameter 'data' is set
      if @api_client.config.client_side_validation && data.nil?
        fail ArgumentError, "Missing the required parameter 'data' when calling TransactionsApi.update_transaction"
      end
      # resource path
      local_var_path = '/budgets/{budget_id}/transactions/{transaction_id}'.sub('{' + 'budget_id' + '}', budget_id.to_s).sub('{' + 'transaction_id' + '}', transaction_id.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(data)
      auth_names = ['bearer']
      data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'TransactionResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TransactionsApi#update_transaction\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Update multiple transactions
    # Updates multiple transactions, by `id` or `import_id`.
    # @param budget_id The id of the budget (\&quot;last-used\&quot; can be used to specify the last used budget and \&quot;default\&quot; can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget)
    # @param data The transactions to update. Each transaction must have either an &#x60;id&#x60; or &#x60;import_id&#x60; specified. If &#x60;id&#x60; is specified as null an &#x60;import_id&#x60; value can be provided which will allow transaction(s) to be updated by their &#x60;import_id&#x60;. If an &#x60;id&#x60; is specified, it will always be used for lookup.
    # @param [Hash] opts the optional parameters
    # @return [SaveTransactionsResponse]
    def update_transactions(budget_id, data, opts = {})
      data, _status_code, _headers = update_transactions_with_http_info(budget_id, data, opts)
      data
    end

    # Update multiple transactions
    # Updates multiple transactions, by &#x60;id&#x60; or &#x60;import_id&#x60;.
    # @param budget_id The id of the budget (\&quot;last-used\&quot; can be used to specify the last used budget and \&quot;default\&quot; can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget)
    # @param data The transactions to update. Each transaction must have either an &#x60;id&#x60; or &#x60;import_id&#x60; specified. If &#x60;id&#x60; is specified as null an &#x60;import_id&#x60; value can be provided which will allow transaction(s) to be updated by their &#x60;import_id&#x60;. If an &#x60;id&#x60; is specified, it will always be used for lookup.
    # @param [Hash] opts the optional parameters
    # @return [Array<(SaveTransactionsResponse, Fixnum, Hash)>] SaveTransactionsResponse data, response status code and response headers
    def update_transactions_with_http_info(budget_id, data, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TransactionsApi.update_transactions ...'
      end
      # verify the required parameter 'budget_id' is set
      if @api_client.config.client_side_validation && budget_id.nil?
        fail ArgumentError, "Missing the required parameter 'budget_id' when calling TransactionsApi.update_transactions"
      end
      # verify the required parameter 'data' is set
      if @api_client.config.client_side_validation && data.nil?
        fail ArgumentError, "Missing the required parameter 'data' when calling TransactionsApi.update_transactions"
      end
      # resource path
      local_var_path = '/budgets/{budget_id}/transactions'.sub('{' + 'budget_id' + '}', budget_id.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(data)
      auth_names = ['bearer']
      data, status_code, headers = @api_client.call_api(:PATCH, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'SaveTransactionsResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TransactionsApi#update_transactions\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
