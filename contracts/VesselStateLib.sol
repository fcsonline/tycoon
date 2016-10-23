pragma solidity ^0.4.2;

library VesselStateLib{
	function calculateStateIdentifier(string vessel_type, uint identifier, string identifier_type) returns (string)
	{
    bytes32 identifierBytes32 = convertUintToBytes(identifier);
    string memory identifierString = bytes32ToString(identifierBytes32);
		return strConcat(vessel_type, "_", identifierString, "_", identifier_type);
	}

  function strConcat(string _a, string _b, string _c, string _d, string _e) internal returns (string){
			bytes memory _ba = bytes(_a);
			bytes memory _bb = bytes(_b);
			bytes memory _bc = bytes(_c);
			bytes memory _bd = bytes(_d);
			bytes memory _be = bytes(_e);
			string memory abcde = new string(_ba.length + _bb.length + _bc.length + _bd.length + _be.length);
			bytes memory babcde = bytes(abcde);
			uint k = 0;
			for (uint i = 0; i < _ba.length; i++) babcde[k++] = _ba[i];
			for (i = 0; i < _bb.length; i++) babcde[k++] = _bb[i];
			for (i = 0; i < _bc.length; i++) babcde[k++] = _bc[i];
			for (i = 0; i < _bd.length; i++) babcde[k++] = _bd[i];
			for (i = 0; i < _be.length; i++) babcde[k++] = _be[i];
			return string(babcde);
	}

  function convertUintToBytes(uint256 n) returns (bytes32) {
    return bytes32(n);
  }

	function bytes32ToString(bytes32 x) constant returns (string) {
			bytes memory bytesString = new bytes(32);
			uint charCount = 0;
			for (uint j = 0; j < 32; j++) {
					byte char = byte(bytes32(uint(x) * 2 ** (8 * j)));
					if (char != 0) {
							bytesString[charCount] = char;
							charCount++;
					}
			}
			bytes memory bytesStringTrimmed = new bytes(charCount);
			for (j = 0; j < charCount; j++) {
					bytesStringTrimmed[j] = bytesString[j];
			}
			return string(bytesStringTrimmed);
	}
}
