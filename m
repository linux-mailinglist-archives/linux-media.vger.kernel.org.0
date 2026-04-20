Return-Path: <linux-media+bounces-59144-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLNCCOxa5mmtvAEAu9opvQ
	(envelope-from <linux-media+bounces-59144-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 18:57:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB9243044E
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 18:57:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 38FC03109B9C
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 13:59:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C4873C198C;
	Mon, 20 Apr 2026 13:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qbnBNnTj"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C063FF8B3;
	Mon, 20 Apr 2026 13:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776691604; cv=none; b=sxzNYVunU3yuR9Q8If89J+3VuvfPeGIZlG7j1jMJqXFhBWGZh2VnhyN4yt1Wt+V5pBBo9g4jce5pJ3ye/+RFTgyz5ZnokyY66cGrShxFRRqfHo+SB2Ez96Y7G8IDnJ/2Q1YRyMdgEmV7DKEdcI2F9vsr3WZjDk96XSPevYbz+FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776691604; c=relaxed/simple;
	bh=dbjLP7ma+mqQn8azWy+pNO9IoasATc0sZWFIDHT0Tk0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WL6ql1zRNt9xYpe4tIAxOvhkq4ptkfHOOa0zENQeu/4xjFnRZZbMwhm0b9h9/sPoSm5Oo2YbV+uJIPISanhYFfmZsS9mfkmupbOynbJP5bSwsZhntt6w/6ihFEnG+QJsBNO/iq4c7sNUWPR3Fk8mW69X4f5KmOBYM1/a6zFk2iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qbnBNnTj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CF0FC19425;
	Mon, 20 Apr 2026 13:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776691603;
	bh=dbjLP7ma+mqQn8azWy+pNO9IoasATc0sZWFIDHT0Tk0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qbnBNnTj4qseCU0OKqnucI20vEYt3mRPyttg7d4SbA4VV5LlLGPs6pMDGUPxcBdB6
	 gES3/2DwuIj5oGw/4wuYg2WhpQM3QJdpxwEaMUfa6dqb50TjoGIxoWjq3DqDPDIs3m
	 PIVhVSMuQN5NE8nc8O1L7CTFNKcQfJGtXS6xcCFPKZi+Srv7lGUQNWXCl6zKaUxCmv
	 Qt692315x0eJWywrAzt1lz79489okMwPZo2C+parwFJtHloc/hagHcc1QlrLqP5JDW
	 g5R9lGMpDhgI5R8+kQ4qgj2pUgRMuZH1dbpENvlBXOHqBtbHmbbqsIMxRBT7lfSXf1
	 8uDiwBe8skZQw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Ziyi Guo <n7l8m4@u.northwestern.edu>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 7.0-6.12] media: i2c: imx258: add missing mutex protection for format code access
Date: Mon, 20 Apr 2026 09:18:40 -0400
Message-ID: <20260420132314.1023554-126-sashal@kernel.org>
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
X-Spamd-Result: default: False [5.84 / 15.00];
	SEM_URIBL(3.50)[northwestern.edu:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59144-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,body];
	R_DKIM_ALLOW(0.00)[kernel.org:s=k20201202];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-media,huawei];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	R_SPF_ALLOW(0.00)[+ip4:104.64.211.4:c];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.657];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,northwestern.edu:email]
X-Rspamd-Queue-Id: 1CB9243044E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Ziyi Guo <n7l8m4@u.northwestern.edu>

[ Upstream commit c3109ecc3bb76aab9ef65f2e795a97a764a0b4a3 ]

imx258_open(), imx258_enum_mbus_code(), and imx258_enum_frame_size()
call imx258_get_format_code() without holding imx258->mutex. However,
imx258_get_format_code() has lockdep_assert_held(&imx258->mutex)
indicating that callers must hold this lock.

All other callers of imx258_get_format_code() properly acquire the mutex:
- imx258_set_pad_format() acquires mutex at imx258.c:918
- imx258_get_pad_format() acquires mutex at imx258.c:896

The mutex is needed to protect access to imx258->vflip->val and
imx258->hflip->val which are used to calculate the bayer format code.

Add mutex_lock()/mutex_unlock() around the imx258_get_format_code()
calls in the affected functions to fix the missing lock protection.

Signed-off-by: Ziyi Guo <n7l8m4@u.northwestern.edu>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Now I have enough information for a thorough analysis. Let me compile
the findings.

---

## PHASE 1: COMMIT MESSAGE FORENSICS

### Step 1.1: PARSE THE SUBJECT LINE
- **Subsystem**: `media: i2c: imx258` (V4L2 camera sensor driver)
- **Action verb**: "add missing" — indicates a bug fix (adding
  protection that should have been there)
- **Summary**: Add missing mutex_lock/unlock around calls to
  `imx258_get_format_code()` in three functions

### Step 1.2: PARSE ALL COMMIT MESSAGE TAGS
- **Signed-off-by**: Ziyi Guo <n7l8m4@u.northwestern.edu> (author)
- **Signed-off-by**: Sakari Ailus <sakari.ailus@linux.intel.com> (media
  subsystem co-maintainer)
- **Signed-off-by**: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
  (media subsystem maintainer)
- No Fixes: tag (expected for candidates under review)
- No Reported-by: tag
- No Cc: stable tag

Record: The patch went through the proper media subsystem chain
(maintainer SOBs from Sakari Ailus and Mauro Carvalho Chehab). Author
appears to be a university student contributor.

### Step 1.3: ANALYZE THE COMMIT BODY TEXT
- **Bug described**: Three functions (`imx258_open()`,
  `imx258_enum_mbus_code()`, `imx258_enum_frame_size()`) call
  `imx258_get_format_code()` without holding `imx258->mutex`, violating
  a lockdep assertion.
- **Symptom**: With `CONFIG_PROVE_LOCKING`, lockdep will trigger a
  warning/assertion. Without lockdep, there's a data race on
  `imx258->vflip->val` and `imx258->hflip->val`.
- **Root cause**: When `4c05213aeed73` added writable HFLIP/VFLIP
  controls and `imx258_get_format_code()` with `lockdep_assert_held()`,
  it failed to add mutex protection in all callers.

### Step 1.4: DETECT HIDDEN BUG FIXES
Record: This IS a genuine bug fix — missing synchronization that creates
a data race on shared state (flip values). The `lockdep_assert_held()`
assertion explicitly documents the requirement.

## PHASE 2: DIFF ANALYSIS

### Step 2.1: INVENTORY THE CHANGES
- **File modified**: `drivers/media/i2c/imx258.c` (+12/-2 net)
- **Functions modified**: `imx258_open()`, `imx258_enum_mbus_code()`,
  `imx258_enum_frame_size()`
- **Scope**: Single-file, surgical fix

### Step 2.2: UNDERSTAND THE CODE FLOW CHANGE
- **`imx258_open()`**: Added `mutex_lock/unlock` around the block that
  calls `imx258_get_format_code()`. Lock is released before the
  `try_crop` initialization (which doesn't need the lock).
- **`imx258_enum_mbus_code()`**: Added `mutex_lock/unlock` around the
  single `imx258_get_format_code()` call.
- **`imx258_enum_frame_size()`**: Added a local `u32 code` variable,
  acquires mutex, calls `imx258_get_format_code()` into the local,
  releases mutex, then uses `code` for the comparison.

### Step 2.3: IDENTIFY THE BUG MECHANISM
- **Category**: Race condition / missing synchronization
- **Mechanism**: `imx258_get_format_code()` reads `imx258->vflip->val`
  and `imx258->hflip->val` to compute the bayer format code. These
  values can be changed concurrently by `imx258_set_ctrl()` (which holds
  the ctrl handler lock but not necessarily `imx258->mutex` at the same
  granularity). Without the mutex, there's a race between reading flip
  values and writing them through V4L2 control operations.
- The function already has `lockdep_assert_held(&imx258->mutex)`
  documenting this requirement.

### Step 2.4: ASSESS THE FIX QUALITY
- The fix is obviously correct: it adds the required mutex around the
  calls, matching the pattern used by all other callers
  (`imx258_get_pad_format()` at line 896, `imx258_set_pad_format()` at
  line 918).
- Minimal and surgical — only adds lock/unlock pairs.
- Low regression risk — the mutex is already used throughout the driver;
  adding it to more V4L2 callbacks is consistent.
- The lock scope in `imx258_open()` is appropriately narrow (released
  before `try_crop` initialization).

## PHASE 3: GIT HISTORY INVESTIGATION

### Step 3.1: BLAME THE CHANGED LINES
Record: All calls to `imx258_get_format_code()` in the affected
functions were introduced by commit `4c05213aeed73` ("media: i2c:
imx258: Make HFLIP and VFLIP controls writable") by Dave Stevenson,
which was merged for v6.11-rc1.

### Step 3.2: FOLLOW THE FIXES TARGET
No Fixes: tag present, but the bug was introduced by `4c05213aeed73`
(v6.11-rc1). This commit exists in stable trees v6.11, v6.12, v6.13, but
NOT in v6.6, v6.7–v6.10.

### Step 3.3: FILE HISTORY
Recent changes to `imx258.c` since v6.11: minor header changes
(`asm/unaligned.h` → `linux/unaligned.h`), CCI conversion, clock helper
changes. None conflict with this fix.

### Step 3.4: AUTHOR CONTEXT
- Ziyi Guo (author): Appears to be a first-time contributor (no other
  commits found in this subsystem)
- Signed off by Sakari Ailus (media subsystem maintainer at Intel) —
  strong endorsement
- Signed off by Mauro Carvalho Chehab (top-level media maintainer) —
  accepted through the standard media tree

### Step 3.5: DEPENDENCIES
No dependencies. The fix only adds `mutex_lock()/mutex_unlock()` calls
around existing code. The mutex and `imx258_get_format_code()` already
exist in all trees that have `4c05213aeed73`.

## PHASE 4: MAILING LIST AND EXTERNAL RESEARCH

### Step 4.1-4.5
I was unable to find the specific patch submission on lore.kernel.org
(searches blocked by anti-scraping protection). The commit has proper
maintainer signoffs from both Sakari Ailus and Mauro Carvalho Chehab,
indicating it went through standard review.

Record: The mailing list discussion could not be retrieved. However, the
dual-maintainer signoff chain confirms proper review.

## PHASE 5: CODE SEMANTIC ANALYSIS

### Step 5.1: KEY FUNCTIONS
Modified: `imx258_open()`, `imx258_enum_mbus_code()`,
`imx258_enum_frame_size()`

### Step 5.2: TRACE CALLERS
These are V4L2 subdev ops callbacks:
- `imx258_open()` → `.open` in `v4l2_subdev_internal_ops` — called when
  userspace opens the subdev node
- `imx258_enum_mbus_code()` → `.enum_mbus_code` in `v4l2_subdev_pad_ops`
  — called via `VIDIOC_SUBDEV_ENUM_MBUS_CODE` ioctl
- `imx258_enum_frame_size()` → `.enum_frame_size` in
  `v4l2_subdev_pad_ops` — called via `VIDIOC_SUBDEV_ENUM_FRAME_SIZE`
  ioctl

All are reachable from userspace through standard V4L2 ioctls.

### Step 5.3-5.4: CALL CHAIN
Userspace → V4L2 ioctl → subdev pad ops →
`imx258_enum_mbus_code()/imx258_enum_frame_size()` →
`imx258_get_format_code()` (reads `vflip->val`, `hflip->val`). The race
window exists if another thread simultaneously calls `VIDIOC_S_CTRL` to
change HFLIP/VFLIP.

### Step 5.5: SIMILAR PATTERNS
Verified that other callers (`imx258_get_pad_format` at line 896,
`imx258_set_pad_format` at line 918) already properly hold the mutex.
The fix makes all callers consistent.

## PHASE 6: CROSS-REFERENCING AND STABLE TREE ANALYSIS

### Step 6.1: BUGGY CODE IN STABLE TREES
The buggy commit `4c05213aeed73` exists in v6.11+. It does NOT exist in
v6.6 or earlier LTS trees. Applicable stable trees: 6.11.y, 6.12.y,
6.13.y (and 7.0 which is the target here).

### Step 6.2: BACKPORT COMPLICATIONS
The patch should apply cleanly to any tree that has `4c05213aeed73`. The
only unrelated change between v6.11 and HEAD is the `asm/unaligned.h`
rename, which doesn't touch the affected functions.

### Step 6.3: RELATED FIXES
No other fix for this specific issue was found in any stable tree.

## PHASE 7: SUBSYSTEM AND MAINTAINER CONTEXT

### Step 7.1: SUBSYSTEM CRITICALITY
- **Subsystem**: drivers/media/i2c — camera sensor driver
- **Criticality**: PERIPHERAL — affects users of the IMX258 camera
  sensor specifically (common on Raspberry Pi, some laptops)

### Step 7.2: SUBSYSTEM ACTIVITY
Moderately active — the file has seen ~20 commits in recent history,
mostly feature additions.

## PHASE 8: IMPACT AND RISK ASSESSMENT

### Step 8.1: WHO IS AFFECTED
Users of the IMX258 camera sensor who have writable HFLIP/VFLIP controls
(v6.11+).

### Step 8.2: TRIGGER CONDITIONS
- Concurrent V4L2 operations: one thread enumerating formats while
  another changes HFLIP/VFLIP controls.
- Also triggers as a lockdep warning with `CONFIG_PROVE_LOCKING` even
  without concurrency.
- Userspace-reachable through standard V4L2 ioctls.

### Step 8.3: FAILURE MODE SEVERITY
- With lockdep enabled: WARNING splat in kernel log (MEDIUM)
- Without lockdep: data race on `vflip->val`/`hflip->val` — could return
  wrong bayer format code, leading to incorrect image format negotiation
  (MEDIUM)
- Not a crash or security vulnerability, but a correctness and data race
  issue.

Record: Severity: MEDIUM

### Step 8.4: RISK-BENEFIT RATIO
- **Benefit**: Fixes a real data race and lockdep warning. Ensures
  correct format code under concurrent access. LOW-MEDIUM benefit (fixes
  correctness, not a crash).
- **Risk**: VERY LOW — only adds mutex_lock/unlock pairs around existing
  code, matching the pattern already used by other callers in the same
  driver.
- **Ratio**: Favorable — minimal risk, clear correctness improvement.

## PHASE 9: FINAL SYNTHESIS

### Step 9.1: EVIDENCE COMPILATION

**FOR backporting:**
- Fixes a real race condition (missing synchronization documented by
  lockdep_assert_held)
- Small, surgical fix (12 lines added)
- Obviously correct — matches the pattern of all other callers
- Accepted through proper maintainer review chain
- No dependencies — standalone fix
- Applies to v6.11+ stable trees

**AGAINST backporting:**
- Not a crash or security vulnerability — the race leads to incorrect
  bayer format code, not a panic
- Limited user base (IMX258 camera sensor users only)
- The race requires specific concurrent access patterns
- No Reported-by tag — no evidence users have hit this in practice
- Lockdep warning is the main practical symptom

### Step 9.2: STABLE RULES CHECKLIST
1. Obviously correct and tested? **Yes** — follows existing pattern,
   maintainer-signed
2. Fixes a real bug? **Yes** — data race, lockdep assertion violation
3. Important issue? **Medium** — data race, but not
   crash/security/corruption
4. Small and contained? **Yes** — 12 lines in one file
5. No new features? **Correct** — purely adds lock protection
6. Can apply to stable? **Yes** — clean apply expected for v6.11+

### Step 9.3: EXCEPTION CATEGORIES
Not an exception category — this is a standard bug fix.

### Step 9.4: DECISION
This is a small, correct fix for a genuine race condition with
`lockdep_assert_held` documentation proving the locking requirement. It
was accepted by the media subsystem maintainers. The fix is minimal risk
and follows the existing locking pattern. While the severity is medium
(not a crash), it fixes a real data race that could cause incorrect
format negotiation and triggers lockdep warnings with
`CONFIG_PROVE_LOCKING`.

## Verification

- [Phase 1] Parsed tags: SOBs from Ziyi Guo (author), Sakari Ailus
  (media co-maintainer), Mauro Carvalho Chehab (media maintainer). No
  Fixes/Reported-by/Cc:stable tags.
- [Phase 2] Diff analysis: +12/-2 lines across 3 functions in
  `imx258.c`, adding `mutex_lock/unlock` around
  `imx258_get_format_code()` calls.
- [Phase 2] Verified `lockdep_assert_held(&imx258->mutex)` exists at
  line 696 in `imx258_get_format_code()`.
- [Phase 2] Verified other callers (`imx258_get_pad_format` at line 896,
  `imx258_set_pad_format` at line 918) properly hold mutex.
- [Phase 3] git blame: All buggy call sites introduced by
  `4c05213aeed73` ("Make HFLIP and VFLIP controls writable"), first in
  v6.11-rc1.
- [Phase 3] `git merge-base --is-ancestor`: buggy commit present in
  v6.11, v6.12, v6.13; NOT in v6.6–v6.10.
- [Phase 3] git log: No other mutex-related imx258 fixes found.
- [Phase 4] b4 dig for `4c05213aeed73`: found original submission as
  patch v5 20/25 at lore.
- [Phase 4] UNVERIFIED: Could not retrieve full mailing list discussion
  for the fix commit due to lore anti-scraping.
- [Phase 5] Verified callers are V4L2 subdev ops, reachable from
  userspace ioctls.
- [Phase 5] Verified `imx258_get_format_code` reads `vflip->val` and
  `hflip->val` (lines 698-699).
- [Phase 6] Code changes between v6.11 and HEAD in this file are minimal
  (header rename, CCI conversion), no conflicts expected.
- [Phase 8] Failure mode: lockdep WARNING + data race leading to
  incorrect bayer format code. Severity MEDIUM.

**YES**

 drivers/media/i2c/imx258.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index e50dcfd830f52..bc9ee449a87c5 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -709,12 +709,16 @@ static int imx258_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 		v4l2_subdev_state_get_format(fh->state, 0);
 	struct v4l2_rect *try_crop;
 
+	mutex_lock(&imx258->mutex);
+
 	/* Initialize try_fmt */
 	try_fmt->width = supported_modes[0].width;
 	try_fmt->height = supported_modes[0].height;
 	try_fmt->code = imx258_get_format_code(imx258);
 	try_fmt->field = V4L2_FIELD_NONE;
 
+	mutex_unlock(&imx258->mutex);
+
 	/* Initialize try_crop */
 	try_crop = v4l2_subdev_state_get_crop(fh->state, 0);
 	try_crop->left = IMX258_PIXEL_ARRAY_LEFT;
@@ -839,7 +843,9 @@ static int imx258_enum_mbus_code(struct v4l2_subdev *sd,
 	if (code->index > 0)
 		return -EINVAL;
 
+	mutex_lock(&imx258->mutex);
 	code->code = imx258_get_format_code(imx258);
+	mutex_unlock(&imx258->mutex);
 
 	return 0;
 }
@@ -849,10 +855,16 @@ static int imx258_enum_frame_size(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct imx258 *imx258 = to_imx258(sd);
+	u32 code;
+
 	if (fse->index >= ARRAY_SIZE(supported_modes))
 		return -EINVAL;
 
-	if (fse->code != imx258_get_format_code(imx258))
+	mutex_lock(&imx258->mutex);
+	code = imx258_get_format_code(imx258);
+	mutex_unlock(&imx258->mutex);
+
+	if (fse->code != code)
 		return -EINVAL;
 
 	fse->min_width = supported_modes[fse->index].width;
-- 
2.53.0


