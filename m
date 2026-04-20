Return-Path: <linux-media+bounces-59156-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPbRKZtG5mk+uAEAu9opvQ
	(envelope-from <linux-media+bounces-59156-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 17:30:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC1142E3DB
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 17:30:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2529D342ED31
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 14:33:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EB144BCAA3;
	Mon, 20 Apr 2026 13:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uEkm3Uxd"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4C34BCAD6;
	Mon, 20 Apr 2026 13:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776691976; cv=none; b=AVD+YhrwoXVPlbKBDScz8BhsvX5aJxRkRY2Vqx5wMdDLqlKwCWpJgwPv8isdXxm9u2SMc+qCERv7WFt9JJXgTZdRE3TmQkaJoNrV+GB4y0xk3XQ9nkni/lxznSfkGvOeLK5T/RNY78dgTLjWXdsqKaHM0b3Hz+O7taBDFeuMHjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776691976; c=relaxed/simple;
	bh=IvUJlCETznTSwrL5b6NPiJOnk6Dh5DSfa4g9BCnzE1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=orq4RPL5d/2+NIVqj25fi1JJy/MzlvpM6SLPsBw2Kmg4GAMHosomcpj3+yd1xvEpVu9p+Wfnn6sm8H0l5GjICb0UKOSD+GFapFw3rCJkr51c4x6Dh0XW40VKeQ4j3bar5MjVnl8xcMEWj6C5tjQOutuUNZ1RQhrypIhrz4xBMGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uEkm3Uxd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23A7CC2BCB6;
	Mon, 20 Apr 2026 13:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776691976;
	bh=IvUJlCETznTSwrL5b6NPiJOnk6Dh5DSfa4g9BCnzE1A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uEkm3UxdHqPoRFLbSItgtqzKDxAQlmzreXCahsO2WcYyf9zpWD/xdlnMA/T8oI8t6
	 QMhD1BvCn7zX1/Fk+8zO/CeiQyo4zvBTKI31eX5N3uLap2Z88kZKX4nY/48tztxiLR
	 EN3DtuvtN5uFCcUT0Ii4J83gH8FH+ULpCBeLUHLPgkzWbnRCWDRd0jbODdLxhvmU61
	 glKU7pGTTrfxq1iMyY5AOuiyswOgyyY2tITINUyajpvsWEZ8qWn88e6TvGrzjfIBcQ
	 LT5GC/9OVtClpwZ2GwcCIpM5TArjvaaCbSpfGGPZ5gZfe7NNpmRbrqNTw58vdvwml1
	 zCh+TigEdzEkg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Chen Ni <nichen@iscas.ac.cn>,
	=?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 7.0-6.1] media: i2c: ar0521: Check return value of devm_gpiod_get_optional() in ar0521_probe()
Date: Mon, 20 Apr 2026 09:21:35 -0400
Message-ID: <20260420132314.1023554-301-sashal@kernel.org>
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
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-59156-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,huawei];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 3AC1142E3DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Chen Ni <nichen@iscas.ac.cn>

[ Upstream commit 46c2891cf12c767de031a248cbb1f96d203bd3f6 ]

The devm_gpiod_get_optional() function may return an error pointer
(ERR_PTR) in case of a genuine failure during GPIO acquisition, not just
NULL which indicates the legitimate absence of an optional GPIO.

Add an IS_ERR() check after the function call to catch such errors and
propagate them to the probe function, ensuring the driver fails to load
safely rather than proceeding with an invalid pointer.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
Acked-by: Krzysztof Hałasa <khalasa@piap.pl>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Now I have all the information I need. Let me compile my full analysis.

---

## PHASE 1: COMMIT MESSAGE FORENSICS

### Step 1.1: Subject Line
- **Subsystem:** `media: i2c: ar0521`
- **Action verb:** "Check" (return value) — indicates adding a missing
  safety check
- **Summary:** Add IS_ERR() check for devm_gpiod_get_optional() in the
  probe function

Record: [media: i2c: ar0521] [Check/Add missing check] [Adds missing
error check for optional GPIO acquisition]

### Step 1.2: Tags
- **Signed-off-by:** Chen Ni (author), Sakari Ailus (media maintainer),
  Mauro Carvalho Chehab (media subsystem maintainer)
- **Acked-by:** Krzysztof Hałasa (original driver author)
- No Fixes: tag (expected for this review pipeline)
- No Reported-by: (proactive fix, not responding to a report)
- No Link: to lore thread
- No Cc: stable

Record: Acked by original driver author. Merged through standard media
maintainer chain (Sakari -> Mauro). No syzbot, no external report.

### Step 1.3: Commit Body
The message explains that `devm_gpiod_get_optional()` can return ERR_PTR
on genuine failure, not just NULL. Without the check, the driver
proceeds with an invalid pointer.

Record: Bug is a missing error check. Symptom would be driver proceeding
with invalid pointer. No version info given. Root cause: original driver
never checked for ERR_PTR.

### Step 1.4: Hidden Bug Fix Detection
Yes, this is a genuine bug fix — "Add an IS_ERR() check" is clearly
adding a missing safety check to prevent operating on an invalid
pointer. The pattern of "missing error check on devm_* return" is a
well-known kernel bug category.

Record: [Genuine bug fix — adds missing error check]

## PHASE 2: DIFF ANALYSIS

### Step 2.1: Inventory
- **Files changed:** 1 file (`drivers/media/i2c/ar0521.c`)
- **Lines added:** 3
- **Lines removed:** 0
- **Function modified:** `ar0521_probe()`
- **Scope:** Single-file, surgical, 3-line addition

Record: [1 file, +3/-0, ar0521_probe() only, minimal scope]

### Step 2.2: Code Flow Change
**Before:** `devm_gpiod_get_optional()` result is stored directly in
`sensor->reset_gpio` with no validation. If it returns ERR_PTR, the
invalid pointer is stored and the driver continues probe.

**After:** An IS_ERR() check is added. If the GPIO call fails,
`dev_err_probe()` logs the error and returns it (also handling
EPROBE_DEFER cleanly), stopping the probe.

Record: [Before: ERR_PTR stored unchecked -> After: ERR_PTR caught,
probe fails cleanly]

### Step 2.3: Bug Mechanism
Category: **Return value checking / NULL dereference prevention**. The
fix adds a missing error check. If `devm_gpiod_get_optional()` returns
ERR_PTR (e.g., -EPROBE_DEFER, -ENOMEM), the pointer is stored as
`reset_gpio`. Later, when `if (sensor->reset_gpio)` evaluates as true
(ERR_PTR is non-NULL), `gpiod_set_value_cansleep()` is called with the
invalid pointer.

However, I verified that `gpiod_set_value_cansleep()` uses
`VALIDATE_DESC()` which calls `validate_desc()`:

```377:388:drivers/gpio/gpiolib.c
static int validate_desc(const struct gpio_desc *desc, const char *func)
{
        if (!desc)
                return 0;
        if (IS_ERR(desc)) {
                pr_warn("%s: invalid GPIO (errorpointer: %pe)\n", func,
desc);
                return PTR_ERR(desc);
        }
        return 1;
}
```

So gpiolib handles ERR_PTR gracefully: it prints a warning and returns
without crashing. The actual impact is:
1. **EPROBE_DEFER not propagated** — if GPIO provider loads after this
   driver, the probe doesn't get deferred and retried, which is the most
   impactful scenario
2. **Warning spam** — `pr_warn` every time the GPIO is accessed
3. **Reset line not toggled** — sensor may not initialize properly

Record: [Missing return value check] [ERR_PTR stored, not crash but
EPROBE_DEFER lost, warnings printed, GPIO operations silently fail]

### Step 2.4: Fix Quality
- **Obviously correct:** Yes — follows the exact same pattern used for
  `sensor->extclk` just above in the same function
- **Minimal:** Yes — 3 lines, surgically placed
- **Regression risk:** Essentially zero — only affects error cases
- **Uses `dev_err_probe()`:** Properly handles EPROBE_DEFER logging

Record: [Obviously correct, minimal, near-zero regression risk]

## PHASE 3: GIT HISTORY INVESTIGATION

### Step 3.1: Blame
`git blame` shows the buggy code (lines 1094-1096) was introduced in
commit `852b50aeed153b` ("media: On Semi AR0521 sensor driver") by
Krzysztof Hałasa, which was the initial driver addition. This commit
first appeared in v6.0-rc1.

Record: [Bug introduced by 852b50aeed153b in v6.0-rc1, the initial
driver commit]

### Step 3.2: Fixes Tag
No Fixes: tag present. The correct Fixes: target would be
`852b50aeed153b`.

Record: [N/A — no Fixes: tag, but the target would be 852b50aeed153b
(v6.0)]

### Step 3.3: File History
Recent history shows 8 changes between v6.6 and HEAD; 2 changes since
v6.12. The file has moderate churn but the specific GPIO code has been
unchanged since the initial driver commit.

Record: [Moderate file churn, but the specific buggy code unchanged
since v6.0. Standalone fix.]

### Step 3.4: Author
Chen Ni (`nichen@iscas.ac.cn`) is a prolific submitter of mechanical
bug-fix patches (missing error checks). Two other similar patches for
the exact same pattern are in this tree (for `adin1110` and `max98390`).
This is a systematic cleanup effort.

Record: [Prolific mechanical fix author, not subsystem maintainer, but
patch was acked by driver author]

### Step 3.5: Dependencies
No dependencies. The fix applies cleanly to any tree that has the ar0521
driver (v6.0+). The code context is unchanged since the initial driver
commit.

Record: [No dependencies, standalone fix, should apply cleanly to all
stable trees ≥ v6.0]

## PHASE 4: MAILING LIST AND EXTERNAL RESEARCH

### Step 4.1: Original Discussion
Web search found the patch was discussed on linux-media. The original
driver author Krzysztof Hałasa acked it, noting a minor style preference
(all-caps "GPIO" in messages) but approving the fix.

Record: [Found on lore, acked by original author, no objections]

### Step 4.2: Reviewers
Acked by Krzysztof Hałasa (driver author), signed-off by Sakari Ailus
(media i2c maintainer) and Mauro Carvalho Chehab (media subsystem
maintainer). Proper review chain.

Record: [Full maintainer chain reviewed]

### Step 4.3: Bug Report
No external bug report — this is a proactive code audit fix.

Record: [No external report, proactive fix from code inspection]

### Step 4.4: Related Patches
This is one of a series of identical-pattern fixes by Chen Ni across
multiple drivers. Each is standalone.

Record: [Part of a systematic cleanup series, each patch independent]

### Step 4.5: Stable Discussion
No specific stable discussion found.

Record: [No stable-specific discussion]

## PHASE 5: CODE SEMANTIC ANALYSIS

### Step 5.1: Functions Modified
Only `ar0521_probe()` is modified.

### Step 5.2: Callers
`ar0521_probe()` is the I2C driver probe function, called during device
enumeration when a matching device is found. Called once per device.

### Step 5.3: Callees
After the fix point, the code proceeds to initialize
`v4l2_i2c_subdev_init`, media entity, regulators, controls, and power
on. The `reset_gpio` is later used in `__ar0521_power_off()` (line 844)
and `ar0521_power_on()` (line 888) via `gpiod_set_value_cansleep()`.

### Step 5.4: Call Chain
The buggy code is reachable during device probe (boot time or module
insertion). The `reset_gpio` ERR_PTR would be passed to
`gpiod_set_value_cansleep()` during power management operations.

Record: [Probe-time path, GPIO used during power on/off which happens at
stream start/stop]

### Step 5.5: Similar Patterns
The same pattern exists in many other drivers. Chen Ni has fixed at
least 2 others in this tree.

## PHASE 6: CROSS-REFERENCING AND STABLE TREE ANALYSIS

### Step 6.1: Buggy Code in Stable Trees
The ar0521 driver was added in v6.0-rc1. It exists in all stable trees
from 6.1 onward. The buggy code has been present since the driver's
inception and is unchanged.

Record: [Bug exists in stable trees 6.1.y, 6.6.y, 6.12.y]

### Step 6.2: Backport Complications
The fix should apply cleanly — the surrounding code context is unchanged
since the initial driver commit.

Record: [Clean apply expected]

### Step 6.3: Related Fixes Already in Stable
No related fix for this specific issue found in stable.

Record: [No related fix in stable]

## PHASE 7: SUBSYSTEM AND MAINTAINER CONTEXT

### Step 7.1: Subsystem Criticality
`drivers/media/i2c/` — camera sensor driver. Criticality: PERIPHERAL.
Affects users of AR0521 camera sensor hardware (industrial/embedded
vision systems primarily).

Record: [Media I2C sensor driver, PERIPHERAL criticality]

### Step 7.2: Subsystem Activity
Moderate activity in the file (8 changes since v6.6).

## PHASE 8: IMPACT AND RISK ASSESSMENT

### Step 8.1: Affected Users
Users of the ON Semiconductor AR0521 image sensor. This is an
industrial/embedded sensor. Limited but dedicated user base.

Record: [Driver-specific, embedded/industrial camera users]

### Step 8.2: Trigger Conditions
The bug triggers when `devm_gpiod_get_optional()` returns ERR_PTR, which
happens when:
- GPIO provider isn't ready yet (EPROBE_DEFER) — **most common scenario
  on device-tree platforms**
- GPIO subsystem returns error (ENOMEM, EINVAL, etc.) — less common

Record: [EPROBE_DEFER is the most likely trigger; common on embedded
platforms with probe ordering issues]

### Step 8.3: Failure Mode Severity
- **Not a crash** — gpiolib's `validate_desc()` handles ERR_PTR
  gracefully
- **EPROBE_DEFER swallowed** — driver doesn't retry probe, possibly
  leaving sensor non-functional
- **Warning messages** printed on every GPIO access
- Severity: **MEDIUM** — driver malfunction, not crash or data
  corruption

Record: [MEDIUM severity — driver may not work properly on some
platforms due to lost EPROBE_DEFER]

### Step 8.4: Risk-Benefit Ratio
- **Benefit:** Moderate — fixes a real coding error, proper EPROBE_DEFER
  handling, cleaner error reporting
- **Risk:** Very low — 3-line addition, only affects error paths,
  follows established pattern
- **Ratio:** Favorable — very low risk for moderate benefit

Record: [Moderate benefit, very low risk, favorable ratio]

## PHASE 9: FINAL SYNTHESIS

### Step 9.1: Evidence Compilation

**FOR backporting:**
- Fixes a real coding bug (missing error check on
  devm_gpiod_get_optional)
- 3-line fix, minimal and obviously correct
- Follows the same pattern already used in the same function for extclk
- Acked by original driver author
- EPROBE_DEFER case is a real-world scenario on embedded platforms
- Driver has been present since v6.0, affects all stable trees
- Uses `dev_err_probe()` which properly handles EPROBE_DEFER
- Clean apply expected

**AGAINST backporting:**
- No crash — gpiolib handles ERR_PTR gracefully via VALIDATE_DESC
- No user report or syzbot trigger
- Proactive fix from code audit, not a response to real failure
- PERIPHERAL subsystem (specific camera sensor)
- Medium severity at best (no crash, corruption, or security issue)

### Step 9.2: Stable Rules Checklist
1. Obviously correct and tested? **Yes** — acked by driver author,
   merged through proper maintainer chain
2. Fixes a real bug? **Yes** — missing error check causes EPROBE_DEFER
   loss and invalid pointer storage
3. Important issue? **Borderline** — not a crash/security/corruption,
   but driver non-functionality on some platforms
4. Small and contained? **Yes** — 3 lines, single file, single function
5. No new features or APIs? **Correct** — pure fix
6. Can apply to stable? **Yes** — should apply cleanly to all trees with
   this driver

### Step 9.3: Exception Categories
Not an exception category (not a device ID, quirk, DT, build fix, or doc
fix).

### Step 9.4: Decision
This is a borderline case. The fix is trivially correct and very low
risk, but the actual impact is moderate — the gpiolib protects against a
crash, so the consequence is a non-functional driver on platforms where
GPIO probe ordering matters (EPROBE_DEFER). The EPROBE_DEFER case is
real on embedded/device-tree platforms. Given the near-zero risk and the
real (if moderate) benefit, this leans YES.

## Verification

- [Phase 1] Parsed tags: Acked-by from original driver author Krzysztof
  Hałasa, merged through Sakari Ailus and Mauro Carvalho Chehab
- [Phase 2] Diff analysis: 3 lines added to ar0521_probe(), adds IS_ERR
  check + dev_err_probe return after devm_gpiod_get_optional()
- [Phase 3] git blame: buggy code introduced in commit 852b50aeed153b
  (v6.0-rc1), the initial driver commit
- [Phase 3] git describe: confirmed 852b50aeed153b is in v6.0-rc1
- [Phase 3] git log: verified ar0521.c exists in stable trees from v6.1
  onward, specific GPIO code unchanged
- [Phase 4] WebSearch: found lore thread, Krzysztof Hałasa acked the
  patch with minor style note
- [Phase 4] b4 dig on similar commit (a1d14d8364eac): confirmed Chen
  Ni's mechanical fix pattern
- [Phase 5] Grep: traced reset_gpio usage to __ar0521_power_off() (line
  844) and ar0521_power_on() (line 888), both call
  gpiod_set_value_cansleep() guarded by `if (sensor->reset_gpio)`
- [Phase 5] Grep: verified gpiod_set_value_cansleep() uses VALIDATE_DESC
  which calls validate_desc(), which handles ERR_PTR with pr_warn and
  early return (no crash)
- [Phase 6] Code exists in stable trees v6.1.y, v6.6.y, v6.12.y; buggy
  code unchanged since initial commit
- [Phase 8] Failure mode: NOT a crash (gpiolib handles ERR_PTR), but
  EPROBE_DEFER is swallowed and driver may not work. Severity: MEDIUM
- UNVERIFIED: Could not access lore.kernel.org directly (Anubis
  protection), relied on web search summary for discussion details

**YES**

 drivers/media/i2c/ar0521.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
index f156058500e3d..ed324c2d87aa2 100644
--- a/drivers/media/i2c/ar0521.c
+++ b/drivers/media/i2c/ar0521.c
@@ -1094,6 +1094,9 @@ static int ar0521_probe(struct i2c_client *client)
 	/* Request optional reset pin (usually active low) and assert it */
 	sensor->reset_gpio = devm_gpiod_get_optional(dev, "reset",
 						     GPIOD_OUT_HIGH);
+	if (IS_ERR(sensor->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(sensor->reset_gpio),
+				     "failed to get reset gpio\n");
 
 	v4l2_i2c_subdev_init(&sensor->sd, client, &ar0521_subdev_ops);
 
-- 
2.53.0


