function makeFunction(thumbPrint, ipfsHash) {
  thumbHash = sha256(thumbPrint);
  transformed = new Array(len(thumbHash));
  for (i = 0; i < len(thumbHash); i += 1) {
    transformed[i] = String.fromCharCode(thumbHash.charCodeAt(i) + ipfsHash.charCodeAt(i));
  }
  return transformed;
}

function accessData(thumbPrint, transformed) {
  thumbHash = sha256(thumbPrint);
  ipfsHash = "";
  for (i = 0; i < len(thumbHash); i += 1) {
    ipfsHash += String.fromCharCode(transformed.charCodeAt(i) - thumbHash.charCodeAt(i));
  }
  return ipfsHash;
  
}
