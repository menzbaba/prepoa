workspace "Financial Engineering" {

    model {
        RegulatoryAuthroity = person "Regulatory Authority"
        Comptroller = person "Comptroller" {
            this -> RegulatoryAuthroity "interprets"
        }

        ValueCreationInitiatives = softwareSystem "Value Creation Initiatives" {
            StrategicMultipleDrivers = container "Strategic Levers, Multiple Drivers" {
                mergersAcquisitions = component "Mergers & Acquisitions"
                geographicExpansion = component "Geographic Expansion"
                customerSegmentation = component "Customer Segmentation"
                strategicPricing = component "Strategic Pricing"
                productStrategyInnovation = component "Product Strategy & Innovation"
                aftermarketServicesStrategy = component "Aftermarket Services Strategy"
                distributionStrategy = component "Distribution Strategy"
                digitalTransformation = component "Digital Transformation"
                dataStrategy = component "Data Strategy"
            }
            OperationalEBITDAMargin = softwareSystem "Operational levers, EBITDA margin" {
                pricingOptimization = component "Pricing Optimization"
                productPortfolioOptimization = component "Product Portfolio Optimization"
                salesForceEffectiveness = component "Sales Force Effectiveness"
                operationalEfficiencies = component "Operational Efficiencies"
                procurementManagingSuppliers = component "Procurement & Managing Suppliers"
                costToServe = component "Cost To Serve"
            }
        }

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
