Return-Path: <linux-media+bounces-41447-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF5CB3E8A4
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 17:09:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA1EC16E83A
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 15:07:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C31D434AB1E;
	Mon,  1 Sep 2025 15:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="EU9t5SyR"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0BDE343D84;
	Mon,  1 Sep 2025 15:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756739147; cv=none; b=enn0RPg84/Wbic90fiRcXtRRKqQ8CnP2WQ5aZSawIZvvk+VL7emweBqsIaY1Li794W0Qpo88vcieLE1Woja5wailZXm6cHsS/Obq/deowHdL3TTW1NtdCmWWuXu2PtyfbrNBcYyV7ghkXzo1NFjxUSM4E/wxCwPo6Q1aRHJf0YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756739147; c=relaxed/simple;
	bh=U8W70OZNJEk2ByoRFaHr0YQMfrV16QmJRC0Udi6YZpA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=arDdVA6i8L7iZUcxqFI6uGGlPKbJ2SpgD1S2XUcCqLkc6og/8xS4qwBtbN6OCIJ23Y0HBkcjuEYrdPiosT4tbeFT7kxDPJ0aV5Xbo/w+wQDHxlp/oQTsc6WZFCdlYeWoEt0mSIDAvRJMyJPH7FyG1VxcvBHvk3LntwUEbnkRoms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=EU9t5SyR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 90F92C4CEF0;
	Mon,  1 Sep 2025 15:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1756739146; bh=U8W70OZNJEk2ByoRFaHr0YQMfrV16QmJRC0Udi6YZpA=;
	h=From:Subject:Date:To:Cc:From;
	b=EU9t5SyRtijMDBNoiNHM7WIAS3eCU+JPPYgX0viOUTqclerRloFUsjksfguVAcMS0
	 oiRwguHZwy02ySercJX4LfUTbRqjcqFXoJLfPH0sgfcRTCa2gSLwRLETgiJgmzlaW1
	 Z9gONL/z8IvILNULijvuahy3Nnb8oRz0PzcV0OoQ=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BDAECA1000;
	Mon,  1 Sep 2025 15:05:46 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Subject: [PATCH v7 00/10] Add strobe duration and hw strobe signal v4l2
 ctrl & use it for ov9282
Date: Mon, 01 Sep 2025 17:05:05 +0200
Message-Id: <20250901-ov9282-flash-strobe-v7-0-d58d5a694afc@linux.dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIACG2tWgC/33QzW7DIAwH8FeJOI8Km6/S095j2oEAWZDapoMUd
 ary7qPpIVWU7fi37J8t30kOKYZMDs2dpFBijsO5Bv3WENfb81eg0ddMkKFknHE6FIN7pN3R5p7
 mMQ1toNap1jPmjA+K1MlLCl28zerH5zOn8H2t+PgsktbmQN1wOsXx0BS1A0WTA/Jo7mMeh/QzX
 1Rg7v53eQHKKOu81BakEq19P8bz9bbzocxewRcDxLaB1QDhtcU9cIF+bfDFEGi2DV4NBCZdAG2
 MxLUhFkMyvW2Iamhs0RgHrXZmbcjFUPCHIathtEJvtfBMybWhFkPXv28a6mFw0QHa0HWcvxrTN
 P0CosbQ2DcCAAA=
X-Change-ID: 20250303-ov9282-flash-strobe-ac6bd00c9de6
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-leds@vger.kernel.org, Richard Leitner <richard.leitner@linux.dev>, 
 Hans Verkuil <hverkuil@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756739145; l=4404;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=U8W70OZNJEk2ByoRFaHr0YQMfrV16QmJRC0Udi6YZpA=;
 b=cFY2RjeOBc35o8mJpB+9WumdYAVBpOlkwynf/l3OIX/kLpuR+jjkG8LzOnMYrJ1i9VPJzs0aE
 QEQXUdEqMMpDRMQJqsGibVpDcZkTF/5b9IA1/vboJk4v2HyXFLV3OcT
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
Richard Leitner (10):
      media: v4l: ctrls: add a control for flash/strobe duration
      media: v4l2-flash: add support for flash/strobe duration
      media: v4l: ctrls: add a control for enabling hw strobe signal
      Documentation: uAPI: media: add V4L2_CID_FLASH_{DURATION,HW_STROBE_SIGNAL}
      media: i2c: ov9282: add output enable register definitions
      media: i2c: ov9282: add hardware strobe signal v4l2 control
      media: i2c: ov9282: add strobe_duration v4l2 control
      media: i2c: ov9282: add strobe_source v4l2 control
      media: i2c: ov9282: implement try_ctrl for strobe_duration
      media: i2c: ov9282: dynamic flash_duration maximum

 .../userspace-api/media/v4l/ext-ctrls-flash.rst    |  29 ++++
 drivers/media/i2c/ov9282.c                         | 168 ++++++++++++++++++++-
 drivers/media/v4l2-core/v4l2-ctrls-defs.c          |   3 +
 drivers/media/v4l2-core/v4l2-flash-led-class.c     |  25 +++
 include/uapi/linux/v4l2-controls.h                 |   2 +
 5 files changed, 221 insertions(+), 6 deletions(-)
---
base-commit: d9946fe286439c2aeaa7953b8c316efe5b83d515
change-id: 20250303-ov9282-flash-strobe-ac6bd00c9de6

Best regards,
-- 
Richard Leitner <richard.leitner@linux.dev>



