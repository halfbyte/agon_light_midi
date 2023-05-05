# Agon Light MIDI interface and software

My goal is to enable Agon Light to be able to confidently speak MIDI from both native and BASIC code

## Current state

I'll be prototyping a simple MIDI adapter suitable for the UEXT adapter present on the Olimex version of the Agon Light. The idea here is that a MIDI adapter for UEXT would benefit more people than just Agon Light users and maybe that way I can coax Olimex into making these in the future. Adapting the hardware for the standard GPIO header on all Agon Lights should be easy, so when the hardware gets to the board design state, I am more than happy to accept contributions to make that a thing.

I haven't started on the software side yet, mainly because I don't have the hardware yet.

## Hardware design

My first version will be a bread board prototype. I have built MIDI circuits (for Arduino, for example) in the past and I have found a couple of similar designs that should work with the 3.3V design of the Agon Light.

Next step will either be a stripboard design (The parts count for this is very low) or a simple trough hole PCB design (mostly because I have all the parts as through hole components lying around)

The kicad files currently found in the repo are more or less just training data, I am quite new to kicad so bear with me.

## Licenses

Licenses will be added once something meaningful happens here.
