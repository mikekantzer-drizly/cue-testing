# cue-testing

A lot of this is me working through https://cuetorials.com/first-steps/validate-configuration/
Next Step: https://cuetorials.com/first-steps/generate-configuration/

Additional reading:
Tools that use cue:
- https://kubevela.io/docs/platform-engineers/cue/basic
- https://docs.dagger.io/1215/what-is-cue/

A repo implementing cue:
- https://github.com/uhthomas/automata/tree/main

Discussion: A Cue based Approach to k8s manifests:
- https://engineering.mercari.com/en/blog/entry/20220127-kubernetes-configuration-management-with-cue/
- https://engineering.mercari.com/en/blog/entry/20220122-adventures-of-using-cue-at-scale/
- https://github.com/cue-lang/cue/discussions/806#discussioncomment-1517391
- https://github.com/slewiskelly/cuek8s

and then maybe also playing around with some k8s tooling?

## Reading the top-level stuff:
- `generic.cue`: contains "generic" application definition schema. These are the user-facing interface, that will be used to specify "inputs"
- `proj_defaults.cue`: contains some default labels to apply to all objects
- `k8s.cue`: contains the generic -> kubernetes transformations