Return-Path: <linux-media+bounces-59152-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGIwAAU55mlutgEAu9opvQ
	(envelope-from <linux-media+bounces-59152-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 16:32:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C20D42D2B7
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 16:32:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 54128338C2D7
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 14:25:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 826F248166A;
	Mon, 20 Apr 2026 13:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UlRs23Ma"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BB0481256;
	Mon, 20 Apr 2026 13:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776691901; cv=none; b=ACPaJFQ+7wD51/ezg4nVrwLjXO0s/4Kk5NygPSfiQ5V+9a9prUVOg0R5YAdf7HeCFoAiAA+fGgc91oALFQexobVCtnb5abghg25oxUb5VKy/EUhl+EotPWJ828Gi4FxbNzm86A37g9u2eypYYKFKDPw1Yc8SxkurMpLl2juV3d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776691901; c=relaxed/simple;
	bh=jLaQ5mtu6NohVGxAgwEUv8FaATrlaU0CV5hqHWD7Mik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hTtWVQxNQGkKPUctpYoo+zMHSmaL6avoxYqfkneCiBuvLecc6cBfA0JpmEK7FsssbyAXFanRkLABLoT6Eej3PCvjwyUvjMyt/UjsrS5JVi0MN2wXn9NMDXpLXlpOrjTao4+KR7u0CXV8SrG+kYc1HXV6K6qlntPk3mEUhVeC77A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UlRs23Ma; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A6E2C2BCB6;
	Mon, 20 Apr 2026 13:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776691900;
	bh=jLaQ5mtu6NohVGxAgwEUv8FaATrlaU0CV5hqHWD7Mik=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UlRs23MaUdNODz5oDM0wpzPAAK6w/N1rM0Z27hcqdN570H9ttT5XK0B6x6dZaYRhT
	 aK/jP2Jbvy0DZ/9/A7zB4LLqYRw1rgKCTIrokJiov8SUv5AH5r1N9I5YTyVwkxSbnn
	 l6yKLlmD+yifU9264MYdCKNxwQAp6Lv2IRVh02lAHAQSkCCYzbREggUPz3uS6Vytov
	 TSUMymF+q1mFNl9f6DgIGubxNtR/8MkRYdZfJQlmcPIEIQkwqCAclYkVkJYhbn5t7b
	 6rmcp4VYVtJKLM1XzHC5K1NHTCKshSt4WB1qAiptgLmOCZGRIQ+KzamCkl58N+bvkK
	 WdLgF1+XPUung==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Bradford Love <brad@nextdimension.cc>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 7.0-5.10] media: si2168: fw 4.0-11 loses warm state during sleep
Date: Mon, 20 Apr 2026 09:20:53 -0400
Message-ID: <20260420132314.1023554-259-sashal@kernel.org>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59152-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nextdimension.cc:email,mail-archive.com:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6C20D42D2B7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Bradford Love <brad@nextdimension.cc>

[ Upstream commit 57c3c67fce95ab0d449d3f6ae339621fcb61080e ]

Ignoring version 4.0-11 firmware leads to non functional devices
after sleep on all Hauppauge DVB devices containing the si2168 and
firmware version 4.0-11.

Signed-off-by: Bradford Love <brad@nextdimension.cc>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Now I have all the information needed. Let me compile the full analysis.

---

## PHASE 1: COMMIT MESSAGE FORENSICS

### Step 1.1: Subject Line
- **Subsystem**: `media: si2168` (DVB frontend demodulator driver)
- **Action verb**: implicit "fix" — the subject describes the problem
  (firmware loses warm state)
- **Summary**: Firmware version 4.0-11 loses warm state during sleep,
  causing broken devices after resume

### Step 1.2: Tags
- `Signed-off-by: Bradford Love <brad@nextdimension.cc>` — the patch
  author (Hauppauge developer)
- `Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>` — the media
  subsystem co-maintainer who applied it
- No Fixes: tag (expected — that's why this commit needs review)
- No Cc: stable tag (expected)

### Step 1.3: Commit Body
The message states: "Ignoring version 4.0-11 firmware leads to non
functional devices after sleep on all Hauppauge DVB devices containing
the si2168 and firmware version 4.0-11." This clearly describes a
**device failure after suspend/resume** affecting all Hauppauge DVB
devices with this firmware version.

### Step 1.4: Hidden Bug Fix Detection
This is not hidden — it's an explicit bug fix for a version comparison
off-by-one error. The `>` operator excluded firmware 4.0-11 from the
warm state reset, but that firmware also loses warm state during sleep.

---

## PHASE 2: DIFF ANALYSIS

### Step 2.1: Inventory
- **Files**: 1 file changed (`drivers/media/dvb-frontends/si2168.c`)
- **Lines**: 2 lines changed (1 code line, 1 comment line)
- **Function**: `si2168_sleep()`
- **Scope**: Single-file, single-line surgical fix

### Step 2.2: Code Flow Change
**Before**: `if (dev->version > ('B' << 24 | 4 << 16 | 0 << 8 | 11 <<
0))` — only resets `warm` for firmware versions **strictly after**
4.0-11 (e.g., 4.0-19).

**After**: `if (dev->version >= ('B' << 24 | 4 << 16 | 0 << 8 | 11 <<
0))` — resets `warm` for firmware 4.0-11 **and later**.

When `warm` is not reset to false, `si2168_init()` (called during
resume) takes the "warm" shortcut path at line 426-439, skipping
firmware re-upload. But if the firmware actually lost its state, the
device becomes non-functional.

### Step 2.3: Bug Mechanism
**Category**: Logic/correctness fix — off-by-one in version comparison.
**Mechanism**: The `>` operator incorrectly excluded the boundary value
(4.0-11), leaving `warm=true` for devices that had lost firmware state
during sleep. On resume, the init function skipped firmware upload,
resulting in a non-functional device.

### Step 2.4: Fix Quality
- **Obviously correct**: YES — the change is a single comparison
  operator `>` to `>=`
- **Minimal**: YES — 2 lines, purely surgical
- **Regression risk**: Negligible. The only effect is that firmware
  4.0-11 devices will now re-upload firmware on resume, which is the
  correct behavior (same as all later firmware versions already do).
  Worst case is a slightly slower resume for these devices.

---

## PHASE 3: GIT HISTORY INVESTIGATION

### Step 3.1: Blame
The buggy line was introduced by commit `6ab1e9438a71b6` ("si2168: add
support for newer firmwares") by Antti Palosaari in 2016, first released
in kernel v4.8. The original commit message says: "Si2168-B40 firmware
API has changed somewhere between 4.0-11 and 4.0-19" — indicating the
developer was uncertain about the exact boundary.

### Step 3.2: Related History
Commit `fce61d1dfd5b3` (2018) by Mauro Carvalho Chehab changed the
comment to match the code ("later than B 4.0-11"), but did NOT fix the
actual code. This inadvertently cemented the wrong behavior.

### Step 3.3: External Confirmation
A patch for the identical fix was submitted by Nigel Kettlewell in
September 2017 for the PCTV 292e USB device, but was never applied. That
report confirms the bug has been known for years.

### Step 3.4: Author Context
Brad Love is a prolific Hauppauge media developer with 15+ commits to
the media subsystem — all related to Hauppauge DVB/analog devices. He is
a domain expert for this hardware.

### Step 3.5: Dependencies
None. This is a completely standalone one-line fix. No prerequisites
needed.

---

## PHASE 4: MAILING LIST / EXTERNAL RESEARCH

### Step 4.1: Original Patch Discussion
Found on the linuxtv-commits mailing list (mail-archive.com) — the patch
was committed on March 12, 2026. Hans Verkuil applied it directly.

### Step 4.2: Historical Bug Report
Found Nigel Kettlewell's 2017 bug report on LKML describing the exact
same issue on PCTV 292e USB: "Using firmware v4.0.11 the 292e would work
once and then hang on subsequent attempts to view DVB channels, until
physically unplugged and plugged back in." This confirms a multi-year
real-world bug.

### Step 4.3-4.5: No additional stable discussion found.

---

## PHASE 5: CODE SEMANTIC ANALYSIS

### Step 5.1-5.2: Function Context
`si2168_sleep()` is registered as the `.sleep` callback in `si2168_ops`
(line 667). It is called by the DVB core whenever the frontend is put to
sleep (system suspend, channel change, etc.). This is a common,
regularly exercised code path.

### Step 5.3-5.4: Call Chain
- System suspend → DVB core → `si2168_sleep()` → sets `warm = false` (or
  not, depending on version)
- System resume → `si2168_resume()` → `si2168_init()` → checks `warm` →
  if warm, skips firmware upload (lines 426-439)
- If firmware was lost but `warm` is still true, the device fails

### Step 5.5: Similar Patterns
No other similar version comparison issues in this file.

---

## PHASE 6: STABLE TREE ANALYSIS

### Step 6.1: Buggy Code in Stable
The buggy code (commit `6ab1e9438a71b6`) was introduced in v4.8. It
exists in ALL active stable trees. No changes to this specific code have
been made in any stable tree — the line is identical everywhere.

### Step 6.2: Backport Difficulty
The patch will apply **cleanly** to all stable trees. The surrounding
code in `si2168_sleep()` has not changed significantly since 2019 (only
the `cmd_init` refactoring in `619f6fc390909` which is already in
stable).

---

## PHASE 7: SUBSYSTEM AND MAINTAINER CONTEXT

### Step 7.1: Subsystem
**DVB frontends** (drivers/media/dvb-frontends/) — a media driver
subsystem. Criticality: **IMPORTANT** for DVB TV users.

### Step 7.2: Subsystem Activity
The si2168 driver is mature and stable — very few functional changes in
recent years (mostly treewide refactoring). This makes the fix MORE
important because the bug has persisted for ~10 years.

---

## PHASE 8: IMPACT AND RISK ASSESSMENT

### Step 8.1: Affected Users
All users of **Hauppauge DVB devices** (and potentially other DVB
devices) using the si2168 demodulator with firmware version B 4.0-11.
This includes PCTV 292e USB and similar popular consumer DVB hardware.

### Step 8.2: Trigger Conditions
**Very common**: Any system suspend/resume cycle triggers the bug. On
laptops, this happens daily.

### Step 8.3: Failure Mode
**HIGH severity**: Complete device failure after resume. The device
becomes non-functional — no DVB channels can be viewed. Requires
physical disconnect and reconnect to recover. Not a crash, but a
complete loss of device functionality.

### Step 8.4: Risk-Benefit
- **Benefit**: HIGH — restores device functionality after suspend/resume
  for affected hardware
- **Risk**: VERY LOW — one-character change, obviously correct, only
  changes behavior for firmware 4.0-11 devices (which are currently
  broken), and the change makes them behave identically to all later
  firmware versions (which already work correctly)

---

## PHASE 9: FINAL SYNTHESIS

### Step 9.1: Evidence Summary

**FOR backporting:**
- Fixes a real, user-impacting bug: devices non-functional after sleep
- Bug independently confirmed by two people (Kettlewell 2017, Love 2026)
- Fix is minimal: one character change (`>` to `>=`)
- Obviously correct: includes the boundary value that was incorrectly
  excluded
- Bug has existed since v4.8 (~10 years)
- Author is a Hauppauge hardware expert
- Accepted by media co-maintainer Hans Verkuil
- Zero regression risk: only affects devices that are currently broken
- Applies cleanly to all stable trees

**AGAINST backporting:**
- Nothing significant

### Step 9.2: Stable Rules Checklist
1. Obviously correct and tested? **YES** — trivial comparison fix,
   accepted by maintainer
2. Fixes a real bug? **YES** — devices non-functional after sleep
3. Important issue? **YES** — complete device failure
4. Small and contained? **YES** — 2 lines in 1 file
5. No new features? **YES** — pure bug fix
6. Can apply to stable? **YES** — code is identical across all stable
   trees

### Step 9.3: Exception Categories
This also qualifies as a **hardware workaround** — it correctly handles
a firmware behavior that was previously handled incorrectly.

---

## Verification

- [Phase 1] Parsed tags: author is Bradford Love (Hauppauge dev),
  applied by Hans Verkuil (media co-maintainer)
- [Phase 2] Diff analysis: single character change `>` to `>=` in
  `si2168_sleep()`, plus matching comment update
- [Phase 3] git blame: buggy code introduced in commit `6ab1e9438a71b6`
  (v4.8, 2016), present in all stable trees
- [Phase 3] git show `fce61d1dfd5b3`: confirmed 2018 comment-only fix
  made the wrong behavior "official"
- [Phase 3] git log --author="Brad Love": confirmed 15+ media
  contributions, Hauppauge hardware expert
- [Phase 4] mail-archive.com linuxtv-commits: confirmed patch committed
  March 2026 by Hans Verkuil
- [Phase 4] LKML 2017 report by Nigel Kettlewell: independently
  confirmed identical bug on PCTV 292e USB
- [Phase 5] Code flow: sleep → warm stays true → resume → init skips
  firmware upload → device non-functional
- [Phase 6] Code is identical across all active stable trees; no
  conflicts expected
- [Phase 8] Failure mode: complete device failure after suspend/resume,
  severity HIGH

The fix is a one-character, obviously correct change that restores
device functionality after sleep for all affected Hauppauge DVB
hardware. It meets every stable kernel criterion.

**YES**

 drivers/media/dvb-frontends/si2168.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-frontends/si2168.c b/drivers/media/dvb-frontends/si2168.c
index c4bbcd127caca..6647e17611734 100644
--- a/drivers/media/dvb-frontends/si2168.c
+++ b/drivers/media/dvb-frontends/si2168.c
@@ -572,8 +572,8 @@ static int si2168_sleep(struct dvb_frontend *fe)
 	if (ret)
 		goto err;
 
-	/* Firmware later than B 4.0-11 loses warm state during sleep */
-	if (dev->version > ('B' << 24 | 4 << 16 | 0 << 8 | 11 << 0))
+	/* Firmware B 4.0-11 and later lose warm state during sleep */
+	if (dev->version >= ('B' << 24 | 4 << 16 | 0 << 8 | 11 << 0))
 		dev->warm = false;
 
 	cmd_init(&cmd, "\x13", 1, 0);
-- 
2.53.0


