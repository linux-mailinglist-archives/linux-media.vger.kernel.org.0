Return-Path: <linux-media+bounces-48499-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D14CB154C
	for <lists+linux-media@lfdr.de>; Tue, 09 Dec 2025 23:45:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 76CBA312A06E
	for <lists+linux-media@lfdr.de>; Tue,  9 Dec 2025 22:45:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C18E62F49E3;
	Tue,  9 Dec 2025 22:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="dKT1v2DU"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026DA26ED3E;
	Tue,  9 Dec 2025 22:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765320292; cv=none; b=Sbi5U7BU3Y1c5ZD3VpVIZDyNWVmYc75V5sBV95NbHsJGIBTTQPG4DQOG0sMZ0BrXy+u+7W5vEFHz0tnmat8Im9naVYfZ/ktCF8IXwOIN4h85fNdkcX4Hun3LphJ30qcr0C4+Li8Ar6MxF3HbVk6DwFvEjuAxY6e4dqQBbtlfmUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765320292; c=relaxed/simple;
	bh=kqHZHTYcalfqHfsySNEaGq9rBcBlyOIsvDj+Sp/LTc4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LEv5nYd9V5LadBJFm0tSbqOuX4dJ14YfrTmM1RB9wngkQE2u0ygKI86+1LyvHvVkBo/JhXad6rgrBKPFeHLoD+wVB9dqJF38lyVSmhlINnfaByXs+62ZjqSCqbbOgx2SfVYq2Ip/gg4F78tbnIAMmfOIRqZwr3Ix8qTa7lwPan0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=dKT1v2DU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8DC29C4CEF5;
	Tue,  9 Dec 2025 22:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1765320291; bh=kqHZHTYcalfqHfsySNEaGq9rBcBlyOIsvDj+Sp/LTc4=;
	h=From:Subject:Date:To:Cc:From;
	b=dKT1v2DUfZ3KDw87TcY0tnFlrF/9EUfSo8K6hqn5XeCzFM4HzxAvRffj3wuZ2dJ5x
	 EYWvYUJJ6vjFyuUD0rt8txF1AwWdC1NDj88g+ZOLB8vNf2Wlwu3oDwR2DXHWiKfF1F
	 16UTy4CboExuR8meWmYFniPn1h/dBCCKiwrb1oOw=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79347D3B998;
	Tue,  9 Dec 2025 22:44:51 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Subject: [PATCH v10 0/8] Add strobe duration and strobe output enable v4l2
 ctrl
Date: Tue, 09 Dec 2025 23:44:35 +0100
Message-Id: <20251209-ov9282-flash-strobe-v10-0-0117cab82e2d@linux.dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAFOmOGkC/33R227CMAwG4FdBuV6Q7ZwarvYe0y7SHEYkoFtbK
 ibUd18o0oq6skv/sj9b8pV1sc2xY7vNlbVxyF1uTqVAeNkwv3enj8hzKAEjIAUCBG8GSxXxdHD
 dnnd929SRO6/rAOBtiJqVyc82pnyZ2Lf3e93Gr3PR+3vIatdF7pvjMfe7zaC3WPHWS3Zr3ueub
 9rv6aQBp+5/lw/IgUMKyjhUWtbu9ZBP58s2xGHyBnowUK4bVAyUwTiqUEgKS0PMhiS7bohiEIL
 yEY21ipaGnA0FZt2QxTBUk7Uea+Pt0lCzofGJoYphjabgjAyg1dLQs2FQrxv6ZgiZkFxMSYilY
 WbDAq4bphhBVUE5baVLfmlUvwYiPPlLVYzaYkgxodfqz2/tg0GwbthiaG+jcFIABvNojOP4A4M
 A4REEAwAA
X-Change-ID: 20250303-ov9282-flash-strobe-ac6bd00c9de6
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-leds@vger.kernel.org, Richard Leitner <richard.leitner@linux.dev>, 
 Hans Verkuil <hverkuil@kernel.org>
X-Mailer: b4 0.15-dev-a3fc8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765320290; l=5031;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=kqHZHTYcalfqHfsySNEaGq9rBcBlyOIsvDj+Sp/LTc4=;
 b=ctor+vw6XpqZLU+HkfWDOvmVs3OcWapc6aanSZ5nu376Juz9ysKeq0+k1ifAgHWMChFmNaUsx
 ai784X27lrIBBDHTsmVsyZ5txHrqKeqeTnhIgXN5y9cGzyovGYQkK/F
X-Developer-Key: i=richard.leitner@linux.dev; a=ed25519;
 pk=8hZNyyyQFqZ5ruVJsSGBSPIrmJpfDm5HwHU4QVOP1Pk=
X-Endpoint-Received: by B4 Relay for richard.leitner@linux.dev/20250225
 with auth_id=350

This series adds two new v4l2 controls:
- V4L2_CID_FLASH_DURATION: "Strobe duration": This control enables
  setting a desired flash/strobe length/duration in µs.
- V4L2_CID_FLASH_STROBE_OE: "Strobe output enable": This
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
Changes in v10:
- Avoid bitwise or on error codes in ov9282_set_ctrl_flash_duration() (Thanks Sakari)
- Link to v9: https://patch.msgid.link/20251120-ov9282-flash-strobe-v9-0-6c9e3a4301d7@linux.dev

Changes in v9:
- Avoid needless multiplication/division in ov9282.c (Thanks Sakari)
- Avoid possible u32 overflow in ov9282.c (Thanks Sakari)
- Link to v8: https://patch.msgid.link/20251104-ov9282-flash-strobe-v8-0-b91dfef1c65a@linux.dev

Changes in v8:
- Minor styling changes across the set
- Add missing error handling for ov9282 strobe_frame_span writing
- Rename V4L2_CID_FLASH_HW_STROBE_SIGNAL to V4L2_CID_FLASH_STROBE_OE
- Drop 02/10: FLASH_DURATION handling in v4l2-flash
- Drop 08/10: strobe_source in ov9282
- Link to v7: https://lore.kernel.org/r/20250901-ov9282-flash-strobe-v7-0-d58d5a694afc@linux.dev

Changes in v7:
- Improved v4l2 uAPI documentation (thanks Sakari)
- Link to v6: https://lore.kernel.org/r/20250716-ov9282-flash-strobe-v6-0-934f12aeff33@linux.dev

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
Richard Leitner (8):
      media: v4l: ctrls: add a control for flash/strobe duration
      media: v4l: ctrls: add a control for enabling strobe output
      Documentation: uAPI: media: add V4L2_CID_FLASH_{DURATION,STROBE_OE}
      media: i2c: ov9282: add output enable register definitions
      media: i2c: ov9282: add strobe output enable v4l2 control
      media: i2c: ov9282: add strobe_duration v4l2 control
      media: i2c: ov9282: implement try_ctrl for strobe_duration
      media: i2c: ov9282: dynamic flash_duration maximum

 .../userspace-api/media/v4l/ext-ctrls-flash.rst    |  42 +++++
 drivers/media/i2c/ov9282.c                         | 174 ++++++++++++++++++++-
 drivers/media/v4l2-core/v4l2-ctrls-defs.c          |   3 +
 include/uapi/linux/v4l2-controls.h                 |   2 +
 4 files changed, 215 insertions(+), 6 deletions(-)
---
base-commit: 2f112b1c25da9f5346c2261ed35c5b1e0b906471
change-id: 20250303-ov9282-flash-strobe-ac6bd00c9de6

Best regards,
--  
Richard Leitner <richard.leitner@linux.dev>



