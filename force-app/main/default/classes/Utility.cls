/**
 * @description       : 
 * @author            : Cristian Vizzarri
 * @group             : 
 * @last modified on  : 06-03-2024
 * @last modified by  : Cristian Vizzarri
 * Modifications Log
 * Ver   Date         Author              Modification
 * 1.0   06-03-2024   Cristian Vizzarri   Initial Version
**/
public with sharing class Utility {
    
    public static void insertCustSetting(String triggerName){
        Trigger_Control__c ts = new Trigger_Control__c();
        ts.Name = triggerName;
        ts.Active__c = true;
        insert ts;
    }

    public static Boolean isTriggerActive(String triggerName){
        Boolean isActive=false;
        Trigger_Control__c pmpSwitch = Trigger_Control__c.getValues(triggerName);
        if(pmpSwitch != null)
            isActive = pmpSwitch.Active__c;
        return isActive;  
    }
}