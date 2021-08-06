CREATE TABLE artist (
    id integer(8) NOT NULL,
    name varchar(50) NOT NULL,
)

ALTER TABLE artist ADD PRIMARY KEY (id);

CREATE TABLE song (
    id integer(8) NOT NULL,
    name varchar(50),
    year integer(5),
    artist va)

    PRIMARY KEY (productarrangementid);

CREATE TABLE product_identification (
                                        id varchar(36) NOT NULL,
                                        contractnumber varchar(255) NOT NULL,
                                        productname varchar(255) NOT NULL
) ;
ALTER TABLE product_identification ADD PRIMARY KEY (id);

CREATE TABLE purchase (
                          id varchar(36) NOT NULL,
                          ppcoststobuyeramount decimal(23,2),
                          ppcoststovendoramount decimal(23,2),
                          bankguaranteeflag boolean,
                          brokerflag boolean,
                          movablepropertyamount decimal(23,2),
                          movablepropertyspecifiedflag boolean,
                          purchasebrokercostsamount decimal(23,2),
                          architecturalreportcostsamount decimal(23,2),
                          realestatevaluationcostsamount decimal(23,2),
                          proptransferdeedcostsamount decimal(23,2),
                          mortgagedeedcostsamount decimal(23,2),
                          hometransferdate timestamp
) ;
ALTER TABLE purchase ADD PRIMARY KEY (id);

CREATE TABLE real_estate (
                             realestateid varchar(36) NOT NULL,
                             locationid varchar(36),
                             valuationid varchar(36),
                             landleaseid varchar(36),
                             engineeringreportid varchar(36),
                             modificationid varchar(36),
                             constructionyear smallint,
                             energylabel varchar(20),
                             energyindex decimal(23,2),
                             energyperformancecoefficient decimal(23,2)
) ;
ALTER TABLE real_estate ADD PRIMARY KEY (realestateid);

CREATE TABLE sale_home (
                           id varchar(36) NOT NULL,
                           statuscode varchar(36) NOT NULL,
                           sellingpriceamount decimal(23,2),
                           sellingcostsamount decimal(23,2),
                           penaltyinterestamount decimal(23,2),
                           hometransferdate timestamp,
                           realestatesurplusamount decimal(23,2)
) ;
ALTER TABLE sale_home ADD PRIMARY KEY (id);

CREATE TABLE scenario (
                          id varchar(36) NOT NULL,
                          customerneedgroupcode varchar(50) NOT NULL
) ;

CREATE TABLE self_construction (
    selfconstructionid varchar(36) NOT NULL
) ;
ALTER TABLE self_construction ADD PRIMARY KEY (selfconstructionid);

CREATE TABLE student_loan (
                              id varchar(36) NOT NULL,
                              debtregimefrom2015flag boolean NOT NULL,
                              originalcapitalamount decimal(23,2) NOT NULL
) ;
ALTER TABLE student_loan ADD PRIMARY KEY (id);
ALTER TABLE id_tree_collateral_arrangement ADD CONSTRAINT fk_id_tree_collateral_arr_obj FOREIGN KEY (facilitylevelfinanceid) REFERENCES id_tree_facility_level_finance(facilitylevelfinanceid) ON DELETE NO ACTION NOT DEFERRABLE;
ALTER TABLE income ADD CONSTRAINT fk_income_incomes FOREIGN KEY (incomes_id) REFERENCES incomes(id) ON DELETE NO ACTION NOT DEFERRABLE;
ALTER TABLE self_construction ADD CONSTRAINT fk_selfconst_collateralobj FOREIGN KEY (selfconstructionid) REFERENCES real_estate(realestateid) ON DELETE NO ACTION NOT DEFERRABLE;
ALTER TABLE nmo_product ADD CONSTRAINT fk_nmo_product_nmos FOREIGN KEY (non_mortgage_obligations_id) REFERENCES non_mortgage_obligations(id) ON DELETE NO ACTION NOT DEFERRABLE;
ALTER TABLE id_tree_obligation_statement ADD CONSTRAINT fk_id_tree_obligation_scenario FOREIGN KEY (mortgageapplicationscenarioid) REFERENCES id_tree_appl_scenario(mortgageapplicationscenarioid) ON DELETE NO ACTION NOT DEFERRABLE;
ALTER TABLE calendaryearincomes ADD CONSTRAINT fk_incomesid_incomes_id FOREIGN KEY (incomesid) REFERENCES incomes(id) ON DELETE NO ACTION NOT DEFERRABLE;
ALTER TABLE id_tree_product_arrangement ADD CONSTRAINT fk_id_tree_product_arr_level FOREIGN KEY (facilitylevelfinanceid) REFERENCES id_tree_facility_level_finance(facilitylevelfinanceid) ON DELETE NO ACTION NOT DEFERRABLE;
ALTER TABLE id_tree_collateral_object ADD CONSTRAINT fk_id_tree_coll_obj_tree FOREIGN KEY (mortgagedossierid) REFERENCES id_tree_dossier(mortgagedossierid) ON DELETE NO ACTION NOT DEFERRABLE;
ALTER TABLE consumer_loan ADD CONSTRAINT fk_cl_pi FOREIGN KEY (productidentification_id) REFERENCES product_identification(id) ON DELETE NO ACTION NOT DEFERRABLE;

ALTER TABLE consumer_loan ADD CONSTRAINT fk_consumer_loan_nmo_product FOREIGN KEY (id) REFERENCES nmo_product(id) ON DELETE NO ACTION NOT DEFERRABLE;
ALTER TABLE nmo_product_debtor ADD CONSTRAINT fk_nmo_prd_debtor_nmo_prd FOREIGN KEY (nonmortgageobligationproductid) REFERENCES nmo_product(id) ON DELETE NO ACTION NOT DEFERRABLE;
ALTER TABLE id_tree_facility_level_finance ADD CONSTRAINT fk_id_tree_facility_scenario FOREIGN KEY (mortgageapplicationscenarioid) REFERENCES id_tree_appl_scenario(mortgageapplicationscenarioid) ON DELETE NO ACTION NOT DEFERRABLE;

ALTER TABLE id_tree_facility_level_finance ADD CONSTRAINT fk_id_tree_facility_dossier FOREIGN KEY (mortgagedossierid) REFERENCES id_tree_dossier(mortgagedossierid) ON DELETE NO ACTION NOT DEFERRABLE;
ALTER TABLE private_lease ADD CONSTRAINT fk_private_lease_nmo_product FOREIGN KEY (id) REFERENCES nmo_product(id) ON DELETE NO ACTION NOT DEFERRABLE;
ALTER TABLE mortgage_dossier_person ADD CONSTRAINT fk_address FOREIGN KEY (correspondenceaddressid) REFERENCES address(id) ON DELETE NO ACTION NOT DEFERRABLE;

ALTER TABLE mortgage_dossier_person ADD CONSTRAINT fk_natural_person_name FOREIGN KEY (nameid) REFERENCES natural_person_name(id) ON DELETE NO ACTION NOT DEFERRABLE;
ALTER TABLE income_component ADD CONSTRAINT fk_income_component_income FOREIGN KEY (income_id) REFERENCES income(id) ON DELETE NO ACTION NOT DEFERRABLE;
ALTER TABLE id_tree_appl_scenario ADD CONSTRAINT fk_id_tree_application_dossier FOREIGN KEY (mortgagedossierid) REFERENCES id_tree_dossier(mortgagedossierid) ON DELETE NO ACTION NOT DEFERRABLE;
ALTER TABLE calendaryearincome ADD CONSTRAINT fk_incomeid_income_id FOREIGN KEY (incomeid) REFERENCES income(id) ON DELETE NO ACTION NOT DEFERRABLE;
ALTER TABLE customer_choice_question ADD CONSTRAINT fk_customer_choices FOREIGN KEY (customer_choices_id) REFERENCES customer_choices(customerchoicesid) ON DELETE NO ACTION NOT DEFERRABLE;
ALTER TABLE additional_income ADD CONSTRAINT fk_additional_component FOREIGN KEY (income_component_id) REFERENCES income_component(id) ON DELETE NO ACTION NOT DEFERRABLE;
ALTER TABLE existing_building ADD CONSTRAINT fk_existingbuil_collateralobj FOREIGN KEY (existingbuildingid) REFERENCES real_estate(realestateid) ON DELETE NO ACTION NOT DEFERRABLE;
ALTER TABLE student_loan ADD CONSTRAINT fk_student_loan_nmo_product FOREIGN KEY (id) REFERENCES nmo_product(id) ON DELETE NO ACTION NOT DEFERRABLE;
ALTER TABLE loan_arrangement ADD CONSTRAINT sys_c00329016 FOREIGN KEY (bank_savings_arrangement_id) REFERENCES bank_savings_arrangement(id) ON DELETE NO ACTION NOT DEFERRABLE;

ALTER TABLE loan_arrangement ADD CONSTRAINT sys_c00325358 FOREIGN KEY (loan_arrangement_interest_id) REFERENCES loan_arrangement_interest(id) ON DELETE NO ACTION NOT DEFERRABLE;
ALTER TABLE real_estate ADD CONSTRAINT real_est_col_obj_val_fk FOREIGN KEY (valuationid) REFERENCES collateral_obj_valuation(id) ON DELETE NO ACTION NOT DEFERRABLE;

ALTER TABLE real_estate ADD CONSTRAINT real_est_col_obj_er_fk FOREIGN KEY (engineeringreportid) REFERENCES collateral_engineering_report(id) ON DELETE NO ACTION NOT DEFERRABLE;

ALTER TABLE real_estate ADD CONSTRAINT real_est_col_obj_loc_fk FOREIGN KEY (locationid) REFERENCES collateral_object_location(id) ON DELETE NO ACTION NOT DEFERRABLE;

ALTER TABLE real_estate ADD CONSTRAINT fk_purchhome_collateralobj FOREIGN KEY (realestateid) REFERENCES collateral_object(collateralobjectid) ON DELETE NO ACTION NOT DEFERRABLE;

ALTER TABLE real_estate ADD CONSTRAINT real_est_col_obj_ll_fk FOREIGN KEY (landleaseid) REFERENCES collateral_obj_landlease(id) ON DELETE NO ACTION NOT DEFERRABLE;

ALTER TABLE real_estate ADD CONSTRAINT real_est_col_obj_mod_fk FOREIGN KEY (modificationid) REFERENCES collateral_object_modification(id) ON DELETE NO ACTION NOT DEFERRABLE;
ALTER TABLE new_building ADD CONSTRAINT fk_newbuild_collateralobj FOREIGN KEY (newbuildingid) REFERENCES real_estate(realestateid) ON DELETE NO ACTION NOT DEFERRABLE;
ALTER TABLE alimony ADD CONSTRAINT fk_alimony_nmo_product FOREIGN KEY (id) REFERENCES nmo_product(id) ON DELETE NO ACTION NOT DEFERRABLE;
ALTER TABLE id_tree_sale_home ADD CONSTRAINT fk_sale_home_scenario FOREIGN KEY (mortgageapplicationscenarioid) REFERENCES id_tree_appl_scenario(mortgageapplicationscenarioid) ON DELETE NO ACTION NOT DEFERRABLE;
ALTER TABLE id_tree_purchase ADD CONSTRAINT fk_purchase_scenario FOREIGN KEY (mortgageapplicationscenarioid) REFERENCES id_tree_appl_scenario(mortgageapplicationscenarioid) ON DELETE NO ACTION NOT DEFERRABLE;
ALTER TABLE private_loan ADD CONSTRAINT fk_private_loan_nmo_product FOREIGN KEY (id) REFERENCES nmo_product(id) ON DELETE NO ACTION NOT DEFERRABLE;
ALTER TABLE id_tree_request_person ADD CONSTRAINT fk_id_tree_person_dossier FOREIGN KEY (mortgagedossierid) REFERENCES id_tree_dossier(mortgagedossierid) ON DELETE NO ACTION NOT DEFERRABLE;
ALTER TABLE consumer_credit ADD CONSTRAINT fk_cc_pi FOREIGN KEY (productidentification_id) REFERENCES product_identification(id) ON DELETE NO ACTION NOT DEFERRABLE;

ALTER TABLE consumer_credit ADD CONSTRAINT fk_consumer_credit_nmo_product FOREIGN KEY (id) REFERENCES nmo_product(id) ON DELETE NO ACTION NOT DEFERRABLE;
