# GitHub Universe 2023 OIDC Demo

This repository houses all of the code and other assets used in the demo portion of my GitHub Universe 2023 talk.

## Security

**WARNING:** If you misconfigure an OIDC provider in your AWS account, it is likely that you will allow an attacker into your AWS account. I cannot stress enough how important it is for you to properly understand and configure any authentication utilities that grant access to your AWS environment.

You can mitigate the security risk here with three different techniques:

1. Use the `sub` assertion to limit only to repositories or repository owners that you trust.
2. In the IAM policies you allow to be assumed from this role, observe least privilege to an extreme that you might normally consider unreasonable.
   1. Use resource wildcards judiciously, and never use `Resource: *`
   2. When possible, use `NotResource` and `Condition` statements.
   3. Explicitly list all permissions, avoiding wildcards for permissions entirely.
3. Do not use this for CDK or Terraform, as those systems require a _lot_ of permissions to run.

## Deploying the OIDC template

## License

This repository, and its contents, are licensed under the MIT license.

## Author

Mike Stemle <themanchicken@duck.com>
