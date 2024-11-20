
FROM hashicorp/terraform:latest

WORKDIR /workspace

COPY ./onebyzero-sivasai/infra /workspace

ENTRYPOINT ["terraform"]

CMD ["--version"]
