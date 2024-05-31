/**
 * @description       : 
 * @author            : Cristian Vizzarri
 * @group             : 
 * @last modified on  : 05-30-2024
 * @last modified by  : Cristian Vizzarri
 * Modifications Log
 * Ver   Date         Author              Modification
 * 1.0   05-30-2024   Cristian Vizzarri   Initial Version
**/
trigger OpportunityTrigger on Opportunity (before insert, before update) {

    Boolean globalBypass = FeatureManagement.checkPermission('CV_Global_Automation_Validation_ByPass');
    Boolean oppObjectBypass = FeatureManagement.checkPermission('CV_Opportunity_Automation_Validation_ByPass');

    if(globalByPass || oppObjectBypass){
        return;
    }

    if(Trigger.isBefore){
        if(Trigger.isInsert){
            OpportunityTriggerHandler.validateDescription((List<Opportunity>) Trigger.new, null);
        }
        if(Trigger.isUpdate){
            OpportunityTriggerHandler.validateDescription((List<Opportunity>)Trigger.new, (Map<Id,Opportunity>)Trigger.oldMap);
        }
    }
}