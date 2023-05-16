workspace "Kara Aquaponics" {
    !identifiers hierarchical

    model {
        group "Aquoponics Garden" {
            Aquaponics = softwareSystem "Aquaponics" {
                aquaponicsNursaryTank = container "Aquaponics Nursary Tank" {
                    aquaponicsNursaryAquarium = component "Nursary Aquarium"
                    aquaponicsNursaryTempSensor = component "Nursary Temp Sensor" {
                        aquaponicsNursaryAquarium -> this
                    }
                    aquaponicsNursaryTankDivider = component "Nursary Tank Divider" "Basket for breeding female and males" {
                        aquaponicsNursaryAquarium -> this
                    }
                    aquaponicsNursaryOutput = component "Nursary Output" {
                        aquaponicsNursaryAquarium -> this
                    }
                    aquaponicsNursarySiphonBreak = component "Nursary Siphon Break" "Prevent Nursary Output from causing siphon and emptying tank" {
                        aquaponicsNursaryOutput -> this
                    }
                    aquaponicsNursaryOutputValve = component "Nursary Output Valve" {
                        aquaponicsNursaryOutput -> this
                    }
                }

                aquaponicsFishTank = container "Aquaponics Fish Tank" {
                    aquaponicsFishAquarium = component "Aquaponics Fish Aquarium"
                    aquaponicsAquariumOutput = component "Aquarium Output" {
                        aquaponicsFishAquarium -> this
                    }
                    aquaponicsOutputSiphonBreak = component "Aquarium Siphon Break" "Prevent Aquarium Output from causing siphon and emptying tank" {
                        aquaponicsAquariumOutput -> this
                    }
                    aquaponicsFishTankOutputValve = component "Fish Tank Output Valve" {
                        aquaponicsFishAquarium -> this
                    }
                }

                aquaponicsTempMaintainer = container "Aquaponics Temp Maintainer" {
                    aquaponicsTempBackupBattery = component "Aquaponics Temp Maintainer Backup Battery"
                    aquaponicLowPowerTempMaintainer = component "Aquaponics Low Power Temp Maintainer" {
                        aquaponicsTempBackupBattery -> this
                    }
                    aquaponicsTempMaintain = component "Temp Maintainer" {
                        aquaponicLowPowerTempMaintainer -> this
                        this -> aquaponicsFishAquarium
                        this -> aquaponicsNursaryAquarium
                    }
                }

                aquaponicsAerator = container "Aquaponics Aerator" "Oxygenates fish and bacteria" {
                    aquaponicsAeratorBackupBattery = component "Aquaponics Backup Battery"
                    aquaponicsAeratorLowPowerAerator = component "Aquaponics Low Power Aerator" {
                        aquaponicsAeratorBackupBattery -> this
                    }
                    aquaponicsAeratorBubblerBrick = component "Aquaponics Bubbler Brick" {
                        aquaponicsAeratorLowPowerAerator -> this
                    }
                    aquaponicsOxygen = component "Aerator Oxygen" {
                        aquaponicsAeratorBubblerBrick -> this
                        this -> aquaponicsFishAquarium
                        this -> aquaponicsNursaryAquarium
                    }
                }

                radialFlowFilter = container "Radial Flow Filter" "Removes Solids from fish tank, including food and solid poop" {
                    radialFlowInput = component "Radial Flow Input" {
                        aquaponicsFishTankOutputValve -> this
                        aquaponicsNursaryOutputValve -> this
                    }
                    radialFlowPTube = component "Radial Flow P Tube" {
                        radialFlowInput -> this
                    }
                    radialFlowPTubeBell = component "Radial Flow P Tube Bell" {
                        radialFlowPTube -> this
                    }
                    radialFlowTank = component "Radial Flow Tank" {
                        radialFlowPTube -> this
                    }
                    radialFlowFilterMaterial = component "Radial Flow Filter Material" {
                        radialFlowTank -> this
                    }
                    radialFlowFlushValve = component "Radial Flow Flush Valve" {
                        radialFlowTank -> this
                    }
                    radialFlowOutputValve = component "Radial Flow Output Valve" {
                        radialFlowTank -> this
                    }
                }

                aquaponicsBiomassFilter = container "Aquaponics Biomass Filter" "bacteria that feast on fish water and makes it safe for plants" {
                }

                aquaponicsGrowBed = container "Aquaponics Grow Bed" {
                    radialFlowOutputValve -> this
                }

                aquaponicsGrowBedSiphon = container "Aquaponics Grow Bed Siphon" {
                    growbedSiphonOutsideCourseFilter = component "Outside Siphon Course Filter" "Keeps out grow bed material from siphon and makes it easy to maintain the siphon" {
                        aquaponicsGrowBed -> this
                    }
                    growbedSiphonOutsideCourseFilterLid = component "Outside Siphon Course Filter lid" {
                        growbedSiphonOutsideCourseFilter -> this
                    }
                    growbedSiphonBell = component "Siphon Bell" {
                        growbedSiphonOutsideCourseFilter -> this
                    }
                    growbedSiphonTube = component "Siphon Tube" {
                        growbedSiphonBell -> this
                    }
                    growbedSiphonOutputValve = component "Siphon Output Valve" {
                        growbedSiphonTube -> this
                    }
                }
                
                aquaponicsSurgeTank = container "Aquaponics Surge Tank" {
                    growbedSiphonOutputValve -> this
                }

                aquaponicsSystemPump = container "Aquaponics System Pump" {
                    aquaponicsSurgeTank -> this
                    this -> aquaponicsFishAquarium
                    this -> aquaponicsNursaryAquarium
                }

            }
        }
    }
    views {
    }
}
