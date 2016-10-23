pragma solidity ^0.4.2;

import "VesselStateLib.sol";

contract VesselState {
    struct State {
        address verified_by;
        string  vessel_type;
        uint    indentifier;
        string	indentifier_type;
        uint    updated_at;
        uint	latitude;
        uint	longitude;
        uint	altitude;
        uint	velocity;
        uint	heading;
    }

    mapping (string => State) states;

    function VesselState() {
        // setup transaction validators/origins
    }

    function newState(
        address verified_by,
        string  vessel_type,
        uint    identifier,
        string  identifier_type,
        uint    latitude,
        uint    longitude,
        uint    altitude,
        uint    velocity,
        uint    heading,
        uint    updated_at
    ) {

        string global_identifier = VesselStateLib.calculateStateIdentifier(vessel_type, identifier, identifier_type);
        states[global_identifier] = State(
            verified_by,
            vessel_type,
            identifier,
            identifier_type,
            latitude,
            longitude,
            altitude,
            velocity,
            heading,
            updated_at
        );
    }
}
