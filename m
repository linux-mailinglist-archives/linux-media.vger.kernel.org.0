Return-Path: <linux-media+bounces-59149-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOWgAhk95mlutgEAu9opvQ
	(envelope-from <linux-media+bounces-59149-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 16:50:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EF442D82C
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 16:50:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B27903676F8F
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 14:13:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3248E43637E;
	Mon, 20 Apr 2026 13:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cRR+ss4A"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9123A43C05F;
	Mon, 20 Apr 2026 13:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776691793; cv=none; b=qMLH1z95TNQocCmlDxLiwUXIJFXpZzHBFrW0K7wByyvRBvo+syE1OB5nzHG1i9G/kuTFwH+MOPvmCNmKKwGXEGfwgd6yN+bNsihquGhGpDPXSGCQM8dH+f9ttoDBomycNrOWS+UNf7BDH/hRD72vcoJ75XM/u7/k//8DAF/kaVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776691793; c=relaxed/simple;
	bh=Qxjq/FzQw6lO9c+b6rojdQouk4f6/GD8nNBGBgqf1u0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n/HUnT2bYNOoN1aqkOOFIDCmk12sxVe2/eJubTRgH+ziRXfxcwXYUY7N0/hJLsaM0mvoBrBY99nQIUDYI783/BbH5vlgV+zXq9qovA9sTo3aOvx4bdwoPYet2r7HTaVbZrBde4jXe0jyDQnEsEiv4tPnxPsNOHlLLByEvUm3JkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cRR+ss4A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45329C2BCB4;
	Mon, 20 Apr 2026 13:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776691793;
	bh=Qxjq/FzQw6lO9c+b6rojdQouk4f6/GD8nNBGBgqf1u0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cRR+ss4AWgFN4DAv5YXRJH/R2XpAjCjXSNV2TSFms/H5XEBYARSDuRfQIU/TcPjhK
	 JJei5L3Ela3cew07hac+0mXQOexNMuuzF94BPb3fXK43O5gezzHEblCdDUBbIs8bxE
	 pvpu5G5lyRW8IAaR/IiRlIXCA8xTGYnjLxjC/H6e0VB5LHrdsu9UKdTf98aGqixWXs
	 32lg18ThWPluIAK3k2p3mjvzJwdYNo4BRsqt46XA1tkX76mgSx+bckwZ+XD4YUahtE
	 hB2u4yAMgKfcUlwOPWeqBmMJbqDKx1Euf028ht7bfvHRpa9+IkQIrSoVaZ2Da6rUXw
	 a4/TK3DtHz9Uw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Alexander Shiyan <eagle.alexander923@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 7.0-5.15] media: ccs-pll: Fix pre-PLL divider calculation for EXT_IP_PLL_DIVIDER flag
Date: Mon, 20 Apr 2026 09:19:51 -0400
Message-ID: <20260420132314.1023554-197-sashal@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[gmail.com,linux.intel.com,kernel.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-59149-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,huawei];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,yhbt.net:url]
X-Rspamd-Queue-Id: 53EF442D82C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Alexander Shiyan <eagle.alexander923@gmail.com>

[ Upstream commit b7ef8bbb9fbd43d33ecb92e23aa7c5a55dab5513 ]

When the CCS_PLL_FLAG_EXT_IP_PLL_DIVIDER flag is set, odd pre-PLL divider
values are allowed. However, in the operational timing branch the
calculation of the minimum pre-PLL divider incorrectly uses clk_div_even_up,
forcing the minimum value to be even, even if the flag is set. This prevents
selecting a valid odd divider like 3, which may be required for certain
sensor configurations.

Fix this by removing the forced even rounding from the minimum pre-PLL
divider calculation. The loop later uses the flag to determine the step,
so odd values will be considered when the flag is set.

Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Now I have a comprehensive understanding. Let me compile the full
analysis.

---

## PHASE 1: COMMIT MESSAGE FORENSICS

### Step 1.1: Parse Subject Line
- **Subsystem:** `media: ccs-pll:` — MIPI CCS PLL calculator for camera
  sensors
- **Action verb:** "Fix" — explicit bug fix
- **Summary:** Corrects pre-PLL divider calculation when
  `EXT_IP_PLL_DIVIDER` flag is set

### Step 1.2: Parse Tags
- **Signed-off-by:** Alexander Shiyan (author), Sakari Ailus (CCS
  subsystem maintainer), Mauro Carvalho Chehab (media subsystem
  maintainer)
- No Fixes: tag, no Cc: stable, no Reported-by, no Link — expected for
  autosel candidate

### Step 1.3: Commit Body Analysis
The bug: when `CCS_PLL_FLAG_EXT_IP_PLL_DIVIDER` is set, odd pre-PLL
dividers should be allowed. However, the initial minimum calculation
uses `clk_div_even_up()`, unconditionally forcing the minimum to be
even. This prevents selecting valid odd dividers (like 3). The loop step
already respects the flag, but the minimum is pre-constrained to even
values.

### Step 1.4: Hidden Bug Detection
This is explicitly labeled as a fix. The logic error is real and
verifiable from the code.

---

## PHASE 2: DIFF ANALYSIS

### Step 2.1: Inventory
- **File:** `drivers/media/i2c/ccs-pll.c` — 3 lines removed, 2 lines
  added
- **Function:** `ccs_pll_calculate()` — single function, single hunk
- **Scope:** Single-file surgical fix

### Step 2.2: Code Flow Change
**Before:** `min_op_pre_pll_clk_div` first calculation uses
`clk_div_even_up(DIV_ROUND_UP(...))`, always forcing the frequency-based
minimum to be even.

**After:** `min_op_pre_pll_clk_div` first calculation uses raw
`DIV_ROUND_UP(...)`, preserving odd values.

The flag-based conditional even check at lines 846-847 then properly
decides whether to force even.

### Step 2.3: Bug Mechanism
This is a **logic/correctness bug**. The `clk_div_even_up()` at line 827
conflicts with the flag-based conditional check at line 846-847 (added
by `660e613d05e449`). Since `max_t()` propagates the larger value, the
unconditionally-even first calculation can become the binding
constraint, defeating the flag check.

### Step 2.4: Fix Quality
- Minimal and surgical — removes one wrapper function call
- Obviously correct — the VT tree equivalent code at lines 412-416 does
  NOT use `clk_div_even_up()` for the analogous calculation
- The flag check at 846-847 ensures sensors without the flag still get
  even values
- Zero regression risk for sensors without the flag

---

## PHASE 3: GIT HISTORY INVESTIGATION

### Step 3.1: Blame
From git blame:
- Line 827 (`clk_div_even_up(`) traces to `6de1b143a45d3c` from **2012**
  (originally `smiapp-pll.c`)
- The `EXT_IP_PLL_DIVIDER` loop step support was added by
  `4e1e8d240dff96` in **2020**
- The flag check at lines 846-847 was added by `660e613d05e449` in
  **February 2025**

The inconsistency existed since 2020 when odd divider support was added
but the initial min calculation wasn't updated.

### Step 3.2: Related Commits
- `660e613d05e449` ("Start OP pre-PLL multiplier search from correct
  value") — added the flag check after the second min calculation. Has
  `Cc: stable@vger.kernel.org`. This is the **prerequisite** for the
  commit being analyzed, and it IS in 7.0.
- `06d2d478b09e6` ("Start VT pre-PLL multiplier search from correct
  value") — the VT tree equivalent fix, which correctly doesn't use
  `clk_div_even_up()` for the initial min. Also has `Cc: stable`.

### Step 3.3: Author Context
Alexander Shiyan is a community contributor, not the CCS subsystem
maintainer. However, the patch was reviewed and signed off by Sakari
Ailus (CCS maintainer) and Mauro Carvalho Chehab (media subsystem
maintainer), giving it strong authority.

### Step 3.5: Dependencies
This commit requires `660e613d05e449` to be present (the flag check at
line 846-847 is in the diff context). That commit IS in the 7.0 tree and
was already Cc'd to stable.

---

## PHASE 4: MAILING LIST RESEARCH

### Step 4.1: Original Discussion
b4 dig could not find the commit (it's not yet in this tree). Web search
did not find the specific patch thread. The AUTOSEL thread for 6.15
found at yhbt.net/lore includes related CCS PLL patches from the same
series of fixes by Sakari Ailus.

### Step 4.2: Reviewer Context
Signed off by both the CCS subsystem maintainer (Sakari Ailus) and media
subsystem maintainer (Mauro Carvalho Chehab), indicating proper review
chain.

---

## PHASE 5: CODE SEMANTIC ANALYSIS

### Step 5.1: Functions Modified
- `ccs_pll_calculate()` — the main PLL calculator entry point

### Step 5.2: Callers
- Called from `ccs_pll_calculate()` in `ccs-core.c` (line 512) and
  `imx214.c`
- Called during sensor initialization — affects whether the camera
  sensor can be configured

### Step 5.4: Call Chain
`sensor probe → pll_calculate → ccs_pll_calculate()` — this is called
during sensor initialization. If PLL calculation fails, the sensor
cannot operate.

### Step 5.5: Pattern Comparison
The VT tree equivalent (lines 412-416) does NOT use `clk_div_even_up()`
for the analogous min calculation, confirming the OP tree code is
inconsistent.

---

## PHASE 6: STABLE TREE ANALYSIS

### Step 6.1: Code Presence
- The `clk_div_even_up()` at line 827 traces back to 2012
  (`6de1b143a45d3c`, v3.8)
- The `EXT_IP_PLL_DIVIDER` flag support was added in 2020
  (`4e1e8d240dff96`, v5.10-rc6 era)
- The prerequisite flag check (`660e613d05e449`) is in 7.0 tree and was
  Cc'd to stable
- The buggy code exists in all stable trees that have both the original
  code and the flag support

### Step 6.2: Backport Complications
The diff applies cleanly to 7.0 — the "before" state in the diff matches
the current code exactly.

---

## PHASE 7: SUBSYSTEM CONTEXT

### Step 7.1: Subsystem
- **Subsystem:** drivers/media/i2c — camera sensor I2C driver
  infrastructure
- **Criticality:** PERIPHERAL — affects CCS-compatible camera sensors
  with specific capabilities
- The CCS PLL calculator is used by the CCS sensor driver and referenced
  by other sensor drivers (imx214)

---

## PHASE 8: IMPACT AND RISK ASSESSMENT

### Step 8.1: Affected Users
Driver-specific: affects CCS-compatible sensors with
`CCS_CLOCK_TREE_PLL_CAPABILITY_EXT_DIVIDER` capability

### Step 8.2: Trigger Conditions
Triggered during sensor initialization when:
1. The sensor has the EXT_DIVIDER capability
2. The frequency constraint calculation produces an odd minimum divider
3. That odd minimum is the binding constraint (larger than the
   multiplier-based constraint)

### Step 8.3: Failure Mode
- PLL calculation selects wrong divider or fails entirely
- Result: camera sensor doesn't work or operates suboptimally
- **Severity: MEDIUM** — non-working hardware, not crash/corruption

### Step 8.4: Risk-Benefit
- **Benefit:** Enables correct PLL configuration for affected sensors
- **Risk:** Negligible — the fix only changes behavior when
  `EXT_IP_PLL_DIVIDER` flag is set; the flag check at 846-847 ensures
  correct behavior for sensors without the flag
- **Ratio:** Favorable — meaningful benefit with essentially zero
  regression risk

---

## PHASE 9: FINAL SYNTHESIS

### Step 9.1: Evidence Compilation

**FOR backporting:**
- Real logic bug that prevents valid PLL configurations
- Very small, surgical fix (remove one function wrapper)
- Obviously correct — consistent with VT tree pattern
- Signed off by both CCS and media subsystem maintainers
- Prerequisite commit already in stable with Cc: stable tag
- Applies cleanly to 7.0
- Zero regression risk for sensors without the flag

**AGAINST backporting:**
- Niche user population (CCS sensors with specific capability)
- No crash, security issue, or data corruption — functional correctness
  only
- No Fixes: tag or Cc: stable from author
- No Reported-by: (no evidence of user reports)

### Step 9.2: Stable Rules Checklist
1. **Obviously correct?** YES — removing unconditional even-rounding
   that conflicts with conditional check
2. **Fixes real bug?** YES — wrong PLL divider selection for sensors
   with odd divider support
3. **Important issue?** MEDIUM — non-working hardware for affected
   sensors
4. **Small and contained?** YES — 3 lines removed, 2 added in single
   function
5. **No new features?** YES — pure bug fix
6. **Applies to stable?** YES — applies cleanly

---

## Verification

- [Phase 1] Parsed commit message: explicit "Fix" in subject, describes
  logic error with EXT_IP_PLL_DIVIDER
- [Phase 2] Diff analysis: removes `clk_div_even_up()` wrapper from
  first `min_op_pre_pll_clk_div` calculation (line 827)
- [Phase 3] git blame: `clk_div_even_up()` at line 827 from commit
  `6de1b143a45d3c` (2012), flag support from `4e1e8d240dff96` (2020)
- [Phase 3] git show `660e613d05e449`: confirmed prerequisite commit is
  in 7.0 tree, has `Cc: stable`, adds flag check at lines 846-847
- [Phase 3] git show `06d2d478b09e6`: confirmed VT tree equivalent fix
  pattern doesn't use `clk_div_even_up()` for its min calculation
- [Phase 3] git show `4e1e8d240dff96`: confirmed this is when
  EXT_IP_PLL_DIVIDER loop step was added
- [Phase 4] Web search: could not find specific patch thread; found
  related AUTOSEL 6.15 series with CCS PLL fixes
- [Phase 5] Grep callers: `ccs_pll_calculate()` called from `ccs-
  core.c:512` during sensor setup
- [Phase 5] Grep `CCS_PLL_FLAG_EXT_IP_PLL_DIVIDER`: set in `ccs-
  core.c:3506` based on sensor capability register
- [Phase 6] Code present in 7.0 tree; diff applies cleanly; prerequisite
  already present
- [Phase 7] VT tree (lines 412-416) confirmed to NOT use
  `clk_div_even_up()`, showing OP tree is inconsistent
- UNVERIFIED: Exact mainline commit hash not found in this tree;
  specific lore.kernel.org thread not accessible

---

This is a small, obviously correct bug fix that removes an unconditional
even-rounding operation that conflicts with a flag-based conditional
check for sensors supporting odd PLL dividers. The fix makes the OP tree
code consistent with the VT tree code. The prerequisite commit is
already in stable trees. The risk is negligible and the fix enables
correct hardware operation for affected sensors.

**YES**

 drivers/media/i2c/ccs-pll.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
index 4eb83636e1027..1605cfa5db19d 100644
--- a/drivers/media/i2c/ccs-pll.c
+++ b/drivers/media/i2c/ccs-pll.c
@@ -824,9 +824,8 @@ int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 				   op_lim_fr->min_pll_ip_clk_freq_hz));
 	min_op_pre_pll_clk_div =
 		max_t(u16, op_lim_fr->min_pre_pll_clk_div,
-		      clk_div_even_up(
-			      DIV_ROUND_UP(pll->ext_clk_freq_hz,
-					   op_lim_fr->max_pll_ip_clk_freq_hz)));
+		      DIV_ROUND_UP(pll->ext_clk_freq_hz,
+				   op_lim_fr->max_pll_ip_clk_freq_hz));
 	dev_dbg(dev, "pre-pll check: min / max op_pre_pll_clk_div: %u / %u\n",
 		min_op_pre_pll_clk_div, max_op_pre_pll_clk_div);
 
-- 
2.53.0


