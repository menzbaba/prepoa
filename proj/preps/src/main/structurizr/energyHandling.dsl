workspace "Kara Energy Handling" {
    model {

        group "Energy Handling" {
            energyHandlingSystem = softwareSystem "Energy Handling System" {

                municipalGas = container "Municipal Gas" {
                }

                propaneGas = container "Propane Gas" {
                }

                charcoal = container "Charcoal" {
                }

                driedWoodEnergy = container "Dried Wood Energy" {
                }

                sourceGas = container "Source Gas" {
                    municipalGas -> this
                    propaneGas -> this
                    charcoal -> this
                    driedWoodEnergy -> this
                    biogasHoldingBagOutputValve -> this
                    bioMethaneStorageTank -> this
                }
            }
        }
    }

    views {
    }
}
