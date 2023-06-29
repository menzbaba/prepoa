workspace "Financial Engineering" {

    model {
        RegulatoryAuthroity = person "Regulatory Authority"
        SOX = person "Sarbanes-Oxley Act (SOX)" {
            RegulatoryAuthroity -> this "creates"
        }
        FASB = person "Financial Accounting Standards Board (FASB)"
        FAF = person "Financial Accounting Foundation (FAF)" {
            this -> FASB "oversees"
        }
        GAAP = person "Generally Accepted Accounting Principals (GAAP)" {
            FASB -> this "Issues"
        }
        Comptroller = person "Comptroller" {
            this -> RegulatoryAuthroity "interprets"
            this -> SOX "follows"
            this -> GAAP "implements"
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
            OperationalEBITDAMargin = container "Operational levers, EBITDA margin" {
                pricingOptimization = component "Pricing Optimization"
                productPortfolioOptimization = component "Product Portfolio Optimization"
                salesForceEffectiveness = component "Sales Force Effectiveness"
                operationalEfficiencies = component "Operational Efficiencies"
                taxAvoidance = component "Tax Avoidance" extends operationalEfficiencies
                procurementManagingSuppliers = component "Procurement & Managing Suppliers"
                costToServe = component "Cost To Serve"
            }
        }

        Assets = softwareSystem "Assets" {
            AssetValuation = container "Asset Valuation" {
                Comptroller -> this "Determines"
                ReplacementValue = component "Replacement Value" "cost of replacing an asset with a similar one in its current condition. aka Current market price."
                NetBookValue = component "NetBookValue" " the original cost of the asset minus the accumulated depreciation. Impaired by damage or obsolescence." {
                    this -> ReplacementValue "ignores depreciation"
                }
            }
        }
        FinancialMaturity = softwareSystem "Financial Maturity" {
            Cash = container "Cash" {
                this -> taxAvoidance
            }
            Budget = container "Budget" {
                Cash -> this
            }
            CheckingAndSavingsAccounts = container "Checking And Savings Accounts" {
                Budget -> this
            }
            InvestmentPlans = container "Investment Plans" {
                CheckingAndSavingsAccounts -> this
                this -> taxAvoidance
            }
            Insurance = container "Insurance" {
                InvestmentPlans -> this
            }
            CreditCard = container "Credit Card" {
                Insurance -> this
            }
            BusinessLoan = container "Business Loan" {
                CreditCard -> this
                this -> taxAvoidance
            }
            AnnualAuditedFinancialStatements = container "Annual Audited Financial Statements" {
                BusinessLoan -> this
                this -> taxAvoidance
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
                this -> taxAvoidance
            }
            CompanyRestructuring = container "Company Restructuring" {
                LegalEntities -> this
                this -> taxAvoidance
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
