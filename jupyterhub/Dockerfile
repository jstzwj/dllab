FROM jupyterhub/jupyterhub:3.1.1

RUN pip install jupyterhub-idle-culler

RUN pip install \
    dockerspawner==12.1.0 \
    oauthenticator==15.1.0 \
    jhub_cas_authenticator==1.0.0
    