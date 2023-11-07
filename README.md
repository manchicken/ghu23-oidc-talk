# GitHub Universe 2023 OIDC Demo

This repository houses all of the code and other assets used in the demo portion of my GitHub Universe 2023 talk.

If you'd like, I'd love to have you join the discussion here: https://github.com/orgs/community/discussions/74474

## Security

**WARNING:** If you misconfigure an OIDC provider in your AWS account, it is likely that you will allow an attacker into your AWS account. I cannot stress enough how important it is for you to properly understand and configure any authentication utilities that grant access to your AWS environment.

You can mitigate much of the security risk here with these techniques:

1. In the `AssumeRolePolicyDocument`, use the `sub` assertion to limit only to repositories or repository owners that you trust. GitHub has a lot of advice on how to further harden the `AssumeRolePolicyDocument` [here in their documentation.](https://docs.github.com/en/actions/deployment/security-hardening-your-deployments/about-security-hardening-with-openid-connect#configuring-the-oidc-trust-with-the-cloud)
2. In the IAM policies you allow to be assumed from this role, observe least privilege to an extreme that you might normally consider unreasonable.
   1. Use resource wildcards judiciously, and never use `Resource: *`
   2. When possible, use `NotResource` and `Condition` statements.
   3. Explicitly list all permissions, avoiding wildcards for permissions entirely.
3. Avoid using this for CDK or Terraform, as those tools can require a _lot_ of permissions to run. If you want to use GitHub to deploy infrastructure, consider using a CodePipeline which pulls from GitHub, and then deploy using a combination of CodePipeline and CodeBuild.

For additional reading on how to use this securely, check out [this wonderful article by Christophe Tafani-Dereeper](https://securitylabs.datadoghq.com/articles/exploring-github-to-aws-keyless-authentication-flaws/).

## The OIDC template

I recommend using AWS CloudFormation for deploying the OIDC template. Check out the example I made here: [cloudformation/oidc-template.yml](https://github.com/manchicken/ghu23-oidc-talk/blob/main/cloudformation/oidc-template.yml)

## License

This repository, and its contents, are licensed under the MIT license.

## Author

Mike Stemle <hello@mikestemle.com>
