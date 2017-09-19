CREATE OR REPLACE PACKAGE BODY cdm.data_import_pbs 
AS
    gc_package_name CONSTANT VARCHAR2(61) := 'CDM.DATA_IMPORT_P';
    gc_upd_part_reason		CONSTANT VARCHAR2(100) := 'UpdatedThruExternalFile';
    gc_upd_status_fail		CONSTANT NUMBER := datadictionary.status_code_p.get_id(p_code => 'Failed',
                                                                                    p_ccs_org_name => 'Synarc',
                                                                                    p_ccs_name => 'UpdateFromFileStatusCode',
                                                                                    p_ccs_version => '1.0');
    gc_upd_status_init		CONSTANT NUMBER := datadictionary.status_code_p.get_id(p_code => 'Init',
                                                                                    p_ccs_org_name => 'Synarc',
                                                                                    p_ccs_name => 'UpdateFromFileStatusCode',
                                                                                    p_ccs_version => '1.0');  
    gc_upd_status_complete	CONSTANT NUMBER := datadictionary.status_code_p.get_id(p_code => 'Complete',
                                                                                    p_ccs_org_name => 'Synarc',
                                                                                    p_ccs_name => 'UpdateFromFileStatusCode',
                                                                                    p_ccs_version => 