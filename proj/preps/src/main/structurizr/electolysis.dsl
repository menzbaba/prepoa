workspace "Kara Electrolysis" {
    !identifiers hierarchical

    model {
        Electrolysis = softwareSystem "Electrolysis" {
            sealedContainer = container "Sealed Container" {
                sealedContainerLid = component "Container Lid"
                sealedContainerTub = component "Container Tub" {
                    sealedContainerLid -> this "airtight seals"
                }
                electrolysisWater = component "Electrolysis Water" {
                    this -> sealedContainerTub
                }
                electolyte = component "Electrolyte" "Something like Potassium Hydroxide to make the water conductive" {
                    this -> electrolysisWater "makes conductive"
                }
            }
            anodeGenerator = container "Anode Generator" "Positive Lead, Oxygen (O2)" {
                anodeBellLid = component "Anode Bell Lid" "attached to lid"
                anodeBell = component "Anode Bell" "Inert Bottomless bell that screws into lid, like a bottomless glass alchohol bottle" {
                    anodeBellLid -> this "seals"
                }
                anodeMaterial = component "Anode Conductive Material" "a metal whisk with a steel wool pad makes a good anode" {
                    anodeBellLid -> this
                    this -> electrolysisWater "breaks down"
                }
                anodeCollection = component "Oxygen Tube" {
                    anodeBellLid -> this
                }
            }
            cathodeGenerator = container "Cathode Generator" "Negative Lead, Hydrogen (H)" {
                cathodeBellLid = component "Cathode Bell Lid" "attached to lid"
                cathodeBell = component "Cathode Bell" "Inert Bottomless bell that screws into lid, like a bottomless glass alchohol bottle" {
                    cathodeBellLid -> this "seals"
                }
                cathodeMaterial = component "Cathode Conductive Material" "a metal whisk with a steel wool pad makes a good anode" {
                    cathodeBellLid -> this
                    this -> electrolysisWater "breaks down"
                }
                cathodeCollection = component "Hydrogen Tube" {
                    cathodeBellLid -> this
                }

            }
        }
    }
    views {
    }
}
