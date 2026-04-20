Return-Path: <linux-media+bounces-59134-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8F3lJkQq5mnesgEAu9opvQ
	(envelope-from <linux-media+bounces-59134-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 15:29:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB7A42BD35
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 15:29:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 363DB30E20EF
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 13:19:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63EDB3ACA74;
	Mon, 20 Apr 2026 13:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VhHyvMcG"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD8A3AC0D0;
	Mon, 20 Apr 2026 13:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776690988; cv=none; b=DMhqURE9fIsi/4W2w8n7Q+Fr7gSyMgjajTVRtJuK4i7/FFObEt7t3qny4yoojKU370AOLP2vJPmmMtSELsXYPt/ZQM4DLjeDenx5VUNwxQyi6RcGmVJ3/NVfN0HNrifutKMWXkBriBpJNJf8wXdebRPeNMBOx4i+sCSl9ykU2MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776690988; c=relaxed/simple;
	bh=3oJxisr8ElyevvozMhLtDUhxMcjE2+xbpngtCRiv7EU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hzXZlpuHfJnBgV+rmY9n1xcppDooHg6NJU0Oe7GC+psnKadl5ju7K2jJDmGzjepyWCM9vHtLQvyd6D54dFpDu++ehIVbmsQwrl6Ow2KiwFATu9LTOh2Hsblkl3lb+oWOOG8zjBKZFfWcsUo8n4BSsBmgukbdD3HCsM1XR6Y+DZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VhHyvMcG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8C42C2BCB8;
	Mon, 20 Apr 2026 13:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776690987;
	bh=3oJxisr8ElyevvozMhLtDUhxMcjE2+xbpngtCRiv7EU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VhHyvMcGZeX+BKze+jjgmDoppXZURDf4g/B0ZGyiM9Jd7nSlHdApCG0xpnK5Mqj4w
	 5+TFKEHa1MG8/7H/6eMLg9CqclDvHoanZQa4+aR1oVtXF2WYVGUctfQ8OL61MJF+P+
	 OFSqa4nwfKZkYlba5zbLBKIoK80KAOJ8U1VVe6ZpHB+69Gka/M0UjGVksIUgKrMX4+
	 5r9DLCMsipLWnO4WiQ05yKy2ld5NqbPLX/D7EjSOkV2zZ5yyc0Bjlzb+GIISFt56j9
	 Iu025j2iN/N6TdksCjaKD9ny/mh0vLy4rNsPhvBVf46GY+KMUGujYoUSrBTZFwJ5am
	 M/aiHLtDW9eYA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
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
Subject: [PATCH AUTOSEL 7.0-5.10] media: renesas: vsp1: rpf: Fix crop left and top clamping
Date: Mon, 20 Apr 2026 09:08:14 -0400
Message-ID: <20260420131539.986432-28-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420131539.986432-1-sashal@kernel.org>
References: <20260420131539.986432-1-sashal@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-59134-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas,cisco];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: BAB7A42BD35
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

[ Upstream commit 55823379e61511d534b099949608677d703f709b ]

The RPF doesn't enforces the alignment constraint on the sink pad
format, which could have an odd size, possibly down to 1x1. In that
case, the upper bounds for the left and top coordinates clamping would
become negative, cast to a very large positive value. Incorrect crop
rectangle coordinates would then be incorrectly accepted.

A second issue can occur when the requested left and top coordinates are
negative. They are cast to a large unsigned value, clamped to the
maximum. While the calculation will produce valid values for the
hardware, this is not compliant with the V4L2 specification that
requires values to be adjusted to the closest valid value.

Fix both issues by switching to signed clamping, with an explicit
minimum to adjust negative values, and adjusting the clamp bounds to
avoid negative upper bounds.

Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> # HiHope RZ/G2M
Link: https://patch.msgid.link/20260318235907.831556-5-laurent.pinchart+renesas@ideasonboard.com
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Now let me compile the full analysis.

---

## PHASE 1: COMMIT MESSAGE FORENSICS

**Step 1.1: Subject Line**
- Subsystem: `media: renesas: vsp1: rpf`
- Action verb: "Fix"
- Summary: Fix crop left and top coordinate clamping in the RPF
  subdevice

**Step 1.2: Tags**
- Tested-by: Niklas Söderlund (Renesas contributor/tester)
- Reviewed-by: Jacopo Mondi (media subsystem reviewer)
- Tested-by: Lad Prabhakar (Renesas RZ/G2M platform tester)
- Link: `https://patch.msgid.link/20260318235907.831556-5-
  laurent.pinchart+renesas@ideasonboard.com`
- Signed-off-by: Laurent Pinchart (subsystem author/maintainer)
- Signed-off-by: Hans Verkuil (V4L2 subsystem co-maintainer)
- Notable: TWO independent Tested-by tags from different engineers on
  different platforms, plus a Reviewed-by. No Fixes: tag (expected for
  autosel candidates). No Reported-by or syzbot.

**Step 1.3: Commit Body**
Two distinct bugs described:
1. When the sink pad format has odd dimensions (e.g. 1x1),
   `format->width - 2` underflows when used as `unsigned int`, producing
   a huge value. The `min_t(unsigned int, ...)` then fails to bound the
   coordinate.
2. Negative `left`/`top` values (from userspace - `__s32` type) are cast
   to large unsigned values, clamped to the maximum rather than to the
   closest valid value (0). This violates the V4L2 specification.

**Step 1.4: Hidden Bug Fix Detection**
This is explicitly labeled "Fix" — no disguise needed.

---

## PHASE 2: DIFF ANALYSIS

**Step 2.1: Inventory**
- Single file changed: `drivers/media/platform/renesas/vsp1/vsp1_rwpf.c`
- Single function modified: `vsp1_rwpf_set_selection()`
- ~20 lines of net change (added local variables, updated clamping
  logic, added comments)
- Scope: single-file surgical fix

**Step 2.2: Code Flow Change**

Before:
```c
sel->r.left = min_t(unsigned int, sel->r.left, format->width - 2);
sel->r.top = min_t(unsigned int, sel->r.top, format->height - 2);
```

After:
```c
// min_width/min_height computed to avoid negative upper bounds
sel->r.left = clamp_t(int, sel->r.left, 0, format->width - min_width);
sel->r.top = clamp_t(int, sel->r.top, 0, format->height - min_height);
```

**Step 2.3: Bug Mechanism**
This is a **type/integer overflow bug** (category g: logic/correctness +
category f: type bugs):

- `struct v4l2_rect` has `__s32 left` and `__s32 top` (confirmed at
  `include/uapi/linux/videodev2.h:442-447`)
- `RWPF_MIN_WIDTH = 1` and `RWPF_MIN_HEIGHT = 1` — so format can legally
  be 1x1
- For YUV formats, the hardcoded `format->width - 2` becomes `-1` when
  `width=1`
- `min_t(unsigned int, ...)` casts this to `0xFFFFFFFF` (~4 billion),
  making the clamp a no-op
- Negative `sel->r.left` values (valid `__s32` input) also wrap to huge
  unsigned values

**Step 2.4: Fix Quality**
- Obviously correct: switches to signed clamping (`clamp_t(int, ...)`
  with explicit 0 lower bound)
- Prevents underflow by computing `min_width = min(ALIGN(min_width, 2),
  format->width)` which guarantees `format->width - min_width >= 0`
- Minimal/surgical: changes only the clamping logic in one function
- Very low regression risk: identical behavior for well-formed inputs;
  only corrects behavior for edge cases

---

## PHASE 3: GIT HISTORY INVESTIGATION

**Step 3.1: Blame**
- The buggy `min_t(unsigned int, ...)` lines were introduced by commit
  `e5ad37b64de975` ("[media] v4l: vsp1: Add cropping support", Laurent
  Pinchart, 2013-08-24) — this is from the v3.12 era
- The YUV alignment code (which creates the `format->width - 2` problem
  for odd formats) was added by `85a0638b7855df` (Damian Hobson-Garcia,
  2015-05-28)
- Bug has existed since 2013/2015 — present in ALL active stable trees

**Step 3.2: No Fixes: tag present** (expected for autosel)

**Step 3.3: File History**
Recent commits to this file are mostly from Laurent Pinchart adding
colorspace support features. The bug fix is standalone and does not
depend on any of those feature commits.

**Step 3.4: Author**
Laurent Pinchart is the original author and subsystem maintainer for the
VSP1 driver (wrote the file in 2013). He is the most qualified person to
fix this code.

**Step 3.5: Dependencies**
- `clamp_t` macro exists in all stable trees (confirmed: present in
  v5.15 at `include/linux/minmax.h:124`)
- `RWPF_MIN_WIDTH`/`RWPF_MIN_HEIGHT` exist in the same file in all
  versions
- The fix is standalone — no prerequisites needed

---

## PHASE 4: MAILING LIST / EXTERNAL RESEARCH

**Step 4.1-4.2:** Lore.kernel.org is protected by anti-bot (Anubis),
direct web fetches failed. b4 dig could not locate the exact commit by
message-id. However:
- The patch was reviewed and tested by two independent testers and an
  experienced reviewer
- Hans Verkuil (V4L2 co-maintainer) applied it
- Part of a series (patch 5 of N) but this specific patch is a self-
  contained bug fix

**Step 4.3-4.5:** Could not verify lore discussion directly due to anti-
bot protection.

---

## PHASE 5: CODE SEMANTIC ANALYSIS

**Step 5.1: Functions Modified**
Only `vsp1_rwpf_set_selection()` is modified.

**Step 5.2: Callers**
- Registered as `.set_selection` pad operation in `vsp1_rwpf_pad_ops`
- Called from userspace via `VIDIOC_SUBDEV_S_SELECTION` ioctl (standard
  V4L2 path)
- Called from `vsp1_drm.c:157` during DRM pipeline configuration
- Both are real-world, commonly exercised code paths on Renesas
  platforms

**Step 5.3-5.4: Call Chain**
Userspace → V4L2 ioctl → subdev dispatch → `vsp1_rwpf_set_selection()`
The buggy path is directly reachable from userspace with arbitrary crop
rectangle values.

**Step 5.5: Similar Patterns**
Other `set_selection` implementations in the same driver
(`uif_set_selection`, `histo_set_selection`, `brx_set_selection`) use
different clamping logic and are not affected by this same bug.

---

## PHASE 6: STABLE TREE ANALYSIS

**Step 6.1: Buggy Code in Stable Trees**
Verified the exact same buggy lines exist in:
- **v5.15**: `min_t(unsigned int, sel->r.left, format->width - 2)` at
  line 225 (path: `drivers/media/platform/vsp1/vsp1_rwpf.c`)
- **v6.1**: Same code at line 225 (path:
  `drivers/media/platform/renesas/vsp1/vsp1_rwpf.c`)
- **v6.6**: Same code at line 225
- **v6.12**: Same code at line 212

**Step 6.2: Backport Complications**
- v6.12: Clean apply expected (same API as HEAD)
- v6.6, v6.1, v5.15: Minor context differences (older API names like
  `vsp1_entity_get_pad_format` vs `v4l2_subdev_state_get_format`), but
  the actual changed lines are identical. Straightforward adaptation
  needed.

**Step 6.3:** No related fixes already in stable for this issue.

---

## PHASE 7: SUBSYSTEM AND MAINTAINER CONTEXT

**Step 7.1:**
- Subsystem: drivers/media (V4L2, Renesas VSP1)
- Criticality: PERIPHERAL but important — VSP1 is the video processing
  unit on Renesas R-Car and RZ platforms, used in automotive and
  industrial embedded systems

**Step 7.2:** The VSP1 driver is actively maintained by Laurent Pinchart
with ongoing feature and fix development.

---

## PHASE 8: IMPACT AND RISK ASSESSMENT

**Step 8.1: Who is Affected**
Users of Renesas R-Car / RZ platforms with VSP1 hardware who set crop
rectangles (via V4L2 or DRM APIs).

**Step 8.2: Trigger Conditions**
- Setting crop on an RPF subdevice when the sink pad format has odd or
  small dimensions (especially 1x1 YUV)
- Passing negative left/top values in the crop rectangle (legal __s32
  values per V4L2 API)
- Reachable from unprivileged userspace via V4L2 ioctls

**Step 8.3: Failure Mode**
- Incorrect crop coordinates silently accepted → hardware
  misconfiguration → potential DMA to/from wrong memory regions
- V4L2 specification non-compliance (negative values adjusted to maximum
  instead of 0)
- Severity: **MEDIUM-HIGH** (incorrect hardware operation, potential
  memory safety implications via DMA)

**Step 8.4: Risk-Benefit**
- **Benefit**: HIGH — fixes real integer underflow bug reachable from
  userspace, prevents hardware misconfiguration
- **Risk**: VERY LOW — ~20 lines in a single function, changing only the
  type and method of clamping, well-tested by two independent testers
- Ratio: strongly favorable

---

## PHASE 9: FINAL SYNTHESIS

**Step 9.1: Evidence Summary**

FOR backporting:
- Fixes a real signed/unsigned integer underflow bug in crop coordinate
  clamping
- The bug allows incorrect hardware configuration, reachable from
  userspace
- Fix is small (~20 lines), surgical (single function), obviously
  correct
- Written by the subsystem maintainer (Laurent Pinchart)
- Two independent Tested-by and one Reviewed-by
- Applied by the V4L2 co-maintainer (Hans Verkuil)
- Bug exists in ALL active stable trees (since 2013)
- Uses only standard kernel primitives (`clamp_t`, `min`) available in
  all stable trees
- Self-contained — no dependencies on other commits

AGAINST backporting:
- No reports of the bug triggering in the wild (no Reported-by)
- Requires minor adaptation for older stable trees (context differences)
- Niche hardware (Renesas VSP1) — fewer users than core kernel

**Step 9.2: Stable Rules Checklist**
1. Obviously correct and tested? **YES** — two testers, one reviewer,
   logic is straightforward
2. Fixes a real bug? **YES** — integer underflow in crop coordinate
   clamping
3. Important issue? **YES** — potential hardware misconfiguration, V4L2
   spec violation
4. Small and contained? **YES** — ~20 lines in one function, one file
5. No new features/APIs? **CORRECT** — no new features
6. Can apply to stable? **YES** — with minor context adaptation for
   older trees

**Step 9.3: Exception Categories**
Not applicable — this is a standard bug fix, not a quirk/device-ID/DT
addition.

---

## Verification

- [Phase 1] Parsed tags: Found Tested-by x2 (Niklas Söderlund, Lad
  Prabhakar), Reviewed-by (Jacopo Mondi), Signed-off-by (Laurent
  Pinchart + Hans Verkuil)
- [Phase 2] Diff analysis: ~20 lines changed in
  `vsp1_rwpf_set_selection()`, replaces `min_t(unsigned int, ...)` with
  `clamp_t(int, ...)` and adds min_width/min_height bounds
- [Phase 2] Verified `struct v4l2_rect` has `__s32 left, top` at
  `include/uapi/linux/videodev2.h:442-447`, confirming signed→unsigned
  cast bug
- [Phase 3] git blame: buggy `min_t` lines introduced by
  `e5ad37b64de975` (2013, v3.12-era); YUV alignment by `85a0638b7855df`
  (2015)
- [Phase 3] Author Laurent Pinchart is the original file author and
  subsystem maintainer (all blame entries)
- [Phase 3] File history: no prerequisite commits needed
- [Phase 5] Callers: `vsp1_rwpf_set_selection` registered as
  `.set_selection` in `vsp1_rwpf_pad_ops:283`, called from userspace
  V4L2 ioctls and from `vsp1_drm.c:157`
- [Phase 6] Verified identical buggy code in v5.15:225, v6.1:225,
  v6.6:225, v6.12:212
- [Phase 6] Verified `clamp_t` exists in v5.15 at
  `include/linux/minmax.h:124`
- [Phase 6] Minor context differences in v5.15/v6.1 (different API
  names: `vsp1_entity_get_pad_format` vs `v4l2_subdev_state_get_format`)
  but core buggy lines are identical
- UNVERIFIED: Could not access lore.kernel.org due to anti-bot
  protection; reviewer/mailing-list discussion details not verified
- UNVERIFIED: Whether this is part of a multi-patch series where other
  patches are also needed (the Link msgid suggests patch 5 of N, but the
  fix is self-contained based on diff analysis)

The fix is small, surgical, obviously correct, well-tested, authored by
the subsystem maintainer, fixes a real integer underflow bug present
since 2013, and meets all stable kernel criteria.

**YES**

 .../media/platform/renesas/vsp1/vsp1_rwpf.c   | 28 ++++++++++++++++---
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
index 9c8085d5d3060..7c7bfb946b779 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
@@ -216,6 +216,8 @@ static int vsp1_rwpf_set_selection(struct v4l2_subdev *subdev,
 				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_selection *sel)
 {
+	unsigned int min_width = RWPF_MIN_WIDTH;
+	unsigned int min_height = RWPF_MIN_HEIGHT;
 	struct vsp1_rwpf *rwpf = to_rwpf(subdev);
 	struct v4l2_subdev_state *state;
 	struct v4l2_mbus_framefmt *format;
@@ -244,18 +246,36 @@ static int vsp1_rwpf_set_selection(struct v4l2_subdev *subdev,
 	format = v4l2_subdev_state_get_format(state, RWPF_PAD_SINK);
 
 	/*
-	 * Restrict the crop rectangle coordinates to multiples of 2 to avoid
-	 * shifting the color plane.
+	 * For YUV formats, restrict the crop rectangle coordinates to multiples
+	 * of 2 to avoid shifting the color plane.
 	 */
 	if (format->code == MEDIA_BUS_FMT_AYUV8_1X32) {
 		sel->r.left = ALIGN(sel->r.left, 2);
 		sel->r.top = ALIGN(sel->r.top, 2);
 		sel->r.width = round_down(sel->r.width, 2);
 		sel->r.height = round_down(sel->r.height, 2);
+
+		/*
+		 * The RPF doesn't enforces the alignment constraint on the sink
+		 * pad format, which could have an odd size, possibly down to
+		 * 1x1. In that case, the minimum width and height would be
+		 * smaller than the sink pad format, leading to a negative upper
+		 * bound in the left and top clamping. Clamp the minimum width
+		 * and height to the format width and height to avoid this.
+		 *
+		 * In such a situation, odd values for the crop rectangle size
+		 * would be accepted when clamping the width and height below.
+		 * While that would create an invalid hardware configuration,
+		 * the video device enforces proper alignment of the pixel
+		 * format, and the mismatch will then result in link validation
+		 * failure. Incorrect operation of the hardware is not possible.
+		 */
+		min_width = min(ALIGN(min_width, 2), format->width);
+		min_height = min(ALIGN(min_height, 2), format->height);
 	}
 
-	sel->r.left = min_t(unsigned int, sel->r.left, format->width - 2);
-	sel->r.top = min_t(unsigned int, sel->r.top, format->height - 2);
+	sel->r.left = clamp_t(int, sel->r.left, 0, format->width - min_width);
+	sel->r.top = clamp_t(int, sel->r.top, 0, format->height - min_height);
 	sel->r.width = min_t(unsigned int, sel->r.width,
 			     format->width - sel->r.left);
 	sel->r.height = min_t(unsigned int, sel->r.height,
-- 
2.53.0


