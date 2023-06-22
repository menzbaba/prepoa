workspace "Measurements" {

    // https://www.kodytools.com/units
    // Search
    // Recents
    // Favorites
    // Categories
    // Alphabetical
    model {
        group "Type System" {
            Nominal = softwareSystem "Nominal" "variables that have no quantitative value but are classified into categories. Examples include gender, race, and religion ." {
            }
            Ordinal = softwareSystem "Ordinal" "variables that can be ranked in order but do not have a consistent difference between them. Examples include education level and income bracket ." {
            }
            Interval = softwareSystem "Interval" "variables that have a consistent difference between them but do not have a true zero point. Examples include temperature measured in Celsius or Fahrenheit ." {
            }
            Ratio = softwareSystem "Ratio" " variables that have a true zero point and can be compared using ratios. Examples include height, weight, and time ." {
            }
        }
        Acceleration = softwareSystem "Acceleration" {
        }
        AtomicCounting = softwareSystem "Atomic Counting" {
        }
        Angle = softwareSystem "Angle" {
        }
        AngularAcceleration = softwareSystem "Angular Acceleration" {
        }
        AngularVelocity = softwareSystem "Angular Velocity" {
        }
        Area = softwareSystem "Area" {
        }
        CalorificValue = softwareSystem "Calorific Value" {
        }
        Color = softwareSystem "Color" {
            rgb = container "Red, Green, and Blue (RGB)" "An additive color model used in digital displays such as computer monitors and televisions. In this system, colors are created by adding different amounts of red, green, and blue light"
            cmyk = container "Cyan, Magenta, Yellow and Key [Black] (CMYK)" "A subtractive color model used in printing. In this system, colors are created by subtracting different amounts of cyan, magenta, yellow, and black ink from white paper"
            hsl = container "Hue, Saturation, and Lightness (HSL)" "A cylindrical-coordinate representation of colors that describes how hue (the color itself), saturation (the intensity or purity of the color), and lightness (the brightness of the color) relate to each other"
            hsv = container "Hue, Saturation, and Value (HSV)" "A cylindrical-coordinate representation of colors that describes how hue (the color itself), saturation (the intensity or purity of the color), and value (the brightness of the color) relate to each other"
            pantone = container "Pantone" "A proprietary color space used in printing and graphic design. It is a standardized system that allows designers to specify colors using a unique number"
        }
        ElectricCurrent = softwareSystem "Electric Current" {
        }
        ElectricCharge = softwareSystem "Electric Charge" {
        }
        ComputerSpeed = softwareSystem "Computer Speed" {
        }
        DataStorage = softwareSystem "Data Storage" {
        }
        DataTransfer = softwareSystem "Data Transfer" {
        }
        Density = softwareSystem "Density" {
        }
        DigitalImageResolution = softwareSystem "DigitalImageResolution" {
        }
        DNALength = softwareSystem "DNA Length" {
        }
        ElectroStaticCapacitance = softwareSystem "Electro Static Capacitance" {
        }
        ElectricalConductance = softwareSystem "Electrical Conductance" {
        }
        ElectricalConductivity = softwareSystem "Electrical Conductivity" {
        }
        ElectricalPotential = softwareSystem "Electrical Potential" {
        }
        ElectricalFieldStrength = softwareSystem "Electrical Field Strength" {
        }
        ElectricalResistivity = softwareSystem "Electrical Resistivity" {
        }
        ElectricalResistance = softwareSystem "Electrical Resistance" {
        }
        Energy = softwareSystem "Energy" {
        }
        Enzyme = softwareSystem "Enzyme" {
        }
        Force = softwareSystem "Force" {
        }
        Frequency = softwareSystem "Frequency" {
        }
        FuelEconomy = softwareSystem "Fuel Economy" {
        }
        FuelEfficiencyMass = softwareSystem "Fuel Efficiency (Mass)" {
        }
        FuelEfficiencyVolume = softwareSystem "Fuel Efficiency (Volume)" {
        }
        HeatDensity = softwareSystem "Heat Density" {
        }
        HeatFluxDensity = softwareSystem "Heat Flux Density" {
        }
        HeatTransferCoefficient = softwareSystem "Heat Transfer Coefficient" {
        }
        Illuminance = softwareSystem "Illuminance" {
        }
        Inductance = softwareSystem "Inductance" {
        }
        Length = softwareSystem "Length" {
        }
        LinearChargeDensity = softwareSystem "Linear Charge Density" {
        }
        LinearCurrentDensity = softwareSystem "Linear Current Density" {
        }
        LinearMassDensity = softwareSystem "Linear Mass Density" {
        }
        Location = softwareSystem "location" {
            haversine = container "Haversine"
            latLongAltitude = container "Lattitude, Longitude, and Altitude"
        }
        Luminance = softwareSystem "Luminance" {
        }
        LuminanceIntensity = softwareSystem "Luminance Intensity" {
        }
        MagneticFieldStrength = softwareSystem "Magnetic Field Strength" {
        }
        MagneticFlux = softwareSystem "Magnetic Flux" {
        }
        MagneticFluxDensity = softwareSystem "Magnetic Flux Density" {
        }
        MagnetomotiveForce = softwareSystem "Magnetomotive Force" {
        }
        MassFlow = softwareSystem "Mass Flow" {
        }
        MassFluxDensity = softwareSystem "Mass Flux Density" {
        }
        MolarConcentration = softwareSystem "Molar Concentration" {
        }
        MolarFlow = softwareSystem "Molar Flow" {
        }
        Number = softwareSystem "Number" {
        }
        MomentOfInertia = softwareSystem "Moment Of Inertia" {
        }
        Permeability = softwareSystem "Permeability" {
        }
        Power = softwareSystem "Power" {
        }
        Prefix = softwareSystem "Prefix" {
        }
        Pressure = softwareSystem "Pressure" {
        }
        Quantity = softwareSystem "Quantity" {
        }
        Radiation = softwareSystem "Radiation" {
        }
        RadiationAbsorbedDose = softwareSystem "Radiation Absorbed Dose" {
        }
        RadiationExposure = softwareSystem "Radiation Exposure" {
        }
        Sound = softwareSystem "Sound" {
        }
        Speed = softwareSystem "Speed" {
        }
        SpecificHeat = softwareSystem "Specific Heat" {
        }
        SurfaceChargeDensity = softwareSystem "Surface Charge Density" {
        }
        SurfaceCurrentDensity = softwareSystem "Surface Current Density" {
        }
        SurfaceTension = softwareSystem "Surface Tension" {
        }
        Temperature = softwareSystem "Temperature" {
        }
        ThermalConductivity = softwareSystem "Thermal Conductivity" {
        }
        ThermalExpansion = softwareSystem "Thermal Expansion" {
        }
        ThermalResistance = softwareSystem "Thermal Resistance" {
        }
        Time = softwareSystem "Time" {
        }
        Torque = softwareSystem "Torque" {
        }
        TextileMeasurement = softwareSystem "Textile Measurement" {
        }
        WaveNumber = softwareSystem "Wave Number" {
        }
        ViscosityDynamic = softwareSystem "Viscosity Dynamic" {
        }
        ViscosityKinematic = softwareSystem "Viscosity Kinematic" {
        }
        Volume = softwareSystem "Volume" {
        }
        VolumeChargeDensity = softwareSystem "Volume Charge Density" {
        }
        VolumeFLow = softwareSystem "Volume FLow" {
        }
        Weight = softwareSystem "Weight" {
        }
        HeatTransferCoefficient = softwareSystem "" {
        }


    }
    views {
    }
}