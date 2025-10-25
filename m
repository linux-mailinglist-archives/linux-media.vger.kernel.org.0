Return-Path: <linux-media+bounces-45556-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C7285C0992F
	for <lists+linux-media@lfdr.de>; Sat, 25 Oct 2025 18:37:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13B943BFE35
	for <lists+linux-media@lfdr.de>; Sat, 25 Oct 2025 16:29:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5951630C628;
	Sat, 25 Oct 2025 16:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dcRAZTAZ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B298E30148D;
	Sat, 25 Oct 2025 16:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761409383; cv=none; b=fteJtisDjN0aavcYGvrXHVYbXkq0as25k9RIs2ZMLqWvRZrQx+vT8An3i3dMVGIg5deOes/KAT1Y7V4aMKbCMdEunAmmKYsPfNbhZ6XKaPUcnVnn1vcpLPQEqg2FRLQ7PrQAZtKdpPF1bUIXRj3PAb01OH28ntkZFnpkK/PcRtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761409383; c=relaxed/simple;
	bh=/eMEpdDt6AQ/dFpZTPlpt3W+VQN5MZlG/maBZ89HImY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LCHS+fj8t8W6KD1i4kMmb2lXoLD+THsF46m12SI66Ac8VjI/5/VcI3LYvfQV9ppdenEQ0NTa11sU/GKOCy3ItMW1TQSUxaeWhyUL5E3qHL4m5sm7ANSoYcIl/4ED7hVf4EahYPPKyOBUccLJpu3u0iMF9LjE64Pa1tW5AdWiHBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dcRAZTAZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E1DAC4CEFF;
	Sat, 25 Oct 2025 16:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761409383;
	bh=/eMEpdDt6AQ/dFpZTPlpt3W+VQN5MZlG/maBZ89HImY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dcRAZTAZneJ0H2CNQOfcW8JRnadj50Z15Klu7HFuT3Tpu4zdN15JSYSeVFr8MOqko
	 e8l0XWg+ZGXmLqrSt4cqzX7nFWTWZC8Nj26T7rJIzXH05jiC7BwoP2Q00e/l1OC/FS
	 udy+9Ui/ZqLNAybOPJOFZL8ZUVHzvGqOSzaRsWBZOuYrVy4xtTZDEQ/xA8OM/bYrqA
	 tuRykEt2WP/5Ip/C8zN8KyPEjgw3nlGHT9Y05CNNgEXFcdANy4NTE9aMsVucXB2oKr
	 ZcHMWPeg1Bww5Y10O+OAft9tzYv5GFOXMej+MTKQRFTAQ/gQhfNCSfVI2KIjWBjBCC
	 DSbLqaIeuDYfQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	lars@metafoo.de,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.17-5.15] media: adv7180: Add missing lock in suspend callback
Date: Sat, 25 Oct 2025 11:58:49 -0400
Message-ID: <20251025160905.3857885-298-sashal@kernel.org>
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

[ Upstream commit 878c496ac5080f94a93a9216a8f70cfd67ace8c9 ]

The adv7180_set_power() utilizes adv7180_write() which in turn requires
the state mutex to be held, take it before calling adv7180_set_power()
to avoid tripping a lockdep_assert_held().

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

- Bug fixed: adv7180_set_power() calls adv7180_write(), which asserts
  the device mutex must be held. See the assertion in
  `drivers/media/i2c/adv7180.c:246`
  (`lockdep_assert_held(&state->mutex)`) and the write from
  adv7180_set_power() in `drivers/media/i2c/adv7180.c:286`. Without
  holding the mutex, callers can trip lockdep and risk racy register
  writes.
- Missing lock covered in suspend: The change adds
  `guard(mutex)(&state->mutex);` before powering down in the PM suspend
  callback, ensuring the lockdep requirement is satisfied when calling
  adv7180_set_power(false). In this tree that guard is present at
  `drivers/media/i2c/adv7180.c:1555`, matching the intent of the commit
  you’re evaluating.
- Missing lock covered in resume: Similarly, the resume path takes the
  mutex before calling adv7180_set_power() to restore power state. In
  this tree that guard is present at `drivers/media/i2c/adv7180.c:1566`.
  This avoids unprotected register writes during resume, when
  concurrency is common.
- Missing lock in set_pad_format when changing field: The diff also adds
  the mutex guard around the active-format case where `state->field`
  changes and the code power-cycles the device and calls
  adv7180_set_field_mode(). Since that sequence invokes
  adv7180_set_power(), it must hold the mutex to satisfy the lockdep
  assertion. Protecting this block is consistent with the rest of the
  driver, which already guards other adv7180_set_power() call sites
  (e.g., `drivers/media/i2c/adv7180.c:933`,
  `drivers/media/i2c/adv7180.c:939`, `drivers/media/i2c/adv7180.c:948`).
- Scope and risk: The change is small, localized to the adv7180 driver’s
  state mutex usage, and does not alter interfaces or architecture. It
  enforces an existing locking contract rather than introducing new
  behavior.
- User impact: Without this fix, users can hit lockdep warnings and
  potential races during suspend/resume or when changing the field mode
  through pad format. With the fix, register accesses are serialized as
  intended, preventing subtle resume/configuration issues.
- Stable criteria: It’s a clear bug fix, minimal and self-contained,
  with low regression risk in a single driver. While the commit message
  doesn’t include a Stable tag, it meets stable backport rules
  (correctness fix, no new features).

Note: Older stable trees that lack the `guard(mutex)` helper will need a
trivial adaptation to explicit
`mutex_lock(&state->mutex)`/`mutex_unlock(&state->mutex)` at the same
points.

 drivers/media/i2c/adv7180.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
index 5d90b8ab9b6df..84600fa75ae8a 100644
--- a/drivers/media/i2c/adv7180.c
+++ b/drivers/media/i2c/adv7180.c
@@ -813,6 +813,8 @@ static int adv7180_set_pad_format(struct v4l2_subdev *sd,
 
 	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 		if (state->field != format->format.field) {
+			guard(mutex)(&state->mutex);
+
 			state->field = format->format.field;
 			adv7180_set_power(state, false);
 			adv7180_set_field_mode(state);
@@ -1549,6 +1551,8 @@ static int adv7180_suspend(struct device *dev)
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct adv7180_state *state = to_state(sd);
 
+	guard(mutex)(&state->mutex);
+
 	return adv7180_set_power(state, false);
 }
 
@@ -1562,6 +1566,8 @@ static int adv7180_resume(struct device *dev)
 	if (ret < 0)
 		return ret;
 
+	guard(mutex)(&state->mutex);
+
 	ret = adv7180_set_power(state, state->powered);
 	if (ret)
 		return ret;
-- 
2.51.0


