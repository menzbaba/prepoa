workspace "Culture" {
    //!identifiers hierarchical
    // https://twitter.com/imUrB00gieman/status/1672300555266555904

    model {
        KarlMarx = person "Karl Marx"
        Stalin = person "Stalin"
        MarcuseHerbert = person "Herbert Marcuse" "One of the most influential original member of the Frankfurt School on Critical Theory"
        AdornoTheodor = person "Theodor W. Adorno" "Wrote 'The Authortarian Personality'"
        SiguschVolkmar = person "Volkmar Sigusch" "German Pedophile Sexologist who coined the terms cisgender and cissexual"
        HerzogDagmar = person "Dagmar Herzog" "Author: Sex after Fascism: Memory and Morality in Twentieth-Century Germany"
        SchmidtGunter = person "Guntler Schmidt" "Published research on child porn consumption in 70s Germany"
        KentlerHelmut = person "Helmut Kentler" "Radical education scholor arguing for pedophiles in front of German Parliment"
        GermanGreenParty = person "Germany's Green Party"
        DrHaberlenJoachim = person "Dr. Joachim Haberlen" "author of 'Feeling Like a Child: Dreams and Practices of Sexuality in the West German ALternative Left during the Long 1970s"


        group "Identity" {
            Privlidge = person "Privlige"
            NormalPeople = person "Normal People"

            MalePeople = person "Male People"
            FemalePeople = person "Female People"

            AdultPeople = person "Adult People"
            MinorPeople = person "Minor People"

            AblePeople = person "Able People"
            DisabledPeople = person "Disabled People"

            Heterosexuals = person "Heterosexual (het)" " Straight Person, attracted to opposite gender"
            GayPeople = person "Gay Person" "Men attracted to men"
            LesbianPeople = person "Lesbian Person" "Women attracted to women"
            BisexualPeople = person "BiSexual Person" "attracted to both men and women"

            TransPeople = person "Trans Person" "Gender Switching"
            PrideActivists = person "Pride Activist"
            TransActivists = person "Trans Activist" extends TransPeople
            TransRightsActivists = person "Trans Rights Activists (TRA)" extends PrideActivists

            WhitePeople = person "White People"
            BlackPeople = person "Black People"
            AsianPeople = person "Asian People"
            AmericanIndianPeople = person "American Indian People"

            USPeople = person "US People"
            BritishPeople = person "British People"
            AfricanPeople = person "African People"

            ChristianPeople = person "Christian People"
            MuslimPeople = person "Muslim People"

        }
        Capitalisim = softwareSystem "Capitalisim"

        ClassicalMarxisim = softwareSystem "Classical Marxisim" {
            KarlMarx -> this "Created"
            Bourgeoisie = container "Bourgeoisie" "The Wealthy" {

            }
            Proletariat = container "Proletariat" "The Working Class" {
                this -> Bourgeoisie "Oppressed By"
                Bourgeoisie -> this "Oppressed"
            } 
        }

        SocialMarxisim = softwareSystem "Social Marxisim" extends ClassicalMarxisim {
            KarlMarx -> this "Created"
            Stalin -> this "Implemented"
            Haves = container "Haves" extends Bourgeoisie
            HaveNots = container "Have Nots" extends Proletariat {
                this -> Haves "Oppressed By"
                Haves -> this "Opressed"
            }
        }
        SovietSocialsim = softwareSystem "Soviet Socialism" extends SocialMarxisim {

        }
        CulturalMarxisim = softwareSystem "Cultural Marxisim" "Advocacy and application of Critical Theory and more generally to the cultural, political and academic influence of certain elements within the contemporary (1960's European and North American) left" {
            // Confusing set of ideas, individiauls and approaches
            SocialMarxisim -> this "Derived From"
            this -> Capitalisim "Criticizes"
            this -> SovietSocialsim "Criticizes"

            OppressorPower = container "Power" "What oppressors have over oppressed" {

            }
            InventedWords = container "Invented Words" {
                wordTransphobe = component "Transphobe"
                wordIslamaphobe = component "Islamaphobe"
                wordHomophobe = component "Homophobe"
                wordAcab = component "All Cops Are Bastards (ACAB)"
                wordCisgender = component "Cisgender" {
                    this -> SiguschVolkmar "coined by"
                }
                wordCissexual = component "Cissexual" {
                    this -> SiguschVolkmar "coined by"
                }
            }
            MutilatedWords = container "Mutilated Words" {
                wordGender = component "Gender"
                wordTrueSelf = component "True Self" {
                    this -> TransPeople "lies"
                }
                wordSex = component "Sex" {
                    wordGender -> this "Independant of"
                }
                wordFascist = component "Fascist" {
                    this -> OppressorPower "requires"
                }
                wordBigot = component "Bigot" "Prejudice + Power" {
                    this -> OppressorPower "requires"
                }
                wordRacist = component "Racist" "Prejudice + Power" {
                    this -> OppressorPower "requires"
                }
                wordSexism = component "Sexisim"
                wordSexist = component "Sexist" "Prejudice + Power" extends wordSexism {
                    this -> OppressorPower "requires"
                    MalePeople -> this "can be"
                    FemalePeople -> this "can't be"
                    TransPeople -> this "can't be"
                }
                wordCriminal = component "Criminal"
                wordVictim = component "Victim"
                wordRioting = component "Rioting"
                wordLooting = component "Looting"
                wordVandelisim = component "Vandelisim"
                wordDisturbingThePeace = component "Disturbing the Peace"
                wordDisruption = component "Disruption"
                wordArson = component "Arson"
                wordPeacefulProtest = component "Peaceful Protest" {
                    wordRioting -> this "if oppressed"
                    wordLooting -> this "if oppressed"
                    wordArson -> this "if oppressed"
                    wordVandelisim -> this "if oppressed" 
                    wordDisturbingThePeace -> this "if oppressed" 
                    wordDisruption -> this "if oppressed" 
                }
            }
            AlternativeWords = container "Alternative Words" {
                wordIllegalAliens = component "Illegal Aliens"
                wordUndocumentedMigrants = component "Undocumented Migrants" {
                    this -> wordIllegalAliens "preferred over"
                }
                wordDiscrimination = component "Discrimination"
                wordAffirmitiveAction = component "Affirmative Action" {
                    this -> wordDiscrimination "preferred over"
                }
            }
            CulturalMarxisimCharacteristic = container "Cultural Marxisim Characterists" {
                pathological = component "Pathological" "Treats perceived oppressors as a disease" {
                    wordTransphobe -> this
                    wordHomophobe -> this
                    wordIslamaphobe -> this
                }
                politicalCorrectness = component "PoliticalCorrectness" {
                    wordGender -> this "Gender is not sex, it's spirit"
                    wordFascist -> this "if you don't agree with us"
                    wordBigot -> this "if you don't agree with us"
                    wordRacist -> this "Data is"
                    wordIllegalAliens -> this "No Humans are illegal"
                }
                UnwaveringlyBiasedView = component "Maintain an unwaveringly biased view" {
                    //this -> oppressed "Favorable"
                    //this -> Oppressors "Villianized"
                    this -> wordCriminal "only oppressors"
                    this -> wordVictim "only oppressed"
                    this -> wordAcab
                }
                InversionBeliefs = component "Inversion Beliefs" "Believing the opposite of morality" {
                    prolife = component "Pro Life"
                    prochoice = component "Pro Choice" {
                        this -> prolife "Late Choice superceeds Baby's life"
                    }
                    wordVictim -> wordCriminal "if oppressor"
                    wordCriminal -> wordVictim "if Oppressed"
                }
            }

            

            CriticalTheory = container "Critical Theory" {

            }
            CriticalRaceTheory = container "Critical Race Theory (CRT)" extends CriticalTheory {
                WhitePeople -> BlackPeople "oppressed"
            }
            FrankfurtSchool = container "Frankfurt Institute of Social Research at Goethe University" "Reserachers key in CulturalMarxisim in Goethe Universirty in Frankfurt, Germany during interwar period" {
                MarcuseHerbert -> this "Most Influential Original Member"
                AdornoTheodor -> this "Original Member"
                TheAuthoritarianPersonality = component "Book: The Authoritarian Personality" {
                    AdornoTheodor -> this "Authored"
                }
            }
            Academia = container "Academia" {
                socialScience = component "Social Sciences"
                humanities = component "Humanities"
                politicalScience = component "Political Science"
                genderStudies = component "Gender Studies"
                whitnessStudies = component "Whiteness Studies"
                oppressionStudies = component "Oppression Studies"
                privlidgeStudies = component "Privlidge Studies"
            }
            CriticalTheorist = container "Critical Theorist" {
                MarcuseHerbert -> this "is a"
                this -> FrankfurtSchool "Commonly taught at"
            }
            SocialJustice = container "Social Justice" {
                softOnCrime = component "Soft On Crime for minorities"
                excuseBadBehavior = component "Excuse Bad Behavior of minorities"
                noAccountabilityMinority = component "No Accountability for minorities"
                affirmitiveAction = component "Affirmitive Action"
                equity = component "Equal Outcomes"
                punishMajority = component "Punish the Majority"
                reparations = component "Reparations"
            }
            1stFeminisim = container "Feminism, 1st Wave" "Women should have the right to vote" {

            }
            2ndFeminisim = container "Feminism, 2nd Wave" "Women have equal opportunity" extends 1stFeminisim {

            }
            3rdFeminisim = container "Feminism, 3rd Wave" "crap" extends 2ndFeminisim {

            }
            NeoProgressivism = container "Neo-Progressiveism" {

            }
            PostColonialsim = container "Post-Colonialsim" {
                
            }
            GenderTheory = container "Gender Theory" extends CriticalTheory {
                genderStudies -> this "study of"
                TransRightsActivists -> this "Belive in"
                MalePeople -> FemalePeople "oppressed"
                cisGender = component "Cisgender People" {
                    this -> SiguschVolkmar "coined by"
                    this -> NormalPeople "slur against"
                    this -> TransPeople "Opposite of"
                }
            }
            TransGenderists = container "Transgenderists" {
                GenderTheory -> this "justifies"
                TransRightsActivists -> this "Promotes"
                TraditionalGenderRoles = component "Traditional Gender Roles" {
                    TheAuthoritarianPersonality -> this "Pathological/Disease"
                }
            }
            minorAttractedPersons = container "Minor Attracted Persons (MAPs)" {
                // fucking sickos
                this -> TransGenderists "often co-occurs with"
                SiguschVolkmar -> this "was a"
                AttitudesTorwardsMinorSex = component "Attitudes Towards Sex" {
                    TheAuthoritarianPersonality -> this "Pathological/Disease"
                }
                SexAfterFascism = component "Book: Sex after Fascism: Memory and Morality in Twentieth-Century Germany" {
                    HerzogDagmar -> this "Authored"
                    this -> SiguschVolkmar "Quoted"
                    this -> SchmidtGunter "Quoted"
                }
                FeelingLikeAChild = component "Article: Feeling Like a Child: Dreams and Practices of Sexuality in the West German ALternative Left during the Long 1970s" {
                    DrHaberlenJoachim -> this "Authored"
                    this -> KentlerHelmut "referenced"
                    this -> SiguschVolkmar "referenced"
                }
                liberationOfPedophilia = component "Liberation of Pedophilia" {
                    FeelingLikeAChild -> this "Supported"
                    SiguschVolkmar -> this "Supported"
                    SchmidtGunter -> this "Supported"
                    KentlerHelmut -> this "Supported"
                    GermanGreenParty -> this "Supported"
                }
            }

            SexualOrientation = container "Sexual Orientation" extends CriticalTheory {
                MinorPeople -> this "Should identify"
                this -> Heterosexuals
                this -> GayPeople
                this -> LesbianPeople
                this -> BisexualPeople
                AttitudesTorwardsHeteroSex = component "Attitudes Towards Sex" {
                    TheAuthoritarianPersonality -> this "Pathological/Disease"
                }
            }

            lgb = container "LGB" {
                this -> Heterosexuals "Excludes"
                this -> GayPeople "Includes"
                this -> LesbianPeople "Includes"
                this -> BisexualPeople "Includes"
                Heterosexuals -> this "oppressed"
            }

            lgbtq = container "LGBTQ+" extends lgb {
                this -> TransPeople "Includes"
                LesbianPeople -> this "oppressed"
            }

            CriticalFamilyTheory = container "Critical Family Theory" "Belief against nuclear family" extends CriticalTheory {
                AdultPeople -> MinorPeople "oppressed"
                emancipation = component "Emancipation" {
                    MinorPeople -> this "Pursue"
                    AdultPeople -> this "Obstruct"
                }
                parenthood = component "Parenthood" {
                    TheAuthoritarianPersonality -> this "Pathological/Disease"
                }
                FamilyPride = component "Family Pride" {
                    TheAuthoritarianPersonality -> this "Pathological/Disease"
                }
            }
            CriticalCultureTheory = container "Critical Culture Theory" extends CriticalTheory {
                Patriotism = component "Patriotisim" {
                    TheAuthoritarianPersonality -> this "Pathological/Disease"
                }
            }
            CriticalReligionTheory = container "Critical Religion Theory" extends CriticalTheory {
                ChristianPeople -> MuslimPeople "opressed"
                Christianatiy = component "Christianity" {
                    TheAuthoritarianPersonality -> this "Pathological/Disease"
                }
            }
            PersonsIdentity = container "Persons Identity" {
                CriticalRaceTheory -> this "Questions"    
                genderTheory -> this "Questions"    
                CriticalFamilyTheory -> this "Questions"    
                CriticalCultureTheory -> this "Questions"    
                CriticalReligionTheory -> this "Questions"
                SexualOrientation -> this "Questions"    
            }

            Oppressed = container "Oppressed" {
                oppressedPeople = component "Oppressed People"
                this -> Privlidge "lack"
                minorities = component "Minorities" "Under-privileged/Oppressed" {
                    this -> Proletariat "Replaced"
                }
            }
            Oppressors = container "Oppressors" {
                this -> Privlidge "have"
                oppressorPeople = component "Oppressor People" {
                    this -> oppressedPeople "Opressed"
                    oppressedPeople -> this "Opressed by"
                }
                majorities = component "Majorities" "Privileged/Oppressive" {
                    this -> Bourgeoisie "Replaced"
                }
            }

        }
    }
    views {
    }
}