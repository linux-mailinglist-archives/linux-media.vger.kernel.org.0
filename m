Return-Path: <linux-media+bounces-37843-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B50DB07125
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 11:07:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 089D11A60CE5
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 09:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B44BD2F1FF1;
	Wed, 16 Jul 2025 09:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="L3BF7h5F"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7582EF9D8;
	Wed, 16 Jul 2025 09:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752656849; cv=none; b=HUUAqa8gf+DbKWH7Ywje1ptzzZwBMetJI2GrRi0jIolLp1VfCjv3qmrGzcOIBIAzZb+o9JCr2uGwvrgT48fZwoGIVi9bFv7wEWKAG8nhSDNlVoigjtD9rXMhToHVbJ2UVbwJxm1uFlW805RV8NsZTU9AP5YPe3JrkJvWBz2z9ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752656849; c=relaxed/simple;
	bh=68baIQZipBWvEqXfir+r2Vrc9N9phFMApov6CxSC17A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aV0C/Rk6Elb5RadVc3XE2xR5ZJmFOhnW19kNWX/ym2p4FzCZzI86ik22jxOQQixTmzi3/R5+O7PZBnq+ZFLAmWojSRU4Rp1HqbtoB5um0C0VaNW0nb7CD+guBsJG9F9ClqZJ7NQbDYtRMozcy4dD3pf3tek7eE9SD078d/ZCXUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=L3BF7h5F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 684BAC4CEF0;
	Wed, 16 Jul 2025 09:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1752656848; bh=68baIQZipBWvEqXfir+r2Vrc9N9phFMApov6CxSC17A=;
	h=From:Subject:Date:To:Cc:From;
	b=L3BF7h5F7AbA9Kn+L744Re/+BlLj5CadRoZbiWdVoBlXLf9hJV31v+keEAhRuibXM
	 BGMkJM4Z4TNQ/jKwnd9nYzcoTk5KXmoAEK5JXpuF52v6k6puztdrAD2j+GrvsLfThL
	 BRiHno6HjLKJOiEjI6dZ8CqJOOHMuHoj9G5v18iE=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58216C83F22;
	Wed, 16 Jul 2025 09:07:28 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Subject: [PATCH v6 00/11] Add strobe duration and hw strobe signal v4l2
 ctrl & use it for ov9282
Date: Wed, 16 Jul 2025 11:06:50 +0200
Message-Id: <20250716-ov9282-flash-strobe-v6-0-934f12aeff33@linux.dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKprd2gC/33Oy07DMBAF0F+JvMaVZ+JH3RX/gVj4FWKpTcBOr
 aIq/45JF6miwPKO7pyZO8khxZDJqbmTFErMcRxqkC8Ncb0ZPgKNvmaCDAVrWUvHovGItDub3NM
 8pdEGapy0njGnfZCkbn6m0MXbor69P3IKX9eKT48hsSYH6sbLJU6npsgDSJockN9yH/M0pu/lo
 wJL+9/jBSijrPNCGRCSW/N6jsP1dvChLF7BJwP4voHVAO6VwSO0HP3WaFeDo9432mogMOECKK0
 Fbg2+GoKpfYNXQ6FFrR1Y5fTWEKsh4Q9DVEMrid4o7pkUz8Y8zz+HP+gl8wEAAA==
X-Change-ID: 20250303-ov9282-flash-strobe-ac6bd00c9de6
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 Richard Leitner <richard.leitner@linux.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752656846; l=4286;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=68baIQZipBWvEqXfir+r2Vrc9N9phFMApov6CxSC17A=;
 b=q4TNjCSIDdfyrnLQKeBk3We50GB32ThqwqwAkk3YTn23rSF0CGdOYzfYqwXkLrImMDYTuUyoh
 2ezCp+Ne1haD8AV3XSoY2X+5/ptbx1NaY5skFbCJumnBAXH/y+3rszm
X-Developer-Key: i=richard.leitner@linux.dev; a=ed25519;
 pk=8hZNyyyQFqZ5ruVJsSGBSPIrmJpfDm5HwHU4QVOP1Pk=
X-Endpoint-Received: by B4 Relay for richard.leitner@linux.dev/20250225
 with auth_id=350

This series adds two new v4l2 controls:
- V4L2_CID_FLASH_DURATION: "Strobe duration": This control enables
  setting a desired flash/strobe length/duration in µs.
- V4L2_CID_FLASH_HW_STROBE_SIGNAL: "Hardware strobe signal": This
  control enables the hardware strobe output signal of a v4l2 device.

As a first user of these new controls add basic flash/strobe support
for ov9282 sensors using their "hardware strobe output". The duration
calculation is only interpolated from various measurements, as no
documentation was found.

Further flash/strobe-related controls as well as a migration to v4l2-cci
helpers for ov9282 will likely be implemented in future series.

All register addresses/values are based on the OV9281 datasheet v1.53
(january 2019). This series was tested using an ov9281 VisionComponents
camera module.

Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
---
Changes in v6:
- Fix "Alignment should match open parenthesis" by Media-CI bot in v4l2-flash-led-class.c
- Fix "format string contains non-ascii character (µ)" by Media-CI bot in ov9282.c
- Introduce new V4L2_CID_FLASH_HW_STROBE_SIGNAL control (as suggested by Sakari)
- Implement V4L2_CID_FLASH_HW_STROBE_SIGNAL instead of
  V4L2_CID_FLASH_LED_MODE in ov9282.c (as suggested by Sakari)
- Drop "media: v4l2-flash: fix flash_timeout comment" as this was
  applied (thanks Lee)
- Link to v5: https://lore.kernel.org/r/20250617-ov9282-flash-strobe-v5-0-9762da74d065@linux.dev

Changes in v5:
- Improve try_ctrl for flash_duration by using DIV_ROUND_UP() and abs() (thanks Sakari)
- Drop "leds: flash: Add support for flash/strobe duration" as this was applied upstream
- Add "media: i2c: ov9282: dynamic flash_duration maximum" (thanks Sakari)
- Link to v4: https://lore.kernel.org/r/20250507-ov9282-flash-strobe-v4-0-72b299c1b7c9@linux.dev

Changes in v4:
- Fix FLASH_DURATION implementation in v4l2-flash-led-class.c by adding a
  missing brace and enum entry (thanks Sakari)
- Fix format of multiline comment in ov9282.c (thanks Sakari)
- Add missing NULL check in ov9282.c (thanks Sakari)
- Adapt nr_of_controls_hint for v4l2 handler in ov9282.c (thanks Sakari)
- Add patch for implementing try_ctrl for strobe_duration (thanks Sakari)
- Link to v3: https://lore.kernel.org/r/20250429-ov9282-flash-strobe-v3-0-2105ce179952@linux.dev

Changes in v3:
- create separate patch for leds driver changes (thanks Lee)
- Link to v2: https://lore.kernel.org/r/20250314-ov9282-flash-strobe-v2-0-14d7a281342d@linux.dev

Changes in v2:
- remove not needed controls in struct ov9282 (thanks Dave)
- Fix commit message of 3/3 regarding framerate get/set (thanks Dave)
- Add V4L2_CID_FLASH_STROBE_SOURCE impementation to ov9282
- Add new V4L2_CID_FLASH_DURATION control (as suggested by Laurent)
- Use FLASH_DURATION instead of FLASH_TIMEOUT for ov9282
- Link to v1: https://lore.kernel.org/r/20250303-ov9282-flash-strobe-v1-0-0fd57a1564ba@linux.dev

---
Richard Leitner (11):
      media: v4l: ctrls: add a control for flash/strobe duration
      media: v4l2-flash: add support for flash/strobe duration
      Documentation: uAPI: media: add V4L2_CID_FLASH_DURATION
      media: v4l: ctrls: add a control for enabling hw strobe signal
      Documentation: uAPI: media: add V4L2_CID_FLASH_HW_STROBE_SIGNAL
      media: i2c: ov9282: add output enable register definitions
      media: i2c: ov9282: add hardware strobe signal v4l2 control
      media: i2c: ov9282: add strobe_duration v4l2 control
      media: i2c: ov9282: add strobe_source v4l2 control
      media: i2c: ov9282: implement try_ctrl for strobe_duration
      media: i2c: ov9282: dynamic flash_duration maximum

 .../userspace-api/media/v4l/ext-ctrls-flash.rst    |  11 ++
 drivers/media/i2c/ov9282.c                         | 168 ++++++++++++++++++++-
 drivers/media/v4l2-core/v4l2-ctrls-defs.c          |   3 +
 drivers/media/v4l2-core/v4l2-flash-led-class.c     |  25 +++
 include/uapi/linux/v4l2-controls.h                 |   2 +
 5 files changed, 203 insertions(+), 6 deletions(-)
---
base-commit: d9946fe286439c2aeaa7953b8c316efe5b83d515
change-id: 20250303-ov9282-flash-strobe-ac6bd00c9de6

Best regards,
-- 
Richard Leitner <richard.leitner@linux.dev>



