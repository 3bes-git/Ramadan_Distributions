# Ramadan Distributions


<style>
red { color: red }
yellow { color: yellow }
green { color: green }
blue { color: blue }
gray { color: gray }
</style>

#### <blue>System goals
* Knowing where the food is located
* Knowing the status of the warehouses <green>[Open/Full/Maintenance]
* Knowing who will receive the boxes
* Knowing who drives the trucks
* Knowing the amount of donations
* Prevent errors

#### <blue>The main components in the system
* Users <green>The central directory for everyone (Admins, Volunteers,
Drivers, Beneficiaries).
* Warehouses <green>Knowing where food is stored,Knowing if the pantry is full or open.
* Food Categories <green>Knowing the required storage temperature.
* Inventory Items 
* Donations Log <green>Knowing how much money has been raised,Knowing the source of donations.
* Beneficiary Details
* Volunteer Skills
* Training Sessions <green>For volunteers.
* DriverTraining  <green>To link the user and training Sessions

#### <blue>Relationships in the system
* Warehouse <green>(1:M)</green> Inventory_Items
* Users <green>(1:1)</green> Beneficiary Details
* Food_Categories <green>(1:M) </green>Inventory_Items
* Users <green>(1:M)</green> Warehouses
* Users <green>(1:M)</green> Volunteer_Skills
* Users <green>(N:M)</green> Training_Sessions <gray>(need table) </gray> Driver_Training






