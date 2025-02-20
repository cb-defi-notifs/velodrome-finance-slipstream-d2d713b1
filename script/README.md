## Deploy CL

Deployment is straightforward. Hardhat scripts for deployment on tenderly are provided in script/hardhat.
This deployment assumes an existing Velodrome deployment exists.

### Environment Setup
1. Copy `.env.example` into a new `.env` file and set the environment variables. `PRIVATE_KEY_DEPLOY` is the private key to deploy all scripts.
2. Copy `script/constants/TEMPLATE.json` into a new file `script/constants/{CONSTANTS_FILENAME}`. For example, "Optimism.json" in the .env would be a file at location `script/constants/Optimism.json`. Set the variables in the new file.
3. Run tests to ensure deployment state is configured correctly:
```
forge init
forge build
forge test
```

### Deployment

Command:

```
forge script script/DeployCL.s.sol:DeployCL --broadcast --slow --rpc-url optimism --verify -vvvv 
```