# apexmodallookup

# Apex Modal Page Lookup

This project is setup for providing a quick and simple way for setup Oracle Apex Page with lookup function for any Page Item(s).  By pressing a button to call another Modal Page for Interactive Grid Search and returning the selected value(s) to calling Page Item(s).

# How it works?

There are two Dynamic Action Plugins, one for Calling Page and another for Lookup Modal Page.  By simpily defined some plugin attributes.  Both pages will be linked together for the mentioned lookup feature.

# Installations

Import the following plugins into your Application.

dynamic_action_plugin_modal_page.sql

dynamic_action_plugin_modal_page_lookup_button.sql

# How to use?

A. CREATING MODAL PAGE
1. Create a Modal Page (the Modal Page to be called after pressing the search button) with Interactive Grid Report region
2. Create an OK button and defined the Static ID.  This step is Optional, you can use double click on IG region for same effect.
3. Create a Dyanmic Action for Page Load with Modal Page (plugin)
4. Filling the plugin attributes
  - Returning Page Items - The Page Item(s) for performing lookup.  After the Lookup Dialog closed, the selected value will be returned to it.
  - Returning IG Column(s) - The Interactive Grid Column ID(s) to be returned.  It supports for returning more than one column separated by commas.  But the number of IG columns must match with Returning Page Items.
e.g. EMPNO  or  EMPNO,DEPTNO
  - OK Button ID (Optional) - The Static ID of OK Button or Accept Button.  This trigger the dialog close with return IG Column Value(s).

B. CREATING THE CALLING PAGE
1. Create a Blank Page
2. Add a Page Item (e.g. Px_EMPNO)
3. Add a Button for search and set the button click action as "Dynamic Action".
4. Create a Dynamic Action for Page Load with Modal Page Lookup Button (plugin)
5. Filling the plugin attributes
   - Lookup Page Items - The Page Item(s) on this page to be lookup.
   - Lookup Page ID - The Lookup Page ID (a Modal Page)  for facilitating the search feature.
   - Returning Page Items - The Page Item in Lookup Page to be returned
   - Lookup Application ID - The Lookup Page can be called from different application (provided that both applications are sharing the same authentication session cookies)
   
   
  
