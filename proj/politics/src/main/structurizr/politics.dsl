workspace "Globalizations" {
    //!identifiers hierarchical
    // https://en.wikipedia.org/wiki/Political_globalization

    model {
        GlobalizationsDimensions = softwareSystem "Globalization Dimensions" {
            politicalGlobalization = container "Political Globalization"
            economicGlobalization = container "Economic Globalization"
            culturalGlobalization = container "Cultural Globalization"
        }

        PoliticalModels = softwareSystem "Political Models" {
            closedAutocracies = container "Closed Autocracies" "People do not vote for CEO or Legislators"
            electoralAutocracies = container "Electoral Autocracies" "People get to vote with limited choices for CEO or legislators"
            electoralDemocracy = container "Electoral Democracy" "People get to vote between choices from two or more parties"
            liberalDemocracy = container "liveralDemocracy" "People get to vote between choices from two or more parties that are constrained by civil liberties and rule of law"            
        }

        GlobalPolitics = softwareSystem "Global Politics" {
        }

        InternationalNonGovernmentalOrganizations = softwareSystem "International Non-governmental Organizations" {
            unitedNations = container "United Nations" {
                worldBank = component "World Bank"
                imf = component "International Monetary Fund (IMF)"
                wto = component "World Trade Organization (WTO)"
                who = component "World Health Organization (WHO)"
                ito = component "International Teecommunication Union (ITU)"
            }
            hagueConferenceOnPrivateInternationalLaw = container "Hague Conference On Private International Law" {
                privateInternationalLaw = component "Private International Law"
                cgiar = component "Consultative Group for International Agricultural Research (CGIAR)"
                romeStatute = component "Rome Statute"
                internationalCriminalCourt = component "International Criminal Court" extends romeStatute
            }
        }
        SocialMovementOrgnaizations = softwareSystem "Social Movement Organizations"
        InterGovernmentalOrganizations = softwareSystem "Inter-governmental Organizations"
        NationalGovernments = softwareSystem "National Governments"

    }
    views {
    }
}