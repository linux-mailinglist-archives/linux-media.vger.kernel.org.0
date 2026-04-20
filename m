Return-Path: <linux-media+bounces-59143-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0I4cAgc65mmGtgEAu9opvQ
	(envelope-from <linux-media+bounces-59143-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 16:36:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6161742D3F7
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 16:36:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8B7F930F299E
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 13:57:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 761CC3FCB37;
	Mon, 20 Apr 2026 13:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qmgIWq88"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20CD3FCB17;
	Mon, 20 Apr 2026 13:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776691585; cv=none; b=NBKskgPUX1Sew+zfMtEhsUeGFu4Q8iIm7idOQadx4cJi/qAFD53q/tHi/SleW1YpI3FqAG8DYx7qp/dwFHbKNc151GiHXSQm0F3jRW+eb0uXX84SOWw/A5/wR23vrAC/u95282BhapOnXZAy8HWsLO4Xzi/f9vlQdzDZ5fZcZT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776691585; c=relaxed/simple;
	bh=GrhmipHnEZyWWOmlHvWbuutYZ6f5nzbsGZNogAXjMrY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T1Tm9WbfAdLJeeN/r2qi13w92nXuZie/IZ04wwIGbshVR6ZfYIaeE2UCwGJLEe9OQHNJd1OuYBRS6mxZGmsoDusGDNgW5K6ffLmCqWcBVTTW2SzJi2bDvzo4rxnvhABG1KjcGCNEvNAlI8GZybMnOMTmDm50E/DZ7ibWSAVeJeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qmgIWq88; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BD22C2BCB4;
	Mon, 20 Apr 2026 13:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776691585;
	bh=GrhmipHnEZyWWOmlHvWbuutYZ6f5nzbsGZNogAXjMrY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qmgIWq88uBUO0au1/cEOjrkNrwCIJbLXusyaSENMnaerlxm0oTuOwzvZGXqL8NaSP
	 bS0se39NUhBvHd/szO0XMpThcP4zJCXwlbSTggTt6XMZu0SAAFSReCykt2e/anrQgm
	 QS2cXiIHWA4YDIfJ3HSiRu0Y8OzNIZ7/VjydUaJNU7m+GgJ7nx2Uk7JwXHMTVfEVsB
	 GyZWGa4pSnyPk9fUQws+G7MBoyHR+bIgEcAizljCEOLZh57fhlRFkm3o9H2He3vpAO
	 CBkyd4opEl5upxRZQ+1vZNGd7zI7xOq0fXOKsjuIaFDXdaxrKupb6Cc79iP8s3G2Rz
	 6g4zSqWpmkqDA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Vicki Pfau <vi@endrift.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	hverkuil@kernel.org,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 7.0-5.10] media: pulse8-cec: Handle partial deinit
Date: Mon, 20 Apr 2026 09:18:30 -0400
Message-ID: <20260420132314.1023554-116-sashal@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59143-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6161742D3F7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Vicki Pfau <vi@endrift.com>

[ Upstream commit 323f52e02be68889c8630c4a0415ef5b78f9dc63 ]

In the event that the cec dev node is held open while the adapter is
disconnected the serio device will be cleaned up but the cec device won't
be. As the serio device is freed but the ping_eeprom_work is not canceled,
the next ping will still attempt to send, leading to a kernel oops.

This patch both cancels the ping_eeprom_work in the serio cleanup as well
as checking to make sure the serio is still present before attempting to
write to it. Note that while the added serio = NULL line looks similar to
one that was removed in commit 024e01dead12c ("media: pulse8-cec: fix
duplicate free at disconnect or probe error"), it notably happens before
calling cec_unregister_adapter, and as such shouldn't lead to the
user-after-free that removing it fixed.

Signed-off-by: Vicki Pfau <vi@endrift.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Now I have all the information needed. Let me compile my complete
analysis.

---

## PHASE 1: COMMIT MESSAGE FORENSICS

### Step 1.1: Subject Line
- **Subsystem**: media: pulse8-cec
- **Action verb**: "Handle" (indicates fixing incorrect handling - a bug
  fix indicator)
- **Summary**: Handle partial deinitialization when CEC device node is
  still open during adapter disconnect

### Step 1.2: Tags
- **Signed-off-by**: Vicki Pfau <vi@endrift.com> (author)
- **Signed-off-by**: Hans Verkuil <hverkuil+cisco@kernel.org> (subsystem
  maintainer)
- No Fixes: tag (expected for candidates under review)
- No Cc: stable (expected for candidates under review)
- No Reported-by (author likely found this themselves)

### Step 1.3: Commit Body Analysis
The commit clearly describes the bug: When the CEC device node is held
open while the USB adapter is disconnected, the serio device is cleaned
up but the CEC device is not (because a filehandle is still open). The
`ping_eeprom_work` is not cancelled, so the next periodic ping attempts
to write to the freed serio device, causing a **kernel oops**.

The author also carefully notes the relationship with commit
`024e01dead12c`, explaining that while the `serio = NULL` line looks
similar to one that was previously removed (because it caused a UAF when
placed *after* `cec_unregister_adapter`), this new placement is *before*
`cec_unregister_adapter`, avoiding that problem.

**Record**: Bug = kernel oops when adapter disconnected with CEC device
open; Symptom = oops on next ping; Root cause = ping_eeprom_work not
cancelled in disconnect, and serio pointer not invalidated.

### Step 1.4: Hidden Bug Fix Detection
This is explicitly a crash fix. The word "Handle" and the description of
"kernel oops" leave no ambiguity.

## PHASE 2: DIFF ANALYSIS

### Step 2.1: Inventory
- **File**: `drivers/media/cec/usb/pulse8/pulse8-cec.c` (+7 lines)
- **Functions modified**:
  1. `pulse8_send_and_wait_once()` - added NULL check for
     `pulse8->serio`
  2. `pulse8_disconnect()` - added work cancellation and serio pointer
     invalidation
- **Scope**: Single-file, single-driver, surgical fix

### Step 2.2: Code Flow Changes

**Hunk 1** (`pulse8_send_and_wait_once`):
- **Before**: Directly accesses `pulse8->serio` to send data
- **After**: Checks `if (!pulse8->serio) return -ENODEV;` before
  accessing serio
- This is a safety check that prevents NULL dereference

**Hunk 2** (`pulse8_disconnect`):
- **Before**: Immediately calls `cec_unregister_adapter`, sets drvdata
  NULL, closes serio
- **After**: First cancels `ping_eeprom_work`, then sets `pulse8->serio
  = NULL` under mutex lock, then proceeds with existing cleanup
- This ensures no in-flight work can access the freed serio device

### Step 2.3: Bug Mechanism
This is a **use-after-free / NULL pointer dereference** fix. The race
condition:
1. Userspace has `/dev/cecX` open
2. USB adapter is disconnected -> `pulse8_disconnect()` runs
3. `cec_unregister_adapter()` does NOT free the pulse8 struct because a
   filehandle is open (deferred via refcount)
4. `serio_close()` tears down the serio
5. `ping_eeprom_work` fires -> calls `pulse8_send_and_wait()` ->
   `pulse8_send_and_wait_once()` -> dereferences `pulse8->serio` ->
   **OOPS** (freed memory)

### Step 2.4: Fix Quality
- **Obviously correct**: Yes. The fix cancels the work before serio
  teardown, sets serio=NULL under the existing mutex, and adds a NULL
  check in the function that all callers invoke under the same mutex.
- **Minimal/surgical**: Yes, 7 lines added.
- **Regression risk**: Very low. Setting serio=NULL before
  `cec_unregister_adapter` (not after) avoids the UAF that the earlier
  commit `024e01dead12c` fixed. The author explicitly addresses this.

## PHASE 3: GIT HISTORY INVESTIGATION

### Step 3.1: Blame
The disconnect function was introduced in `cea28e7a55e7af` (2019-12-11).
The `pulse8_send_and_wait_once` function dates from the same commit.
This code has been in the tree since kernel v5.5 era, affecting all
active stable trees.

### Step 3.2: Fixes Tag Analysis
No Fixes: tag, but the commit references `024e01dead12c` which was a
prior fix to a related UAF issue in the disconnect path. That commit was
explicitly Cc: stable and is present in stable trees.

### Step 3.3: File History
The file has had limited changes over the years. Most recent substantive
changes:
- `92cbf865ea2e0` - handle possible ping error (2023)
- `024e01dead12c` - fix duplicate free at disconnect (2020)
- `aa9eda76129c` - close serio in disconnect, not adap_free (2020)

### Step 3.4: Author Context
Vicki Pfau is a known kernel contributor (10 commits visible in this
tree, primarily HID and input). Hans Verkuil, who signed off, is the CEC
subsystem maintainer and original author of the pulse8-cec driver.

### Step 3.5: Dependencies
This fix is standalone. It does not depend on any other uncommitted
patches. The code structure it modifies (disconnect function,
send_and_wait_once) has been stable since 2020.

## PHASE 4: MAILING LIST RESEARCH

### Step 4.1: Discussion
The commit was found in the linuxtv-commits mailing list, posted
2026-03-09. Hans Verkuil (subsystem maintainer) committed it directly.
No objections or NAKs were found.

### Step 4.2: Review
The patch was signed off by Hans Verkuil, the CEC subsystem maintainer
and original pulse8-cec author - this carries significant weight.

## PHASE 5: CODE SEMANTIC ANALYSIS

### Step 5.1: Key Functions
- `pulse8_send_and_wait_once()` - core send function
- `pulse8_disconnect()` - serio disconnect callback

### Step 5.2: Callers of `pulse8_send_and_wait_once`
Called through `pulse8_send_and_wait()` from:
- `pulse8_tx_work_handler()` (line 295: holds mutex)
- `pulse8_cec_adap_enable()` (line 488: holds mutex)
- `pulse8_cec_adap_log_addr()` (line 509: holds mutex)
- `pulse8_ping_eeprom_work_handler()` (line 810: holds mutex)
- `pulse8_setup()` - only during probe, no race

All runtime callers hold `pulse8->lock` mutex, which means the fix's
`serio = NULL` under mutex + NULL check provides proper synchronization.

### Step 5.3-5.5: Impact Surface
The `ping_eeprom_work` fires every 15 seconds (`PING_PERIOD = 15 * HZ`).
This means within 15 seconds of disconnecting the adapter while the CEC
device node is open, a kernel oops will occur. This is highly
reproducible.

## PHASE 6: STABLE TREE ANALYSIS

### Step 6.1: Buggy Code in Stable
The buggy code has been present since the `601282d65b96` commit (v5.5
era, 2019) which introduced the `adap_free` callback pattern. The
`ping_eeprom_work` not being cancelled in disconnect has been a latent
bug since then. This affects all active stable trees (5.15.y, 6.1.y,
6.6.y, 6.12.y, 7.0.y).

### Step 6.2: Backport Complications
The patch should apply cleanly. The file has had minimal changes (only
the `kzalloc_obj` treewide conversion and a timestamp fix) since the
relevant code was last modified. Minor fuzz at most.

### Step 6.3: Related Fixes in Stable
Commit `024e01dead12c` (fixing a related UAF in disconnect) is already
in stable and is a prerequisite that is already present.

## PHASE 7: SUBSYSTEM CONTEXT

### Step 7.1: Subsystem Criticality
- **Subsystem**: drivers/media/cec/usb/pulse8 - USB CEC adapter driver
- **Criticality**: PERIPHERAL (specific hardware), but the Pulse-Eight
  adapter is a popular CEC adapter used by many home theater setups and
  HTPC users

### Step 7.2: Subsystem Activity
Low activity - this is a mature driver with infrequent changes, meaning
the bug has been latent for years.

## PHASE 8: IMPACT AND RISK ASSESSMENT

### Step 8.1: Affected Users
Users of the Pulse-Eight USB CEC adapter who disconnect the adapter
while the CEC device node is held open by a CEC-aware application (e.g.,
libcec, Kodi).

### Step 8.2: Trigger Conditions
- User unplugs the Pulse-Eight adapter while a CEC application has
  `/dev/cecX` open
- The oops occurs within 15 seconds (next ping period)
- No privilege required - any user with access to the CEC device can
  trigger this
- Highly reproducible

### Step 8.3: Failure Mode
**Kernel oops** (NULL pointer dereference or use-after-free of the serio
device). Severity: **CRITICAL** - kernel crash.

### Step 8.4: Risk-Benefit Ratio
- **Benefit**: HIGH - prevents a kernel oops on a common user operation
  (unplugging USB device)
- **Risk**: VERY LOW - 7-line change, obviously correct, touches only
  error/teardown paths, signed off by subsystem maintainer

## PHASE 9: FINAL SYNTHESIS

### Step 9.1: Evidence Compilation
**FOR backporting**:
- Fixes a kernel oops (crash) - critical bug
- Highly reproducible (unplug with open filehandle, wait 15 seconds)
- Small, surgical fix (7 lines added)
- Single file, single driver
- Signed off by subsystem maintainer (Hans Verkuil)
- The fix is obviously correct (cancel work + NULL guard under existing
  mutex)
- Buggy code exists in all stable trees (since v5.5)
- No dependencies on other uncommitted patches

**AGAINST backporting**:
- None significant

### Step 9.2: Stable Rules Checklist
1. Obviously correct and tested? **YES** - simple cancel + NULL check
   pattern, signed by maintainer
2. Fixes a real bug? **YES** - kernel oops on adapter disconnect
3. Important issue? **YES** - kernel crash
4. Small and contained? **YES** - 7 lines, one file
5. No new features or APIs? **YES** - purely defensive checks
6. Can apply to stable? **YES** - should apply cleanly

### Step 9.3: Exception Categories
Not needed - this qualifies as a standard important bug fix.

## Verification

- [Phase 1] Parsed tags: Signed-off-by from Vicki Pfau (author) and Hans
  Verkuil (subsystem maintainer)
- [Phase 2] Diff analysis: 7 lines added across 2 hunks: NULL check in
  `pulse8_send_and_wait_once()` and work cancellation + serio=NULL in
  `pulse8_disconnect()`
- [Phase 3] git blame: buggy code in `pulse8_disconnect()` introduced in
  `cea28e7a55e7af` (2019-12-11), present in all stable trees
- [Phase 3] git show 024e01dead12c: confirmed related prior fix
  (duplicate free) is already in stable trees, Cc: stable explicitly
- [Phase 3] git show aa9eda76129c: confirmed the serio close was moved
  back to disconnect in 2020
- [Phase 3] git show 601282d65b96: confirmed adap_free callback pattern
  introduced the deferred cleanup that creates the race window
- [Phase 4] linuxtv-commits archive: found commit notification, signed
  by Hans Verkuil (maintainer), no objections
- [Phase 5] Grep callers: all runtime callers of
  `pulse8_send_and_wait_once` hold `pulse8->lock` mutex, confirming the
  fix's synchronization is correct
- [Phase 5] Verified `pulse8_ping_eeprom_work_handler` acquires mutex at
  line 810 before calling `pulse8_send_and_wait` at line 812
- [Phase 5] Verified re-schedule at line 831 happens before mutex
  unlock, but after the `cancel_delayed_work_sync` in the fix, no new
  work can be scheduled
- [Phase 6] File has had minimal changes - patch should apply cleanly to
  stable trees
- [Phase 8] Failure mode: kernel oops from accessing freed serio device,
  severity CRITICAL

**YES**

 drivers/media/cec/usb/pulse8/pulse8-cec.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/cec/usb/pulse8/pulse8-cec.c b/drivers/media/cec/usb/pulse8/pulse8-cec.c
index 0df3af152762c..fa5df10627539 100644
--- a/drivers/media/cec/usb/pulse8/pulse8-cec.c
+++ b/drivers/media/cec/usb/pulse8/pulse8-cec.c
@@ -235,6 +235,9 @@ static int pulse8_send_and_wait_once(struct pulse8 *pulse8,
 {
 	int err;
 
+	if (!pulse8->serio)
+		return -ENODEV;
+
 	if (debug > 1)
 		dev_info(pulse8->dev, "transmit %s: %*ph\n",
 			 pulse8_msgname(cmd[0]), cmd_len, cmd);
@@ -655,6 +658,10 @@ static void pulse8_disconnect(struct serio *serio)
 {
 	struct pulse8 *pulse8 = serio_get_drvdata(serio);
 
+	cancel_delayed_work_sync(&pulse8->ping_eeprom_work);
+	mutex_lock(&pulse8->lock);
+	pulse8->serio = NULL;
+	mutex_unlock(&pulse8->lock);
 	cec_unregister_adapter(pulse8->adap);
 	serio_set_drvdata(serio, NULL);
 	serio_close(serio);
-- 
2.53.0


