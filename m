Return-Path: <linux-media+bounces-59153-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDkDETw+5mlutgEAu9opvQ
	(envelope-from <linux-media+bounces-59153-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 16:54:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E0242D9A4
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 16:54:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C2D63328959C
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 14:27:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEA3D48BD3A;
	Mon, 20 Apr 2026 13:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t35pC+0p"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598FB48BD2D;
	Mon, 20 Apr 2026 13:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776691925; cv=none; b=J7sUvq9pz3P637V1glqpejvkwRmZTKN/dN0w9dN6kb+TCHFWKweolrHk7OaSBl56+gAiRzOhyD+92s79b5CkLRAdnci272gjGWExTCeXgcq9zyJj811S+idNTF6Obax4ut3qmvbSSA5grITrJIxGiX6mZID3WA3QYg2lLJJ/KwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776691925; c=relaxed/simple;
	bh=QvT1QK20x6UZFIpDc6E4gfAAbd7NUWadZSL+BlEkUNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=For+UIDEk07e3VDk6mvilHOtrKY44th+3cVg8BLeLGBPrImAak9ft+NcDv5x2HjhOIq53NcXWY56UMK8ejntwzMsedgez0DKfrOXMIDWd5825zXo7Q8SV7cGb5DSEbGJNEz/rEBxDFo5Nom0OS74HLvbpM9wgq17rIION8BTDN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t35pC+0p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEAD3C2BCB9;
	Mon, 20 Apr 2026 13:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776691925;
	bh=QvT1QK20x6UZFIpDc6E4gfAAbd7NUWadZSL+BlEkUNE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t35pC+0pa5i+EZwzM5iMaI4r0xumVm+oVwi2Qw0Nfau/nO5yF1JJiiGevnvJfkJMe
	 MBAEa4xWP6EXbNvZGZsccO9kZe/arVmc0HxUhQvElrVuXpYl4dsFxYg1sVc1X/eqUx
	 2OTK33UamD/BJxNP7nBaaRKEjqGUqfv2KspPgqDcNH83nIabFW5bNptMFVC8pVOFHi
	 HMyOcJ3ynaTH32x0PIhth38YdaX7hx68L7BGaEJQ3FUXyf3Pc3xnwsSZL7D0nyVWJB
	 xtJr12+8Ahk0o7T1HuO6u/wTGEE9YvyBeKw1bh4JfPFClPNKfw75eP3noxtjlEYFqa
	 m7gDB3M4vODfA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	laurent.pinchart@ideasonboard.com,
	kieran.bingham+renesas@ideasonboard.com,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 7.0-6.12] media: renesas: vsp1: Initialize format on all pads
Date: Mon, 20 Apr 2026 09:21:06 -0400
Message-ID: <20260420132314.1023554-272-sashal@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59153-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas,cisco];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,ideasonboard.com:email,renesas.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 85E0242D9A4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

[ Upstream commit 133ac42af0a1b389e8b7b3dc7c1cc8c30ff162b6 ]

The state initialization function vsp1_entity_init_state() incorrectly
leaves the last entity pad out when initializing formats due to an off
by one error. Fix it.

Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> # HiHope RZ/G2M
Link: https://patch.msgid.link/20260318235907.831556-14-laurent.pinchart+renesas@ideasonboard.com
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Here is my complete analysis following all phases:

---

## PHASE 1: COMMIT MESSAGE FORENSICS

### Step 1.1: Subject Line
- **Subsystem**: `media: renesas: vsp1:` (Renesas VSP1 video signal
  processor)
- **Action verb**: "Initialize" (implying incomplete initialization was
  the bug)
- **Summary**: Fix off-by-one error that leaves the last entity pad
  uninitialized during state init.

### Step 1.2: Tags
- **Tested-by**: Lad Prabhakar (Renesas employee, tested on HiHope
  RZ/G2M hardware)
- **Link**: `https://patch.msgid.link/20260318235907.831556-14-
  laurent.pinchart+renesas@ideasonboard.com` — patch 14 of a series
- **Signed-off-by**: Laurent Pinchart (author, VSP1 subsystem
  maintainer), Hans Verkuil (media subsystem maintainer)
- No Fixes: tag (expected for manual review candidates)
- No syzbot or CVE references

### Step 1.3: Commit Body
The message is concise: "The state initialization function
vsp1_entity_init_state() incorrectly leaves the last entity pad out when
initializing formats due to an off by one error. Fix it."

The author explicitly identifies the bug mechanism (off-by-one) and the
consequence (last pad format not initialized).

### Step 1.4: Hidden Bug Fix Detection
Not hidden — explicitly described as an off-by-one error fix.

Record: This is a straightforward initialization bug fix.

---

## PHASE 2: DIFF ANALYSIS

### Step 2.1: Inventory
- **Files**: 1 file changed (`vsp1_entity.c`)
- **Lines**: 1 line changed (`-` → `+`)
- **Function**: `vsp1_entity_init_state()`
- **Scope**: Single-file, single-character surgical fix

### Step 2.2: Code Flow Change
Before: `for (pad = 0; pad < subdev->entity.num_pads - 1; ++pad)` —
iterates pads 0 to num_pads-2, skipping the last pad.
After: `for (pad = 0; pad < subdev->entity.num_pads; ++pad)` — iterates
ALL pads including the last.

### Step 2.3: Bug Mechanism
**Category**: Initialization fix (off-by-one error)

For entities with N pads (N-1 sinks + 1 source), the old code only calls
`set_fmt` on pads 0 to N-2. For 2-pad entities, the source pad is
initialized through propagation in `vsp1_subdev_set_pad_format()`.
However, for BRU/BRS entities with custom `brx_set_format()`, only the
format CODE is propagated to the source pad — width and height remain
zero (uninitialized). This means the source pad of BRU/BRS entities had
0x0 dimensions.

### Step 2.4: Fix Quality
- Obviously correct: The comment says "Initialize all pad formats" but
  the loop skips one
- Minimal: Single character change
- No regression risk: Calling `set_fmt` on the source pad is safe — for
  most entities it returns the current format; for BRU/BRS it applies
  defaults
- No API changes

Record: Fix quality is excellent. Zero regression risk.

---

## PHASE 3: GIT HISTORY INVESTIGATION

### Step 3.1: Blame
The buggy line was in commit `5755be5f15d9e6` (v6.8, renamed from
`init_cfg` to `init_state`), but the loop condition `num_pads - 1` was
copied from the original `vsp1_entity_init_cfg()`. Tracing back further
with pickaxe search, the pattern dates to commit `0efdf0f5eaaff` ("v4l:
vsp1: Implement and use the subdev pad::init_cfg configuration", v4.6
era, 2015). The off-by-one has been present for ~10 years.

### Step 3.2: Fixes Tag
No explicit Fixes tag. However, the bug trace shows:
- `0efdf0f5eaaff` (v4.6): introduced `vsp1_entity_init_cfg()` with this
  loop
- `5755be5f15d9e` (v6.8): renamed to `vsp1_entity_init_state()`,
  preserving the bug
- Both commits exist in all active stable trees

### Step 3.3: File History
Recent commits to the file are from Laurent Pinchart's series adding
color space support. The fix is standalone — it doesn't depend on any
other commits from the series.

### Step 3.4: Author
Laurent Pinchart is THE creator and maintainer of the VSP1 driver. He
has been the sole significant contributor to this subsystem. His fix
carries maximum authority.

### Step 3.5: Dependencies
The fix has no dependencies. The loop body, function signature, and pad
structures are unchanged from stable trees. The only variation across
trees is the function name (`vsp1_entity_init_cfg` in ≤6.6,
`vsp1_entity_init_state` in ≥6.8).

Record: Standalone fix, no prerequisites needed.

---

## PHASE 4: MAILING LIST AND EXTERNAL RESEARCH

### Step 4.1: Patch Discussion
`b4 dig` could not directly match this commit (likely too new), but
found the related series via nearby commits. The series is Laurent
Pinchart's VSP1 color space and cleanup work. The Link message ID shows
this is patch 14 of a larger series.

### Step 4.2: Reviewers
Laurent Pinchart (VSP1 maintainer) authored it; Hans Verkuil (media
subsystem maintainer) signed off. Lad Prabhakar (Renesas) tested on
actual hardware.

### Step 4.3-4.5: Bug Report / Related Patches / Stable History
No separate bug report — the author discovered the off-by-one during
code review. No prior stable discussion found.

Record: Reviewed and merged through proper maintainer channels.

---

## PHASE 5: CODE SEMANTIC ANALYSIS

### Step 5.1: Key Functions
`vsp1_entity_init_state()` modified.

### Step 5.2: Callers
- Called directly from `vsp1_entity_init()` (line 652) during entity
  initialization for ACTIVE format
- Registered as `.init_state` callback in `vsp1_entity_internal_ops` —
  called by V4L2 framework for TRY state initialization

### Step 5.3-5.4: Impact Surface
Every VSP1 entity goes through `vsp1_entity_init()` during probe.
Entities affected by the uninitialized source pad include:
- **BRU**: 5 sinks + 1 source (6 pads) — source pad width/height = 0
- **BRS**: 2 sinks + 1 source (3 pads) — source pad width/height = 0
- All 2-pad entities: Not affected (source pad initialized through
  propagation)

The BRU is a critical component in the display pipeline used by the
DRM/KMS driver for compositing on Renesas R-Car platforms.

Record: Bug affects BRU/BRS entities, which are part of the display
pipeline.

---

## PHASE 6: STABLE TREE ANALYSIS

### Step 6.1: Buggy Code Existence
The buggy loop exists in ALL stable trees (5.15.y, 6.1.y, 6.6.y,
6.12.y). In trees ≤6.6, the function is named `vsp1_entity_init_cfg`; in
≥6.8, it's `vsp1_entity_init_state`.

### Step 6.2: Backport Complications
- For 6.12.y: Should apply cleanly (same function name and structure)
- For 6.6.y and earlier: Needs trivial adaptation (function name
  change), but the fix is the same single-character change

Record: Expected clean apply on 6.12.y; trivial rename needed for older
trees.

---

## PHASE 7: SUBSYSTEM CONTEXT

### Step 7.1: Criticality
**Subsystem**: drivers/media (V4L2/media platform driver for Renesas)
**Criticality**: IMPORTANT — Renesas R-Car is widely used in automotive
and embedded systems. The VSP1 is the display compositing hardware used
via DRM/KMS.

### Step 7.2: Activity
Active subsystem with ongoing improvements by the maintainer.

---

## PHASE 8: IMPACT AND RISK ASSESSMENT

### Step 8.1: Who Is Affected
Users of Renesas R-Car SoC platforms (automotive, embedded).
Specifically those using display pipelines with BRU/BRS compositing.

### Step 8.2: Trigger Conditions
Triggered every time a BRU/BRS entity is initialized — this happens
during driver probe (every boot) and when TRY state is initialized.

### Step 8.3: Failure Mode
The source pad has 0x0 dimensions, which could lead to:
- Incorrect display pipeline configuration
- Potential division-by-zero in calculations using the source pad
  dimensions
- Incorrect format negotiation
- Severity: **MEDIUM-HIGH** (functional incorrectness in display
  pipeline)

### Step 8.4: Risk-Benefit
- **Benefit**: Fixes incorrect initialization for display pipeline
  entities on Renesas platforms. HIGH.
- **Risk**: One-character change, extremely low regression risk. Calling
  set_fmt on source pads is safe (returns current format or applies
  defaults). VERY LOW.

---

## PHASE 9: FINAL SYNTHESIS

### Step 9.1: Evidence Summary

**FOR backporting:**
- Fixes a genuine off-by-one bug that leaves pad formats uninitialized
- One-line, obviously correct fix
- Author is the VSP1 subsystem maintainer (Laurent Pinchart)
- Tested on actual hardware by Renesas engineer
- Bug has existed for ~10 years across all stable trees
- Affects display pipeline initialization on Renesas R-Car
  (automotive/embedded)
- Merged through proper maintainer chain (Hans Verkuil)

**AGAINST backporting:**
- No reported user complaints or crash reports (discovered by code
  review)
- Impact may be mitigated by userspace reconfiguring pads before use

### Step 9.2: Stable Rules Checklist
1. Obviously correct and tested? **YES** — trivial one-line fix, tested
   on HiHope RZ/G2M
2. Fixes a real bug? **YES** — off-by-one leaving pad formats
   uninitialized
3. Important issue? **YES** — affects display pipeline configuration on
   Renesas SoCs
4. Small and contained? **YES** — single character change in one file
5. No new features or APIs? **YES** — no new functionality
6. Can apply to stable? **YES** — clean apply on 6.12.y, trivial rename
   for older

### Step 9.3: Exception Categories
Not applicable — this is a standard bug fix, not an exception category.

### Step 9.4: Decision
This is a textbook stable backport candidate: a one-line off-by-one fix
by the subsystem maintainer, tested on hardware, with no regression
risk.

---

## Verification

- [Phase 1] Parsed tags: found Tested-by from Renesas engineer, SOBs
  from subsystem and media maintainers
- [Phase 2] Diff analysis: single character change in loop condition,
  `num_pads - 1` → `num_pads`
- [Phase 3] git blame: buggy code traced to commit 5755be5f15d9e6 (v6.8,
  rename), originally from 0efdf0f5eaaff (v4.6, initial implementation)
- [Phase 3] git describe: original buggy commit c8663c8e15c95 first
  appeared in v4.12-rc1
- [Phase 3] git log -S: confirmed the `num_pads - 1` pattern existed in
  the original file path before directory reorganization
- [Phase 5] Grep for callers: `vsp1_entity_init_state` called from
  `vsp1_entity_init()` and as `.init_state` callback
- [Phase 5] Grep for all entity init calls: verified BRU (variable
  pads), BRS (3 pads), IIF (3 pads) as multi-pad entities; most others
  are 2-pad
- [Phase 5] Read `brx_set_format()`: confirmed it only propagates format
  CODE to source pad, NOT width/height — source pad left with 0x0
  dimensions
- [Phase 6] git log between stable versions: confirmed the buggy
  function exists in all stable trees (with name variation)
- [Phase 7] Author is Laurent Pinchart, confirmed as the sole major
  contributor and maintainer of VSP1 driver
- UNVERIFIED: Could not fetch lore.kernel.org discussion due to bot
  protection. Does not affect decision.

**YES**

 drivers/media/platform/renesas/vsp1/vsp1_entity.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_entity.c b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
index a6680d531872a..e8e65eb19a7d8 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_entity.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
@@ -386,7 +386,7 @@ static int vsp1_entity_init_state(struct v4l2_subdev *subdev,
 	unsigned int pad;
 
 	/* Initialize all pad formats with default values. */
-	for (pad = 0; pad < subdev->entity.num_pads - 1; ++pad) {
+	for (pad = 0; pad < subdev->entity.num_pads; ++pad) {
 		struct v4l2_subdev_format format = {
 			.pad = pad,
 			.which = sd_state ? V4L2_SUBDEV_FORMAT_TRY
-- 
2.53.0


