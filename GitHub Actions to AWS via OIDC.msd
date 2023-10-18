#//# --------------------------------------------------------------------------------------
#//# Created using Sequence Diagram for Mac
#//# https://www.macsequencediagram.com
#//# https://itunes.apple.com/gb/app/sequence-diagram/id1195426709?mt=12
#//# --------------------------------------------------------------------------------------
title "GitHub Actions to AWS via OIDC"

participant "Runner" as R
participant "GitHub OIDC Provider" as G_OIDC
participant "AWS OIDC Provider" as A_OIDC
participant "AWS" as AWS

R->G_OIDC: Fetch OIDC Token
G_OIDC->R: Signed JWT
R->A_OIDC: sts:AssumeRoleWithWebIdentity (Role ARN)
alt [JWT is acceptable]
	AWS->R: Access Token, Secret, and Session Token
	R->AWS: Access resources
else [JWT is not acceptable]
	AWS->R: Error
end