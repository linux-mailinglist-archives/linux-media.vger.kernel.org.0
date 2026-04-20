Return-Path: <linux-media+bounces-59148-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kOaSLVw25mkGtgEAu9opvQ
	(envelope-from <linux-media+bounces-59148-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 16:21:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4681642CEEF
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 16:21:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 64C7C31012B9
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 14:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66FBB438FEF;
	Mon, 20 Apr 2026 13:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fvonJGhP"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF34A43637E;
	Mon, 20 Apr 2026 13:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776691785; cv=none; b=VrLsIEPk0cJKWc5He+5duoBT7zSV2KSXe6IxZQNbwDzttwgZXiv/n/kUPwwN7Z8KG26aGbmOzCacwE4ELH9pMlIl7BiF4Ju6Ft3t3EMA6Vhyj0ZW0ET5nlmxPh0LY/s5KLY6X7RxNjC7bWK2U/NRcsCCqVAwg9tbMfEuQnvqaTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776691785; c=relaxed/simple;
	bh=lMCIDnWvyxnN2bFHV8mrTlQXqQoDegkQezmVLTiPYNo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WwBlA982/uhcbkXrUt850Nvsw7YnCEF2o49cT4DsMXaUywTCSPmtNlZqa+q3V9KfW+xK4PpPEXOQx+K0Y+TiVLSTEdp5BGxX2qi6PuTFw6Sto6YCNRf+vZpX11+ngrKzyAZn6uf5W8TZ4wJNY/3/mVfAZTUyrUr/qnh/4B77eNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fvonJGhP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F3B5C2BCC9;
	Mon, 20 Apr 2026 13:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776691785;
	bh=lMCIDnWvyxnN2bFHV8mrTlQXqQoDegkQezmVLTiPYNo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fvonJGhPT6YVd/jy9NU7l26Qyq06ZHjmyE9elteFAf07oXvZV4nQxSHOS2lbW4glg
	 oxcRu2b+r4xmAaztM0IXwQM3XXSXWJ4Xu9YgEJy4aZFS5ru+iNv9EAeNodVa+sdppZ
	 69VYjnmfPvRY2tNRa3EK67zC149vmBaGBGI34HBzLwZma5d1A8F2U8kS1Hqe1Tkxss
	 fPDdbwY+rP6Wb6OwOmg8GwLbrPPBNWXBdfptlKAljhfy8UgBtkZQPdX40U4frWIb5g
	 hvaAwiTFcEomNg/JX2Ount07Kt3lDucaCBxMYYlGib9Py+b9zUkntcRbY/ez0japHK
	 9pGGCw5HkGPIQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	kernel@collabora.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 7.0-6.18] media: synopsys: hdmirx: support use with sleeping GPIOs
Date: Mon, 20 Apr 2026 09:19:46 -0400
Message-ID: <20260420132314.1023554-192-sashal@kernel.org>
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
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-59148-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,huawei];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iu.edu:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email,spinics.net:url,sntech.de:email]
X-Rspamd-Queue-Id: 4681642CEEF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Mark Brown <broonie@kernel.org>

[ Upstream commit 2fb0481fe0d7891420c1a3df2e4f9a70b1f77dbd ]

The recent change in commit 20cf2aed89ac ("gpio: rockchip: mark the GPIO
controller as sleeping") to mark the rockchip GPIO driver as sleeping
has started triggering the warning at drivers/gpio/gpiolib.c:3523
indicating that a sleepable GPIO was called via the non-sleeping APIs on
the Rock 5B:

<4>[   14.699308] Call trace:
<4>[   14.699545]  gpiod_get_value+0x90/0x98 (P)
<4>[   14.699928]  tx_5v_power_present+0x44/0xd0 [synopsys_hdmirx]
<4>[   14.700446]  hdmirx_delayed_work_hotplug+0x34/0x128 [synopsys_hdmirx]
<4>[   14.701031]  process_one_work+0x14c/0x28c
<4>[   14.701405]  worker_thread+0x184/0x300
<4>[   14.701756]  kthread+0x11c/0x128
<4>[   14.702065]  ret_from_fork+0x10/0x20

Currently the active use of the GPIO is all done from process context so
can be simply converted to use gpiod_get_value_cansleep(). There is one use
of the GPIO from hard interrupt context but this is only done so the status
can be displayed in a debug print so can simply be deleted without any
functional effect.

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Acked-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Now I have all the information needed for a comprehensive analysis.

---

## PHASE 1: COMMIT MESSAGE FORENSICS

### Step 1.1: PARSE THE SUBJECT LINE
- **Subsystem:** media: synopsys: hdmirx
- **Action verb:** "support" (but this is functionally a fix - adapting
  to an API change)
- **Summary:** Switch GPIO calls to sleeping-capable variants after the
  rockchip GPIO driver was marked as sleeping.

Record: [media: synopsys: hdmirx] [support/fix] [Use sleeping GPIO APIs
to fix WARN_ON triggered by rockchip GPIO sleeping mark]

### Step 1.2: PARSE ALL COMMIT MESSAGE TAGS
- **Reviewed-by:** Heiko Stuebner (Rockchip platform maintainer)
- **Acked-by:** Dmitry Osipenko (collabora, HDMIRX driver co-maintainer)
- **Signed-off-by:** Mark Brown (well-known kernel developer,
  SPI/ASoC/regulator subsystem maintainer)
- **Signed-off-by:** Sakari Ailus (media subsystem maintainer)
- **Signed-off-by:** Mauro Carvalho Chehab (media subsystem top-level
  maintainer)
- **No Fixes: tag** (expected for this review pipeline)
- **No Cc: stable** (expected)
- **No Reported-by** (author discovered it themselves via the WARN_ON)

Record: Strong review chain - Reviewed by Rockchip maintainer, Acked by
driver contributor, signed by both media maintainers.

### Step 1.3: ANALYZE THE COMMIT BODY TEXT
The commit explains:
- Commit 20cf2aed89ac marked the rockchip GPIO driver as sleeping
- This causes a `WARN_ON` at `drivers/gpio/gpiolib.c:3523` when
  `gpiod_get_value()` is called on a sleeping GPIO
- The warning occurs on Rock 5B hardware during HDMI hotplug detection
- A stack trace is provided showing the exact call path:
  `tx_5v_power_present()` -> `hdmirx_delayed_work_hotplug()` ->
  workqueue
- The fix: process context calls switched to
  `gpiod_get_value_cansleep()`; the IRQ handler call was only for debug
  logging and is simply removed

Record: Bug = WARN_ON triggered every time HDMI hotplug detection runs
on Rock 5B. Symptom = kernel warning in dmesg. Root cause = rockchip
GPIO driver now correctly marked as sleeping, exposing incorrect non-
sleeping GPIO API usage.

### Step 1.4: DETECT HIDDEN BUG FIXES
This is a genuine bug fix despite "support" in the title. The
`gpiod_get_value()` call in the IRQ handler is actually more than just a
WARN_ON - calling a sleeping function from hard interrupt context could
cause a sleep-in-atomic-context bug, which is a real correctness issue.
The workqueue path triggers a warning on every HDMI hotplug event.

Record: Yes, this is a real bug fix. The WARN_ON fires on every HDMI
hotplug event on Rock 5B.

## PHASE 2: DIFF ANALYSIS

### Step 2.1: INVENTORY THE CHANGES
- **File:** `drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c`
- **Lines changed:** +1, -5 (net: -4 lines)
- **Functions modified:**
  1. `tx_5v_power_present()` - 1 line changed
  2. `hdmirx_5v_det_irq_handler()` - 4 lines removed
- **Scope:** Single-file, surgical fix

Record: 1 file, -4 net lines. Two functions modified. Scope: minimal
surgical fix.

### Step 2.2: UNDERSTAND THE CODE FLOW CHANGE
**Hunk 1 (tx_5v_power_present):**
- Before: `gpiod_get_value()` called from workqueue context
- After: `gpiod_get_value_cansleep()` called from workqueue context
- This function is already sleeping (contains `usleep_range(1000,
  1100)`), so `_cansleep` is correct.

**Hunk 2 (hdmirx_5v_det_irq_handler):**
- Before: Read GPIO value and print debug message, then queue delayed
  work
- After: Just queue delayed work
- The GPIO read was only used for a `v4l2_dbg()` print at debug level 3
  - pure debug output, no functional effect.

Record: Hunk 1: API variant swap in already-sleeping context. Hunk 2:
Remove debug-only GPIO read from hard IRQ context.

### Step 2.3: IDENTIFY THE BUG MECHANISM
This is a **sleep-in-wrong-context** bug:
- Category (g) Logic/correctness fix + (h) Hardware workaround aspect
- `gpiod_get_value()` on a sleeping GPIO controller triggers a `WARN_ON`
  (verified at gpiolib.c line 3520)
- In the IRQ handler, calling a potentially-sleeping function from hard
  interrupt context is a more severe issue (sleep-in-atomic)

Record: WARN_ON trigger on every HDMI hotplug; potential sleep-in-atomic
in IRQ handler. Fix is API variant swap + debug code removal.

### Step 2.4: ASSESS THE FIX QUALITY
- **Obviously correct?** Yes. `tx_5v_power_present()` already calls
  `usleep_range()`, confirming it's in sleeping context. Switching to
  `_cansleep` is the textbook fix.
- **Minimal?** Yes. 1 line changed, 4 lines removed.
- **Regression risk?** Essentially zero. The `_cansleep` variant does
  the same thing but without the WARN_ON check. Removing the debug print
  from the IRQ handler has no functional impact.

Record: Fix is obviously correct, minimal, and has essentially zero
regression risk.

## PHASE 3: GIT HISTORY INVESTIGATION

### Step 3.1: BLAME THE CHANGED LINES
Both changed locations were introduced in commit `7b59b132ad4398`
("media: platform: synopsys: Add support for HDMI input driver"), first
appearing in v6.15-rc1.

Record: Buggy code introduced in 7b59b132ad4398 (v6.15). The code wasn't
"buggy" initially - it became incorrect when 20cf2aed89ac6 marked the
rockchip GPIO as sleeping (v6.19-rc5).

### Step 3.2: FOLLOW THE FIXES TAG
No Fixes: tag present (expected). The implicit fix target is
20cf2aed89ac6 ("gpio: rockchip: mark the GPIO controller as sleeping"),
introduced in v6.19-rc5.

Record: The bug exists in any tree that contains BOTH 7b59b132ad4398
(HDMIRX driver, v6.15+) AND 20cf2aed89ac6 (sleeping GPIO, v6.19-rc5+).
Therefore affected trees: v6.19.y, v7.0.y.

### Step 3.3: CHECK FILE HISTORY
The file has had 10 commits since creation. None appear to be
prerequisites for this fix. The fix is standalone.

Record: Standalone fix, no prerequisites needed.

### Step 3.4: CHECK THE AUTHOR
Mark Brown is a senior kernel maintainer (SPI, ASoC, regulator
subsystems). The fix was reviewed by Heiko Stuebner (Rockchip
maintainer) and acked by Dmitry Osipenko (HDMIRX driver contributor).

Record: Author is a highly trusted kernel maintainer. Reviews from
appropriate people.

### Step 3.5: CHECK FOR DEPENDENCIES
No dependencies. The patch modifies only existing code with a simple API
swap and deletion. Applies cleanly to the current 7.0 tree (confirmed:
the file matches pre-patch state).

Record: No dependencies. Will apply cleanly.

## PHASE 4: MAILING LIST AND EXTERNAL RESEARCH

### Step 4.1: ORIGINAL PATCH DISCUSSION
The patch went through 3 versions:
- **v1:** Jan 8, 2026 - Original submission based on pre-v7.0 tree
- **v2:** Feb 26, 2026 - Rebased onto v7.0-rc1, no functional changes
- **v3:** Mar 2, 2026 - Only checkpatch noise fixed, no code changes

Record: 3 versions, but no functional changes between them - just
rebasing.

### Step 4.2: REVIEWERS
- Dmitry Osipenko: Acked-by on v1
- Heiko Stuebner: Reviewed-by on v1
- Both maintained their endorsements through v3
- Sakari Ailus and Mauro Carvalho Chehab (media maintainers) signed off

Record: Strong review from relevant maintainers.

### Step 4.3: BUG REPORT
No separate bug report - the author observed the WARN_ON directly. The
same class of issue was fixed in `drm/rockchip: dw_hdmi_qp`
(db8061bbb9b23), confirming it's a systematic problem caused by the
rockchip sleeping GPIO change.

Record: Same issue affected DRM rockchip driver, fixed separately.
Systematic GPIO API usage issue.

### Step 4.4: RELATED PATCHES
The DRM fix (db8061bbb9b23) is the sibling fix for the same root cause
in a different driver. No series dependency.

### Step 4.5: STABLE DISCUSSION
No specific stable discussion found. The DRM sibling fix (db8061bbb9b23)
was already picked up for v6.19 stable.

## PHASE 5: CODE SEMANTIC ANALYSIS

### Step 5.1: KEY FUNCTIONS
1. `tx_5v_power_present()` - detects HDMI 5V power on the cable
2. `hdmirx_5v_det_irq_handler()` - IRQ handler for HDMI detect pin

### Step 5.2: CALLERS
- `tx_5v_power_present()` is called from:
  - `port_no_link()` (line 461)
  - `hdmirx_wait_signal_lock()` (line 2146)
  - `hdmirx_delayed_work_hotplug()` (line 2207)
  - `hdmirx_delayed_work_res_change()` (line 2229)
- All callers are in process context (workqueues or ioctl handlers).

### Step 5.3-5.5: CALL CHAIN / SIMILAR PATTERNS
The warning triggers on every HDMI cable plug/unplug event on Rock 5B
hardware. This is a common user action.

Record: Triggered by HDMI cable events - common real-world usage.

## PHASE 6: STABLE TREE ANALYSIS

### Step 6.1: DOES THE BUGGY CODE EXIST IN STABLE?
- HDMIRX driver: v6.15+ (present in 6.15.y, 6.18.y, 6.19.y, 7.0.y)
- Rockchip sleeping GPIO: v6.19-rc5+ (present in 6.19.y, 7.0.y)
- **Bug exists in: 6.19.y and 7.0.y** (both commits must be present)

Record: Bug affects 6.19.y and 7.0.y stable trees.

### Step 6.2: BACKPORT COMPLICATIONS
The patch applies cleanly - verified that the current code in 7.0
matches the pre-patch state exactly.

Record: Clean apply expected.

## PHASE 7: SUBSYSTEM AND MAINTAINER CONTEXT

### Step 7.1: SUBSYSTEM CRITICALITY
- Subsystem: media drivers (drivers/media/)
- Sub-subsystem: HDMI RX driver for Rockchip RK3588 (Rock 5B)
- Criticality: PERIPHERAL (specific hardware), but Rock 5B is a popular
  SBC

Record: PERIPHERAL but popular hardware (Rock 5B).

## PHASE 8: IMPACT AND RISK ASSESSMENT

### Step 8.1: WHO IS AFFECTED
Users of Rock 5B (RK3588) with HDMI input functionality, running kernels
6.19+.

### Step 8.2: TRIGGER CONDITIONS
Every HDMI cable plug/unplug event triggers the WARN_ON. This is a
normal, common user action.

### Step 8.3: FAILURE MODE SEVERITY
- WARN_ON in kernel log (MEDIUM) - fires every time, pollutes dmesg
- The IRQ handler call to `gpiod_get_value()` on a sleeping GPIO is
  actually a potential sleep-in-atomic-context issue, though in practice
  the rockchip GPIO driver path may not actually sleep in this codepath
  (the `can_sleep` flag is a capability flag, not a guarantee of
  sleeping)
- Severity: MEDIUM - persistent kernel warning on every HDMI hotplug
  event

### Step 8.4: RISK-BENEFIT RATIO
- **Benefit:** Eliminates persistent WARN_ON on every HDMI hotplug event
  on Rock 5B. Fixes a potential sleep-in-atomic issue in IRQ handler.
- **Risk:** Extremely low. 1 line API variant swap in already-sleeping
  context, plus removal of 4 lines of debug-only code from IRQ handler.
- **Ratio:** Very favorable.

## PHASE 9: FINAL SYNTHESIS

### Step 9.1: EVIDENCE COMPILED

**FOR backporting:**
- Fixes a real WARN_ON that fires on every HDMI hotplug event on Rock 5B
- Extremely small and surgical (1 line changed, 4 lines removed)
- Obviously correct - the function already sleeps (usleep_range)
- Reviewed by Rockchip maintainer, acked by driver contributor
- Author is a senior kernel maintainer (Mark Brown)
- Sibling fix for the same root cause already applied in DRM subsystem
- No dependencies, clean apply expected
- Zero regression risk

**AGAINST backporting:**
- Only affects Rock 5B (RK3588) hardware with HDMI input
- The WARN_ON is "only" a warning, not a crash (though the IRQ handler
  issue is more concerning)
- Only affects 6.19.y and 7.0.y (limited scope)

### Step 9.2: STABLE RULES CHECKLIST
1. Obviously correct and tested? **YES** - trivial API swap,
   reviewed/acked by relevant maintainers
2. Fixes a real bug? **YES** - WARN_ON on every hotplug event, potential
   sleep-in-atomic
3. Important issue? **YES** - persistent warning that fires on normal
   hardware usage
4. Small and contained? **YES** - 6 lines total, 1 file, 2 functions
5. No new features or APIs? **YES** - only fixes existing code
6. Can apply to stable? **YES** - clean apply confirmed

### Step 9.3: EXCEPTION CATEGORIES
This is a hardware-related fix (fixing GPIO API usage for specific
hardware). It falls in the "hardware workaround/quirk" space.

### Step 9.4: DECISION
This is a small, obviously correct fix that eliminates a persistent
kernel warning on common hardware (Rock 5B). It was reviewed by the
right people, has zero regression risk, and applies cleanly. The fix is
needed in any stable tree that contains both the HDMIRX driver (v6.15+)
and the rockchip sleeping GPIO change (v6.19+).

## Verification

- [Phase 1] Parsed subject: "media: synopsys: hdmirx: support use with
  sleeping GPIOs" - functional fix despite "support" wording
- [Phase 1] Tags: Reviewed-by Heiko Stuebner, Acked-by Dmitry Osipenko,
  SOBs from Mark Brown, Sakari Ailus, Mauro Carvalho Chehab
- [Phase 2] Diff analysis: 1 line changed (`gpiod_get_value` ->
  `gpiod_get_value_cansleep`), 4 lines removed (debug-only GPIO read
  from IRQ handler)
- [Phase 3] git blame: buggy code from 7b59b132ad4398 (v6.15), bug
  triggered by 20cf2aed89ac6 (v6.19-rc5)
- [Phase 3] git tag --contains: HDMIRX in v6.15+, sleeping GPIO in
  v6.19-rc5+
- [Phase 3] Verified current file state still has `gpiod_get_value` (fix
  not yet in tree)
- [Phase 4] Found v1 (lkml.iu.edu), v2 (spinics.net), v3 (spinics.net) -
  all identical code change
- [Phase 4] Dmitry Osipenko acked v1 immediately; Heiko Stuebner
  reviewed v1 next day
- [Phase 4] Sibling fix db8061bbb9b23 (DRM rockchip) for same root
  cause, already in v6.19
- [Phase 5] `tx_5v_power_present()` called from 4 sites, all process
  context; already contains usleep_range()
- [Phase 5] `hdmirx_5v_det_irq_handler()` is hard IRQ handler
  (devm_request_irq with IRQF_TRIGGER_FALLING|RISING)
- [Phase 6] Bug exists in 6.19.y and 7.0.y stable trees
- [Phase 6] Patch applies cleanly - verified file content matches pre-
  patch state
- [Phase 7] gpiolib.c line 3520: `WARN_ON(desc->gdev->can_sleep)`
  confirmed as the warning source
- [Phase 8] Trigger: every HDMI plug/unplug on Rock 5B; severity MEDIUM
  (persistent warning + potential sleep-in-atomic)

**YES**

 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
index 9cceffa4ce250..61ad20b18b8d6 100644
--- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
+++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
@@ -232,7 +232,7 @@ static bool tx_5v_power_present(struct snps_hdmirx_dev *hdmirx_dev)
 
 	for (i = 0; i < 10; i++) {
 		usleep_range(1000, 1100);
-		val = gpiod_get_value(hdmirx_dev->detect_5v_gpio);
+		val = gpiod_get_value_cansleep(hdmirx_dev->detect_5v_gpio);
 		if (val > 0)
 			cnt++;
 		if (cnt >= detection_threshold)
@@ -2252,10 +2252,6 @@ static void hdmirx_delayed_work_res_change(struct work_struct *work)
 static irqreturn_t hdmirx_5v_det_irq_handler(int irq, void *dev_id)
 {
 	struct snps_hdmirx_dev *hdmirx_dev = dev_id;
-	u32 val;
-
-	val = gpiod_get_value(hdmirx_dev->detect_5v_gpio);
-	v4l2_dbg(3, debug, &hdmirx_dev->v4l2_dev, "%s: 5v:%d\n", __func__, val);
 
 	queue_delayed_work(system_unbound_wq,
 			   &hdmirx_dev->delayed_work_hotplug,
-- 
2.53.0


