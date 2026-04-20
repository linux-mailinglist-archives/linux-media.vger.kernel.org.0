Return-Path: <linux-media+bounces-59137-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPxwOTss5ml4swEAu9opvQ
	(envelope-from <linux-media+bounces-59137-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 15:38:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB5542C12D
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 15:38:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 72028307F546
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 13:30:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6793E3D0938;
	Mon, 20 Apr 2026 13:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ljBa6pMK"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F3F3A7598;
	Mon, 20 Apr 2026 13:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776691084; cv=none; b=ryppU6B30sxN2Vh8qw+YHYYGP8Z2KIGYby95kHu4rq2tnwMaSlYfiFWqLgd2tCPhOA60BmLcJc0H/w+l4D5x+CiIfUaEF/czNGwGfzzwDjHkaPrQkmS3CVTMGXOYXfSBJGPKyxIGdotsKdqqVU121O4XJnhgmi4zpEvxP+O5ZXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776691084; c=relaxed/simple;
	bh=7ofxjYHWB0NPbIZJ8ORMceUeVocMV5qWS6/KwcLJDUU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B6TBczbaj1qkKadHcJfnpQoNnNEtGsGti+A0eKbdB/u0dHOJzByuKD+jHqErcCwttdswtkgD0mGfRjmFh838GxNcwmRXH67WHkfQagWgtGtNIVqDKE9OWM9Exwg75tNzRaPByNbXjR4R0hCJx2VqXZY6yV5wzrUr7HXokGZb8F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ljBa6pMK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A411C19425;
	Mon, 20 Apr 2026 13:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776691084;
	bh=7ofxjYHWB0NPbIZJ8ORMceUeVocMV5qWS6/KwcLJDUU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ljBa6pMKhnCTEPVn32C9FSeSFhQ6cOJQwVJO7bzI/nb3+oJZ5XIA7Yv/pEdIlDNWA
	 q3UNSHl/9VAhhg9f0pgXSV9123ioPDwdHgSPIuUAQRlMUabepiHg+GwFlDmqjGeObV
	 qoPoXo5Oaou5peCY0eecq0lsuQChRS4dcqQuOnl1zfDvvziDDCQVn2lOytOiCZY4Ru
	 fW0I6k/PhtC1B0dE2Ze2OEY+X0dGpSqu86zurU+NkOgMWAc79AnWvIkMXkvdu7ZBmA
	 +RcRGUPw959RICBAtrwX0GVGqx40n7w4gOpUfrbOD4aWFYKUvMKgETJxIpUsU+Oxyg
	 8dI6fp3O8IZKQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Chen Ni <nichen@iscas.ac.cn>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 7.0-5.10] media: i2c: mt9p031: Check return value of devm_gpiod_get_optional() in mt9p031_probe()
Date: Mon, 20 Apr 2026 09:09:10 -0400
Message-ID: <20260420131539.986432-84-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420131539.986432-1-sashal@kernel.org>
References: <20260420131539.986432-1-sashal@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-59137-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,huawei];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email,iscas.ac.cn:email]
X-Rspamd-Queue-Id: 9DB5542C12D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Chen Ni <nichen@iscas.ac.cn>

[ Upstream commit c8e0585dce5df525308f0fba40b618df03aaf7fc ]

The devm_gpiod_get_optional() function may return an error pointer
(ERR_PTR) in case of a genuine failure during GPIO acquisition, not just
NULL which indicates the legitimate absence of an optional GPIO.

Add an IS_ERR() check after the function call to catch such errors and
propagate them to the probe function, ensuring the driver fails to load
safely rather than proceeding with an invalid pointer.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Now I have all the information needed. Here is my complete analysis:

---

## PHASE 1: COMMIT MESSAGE FORENSICS

**Step 1.1: Subject Line**
- Subsystem: `media: i2c: mt9p031`
- Action verb: "Check" — adding a missing return value check (= fixing
  an unchecked error)
- Summary: Add IS_ERR check for `devm_gpiod_get_optional()` in the
  driver's probe function

**Step 1.2: Tags**
- Signed-off-by: Chen Ni (author), Sakari Ailus (media sub-maintainer),
  Mauro Carvalho Chehab (media subsystem maintainer)
- No Fixes: tag (expected for commits under review)
- No Reported-by, Tested-by, Cc: stable
- Record: Patch was reviewed by two maintainers in the media subsystem
  chain. No syzbot, no bug report.

**Step 1.3: Commit Body**
- Explains that `devm_gpiod_get_optional()` can return ERR_PTR on
  genuine failure, not just NULL
- Without the check, the driver proceeds with an invalid pointer
- The symptom: driver loads with an invalid (ERR_PTR) value stored in
  `mt9p031->reset`, which will cause a crash when later dereferenced

**Step 1.4: Hidden Bug Fix Detection**
- This IS a bug fix: a missing error check for a function that can
  return error pointers. Without it, the driver proceeds with an invalid
  pointer that will eventually be dereferenced.

## PHASE 2: DIFF ANALYSIS

**Step 2.1: Inventory**
- Single file: `drivers/media/i2c/mt9p031.c`
- +4 lines, -0 lines
- Function modified: `mt9p031_probe()`
- Scope: Single-file surgical fix

**Step 2.2: Code Flow Change**
- BEFORE: `devm_gpiod_get_optional()` return stored directly in
  `mt9p031->reset` without error checking. If it returns ERR_PTR, the
  invalid pointer persists.
- AFTER: IS_ERR check added; on error, `ret` is set and execution jumps
  to `done:` cleanup label.

**Step 2.3: Bug Mechanism**
This is a **memory safety / invalid pointer dereference fix**. The
`mt9p031->reset` field is used in three places:

```315:316:drivers/media/i2c/mt9p031.c
        if (mt9p031->reset) {
                gpiod_set_value(mt9p031->reset, 1);
```

```337:338:drivers/media/i2c/mt9p031.c
        if (mt9p031->reset) {
                gpiod_set_value(mt9p031->reset, 0);
```

```352:353:drivers/media/i2c/mt9p031.c
        if (mt9p031->reset) {
                gpiod_set_value(mt9p031->reset, 1);
```

ERR_PTR values are non-NULL, so `if (mt9p031->reset)` evaluates to TRUE,
and `gpiod_set_value()` will dereference the invalid pointer → kernel
oops.

**Step 2.4: Fix Quality**
- Obviously correct: standard IS_ERR/PTR_ERR pattern used throughout the
  kernel
- Minimal and surgical
- Cannot introduce regression (only adds an error check before existing
  code)
- Goes to the existing `done:` cleanup label which properly frees
  resources

## PHASE 3: GIT HISTORY INVESTIGATION

**Step 3.1: Blame**
The unchecked `devm_gpiod_get_optional()` was introduced in commit
`7c3be9f812be6c` ("[media] v4l: mt9p031: Convert to the gpiod API") by
Laurent Pinchart, first appearing in v4.1-rc1. The bug has existed for
~11 years.

**Step 3.2: Fixes Tag**
No Fixes: tag present. The implicit fix target is `7c3be9f812be6c` from
v4.1-rc1.

**Step 3.3: File History**
There have been ~23 changes to this file since v5.10, but the specific
`devm_gpiod_get_optional` call and surrounding lines have been stable
since introduction. The fix is standalone — no dependencies on other
patches.

**Step 3.4: Author**
Chen Ni is a prolific contributor of "check return value" patches. Two
identical-pattern patches by the same author for `adin1110` and
`max98390` have been accepted in the same timeframe, confirming this is
a recognized bug pattern.

**Step 3.5: Dependencies**
None. The fix is self-contained: it adds 4 lines using only existing
variables (`ret`) and labels (`done:`).

## PHASE 4: MAILING LIST RESEARCH

**Step 4.1: Original Discussion**
Found via `b4 dig`:
https://patch.msgid.link/20260202024312.3911800-1-nichen@iscas.ac.cn
Single submission, accepted without review comments (common for
trivially correct patches).

**Step 4.2: Reviewers**
Sakari Ailus (linux-media sub-maintainer) applied the patch. Mauro
Carvalho Chehab (media subsystem maintainer) signed off. Both are the
correct maintainers for this code.

**Step 4.3: Bug Report**
No external bug report. This was found by code inspection.

**Step 4.4: Related Patches**
The similar adin1110 patch (`78211543d2e44`) has a `Fixes:` tag and was
accepted. The mt9p031 version lacks a Fixes: tag but addresses the same
class of bug.

**Step 4.5: Stable History**
No stable-specific discussion found.

## PHASE 5: CODE SEMANTIC ANALYSIS

**Step 5.1: Modified Functions**
Only `mt9p031_probe()` is modified.

**Step 5.2: Callers of Affected Code**
`mt9p031_probe()` is the I2C driver probe function, called during device
registration. The `mt9p031->reset` field is then used in:
- `mt9p031_power_on()` ← called from `mt9p031_registered()` and
  `__mt9p031_set_power()`
- `mt9p031_power_off()` ← called from `mt9p031_registered()` and
  `__mt9p031_set_power()`

These are called during normal device operation (open/close/stream).

**Step 5.3-5.4: Call Chain**
The crash path: user opens the V4L2 device → `mt9p031_open()` →
`mt9p031_set_power()` → `__mt9p031_set_power()` → `mt9p031_power_on()` →
`gpiod_set_value(invalid_ptr)` → **kernel oops**.

**Step 5.5: Similar Patterns**
The `devm_gpiod_get_optional()` documentation explicitly states it can
return IS_ERR codes. This same missing-check pattern was found and fixed
in at least two other drivers simultaneously.

## PHASE 6: STABLE TREE ANALYSIS

**Step 6.1: Code Existence in Stable**
The buggy `devm_gpiod_get_optional()` call has existed since v4.1-rc1
and is present in ALL current stable trees (5.4.y, 5.10.y, 5.15.y,
6.1.y, 6.6.y, 6.12.y).

**Step 6.2: Backport Complications**
The surrounding code at the `devm_gpiod_get_optional()` call site hasn't
changed. The `done:` label and cleanup pattern are the same. Patch
should apply cleanly or with minimal offset adjustments to older stable
trees.

**Step 6.3: Related Fixes Already in Stable**
No prior fix for this bug exists in any stable tree.

## PHASE 7: SUBSYSTEM CONTEXT

**Step 7.1: Subsystem**
- `drivers/media/i2c/mt9p031.c` — Camera sensor driver (Aptina
  MT9P031/MT9P006)
- Criticality: PERIPHERAL — specific embedded/industrial camera sensor
- Used in embedded systems, BeagleBone, and similar platforms

**Step 7.2: Subsystem Activity**
Moderately active — mostly cleanups and API conversions recently,
indicating a mature driver.

## PHASE 8: IMPACT AND RISK ASSESSMENT

**Step 8.1: Affected Users**
Users of the Aptina MT9P031/MT9P006 camera sensor on ARM/DT-based
platforms.

**Step 8.2: Trigger Conditions**
- `devm_gpiod_get_optional()` returns ERR_PTR, most commonly
  `-EPROBE_DEFER` (deferred probing)
- Deferred probing is common on DT-based ARM systems where probe order
  is non-deterministic
- Can also occur with pinctrl errors, GPIO controller failures, etc.
- Likelihood: LOW to MEDIUM on affected platforms

**Step 8.3: Failure Mode Severity**
Kernel oops (invalid pointer dereference in `gpiod_set_value()`) →
**HIGH** severity when triggered. System crash, potential data loss.

**Step 8.4: Risk-Benefit**
- BENEFIT: Prevents kernel oops on GPIO acquisition failure — moderate
  benefit (niche hardware, realistic trigger)
- RISK: Very low — 4 lines, adds only an error check, standard pattern,
  cannot introduce regression
- Ratio: Favorable

## PHASE 9: FINAL SYNTHESIS

**Evidence FOR backporting:**
- Fixes a real bug: invalid pointer stored and later dereferenced →
  kernel oops
- Very small fix: 4 lines, single file, standard IS_ERR pattern
- Obviously correct: follows the kernel's universal error-checking
  convention
- Zero regression risk
- Buggy code present in ALL stable trees since v4.1
- Reviewed and accepted by both media sub-maintainer and maintainer
- Realistic trigger (deferred probing is common on DT/ARM systems)
- Clean apply expected (code unchanged at patch site since v4.1)
- Similar patches for same bug class accepted elsewhere

**Evidence AGAINST backporting:**
- Niche hardware (MT9P031 camera sensor, embedded use)
- No user bug report — found by code inspection
- No Fixes: tag in the commit
- Trigger requires GPIO acquisition failure, which may be uncommon in
  practice for this specific driver

**Stable Rules Checklist:**
1. Obviously correct and tested? **YES** — standard IS_ERR/PTR_ERR
   pattern
2. Fixes a real bug? **YES** — invalid pointer dereference → crash
3. Important issue? **YES** — kernel oops on affected hardware
4. Small and contained? **YES** — 4 lines, single file
5. No new features or APIs? **YES** — only an error check
6. Can apply to stable? **YES** — code unchanged at patch site

## Verification

- [Phase 1] Parsed tags: Signed-off-by from author + two media
  maintainers. No Fixes, Reported-by, or Cc: stable.
- [Phase 2] Diff analysis: 4 lines added in `mt9p031_probe()`, adds
  IS_ERR check after `devm_gpiod_get_optional()`.
- [Phase 2] Confirmed ERR_PTR values are non-NULL, verified `if
  (mt9p031->reset)` checks at lines 315, 337, 352 would pass with
  ERR_PTR values.
- [Phase 3] git blame: buggy code introduced in commit `7c3be9f812be6c`
  (v4.1-rc1), confirmed with `git describe --contains`.
- [Phase 3] git log: no prior fix for this issue exists.
- [Phase 4] b4 dig -c c8e0585dce5df: found original submission at
  https://patch.msgid.link/20260202024312.3911800-1-nichen@iscas.ac.cn
- [Phase 4] Mbox downloaded: no review discussion beyond the submission
  itself.
- [Phase 4] Two similar patches by same author (`78211543d2e44`
  adin1110, `a1d14d8364eac` max98390) confirmed accepted.
- [Phase 5] Traced call chain: probe → power_on →
  gpiod_set_value(invalid) → oops.
- [Phase 5] Confirmed `devm_gpiod_get_optional()` documentation at line
  68 of `gpiolib-devres.c` states it returns IS_ERR codes on failure.
- [Phase 6] Buggy code exists in all stable trees (v4.1+). No
  conflicting changes at patch site.
- [Phase 6] File has had changes in stable windows, but the
  `devm_gpiod_get_optional` call site is unchanged since v4.1.
- [Phase 8] Failure mode: kernel oops (invalid pointer dereference),
  severity HIGH. Trigger: GPIO acquisition error (deferred probing),
  probability LOW-MEDIUM.

The fix is small, obviously correct, standalone, and prevents a kernel
oops on a realistic error path. It meets all stable kernel criteria.

**YES**

 drivers/media/i2c/mt9p031.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
index 1500ee4db47ec..ea5d43d925ffa 100644
--- a/drivers/media/i2c/mt9p031.c
+++ b/drivers/media/i2c/mt9p031.c
@@ -1183,6 +1183,10 @@ static int mt9p031_probe(struct i2c_client *client)
 
 	mt9p031->reset = devm_gpiod_get_optional(&client->dev, "reset",
 						 GPIOD_OUT_HIGH);
+	if (IS_ERR(mt9p031->reset)) {
+		ret = PTR_ERR(mt9p031->reset);
+		goto done;
+	}
 
 	ret = mt9p031_clk_setup(mt9p031);
 	if (ret)
-- 
2.53.0


