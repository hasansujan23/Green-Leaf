<aura:application extends="force:slds">
        <lightning:tabset selectedTabId="one">
            <lightning:tab label="All Employees" id="one">
                <c:EmployeeList />
            </lightning:tab>
            <lightning:tab label="Add Employee" id="two">
                <c:AddNewEmployee />
            </lightning:tab>
            <lightning:tab label="Search Employee" id="three">
                <c:SearchEmployeeComponent />
            </lightning:tab>
        </lightning:tabset>
</aura:application>