Return-Path: <linux-media+bounces-57613-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIB6JDNwymkB9AUAu9opvQ
	(envelope-from <linux-media+bounces-57613-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 14:44:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BAC35B388
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 14:44:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CCAB5306FE57
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 12:39:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 428233D301D;
	Mon, 30 Mar 2026 12:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U1C1whvW"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679533D2FFB;
	Mon, 30 Mar 2026 12:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774874347; cv=none; b=eb8G8aQd79JLBHwEbx1+tBLIXIEm1ypbboF5MzzjikIK0AQ9ODAi4wsiX+AdRw7GWuC7XMe1jfKWU1xATNm2sS4V8eMX4z53xDqH46Mil0m0b526FWTR13yDdAmPsqy4Q1LKmJ5MSyZR6OoMZqt2sFd5JsMIenhcRXLgZ2OHbk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774874347; c=relaxed/simple;
	bh=tYLoT/g8g+dfmbwXtdG4UEMxcZCoHibY3HsepB2r7ao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HcK8CcVP95Dw5WZX2SVOZRs93mUa6MEI13k9mqh4/kYPNFacJ3kqvAV2/fiZ3mA+XY7LCgMCJ2yN4wa83PnIdqKEGeX85osOLuDcauZqbst92HqySuK9XxwM3I9SIIJo54UDiZFD/Sy/1V3SlIPrNseJUxVEU0bk5EYWbyvZbSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U1C1whvW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A58E9C2BCB3;
	Mon, 30 Mar 2026 12:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774874346;
	bh=tYLoT/g8g+dfmbwXtdG4UEMxcZCoHibY3HsepB2r7ao=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U1C1whvWscUqwdUkp8dn8nX5SSgHCB3WnUbS365myRExoALjniyy61zIL44hP87J4
	 WaHvp7hfWBy06Mn8m6J6Udv2th+6bLVPJ+VQYwaslNIfKtbNLqOVFpueCzB/dgAs79
	 d88EHwljLTefh9ilCdJnKvXldllaim+8BEAr06UzKwQeye1Uj6m/AFbNrN4gW1t775
	 FAPB0u1QwrvZsIBVQPTooMsmNYgavu4k5d+G44oNo2ucGfPG9O4lg5W8q3pfm7/gJ8
	 UmD4BOeSyb36gbN+iA4MX91ctywJGA9RltPLMP8O9BRZmaStDz6P6Mjpl3lRTnVnhS
	 OTrBMbSdwnhrQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	detlev.casanova@collabora.com,
	ezequiel@vanguardiasur.com.ar,
	mchehab@kernel.org,
	heiko@sntech.de,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.19-6.1] media: rkvdec: reduce stack usage in rkvdec_init_v4l2_vp9_count_tbl()
Date: Mon, 30 Mar 2026 08:38:29 -0400
Message-ID: <20260330123842.756154-16-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260330123842.756154-1-sashal@kernel.org>
References: <20260330123842.756154-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.19.10
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-57613-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,huawei];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,arndb.de:email,collabora.com:email]
X-Rspamd-Queue-Id: 03BAC35B388
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Arnd Bergmann <arnd@arndb.de>

[ Upstream commit c03b7dec3c4ddc97872fa12bfca75bae9cb46510 ]

The deeply nested loop in rkvdec_init_v4l2_vp9_count_tbl() needs a lot
of registers, so when the clang register allocator runs out, it ends up
spilling countless temporaries to the stack:

drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c:966:12: error: stack frame size (1472) exceeds limit (1280) in 'rkvdec_vp9_start' [-Werror,-Wframe-larger-than]

Marking this function as noinline_for_stack keeps it out of
rkvdec_vp9_start(), giving the compiler more room for optimization.

The resulting code is good enough that both the total stack usage
and the loop get enough better to stay under the warning limit,
though it's still slow, and would need a larger rework if this
function ends up being called in a fast path.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

No existing stack fix in stable 6.6.y for this file. All the
investigation is complete. Let me now compile the full analysis.

---

## PHASE 1: COMMIT MESSAGE FORENSICS

**Step 1.1: Subject Line**
Record: [media: rkvdec:] [reduce] [reduce stack usage in
rkvdec_init_v4l2_vp9_count_tbl() to fix Clang build failure with
-Wframe-larger-than]

**Step 1.2: Tags**
Record:
- Signed-off-by: Arnd Bergmann (author, well-known kernel build-fix
  expert)
- Reviewed-by: Nicolas Dufresne (Collabora, rkvdec contributor)
- Signed-off-by: Nicolas Dufresne (subsystem co-maintainer)
- Signed-off-by: Mauro Carvalho Chehab (media subsystem top-level
  maintainer)
- No Fixes:, Reported-by:, Tested-by:, Acked-by:, Link:, or Cc: stable
  (absence expected for this pipeline)

**Step 1.3: Commit Body**
Record: Bug: The deeply nested 5-level loop in
`rkvdec_init_v4l2_vp9_count_tbl()` uses many registers. When Clang
inlines it into `rkvdec_vp9_start()`, the combined stack frame reaches
1472 bytes, exceeding the 1280-byte `-Wframe-larger-than` limit.
Symptom: Build failure with `-Werror,-Wframe-larger-than`. Fix: Mark the
function `noinline_for_stack` to prevent inlining. Author notes the
resulting code is "good enough" and the function is not on a fast path.

**Step 1.4: Hidden Bug Fix Detection**
Record: This is an explicit build fix, not a disguised runtime fix. The
commit message is transparent about the problem and solution.

## PHASE 2: DIFF ANALYSIS

**Step 2.1: Inventory**
Record: 1 file changed (`drivers/media/platform/rockchip/rkvdec/rkvdec-
vp9.c`), ~2 lines modified (function signature only: `static void` ->
`static noinline_for_stack void` split across 2 lines). Function
modified: `rkvdec_init_v4l2_vp9_count_tbl()`. Scope: single-file,
absolutely surgical.

**Step 2.2: Code Flow Change**
Record: Before: `rkvdec_init_v4l2_vp9_count_tbl()` was a plain `static
void` function eligible for inlining into `rkvdec_vp9_start()`. After:
The `noinline_for_stack` attribute prevents inlining, so the function
gets its own stack frame. No logic, data flow, or error path changes
whatsoever.

**Step 2.3: Bug Mechanism**
Record: Category: build fix / compiler stack-usage mitigation. The
deeply nested loop (5 levels: `i`, `j`, `k`, `l`, `m`) with 6 pointer
dereference assignments per iteration exhausts Clang's register
allocator when inlined, causing heavy stack spilling that pushes the
caller's frame past the warning limit.

**Step 2.4: Fix Quality**
Record: Obviously correct. `noinline_for_stack` is a well-established,
documented kernel pattern (`include/linux/compiler_types.h` line
276-278: `#define noinline_for_stack noinline`). Zero regression risk --
the only effect is preventing inlining of a function called once during
VP9 decoder initialization, which is not a hot path. No API or
behavioral changes.

## PHASE 3: GIT HISTORY INVESTIGATION

**Step 3.1: Blame**
Record: `git blame` shows the entire function body traces to commit
`f25709c4ff151f` ("media: rkvdec: Add the VP9 backend") by Andrzej
Pietrasiewicz, dated 2021-11-17. This was included in
`v5.17-rc1~171^2~201`, so the code has been present since v5.17. The
same deeply nested loop and all 5 loop variables have been there since
introduction.

**Step 3.2: Fixes Tag**
Record: No Fixes: tag present (expected for commits under manual
review).

**Step 3.3: File History**
Record: On current tree, only 2 mainline commits modified `rkvdec-vp9.c`
in the non-staging path: the unstaging move (`d968e50b5c266`) and a QoS
disable (`664b42898db79`). The staging path has a few more minor
changes. No existing stack-usage or noinline fix for this file anywhere
in the history. The candidate is standalone.

**Step 3.4: Author Context**
Record: Arnd Bergmann is a prolific kernel contributor especially well-
known for build fixes, cross-compilation, architecture portability, and
stack-usage reduction patches. His media subsystem commits include
multiple similar `noinline_for_stack` fixes (e.g., `5954ad7d1af92` for
st-delta, `8b55f8818900c` for mediatek VP9). This is his core expertise.

**Step 3.5: Dependencies**
Record: No dependencies. `noinline_for_stack` is defined as `#define
noinline_for_stack noinline` in `include/linux/compiler_types.h` and has
existed since at least v4.x. The function signature is identical in all
stable trees (6.1.y, 6.6.y, 6.12.y) -- verified via `git show` on each
stable branch.

## PHASE 4: MAILING LIST RESEARCH

Record: Direct WebFetch to lore.kernel.org was blocked by Anubis proof-
of-work. However, the commit has proper review/signoff chain (Reviewed-
by from Nicolas Dufresne, Signed-off-by from both Nicolas Dufresne and
Mauro Carvalho Chehab), confirming it went through standard review.

## PHASE 5: CODE SEMANTIC ANALYSIS

**Step 5.1: Functions**
Record: Only `rkvdec_init_v4l2_vp9_count_tbl()` modified (signature
only).

**Step 5.2: Callers**
Record: Called exactly once from `rkvdec_vp9_start()` at line 1034.
Verified in all stable trees (6.1.y line 1031, 6.6.y/6.12.y line 1030).

**Step 5.3: Callees**
Record: The function sets up pointer tables and runs a 5-level nested
loop (`INNERMOST_LOOP` macro) performing array pointer assignments. No
dynamic allocations, no locks, no side effects beyond pointer setup.

**Step 5.4: Call Chain**
Record: `rkvdec_vp9_fmt_ops.start` -> `rkvdec_vp9_start()` ->
`rkvdec_init_v4l2_vp9_count_tbl()`. Called during VP9 streaming setup,
not per-frame. The author explicitly notes it is not a fast path.

**Step 5.5: Similar Patterns**
Record: `noinline_for_stack` is used in 7+ files under `drivers/media/`
for the same class of issue. The nearly identical mediatek VP9 commit
(`8b55f8818900c`) by the same author is the closest precedent.

## PHASE 6: STABLE TREE ANALYSIS

**Step 6.1: Code Existence**
Record: The file exists in all active stable trees:
- 6.1.y: `drivers/staging/media/rkvdec/rkvdec-vp9.c` (verified, function
  at line 927)
- 6.6.y: `drivers/staging/media/rkvdec/rkvdec-vp9.c` (verified, function
  at line 926)
- 6.12.y: `drivers/staging/media/rkvdec/rkvdec-vp9.c` (verified,
  function at line 926)
The function signature and the deeply nested loop are identical in all
branches.

**Step 6.2: Backport Complications**
Record: The file path differs in stable trees (staging vs non-staging),
requiring a trivial path adjustment. The actual code is functionally
identical -- the patch applies cleanly with a path change.

**Step 6.3: Precedent -- Critical Finding**
Record: The nearly identical mediatek VP9 `noinline_for_stack` commit by
the same author (`8b55f8818900c`) **was backported to all three stable
trees**:
- 6.1.y: `89e1132bbf713`
- 6.6.y: `fa43166f2e8ba`
- 6.12.y: `f87626a55c215`

This is extremely strong precedent. The rkvdec fix is the same type of
change (same author, same compiler issue, same annotation, same VP9
decoder context).

## PHASE 7: SUBSYSTEM CONTEXT

**Step 7.1: Subsystem**
Record: `drivers/media/platform/rockchip/rkvdec/` -- Video decoder
driver for Rockchip SoCs. Criticality: PERIPHERAL (hardware-specific),
but Rockchip platforms are widely deployed in Chromebooks, single-board
computers, and embedded systems.

**Step 7.2: Activity**
Record: Low-moderate activity. The driver is mature. Recent changes are
minor (QoS fix, unstaging move).

## PHASE 8: IMPACT AND RISK ASSESSMENT

**Step 8.1: Who is Affected**
Record: Anyone building the kernel with Clang (especially with KASAN
enabled, based on the mediatek precedent) who enables
`CONFIG_VIDEO_ROCKCHIP_VDEC` or `COMPILE_TEST`. This includes CI
systems, distribution kernel builds, and embedded/Chromebook builders.

**Step 8.2: Trigger Conditions**
Record: Triggered at compile time with Clang + `-Wframe-larger-than` +
`-Werror`. Deterministic build failure. The specific Clang version and
configuration matter (KASAN amplifies the issue per the mediatek
precedent), but the fix is purely defensive and safe regardless.

**Step 8.3: Failure Mode**
Record: Build failure -- kernel cannot be compiled. For anyone who needs
this driver, it is a hard blocker. Severity: MEDIUM-HIGH (build failure,
not runtime crash, but prevents compilation entirely).

**Step 8.4: Risk-Benefit Ratio**
Record: BENEFIT: Fixes a real build failure for Clang users with common
warning configurations. The identical class of fix was already deemed
worthy of backport for the mediatek VP9 driver. RISK: Essentially zero.
Adding `noinline_for_stack` has no behavioral effect; it only affects
compiler inlining decisions. The function is called exactly once during
initialization. Ratio: Very favorable.

## PHASE 9: FINAL SYNTHESIS

**Step 9.1: Evidence**

FOR backporting:
- Fixes a documented Clang `-Werror,-Wframe-larger-than` build failure
- Build fixes are an explicit exception category for stable backporting
- Extremely minimal change: single attribute annotation, no logic change
- Zero runtime regression risk
- Well-established kernel pattern (`noinline_for_stack`)
- Author is the recognized expert for this type of fix (Arnd Bergmann)
- Reviewed by subsystem co-maintainer, signed off by media subsystem
  top-level maintainer
- **Strong precedent**: nearly identical fix by same author for mediatek
  VP9 was backported to 6.1.y, 6.6.y, and 6.12.y
- Code exists in all active stable trees with identical function
  signature
- `noinline_for_stack` macro exists in all stable trees

AGAINST backporting:
- File path differs in stable (staging vs non-staging) -- requires
  trivial path adjustment
- Only affects Clang builds with specific configurations (not all build
  environments)
- The exact compiler version/config triggering the issue may vary

**Step 9.2: Stable Rules Checklist**
1. Obviously correct and tested? **YES** -- trivially correct, reviewed
   by maintainers
2. Fixes a real bug? **YES** -- build failure with Clang
3. Important issue? **YES** -- build failure prevents compilation
4. Small and contained? **YES** -- 2-line signature change
5. No new features or APIs? **YES** -- no new features
6. Can apply to stable? **YES** -- with path adjustment for staging
   directory

**Step 9.3: Exception Category**
Record: **BUILD FIX** -- explicitly listed as a valid stable exception
in the rules.

**Step 9.4: Decision**
This is a clear YES. It is a minimal, obviously correct build fix that
follows a well-established kernel pattern, was created by the foremost
expert in this area, and has direct precedent: the nearly identical
mediatek VP9 `noinline_for_stack` fix by the same author was already
backported to all active stable trees.

## Verification

- [Phase 1] Parsed subject: "media: rkvdec: reduce stack usage" -- build
  fix for Clang -Wframe-larger-than
- [Phase 1] Parsed tags: Reviewed-by Nicolas Dufresne, SOBs from
  subsystem and top-level maintainers, no Fixes/Reported-by (expected)
- [Phase 2] Diff analysis: 2-line change adding `noinline_for_stack` to
  `rkvdec_init_v4l2_vp9_count_tbl()` signature; no logic change
- [Phase 3] git blame: function introduced by `f25709c4ff151f` ("media:
  rkvdec: Add the VP9 backend", 2021-11-17), included since v5.17-rc1
- [Phase 3] git describe --contains f25709c4ff151f: confirmed
  `v5.17-rc1~171^2~201`
- [Phase 3] Verified `noinline_for_stack` defined in
  `include/linux/compiler_types.h` line 278 as `#define
  noinline_for_stack noinline`
- [Phase 3] Author check: Arnd Bergmann has multiple similar
  `noinline_for_stack` commits in drivers/media/
- [Phase 5] grep: `rkvdec_init_v4l2_vp9_count_tbl` called from exactly 1
  place: `rkvdec_vp9_start()` at line 1034
- [Phase 5] Read: confirmed 5-level nested loop (lines 973-997) with
  INNERMOST_LOOP macro causing heavy register pressure
- [Phase 6] git cat-file -e: verified file exists in 6.1.y, 6.6.y,
  6.12.y at staging path
- [Phase 6] git show on stable branches: verified function signature
  `static void rkvdec_init_v4l2_vp9_count_tbl(struct rkvdec_ctx *ctx)`
  is identical in 6.1.y (line 927), 6.6.y (line 926), 6.12.y (line 926)
  -- no `noinline_for_stack` present
- [Phase 6] Verified call site in 6.6.y stable at line 1030
- [Phase 6] **Critical precedent**: mediatek VP9 `noinline_for_stack`
  commit `8b55f8818900c` by same author backported to 6.1.y
  (`89e1132bbf713`), 6.6.y (`fa43166f2e8ba`), 6.12.y (`f87626a55c215`)
- [Phase 6] No existing stack-usage fix for rkvdec-vp9.c in any stable
  branch (verified via git log --grep="stack" on 6.6.y)
- [Phase 4] lore.kernel.org inaccessible (Anubis protection); review
  chain verified from commit tags
- UNVERIFIED: Mailing list discussion details beyond the commit tags
- UNVERIFIED: Exact Clang version/config that triggers the failure;
  however, the fix is defensive and safe regardless

**YES**

 drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
index b4bf01e839eff..8fb6a1624a14f 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
@@ -927,7 +927,8 @@ static void rkvdec_vp9_done(struct rkvdec_ctx *ctx,
 	update_ctx_last_info(vp9_ctx);
 }
 
-static void rkvdec_init_v4l2_vp9_count_tbl(struct rkvdec_ctx *ctx)
+static noinline_for_stack void
+rkvdec_init_v4l2_vp9_count_tbl(struct rkvdec_ctx *ctx)
 {
 	struct rkvdec_vp9_ctx *vp9_ctx = ctx->priv;
 	struct rkvdec_vp9_intra_frame_symbol_counts *intra_cnts = vp9_ctx->count_tbl.cpu;
-- 
2.53.0


