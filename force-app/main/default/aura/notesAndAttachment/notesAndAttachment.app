<aura:application extends="force:slds" >
    <aura:attribute name="record" type="Object"/>
    <aura:attribute name="simpleRecord" type="Object"/>
    <aura:attribute name="recordError" type="String"/>

    <force:recordData aura:id="recordLoader"
      recordId="0016F00003Csg2VQAR"
      targetFields="{!v.simpleRecord}"
      targetError="{!v.recordError}"
      fields="Name, Industry"
                
      />

    <!-- Display a lightning card with details about the record -->
    <div class="Record Details"> 
    <lightning:card iconName="standard:account" title="{!v.simpleRecord.Name}" >
        <div class="slds-p-horizontal--small">
            <p class="slds-text-heading--small">
                <lightning:formattedText title="Billing City" value="{!v.simpleRecord.BillingCity}" /></p>
            <p class="slds-text-heading--small">
                <lightning:formattedText title="Billing State" value="{!v.simpleRecord.BillingState}" /></p>
        </div>
    </lightning:card>
    </div>

    <!-- Display Lightning Data Service errors, if any -->
    <aura:if isTrue="{!not(empty(v.recordError))}">
        <div class="recordError">
            {!v.recordError}</div>
    </aura:if>

	</aura:application>