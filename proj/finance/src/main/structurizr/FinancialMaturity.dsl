workspace "Financial Engineering" {

    model {
        FinancialMaturity = softwareSystem "Financial Maturity" {
            Cash = container "Cash" {
            }
            Budget = container "Budget" {
                Cash -> this
            }
            CheckingAndSavingsAccounts = container "Checking And Savings Accounts" {
                Budget -> this
            }
            InvestmentPlans = container "Investment Plans" {
                CheckingAndSavingsAccounts -> this
            }
            Insurance = container "Insurance" {
                InvestmentPlans -> this
            }
            CreditCard = container "Credit Card" {
                Insurance -> this
            }
            BusinessLoan = container "Business Loan" {
                CreditCard -> this
            }
            AnnualAuditedFinancialStatements = container "Annual Audited Financial Statements" {
                BusinessLoan -> this
                financialStatements = component "Financial Statements"
                internalDocuments = component "Internal Documents" {
                    this -> financialStatements "Tracing"
                    financialStatements -> this "Validation"
                }
            }
            InternalControls = container "Internal Controls" {
                AnnualAuditedFinancialStatements -> this
            }
            LegalEntities = container "Legal Entities" {
                InternalControls -> this
            }
            CompanyRestructuring = container "Company Restructuring" {
                LegalEntities -> this
            }
            IssueStock = container "Issue Stock" {
                CompanyRestructuring -> this
            }
            FinancialDerivatives = container "Financial Derivatives" {
                IssueStock -> this
            }
        }
    }
    views {
    }
}