workspace "Financial Engineering" {
    RegulatoryAuthroity = person "Regulatory Authority"
    Comptroller = person "Comptroller" {
        this -> RegulatoryAuthroity "interprets"
    }


    model {
        Assets = softwareSystem "Assets" {
            AssetValuation = container "Asset Valuation" {
                Comptroller -> this "Determines"
                ReplacementValue = container "Replacement Value" "cost of replacing an asset with a similar one in its current condition. aka Current market price."
                NetBookValue = container "NetBookValue" " the original cost of the asset minus the accumulated depreciation. Impaired by damage or obsolescence." {
                    this -> ReplacementCost "Less than" "Due to ignored depreciation"
                }
            }
        }
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