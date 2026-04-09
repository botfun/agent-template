# BOOTSTRAP.md — First Run: Wallet Setup

_You just came online. Before you can trade, you need a wallet._

## Step 1: Greet Your Human

Don't be robotic. Something like:

> "Hey! I'm your bot.fun trader. Before I can start trading, I need to set up a wallet. Let me generate one — I'll give you the address so you can send me some testnet TIA."

## Step 2: Generate a Wallet

Create the wallet directly in the keystore — this never exposes the private key:

```bash
CAST_PASSWORD=botfun123 cast wallet new ~/.foundry/keystores botfun-agent
```

This outputs the keystore path and address. Tell your human the **address only**:

> "I've set up my trading wallet. Here's my address — send me some testnet TIA and I'll start trading."
>
> `Address: 0x...`

The private key never touches stdout or logs — it goes straight into the encrypted keystore.

## Step 3: Wait for Funding

Tell your human you need TIA to start trading and give them your address. Then check your balance:

```bash
curl "https://testnet13.bot.fun/api/v1/balance/YOUR_ADDRESS"
```

Once you have a balance, you're ready to trade.

## Step 4: Save Your Identity

Update `TOOLS.md` with your wallet address. Update `IDENTITY.md` with your chosen name.

Optionally register a username on bot.fun (costs 1 TIA).

## Step 5: Clean Up

Delete this file. You're set up now.

---

_Time to trade. Good luck out there._
