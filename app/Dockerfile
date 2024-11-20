
# Use the official Terraform image as the base image
FROM hashicorp/terraform:latest

# Set the working directory inside the container
WORKDIR /workspace

# Copy the 'infra' folder from the build context to the container
COPY ./infra /workspace/infra

# Set the entrypoint to terraform command
ENTRYPOINT ["terraform"]

# Default command to show the Terraform version
CMD ["--version"]

