require 'express/version'
require 'logger'
require 'active_support'
require 'active_support/core_ext'
require 'attr_required'
require 'attr_optional'
require 'rest_client'

module Express
  mattr_accessor :api_version
  self.api_version = '124.0'

  ENDPOINT = {
    production: 'https://www.paypal.com/cgi-bin/webscr',
    sandbox: 'https://www.sandbox.paypal.com/cgi-bin/webscr'
  }
  POPUP_ENDPOINT = {
    production: 'https://www.paypal.com/incontext',
    sandbox: 'https://www.sandbox.paypal.com/incontext'
  }

  def self.endpoint
    if sandbox?
      Express::ENDPOINT[:sandbox]
    else
      Express::ENDPOINT[:production]
    end
  end
  def self.popup_endpoint
    if sandbox?
      Express::POPUP_ENDPOINT[:sandbox]
    else
      Express::POPUP_ENDPOINT[:production]
    end
  end

  def self.log(message, mode = :info)
    logger.send mode, message
  end
  def self.logger
    @@logger
  end
  def self.logger=(logger)
    @@logger = logger
  end

  @@logger = Logger.new(STDERR)
  @@logger.progname = 'Express::Checkout'

  def self.sandbox?
    @@sandbox
  end
  def self.sandbox!
    self.sandbox = true
  end
  def self.sandbox=(boolean)
    @@sandbox = boolean
  end
  self.sandbox = false
end

require 'express/util'
require 'express/exception'
require 'express/exception/http_error'
require 'express/exception/api_error'
require 'express/base'
require 'express/ipn'
require 'express/nvp/request'
require 'express/nvp/response'
require 'express/payment/common/amount'
require 'express/checkout/request'
require 'express/checkout/response'
require 'express/payment/request'
require 'express/payment/request/item'
require 'express/payment/response'
require 'express/payment/response/info'
require 'express/payment/response/item'
require 'express/payment/response/payer'
require 'express/payment/response/reference'
require 'express/payment/response/refund'
require 'express/payment/response/address'
require 'express/payment/recurring'
require 'express/payment/recurring/activation'
require 'express/payment/recurring/billing'
require 'express/payment/recurring/summary'
