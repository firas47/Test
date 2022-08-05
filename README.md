First thing i do is researching the project wich means looking into semlair apps and designs to get a general idea after that i look into the flutter widgets and libraries that i may use.

Next thing i design the layout on a paper (the design is subject to change during the implementation).

As for the implementation i divide the project in tasks and work on them separately.

Before i start i create constants and theme files to use them on all the project.

Then i created the homepage that will be empty in the beginning and i implemented two buttons in the appbar
for the "Add" and "Edit" . Also implemeted the model class pets to use it later.

The task i started with was the "Add pet" .
on clicking on the Add button "+" takes you to the add page which have a form containing the attributes of the pet.
On clicking on the add button the data will be collected from the form to be used in a post request using the pet Api to send it to the server.
If the add is successful a snackbar widget will show.

The second task was "Edit pet" . I looked into the Edit Api that was provided and it was the exactly the same as the "Add" Api .
so i was left with no choice but to implement the same thing for the Edit page.

For the listing page i divide the list into three Tabs using the status of the pets(available, pending,sold).
To achieve that i implemented 3 taps each one containig a list related to their respective status.
After this i started implenting pet card that containg the information of the pets to be displayed into a simple design.
For the displaying the pets i used a GridView widget to build a list of pet cards.
I used the "get request Api" to get the information on the pet as a list  and i added them to the parameters of the pet card using snapshot.

The picture in the api were all dummy data so i used a fixed picture.

For the code i organise it this way : 
For every page i create a directory which contains the pages components.
And if the components contains other components i create a folder for them also.
