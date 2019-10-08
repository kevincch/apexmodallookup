prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_190100 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2019.03.31'
,p_release=>'19.1.0.00.15'
,p_default_workspace_id=>35623937248431623920
,p_default_application_id=>52416
,p_default_owner=>'KEVINDEMO'
);
end;
/
prompt --application/shared_components/plugins/dynamic_action/modal_page_lookup_button
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(35669395853507974783)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'MODAL PAGE LOOKUP BUTTON'
,p_display_name=>'Modal Page Lookup Button'
,p_category=>'STYLE'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    ',
'FUNCTION F_RENDER (',
'        P_DYNAMIC_ACTION   IN APEX_PLUGIN.T_DYNAMIC_ACTION,',
'        P_PLUGIN           IN APEX_PLUGIN.T_PLUGIN',
'    ) RETURN APEX_PLUGIN.T_DYNAMIC_ACTION_RENDER_RESULT AS',
'        VR_RESULT         APEX_PLUGIN.T_DYNAMIC_ACTION_RENDER_RESULT;',
'        vURL         varchar2(4000);',
'        vAPPID        varchar2(20);',
'        i                number(5,0);',
'        vPITEM        varchar2(50);',
'        vVALUE        varchar2(50);',
'    BEGIN',
'',
'        --P_DYNAMIC_ACTION.ATTRIBUTE_01  - Lookup Page Items',
'        --P_DYNAMIC_ACTION.ATTRIBUTE_02  - Lookup Page ID',
'        --P_DYNAMIC_ACTION.ATTRIBUTE_03  - Returning Page Item',
'        --P_DYNAMIC_ACTION.ATTRIBUTE_04  - Lookup Application ID',
'',
'        vAPPID := nvl(P_DYNAMIC_ACTION.ATTRIBUTE_04,''&APP_ID.'');',
'        ',
'        vURL := apex_util.prepare_url(''f?p=''||vAPPID||'':''||P_DYNAMIC_ACTION.ATTRIBUTE_02||'':&SESSION.::NO:RP:'', p_triggering_element => ''$("#openDialogIcon")'');',
'',
'        vURL := replace(vURL,''"'',''\"'');',
'',
'        -- get the first Lookup Page Item ID',
'        select regexp_substr(P_DYNAMIC_ACTION.ATTRIBUTE_01,''[^,]+'', 1, 1) into vPITEM from dual;',
'     ',
'        VR_RESULT.JAVASCRIPT_FUNCTION   := ''',
'        function () { ',
'            var btn = "#" + $(this)[0].action.affectedButtonId;',
'            var divCon = $("#'' || vPITEM || ''").closest(".t-Form-itemWrapper");',
'            $(btn).appendTo(divCon);',
'            //$(btn).removeClass();',
'            $(btn).addClass("ui-datepicker-trigger a-Button a-Button--calendar"); ',
'',
'            $(btn).click( function () {',
'                // LOOKUP is an application process created for this application',
'                $("body").append("<div id=\"openDialogIcon\"></div>");',
'                $("#openDialogIcon").on("apexafterclosedialog",function(e,data){'';',
'                ',
'                    ',
'                    i := 1;',
'                    WHILE TRUE',
'                    LOOP',
'                        select regexp_substr(P_DYNAMIC_ACTION.ATTRIBUTE_01,''[^,]+'', 1, i), regexp_substr(P_DYNAMIC_ACTION.ATTRIBUTE_03,''[^,]+'', 1, i) into vPITEM, vVALUE from dual;',
'                        if vPITEM is null or vVALUE is null then',
'                            exit;',
'                        end if;',
'                        VR_RESULT.JAVASCRIPT_FUNCTION   := VR_RESULT.JAVASCRIPT_FUNCTION || ''',
'                                apex.item("''||vPITEM||''").setValue( data["''||vVALUE||''"]);'';',
'                        i := i + 1;',
'                    END LOOP;',
'                    ',
'                    ',
'        VR_RESULT.JAVASCRIPT_FUNCTION   := VR_RESULT.JAVASCRIPT_FUNCTION  || ''',
'                    ',
'                    $(this).remove();',
'                });',
'',
'                apex.navigation.redirect("''||vURL||''");',
'',
'            });',
'',
'            ',
'        }'';',
'',
'        RETURN VR_RESULT;',
'    END;',
'    ',
''))
,p_api_version=>2
,p_render_function=>'F_RENDER'
,p_standard_attributes=>'BUTTON:REQUIRED'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'This plugin is an dynamic action for ',
'1. moving a button after another page item as lookup button',
'2. calling a modal page with return value',
'3. supports calling a modal page from different application (provided that both applications are sharing the same authentication session cookies)'))
,p_version_identifier=>'1.0'
,p_files_version=>3
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(35669464326016600646)
,p_plugin_id=>wwv_flow_api.id(35669395853507974783)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Lookup Page Items'
,p_attribute_type=>'PAGE ITEMS'
,p_is_required=>true
,p_is_translatable=>false
,p_help_text=>'The Page Item(s) on this page to be lookup.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(35669396459001974783)
,p_plugin_id=>wwv_flow_api.id(35669395853507974783)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Lookup Page ID'
,p_attribute_type=>'PAGE NUMBER'
,p_is_required=>true
,p_is_translatable=>false
,p_help_text=>'The Lookup Page ID (a Modal Page)  for facilitating the search feature.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(35669465774306614364)
,p_plugin_id=>wwv_flow_api.id(35669395853507974783)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Returning Page Items'
,p_attribute_type=>'PAGE ITEMS'
,p_is_required=>true
,p_is_translatable=>false
,p_help_text=>'The Page Item in Lookup Page to be returned'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(35669397275709974783)
,p_plugin_id=>wwv_flow_api.id(35669395853507974783)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Lookup Application ID'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_help_text=>'The Lookup Page can be called from different application (provided that both applications are sharing the same authentication session cookies)'
);
end;
/
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false), p_is_component_import => true);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
