Return-Path: <linux-media+bounces-59136-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mP17L04q5mnesgEAu9opvQ
	(envelope-from <linux-media+bounces-59136-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 15:29:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CC842BD3C
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 15:29:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3ED5A307B346
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 13:26:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFA6C3A5E98;
	Mon, 20 Apr 2026 13:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sl1ch8Dw"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B233A5E9E;
	Mon, 20 Apr 2026 13:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776691043; cv=none; b=e6m2+Xn1Di8+zUQnVm7zOFcxgkOVh1esbQO1BD5QI/DDItN4LvrSRYJIMXC9fuvPljymsrqHz44jdmmMgBkpGfEQVjwMfH64yJdhyIZk1GgDx3aVDp13PjiL1RwBzG0X1VDX1InxG5+Lsz3AcfDTpP6l/sxN99gjk6FempIuxd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776691043; c=relaxed/simple;
	bh=zf5MX7fwJLHLMutJXWjpojQWdIRMsCUslj8f6lSo6IY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DyvV0gTa7AL6tgLiQHpRQWyBbUBPJXM7UiAoEAgjJ/gIGtq0C+c4bOjFD27eMOn14a6mv6Zd86CUebrUUGFSjz7K1QQNpFwVTlyRiPQl4E4WOCuPf7IgQYL/JSrLtt9e1s7S7RxbDZ6n+26v46iSgejQLpZF+7HDj7nPL0M65Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sl1ch8Dw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8820EC19425;
	Mon, 20 Apr 2026 13:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776691043;
	bh=zf5MX7fwJLHLMutJXWjpojQWdIRMsCUslj8f6lSo6IY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Sl1ch8Dw+tm8DvdBl8adMgGRbpZFt84wHL3U0jTgnUj7vXkI1jBSPxHvRMtYYvYiL
	 GeZGJc9byvS48sx8JS2k2RTm5C7B0d0QhjJ95+xtw8jU90CM6NLVOdp/v46HQAUFIM
	 cB5vIQgOge6scDehdWsIMAC5MbsM9J7zrgQC4DKF6gYZypjHDYMqx7xaiM0O3yIScc
	 apXtgcCjAcS2m74gRmtpSX5t8UTz3x+JGzJ8O1lo/K5EzRtumHrZZtzqbECLVltjRp
	 SECaJrvomo98+1BCY59XjpEvgarMyzZYFcXC6uLMncjsvvyNVVyGN6T5heBVYpLeUi
	 +vWkzZaImjwIw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Alain Volmat <alain.volmat@foss.st.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	hugues.fruchet@foss.st.com,
	mchehab@kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linux-media@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 7.0-5.10] media: stm32: dcmi: stop the dma transfer on overrun
Date: Mon, 20 Apr 2026 09:08:46 -0400
Message-ID: <20260420131539.986432-60-sashal@kernel.org>
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
	FREEMAIL_CC(0.00)[foss.st.com,linux.intel.com,kernel.org,gmail.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59136-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,huawei];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 56CC842BD3C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Alain Volmat <alain.volmat@foss.st.com>

[ Upstream commit 4847286b87ccda7bdec8245f35c07203ce9eb0ed ]

Ensure to stop the dma transfer whenever receiving a overrun
to avoid having a buffer partially filled with a frame and
partially with the next frame.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Now I have all the necessary information. Let me compile my
comprehensive analysis.

---

## PHASE 1: COMMIT MESSAGE FORENSICS

### Step 1.1: Subject Line
- **Subsystem**: `media: stm32: dcmi:`
- **Action verb**: "stop" - implies fixing incorrect behavior (not
  stopping something that should be stopped)
- **Summary**: Stops DMA transfer on hardware overrun to prevent frame
  data corruption

### Step 1.2: Tags
- `Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>` - Author,
  STMicroelectronics employee (the SoC vendor)
- `Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>` - media
  subsystem co-maintainer
- `Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>` -
  media subsystem maintainer
- No Fixes: tag, no Reported-by:, no Cc: stable (expected for autosel
  candidates)

### Step 1.3: Commit Body
The commit explicitly describes data corruption: *"avoid having a buffer
partially filled with a frame and partially with the next frame"*. This
is frame-level data corruption during video capture. The mechanism is:
when DCMI hardware overruns, DMA continues writing into the active
buffer, mixing two different frames.

### Step 1.4: Hidden Bug Fix Detection
Despite using "ensure to stop" rather than "fix", this IS a data
corruption fix. The word "ensure" indicates adding a missing safety
action. The description of mixed frames in a buffer is a concrete, real-
world data corruption scenario.

Record: This is a real data corruption fix disguised with neutral
language.

---

## PHASE 2: DIFF ANALYSIS

### Step 2.1: Inventory
- Single file modified: `drivers/media/platform/st/stm32/stm32-dcmi.c`
- Function modified: `dcmi_irq_thread()` (the threaded IRQ handler)
- ~12 lines added, 0 lines removed (net)
- Scope: single-function surgical fix

### Step 2.2: Code Flow Change
**BEFORE**: When `IT_OVR` (overrun) occurs, the handler just increments
counters and falls through. DMA continues to run, potentially filling
the buffer with data from the next frame.

**AFTER**: When `IT_OVR` occurs:
1. Disable DCMI capture (`reg_clear(dcmi->regs, DCMI_CR, CR_CAPTURE)`)
2. Increment counters (existing code)
3. Release spinlock
4. Terminate DMA (`dmaengine_terminate_sync`)
5. Restart capture cleanly (`dcmi_restart_capture`)
6. Return `IRQ_HANDLED` early

### Step 2.3: Bug Mechanism
**Category**: Data corruption / logic fix. The overrun condition means
the DCMI FIFO overflowed and data was lost. Without stopping DMA, the
buffer ends up with partial frame N data followed by frame N+1 data,
delivering a corrupt buffer to userspace.

### Step 2.4: Fix Quality
- **Obviously correct**: Yes - the terminate+restart pattern is already
  used in `dcmi_process_jpeg()` in the same file
- **Minimal/surgical**: Yes - only the overrun handler is modified
- **Regression risk**: Low - `dmaengine_terminate_sync()` is safe in
  threaded IRQ context; `dcmi_restart_capture()` has its own internal
  locking
- **Locking correctness**: Verified - spinlock released before
  `dmaengine_terminate_sync` (which may sleep); `dcmi_restart_capture`
  takes its own lock internally

---

## PHASE 3: GIT HISTORY INVESTIGATION

### Step 3.1: Blame
The overrun handler code was introduced by commit `1be0a2b702308f`
(2019, v5.2 cycle) which added overrun counting, and the irq thread
structure from `37404f91ef8b91` (2017, v4.14 cycle). The buggy behavior
(not stopping DMA on overrun) was intentionally introduced by commit
`a1029f552c3f` (2018, v4.17 cycle) titled *"rework overrun/error case"*
which REMOVED the DMA stop/restart on overrun. That 2018 commit's
rationale was: *"Dma will be restarted on current frame transfer
completion."* The new commit reverses this decision because the
assumption was wrong - DMA does not properly self-recover on overrun.

### Step 3.2: No Fixes tag present
The implicit Fixes target would be `a1029f552c3f` ("rework overrun/error
case", v4.17) which exists in ALL active stable trees.

### Step 3.3: File History
The `dcmi_irq_thread` function has been stable since 2019. Recent
changes to this file are minor cleanups (style, API renames) that don't
affect the overrun path.

### Step 3.4: Author Context
Alain Volmat is from STMicroelectronics (the SoC vendor). He is an
active contributor to the STM32 media subsystem, maintaining both DCMI
and DCMIPP drivers. The patch was reviewed and signed off by both media
subsystem co-maintainers.

### Step 3.5: Dependencies
The patch was submitted as 4/12 in a series. However, patches 1-3 touch
unrelated code paths (pm_ptr, dma config at probe, descriptor creation).
Patch 5 reworks locking (makes `dcmi_restart_capture` caller-locked),
but patch 4 works correctly with the CURRENT `dcmi_restart_capture`
which has its own internal locking. This patch is self-contained.

---

## PHASE 4: MAILING LIST RESEARCH

### Step 4.1: Original Submission
Found at `http://lists.infradead.org/pipermail/linux-arm-
kernel/2026-January/1091896.html`. Part of series v2 "media: stm32:
dcmi: stability & performance enhancements" (12 patches). Cover letter
explicitly states: *"This series improve stability of the capture by
fixing the handling of the overrun which was leading to captured frame
corruption."*

### Step 4.2: Reviewers
Signed off by Sakari Ailus (media co-maintainer) and Mauro Carvalho
Chehab (media maintainer). The patch has proper maintainer chain sign-
off.

### Step 4.3-4.5: Bug Report / Stable Discussion
The bug was found during development by the hardware vendor
(STMicroelectronics). No explicit stable nomination was found, nor any
objections.

---

## PHASE 5: CODE SEMANTIC ANALYSIS

### Step 5.1-5.2: Function Analysis
`dcmi_irq_thread` is the threaded IRQ handler, called whenever the DCMI
hardware fires an interrupt (overrun, error, or frame complete). The
`IT_OVR` flag is set by the hardware when the DCMI internal FIFO
overflows. The `dcmi_restart_capture` → `dcmi_start_capture` →
`dcmi_start_dma` chain properly sets up a new DMA transfer and re-
enables capture.

### Step 5.3-5.4: The DMA stop + restart pattern
The same pattern exists in `dcmi_process_jpeg()` at line 434-440:
`dmaengine_terminate_sync` followed by `dcmi_restart_capture`. The
overrun fix replicates this proven pattern.

### Step 5.5: Similar Patterns
`dcmi_process_jpeg` already uses the exact same terminate+restart
pattern. `dcmi_dma_callback` also calls `dcmi_restart_capture` after DMA
completion. This is a well-established pattern in the driver.

---

## PHASE 6: STABLE TREE ANALYSIS

### Step 6.1: Buggy Code in Stable
The buggy overrun handler (just counting, not stopping DMA) exists since
v4.17 (commit `a1029f552c3f`). It is present in ALL active stable trees
(5.4, 5.10, 5.15, 6.1, 6.6, 6.12).

### Step 6.2: Backport Complications
The patch modifies a single function with clean context. The file path
changed from `stm32/stm32-dcmi.c` to `st/stm32/stm32-dcmi.c` in 6.5+,
but the function code is identical in context. Minor adjustment may be
needed for older trees.

### Step 6.3: No related fixes already in stable for this overrun issue.

---

## PHASE 7: SUBSYSTEM CONTEXT

### Step 7.1: Subsystem Criticality
- **Subsystem**: drivers/media/platform (embedded camera driver)
- **Criticality**: PERIPHERAL (specific STM32 hardware) but important
  for embedded/IoT users
- STM32 SoCs are widely used in embedded systems, industrial cameras,
  IoT devices

---

## PHASE 8: IMPACT AND RISK ASSESSMENT

### Step 8.1: Affected Users
STM32 DCMI users - embedded systems with camera interfaces on STM32MP1
SoCs.

### Step 8.2: Trigger Conditions
Overrun occurs when the camera sends data faster than DMA can drain the
DCMI FIFO. This is common during high-resolution or high-framerate
capture, or under system load. Not timing-dependent - it's a hardware
FIFO overflow condition.

### Step 8.3: Failure Mode Severity
**Data corruption** - frames delivered to userspace contain mixed data
from two different frames. For embedded camera applications (industrial
vision, surveillance, medical), this is a **HIGH** severity issue since
corrupted frames can lead to incorrect decisions.

### Step 8.4: Risk-Benefit
- **Benefit**: HIGH - prevents data corruption in active video capture
  on STM32 platforms
- **Risk**: LOW - ~12 lines, single function, follows proven existing
  pattern in the same driver, correct locking, no API changes
- **Ratio**: Strongly favorable

---

## PHASE 9: FINAL SYNTHESIS

### Step 9.1: Evidence Summary

**FOR backporting:**
- Fixes real data corruption (mixed frames in buffer)
- Small, surgical fix (12 lines in one function)
- Follows proven existing pattern in same driver (`dcmi_process_jpeg`)
- Author is from the hardware vendor (STMicroelectronics)
- Signed off by both media subsystem maintainers
- Correct locking model (spinlock released before sleeping call)
- Buggy code exists in all active stable trees
- Self-contained - does not depend on other patches in the series

**AGAINST backporting:**
- Part of a 12-patch series (but verified standalone correctness)
- Later patches (5, 7) further modify this code (but patch 4 is correct
  without them)
- No explicit Cc: stable (expected for autosel candidates)

### Step 9.2: Stable Rules Checklist
1. Obviously correct and tested? **YES** - pattern matches existing code
   in same driver, vendor-tested
2. Fixes a real bug? **YES** - data corruption (mixed frames)
3. Important issue? **YES** - data corruption during video capture
4. Small and contained? **YES** - 12 lines, single function
5. No new features/APIs? **YES** - no new features
6. Can apply to stable? **YES** - code context is unchanged in stable
   trees

### Step 9.3: No exception categories apply; this is a straightforward
bug fix.

---

## Verification

- [Phase 1] Parsed tags: SOBs from author (STMicroelectronics), Sakari
  Ailus, Mauro Carvalho Chehab
- [Phase 2] Diff analysis: ~12 lines added to overrun path in
  `dcmi_irq_thread()`, adds DMA stop + restart
- [Phase 3] git blame: overrun handler code from commit `1be0a2b702308f`
  (2019, v5.2); bug-causing rework from `a1029f552c3f` (2018, v4.17)
- [Phase 3] git show `a1029f552c3f`: confirmed it intentionally removed
  DMA stop/restart on overrun - present in all stable trees
- [Phase 3] Verified `dcmi_restart_capture()` has internal locking -
  standalone patch is correct
- [Phase 4] Found original submission at lists.infradead.org; cover
  letter confirms frame corruption fix
- [Phase 4] Verified patch 5/12 changes `dcmi_restart_capture` locking,
  but patch 4 works with current code
- [Phase 4] Patch 7/12 changes `terminate_sync` to `terminate_async` -
  optimization, not required for correctness
- [Phase 5] Verified same pattern (`dmaengine_terminate_sync` +
  `dcmi_restart_capture`) exists in `dcmi_process_jpeg()` at lines
  434-440
- [Phase 5] Verified `dcmi_start_capture()` re-enables CR_CAPTURE at
  line 372, matching our clear at overrun
- [Phase 6] Confirmed code exists unchanged in all active stable trees
  (5.4+)
- [Phase 8] Failure mode: data corruption (mixed frames) - severity HIGH

The fix is small, surgical, follows proven patterns in the same driver,
and prevents real data corruption on STM32 embedded platforms.

**YES**

 drivers/media/platform/st/stm32/stm32-dcmi.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
index 13762861b7694..496e0781a957b 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
@@ -447,9 +447,21 @@ static irqreturn_t dcmi_irq_thread(int irq, void *arg)
 	spin_lock_irq(&dcmi->irqlock);
 
 	if (dcmi->misr & IT_OVR) {
+		/* Disable capture */
+		reg_clear(dcmi->regs, DCMI_CR, CR_CAPTURE);
+
 		dcmi->overrun_count++;
+
 		if (dcmi->overrun_count > OVERRUN_ERROR_THRESHOLD)
 			dcmi->errors_count++;
+
+		spin_unlock_irq(&dcmi->irqlock);
+		dmaengine_terminate_sync(dcmi->dma_chan);
+
+		if (dcmi_restart_capture(dcmi))
+			dev_err(dcmi->dev, "%s: Cannot restart capture\n", __func__);
+
+		return IRQ_HANDLED;
 	}
 	if (dcmi->misr & IT_ERR)
 		dcmi->errors_count++;
-- 
2.53.0


