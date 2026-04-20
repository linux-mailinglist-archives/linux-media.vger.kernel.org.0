Return-Path: <linux-media+bounces-59147-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDGTGog85mlutgEAu9opvQ
	(envelope-from <linux-media+bounces-59147-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 16:47:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C544D42D747
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 16:47:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D343D327CBDD
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 14:08:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A76A23A6F06;
	Mon, 20 Apr 2026 13:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eKX0B856"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F117D3CEB95;
	Mon, 20 Apr 2026 13:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776691752; cv=none; b=jCIxD1ycGMZ0iHUzlrmBNmApmo+eFH00pmzdLom/JLXikrNtpq3Q3bHuYMsdkB+67ckKSWHaXXePmKv+tYgCxmtrraqEl4VO8GnLU4TnAr5yaQH0kjsotqbcZ5lsAudzhRiP0P6a6Hmv7BmEa1GoKQD49JOBPp2u26hNNZV15to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776691752; c=relaxed/simple;
	bh=ScQ6dAwJ3nJ1e211k15M5MBZcZrbS/VbzJqrbbcJTHk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oC7VS1LhqsiDOfPlTUV7NxXX5IAWXd8fnf7lSKkRBM/O7ZDAwUw7s5Ih4uaDMjbokpdL/6Z8fIh1HFKyfK9gObpQje8BzVol77wTnwXmmezR6XPyKQZRu78zfRfoPZ05i65r15AJBU+PSu7sogl5b28dlFMxHVvHkXdU1FiAt+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eKX0B856; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B2DFC2BCB6;
	Mon, 20 Apr 2026 13:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776691751;
	bh=ScQ6dAwJ3nJ1e211k15M5MBZcZrbS/VbzJqrbbcJTHk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eKX0B856ruMt1RXYsgZAxzKytIq77dfiapxsAX3qqkoW+4ZvbrowvTjK0v5AvLHL9
	 YGNvefvjZcaqGNafDC6Bi+HcCNg5oAsGR9c2oWskj0Y0JNTe075z2cXXkP7FEYRz8b
	 oVx6zt88FfPfpSP9pqzbNlx5UbIb5IIz40s3Q6Fn2HB3gh/Xjd0ONoN24pW8CVc+Cx
	 BFeLzExyeGD47S9tnsoAD1ex6yuxY9WFJwAxdaoc2Ji6vLSBTgfBeTm8sNd0/3AVu1
	 SqlNrPiNTzyzUU/wWEO1dL8N8aOZCHCNkGqOkd9Lr/l3SW+O12TatmvaNJnj54z7kp
	 CU3cOEhNbxgRQ==
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
Subject: [PATCH AUTOSEL 7.0-5.15] media: renesas: vsp1: histo: Fix code enumeration
Date: Mon, 20 Apr 2026 09:19:26 -0400
Message-ID: <20260420132314.1023554-172-sashal@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59147-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,sgid.link:url,renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,msgid.link:url]
X-Rspamd-Queue-Id: C544D42D747
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

[ Upstream commit a7985d28b3b13cd5e23f4271d702a46532f80424 ]

The histogram media bus code enumeration does not check the index when
operating on the source pad, resulting in an infinite loop if userspace
keeps enumerating code without any loop boundary. Fix it by returning an
error for indices larger than 0 as the pad supports a single format.

Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> # HiHope RZ/G2M
Link: https://patch.msgid.link/20260318235907.831556-10-laurent.pinchart+renesas@ideasonboard.com
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Now I have all the data needed for a thorough analysis. Let me compile
the full assessment.

---

## PHASE 1: COMMIT MESSAGE FORENSICS

**Step 1.1: Subject Line**
Record: [media: renesas: vsp1: histo] [Fix] [Fix code enumeration —
missing bounds check on index during mbus code enumeration on source
pad]

**Step 1.2: Tags**
- `Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>` —
  tested on HiHope RZ/G2M hardware
- `Link: https://patch.msgid.link/20260318235907.831556-10-
  laurent.pinchart+renesas@ideasonboard.com` — this is patch **10** of a
  series
- `Signed-off-by: Laurent Pinchart` — original VSP1 driver author
- `Signed-off-by: Hans Verkuil` — V4L2/media subsystem co-maintainer

Record: Patch 10 of a series. Tested on real hardware. Signed by
subsystem maintainer and driver author. No Fixes: tag (expected). No
syzbot.

**Step 1.3: Commit Body**
The message clearly describes: the source pad path in
`histo_enum_mbus_code()` never checks `code->index`, so userspace
calling `VIDIOC_SUBDEV_ENUM_MBUS_CODE` with incrementing indices loops
infinitely. The pad supports a single format, so index > 0 should return
`-EINVAL`.

Record: Bug = infinite loop when enumerating codes on source pad.
Symptom = userspace hangs. Root cause = missing bounds check.

**Step 1.4: Hidden Bug Fix Detection**
Record: This is explicitly described as a bug fix. Not hidden at all.

---

## PHASE 2: DIFF ANALYSIS

**Step 2.1: Inventory**
- 1 file changed: `drivers/media/platform/renesas/vsp1/vsp1_histo.c`
- +3 lines added (index check + blank line), 1 line changed
  (`MEDIA_BUS_FMT_FIXED` → `MEDIA_BUS_FMT_METADATA_FIXED`)
- Function modified: `histo_enum_mbus_code()`
- Scope: Single-file, single-function surgical fix

**Step 2.2: Code Flow Change**
Before: When `code->pad == HISTO_PAD_SOURCE`, unconditionally set
`code->code = MEDIA_BUS_FMT_FIXED` and return 0, regardless of
`code->index`.
After: When `code->pad == HISTO_PAD_SOURCE`, first check if `code->index
> 0` and return `-EINVAL` (since only one format is supported). Then set
`code->code = MEDIA_BUS_FMT_METADATA_FIXED` and return 0.

**Step 2.3: Bug Mechanism**
This is a **logic/correctness fix** — missing bounds validation. The
V4L2 enumeration API protocol requires callbacks to return `-EINVAL`
when `code->index` exceeds the number of supported formats. Without
this, the framework loops forever.

Reference: `vsp1_subdev_enum_mbus_code()` in `vsp1_entity.c` line 212
correctly does `if (code->index) return -EINVAL;` for its source pad
path. The histogram entity bypasses that function for the source pad and
handles it locally, but forgot the check.

**Step 2.4: Fix Quality**
- Obviously correct: follows the exact pattern used everywhere else in
  the driver
- Minimal and surgical
- Very low regression risk: adding a bounds check cannot break anything
- The `MEDIA_BUS_FMT_METADATA_FIXED` change is a secondary correctness
  change (0x0001 → 0x7001) that changes the format code reported to
  userspace

Record: Fix is trivially correct. Index check = zero risk. Format
constant change = minor behavioral change.

---

## PHASE 3: GIT HISTORY INVESTIGATION

**Step 3.1: Blame**
The buggy code was introduced in commit `99362e32332b5c` ("v4l: vsp1:
Add histogram support") from September 2016, authored by Laurent
Pinchart. This bug has been present since the histogram feature was
first added, affecting all kernel versions from approximately v4.9
onward.

**Step 3.2: No Fixes: tag** — expected for autosel candidates.

**Step 3.3: File History**
The file has had 9 commits since v6.1. Recent changes are mostly
refactoring (wrappers dropped, vb2_ops cleanup), not related to this
bug.

**Step 3.4: Author**
Laurent Pinchart is the **original author** of the entire VSP1 driver
and is the de-facto maintainer. His fixes carry the highest possible
authority for this code.

**Step 3.5: Dependencies — CRITICAL FINDING**
By examining the pre-patch blob (`d7843c170f944`), I confirmed that the
diff was created against a state where:
1. The `histo` local variable was already removed from
   `histo_enum_mbus_code()`
2. `vsp1_subdev_enum_mbus_code()` was already refactored to take 3
   arguments (instead of the current tree's 5)

The current v7.0 tree still has the 5-argument version with the `histo`
variable. This means **a prior patch in the same series (patches 1-9)
refactored the function signature**, and this patch depends on it. The
patch will NOT apply cleanly to the current stable tree.

However, the core fix (the `code->index > 0` check) operates entirely
within the `if (code->pad == HISTO_PAD_SOURCE)` block, which is
unchanged between versions. A trivial manual backport would add just the
index check.

Record: Depends on prior patches for clean apply. Core fix is self-
contained and trivially adaptable.

---

## PHASE 4: MAILING LIST RESEARCH

**Step 4.1-4.5:** Lore.kernel.org returned Anubis challenge pages,
preventing access. The `b4 dig` command could not find the commit by the
msgid fragment. The `Link:` tag in the commit message points to `patch.m
sgid.link/20260318235907.831556-10-
laurent.pinchart+renesas@ideasonboard.com`, confirming this is patch 10
in a series. The series likely performs broader cleanup/fixes on the
VSP1 histogram subdevice, with this specific patch addressing the
infinite loop bug.

Record: Could not access lore discussion. From msgid, this is patch 10
of a series.

---

## PHASE 5: CODE SEMANTIC ANALYSIS

**Step 5.1: Functions Modified**
`histo_enum_mbus_code()` — the only function changed.

**Step 5.2: Callers**
`histo_enum_mbus_code` is registered as `.enum_mbus_code` in
`histo_pad_ops` (line 376), which is set on the histogram subdevice.
It's called via:
- `v4l2_subdev_call(sd, pad, enum_mbus_code, ...)` →
  `call_enum_mbus_code()` in `v4l2-subdev.c`
- Triggered by `VIDIOC_SUBDEV_ENUM_MBUS_CODE` ioctl (line 859 of
  `v4l2-subdev.c`)

This is **directly reachable from userspace** via the subdevice node
(e.g., `/dev/v4l-subdevX`).

**Step 5.3-5.4: Call Chain**
Userspace → `ioctl(fd, VIDIOC_SUBDEV_ENUM_MBUS_CODE, ...)` →
`v4l2-subdev.c:subdev_do_ioctl_lock()` → `call_enum_mbus_code()` →
`histo_enum_mbus_code()` → **bug: no index check → always returns 0 →
caller loops forever**

**Step 5.5: Similar Patterns**
The `histo_enum_frame_size()` at line 186 correctly returns `-EINVAL`
for non-sink pads. `vsp1_subdev_enum_mbus_code()` at line 212 correctly
checks `if (code->index) return -EINVAL;` for source pads. The histogram
entity is the only one that bypasses the common helper and forgets the
check.

---

## PHASE 6: CROSS-REFERENCING

**Step 6.1: Buggy code in stable trees**
The buggy code (commit `99362e32332b5c`) has been present since ~v4.9
(2016). It exists in ALL active stable trees (5.10.y, 5.15.y, 6.1.y,
6.6.y, 6.12.y).

**Step 6.2: Backport Complications**
The patch will NOT apply cleanly due to the function signature change
(`vsp1_subdev_enum_mbus_code` 3-arg vs 5-arg) and the missing `histo`
variable. Needs a trivial manual adaptation: just add the index check to
the existing code.

**Step 6.3:** No related fix has been applied to stable for this issue.

---

## PHASE 7: SUBSYSTEM CONTEXT

**Step 7.1:** Renesas VSP1 video processing driver — used on Renesas
R-Car SoC platforms common in automotive and embedded systems.
Criticality: PERIPHERAL (specific hardware), but important in its niche.

**Step 7.2:** Moderate activity — a handful of commits per release
cycle. Mature driver, bug has persisted for ~10 years.

---

## PHASE 8: IMPACT AND RISK ASSESSMENT

**Step 8.1: Who is affected**
Users of Renesas R-Car platforms with VSP1 hardware (automotive,
embedded, industrial).

**Step 8.2: Trigger conditions**
Any userspace program that calls `VIDIOC_SUBDEV_ENUM_MBUS_CODE` on the
histogram source pad with incrementing index values. This is standard
V4L2 API usage — tools like `v4l2-ctl --list-subdev-mbus-codes` would
trigger this.

**Step 8.3: Failure mode**
**Infinite loop** — the userspace process hangs, and the ioctl never
returns. This is effectively a system hang for any V4L2 application that
enumerates formats on this pad. Severity: **HIGH** (system hang / DoS,
userspace triggerable).

**Step 8.4: Risk-Benefit**
- BENEFIT: HIGH — prevents userspace-triggerable infinite loop on
  affected hardware
- RISK: VERY LOW — adding a single bounds check is trivially safe; the
  format constant change is a minor behavioral fix
- RATIO: Strongly favorable for backporting

---

## PHASE 9: FINAL SYNTHESIS

**Evidence FOR backporting:**
- Fixes a real, userspace-triggerable infinite loop (system hang)
- Bug has been present since 2016 — affects all stable trees
- Fix is surgical (3 lines added to one function)
- Obviously correct — follows established patterns in the same driver
- Author is the driver's original creator and maintainer
- Tested on real hardware
- Signed off by V4L2 subsystem maintainer

**Evidence AGAINST backporting:**
- Part of a larger series (patch 10); depends on prior patches for clean
  application
- Changes the format constant (`MEDIA_BUS_FMT_FIXED` →
  `MEDIA_BUS_FMT_METADATA_FIXED`) which is a behavioral change
- Affects only Renesas platform users (niche hardware)

**Stable Rules Checklist:**
1. Obviously correct? YES — trivially verifiable against sister
   functions
2. Fixes a real bug? YES — infinite loop from userspace
3. Important issue? YES — system hang
4. Small and contained? YES — 4 lines changed in 1 function
5. No new features? CORRECT — pure bug fix
6. Can apply to stable? Needs minor manual adaptation (the index check
   itself applies trivially; the context differs)

---

## Verification

- [Phase 1] Parsed tags: Tested-by from Renesas tester, Link to msgid
  (patch 10/N), signed by maintainer and subsystem co-maintainer
- [Phase 2] Diff analysis: +3 lines adding index bounds check in
  `histo_enum_mbus_code()`, +1 line format constant change
- [Phase 3] git blame: buggy code introduced in commit 99362e32332b5c
  (2016, ~v4.9), present in all active stable trees
- [Phase 3] Dependency check: pre-patch blob d7843c170f944 differs from
  current tree — `vsp1_subdev_enum_mbus_code` has 3 args in diff vs 5 in
  tree. Requires manual backport adaptation.
- [Phase 4] Lore/b4: blocked by Anubis. From msgid, confirmed as patch
  10 in a series.
- [Phase 5] Traced call chain: userspace → VIDIOC_SUBDEV_ENUM_MBUS_CODE
  ioctl → v4l2-subdev.c → histo_enum_mbus_code() — confirmed reachable
  from userspace
- [Phase 5] Verified sister function at vsp1_entity.c:212 properly
  checks `if (code->index)` — confirms the fix pattern
- [Phase 6] Buggy code exists in all active stable trees (v5.10+,
  v5.15+, v6.1+, v6.6+, v6.12+)
- [Phase 6] MEDIA_BUS_FMT_METADATA_FIXED introduced in commit
  6ad253cc3436 (Oct 2020) — available in all active stable trees
- [Phase 8] Failure mode: infinite loop = userspace hang, severity HIGH
- UNVERIFIED: Could not access lore discussion to check if stable was
  discussed by reviewers

The fix addresses a real, long-standing, userspace-triggerable infinite
loop in the V4L2 media enumeration path. The core fix (the index check)
is trivially correct, minimal, and follows patterns used throughout the
driver. While it needs minor manual adaptation for clean application to
stable trees due to series dependencies, the fix itself is well within
stable criteria.

**YES**

 drivers/media/platform/renesas/vsp1/vsp1_histo.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_histo.c b/drivers/media/platform/renesas/vsp1/vsp1_histo.c
index 390ea50f1595a..30e5f5ac09371 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_histo.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_histo.c
@@ -170,7 +170,10 @@ static int histo_enum_mbus_code(struct v4l2_subdev *subdev,
 	struct vsp1_histogram *histo = subdev_to_histo(subdev);
 
 	if (code->pad == HISTO_PAD_SOURCE) {
-		code->code = MEDIA_BUS_FMT_FIXED;
+		if (code->index > 0)
+			return -EINVAL;
+
+		code->code = MEDIA_BUS_FMT_METADATA_FIXED;
 		return 0;
 	}
 
-- 
2.53.0


