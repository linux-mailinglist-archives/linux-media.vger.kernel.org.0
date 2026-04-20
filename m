Return-Path: <linux-media+bounces-59146-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WODPGto75mlutgEAu9opvQ
	(envelope-from <linux-media+bounces-59146-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 16:44:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F3F42D64B
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 16:44:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 903C8307B856
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 14:05:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98CB84219E7;
	Mon, 20 Apr 2026 13:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fXYSSbi4"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02089421A16;
	Mon, 20 Apr 2026 13:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776691661; cv=none; b=fjl6CWKQA5bwShVG4UmAezJYO8QYySO/senFT3bWzoaDf/r6jte8B2TsitA4B8qdVayYoRqTs2o2sJXwzixi2anBRWPaaPR0iYwYiBdQFE0j7M4w467jrjh/wzy+pIDUj531/H3Gyt+rwIyfAgmll62ygyrdhIgVA7QkVL7+QJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776691661; c=relaxed/simple;
	bh=xsHFILfhjTKIAberGvY6wrfpkP8Yo2eOggKnCT6jTdY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d45LT6RCSjrMDWdxdfaafbVg+70jTkZsgNdS2DrlDmUeYQsOwB06Q+uchp7wn1jBaGTSXkMDtctiVeYJ+dRVIpsPtF1i4X0jWgIVwNf9WnLjwDvVVHi7obc2xBObloppb4TDqPnpa1Bog7EvnozwJfP1OXEoru4vkSixtlYE80g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fXYSSbi4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBDB5C2BCB8;
	Mon, 20 Apr 2026 13:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776691660;
	bh=xsHFILfhjTKIAberGvY6wrfpkP8Yo2eOggKnCT6jTdY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fXYSSbi4mdJpUXiaJgMYJgodp5kuuD1ECBOuxRi9xGiFqjG6Jd/hzNlg9K+zIb1ed
	 gFBhv4gmp+CR/6lkzNUZb7K52gvx6MoE4rEHrI9OBhf2warU/FXQJLvzc+MBfayFgs
	 NoPpxHwCaA99koyWmyk1QpwY85TCGDDMeFA8Xi0T6bzMXzd4bnlOUYEEPGY0GksYVe
	 cCWI9TtzCS/ifRZGIlUuhzd9v7MnKbWQpoxPvUGdKDXmINzpJxK6ccLTebaD28AtZf
	 u2f9q7ZPZ8WMHD3jirwLpBzT5AD8JjWUL/5D+kzuTB17mr9QbM+npCLW6jB4C1fS4P
	 mAPm3LlKFhuww==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Stefan Klug <stefan.klug@ideasonboard.com>,
	Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 7.0-6.1] media: dw100: Fix kernel oops with PREEMPT_RT enabled
Date: Mon, 20 Apr 2026 09:19:12 -0400
Message-ID: <20260420132314.1023554-158-sashal@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-59146-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,msgid.link:url]
X-Rspamd-Queue-Id: 28F3F42D64B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Stefan Klug <stefan.klug@ideasonboard.com>

[ Upstream commit 557ec8cc29ade6c72ea768e59389db08cb7742c9 ]

On kernels with PREEMPT_RT enabled, a "BUG: scheduling while atomic"
kernel oops occurs inside dw100_irq_handler -> vb2_buffer_done. This is
because vb2_buffer_done takes a spinlock which is not allowed within
interrupt context on PREEMPT_RT.

The first attempt to fix this was to just drop the IRQF_ONESHOT so that
the interrupt is handled threaded on PREEMPT_RT systems. This introduced
a new issue. The dw100 has an internal timeout counter that is gated by
the DW100_BUS_CTRL_AXI_MASTER_ENABLE bit. Depending on the time it takes
for the threaded handler to run and the geometry of the data being
processed it is possible to reach the timeout resulting in
DW100_INTERRUPT_STATUS_INT_ERR_TIME_OUT being set and "dw100
32e30000.dwe: Interrupt error: 0x1" errors in dmesg.

To properly fix that, split the interrupt into two halves, reset the
DW100_BUS_CTRL_AXI_MASTER_ENABLE bit in the hard interrupt handler and
do the v4l2 buffer handling in the threaded half. The IRQF_ONESHOT can
still be dropped as the interrupt gets disabled in the hard handler and
will only be reenabled on the next dw100_device_run which will not be
called before the current job has finished.

Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
Reviewed-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Link: https://patch.msgid.link/20260304-sklug-v6-16-topic-dw100-v3-1-dev-v5-3-1a7e1f721b50@ideasonboard.com
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Now I have a thorough understanding of the commit. Let me compile the
full analysis.

---

## PHASE 1: COMMIT MESSAGE FORENSICS

### Step 1.1: Subject Line
- **Subsystem**: `media: dw100:` (NXP DW100 dewarper media driver)
- **Action verb**: "Fix" - explicit bug fix
- **Summary**: Fixes a kernel oops (BUG: scheduling while atomic) on
  PREEMPT_RT enabled kernels

Record: [media: dw100] [Fix] [Kernel oops with PREEMPT_RT due to
spinlock in interrupt context]

### Step 1.2: Tags
- **Signed-off-by**: Stefan Klug (author), Laurent Pinchart (maintainer
  path), Hans Verkuil (media subsystem maintainer)
- **Reviewed-by**: Xavier Roumegue (original driver author), Laurent
  Pinchart (prominent media/V4L2 maintainer)
- **Link**: `https://patch.msgid.link/20260304-sklug-v6-16-topic-
  dw100-v3-1-dev-v5-3-1a7e1f721b50@ideasonboard.com`
- No Fixes: tag, no Cc: stable (expected for manual review candidates)

Record: Two Reviewed-by from highly relevant people. Signed-off chain
through media subsystem maintainers (Laurent Pinchart, Hans Verkuil).

### Step 1.3: Commit Body
The commit message clearly describes:
- **Bug**: "BUG: scheduling while atomic" kernel oops on PREEMPT_RT
  kernels
- **Root cause**: `vb2_buffer_done` takes a spinlock (which becomes a
  sleeping lock on PREEMPT_RT), called from hard interrupt context via
  `dw100_irq_handler -> dw100_job_finish -> v4l2_m2m_buf_done ->
  vb2_buffer_done`
- **Failed first fix**: Simply dropping IRQF_ONESHOT caused timeout
  errors because the DW100 hardware's internal timeout counter is gated
  by the AXI master enable bit
- **Proper fix**: Split interrupt into hard handler (disable IRQ,
  disable bus, clear IRQs) and threaded handler (buffer completion)

Record: Clearly documented bug mechanism with concrete crash trigger.
Author tried a simpler fix first and evolved to a more robust solution
through review (v1->v4 iterations).

### Step 1.4: Hidden Bug Fix Detection
Not hidden - explicitly states "Fix kernel oops." The "BUG: scheduling
while atomic" is a kernel crash on PREEMPT_RT systems.

Record: Not a hidden fix; explicitly labeled kernel oops fix.

---

## PHASE 2: DIFF ANALYSIS

### Step 2.1: Inventory
- **Files**: 1 file changed: `drivers/media/platform/nxp/dw100/dw100.c`
- **Scope**: ~16 lines added, ~5 removed (net +11 lines)
- **Functions modified**: `dw100_irq_handler`, `dw100_probe`; new
  function `dw100_irq_thread_fn` added
- **Struct modified**: `dw100_device` (added `bool frame_failed`)
- **Classification**: Single-file surgical fix

### Step 2.2: Code Flow Change
1. **Include addition**: `#include <linux/irqreturn.h>` for
   `IRQ_WAKE_THREAD`
2. **Struct field**: Added `bool frame_failed` to `dw100_device` to
   communicate status between hard IRQ and threaded handler
3. **Hard IRQ handler** (`dw100_irq_handler`):
   - BEFORE: Reads status, disables IRQ/bus, clears IRQs, calls
     `dw100_job_finish()`, returns `IRQ_HANDLED`
   - AFTER: Reads status, disables IRQ/bus, clears IRQs, stores result
     in `dw_dev->frame_failed`, returns `IRQ_WAKE_THREAD`
4. **New threaded handler** (`dw100_irq_thread_fn`): Calls
   `dw100_job_finish(dw_dev, dw_dev->frame_failed)`, returns
   `IRQ_HANDLED`
5. **Probe function**: Changes `devm_request_irq(..., IRQF_ONESHOT)` to
   `devm_request_threaded_irq(..., flags=0)`

### Step 2.3: Bug Mechanism
Category: **Scheduling/context violation** (sleeping in atomic context).

`vb2_buffer_done()` calls `spin_lock_irqsave(&q->done_lock, flags)`. On
PREEMPT_RT, this spinlock is converted to a sleeping lock (rt_mutex).
Calling it from hard interrupt context triggers a scheduling violation,
resulting in "BUG: scheduling while atomic" kernel oops.

The fix moves `dw100_job_finish()` (which calls `v4l2_m2m_buf_done` ->
`vb2_buffer_done`) from the hard IRQ to a threaded IRQ handler where
sleeping locks are permitted.

### Step 2.4: Fix Quality
- **Obviously correct**: Yes. The standard kernel pattern of splitting
  IRQ into hard + threaded halves.
- **Minimal**: Yes. ~16 lines added, ~5 removed, all in one file.
- **Regression risk**: Very low. The hard handler still disables the IRQ
  and bus before returning, preventing re-entry. The threaded handler
  just calls the existing `dw100_job_finish`. No new locking introduced.
- **Red flags**: None.

Record: Clean, minimal, well-understood fix pattern. Regression risk
very low.

---

## PHASE 3: GIT HISTORY INVESTIGATION

### Step 3.1: Blame
The entire IRQ handler code (`dw100_irq_handler`) was introduced in
commit `cb6d000fcaa6e` ("media: dw100: Add i.MX8MP dw100 dewarper
driver") by Xavier Roumegue, dated 2022-07-30. This was first included
in v6.1-rc1. The buggy code has been present since the driver's
inception.

Record: Bug exists since original driver addition (cb6d000fcaa6e,
v6.1-rc1). Present in stable trees 6.1.y, 6.6.y, 6.12.y.

### Step 3.2: Fixes tag
No Fixes: tag present (expected for manual review).

### Step 3.3: File History
16 commits to `dw100.c` since driver addition, mostly minor cleanups
(platform remove callback, devm helpers, error handling). None touch the
IRQ handler code - git blame confirms all IRQ handler lines are from the
original commit.

Record: Standalone fix. No intermediate changes to the IRQ handler code.

### Step 3.4: Author
Stefan Klug is an active contributor at Ideas on Board, working on
camera/media drivers (multiple rkisp1 commits, mipi-csis work). Not the
subsystem maintainer but reviewed and signed-off by both the original
driver author (Xavier Roumegue) and the media subsystem maintainer
(Laurent Pinchart), and merged by Hans Verkuil.

Record: Competent contributor; fix reviewed by driver author and
subsystem maintainer.

### Step 3.5: Dependencies
This patch is standalone. It's part of a 4-patch series (v4l2 requests
support, dynamic vertex map, this fix, code cleanup), but patch 3/4
(this fix) is completely independent. The `dw100_job_finish` function
being moved to threaded context is unchanged - same signature, same
callers. Patches 1/2 add features (V4L2 request support) and patch 4 is
cleanup; none are prerequisites for this fix.

Record: Self-contained, no dependencies on other patches in the series.

---

## PHASE 4: MAILING LIST AND EXTERNAL RESEARCH

### Step 4.1: Patch Discussion
Found the v3 submission thread on lore. The patch went through 4+
iterations:
- **v1**: Made the interrupt handler fully threaded
- **v2**: Dropped IRQF_ONESHOT instead (simpler approach, but caused
  timeout errors)
- **v3**: Split interrupt into two halves (current approach)
- **v4**: Collected review tags, fixed include order (trivial changes)

Xavier Roumegue (original driver author) provided the Reviewed-by on v3,
confirming the approach is correct. Laurent Pinchart (major media
maintainer) also reviewed and approved.

Record: Well-iterated fix (v1-v4), each version addressing review
feedback. Final version approved by both driver author and subsystem
maintainer.

### Step 4.2: Reviewers
- Xavier Roumegue: Original dw100 driver author at NXP. Provided
  technical insight on the AXI master enable bit and timeout counter
  behavior.
- Laurent Pinchart: Prominent Linux media subsystem maintainer. Reviewed
  and carried the patch.
- Hans Verkuil: V4L2 subsystem maintainer. Applied the patch.

Record: The most relevant possible reviewers all approved.

### Steps 4.3-4.5
No syzbot report. Bug was discovered through real-world use on
PREEMPT_RT systems. No prior stable discussion found.

---

## PHASE 5: CODE SEMANTIC ANALYSIS

### Step 5.1-5.3: Key Functions
- **`dw100_irq_handler`**: Hard IRQ handler, called when DW100 hardware
  completes or errors
- **`dw100_irq_thread_fn`** (new): Threaded handler, calls
  `dw100_job_finish`
- **`dw100_job_finish`**: Called from threaded handler; calls
  `v4l2_m2m_buf_done` -> `vb2_buffer_done` (which takes the spinlock)
- **`vb2_buffer_done`**: Takes `spin_lock_irqsave(&q->done_lock, flags)`
  - the sleeping lock on PREEMPT_RT

### Step 5.4: Call Chain
`DW100 hardware interrupt` -> `dw100_irq_handler` (hard IRQ) ->
`IRQ_WAKE_THREAD` -> `dw100_irq_thread_fn` (threaded) ->
`dw100_job_finish` -> `v4l2_m2m_buf_done` -> `vb2_buffer_done` (spinlock
here).

The trigger path is: Any DW100 dewarper operation completes -> hardware
fires interrupt -> this handler runs.

Record: Triggered on every DW100 operation completion. Every user of the
DW100 hardware with PREEMPT_RT will hit this.

---

## PHASE 6: STABLE TREE ANALYSIS

### Step 6.1: Buggy Code in Stable Trees
The dw100 driver was added in v6.1-rc1 (`cb6d000fcaa6e`). The buggy IRQ
handler code has been unchanged since then. Affected stable trees:
**6.1.y, 6.6.y, 6.12.y** (all active stable/LTS trees that contain the
driver).

### Step 6.2: Backport Complications
The file has had only minor, non-conflicting changes since v6.1. The IRQ
handler code is identical across all stable trees (confirmed by git
blame showing all lines from original commit). The patch should apply
cleanly to all stable trees.

### Step 6.3: Related Fixes
No related fixes for this IRQ issue are already in stable.

---

## PHASE 7: SUBSYSTEM AND MAINTAINER CONTEXT

### Step 7.1: Subsystem
- **Path**: `drivers/media/platform/nxp/dw100/` - Media (V4L2) platform
  driver for NXP i.MX8MP
- **Criticality**: PERIPHERAL (specific hardware driver for NXP i.MX8MP
  SoC's DW100 dewarper)
- **Users**: Embedded systems using i.MX8MP with PREEMPT_RT (common in
  industrial/camera applications)

### Step 7.2: Activity
Moderately active - 16 commits since driver introduction over ~3 years.
Mostly maintenance.

---

## PHASE 8: IMPACT AND RISK ASSESSMENT

### Step 8.1: Affected Users
Users of NXP i.MX8MP SoC with DW100 dewarper hardware AND PREEMPT_RT
enabled kernels. This is a common combination in industrial camera
applications.

### Step 8.2: Trigger Conditions
- **Trigger**: Any DW100 dewarper operation on a PREEMPT_RT kernel
- **Frequency**: Every single operation - 100% reproducible
- **Privilege**: Requires access to the V4L2 device node

### Step 8.3: Failure Mode
**CRITICAL**: "BUG: scheduling while atomic" is a kernel oops. On
PREEMPT_RT systems using the DW100 dewarper, the hardware is completely
unusable - every operation triggers the BUG.

### Step 8.4: Risk-Benefit Ratio
- **Benefit**: HIGH - Makes DW100 hardware usable on PREEMPT_RT kernels.
  Without this fix, the hardware is completely broken on PREEMPT_RT.
- **Risk**: VERY LOW - ~16 lines added, well-understood pattern
  (hard/threaded IRQ split), reviewed by driver author and subsystem
  maintainer, no locking changes, no API changes. The hard handler still
  disables the interrupt before returning, preventing any re-entry
  issues.
- **Ratio**: Very favorable.

---

## PHASE 9: FINAL SYNTHESIS

### Step 9.1: Evidence Summary

**FOR backporting:**
- Fixes a kernel oops (BUG: scheduling while atomic) - crash severity
- 100% reproducible on every DW100 operation on PREEMPT_RT kernels
- Small, surgical fix (~16 lines added in one file)
- Well-understood pattern (hard/threaded IRQ split)
- Reviewed by original driver author (Xavier Roumegue) AND media
  subsystem maintainer (Laurent Pinchart)
- Applied by V4L2 maintainer (Hans Verkuil)
- Went through 4 iterations showing thorough review
- Self-contained, no dependencies
- Bug exists since driver introduction (v6.1), present in all active
  stable trees
- Clean backport expected (IRQ handler code unchanged since v6.1)

**AGAINST backporting:**
- Affects only specific hardware (NXP i.MX8MP DW100) with PREEMPT_RT
- No Fixes: tag (expected, that's why it needs manual review)

### Step 9.2: Stable Rules Checklist
1. **Obviously correct and tested?** YES - well-established IRQ
   splitting pattern, reviewed by driver author and maintainers, evolved
   through 4 revisions
2. **Fixes a real bug?** YES - kernel oops on every DW100 operation on
   PREEMPT_RT
3. **Important issue?** YES - kernel crash (BUG: scheduling while
   atomic)
4. **Small and contained?** YES - ~16 lines added/5 removed, single
   file, single driver
5. **No new features?** CORRECT - pure bug fix, no new functionality
6. **Can apply to stable?** YES - code is unchanged since v6.1

### Step 9.3: Exception Categories
Not needed - this is a standard bug fix.

### Step 9.4: Decision
Clear YES. This is a well-reviewed, small, surgical fix for a kernel
oops that makes the DW100 dewarper hardware completely unusable on
PREEMPT_RT kernels. The fix uses a standard kernel pattern, is self-
contained, and should apply cleanly to all affected stable trees.

---

## Verification

- [Phase 1] Parsed subject: "media: dw100: Fix kernel oops with
  PREEMPT_RT enabled" - explicit fix keyword
- [Phase 1] Parsed tags: Reviewed-by Xavier Roumegue (driver author) and
  Laurent Pinchart (media maintainer), SOBs from Laurent Pinchart and
  Hans Verkuil (media maintainers)
- [Phase 2] Diff analysis: +16/-5 lines in single file, adds
  `frame_failed` field, splits IRQ into hard+threaded, changes
  `devm_request_irq` to `devm_request_threaded_irq`
- [Phase 2] Verified `vb2_buffer_done()` at line 1202 of
  `videobuf2-core.c` takes `spin_lock_irqsave(&q->done_lock, flags)` -
  confirmed the sleeping lock issue on PREEMPT_RT
- [Phase 3] git blame: All IRQ handler lines from `cb6d000fcaa6e`
  (2022-07-30, v6.1-rc1) - bug present since driver inception
- [Phase 3] `git describe --tags --contains cb6d000fcaa6e` ->
  `v6.1-rc1~130^2~95` - driver first in v6.1
- [Phase 3] `git log v6.1 -- dw100.c` confirmed driver exists in v6.1
  stable tree
- [Phase 3] `git log v5.15..v6.1 -- dw100.c` confirmed driver was NOT in
  v5.15 (only 6.1+)
- [Phase 4] Web search found v3 series at lore with full review
  discussion
- [Phase 4] spinics.net confirmed v4 patch with collected Reviewed-by
  tags, identical diff
- [Phase 4] Xavier Roumegue's review on v3: explicit Reviewed-by with no
  concerns
- [Phase 4] Laurent Pinchart's review: approved
- [Phase 4] Confirmed 4 iterations (v1-v4) with evolving approach:
  threaded -> drop ONESHOT -> split halves -> collect tags
- [Phase 5] Traced call chain: `dw100_irq_handler` -> `dw100_job_finish`
  -> `v4l2_m2m_buf_done` -> `vb2_buffer_done` (confirmed spinlock)
- [Phase 5] Verified `v4l2_m2m_buf_done` is inline wrapper calling
  `vb2_buffer_done` in `include/media/v4l2-mem2mem.h` line 231
- [Phase 6] Buggy code exists unchanged in all stable trees since v6.1
  (6.1.y, 6.6.y, 6.12.y)
- [Phase 6] No conflicting changes to IRQ handler in any stable tree
- [Phase 8] Failure mode: kernel oops (BUG: scheduling while atomic) -
  CRITICAL severity on PREEMPT_RT
- UNVERIFIED: Could not fetch lore.kernel.org discussion directly due to
  bot protection (used spinics.net and yhbt.net mirrors instead, which
  provided full thread content)

**YES**

 drivers/media/platform/nxp/dw100/dw100.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/nxp/dw100/dw100.c b/drivers/media/platform/nxp/dw100/dw100.c
index bdebbe3f41985..bdf1fdf2e6cca 100644
--- a/drivers/media/platform/nxp/dw100/dw100.c
+++ b/drivers/media/platform/nxp/dw100/dw100.c
@@ -11,6 +11,7 @@
 #include <linux/debugfs.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/irqreturn.h>
 #include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -74,6 +75,7 @@ struct dw100_device {
 	struct clk_bulk_data		*clks;
 	int				num_clks;
 	struct dentry			*debugfs_root;
+	bool				frame_failed;
 };
 
 struct dw100_q_data {
@@ -1386,7 +1388,8 @@ static irqreturn_t dw100_irq_handler(int irq, void *dev_id)
 {
 	struct dw100_device *dw_dev = dev_id;
 	u32 pending_irqs, err_irqs, frame_done_irq;
-	bool with_error = true;
+
+	dw_dev->frame_failed = true;
 
 	pending_irqs = dw_hw_get_pending_irqs(dw_dev);
 	frame_done_irq = pending_irqs & DW100_INTERRUPT_STATUS_INT_FRAME_DONE;
@@ -1394,7 +1397,7 @@ static irqreturn_t dw100_irq_handler(int irq, void *dev_id)
 
 	if (frame_done_irq) {
 		dev_dbg(&dw_dev->pdev->dev, "Frame done interrupt\n");
-		with_error = false;
+		dw_dev->frame_failed = false;
 		err_irqs &= ~DW100_INTERRUPT_STATUS_INT_ERR_STATUS
 			(DW100_INTERRUPT_STATUS_INT_ERR_FRAME_DONE);
 	}
@@ -1407,7 +1410,14 @@ static irqreturn_t dw100_irq_handler(int irq, void *dev_id)
 	dw100_hw_clear_irq(dw_dev, pending_irqs |
 			   DW100_INTERRUPT_STATUS_INT_ERR_TIME_OUT);
 
-	dw100_job_finish(dw_dev, with_error);
+	return IRQ_WAKE_THREAD;
+}
+
+static irqreturn_t dw100_irq_thread_fn(int irq, void *dev_id)
+{
+	struct dw100_device *dw_dev = dev_id;
+
+	dw100_job_finish(dw_dev, dw_dev->frame_failed);
 
 	return IRQ_HANDLED;
 }
@@ -1555,8 +1565,9 @@ static int dw100_probe(struct platform_device *pdev)
 
 	pm_runtime_put_sync(&pdev->dev);
 
-	ret = devm_request_irq(&pdev->dev, irq, dw100_irq_handler, IRQF_ONESHOT,
-			       dev_name(&pdev->dev), dw_dev);
+	ret = devm_request_threaded_irq(&pdev->dev, irq, dw100_irq_handler,
+					dw100_irq_thread_fn, 0,
+					dev_name(&pdev->dev), dw_dev);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Failed to request irq: %d\n", ret);
 		goto err_pm;
-- 
2.53.0


