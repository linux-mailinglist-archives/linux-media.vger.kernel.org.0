Return-Path: <linux-media+bounces-59142-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGGZCiE15mkGtgEAu9opvQ
	(envelope-from <linux-media+bounces-59142-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 16:16:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4FF42CD26
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 16:16:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8E84A301AA87
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 13:56:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 282863FBEA5;
	Mon, 20 Apr 2026 13:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H3vGsSYo"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811983FB7E3;
	Mon, 20 Apr 2026 13:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776691581; cv=none; b=JeaNvwym5FNVDU0zfiZPZeWO3Wsm3u8eMtdhiMlc2S95E9DUYaNr2KKLtYclEsRhrq4kRSdOod3hz6tykP0zcNJEv22maLlBXG5FTAY8F7wpccn4I+iCv0akT7J28aBbOpTIpxJVWEBl5BMnnL1cHzFmWCbIsTBEr22NW6KNLW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776691581; c=relaxed/simple;
	bh=fzKma1MMTkr/gNiJd5XPapfupPdsDWu34VNqy1vzaPU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EjG3I5/ZcFFPm1Q3v7tKy40JQsOObdCeDetvWcAblAKKlzxEeyniR7ycwALqrTDWM4u5cNYDdd9NLk4cEYFgfoFrjHsqt78QENOuRgs06eSisEq4oF1nQIhsRxiW2fid8LlHfBngsd7Qea5TVIhe7khtR7FjbIJZ/aWKSSPMLdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H3vGsSYo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46866C2BCB7;
	Mon, 20 Apr 2026 13:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776691581;
	bh=fzKma1MMTkr/gNiJd5XPapfupPdsDWu34VNqy1vzaPU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H3vGsSYonB+0YrN/SotOgeWvNW+x91MYnXCzo1rEXnbZHNjkrP3NnEn4FmswlSU25
	 Olhtqz4U0Hlw/UddIPRgHdYenHoUlPsRiScnzMtWvB2sBOTQzI544mTp456nWQUbn0
	 flxtQ5VOohLnMXs5gceBsb3vEN3Vr7XVMsTEcLJXjlLzPzf+Qv6eDAFmagIlyQ/amq
	 r2kX4JG/6LbkQWIynmU9ueyN6Faffvc6O2AcoZ4KTykEeihx4prEFQemFbFO/lJNam
	 jC4aX6knCelehOmyHyRL31FyX9/CAW2uhz1Bto9hRp0Z5hKWbXAuLYt7K5CfGGxjr9
	 ESzg0mypHg0xQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Bradford Love <brad@nextdimension.cc>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 7.0-6.1] media: em28xx: remove tuner type from Hauppauge DVB DualHD
Date: Mon, 20 Apr 2026 09:18:27 -0400
Message-ID: <20260420132314.1023554-113-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420132314.1023554-1-sashal@kernel.org>
References: <20260420132314.1023554-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 7.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59142-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.984];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,nextdimension.cc:email]
X-Rspamd-Queue-Id: BE4FF42CD26
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Bradford Love <brad@nextdimension.cc>

[ Upstream commit a5dcbff7d50a89bf0376e7f2fb1ba3163a6dac0a ]

This reverts a patch which was perhaps inadvertently added.

This was changed during the 5.15-rc4 merge. The faulty commit appears
lost in the pull request somehow, I cannot find it to check the
explanation.

commit c52e7b855b33 ("Merge tag 'v5.15-rc4' into media_tree")

There was nothing wrong with this device and no reason to moodify the
board profile. The DVB capabilities are added via dvb_module_probe.
Additionally, the device contains *zero* analog inputs, so I'm not
sure why one was added.

Signed-off-by: Bradford Love <brad@nextdimension.cc>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Now I have all the information needed. Let me compile the complete
analysis.

---

## PHASE 1: COMMIT MESSAGE FORENSICS

### Step 1.1: Subject Line
- **Subsystem**: `media: em28xx`
- **Action verb**: "remove" (reverting an inadvertent change)
- **Summary**: Remove incorrect tuner type and input from Hauppauge
  WinTV-dualHD DVB board profile
- Record: [media: em28xx] [remove/revert] [Restores correct board
  profile for DVB-only device]

### Step 1.2: Tags
- **Signed-off-by**: Bradford Love (brad@nextdimension.cc) - author,
  original Hauppauge em28xx developer
- **Signed-off-by**: Hans Verkuil (hverkuil+cisco@kernel.org) - media
  subsystem co-maintainer
- No Fixes: tag (expected for candidates)
- No Reported-by: tag
- No Cc: stable
- Record: Signed off by the subsystem expert (Brad Love is the original
  author of multiple Hauppauge em28xx board entries) and the media
  subsystem maintainer.

### Step 1.3: Commit Body
The commit message explains:
- This reverts a change that was "perhaps inadvertently added" during
  the 5.15-rc4 merge into the media tree
- References `c52e7b855b33` ("Merge tag 'v5.15-rc4' into media_tree") as
  the source
- The author says "There was nothing wrong with this device" and "no
  reason to modify the board profile"
- DVB capabilities are handled via `dvb_module_probe` (not via analog
  tuner infrastructure)
- The device has "zero analog inputs" so the added composite input was
  bogus
- Record: Bug is a merge-introduced corruption of a board profile.
  Symptom is incorrect device configuration.

### Step 1.4: Hidden Bug Fix Detection
This is a clear bug fix disguised as "remove" - it reverts an
inadvertent merge artifact that broke a device's board profile. The
commit restores the original known-correct configuration.
- Record: YES, this is a real bug fix - restoring a corrupted board
  profile.

## PHASE 2: DIFF ANALYSIS

### Step 2.1: Inventory
- **Files changed**: 1 (`drivers/media/usb/em28xx/em28xx-cards.c`)
- **Lines**: +1/-6 (net -5 lines)
- **Functions modified**: None (data structure change only)
- **Scope**: Single-file, single board entry modification
- Record: Minimal change to one board profile entry in one file.

### Step 2.2: Code Flow Change
**Hunk 1**: Changes `.tuner_type` from `TUNER_SI2157` back to
`TUNER_ABSENT` and removes the bogus `.input` block.

Before: Board profile claims an Si2157 analog tuner and a composite
video input
After: Board profile correctly declares no analog tuner and no analog
inputs

### Step 2.3: Bug Mechanism
This is a **hardware profile/data corruption fix** (category h -
hardware workaround/device profile).

The incorrect `TUNER_SI2157` value causes:
1. **Unnecessary I2C bus probing**: `em28xx_v4l2_init()` (line
   2589-2622) attempts to discover and configure an analog tuner via
   I2C, potentially conflicting with the DVB tuner probe
2. **Spurious error message**: The check at line 4057-4058 (`has_dual_ts
   && tuner_type != TUNER_ABSENT`) triggers "We currently don't support
   analog TV or stream capture on dual tuners"
3. **Incorrect capability advertisement**: V4L2_CAP_TUNER would be
   advertised (line 2758)
4. **Bogus input listing**: A non-existent composite video input
   referencing TVP5150 decoder

Record: Incorrect board profile data causing unnecessary I2C probing,
spurious errors, and incorrect capability reporting.

### Step 2.4: Fix Quality
- Obviously correct: Restores the original correct state (matches pre-
  merge value and sibling board profile)
- Minimal/surgical: Only changes the one affected board entry
- Regression risk: Virtually zero - restoring known-good configuration
- Record: Fix is trivially correct. Zero regression risk.

## PHASE 3: GIT HISTORY INVESTIGATION

### Step 3.1: Blame
The original correct board entry (`TUNER_ABSENT`) was introduced by Olli
Salonen in commit `11a2a949d05e9d` (2016). The incorrect change was
introduced by merge commit `c52e7b855b33f` during the 5.15-rc4 merge
into media_tree, attributed to Mauro Carvalho Chehab's merge resolution.

Record: Buggy code introduced by merge artifact c52e7b855b33f (Oct
2021), first appearing in v5.16. Correct code existed since 2016 (v4.7
era).

### Step 3.2: Fixes Tag
No Fixes: tag present. The commit references `c52e7b855b33` as the
source of the bug.

Verified: `git diff v5.15..v5.16 -- drivers/media/usb/em28xx/em28xx-
cards.c` confirms the TUNER_SI2157 and input changes were introduced
between v5.15 and v5.16 via that merge.

### Step 3.3: File History
Recent commits to em28xx-cards.c are unrelated (MyGica UTV3 support,
build system changes). No conflicting changes found.
Record: Standalone fix, no prerequisites needed.

### Step 3.4: Author
Bradford Love (brad@nextdimension.cc) is the original Hauppauge em28xx
developer who authored multiple board entries including `em28xx: Add pid
for bulk revision of Hauppauge 461eV2`, `em28xx: Add pid for bulk
revision of Hauppauge 461e`, `em28xx: Add support for Hauppauge USB
QuadHD`, etc.
Record: Author is the domain expert for Hauppauge em28xx devices.

### Step 3.5: Dependencies
None. This is a standalone data change to a board profile. No code
dependencies.

## PHASE 4: MAILING LIST AND EXTERNAL RESEARCH

### Step 4.1-4.5
Lore.kernel.org was unavailable due to bot protection. B4 dig could not
be used on the merge commit (it's a merge). The commit was signed off by
Hans Verkuil (media maintainer), confirming proper review.

Record: Could not access lore discussion. Fix reviewed and accepted by
media subsystem maintainer.

## PHASE 5: CODE SEMANTIC ANALYSIS

### Step 5.1-5.4: Key Code Paths Affected
Verified the following code paths are affected by the incorrect
`TUNER_SI2157`:

1. **`em28xx_v4l2_init()`** (em28xx-video.c:2589): When `tuner_type !=
   TUNER_ABSENT`, probes I2C bus for analog tuner. The Si2157 DVB tuner
   lives at I2C addresses 0x60/0x63 (from em28xx-dvb.c:1412). The analog
   probe at line 2604-2612 uses `v4l2_i2c_tuner_addrs()` which could
   overlap with these addresses.

2. **`em28xx_usb_probe()`** (em28xx-cards.c:4057-4066): Dual-TS check
   with `tuner_type != TUNER_ABSENT` triggers error message and disables
   video.

3. **`em28xx_tuner_setup()`** (em28xx-video.c:2469): Attempts to
   configure tuner type TUNER_SI2157 via V4L2 tuner subsystem.

4. The sibling board `EM28174_BOARD_HAUPPAUGE_WINTV_DUALHD_01595`
   correctly uses `TUNER_ABSENT` and has no input entry, confirming the
   fix is correct.

Record: Bug affects I2C probing, capability reporting, and error message
generation. DVB tuner is handled separately via `dvb_module_probe`, not
the analog tuner infrastructure.

## PHASE 6: STABLE TREE ANALYSIS

### Step 6.1: Bug Exists in Stable Trees
Verified: The buggy change entered mainline in v5.16 via merge
`c52e7b855b33f`. All active stable trees (6.1.y, 6.6.y, 6.12.y) contain
this bug. The v5.15.y LTS tree does NOT (bug was introduced after 5.15).

### Step 6.2: Backport Complications
The change is to a data structure entry. It should apply cleanly to all
affected stable trees as the board profile has not been modified since
the merge.

### Step 6.3: No related fixes already in stable.

## PHASE 7: SUBSYSTEM AND MAINTAINER CONTEXT

### Step 7.1
- **Subsystem**: drivers/media/usb (USB media capture device driver)
- **Criticality**: PERIPHERAL (affects users of specific Hauppauge
  WinTV-dualHD DVB USB device)
- The Hauppauge WinTV-dualHD is a consumer DVB USB stick, commonly used
  for DVB-T/T2 reception

### Step 7.2
The em28xx subsystem is mature and stable. The bug has been present
since v5.16 (~4 years).

## PHASE 8: IMPACT AND RISK ASSESSMENT

### Step 8.1: Affected Users
Users of the Hauppauge WinTV-dualHD DVB (USB IDs 2040:0265 and
2040:8265).

### Step 8.2: Trigger Conditions
Every time the device is plugged in or the driver loads. 100%
reproducible for affected hardware.

### Step 8.3: Failure Mode
- Spurious error message in dmesg: "We currently don't support analog TV
  or stream capture on dual tuners" (MEDIUM)
- Unnecessary I2C bus probing that could conflict with DVB tuner
  (MEDIUM)
- Incorrect V4L2 capability advertising (LOW)
- Non-existent composite input exposed to userspace (LOW)
- Overall severity: MEDIUM

### Step 8.4: Risk-Benefit
- **Benefit**: Fixes incorrect device behavior for all users of this
  hardware, eliminates spurious errors, prevents potential I2C conflicts
- **Risk**: Extremely low - 5-line change to a data structure, restoring
  known-good values that existed for 5 years before the merge artifact
- **Ratio**: HIGH benefit / VERY LOW risk

## PHASE 9: FINAL SYNTHESIS

### Step 9.1: Evidence
**FOR backporting**:
- Fixes an incorrect board profile caused by a merge artifact
- Small (5 lines net), obviously correct, data-only change
- Restores original known-good configuration (verified by blame)
- Matches sibling device's correct profile
- Author is the domain expert for this hardware
- Reviewed by media subsystem maintainer (Hans Verkuil)
- Bug affects all stable trees from 6.1.y through 6.12.y
- Prevents spurious error messages and potential I2C bus conflicts
- Clean apply expected (no conflicting changes to this entry)

**AGAINST backporting**:
- Bug has been present ~4 years without widespread reports (limited user
  impact)
- DVB functionality likely still works despite the incorrect profile
- No syzbot/crash reports associated with this

### Step 9.2: Stable Rules Checklist
1. Obviously correct and tested? **YES** - restores pre-merge state,
   signed off by domain expert and maintainer
2. Fixes a real bug? **YES** - incorrect device profile from merge
   artifact
3. Important issue? **MEDIUM** - spurious errors, potential I2C
   conflicts, incorrect capabilities
4. Small and contained? **YES** - 5 lines in one file, one board entry
5. No new features or APIs? **YES** - purely corrective
6. Can apply to stable? **YES** - clean apply expected

### Step 9.3: Exception Categories
This falls into the **hardware quirk/device profile fix** category -
correcting incorrect device data in an existing driver.

### Step 9.4: Decision
This is a small, obviously correct fix to a board profile that was
corrupted by a merge artifact. It restores the original known-good
configuration for a specific USB device, matching the sibling board's
correct profile. It was written by the domain expert and reviewed by the
media maintainer. The risk is minimal and the fix prevents incorrect
driver behavior for users of this hardware.

## Verification

- [Phase 1] Parsed commit message: author explains merge-introduced
  incorrect board profile
- [Phase 2] Diff analysis: +1/-6 lines, changes `.tuner_type` from
  TUNER_SI2157 to TUNER_ABSENT, removes 5-line bogus `.input` block
- [Phase 3] git blame: Correct TUNER_ABSENT value existed since commit
  11a2a949d05e9d (2016, Olli Salonen). Bug introduced by merge
  c52e7b855b33f (Oct 2021)
- [Phase 3] git diff v5.15..v5.16: Confirmed the TUNER_SI2157 and input
  changes were introduced between v5.15 and v5.16 via the merge
- [Phase 3] git blame tuner-types.c: TUNER_SI2157 entry was also added
  by same merge c52e7b855b33f (stub entry with no parameters)
- [Phase 3] git log --author: Brad Love is the Hauppauge em28xx expert
  with multiple device contributions
- [Phase 5] Grep for TUNER_SI2157 in em28xx: Only used in the one
  incorrect board entry
- [Phase 5] Code analysis em28xx-video.c:2589-2622: tuner_type !=
  TUNER_ABSENT triggers I2C analog tuner probe
- [Phase 5] Code analysis em28xx-cards.c:4057-4066: dual_ts + tuner !=
  ABSENT triggers error message
- [Phase 5] Code analysis em28xx-dvb.c:1384-1422: Si2157 tuner handled
  via dvb_module_probe at fixed I2C addresses, not analog tuner
  infrastructure
- [Phase 5] Verified sibling board
  EM28174_BOARD_HAUPPAUGE_WINTV_DUALHD_01595 correctly uses TUNER_ABSENT
  with no input
- [Phase 6] Bug introduced in v5.16, affects all active stable trees
  (6.1.y, 6.6.y, 6.12.y)
- [Phase 6] No conflicting changes to this board entry since v5.16
- UNVERIFIED: Could not access lore.kernel.org discussion due to bot
  protection

**YES**

 drivers/media/usb/em28xx/em28xx-cards.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/usb/em28xx/em28xx-cards.c
index 2d19f8ecd6857..d7075ebabceb8 100644
--- a/drivers/media/usb/em28xx/em28xx-cards.c
+++ b/drivers/media/usb/em28xx/em28xx-cards.c
@@ -2522,17 +2522,12 @@ const struct em28xx_board em28xx_boards[] = {
 		.def_i2c_bus   = 1,
 		.i2c_speed     = EM28XX_I2C_CLK_WAIT_ENABLE |
 				 EM28XX_I2C_FREQ_400_KHZ,
-		.tuner_type    = TUNER_SI2157,
+		.tuner_type    = TUNER_ABSENT,
 		.tuner_gpio    = hauppauge_dualhd_dvb,
 		.has_dvb       = 1,
 		.has_dual_ts   = 1,
 		.ir_codes      = RC_MAP_HAUPPAUGE,
 		.leds          = hauppauge_dualhd_leds,
-		.input         = { {
-			.type     = EM28XX_VMUX_COMPOSITE,
-			.vmux     = TVP5150_COMPOSITE1,
-			.amux     = EM28XX_AMUX_LINE_IN,
-		} },
 	},
 	/*
 	 * 2040:026d Hauppauge WinTV-dualHD (model 01595 - ATSC/QAM) Isoc.
-- 
2.53.0


