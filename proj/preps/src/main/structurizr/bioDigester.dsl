workspace "Bio Digester" {
    model {
        group "Biogas CH4 Digestor" {
            biogasDigestorSystem = softwareSystem "BioGas Digestor" {
                BioGasDigesterScience = container "BioGas Digester Science" {
                    group "Digester Organic Substrate" {
                        ProteinsDigesterScience = component "Digester Proteins"
                        CarbohydratesDigesterScience = component "Digester Carbohydrates"
                        LipidsDigesterScience = component "Digester Lipids"
                    }
                    group "Digester Hydrolysis Results" {
                        /** Conversion of carbohydrates and proteins:
                            Cellulose (Carbohydrates) + H2O → sugars 
                            Proteins + H2O → amino acids 
                        */
                        AminoAcidsDigesterScience = component "Digester Amino Acids"
                        SugarsDigesterScience = component "Digester Sugars"
                        LCFADigesterScience = component "Digester Long Chain Fatty Acids (LCFA)"
                    }
                    group "Digester Acidogenesis Results" {
                        /** Conversion of glucose into acetic and propionic acids:
                            C6H12O6 → 3CH3COOH
                            C6H12O6 + 2H2 → 2CH3CH2COOH + 2H2O
                        */
                        AmmoniaHydrogenSulfideDigesterScience = component "Digester Ammonia, Hyrdrogen Sulfide"
                        VFAAlcoholsDigesterScience = component "Digester VFA, alcohols"
                    }
                    group "Digester Acctogenesis Results" {
                        /** Conversion of propionate and butyrate into acetate and hydrogen as follows:
                            CH3CH2COO− + 3H2O → CH3COO− + HCO3- + H+ + 3H2
                            CH3CH2CH2COO− + 2H2O → 2CH3COO− + H+ + 2H2
                            4H2 + 2HCO3- + H+ → CH3COO− + 4H2O
                        */
                        AceticAcidDigesterScience = component "Digester Acetic Acid"
                        HydrogenCarbonDioxideDigesterScience = component "Digester Hydrogen (H), Carbon Dioxide (CO2)"
                    }
                    group "Digester Methanogenesis Results" {
                        /**
                            Conversion of acetic acid, carbon dioxide and hydrogen, and methanol to methane:
                                4CH3COOH → 4CO2 + 4CH4
                                CO2 + 4H2 → CH4 + 2H2O
                                4CH3OH + 6H2 → 3CH4 + 2H2O
                        */
                        MethaneCarbonDioxideDigesterScience = component "Digester Methane (CH4), Carbon Dioxide (CO2)"
                    }
                    OutputsDigesterScience = component "Digester Science Outputs"
                }


                RoughOrganicDigester = container "Rough Organic Digester" {
                    roughOrganicDigesterSpigot = component "Water Spigot" {
                        nonPotableWater -> this
                    }
                    roughOrganics = component "Rough Organics" "Kitchen scraps, leftovers, grass clippings, not bones or rocks"
                    roughOrganicDigesterSink = component "Deep Sink" {
                        roughOrganicDigesterSpigot -> this
                        roughOrganics -> this
                    }
                    roughOrganicsAutoDisposal = component "Mechanical Disposal" {
                        roughOrganicDigesterSink -> this
                    }
                    roughOrganicsExhaust = component "Liquified Rough Organics" {
                        roughOrganicsAutoDisposal  -> this
                    } 
                }

                SewageContainer = container "Sewage Container" {
                    /** Batch Digesters are gross. This is a plug-flow implementation */
                    sewagePushRod = component "Sewage Push Rod" "To push food to the Input Pipe bottom and make sure you don't clog the input pipe"
                    sewageInputChuteLid = component "Sewage Lid" "To prevent the smell from coming out of the input chute"
                    sewageInputChute = component "Sewage Input Chute" "Funnel like chute to make it easy to put in sewage" {
                        sewagePushRod -> this
                        sewageInputChuteLid -> this
                        roughOrganicsExhaust -> this
                        nonPotableWater -> this
                    }
                    sewageInputPipe = component "Sewage Input Pipe" "Pipe going to bottom of Sewage containor so as to not disturb outputs" {
                        sewageInputChute -> this
                    }
                    sewageInputAngleCutExit = component "Sewage Input Angle Cut Exit" "45 degree cut on the bottom of the input pipe to make it easy for solids to get away from input pipe" {
                        sewageInputPipe -> this
                    }
                    sewageHoldingTunnel = component "Sewage Holding Tunnel" "A long tank to allow maximum distance between input and output" {
                        sewageInputAngleCutExit -> this
                    }
                    sewageHoldingTunnelInsulation = component "Sewage Holding Tunnel Insulation" "Insulation for ground and walls and roof" {
                        sewageHoldingTunnel -> this
                    }
                    sewageTempMaintainer = component "Sewage Temp Maintainer" "Either insulation or active heater to maintain temperature" {
                        sewageHoldingTunnel -> this
                    }
                    sewageTempSensor = component "Sewage Holding Temp Sensor" "We need to keep the temps at thermophilic (45 to 65°C) operation" {
                        sewageHoldingTunnel -> this
                    }
                    sewageLeakSensor = component "Sewage Holding Leak Sensor" {
                        sewageHoldingTunnel -> this
                    }
                    sewagePHSensor = component "Sewage Holding pH Sensor" "Optimum is 7, but can range between 6.8 and 8 depending on temperature" {
                        sewageHoldingTunnel -> this
                    }
                    sewageOverflowDrain = component "Sewage Overflow Drain" "Should the system get clogged up, this will allow" {
                        sewageHoldingTunnel -> this
                    }
                    sewageOutputDrain = component "Sewage Output Drain" "The output needs to be drawn from middle height tapped furthest from input" {
                        sewageHoldingTunnel -> this
                    }
                }
                LiquidFertalizer = container "Digester Liquid Fertalizer" "The liquid output of the digester is useful fertalizer" {
                    sewageOutputDrain -> this
                    this -> digesterEffluent
                }

                group "BioMethane Collector" {
                    BioGasCollectionPlumbing = container "BioGas Collection Plumbing" {
                        sewageBulkFilterScreen1 = component "Bulk Filter Screen #1" "At one of the highest points of the system, the sewage will have floating pieces, and we need a screen to keep it out of the gas collection pipe. We need two so there is a higher chance that gas has a place to exit." {
                            sewageHoldingTunnel -> this    
                        }
                        sewageBulkFilterScreen2 = component "Bulk Filter Screen #2" "At one of the highest points of the system, the sewage will have floating pieces, and we need a screen to keep it out of the gas collection pipe. We need two so there is a higher chance that gas has a place to exit." {
                            sewageHoldingTunnel -> this    
                        }
                        biogasCollectionTube1 = component "Methane Capture 1" "4 inch PVC to discard food waste and sewage" {
                            sewageBulkFilterScreen1 -> this
                        }
                        biogasCollectionTube2 = component "Methane Capture 2" "4 inch PVC to discard food waste and sewage" {
                            sewageBulkFilterScreen2 -> this
                        }
                        biogasCleanoutUnion1 = component "Methane Cleanout 1" "Incase flotsam blocks off the gas collection tube, we can clean it out by undoing this union" {
                            biogasCollectionTube1 -> this
                        }
                        biogasCleanoutUnion2 = component "Methane Cleanout 2" "Incase flotsam blocks off the gas collection tube, we can clean it out by undoing this union" {
                            biogasCollectionTube2 -> this
                        }
                        biogasTeeConnector1 = component "Methane Tee Connector 1" "The two gas collection tubes need to be connected for us to tap into the gas" {
                            biogasCleanoutUnion1 -> this
                        }
                        biogasTeeConnector2 = component "Methane Tee Connector 2" "The two gas collection tubes need to be connected for us to tap into the gas" {
                            biogasCleanoutUnion2 -> this
                        }
                        biogasJoinPipe = component "Methane Join Pipe" "The tee connector joining pipe" {
                            biogasTeeConnector1 -> this
                            biogasTeeConnector2 -> this
                        }
                        biogasSourceSpigot = component "Methane Source Valve" "in the middle of the joining pipe we have a valve so we can collect the gas" {
                            biogasJoinPipe -> this
                        }
                    }
                    /**
                        This process is essentially the formula
                        https://eng.libretexts.org/Bookshelves/Biological_Engineering/Introduction_to_Biosystems_Engineering_%28Holden_et_al.%29/01%3A_Energy_Systems/1.02%3A_Biogas_Energy_from_Organic_Wastes

                    */
                        BioGasCO2Filter = container "BioGas CO2 Filter" {
                            biogasWaterFilterTopInputPort = component "BioGas Water Filter Top Input" {
                                biogasSourceSpigot -> this
                            }
                            biogasWaterFilterDropTube = component "BioGas Water Filter Tube" {
                                biogasWaterFilterTopInputPort -> this
                            }
                            biogasWaterFilterTransparentContainer = component "GioGas Carbon Dioxide (CO2) Filter" "A capful of chlorine in water that the gas bubbles through will remove bacteria" {
                                biogasWaterFilterDropTube -> this
                            }
                            biogasWaterFilterTopOutputPort = component "BioGas Water Filter Output Valve" {
                                biogasWaterFilterTransparentContainer -> this
                            }
                            biogasWaterFilterCO2Sensor = component "BioGas Water Filter CO2 Sensor" {
                                biogasWaterFilterTransparentContainer -> this
                            }
                        }
                        BioGasMoistureFilter = container "BioGas Mosture Filter" {
                            biogasMoistureFilterBottomTap = component "BioGas Moisture Filter Bottom Input Tap" {
                                biogasWaterFilterTopOutputPort -> this
                            }
                            biogasMoistureFilterTube = component "BioGas Moisture Filter Tube" "As the bio gas leaves the sewage tank, and we filter out bacteria and solids through a mositure filter we can use something like cat liter to remove moisture from the gas" {
                                biogasMoistureFilterBottomTap -> this
                            }
                            biogasMoistureFilterHumiditySensor = component "BioGas Moisture  Filter Humidity Sensor" {
                                biogasMoistureFilterTube -> this
                            }
                            boigasMoistureFilterTopTap = component "BioGas Moisture Filter top Output Valve" {
                                biogasMoistureFilterTube -> this
                            }
                        }
                        BioGasH2SFilter = container "BioGas H2S Filter" {
                            biogasSmellFilterTopTap = component "BioGas Smell Filter Top Tap" "To protect the steel wool from rust, this needs to come after the mosture filter" {
                                boigasMoistureFilterTopTap -> this
                            }
                            biogasSmellFilterTube = component "BioGas Smell Filter" "Hydrogen Sulfide (H2S) is a stinky gas we want out of the system" {
                                biogasSmellFilterTopTap -> this
                            } 
                            biogasSmellFilterBottomTap = component "BioGas Smell Filter Bottom Output Valve" {
                                biogasSmellFilterTube -> this
                            } 
                        }
                    //}
                    BioMethaneHoldingBag = container "BioMethane Holding Bag" {
                        biogasHoldingBagInputValve = component "BioGas Holding Bag Input Valve" {
                            biogasSmellFilterBottomTap -> this
                        }
                        biogasHoldingBag = component "BioGas Holding Bag" {
                            biogasHoldingBagInputValve -> this
                        }
                        biogasHoldingBagPressureSensor = component "BioGas Holding Bag Pressure Sensor" {
                            biogasHoldingBag -> this
                        }
                        biogasHoldingBagOutputValve = component "BioGas Holding Bag Output Valve" {
                            biogasHoldingBag -> this
                        }
                    }
                }
                MethaneStorage = container "BioMethane Storage" {
                    bioMathaneCompressor = component "BioMethane Compressor" {
                        biogasHoldingBagOutputValve -> this
                    }
                    bioMethaneStorageTank = component "BioMethane Storage Tank" {
                        bioMathaneCompressor -> this
                    }
                }
            }

        }
        
        group "Digester Hydrolysis Relationships" {
            ProteinsDigesterScience -> AminoAcidsDigesterScience
            CarbohydratesDigesterScience -> SugarsDigesterScience
            LipidsDigesterScience -> LCFADigesterScience
        }
        group "Digester Acidogenesis Relationships" {
            AminoAcidsDigesterScience -> AmmoniaHydrogenSulfideDigesterScience
            AminoAcidsDigesterScience -> VFAAlcoholsDigesterScience
            SugarsDigesterScience -> AmmoniaHydrogenSulfideDigesterScience
            SugarsDigesterScience -> VFAAlcoholsDigesterScience
            LCFADigesterScience -> AmmoniaHydrogenSulfideDigesterScience
            LCFADigesterScience -> VFAAlcoholsDigesterScience
        }
        group "Digester Acctogenesis Relationships" {
            AminoAcidsDigesterScience -> AceticAcidDigesterScience 
            SugarsDigesterScience -> AceticAcidDigesterScience
            LCFADigesterScience -> AceticAcidDigesterScience
            VFAAlcoholsDigesterScience -> AceticAcidDigesterScience
            LCFADigesterScience -> HydrogenCarbonDioxideDigesterScience
            VFAAlcoholsDigesterScience -> HydrogenCarbonDioxideDigesterScience
            HydrogenCarbonDioxideDigesterScience -> AceticAcidDigesterScience
        }
        group "Digester Methanogenesis Relationships" {
            AceticAcidDigesterScience -> MethaneCarbonDioxideDigesterScience
            HydrogenCarbonDioxideDigesterScience -> MethaneCarbonDioxideDigesterScience 
        }
        group "Digester Output Relationships" {
            MethaneCarbonDioxideDigesterScience -> OutputsDigesterScience
            AmmoniaHydrogenSulfideDigesterScience -> OutputsDigesterScience
        }

    }

    views {
    }
}
