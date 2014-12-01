class Company
  attr_accessor :name, :parent

  def initialize(name, managers, parent = nil)
    @name     = name
    @managers = managers
    @parent   = parent
  end

  def managers_with_cascade
    if parent
      parent.managers_with_cascade + @managers
    else
      @managers
    end
  end
end

company_1 = Company.new('Company 1', ['John', 'Luke'])
company_2 = Company.new('Company 2', ['Willian', 'Matt'], company_1)
company_3 = Company.new('Company 3', ['Andrea'],          company_2)

p company_1.managers_with_cascade # => John, Luke
p company_2.managers_with_cascade # => John, Luke, Willian, Matt
p company_3.managers_with_cascade # => John, Luke, Willian, Matt, Andrea