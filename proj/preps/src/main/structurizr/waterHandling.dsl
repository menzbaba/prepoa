workspace "Kara Water Handling" {
    model {
        group "Water Handling" {
            waterHandlingSystem = softwareSystem "Water Handling System" {
                municipalWater = container "Municipal Water" {
                }
                wellWater = container "Well Water" {
                }
                rainWater = container "Rain Water Harvesting" {
                    waterCisterns = component "Water Cisterns"
                    cisternOverflow = component "Cistern Overflow"
                }
                sourceWater = container "Source Water" {
                    municipalWater -> this
                    wellWater -> this
                    rainWater -> this
                }
                waterScrubbers = container "Water Scrubbers" {
                    sourceWater -> this
                    roughSedimentFilter = component "Rough Sediment Filter" "Reausable filter approx 125 microns" {
                        sourceWater -> this
                    }
                    medSedimentFilter = component "Medium Sediment Filter" {
                        roughSedimentFilter -> this
                    }
                    fineSedimentFilter = component "Fine Sediment Filter" {
                        medSedimentFilter -> this
                    }
                    carbonWaterFilter = component "Carbon Water Filter"
                    carbonWaterFilter2 = component "Carbon Water Filter 2"
                    uvLightWaterFilter = component "UV Light Water Filter"
                    waterSoftener = component "Water Softener"
                    chlorineWaterFilter = component "Chlorine Water FIlter"
                    potableWaterFilter = component "PotableWaterFilter"
                }
                potableWater = container "Potable Water" {
                    waterScrubbers -> this
                    waterHeater = component "Water Heater"
                    laundryWater = component "Laundry Water"
                    bathingWater = component "Bathing Water"
                    dishwasherWater = component "Dishwasher Water"
                    kitchenSinkInputWater = component "Kitchen Sink Input Water"
                }
                greyWater = container "Grey Water" {
                    potableWater -> this
                    edibleBelowGroundWater = component "Edibale Below Ground Garden Water"
                    livestockWater = component "Livestock Water"
                }
                nonPotableWater = container "Non Potable Water" {
                    sourceWater -> this
                    greyWater -> this
                    edibleAboveGroundWater = component "Edibale Above Ground Garden Water"
                    toiletInputWater = component "Toilet Input Water"
                    toiletStandingWater = component "Toilet Standing Water" {
                        toiletInputWater -> this
                    }
                    decorativePlantWater = component "Decorative Plant Water"
                    this -> aquaponicsSurgeTank
                }
                blackWater = container "Black Water" {
                    toiletOutputWater = component "Toilet Output Water" {
                        toiletStandingWater -> this
                    }
                    kitchenSinkOutputWater = component "Kitch Sink Output Water" {
                        kitchenSinkInputWater -> this
                    }
                    digesterInfluent = component "Digester Influent" {
                        toiletOutputWater -> this
                        kitchenSinkOutputWater -> this
                    }
                }
                digesterEffluent = container "Digester Effluent Water" {
                    digesterInfluent -> this
                }
                aquaponicsEffluent = container "Aquaponics Effluent Water" {
                    radialFlowFlushValve -> this
                }
                fertizerWater = container "Fertilzed Water" {
                    digesterEffluent -> this
                    radialFlowFlushValve -> this
                }
            }
        }

    }

    views {
    }
}
