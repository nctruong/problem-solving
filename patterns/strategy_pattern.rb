# Strategy or Delegation

class PayStrategy
  def pay(amount)
    raise NotImplementedError
  end
end

class VisaPay < PayStrategy;end
class CreditPay < PayStrategy;end
class CashVisaPay < PayStrategy;end

# Work good if Type language.
# For exam: initialize(strategy_pa: PayStrategy)
# Help to validate at development
class MakePayment
  def initialize(strategy_pay)
    @strategy_page = strategy_pay
  end

  def pay(amount)
    @strategy_page.pay(amount)
  end
end
