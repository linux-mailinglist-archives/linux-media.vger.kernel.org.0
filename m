Return-Path: <linux-media+bounces-45547-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6B1C093EA
	for <lists+linux-media@lfdr.de>; Sat, 25 Oct 2025 18:15:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D894189E89B
	for <lists+linux-media@lfdr.de>; Sat, 25 Oct 2025 16:13:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE963303A0E;
	Sat, 25 Oct 2025 16:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="imxlmeIk"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E192FF168;
	Sat, 25 Oct 2025 16:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761408725; cv=none; b=Ce77XRH9FBoSXHB0diqyv1YW9CrKeFHK/KoVPhmi2s9H1aDCuMzjwTkJ5bx2JngPDM4eF/LLdL3EIi7IOgrPWZBGs/a2lyq1Q3eXhC94iSs25/3Uu3Wi7PjAdKuVu5iMDyou2ySyewP4I3iCGxkMVtOYo7YPHGQCR5cq/w1iEiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761408725; c=relaxed/simple;
	bh=JlEQJWHGmaGrcwOo1WVQA5/NAEd98onIIlKymUC1R80=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zeb8muLjuYrLMET1Fr8ZTQBH2deDa1TrcU/VoRxhmMPiUJ6hhMS17JgYF7U5TcimM0+z4udSnlRnY3AAoCooGtGK+DOBl6W4SJvU58+1W/zIHO0cP8cnumujmxlL4IgNL9x7BoX2GtQ/FJuzl1GMuUZYMOfse2O76OFaJQGh9y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=imxlmeIk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 473B2C4CEF5;
	Sat, 25 Oct 2025 16:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761408725;
	bh=JlEQJWHGmaGrcwOo1WVQA5/NAEd98onIIlKymUC1R80=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=imxlmeIkL2s8eZIc2of2iJxRZtThpuU012lCeR4v1ZDGibA3NwTTgcf/1g2RkRCyX
	 ioGYdXF5rQm78feD4YhUqL4IqzM0qq7Owh98G784eU3mCf/oi9ljvRxpN971UbCAgm
	 JF5LLNaPbuIYrRLpfbP6LoszuhO4sm54fqpClbexNtxUPZKDPV2T4J+pSu72kb1zr4
	 D9hCbZoDsu0q8bPDQer9HO301nWDBVKpxoF4RViHO0MwZ20qrp+6hEcO3HHik7MA+v
	 hWOGn+cjcGLoEx1JYJfyfBbFeFUmiqrTNYRCDxD+6JZyP5YBbXXEZZCioJdse6NN0/
	 MphLrqZyn0ItA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	lars@metafoo.de,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.17-5.15] media: adv7180: Only validate format in querystd
Date: Sat, 25 Oct 2025 11:54:46 -0400
Message-ID: <20251025160905.3857885-55-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Transfer-Encoding: 8bit

From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

[ Upstream commit 91c5d7c849273d14bc4bae1b92666bdb5409294a ]

The .querystd callback should not program the device with the detected
standard, it should only report the standard to user-space. User-space
may then use .s_std to set the standard, if it wants to use it.

All that is required of .querystd is to setup the auto detection of
standards and report its findings.

While at it add some documentation on why this can't happen while
streaming and improve the error handling using a scoped guard.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

- What it fixes
  - Removes unintended device reprogramming in `.querystd`: Previously,
    after enabling autodetection and sampling, the code reprogrammed the
    decoder using the configured `curr_norm` instead of leaving hardware
    untouched. If userspace had never called `.s_std`, `curr_norm`
    defaults to NTSC (drivers/media/i2c/adv7180.c:1463), so a simple
    `.querystd` could force NTSC regardless of the detected standard.
    The new code stops doing that and only reports the detected
    standard.
  - Aligns with V4L2 semantics: `.querystd` should detect and report,
    not change the active standard. Userspace can call `.s_std` to set
    it.

- Key code changes
  - adv7180_querystd only sets autodetect, waits, and reports the
    detected standard:
    - Sets autodetect: drivers/media/i2c/adv7180.c:388
    - Returns detection result directly: drivers/media/i2c/adv7180.c:388
    - Adds clear rationale comment about not running during streaming
      since it touches VID_SEL: drivers/media/i2c/adv7180.c:388
  - Removes the reprogramming step via
    `v4l2_std_to_adv7180(state->curr_norm)` and the second
    `adv7180_set_video_standard(...)` (these were in the old body and
    are now gone), eliminating side effects of `.querystd`.
  - Improves error handling and robustness by using a scoped guard for
    the mutex (auto-unlock on all paths) and by returning the result of
    `__adv7180_status()` instead of ignoring it
    (drivers/media/i2c/adv7180.c:388).

- Why it’s safe and minimal
  - Localized change: confined to `adv7180_querystd` only
    (drivers/media/i2c/adv7180.c:388).
  - No ABI or architectural changes; just corrects behavior to be read-
    only.
  - Streaming safety preserved: returns `-EBUSY` while streaming to
    avoid touching VID_SEL mid-capture
    (drivers/media/i2c/adv7180.c:388).
  - Consistent control flow: `.s_std` now only validates and stores the
    intended standard in `curr_norm` (drivers/media/i2c/adv7180.c:463),
    and actual programming is done at stream start via
    `adv7180_program_std()` (drivers/media/i2c/adv7180.c:449) called by
    initialization/streaming code paths. Leaving the device in
    autodetect after `.querystd` does not affect users because streaming
    is off (enforced by `-EBUSY`) and streaming will reprogram from
    `curr_norm` anyway.

- User-visible impact addressed
  - Prevents `.querystd` from changing hardware state (e.g., enforcing
    NTSC because `curr_norm` defaults to NTSC at probe:
    drivers/media/i2c/adv7180.c:1463), which could break subsequent
    expectations if userspace hasn’t explicitly called `.s_std`.

- Backport considerations
  - The `guard(mutex)` scoped guard may not exist in older stable
    series. That’s trivial to adapt to explicit
    `mutex_lock_interruptible()`/`mutex_unlock()` with identical
    behavior. No other dependencies or refactors are required.

- Subsystem and risk profile
  - Touches a single V4L2 i2c decoder driver; small, self-contained
    change with clear behavioral bugfix and minimal regression risk.
  - Follows stable rules: bugfix, no new features, no architectural
    churn, and limited scope.

Given these points, this is a good candidate for stable backporting.

 drivers/media/i2c/adv7180.c | 37 ++++++++++++++++---------------------
 1 file changed, 16 insertions(+), 21 deletions(-)

diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
index 8100fe6b0f1d4..5accf3020e076 100644
--- a/drivers/media/i2c/adv7180.c
+++ b/drivers/media/i2c/adv7180.c
@@ -357,32 +357,27 @@ static inline struct adv7180_state *to_state(struct v4l2_subdev *sd)
 static int adv7180_querystd(struct v4l2_subdev *sd, v4l2_std_id *std)
 {
 	struct adv7180_state *state = to_state(sd);
-	int err = mutex_lock_interruptible(&state->mutex);
-	if (err)
-		return err;
-
-	if (state->streaming) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	int ret;
 
-	err = adv7180_set_video_standard(state,
-			ADV7180_STD_AD_PAL_BG_NTSC_J_SECAM);
-	if (err)
-		goto unlock;
+	guard(mutex)(&state->mutex);
 
-	msleep(100);
-	__adv7180_status(state, NULL, std);
+	/*
+	 * We can't sample the standard if the device is streaming as that would
+	 * interfere with the capture session as the VID_SEL reg is touched.
+	 */
+	if (state->streaming)
+		return -EBUSY;
 
-	err = v4l2_std_to_adv7180(state->curr_norm);
-	if (err < 0)
-		goto unlock;
+	/* Set the standard to autodetect PAL B/G/H/I/D, NTSC J or SECAM */
+	ret = adv7180_set_video_standard(state,
+					 ADV7180_STD_AD_PAL_BG_NTSC_J_SECAM);
+	if (ret)
+		return ret;
 
-	err = adv7180_set_video_standard(state, err);
+	/* Allow some time for the autodetection to run. */
+	msleep(100);
 
-unlock:
-	mutex_unlock(&state->mutex);
-	return err;
+	return __adv7180_status(state, NULL, std);
 }
 
 static int adv7180_s_routing(struct v4l2_subdev *sd, u32 input,
-- 
2.51.0


