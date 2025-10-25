Return-Path: <linux-media+bounces-45550-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DA8C09767
	for <lists+linux-media@lfdr.de>; Sat, 25 Oct 2025 18:28:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 230BB4F643C
	for <lists+linux-media@lfdr.de>; Sat, 25 Oct 2025 16:19:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15CFA30748D;
	Sat, 25 Oct 2025 16:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aHf1pxDg"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D62303A19;
	Sat, 25 Oct 2025 16:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761408962; cv=none; b=DpnuGVwdNpI3a1macLrOrvmuF0obruyZ0+2NuTgpRh26HGZB3kZdz1HtOyAqDpP0rDGTL7X4EsMdRBHldUBYqcKMCLBsuzkkOlx9xyZhloMLq6CDVJmiZqlwIYGoLuEBFBPR8ETzAjH+9uOwsrN207vFMwhta2TiPnpKF4tTYCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761408962; c=relaxed/simple;
	bh=BEy4Ikddi66XfS4hkgmoYa/CuRrxeXGBC/hXl/4uE4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ULw5hacBg9nLF6bM2X9PRX2wARXJw2qP29mscYA6ygw15Z0OzpWe6V7oYV4Re+NCp2Be5rSh9uYJzJhGvX88SJgrbECWMCaS1sY3B8c/I/WVs6g8pvb9HWiEWOSflVLUKTc+cwsrNsdxwMUsgjORtSZ3U8Egs7Yzf28bAYm7c1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aHf1pxDg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D8A5C113D0;
	Sat, 25 Oct 2025 16:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761408962;
	bh=BEy4Ikddi66XfS4hkgmoYa/CuRrxeXGBC/hXl/4uE4U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aHf1pxDgtwr9+LB9kN1r4uaLJSae+n4U7wkCWUZxYOZ5sKa7xrHTl96OY1u1IbjZQ
	 ML+xaNAskifIh777VW40lY5vU+/y5huhonmCZNHk1//gJ2qPHlWup0iYLt5eyvIQWR
	 rrwWwtIQFXfNV3/zzLV83AFEgznx9Pm2DD2E88ygYbDXcz60L27afZEoip9vHHukKM
	 e784JogNQ18nQ/sG51nz5gj2kC9yCjPa513UmL1e+sDG4TGajVSoxQxji2PxkUBRl6
	 1ll59NzJHPXETgd9GWhlwjfWg3ivCWMslnXjxonNDZxgWaUviYTVANEOsc1CWiwUPm
	 cbLJe28iM2CMw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	lars@metafoo.de,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.17-5.15] media: adv7180: Do not write format to device in set_fmt
Date: Sat, 25 Oct 2025 11:56:24 -0400
Message-ID: <20251025160905.3857885-153-sashal@kernel.org>
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

[ Upstream commit 46c1e7814d1c3310ef23c01ed1a582ef0c8ab1d2 ]

The .set_fmt callback should not write the new format directly do the
device, it should only store it and have it applied by .s_stream.

The .s_stream callback already calls adv7180_set_field_mode() so it's
safe to remove programming of the device and just store the format and
have .s_stream apply it.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

- Fixes incorrect behavior: The change enforces the V4L2 subdev rule
  that .set_fmt should not program hardware but only update state, with
  hardware programming deferred to .s_stream. In the new code, .set_fmt
  (driver’s `adv7180_set_pad_format`) only stores the requested field
  and does not touch the device, eliminating unintended runtime side
  effects during format negotiation. See
  `drivers/media/i2c/adv7180.c:784-793` where it now only assigns
  `state->field` for ACTIVE formats and no longer toggles power or
  programs registers.

- Safe because .s_stream already applies the format: The .s_stream path
  powers the device off, configures it, then powers it on, and
  explicitly applies the field mode. `adv7180_s_stream` calls
  `init_device` when enabling, which calls `adv7180_set_field_mode`.
  See:
  - `drivers/media/i2c/adv7180.c:927-955` (.s_stream powers off, calls
    `init_device`, powers on),
  - `drivers/media/i2c/adv7180.c:844-859` (`init_device` calls
    `adv7180_program_std` then `adv7180_set_field_mode` at
    `drivers/media/i2c/adv7180.c:854`).
  This guarantees the stored `state->field` is applied at the correct
time.

- Eliminates disruptive side effects: Previously, .set_fmt would power-
  cycle the decoder and program field mode immediately (via
  `adv7180_set_power(state, false)`, `adv7180_set_field_mode(state)`,
  `adv7180_set_power(state, true)`), which could:
  - Disrupt ongoing or prepared streaming sessions by unexpectedly
    toggling power during format negotiation.
  - Violate the expected V4L2 subdev semantics where format negotiation
    should be side-effect-free.
  The new behavior prevents these issues by staging only the state
change and deferring hardware ops to .s_stream.

- Consistency and correctness: The stored field influences both
  negotiated format reporting and hardware setup when streaming starts:
  - Format reporting uses `state->field` to compute height and field
    (see `drivers/media/i2c/adv7180.c:700-709` and `759-761`).
  - When powering on with CSI-2, `adv7180_set_power` also considers
    `state->field` (e.g., sets CSI register 0x1D if progressive output
    is used), ensuring consistent device programming once the stream
    starts (see `drivers/media/i2c/adv7180.c:202-219`).

- Contained change, minimal risk:
  - Single-file, localized change to adv7180 driver.
  - No new features or ABI changes; aligns with established subdev
    patterns.
  - No architectural shifts; only removes premature device programming
    from .set_fmt.
  - The driver already centralizes device programming within the
    streaming lifecycle, so behavior remains correct while avoiding
    premature side effects.

- Stable suitability:
  - Addresses a real behavioral bug (programming hardware during
    .set_fmt) that can lead to video glitches or races during
    negotiation.
  - Small, targeted patch that reduces side effects and adheres to V4L2
    best practices.
  - Low regression risk provided the target stable trees have the same
    pattern where .s_stream calls into `init_device` →
    `adv7180_set_field_mode` (as in this tree). In this codebase, that
    condition is satisfied.

Given these points, this is a good candidate for backporting to stable
media trees.

 drivers/media/i2c/adv7180.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
index 84600fa75ae8a..8100fe6b0f1d4 100644
--- a/drivers/media/i2c/adv7180.c
+++ b/drivers/media/i2c/adv7180.c
@@ -812,14 +812,7 @@ static int adv7180_set_pad_format(struct v4l2_subdev *sd,
 	ret = adv7180_mbus_fmt(sd,  &format->format);
 
 	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
-		if (state->field != format->format.field) {
-			guard(mutex)(&state->mutex);
-
-			state->field = format->format.field;
-			adv7180_set_power(state, false);
-			adv7180_set_field_mode(state);
-			adv7180_set_power(state, true);
-		}
+		state->field = format->format.field;
 	} else {
 		framefmt = v4l2_subdev_state_get_format(sd_state, 0);
 		*framefmt = format->format;
-- 
2.51.0


