=begin
#YNAB API Endpoints

#Our API uses a REST based design, leverages the JSON data format, and relies upon HTTPS for transport. We respond with meaningful HTTP response codes and if an error occurs, we include error details in the response body.  API Documentation is at https://api.youneedabudget.com

OpenAPI spec version: 1.0.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.13

=end

require 'uri'

module YNAB
  class AccountsApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Single account
    # Returns a single account
    # @param budget_id The id of the budget (\&quot;last-used\&quot; can be used to specify the last used budget and \&quot;default\&quot; can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget)
    # @param account_id The id of the account
    # @param [Hash] opts the optional parameters
    # @return [AccountResponse]
    def get_account_by_id(budget_id, account_id, opts = {})
      data, _status_code, _headers = get_account_by_id_with_http_info(budget_id, account_id, opts)
      data
    end

    # Single account
    # Returns a single account
    # @param budget_id The id of the budget (\&quot;last-used\&quot; can be used to specify the last used budget and \&quot;default\&quot; can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget)
    # @param account_id The id of the account
    # @param [Hash] opts the optional parameters
    # @return [Array<(AccountResponse, Fixnum, Hash)>] AccountResponse data, response status code and response headers
    def get_account_by_id_with_http_info(budget_id, account_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: AccountsApi.get_account_by_id ...'
      end
      # verify the required parameter 'budget_id' is set
      if @api_client.config.client_side_validation && budget_id.nil?
        fail ArgumentError, "Missing the required parameter 'budget_id' when calling AccountsApi.get_account_by_id"
      end
      # verify the required parameter 'account_id' is set
      if @api_client.config.client_side_validation && account_id.nil?
        fail ArgumentError, "Missing the required parameter 'account_id' when calling AccountsApi.get_account_by_id"
      end
      # resource path
      local_var_path = '/budgets/{budget_id}/accounts/{account_id}'.sub('{' + 'budget_id' + '}', budget_id.to_s).sub('{' + 'account_id' + '}', account_id.to_s)

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
        :return_type => 'AccountResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: AccountsApi#get_account_by_id\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Account list
    # Returns all accounts
    # @param budget_id The id of the budget (\&quot;last-used\&quot; can be used to specify the last used budget and \&quot;default\&quot; can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget)
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :last_knowledge_of_server The starting server knowledge.  If provided, only entities that have changed since &#x60;last_knowledge_of_server&#x60; will be included.
    # @return [AccountsResponse]
    def get_accounts(budget_id, opts = {})
      data, _status_code, _headers = get_accounts_with_http_info(budget_id, opts)
      data
    end

    # Account list
    # Returns all accounts
    # @param budget_id The id of the budget (\&quot;last-used\&quot; can be used to specify the last used budget and \&quot;default\&quot; can be used if default budget selection is enabled (see: https://api.youneedabudget.com/#oauth-default-budget)
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :last_knowledge_of_server The starting server knowledge.  If provided, only entities that have changed since &#x60;last_knowledge_of_server&#x60; will be included.
    # @return [Array<(AccountsResponse, Fixnum, Hash)>] AccountsResponse data, response status code and response headers
    def get_accounts_with_http_info(budget_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: AccountsApi.get_accounts ...'
      end
      # verify the required parameter 'budget_id' is set
      if @api_client.config.client_side_validation && budget_id.nil?
        fail ArgumentError, "Missing the required parameter 'budget_id' when calling AccountsApi.get_accounts"
      end
      # resource path
      local_var_path = '/budgets/{budget_id}/accounts'.sub('{' + 'budget_id' + '}', budget_id.to_s)

      # query parameters
      query_params = {}
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
        :return_type => 'AccountsResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: AccountsApi#get_accounts\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
