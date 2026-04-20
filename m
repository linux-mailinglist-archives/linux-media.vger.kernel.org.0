Return-Path: <linux-media+bounces-59154-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKmiDahF5mk+uAEAu9opvQ
	(envelope-from <linux-media+bounces-59154-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 17:26:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A20DF42E2AA
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 17:26:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 51EF3332E936
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 14:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB8E1495536;
	Mon, 20 Apr 2026 13:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pJWjJOLn"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E1A3AB267;
	Mon, 20 Apr 2026 13:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776691948; cv=none; b=NY53uXi7FmuAdWUGFeFRZuWl459MO3Ce+VfiHcYGTQxWKONMGUJ9pgvaIcQ8NzC7OCkTtBodI3IQr4w0lXdzemXRv7xnK4bSWSjS0pOEOi3ha4u4ygT75Ry4IJh77APvye2OO9hJkKEUYa5RP+p+kZnqOtS1FLTnCYBaHdzEelQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776691948; c=relaxed/simple;
	bh=WGDO/x2qdSRGX74Iuaaqm3ElnV5H04bi2briiBh3Teo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TqKJi/hIozS/EWYaRgglpYMVqU68geNxSRqL0QwP/eVIIMs7Q+JP8m8d7WmDoD/BdY1izGfgQxraYuryFjzuA1frbmHnqoHEll/P5dkDdURVes5z5oJXWzVmmO592KPhvwWktYHojrJ2PEQXCDzvasi+AqP4JzXnRLv2tKt5fNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pJWjJOLn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8D58C19425;
	Mon, 20 Apr 2026 13:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776691947;
	bh=WGDO/x2qdSRGX74Iuaaqm3ElnV5H04bi2briiBh3Teo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pJWjJOLn7a7GkW8BJGYcaN22ekjsV19EzFe+BbtgbG2NtJhGp7Np2o6xNzY0Fbmab
	 Kal4s35nB7z5JD1iPfH8TRcv+h3VUCla9jzDLVlIsNer0qJ0UITI+5KAEBBvr+dhKN
	 YDl6l4ucDBC5KhJaXglKCi4+8Pmq6vPpOz+5NQydFTOxfEJeMV5xVQjvT+k1Rwybm+
	 nfOHoYVzW0bMx8GVhGxhOP8yK4/JXA66/LCbgLNtwBsCFvex2ceqrSl+FzNHo9ZjDb
	 K0COsqpapSqPVqU1txVN/24McF8jXQtQh24HnekL8Zs8D0qqgYCMs6MmDCTaYpHdgO
	 x7WUqACzH0eOQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	laurent.pinchart@ideasonboard.com,
	kieran.bingham+renesas@ideasonboard.com,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 7.0-6.12] media: renesas: vsp1: brx: Fix format propagation
Date: Mon, 20 Apr 2026 09:21:19 -0400
Message-ID: <20260420132314.1023554-285-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420132314.1023554-1-sashal@kernel.org>
References: <20260420132314.1023554-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 7.0
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
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-59154-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas,cisco];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: A20DF42E2AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

[ Upstream commit 937f3e6b51f1cea079be9ba642665f2bf8bcc31f ]

The format width and height is never propagated to the BRX source pad,
leaving its initial configuration invalid. Propagate the whole format
from the first sink pad to the source pad instead of only propagating
the media bus code. This fixes compliance with the subdev format
propagation rules.

Reviewed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> # HiHope RZ/G2M
Link: https://patch.msgid.link/20260318235907.831556-8-laurent.pinchart+renesas@ideasonboard.com
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Now I have all the information needed for a complete analysis. Let me
compile the findings.

---

## PHASE 1: COMMIT MESSAGE FORENSICS

**Step 1.1: Subject line**
- Subsystem: `media: renesas: vsp1: brx`
- Action verb: "Fix"
- Summary: Fix format propagation from sink pad 0 to source pad

**Step 1.2: Tags**
- Reviewed-by: Jacopo Mondi (x2, different email addresses)
- Tested-by: Niklas Soderlund (Renesas contributor)
- Tested-by: Lad Prabhakar (on HiHope RZ/G2M)
- Link: to patch.msgid.link
- Signed-off-by: Laurent Pinchart (author, VSP1 maintainer)
- Signed-off-by: Hans Verkuil (media subsystem co-maintainer)
- No Fixes: tag (expected for commits under review)
- No Cc: stable (expected)

**Step 1.3: Commit body**
- Bug: width and height are never propagated to the BRX source pad,
  leaving initial configuration invalid
- Fix: propagate the whole format from sink pad 0 to the source pad
  instead of only the media bus code
- Fixes compliance with V4L2 subdev format propagation rules

**Step 1.4: Hidden bug fix?**
This is an explicit bug fix, clearly labeled as "Fix format
propagation."

## PHASE 2: DIFF ANALYSIS

**Step 2.1: Inventory**
- Single file modified: `drivers/media/platform/renesas/vsp1/vsp1_brx.c`
- +8 lines, -2 lines (net +6)
- Single function modified: `brx_set_format()`

**Step 2.2: Code flow change**
- BEFORE: Loop `for (i = 0; i <= brx->entity.source_pad; ++i)` iterates
  all pads (sinks + source), sets ONLY `format->code` on each
- AFTER: Loop `for (i = 0; i < brx->entity.source_pad; ++i)` iterates
  only sink pads, sets `format->code`. Then, for the source pad
  separately, copies the ENTIRE format struct (`*format = fmt->format`)

**Step 2.3: Bug mechanism**
Category: Logic/correctness fix. The source pad's width and height
fields were never set. The `vsp1_entity_init_state()` function (line
389) only calls `set_fmt` on pads 0..`num_pads-2` (sink pads). The
format propagation from sink pad 0 was supposed to set the source pad's
format, but only propagated the media bus code, leaving width=0,
height=0.

This has real consequences:
1. `brx_configure_stream()` (line 292-316) reads source pad format and
   writes width/height to hardware register `VI6_BRU_VIRRPF_SIZE` - with
   values of 0, hardware is misconfigured
2. `brx_set_selection()` (line 244-246) uses source pad format to
   constrain compose rectangles - wrong values give wrong constraints
3. v4l2-compliance fails with `fmt.width == 0`

**Step 2.4: Fix quality**
- Obviously correct: the pattern `*format = fmt->format` is already used
  in the same function at line 154
- Minimal/surgical: only changes the format propagation logic
- No regression risk: sink pad propagation is unchanged; source pad now
  gets the full format instead of just the code

## PHASE 3: GIT HISTORY INVESTIGATION

**Step 3.1: Blame**
The buggy code originates from commit `629bb6d4b38fe6` ("v4l: vsp1: Add
BRU support", 2013-07-10). The format-code-only propagation has been
there since the very beginning of BRU support (v3.12).

**Step 3.2: Fixes tag**
No Fixes: tag present (expected for candidates under review).

**Step 3.3: File history**
Recent changes to `vsp1_brx.c` are mostly refactoring (pad state APIs,
wrappers removal). No related format propagation fixes exist.

**Step 3.4: Author**
Laurent Pinchart is the original author of the entire VSP1 driver (since
2013) and the subsystem maintainer. This carries significant weight.

**Step 3.5: Dependencies**
This is patch 7/13 in a series titled "Fix v4l2-compliance failures."
Patches 1-2 modify `vsp1_brx.c` but only in the `brx_create()` and
`brx_enum_mbus_code()` areas - NOT in `brx_set_format()`. The code in
the target area of patch 7 is identical with or without patches 1-6. The
patch would apply with a minor line offset on the current stable tree.

## PHASE 4: MAILING LIST RESEARCH

**Step 4.1: Original discussion**
Found in the mbox file. Series: "[PATCH v4 00/13] media: renesas: vsp1:
Fix v4l2-compliance failures". This is version 4, indicating careful
review iteration. The cover letter shows concrete v4l2-compliance output
demonstrating the failures (`fmt.width == 0 || fmt.width > 65536`). The
series was also tested with the vsp-tests suite (no regression).

**Step 4.2: Reviewers**
Jacopo Mondi (media/Renesas reviewer), Niklas Soderlund (Renesas
contributor), Lad Prabhakar (tested on real hardware). Hans Verkuil
(media subsystem co-maintainer) applied the series.

**Step 4.3: Bug report**
The bug is demonstrated by v4l2-compliance test output in the cover
letter.

**Step 4.4: Related patches**
Patch 13/13 ("Initialize format on all pads") may provide an additional
layer of fix, but patch 7 is self-contained - it fixes the propagation
path that is the root cause.

**Step 4.5: Stable discussion**
Lore was not accessible due to anti-scraping protection. No stable-
specific discussion found in available data.

## PHASE 5: CODE SEMANTIC ANALYSIS

**Step 5.1: Key functions**
- `brx_set_format()` - the function modified by the patch

**Step 5.2: Callers**
`brx_set_format` is the `.set_fmt` callback in `brx_pad_ops`, called
from:
- `vsp1_entity_init_state()` for initial pad format setup
- V4L2 subdev ioctl `VIDIOC_SUBDEV_S_FMT` from userspace
- Any internal pipeline configuration

**Step 5.3: Callees**
The source pad format (with wrong width/height) is consumed by:
- `brx_configure_stream()` -> writes to hardware registers (lines
  314-316)
- `brx_set_selection()` -> constrains compose rectangle (lines 245-246)

**Step 5.4: Call chain**
Userspace -> VIDIOC_SUBDEV_S_FMT -> brx_set_format (buggy propagation)
-> brx_configure_stream reads source pad format -> writes to hardware.
The buggy path is reachable from userspace.

**Step 5.5: Similar patterns**
No similar bugs found in adjacent code.

## PHASE 6: STABLE TREE ANALYSIS

**Step 6.1: Buggy code in stable**
The buggy code (`629bb6d4b38fe6`) was introduced in v3.12 (2013). It
exists in ALL stable trees that have VSP1 support.

**Step 6.2: Backport complications**
The patch would apply with a minor line offset (~6-10 lines) because
patches 1-6 in the series shift line numbers in the same file. The
actual code content is identical. Expected difficulty: clean apply with
fuzz or trivial manual adjustment.

**Step 6.3: Related fixes in stable**
No related fixes found in stable trees.

## PHASE 7: SUBSYSTEM AND MAINTAINER CONTEXT

**Step 7.1: Subsystem**
- Path: `drivers/media/platform/renesas/vsp1/`
- Criticality: PERIPHERAL (Renesas R-Car SoC video processing, used for
  display compositing and video processing on ARM/embedded platforms)
- Users: Renesas R-Car automotive/industrial platforms, development
  boards (RZ/G2M, etc.)

**Step 7.2: Activity**
The VSP1 subsystem is actively maintained by Laurent Pinchart, with
regular fixes and improvements.

## PHASE 8: IMPACT AND RISK ASSESSMENT

**Step 8.1: Affected users**
Driver-specific: affects users of Renesas R-Car SoCs using the VSP1
video processing pipeline (automotive, embedded).

**Step 8.2: Trigger conditions**
The bug triggers whenever:
- The BRX entity's format is configured through format propagation from
  sink pad 0 (normal operation)
- Any application relying on V4L2 subdev format propagation rules
- v4l2-compliance testing

**Step 8.3: Failure mode severity**
- Hardware misconfiguration (wrong background size register) ->
  incorrect video output: MEDIUM-HIGH
- v4l2-compliance failure (width=0): MEDIUM
- Wrong compose rectangle constraints: MEDIUM

**Step 8.4: Risk-benefit ratio**
- BENEFIT: Fixes real hardware misconfiguration and API compliance for
  Renesas R-Car users
- RISK: Very low. 6-line change in one function, obviously correct,
  well-tested
- Ratio: FAVORABLE

## PHASE 9: FINAL SYNTHESIS

**Step 9.1: Evidence**

FOR backporting:
- Fixes a real bug: source pad width/height never propagated, causing
  hardware misconfiguration
- Small and surgical: +8/-2 lines in a single function
- Author is subsystem maintainer (since 2013)
- Two reviewers, two testers on real hardware
- v4 of the series (well-iterated)
- Bug present since driver creation (v3.12, 2013)
- v4l2-compliance concrete failure evidence in cover letter
- No regression in vsp-tests suite

AGAINST backporting:
- Part of a 13-patch series, but this specific patch is self-contained
- Primarily a compliance/correctness fix rather than a crash fix
- May need minor line offset adjustment for clean application

**Step 9.2: Stable rules checklist**
1. Obviously correct and tested? YES - pattern already used in same
   function, 2 reviewers, 2 testers
2. Fixes a real bug? YES - source pad gets invalid width/height (0),
   hardware misconfiguration
3. Important issue? MEDIUM - incorrect hardware register values, invalid
   format state
4. Small and contained? YES - 6 net lines, single function, single file
5. No new features or APIs? YES - only fixes existing behavior
6. Can apply to stable trees? YES - with minor fuzz/offset

**Step 9.3: Exception categories**
Not an exception category - standard bug fix.

**Step 9.4: Decision**
The fix is small, correct, well-reviewed, well-tested, and fixes a real
format propagation bug that causes hardware misconfiguration (wrong
register values) and invalid API state. The bug has existed since 2013.
While not a crash-level severity, it causes incorrect hardware behavior
that could result in wrong video output on Renesas R-Car platforms.

## Verification

- [Phase 1] Parsed subject: "media: renesas: vsp1: brx: Fix format
  propagation" - explicit "Fix" verb
- [Phase 1] Parsed tags: 2x Reviewed-by (Jacopo Mondi), 2x Tested-by
  (Niklas Soderlund, Lad Prabhakar), SOBs from Laurent Pinchart and Hans
  Verkuil
- [Phase 2] Diff analysis: +8/-2 lines in `brx_set_format()`, changes
  loop from `<=` to `<` and adds full format copy to source pad
- [Phase 2] Verified source pad format consumption:
  `brx_configure_stream()` at line 292 reads source pad format, writes
  width/height to VI6_BRU_VIRRPF_SIZE at lines 314-316
- [Phase 2] Verified `brx_set_selection()` at line 244 reads source pad
  format for compose clamping
- [Phase 3] git blame: buggy code from commit 629bb6d4b38fe6
  (2013-07-10, v3.12)
- [Phase 3] git log author: Laurent Pinchart authored the entire VSP1
  driver
- [Phase 3] Verified patches 1-6 modify vsp1_brx.c only in
  `brx_create()` and `brx_enum_mbus_code()`, not in `brx_set_format()`
- [Phase 4] Found cover letter in mbox: series v4, tested with
  v4l2-compliance and vsp-tests, no regression
- [Phase 4] Cover letter shows concrete failure: `fmt.width == 0 ||
  fmt.width > 65536`
- [Phase 5] Traced `vsp1_entity_init_state()` at line 383-399: only
  iterates pads 0..num_pads-2, confirming source pad is never directly
  initialized
- [Phase 5] Confirmed `brx_try_format()` clamps width to [1, 8190] for
  sink pads, but this is never propagated to source
- [Phase 6] Buggy code present in all stable trees with VSP1 support
  (since v3.12)
- [Phase 6] Patch applies with minor line offset due to earlier patches
  in series
- UNVERIFIED: Could not access lore.kernel.org for additional discussion
  (anti-scraping protection)

**YES**

 drivers/media/platform/renesas/vsp1/vsp1_brx.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_brx.c b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
index 5fc2e5a3bb30f..fecd71abb2e95 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_brx.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
@@ -164,14 +164,20 @@ static int brx_set_format(struct v4l2_subdev *subdev,
 		compose->height = format->height;
 	}
 
-	/* Propagate the format code to all pads. */
+	/*
+	 * Propagate the format code to all pads, and the whole format to the
+	 * source pad.
+	 */
 	if (fmt->pad == BRX_PAD_SINK(0)) {
 		unsigned int i;
 
-		for (i = 0; i <= brx->entity.source_pad; ++i) {
+		for (i = 0; i < brx->entity.source_pad; ++i) {
 			format = v4l2_subdev_state_get_format(state, i);
 			format->code = fmt->format.code;
 		}
+
+		format = v4l2_subdev_state_get_format(state, i);
+		*format = fmt->format;
 	}
 
 done:
-- 
2.53.0


