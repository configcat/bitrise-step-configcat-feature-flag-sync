# Steps to deploy
## Preparation
1. Fork [bitrise-steplib](https://github.com/bitrise-io/bitrise-steplib) repository
2. Create a `.bitrise.secrets.yml` with env secrets `MY_STEPLIB_REPO_FORK_GIT_URL` and  
   [ConfigCat Management API credential](https://app.configcat.com/my-account/public-api-credentials) (`CONFIGCAT_API_USER`, `CONFIGCAT_API_PASS`)  
    > Example `.bitrise.secrets.yml`:
    > ```
    > envs:
    > - MY_STEPLIB_REPO_FORK_GIT_URL: git@github.com:user/bitrise-steplib.git
    > - CONFIGCAT_API_USER: 00000000-0000-0000-0000-000000000000
    > - CONFIGCAT_API_PASS: 000000000000000000000000000000000000
    > ```   
3. Install [bitrise CLI](https://github.com/bitrise-io/bitrise)
   ```bash
   brew install bitrise
   ```
4. Run tests
   ```bash
   bitrise run test
   ```
5. Increase the `BITRISE_STEP_VERSION` version in `bitrise.yml`.
6. Commit & Push
## Publish
Use the **same version** for the git tag as in `bitrise.yml`.
1. Create git tag
    1. Create a new version tag.
       ```bash
       git tag [MAJOR].[MINOR].[PATCH]
       ```
       > Example: `git tag 2.5.5`
    2. Push the tag.
       ```bash
       git push origin --tags
       ``` 
2. Run `bitrise run share-this-step` to share the step
3. Send the Pull Request, as described in the logs of `bitrise run share-this-step`
