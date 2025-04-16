-- Test for CertificateNFTPolicy
module CertificateNFTPolicy

import {
  ScriptContext,
  TxOutput,
  get_mint,
  AssetName,
  TokenName,
  Value,
  PubKeyHash
} from "aiken/tx"

validator {
  fn main(courseId: TokenName, studentPKH: PubKeyHash, context: ScriptContext) -> Bool {
    let minted = get_mint(context)

    let expectedToken = { policy_id: this_script_hash, token_name: courseId, amount: 1 }

    // Check NFT was minted to student and amount is 1
    minted == [expectedToken]
  }
}