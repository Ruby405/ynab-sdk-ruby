=begin
#YNAB API Endpoints

#Our API uses a REST based design, leverages the JSON data format, and relies upon HTTPS for transport. We respond with meaningful HTTP response codes and if an error occurs, we include error details in the response body.  API Documentation is at https://api.youneedabudget.com

OpenAPI spec version: 1.0.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.19

=end

# Common files
require 'ynab/api_client'
require 'ynab/api_error'
require 'ynab/version'
require 'ynab/configuration'

# Models
require 'ynab/models/account'
require 'ynab/models/account_response'
require 'ynab/models/account_response_data'
require 'ynab/models/accounts_response'
require 'ynab/models/accounts_response_data'
require 'ynab/models/budget_detail'
require 'ynab/models/budget_detail_response'
require 'ynab/models/budget_detail_response_data'
require 'ynab/models/budget_settings'
require 'ynab/models/budget_settings_response'
require 'ynab/models/budget_settings_response_data'
require 'ynab/models/budget_summary'
require 'ynab/models/budget_summary_response'
require 'ynab/models/budget_summary_response_data'
require 'ynab/models/bulk_response'
require 'ynab/models/bulk_response_data'
require 'ynab/models/bulk_response_data_bulk'
require 'ynab/models/bulk_transactions'
require 'ynab/models/categories_response'
require 'ynab/models/categories_response_data'
require 'ynab/models/category'
require 'ynab/models/category_group'
require 'ynab/models/category_group_with_categories'
require 'ynab/models/category_response'
require 'ynab/models/category_response_data'
require 'ynab/models/currency_format'
require 'ynab/models/date_format'
require 'ynab/models/error_detail'
require 'ynab/models/error_response'
require 'ynab/models/hybrid_transaction'
require 'ynab/models/hybrid_transactions_response'
require 'ynab/models/hybrid_transactions_response_data'
require 'ynab/models/month_detail'
require 'ynab/models/month_detail_response'
require 'ynab/models/month_detail_response_data'
require 'ynab/models/month_summaries_response'
require 'ynab/models/month_summaries_response_data'
require 'ynab/models/month_summary'
require 'ynab/models/payee'
require 'ynab/models/payee_location'
require 'ynab/models/payee_location_response'
require 'ynab/models/payee_location_response_data'
require 'ynab/models/payee_locations_response'
require 'ynab/models/payee_locations_response_data'
require 'ynab/models/payee_response'
require 'ynab/models/payee_response_data'
require 'ynab/models/payees_response'
require 'ynab/models/payees_response_data'
require 'ynab/models/save_account'
require 'ynab/models/save_account_wrapper'
require 'ynab/models/save_category_response'
require 'ynab/models/save_category_response_data'
require 'ynab/models/save_month_category'
require 'ynab/models/save_month_category_wrapper'
require 'ynab/models/save_sub_transaction'
require 'ynab/models/save_transaction'
require 'ynab/models/save_transaction_wrapper'
require 'ynab/models/save_transactions_response'
require 'ynab/models/save_transactions_response_data'
require 'ynab/models/save_transactions_wrapper'
require 'ynab/models/scheduled_sub_transaction'
require 'ynab/models/scheduled_transaction_detail'
require 'ynab/models/scheduled_transaction_response'
require 'ynab/models/scheduled_transaction_response_data'
require 'ynab/models/scheduled_transaction_summary'
require 'ynab/models/scheduled_transactions_response'
require 'ynab/models/scheduled_transactions_response_data'
require 'ynab/models/sub_transaction'
require 'ynab/models/transaction_detail'
require 'ynab/models/transaction_response'
require 'ynab/models/transaction_response_data'
require 'ynab/models/transaction_summary'
require 'ynab/models/transactions_import_response'
require 'ynab/models/transactions_import_response_data'
require 'ynab/models/transactions_response'
require 'ynab/models/transactions_response_data'
require 'ynab/models/update_transaction'
require 'ynab/models/update_transactions_wrapper'
require 'ynab/models/user'
require 'ynab/models/user_response'
require 'ynab/models/user_response_data'

# APIs
require 'ynab/api/accounts_api'
require 'ynab/api/budgets_api'
require 'ynab/api/categories_api'
require 'ynab/api/deprecated_api'
require 'ynab/api/months_api'
require 'ynab/api/payee_locations_api'
require 'ynab/api/payees_api'
require 'ynab/api/scheduled_transactions_api'
require 'ynab/api/transactions_api'
require 'ynab/api/user_api'

require 'ynab/overrides/transactions_api'

module YNAB
  class API
    def initialize(access_token, host = 'api.youneedabudget.com', useHttps = true)
      config = Configuration.default
      config.api_key['Authorization'] = access_token
      config.api_key_prefix['Authorization'] = 'Bearer'
      config.scheme = useHttps ? 'https' : 'http'
      config.host = host
      config.base_path = '/v1'

      @client = ApiClient.new(config)
    end

    def user
      UserApi.new(@client)
    end

    def budgets
      BudgetsApi.new(@client)
    end

    def accounts
      AccountsApi.new(@client)
    end

    def categories
      CategoriesApi.new(@client)
    end

    def months
      MonthsApi.new(@client)
    end

    def payees
      PayeesApi.new(@client)
    end

    def payee_locations
      PayeeLocationsApi.new(@client)
    end

    def transactions
      YNAB::Overrides::TransactionsApi.new(@client)
    end

    def scheduled_transactions
      ScheduledTransactionsApi.new(@client)
    end

    def last_request
      @client.last_request
    end
  end
end

# Support old interface: YnabApi::Client
module YnabApi
  class Client < YNAB::API
  end
end
