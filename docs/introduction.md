# Introduction

## About

At __Contoso__ we uses a DevOps deployment model for deploying server workloads.

Use of DevOps in our environment allows us to provide our customers with servers that are:

- fit for purpose
- high quality
- rapidly available

We also get efficiency benifits by:

- allowing workload specialist engineers to contribute to the configuration process
- having clear history and documentation on when changes occur and why they have been made
- maintaining consistancy over time and between Test, Dev, Prod environments
- reducing manual intervention required to get a production workload ready for release

To achieve these outcomes for our customers we use:

- change tracking
- configuration validation testing
- peer review from Subject Matter Experts (SMEs)
- automated release using gated approvals

## Change tracking

To track configuration changes we use Visual Studio Team Services (VSTS). VSTS is a repository that maintains current/previous versions of configuration files and allows us to compare differences between versions.

### Repository structure

The repository uses a branching strategy to allow multiple staff to contribute, while still maintaining high quality configurations.

Approved configuration changes are stored within a master branch called `master`. As configuration changes are required:

1. a new feature branch is created related to the specific change
2. changes are applied within the branch
3. configuration is peer reviewed
4. merged back into `master`

### Branching

We have adopted a feature branching strategy, with each feature branch:

- Created as a new branch from master
- Using the naming convention `username/workitem`
- Merged to `master` with a Pull Request (PR) that has been peer reviewed

> A Pull Request (PR) is a process that allows changes in a branch to be merged into `master`. When a PR is raised, the proposed changes are hilighted and comparible to the previous configuration version. A PR also facilitates further discussion between staff.

For additional guidance please see [Git branching guidance](https://www.visualstudio.com/en-us/articles/git-branching-guidance).

## Configuration validation testing

Before configuration changes are allowed to be merged into the `master` branch we require some basic validation of the configuration which is completed automatically.

Validation tested saves us time by ensuring that only changes that meet the following criteria are peer reviewed.

Validation criteria:

- All dependencies are included
- Configuration can be read by DSC

## Configuration is peer reviewed

When a PR is raised, we require the changes to be peer reviewed. The peer review process allows staff to collaborate on a change. Additional supporting information and comments can be added to the PR.

In the event that additional changes need to be made, the PR allows SMEs to provide feedback to the change requestor.

## Automated release using gated approval

After peer review, changes will be automatically deployed to our Test environment. After a minimum elapsed time without issue, changes are approved and deployed to the Production environment.