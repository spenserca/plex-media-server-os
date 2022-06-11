# plex-media-server

This project will bootstrap a Plex server running on a Digital Ocean droplet, connected to Google Drive. The focus of the
Plex server is music streaming at the lowest cost. If you want to use this to stream video content you will probably have
to bump up the size/cost of your droplet.

My current set up costs $5/month for the droplet, and $2/month for hosting less than 100GB on Google Drive. Obviously the
cost of storage will go up depending on the size of your collection, but the cost of the droplet should remain steady.

## requirements

- A [Digital Ocean](https://www.digitalocean.com/) account
- Installation of [Terraform CLI](https://learn.hashicorp.com/tutorials/terraform/install-cli)
  or a free [Terraform account](https://app.terraform.io/) which is connected to your repository
- An (optional) [AWS account](https://aws.amazon.com/) with a registered domain
    - You can disregard this part if you don't have your own domain and just use the IP address
      of the droplet
- A [Google Cloud Platform](https://cloud.google.com/) to use when integrating with Google Drive
- A [Google Drive](https://drive.google.com/) account with your media backed up to it

## deployment

Resource deployment is handled via Terraform. To deploy, follow these steps:

1. Update `terraform/deploy.tfvars` with the values you want to use
   1. Make sure you have added the correct environment variables for values that are sensitive
2. Open a terminal in the `terraform` directory
3. Run `terraform init` to initialize terraform
4. Run `terraform apply -var-file=deploy.tfvars`
5. Once deployment is complete, you can login to Digital Ocean and check out your droplet

### setting up the server

There are a few steps that need to be done manually in order to get the Plex server up and
running in the cloud.

1. Create Google Cloud Platform credentials for access to Google Drive
    - Create a service principal for the project. You will use this to share your Google Drive
      folder with as well as to authenticate rclone to Google Drive.
    - Create an OAuth 2.0 app with client credentials. This will be used to authenticate
      rclone to Google Drive.
    - The creation of these may be able to be automated with terraform
2. Once you have your service account set up, go to Google Drive and find the folder you're
   going to use to mount into your droplet.
    - Click the dropdown in the bread crumbs for your folder and select `Share`
    - Copy the email address associated with your service account and paste it into the text
      box to allow the service account to access the folder
3. To manually set up the Plex media library, you'll need to use a web browser.
    - Run `ssh -p 4444 <user>@<droplet ip> -L 8888:localhost:32400` to open an ssh session
      with the droplet
    - Once that's running open a new browser window in incognito mode, and navigate to
      `localhost:8888/web`. This should prompt you to login to plex and allow you to
      configure your plex server
