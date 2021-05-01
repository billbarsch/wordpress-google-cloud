#!/bin/bash
gcloud builds submit --tag gcr.io/nomedoprojeto/sitewordpress
gcloud run deploy sitewordpress \
--image gcr.io/maisagil/sitewordpress \
--memory 1Gi \
--port 80 \
--platform managed \
--region us-central1 \
--allow-unauthenticated \
--add-cloudsql-instances maisagil:us-central1:maisagilsql \
--update-env-vars INSTANCE_CONNECTION_NAME="maisagil:us-central1:maisagilsql" --update-env-vars DB_USER="nomeusuario" --update-env-vars DB_NAME="nomebancodados" --update-env-vars DB_PASSWORD="senhabanco" --update-env-vars DB_HOST=":/cloudsql/nomedoprojeto:us-central1:nomedainstancia"