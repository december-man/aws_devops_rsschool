### Project Structure:
``` bash
├── main.tf
├── variables.tf
├── providers.tf
├── resources.tf
├── screenshots
└── .github/
    └── workflows/
        └── terraform.yml
```
### Folders/Files Description:
* **.github/workflows/**:
  
  This hidden directory is where GitHub-specific files are stored, particularly workflows for GitHub Actions.
* **screenshots/**:
  
  This directory is used to store screenshots that are required in some of the tasks.
* **.gitignore**:
    
  This file specifies which folders or files should be ignored when tracking changes with Git.
* **README.md**:
  
  This is the file you're reading right now - the source of information about the project.
* **main.tf**:
  
  This is the primary configuration file for Terraform deployment. It contains the main infrastructure resources one needs to create.
* **providers.tf**:
  
  This file specifies the providers needed for Terraform configuration. Providers are the plugins that allow Terraform to interact with Cloud providers and other APIs.
* **resources.tf**:
  
  This file contains the resource definitions for Terraform configuration. Resources represent the components of infrastructure, like instances, databases, etc.
* **variables.tf**:
  
  This file defines input variables for Terraform configuration. Variables allow parameterization of Terraform scripts, making them more flexible and reusable.

### Usage
 When commiting changes or creating a pull request, the GHA pipeline will trigger the **check**,**plan** & **apply** terraform statements to verify changes & update your project infrastracture.

 In order to use this code for your own needs you need to:
* Manually create your own aws s3 bucket that you will use for terraform backend. Modify the *main.tf/backend* config with your s3 bucket name.
* Add necessary environment variables (using ```export TF_VAR_X``` syntax for local usage) to GitHub Secrets, they are specified in **terraform.yml** configuration file