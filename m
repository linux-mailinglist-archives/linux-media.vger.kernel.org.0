Return-Path: <linux-media+bounces-59135-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLnHElsp5mnesgEAu9opvQ
	(envelope-from <linux-media+bounces-59135-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 15:25:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E032D42BADE
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 15:25:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C87BE30AE56E
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 13:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BABA93ACEFB;
	Mon, 20 Apr 2026 13:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KQ5DcD2c"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07ABF3AD51A;
	Mon, 20 Apr 2026 13:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776690991; cv=none; b=rG+niu5fMiBrrfIErbS38WiL6CBPsxkYct1LZCatXAEp0AAPDLPKncT1HoyuWr8TcCkSqLtnbYSQE9wtAbDj2taFAbJfjF5dwk3SCFsneh14ctTJIvQn8WoY2Y7rA4OBB5jZlQMOJ06O5++bUOyB+mujx0QJXX9KAnTyTq+WOKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776690991; c=relaxed/simple;
	bh=QTWetuI0QyEYrkUeCO9v+GitqyROQ3of7lo44kSxslY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h1oTwmadie7sFbk7QKLICEJS7wf3XzMaNMKJ88dCm1kLLnrcEhILFenE8/mViVJirkXUkkHlgyK1ID+e680nTX8bbSEwjNXScnIVvvej71eLpphvGJK0pZNAnIjEzcZ4rSX/LoLKN6+LaxYhWolsHb27hfSu2t2LU4G+NE848Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KQ5DcD2c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E2A1C2BCB6;
	Mon, 20 Apr 2026 13:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776690990;
	bh=QTWetuI0QyEYrkUeCO9v+GitqyROQ3of7lo44kSxslY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KQ5DcD2csna1IRKBfRcHRPu974ZtgN4jHlST/VCS+k0wUOq/Y55sr6NXx4vb5t/Wb
	 CWJDS4rAQJvfyEJ7pum4w2z9hbcjiaygATEdWN1zvV5IU/RK40L6+2sBLLuSluUkeT
	 q1qtXdwBEBgHdVhu+v+2kELJjTVJnoYmUNlZmNNKOwrqXaawfvL0kl2L0vpaYxKVvm
	 z3nfvdbuamPXV/PSQPtknRjthjky/eb1FIW5lE5jL1/SzFwjYqA1yO6py2Ci3CtDMs
	 0UcjqqgVEhyRSXv/Wa0Dgx15No0Qv4zdymLVSRiffBaflVBDHlJuz9jio+whJZ40qw
	 ls1XlGmIf7rMw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Bradford Love <brad@nextdimension.cc>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 7.0-5.10] media: au0828: Fix green screen in analog
Date: Mon, 20 Apr 2026 09:08:16 -0400
Message-ID: <20260420131539.986432-30-sashal@kernel.org>
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
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59135-lists,linux-media=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.983];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: E032D42BADE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Bradford Love <brad@nextdimension.cc>

[ Upstream commit 58119a0cffa8a597ce5d39587beb0f5a763434a0 ]

When the driver was converted to VB2 the original function to fix
green frame detection was removed and a default vb2 dqbuf function
was used instead. This vb2 dqbuf function leads to green frames not
being detected and correupting stream captures.

The vidioc_dqbuf function checks the greenscreen flag, and, if set
resets the stream to discard the green frame and decode a real frame.

Signed-off-by: Bradford Love <brad@nextdimension.cc>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Here is my complete analysis:

---

## PHASE 1: COMMIT MESSAGE FORENSICS

### Step 1.1: Subject Line
- **Subsystem:** `media: au0828`
- **Action verb:** "Fix" - explicit bug fix
- **Summary:** Fixes green screen frames in analog video capture by
  restoring a hardware workaround lost during VB2 conversion

### Step 1.2: Tags
- `Signed-off-by: Bradford Love <brad@nextdimension.cc>` - the author, a
  known au0828 contributor
- `Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>` - the V4L2
  subsystem maintainer who accepted the patch
- No Fixes: tag (expected for commits under review)
- No Cc: stable (expected)

### Step 1.3: Commit Body
The commit explains clearly:
- When the driver was converted to VB2 (videobuf2), the original
  `vidioc_dqbuf` function that contained greenscreen detection was
  removed
- It was replaced with the generic `vb2_ioctl_dqbuf` which has no
  greenscreen logic
- This causes green frames to go undetected, "correupting stream
  captures"
- The fix restores the custom `vidioc_dqbuf` that checks the greenscreen
  flag and resets the stream

### Step 1.4: Hidden Bug Fix Assessment
This is NOT a hidden bug fix - it explicitly says "Fix" and clearly
describes a regression from the VB2 conversion.

**Record:** This is a regression fix restoring a hardware workaround
that was accidentally removed during a refactoring 10+ years ago.

---

## PHASE 2: DIFF ANALYSIS

### Step 2.1: Inventory
- **File:** `drivers/media/usb/au0828/au0828-video.c`
- **Lines added:** ~21 (new `vidioc_dqbuf` function)
- **Lines changed:** 2 (ioctl_ops table entries: `.vidioc_dqbuf` and
  whitespace fix for `.vidioc_expbuf`)
- **Functions modified:** New `vidioc_dqbuf()` added; `video_ioctl_ops`
  struct updated
- **Scope:** Single-file, surgical fix

### Step 2.2: Code Flow Change
**Before:** `video_ioctl_ops.vidioc_dqbuf` pointed directly to
`vb2_ioctl_dqbuf`, which simply dequeues a buffer with no greenscreen
check.

**After:** A new wrapper `vidioc_dqbuf()` is called that:
1. Calls `check_dev(dev)` to verify device is connected/configured
2. Checks `dev->greenscreen_detected` flag
3. If set, calls `au0828_analog_stream_reset(dev)` (writes hardware
   registers to reset the stream) and clears the flag
4. Calls `vb2_ioctl_dqbuf()` for actual buffer dequeue

### Step 2.3: Bug Mechanism
This is a **logic/correctness fix** - specifically restoring a
**hardware workaround**. The au0828 hardware has a design bug where the
colorspace can sometimes be inverted, producing green frames. The
detection code at line 377-380 still sets `dev->greenscreen_detected =
1` when it detects inverted colorspace in the DMA buffer, but nothing
ever reads this flag to trigger the stream reset. The fix closes this
gap.

### Step 2.4: Fix Quality
- **Obviously correct:** Yes. It closely mirrors the pre-VB2 code that
  existed before commit `05439b1a3693`.
- **Minimal/surgical:** Yes. Only adds a wrapper and changes one
  function pointer.
- **Regression risk:** Very low. The wrapper simply adds a check before
  calling the same generic function.

---

## PHASE 3: GIT HISTORY INVESTIGATION

### Step 3.1: Blame
The line being modified (line 1767: `.vidioc_dqbuf = vb2_ioctl_dqbuf`)
was introduced by commit `05439b1a3693` ("[media] media: au0828 -
convert to use videobuf2") by Shuah Khan, dating to v3.19-rc6 era,
merged in **v4.0**.

### Step 3.2: Fixes Target
The implicit "Fixes" target is `05439b1a36935` ("media: au0828 - convert
to use videobuf2") which landed in v4.0. This commit exists in ALL
active stable trees (5.4.y, 5.10.y, 5.15.y, 6.1.y, 6.6.y, 6.12.y, etc.).

The VB2 conversion removed the old `vidioc_dqbuf` that contained the
greenscreen detection code (verified by `git show 05439b1a3693` which
shows the removal of the function with greenscreen_detected checks).

### Step 3.3: File History
The file has had minimal changes since ~v5.5 era. Recent changes are
trivial (renaming timers, dropping wait_prepare/finish, using umin
macro, USB API function changes). The area around the ioctl_ops table
has been stable since the VB2 conversion.

### Step 3.4: Author
Bradford Love is a known au0828 contributor with other accepted fixes
(error messages, kfree ordering). Hans Verkuil is THE V4L2 subsystem
maintainer who signed off.

### Step 3.5: Dependencies
This fix is **standalone** - no prerequisites. It uses functions
(`check_dev`, `au0828_analog_stream_reset`, `vb2_ioctl_dqbuf`) and the
`greenscreen_detected` field that all exist in the tree since v4.0.

---

## PHASE 4: MAILING LIST AND EXTERNAL RESEARCH

### Step 4.1-4.5
b4 dig was unable to find the original patch submission (likely too
recent or unusual submission path). Web searches also did not locate the
specific lore thread. The patch was signed off by Hans Verkuil (V4L2
maintainer), confirming it passed review.

The original VB2 conversion series by Shuah Khan was a 3-patch series
(confirmed via the lkml archive). Patch 3/3 actually removed the buffer
timeout workaround - but NOT the greenscreen detection. The greenscreen
detection setting (`dev->greenscreen_detected = 1`) remained in the code
but became a dead store since the VB2 conversion removed the consumer
side.

---

## PHASE 5: CODE SEMANTIC ANALYSIS

### Step 5.1: Functions
- **New:** `vidioc_dqbuf()` - wrapper around `vb2_ioctl_dqbuf`
- **References:** `check_dev()` (line 93),
  `au0828_analog_stream_reset()` (line 789), `greenscreen_detected` (set
  at line 380)

### Step 5.2: Callers
`vidioc_dqbuf` is called by the V4L2 ioctl framework when userspace
calls `VIDIOC_DQBUF` ioctl - this is every frame dequeue in video
capture. It's a hot path for any application doing analog TV capture.

### Step 5.3: Callees
- `check_dev()`: Simple state check (disconnected/misconfigured)
- `au0828_analog_stream_reset()`: Writes hardware registers
  (SENSORCTRL_100) to reset the stream with a 30ms delay
- `vb2_ioctl_dqbuf()`: Standard VB2 buffer dequeue

### Step 5.4: Call Chain
Userspace (tvtime, xawtv, vlc, etc.) -> ioctl(VIDIOC_DQBUF) ->
`video_ioctl2` -> `vidioc_dqbuf` -> checks greenscreen ->
`vb2_ioctl_dqbuf`. Very straightforward and commonly exercised path.

### Step 5.5: Similar Patterns
The greenscreen detection code (line 377-380) sets the flag based on
pixel luminance values. Without the fix, this flag is set but never
consumed - a clear dead-code indicator that something is missing.

---

## PHASE 6: STABLE TREE ANALYSIS

### Step 6.1: Code Existence
The buggy code (`.vidioc_dqbuf = vb2_ioctl_dqbuf` without greenscreen
workaround) exists in **ALL stable trees** since v4.0. The
`greenscreen_detected` field and `au0828_analog_stream_reset()` function
also exist in all trees.

### Step 6.2: Backport Complications
Expected to apply **cleanly** or with trivial conflicts. The ioctl_ops
table area and the insertion point (after `vidioc_log_status`) have been
very stable. The only possible minor conflict is whitespace around the
`vidioc_expbuf` alignment fix.

### Step 6.3: No related fixes already in stable for this issue.

---

## PHASE 7: SUBSYSTEM CONTEXT

### Step 7.1: Subsystem
- **Path:** `drivers/media/usb/au0828/` - USB media driver
- **Criticality:** PERIPHERAL (specific USB TV capture hardware -
  Hauppauge HVR-950Q and similar)
- But: au0828 is a commonly used USB TV tuner chipset

### Step 7.2: Activity
The file sees very infrequent changes - stable/mature driver.

---

## PHASE 8: IMPACT AND RISK ASSESSMENT

### Step 8.1: Affected Users
Users of au0828-based USB TV capture devices (Hauppauge HVR-950Q, etc.)
doing analog TV capture.

### Step 8.2: Trigger Conditions
The au0828 hardware can randomly invert colorspace, producing green
frames. This is a hardware bug that occurs during normal analog TV
capture - no special conditions needed. Every user of analog capture on
this hardware can experience it.

### Step 8.3: Failure Mode Severity
- **Without fix:** Corrupted (green) video frames during analog capture
- **Severity:** MEDIUM-HIGH - the device doesn't crash but produces
  unusable output
- Not a crash or security issue, but a real functional regression that
  makes the hardware partially broken

### Step 8.4: Risk-Benefit Ratio
- **BENEFIT:** HIGH - restores correct functionality for all au0828
  analog capture users
- **RISK:** VERY LOW - the fix is a simple wrapper that adds one check
  before calling the same generic function. The code pattern is
  identical to what existed pre-VB2 conversion for ~5 years. Accepted by
  the V4L2 maintainer.
- **Ratio:** Strongly favorable

---

## PHASE 9: FINAL SYNTHESIS

### Step 9.1: Evidence

**FOR backporting:**
- Fixes a real, user-visible bug (green/corrupted video frames)
- Regression from VB2 conversion in v4.0 (~2015) - 10+ year old
  regression
- Small, surgical fix (~21 lines new code + 2 line change)
- Restores behavior that existed for years before the VB2 conversion
- Obviously correct - mirrors the pre-VB2 code closely
- Signed off by Hans Verkuil (V4L2 subsystem maintainer)
- Bug exists in ALL active stable trees
- Standalone fix with no dependencies
- Hardware workaround - exactly the type of fix stable trees accept

**AGAINST backporting:**
- No syzbot or sanitizer report (hardware-specific visual issue)
- Not a crash/security/data-corruption fix (but IS a functional
  regression fix)
- The `greenscreen_detected` flag access is not protected by locks (but
  this was the same in the pre-VB2 code and the flag is only set from
  URB completion context)

### Step 9.2: Stable Rules Checklist
1. **Obviously correct and tested?** YES - mirrors pre-VB2 code,
   accepted by maintainer
2. **Fixes a real bug?** YES - corrupted video frames for hardware users
3. **Important issue?** YES - functional regression making hardware
   partially unusable
4. **Small and contained?** YES - single file, ~23 lines total change
5. **No new features?** CORRECT - restores existing behavior
6. **Can apply to stable?** YES - clean apply expected, all required
   symbols present

### Step 9.3: Exception Categories
This qualifies as a **hardware quirk/workaround** - the greenscreen
detection is a workaround for a hardware design flaw in the au0828 chip.

### Step 9.4: Decision
This is a clear regression fix that restores a hardware workaround
accidentally removed during VB2 conversion. It meets all stable
criteria.

---

## Verification

- [Phase 1] Parsed tags: Signed-off-by from author (Bradford Love) and
  maintainer (Hans Verkuil)
- [Phase 2] Diff analysis: 21 lines added (new vidioc_dqbuf wrapper), 2
  lines changed in ioctl ops table
- [Phase 3] git blame (line 1767): Buggy code introduced by commit
  05439b1a3693 (VB2 conversion, v4.0 era)
- [Phase 3] git show 05439b1a3693: Confirmed it removed old vidioc_dqbuf
  with greenscreen handling and replaced with generic vb2_ioctl_dqbuf
- [Phase 3] git describe: VB2 conversion is
  v3.19-rc6-230-g05439b1a36935, merged in v4.0
- [Phase 3] git log v3.19..v4.0: Confirmed 05439b1a36935 appears in v4.0
- [Phase 3] git tag --contains: Confirmed present in all stable trees
  (p-5.10, p-5.15, etc.)
- [Phase 4] b4 dig: Could not find original submission (too recent or
  unusual path)
- [Phase 4] LKML archive: Confirmed VB2 conversion was a 3-patch series
  that removed the timeout workaround but kept greenscreen_detected
  field
- [Phase 5] Grep check_dev: Used in other ioctls (line 1247), confirmed
  it exists and works the same way
- [Phase 5] Grep greenscreen_detected: Set at line 380 (au0828-video.c),
  declared at line 234 (au0828.h) - flag is set but never read without
  this fix
- [Phase 5] Grep au0828_analog_stream_reset: Called from lines 789,
  1019, 1567, 1724 - well-established function
- [Phase 6] git log across stable versions: File barely changed since
  v5.5; fix should apply cleanly
- [Phase 8] Failure mode: Corrupted green video frames during analog
  capture, severity MEDIUM-HIGH
- UNVERIFIED: Could not locate the exact lore.kernel.org discussion
  thread for this specific patch

**YES**

 drivers/media/usb/au0828/au0828-video.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/au0828/au0828-video.c b/drivers/media/usb/au0828/au0828-video.c
index fbaa542c8259a..3c53105f3d2b3 100644
--- a/drivers/media/usb/au0828/au0828-video.c
+++ b/drivers/media/usb/au0828/au0828-video.c
@@ -1671,6 +1671,27 @@ static int vidioc_log_status(struct file *file, void *fh)
 	return 0;
 }
 
+static int vidioc_dqbuf(struct file *file, void *priv, struct v4l2_buffer *b)
+{
+	struct au0828_dev *dev = video_drvdata(file);
+	int rc;
+
+	rc = check_dev(dev);
+	if (rc < 0)
+		return rc;
+
+	/* Workaround for a bug in the au0828 hardware design that
+	 * sometimes results in the colorspace being inverted
+	 */
+	if (dev->greenscreen_detected == 1) {
+		dprintk(1, "Detected green frame.  Resetting stream...\n");
+		au0828_analog_stream_reset(dev);
+		dev->greenscreen_detected = 0;
+	}
+
+	return vb2_ioctl_dqbuf(file, priv, b);
+}
+
 void au0828_v4l2_suspend(struct au0828_dev *dev)
 {
 	struct urb *urb;
@@ -1764,8 +1785,8 @@ static const struct v4l2_ioctl_ops video_ioctl_ops = {
 	.vidioc_prepare_buf         = vb2_ioctl_prepare_buf,
 	.vidioc_querybuf            = vb2_ioctl_querybuf,
 	.vidioc_qbuf                = vb2_ioctl_qbuf,
-	.vidioc_dqbuf               = vb2_ioctl_dqbuf,
-	.vidioc_expbuf               = vb2_ioctl_expbuf,
+	.vidioc_dqbuf               = vidioc_dqbuf,
+	.vidioc_expbuf              = vb2_ioctl_expbuf,
 
 	.vidioc_s_std               = vidioc_s_std,
 	.vidioc_g_std               = vidioc_g_std,
-- 
2.53.0


