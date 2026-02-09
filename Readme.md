Playwright
commands----------------------------------------------------------------------->

cmd: **npx init playwright@latest** -> To initiate the playwright
cmd: **npx playwright codegen** <TARGET APPLICATION URL> -> To record the target application
cmd: **npx playwright test** -> Runs test on all the files(end-to-end)
cmd: **npx playwright test <file name>** -> Runs specific file in tests folder
cmd: **npx playwright test --ui** -> Opens Playwright UI
cmd: **npx playwright test <file name> --headed** -> Runs specific file in tests folder by opening the browsers
cmd: **npx playwright show-report** -> will show the test report



---------------------------------------------------------------------------->

**npx playwright init-agents --loop=vscode**  --> To initialize Playwright agents

The above command generates 3 files. 
1Generator -> Agent to create Automated browser tests using playwright. Instructions are given to generate playwright tests, 
2Healer ->  Agent used to deb and fix faliling playwright tests.
3Planner -> Agent to create a test plan for a web site or web application.

mcp.json
-----------------------------------------------------------------------------------------------------------
logged-in folder
seed.spec.ts --> 
this file is used to seed the test. Something that needs to be happened before the test.
Everything that is used in this seed file, will be copied by the LLM into each test that is generated.

login.setup.ts -->
we can provide login details and credentials in this file.

NOTE: We can use project dependencies in playwright config file(playwright.config.ts).



