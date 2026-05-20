Return-Path: <linux-media+bounces-62243-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cALcEFGbDWoS0AUAu9opvQ
	(envelope-from <linux-media+bounces-62243-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 13:30:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB8B58C78E
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 13:30:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B417F319B0E2
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 11:24:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A9823ED121;
	Wed, 20 May 2026 11:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DqWkldPq"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B62439D6E2;
	Wed, 20 May 2026 11:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779276028; cv=none; b=XyN9OynOtjo6DIyWmVPmFnFnRIHX5AJt8CX4pLEYZASsKQjJDeZh+DIDKi7NXtWioeJngwhDE0thzrFKABeB6gwVbx8AVi3HD2c73UYXyYyNAf3ZCCD3Jg2WM7ImmV/Ibb/b5tgxYKBy3LdFEydwpM8HR5SERBknp0jinfZVKVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779276028; c=relaxed/simple;
	bh=LRN2672r35IyVec++JGBaiETnqJv8Sk5nTuKiSNxa8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sjLne0DAi5kl+hOA4Va5GNYlp15QgzzL+m3pe+Ykmwc2ruJg/J0GoaUm54eN+wge1FRex/ghKmNHrBE+SMdjFCP1cXFhxwmrtBAGsH7ws8x0ak7Bu7OJTRf+8gsGh4ft0J/IguOR0vbsJtxtbKCqZZJpC8bmY2HFRI8Tr6sBBfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DqWkldPq; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D6EE1F00897;
	Wed, 20 May 2026 11:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779276026;
	bh=Awnos86qn1nOZLrjiQeDKSX5qCUuZjhkaj+6eONAsSQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DqWkldPqCO9shgs18fFncUaZJppA0Hy5/IivQGaN+7SsYDBo5wxCa1hiyX6Eo7CxM
	 HmaIOco1eTf6/cOq9kbtZrntWqCAYcN+TA8rBLCDQ3cnKFnWEZUYBXJb2OK6ZAmxCW
	 WaPG/a31nc2CYWzgsTq0fNzna+Q6y/D8VwEvOK1rMZz/GoZmccFBaVB5foSdRBWZSE
	 vTfbHRf14Cpe/OOc0ZySNe6KHMXMThqlTPFtcXVfzPupChiSRASusS4ydX7pGRzkM4
	 t2wu6GRtpwiGwTxNCFnyd+RacghFG9yOJy/XPn+U7ea2gjZpQTO9gMioPUXdgPtOOT
	 uHAMTFhCD4GNw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	rfoss@kernel.org,
	todor.too@gmail.com,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 7.0-6.12] media: qcom: camss: avoid format string warning
Date: Wed, 20 May 2026 07:19:01 -0400
Message-ID: <20260520111944.3424570-29-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260520111944.3424570-1-sashal@kernel.org>
References: <20260520111944.3424570-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 7.0.9
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62243-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[arndb.de,linaro.org,kernel.org,gmail.com,vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,msgid.link:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 9DB8B58C78E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Arnd Bergmann <arnd@arndb.de>

[ Upstream commit 23c39cb598977f10909a2387c5e5f34afc1d6933 ]

clang-22 warns about csiphy_match_clock_name() taking a variable format
string that is not checked against the 'int index' argument:

drivers/media/platform/qcom/camss/camss-csiphy.c:566:44: error: diagnostic behavior may be improved by
      adding the 'format(printf, 2, 3)' attribute to the declaration of 'csiphy_match_clock_name'
      [-Werror,-Wmissing-format-attribute]
  561 | static bool csiphy_match_clock_name(const char *clock_name, const char *format,
      | __attribute__((format(printf, 2, 3)))
  562 |                                     int index)
  563 | {
  564 |         char name[16]; /* csiphyXXX_timer\0 */
  565 |
  566 |         snprintf(name, sizeof(name), format, index);
      |                                                   ^
drivers/media/platform/qcom/camss/camss-csiphy.c:561:13: note: 'csiphy_match_clock_name' declared here
  561 | static bool csiphy_match_clock_name(const char *clock_name, const char *format,
      |             ^

Change the function to use a snprintf() style format string that allows this
to be checked at the call site.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

## Phase Walkthrough

### Phase 1: Commit Message Forensics
Step 1.1 Record: Subsystem is `media: qcom: camss`; action verb is
`avoid`; claimed intent is to avoid a clang-22 format-string build
warning/error in `csiphy_match_clock_name()`.

Step 1.2 Record: Verified fetched commit
`2211e826bd69c041534093735241182013dde7bc` has:
- `Signed-off-by: Arnd Bergmann <arnd@arndb.de>`
- `Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>`
- `Signed-off-by: Bryan O'Donoghue <bod@kernel.org>`

The original lore submission also has `Fixes: 0727615fb975 ("media:
qcom: camss: Functionally decompose CSIPHY clock lookups")`. No
`Reported-by`, `Tested-by`, `Cc: stable`, or bug-report `Link` was
verified.

Step 1.3 Record: The body describes a clang-22 diagnostic promoted to
error: `[-Werror,-Wmissing-format-attribute]`. The root cause is that
`csiphy_match_clock_name()` takes a `const char *format` and passes it
to `snprintf()` with a fixed `int index`, but the helper itself lacks a
checkable printf-style prototype.

Step 1.4 Record: This is not a hidden runtime bug fix. It is a build-
warning/build-error fix for newer clang plus warning-as-error
configurations.

### Phase 2: Diff Analysis
Step 2.1 Record: One file changed:
`drivers/media/platform/qcom/camss/camss-csiphy.c`, `7 insertions(+), 3
deletions(-)`. One function modified: `csiphy_match_clock_name()`. Scope
is single-file surgical.

Step 2.2 Record: Before, the helper accepted `format, int index` and
called `snprintf(name, sizeof(name), format, index)`. After, it is
declared `__printf(2, 3)`, accepts varargs, uses `va_start()`,
`vsnprintf()`, and `va_end()`. Call sites remain unchanged.

Step 2.3 Record: Bug category is build fix / compiler diagnostic fix. It
does not fix memory safety, locking, refcounting, or runtime logic.

Step 2.4 Record: The fix is mechanically correct and minimal. Existing
callers pass literal format strings plus `csiphy->id`, so behavior is
preserved while allowing compiler format checking. Regression risk is
very low; the only meaningful risk is varargs misuse, but current call
sites were verified unchanged and simple.

### Phase 3: Git History Investigation
Step 3.1 Record: `git blame` shows the helper body was introduced by
`0727615fb975f6`, authored by Bryan O'Donoghue on 2023-09-25. `git
describe --contains` places it at `v6.7-rc1~51^2~149`.

Step 3.2 Record: The final fetched commit lacks a `Fixes:` trailer, but
the original lore submission includes `Fixes: 0727615fb975`. I inspected
that commit; it introduced the helper and the `snprintf(..., format,
index)` pattern.

Step 3.3 Record: Recent file history includes later CAMSS/CSIPHY
changes, especially `74cae7794341` changing callers to use `csiphy->id`.
No prerequisite for this format-warning fix was found beyond the helper
existing.

Step 3.4 Record: Arnd Bergmann has prior CAMSS build/undefined-behavior
fixes in history. Bryan O'Donoghue, who reviewed the patch, is listed as
a CAMSS maintainer in `MAINTAINERS`.

Step 3.5 Record: No dependent commits were found. The patch only needs
the existing helper and kernel `__printf`/`va_list` support, both
present in the checked tree.

### Phase 4: Mailing List And External Research
Step 4.1 Record: `b4 dig -c 2211e826...` found the original patch at
`https://patch.msgid.link/20260320151828.3456863-1-arnd@kernel.org`. `b4
dig -a` found only v1.

Step 4.2 Record: `b4 dig -w` shows relevant maintainers/lists were
included: CAMSS maintainers, media maintainers, `linux-media`, `linux-
arm-msm`, `linux-kernel`, and `llvm`.

Step 4.3 Record: No separate bug report was present. The concrete report
is the compiler diagnostic embedded in the patch.

Step 4.4 Record: This is a standalone one-patch fix, not part of a
multi-patch series.

Step 4.5 Record: Direct lore stable search was blocked by Anubis; web
search did not find stable-specific discussion for this exact patch.

### Phase 5: Code Semantic Analysis
Step 5.1 Record: Modified function: `csiphy_match_clock_name()`.

Step 5.2 Record: Callers are only within `msm_csiphy_subdev_init()`, at
the three verified clock-name checks: `"csiphy%d_timer"`, `"csi%d_phy"`,
and `"csiphy%d"`.

Step 5.3 Record: The helper calls formatting and string comparison
functions: previously `snprintf()` and `strcmp()`, after patch
`vsnprintf()` and `strcmp()`.

Step 5.4 Record: The affected path is CAMSS device probe:
`camss_probe()` calls `camss_init_subdevices()`, which calls
`msm_csiphy_subdev_init()`. Runtime behavior remains equivalent for the
verified call sites.

Step 5.5 Record: Nearby CAMSS code has no other `const char *format`
helper or `vsnprintf()`/`__printf()` pattern matching this issue.

### Phase 6: Stable Tree Analysis
Step 6.1 Record: The buggy helper exists from `v6.7` onward. Verified
absent in `v6.6`, present in `v6.12`, and present in `v7.0`.

Step 6.2 Record: `git apply --check` succeeds against the current
`7.0.5` checkout. For `v6.12`, the same helper and `snprintf(name,
sizeof(name), format, index)` pattern are present, but I did not run a
separate worktree apply check.

Step 6.3 Record: No related stable-specific fix for this exact CAMSS
warning was found in local targeted searches or public web search.

### Phase 7: Subsystem Context
Step 7.1 Record: Subsystem is Qualcomm CAMSS media driver under
`drivers/media/platform/qcom/camss/`. Criticality is peripheral/driver-
specific, but build failures affect anyone building this driver or
COMPILE_TEST coverage.

Step 7.2 Record: CAMSS is actively developed; recent history shows many
CAMSS commits, including fixes and new platform support.

### Phase 8: Impact And Risk
Step 8.1 Record: Affected population is config-specific: builders with
`CONFIG_VIDEO_QCOM_CAMSS`, including `COMPILE_TEST`, using clang-22 with
`-Wmissing-format-attribute` and warnings-as-errors.

Step 8.2 Record: Trigger is build-time, not runtime.
`scripts/Makefile.warn` verifies `-Wmissing-format-attribute` is under
`W=1`; `-Werror` is enabled by `W=e` or `CONFIG_WERROR`.

Step 8.3 Record: Failure mode is build failure, not
crash/corruption/security. Severity is medium, but build fixes are an
accepted stable exception.

Step 8.4 Record: Benefit is moderate: keeps affected stable builds
working with newer clang warning behavior. Risk is very low: 10-line
single-function mechanical change, no API change, call sites unchanged.

### Phase 9: Final Synthesis
Evidence for backporting:
- Real build failure mode documented in commit and lore.
- Fits stable build-fix exception.
- Very small, contained, reviewed by CAMSS maintainer.
- Applies cleanly to current `7.0.5`; buggy code exists in `v6.12+` and
  `v7.0`.

Evidence against backporting:
- Not a runtime correctness, crash, data corruption, or security fix.
- Trigger requires specific compiler/warning-as-error build settings.
- Not relevant to `v6.6` and older because the helper is absent there.

Stable rules checklist:
1. Obviously correct and tested: yes for code review/readability; no
   local clang-22 build reproduction.
2. Fixes a real bug: yes, a verified build diagnostic/error path.
3. Important issue: medium; build failure, not runtime failure.
4. Small and contained: yes, one function, one file, 7+/3-.
5. No new feature/API: yes.
6. Can apply to stable: verified for current `7.0.5`; likely
   straightforward for `v6.12+`, not applicable to `v6.6` and older.

Exception category: Build fix.

## Verification
- Phase 1: `git show` verified candidate commit metadata and exact diff
  for `2211e826bd69...`.
- Phase 2: `git diff --shortstat` verified `1 file changed, 7
  insertions(+), 3 deletions(-)`.
- Phase 3: `git blame` verified helper introduced by `0727615fb975`;
  `git show` inspected that commit.
- Phase 3/6: `git describe --contains` and tag containment checks
  verified introduction in `v6.7`, presence in `v6.12+`, absence from
  `v6.6`.
- Phase 4: `b4 dig`, `b4 dig -a`, `b4 dig -w`, and saved mbox verified
  original lore thread, v1-only series, recipients, `Fixes:` trailer,
  and Bryan’s review.
- Phase 5: `rg` and file reads verified call sites and probe call chain.
- Phase 6: `git apply --check` verified clean apply to current `7.0.5`.
- Phase 7: `MAINTAINERS` verified Bryan O'Donoghue is a CAMSS
  maintainer.
- Phase 8: `scripts/Makefile.warn` verified when `-Wmissing-format-
  attribute` and `-Werror` are enabled.
- UNVERIFIED: I did not reproduce the clang-22 build failure locally.
- UNVERIFIED: I did not perform an actual `git apply --check` in a
  separate `v6.12` worktree.

This is stable-worthy as a low-risk build fix for stable trees that
contain the helper, especially `v6.12+`/`v7.0` era trees, and should be
skipped for older trees where the code does not exist.

**YES**

 drivers/media/platform/qcom/camss/camss-csiphy.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index 62623393f4144..78a1b568dbae6 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -558,12 +558,16 @@ static int csiphy_init_formats(struct v4l2_subdev *sd,
 	return csiphy_set_format(sd, fh ? fh->state : NULL, &format);
 }
 
-static bool csiphy_match_clock_name(const char *clock_name, const char *format,
-				    int index)
+static bool __printf(2, 3)
+csiphy_match_clock_name(const char *clock_name, const char *format, ...)
 {
 	char name[16]; /* csiphyXXX_timer\0 */
+	va_list args;
+
+	va_start(args, format);
+	vsnprintf(name, sizeof(name), format, args);
+	va_end(args);
 
-	snprintf(name, sizeof(name), format, index);
 	return !strcmp(clock_name, name);
 }
 
-- 
2.53.0


