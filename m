Return-Path: <linux-media+bounces-59150-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MIcBeQ95mlutgEAu9opvQ
	(envelope-from <linux-media+bounces-59150-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 16:53:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2E542D913
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 16:53:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5DB473228832
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 14:14:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 456E23A16B0;
	Mon, 20 Apr 2026 13:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d6QBTjA7"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74E244103F;
	Mon, 20 Apr 2026 13:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776691808; cv=none; b=gzN6W0Yk2lMGXSP43iUmn+K2fBR0xgNdujESn7gnOHYn7FOMbInCZYIqUQjXNPFvI5+dMm2MVEGNdfDXRNecMD2BIlmkMdB8TxUArDVbm9q+WU8pLJ4Xzl4Ibhg45RdfU4xSJiz5IvsPzS0vcXn8ZAfWPD5hUsVR+TfOjLHFDlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776691808; c=relaxed/simple;
	bh=gQxHCg1wuez48H36quIMj/60iBO0hZvpUYv9AI3DYGA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QD5vqq1sMIE71nYaocuMWn0k05JrobZ67yqSJvAOjo6XhP6ZKVHuFt/laMy7nwVQ2VtOjZIoI/BwWNAyqdHit2/6LQMvy19qSnrTq2Jt+0+n0HvavAXWqsweL4KIFopD8QVgyz2bhNcgjhArvcduFD2BcDnCasiGRTTiDT4VsH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d6QBTjA7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A1B2C2BCB6;
	Mon, 20 Apr 2026 13:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776691808;
	bh=gQxHCg1wuez48H36quIMj/60iBO0hZvpUYv9AI3DYGA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d6QBTjA7KFBLYkTmfbfHuVSbF08fOTq3/ZMSTbrv8J3hshHLcJe+hIT3Zxzu7ty4T
	 nVdTa1q444soZAq+g6tV2LI1HQ8lx86p1NyZAPIfNvwW+dnvaaY5mM5i3hZtKoJAwe
	 4Rovyt87IWUlH16H55Z/PVhpp/wyLOb1mXXP+rgFm53SqUTQbrcfKB/snhMlEt/eyi
	 SpD0+ngW2Z+DosncUqMr/GNaM7Eka3uW0CvvI9cPkGTj1ntGsksXlwofb6bxufnIY3
	 UTHSpw4/ND2L+jshG5QZSivp202xah6bq3Q3KP5ZjjPgg+5i+rTfUFg0E2W4TLfAQn
	 Q1Gtz1CrLmtUw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Bradford Love <brad@nextdimension.cc>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 7.0-5.10] media: saa7164: Fix REV2 firmware filename
Date: Mon, 20 Apr 2026 09:20:00 -0400
Message-ID: <20260420132314.1023554-206-sashal@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59150-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nextdimension.cc:url,nextdimension.cc:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail-archive.com:url,linuxtv.org:email]
X-Rspamd-Queue-Id: 6B2E542D913
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Bradford Love <brad@nextdimension.cc>

[ Upstream commit ca3e8eaaa44e236413fd8d142231b5f03aefe55c ]

The wrong firmware file is listed, leading to non functional devices
on REV2 models.

Signed-off-by: Bradford Love <brad@nextdimension.cc>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

I now have all the information needed for a comprehensive analysis. Let
me compile the full report.

---

## PHASE 1: COMMIT MESSAGE FORENSICS

### Step 1.1: PARSE THE SUBJECT LINE
- **Subsystem**: `media: saa7164:`
- **Action verb**: "Fix" - clearly a bug fix
- **Summary**: Corrects the wrong firmware filename for REV2 model
  SAA7164 devices
Record: [media: saa7164] [Fix] [Corrects REV2 firmware filename to make
REV2 devices functional]

### Step 1.2: PARSE ALL COMMIT MESSAGE TAGS
- **Signed-off-by**: Bradford Love <brad@nextdimension.cc> (author)
- **Signed-off-by**: Hans Verkuil <hverkuil+cisco@kernel.org> (media
  subsystem co-maintainer)
- No Fixes: tag, Reported-by:, or Cc: stable (expected for this review
  pipeline)
Record: Patch authored by Bradford Love, signed off by Hans Verkuil
(media subsystem maintainer). No Fixes: tag or formal Reported-by.

### Step 1.3: ANALYZE THE COMMIT BODY TEXT
"The wrong firmware file is listed, leading to non functional devices on
REV2 models." This is a straightforward bug description: the wrong
firmware filename causes complete device failure.
Record: [Bug: wrong firmware filename for REV2] [Symptom: non-functional
devices] [Root cause: firmware define incorrectly set to same file as
REV3]

### Step 1.4: DETECT HIDDEN BUG FIXES
This is not hidden at all - it's explicitly a bug fix. The word "Fix" is
in the subject and the commit body describes non-functional hardware.
Record: [Direct bug fix, not disguised]

---

## PHASE 2: DIFF ANALYSIS

### Step 2.1: INVENTORY THE CHANGES
- **Files changed**: 1 (`drivers/media/pci/saa7164/saa7164-fw.c`)
- **Lines changed**: 2 lines modified (2 `#define` values)
- **Functions modified**: None - these are file-level macro definitions
- **Scope**: Single-file, trivially surgical
Record: [1 file, 2 lines changed, two #define macros modified, minimal
scope]

### Step 2.2: UNDERSTAND THE CODE FLOW CHANGE
- **Before**: `SAA7164_REV2_FIRMWARE` = `"NXP7164-2010-03-10.1.fw"`,
  size = 4019072 (same as REV3)
- **After**: `SAA7164_REV2_FIRMWARE` = `"v4l-saa7164-1.0.2-3.fw"`, size
  = 4038864 (different from REV3)
- The firmware is loaded in `saa7164_downloadfirmware()` at line
  203-209, where `chiprev == SAA7164_CHIP_REV2` selects REV2 firmware.
  This fix ensures REV2 devices request the correct firmware file.
Record: [Before: REV2 loads wrong firmware (same as REV3) -> device
fails with "image corrupt". After: REV2 loads correct firmware -> device
works.]

### Step 2.3: IDENTIFY THE BUG MECHANISM
This is a **logic/correctness fix** - wrong data values in firmware
filename macros. The wrong firmware is loaded for REV2 hardware, causing
the device to reject it ("image corrupt").
Record: [Logic/data error: incorrect firmware filename constant.
Mechanism: firmware mismatch causes device rejection.]

### Step 2.4: ASSESS THE FIX QUALITY
- **Obviously correct**: Yes - changes two `#define` values; REV3 is not
  touched
- **Minimal/surgical**: Yes - 2 lines, the smallest possible fix
- **Regression risk**: Extremely low - only REV2 path is affected, REV3
  is unchanged
- **Red flags**: None
Record: [Fix quality: excellent. Minimal, obviously correct, zero
regression risk for non-REV2 devices.]

---

## PHASE 3: GIT HISTORY INVESTIGATION

### Step 3.1: BLAME THE CHANGED LINES
From git blame, the buggy code was introduced in commit `6d152c200e8630`
(2010-07-31) by Steven Toth, "[media] saa7164: enforce the march 10th
firmware is used". That commit changed both REV2 and REV3 to use the
same firmware file `NXP7164-2010-03-10.1.fw`. Before that commit, REV2
used `v4l-saa7164-1.0.2.fw` and REV3 used `v4l-saa7164-1.0.3.fw`.
Record: [Bug introduced by 6d152c200e8630 (2010, v2.6.36 era). Code has
been broken for ~16 years.]

### Step 3.2: FOLLOW THE FIXES TAG
No Fixes: tag is present. However, the implicit fix target is commit
`6d152c200e8630`. This commit exists in all stable trees since it was
from 2010.
Record: [Implicit Fixes: 6d152c200e8630. That commit is present in all
stable trees.]

### Step 3.3: CHECK FILE HISTORY
Last 10 commits to `saa7164-fw.c` are all cleanup/style changes (SPDX,
typo fixes, duplicate assignments removal). No recent functional
changes. The firmware defines haven't been touched since 2010.
Record: [File stable. No recent conflicting changes. Last functional
change to firmware defines: 2010.]

### Step 3.4: CHECK THE AUTHOR
Bradford Love is not the subsystem maintainer but appears to be
associated with Hauppauge (nextdimension.cc). The patch was signed off
by Hans Verkuil, who is the media subsystem co-maintainer.
Record: [Author appears associated with Hauppauge hardware. Signed off
by media subsystem maintainer.]

### Step 3.5: CHECK FOR DEPENDENCIES
The fix is completely standalone - it only changes two `#define` values.
No prerequisite commits needed.
Record: [No dependencies. Fully standalone.]

---

## PHASE 4: MAILING LIST AND EXTERNAL RESEARCH

### Step 4.1: FIND THE ORIGINAL PATCH DISCUSSION
Found the commit notification at mail-archive.com: committed to
media.git/next on March 12, 2026, by Hans Verkuil.
Record: [Found at https://www.mail-archive.com/linuxtv-
commits@linuxtv.org/msg48542.html. Committed by Hans Verkuil.]

### Step 4.2: WHO REVIEWED THE PATCH
Hans Verkuil (media subsystem co-maintainer) signed off and committed
the patch.
Record: [Reviewed and committed by subsystem maintainer Hans Verkuil.]

### Step 4.3: SEARCH FOR THE BUG REPORT
Found a detailed bug report at GitHub (b-rad-NDi/Ubuntu-media-tree-
kernel-builder#121) from December 2020:
- User rb0135 reported HVR2200 revision 129 (REV2) devices were non-
  functional
- dmesg shows `saa7164_downloadimage() image corrupt` when loading
  `NXP7164-2010-03-10.1.fw`
- User had been manually patching the driver "for a few years" before
  filing the report
- The fix was verified to work by the user: "your patch worked
  perfectly"
Record: [GitHub issue #121 from 2020. User-verified fix. Bug existed for
years with users manually patching.]

### Step 4.4: RELATED PATCHES
This is a standalone fix. No related series.
Record: [Standalone fix.]

### Step 4.5: STABLE MAILING LIST
No specific stable discussion found, but no reason it was excluded
either - it simply didn't have the Cc: stable tag.
Record: [No stable-specific discussion found.]

---

## PHASE 5: CODE SEMANTIC ANALYSIS

### Step 5.1: KEY FUNCTIONS
The `#define` values are used in `saa7164_downloadfirmware()` at lines
203-209.

### Step 5.2: TRACE CALLERS
`saa7164_downloadfirmware()` is called during device initialization
(probe path). This is the standard firmware loading path for all SAA7164
devices.

### Step 5.3-5.4: CODE FLOW
The firmware loading happens via `request_firmware(&fw, fwname,
&dev->pci->dev)` (line 407). If the firmware file is the wrong one for
the hardware revision, the device rejects it during boot verification
with "image corrupt" (line 155).
Record: [Firmware loading is on the critical probe path. All REV2 device
users are affected.]

### Step 5.5: SIMILAR PATTERNS
No similar pattern - this is a unique data error in the firmware
filename.

---

## PHASE 6: STABLE TREE ANALYSIS

### Step 6.1: BUGGY CODE IN STABLE TREES?
The buggy code was introduced in 2010 (commit 6d152c200e8630). It exists
in **every** stable tree.
Record: [Bug exists in all active stable trees - it's been present since
v2.6.36.]

### Step 6.2: BACKPORT COMPLICATIONS
The fix changes two `#define` macros that haven't changed since 2010.
The patch will apply cleanly to all stable trees.
Record: [Clean apply expected in all stable trees.]

### Step 6.3: RELATED FIXES IN STABLE
No related fixes found in stable.

---

## PHASE 7: SUBSYSTEM AND MAINTAINER CONTEXT

### Step 7.1: SUBSYSTEM CRITICALITY
- **Subsystem**: drivers/media/pci - PCI video capture driver
- **Criticality**: PERIPHERAL (specific hardware)
- However, for users with this hardware (Hauppauge HVR2200 REV2), the
  device is completely non-functional
Record: [drivers/media/pci - peripheral but total device failure for
affected users]

### Step 7.2: SUBSYSTEM ACTIVITY
The saa7164 driver receives occasional cleanup patches. It's a mature
driver.
Record: [Mature driver, infrequent changes.]

---

## PHASE 8: IMPACT AND RISK ASSESSMENT

### Step 8.1: WHO IS AFFECTED
Users of Hauppauge WinTV-HVR2200 revision 2 boards
(SAA7164_BOARD_HAUPPAUGE_HVR2200_2 and _3). Three board definitions use
SAA7164_CHIP_REV2.
Record: [Driver-specific: Hauppauge HVR2200 REV2 boards.]

### Step 8.2: TRIGGER CONDITIONS
Every device probe on REV2 hardware. 100% reproducible. No special
conditions needed.
Record: [Trigger: every boot with REV2 hardware. 100% reproducible.]

### Step 8.3: FAILURE MODE SEVERITY
The device is completely non-functional. Firmware loading fails with
"image corrupt". The hardware cannot be used at all.
Record: [Complete device failure. Severity: HIGH.]

### Step 8.4: RISK-BENEFIT RATIO
- **BENEFIT**: Very high for affected users - makes their hardware work
- **RISK**: Extremely low - 2-line #define change, no code logic change,
  REV3 unchanged
Record: [Benefit: HIGH (enables hardware). Risk: VERY LOW (2-line define
change). Excellent ratio.]

---

## PHASE 9: FINAL SYNTHESIS

### Step 9.1: EVIDENCE COMPILATION

**FOR backporting:**
- Fixes completely non-functional hardware for REV2 SAA7164 users
- 2-line change - minimal possible fix
- Obviously correct - restores proper firmware name
- Bug has existed since 2010, confirmed by real user reports since at
  least 2020
- Verified by user testing (GitHub issue #121)
- Signed off by media subsystem co-maintainer Hans Verkuil
- No risk of regression to REV3 devices
- Will apply cleanly to all stable trees

**AGAINST backporting:**
- No evidence against.

### Step 9.2: STABLE RULES CHECKLIST
1. Obviously correct and tested? **YES** - 2-line define change, user-
   tested
2. Fixes a real bug? **YES** - completely non-functional hardware
3. Important issue? **YES** - complete device failure
4. Small and contained? **YES** - 2 lines in 1 file
5. No new features or APIs? **YES** - just corrects firmware filename
6. Can apply to stable? **YES** - clean apply expected

### Step 9.3: EXCEPTION CATEGORIES
This is effectively a hardware enablement fix (correcting firmware for
specific hardware revision), similar in spirit to device ID additions
and hardware quirks.

### Step 9.4: DECISION
This is a textbook stable backport candidate: tiny, obviously correct
fix that makes real hardware work for real users.

---

## Verification

- [Phase 1] Parsed tags: Signed-off-by Bradford Love (author) and Hans
  Verkuil (media maintainer)
- [Phase 2] Diff analysis: 2 #define lines changed - firmware name and
  size for REV2
- [Phase 3] git blame: buggy code introduced in commit 6d152c200e8630
  (2010, v2.6.36), present in all stable trees
- [Phase 3] git show 6d152c200e8630: confirmed it changed REV2 firmware
  from `v4l-saa7164-1.0.2.fw` to `NXP7164-2010-03-10.1.fw` (same as
  REV3), breaking REV2
- [Phase 3] git log -- saa7164-fw.c: no conflicting recent changes;
  firmware defines unchanged since 2010
- [Phase 4] Found commit notification at mail-archive.com/linuxtv-
  commits
- [Phase 4] GitHub issue #121 (b-rad-NDi/Ubuntu-media-tree-kernel-
  builder): User rb0135 confirmed non-functional REV2 hardware since
  2020, had been patching manually "for a few years", confirmed fix
  works
- [Phase 4] dmesg in bug report shows "saa7164_downloadimage() image
  corrupt" with wrong firmware
- [Phase 5] Firmware loaded via request_firmware() in
  saa7164_downloadfirmware(), called during probe - all REV2 users
  affected
- [Phase 5] Three board definitions use SAA7164_CHIP_REV2: UNKNOWN_REV2,
  HVR2200_2, HVR2200_3
- [Phase 6] Bug exists in all stable trees (introduced 2010). Clean
  apply expected.
- [Phase 8] Failure mode: complete device non-functionality; severity
  HIGH; risk VERY LOW (2-line change)

**YES**

 drivers/media/pci/saa7164/saa7164-fw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/saa7164/saa7164-fw.c b/drivers/media/pci/saa7164/saa7164-fw.c
index cc9f384f7f1e9..341cef62452f1 100644
--- a/drivers/media/pci/saa7164/saa7164-fw.c
+++ b/drivers/media/pci/saa7164/saa7164-fw.c
@@ -10,8 +10,8 @@
 
 #include "saa7164.h"
 
-#define SAA7164_REV2_FIRMWARE		"NXP7164-2010-03-10.1.fw"
-#define SAA7164_REV2_FIRMWARE_SIZE	4019072
+#define SAA7164_REV2_FIRMWARE		"v4l-saa7164-1.0.2-3.fw"
+#define SAA7164_REV2_FIRMWARE_SIZE	4038864
 
 #define SAA7164_REV3_FIRMWARE		"NXP7164-2010-03-10.1.fw"
 #define SAA7164_REV3_FIRMWARE_SIZE	4019072
-- 
2.53.0


