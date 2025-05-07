Return-Path: <linux-media+bounces-31922-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 799C6AAD939
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 09:58:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37C603AD898
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 07:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA893221FA0;
	Wed,  7 May 2025 07:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bxH/piR1"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0F522128B;
	Wed,  7 May 2025 07:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746604342; cv=none; b=XQsT/JOGmW1gDT7GxV/qrK60/43Dtf9pZYgZZPOU4rz+EnggYvQI0hpaAlVn9tcL8G2wh4YX9t6/T1N825K2Jl2G+BXyHM+5y3/jeR1yrpY/ICXKlLedanyDy/IQT5qNEHopscJtyYgJlvgUxtypl2A4CDfuF9TLxzKCOxiQAH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746604342; c=relaxed/simple;
	bh=eeEVorPJN0nXCrBRZypjiRCYewlw7IZRHx4JfomHnDs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Tr0EQa8FNMofVfxP1a+A0GnPW27xzX9HyKpMDiNjHHrGRrA2jFCwoV1zi5gDK8hTlwUPz6nuhnmtxoCnS1repdGHboC8gTgaz//+u7kkueudrSuVQhaUvETi7pIklJJyQkm6G4eOxDS1g0n6NBFINubzISzVA4kqlnScoxOK4FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bxH/piR1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8AC08C4CEE7;
	Wed,  7 May 2025 07:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1746604341; bh=eeEVorPJN0nXCrBRZypjiRCYewlw7IZRHx4JfomHnDs=;
	h=From:Subject:Date:To:Cc:From;
	b=bxH/piR1C8rCEIDpwZih8gOyUne9xr6MkksoN35hA5jVMuli7uuCASbXfrR/xItoA
	 V3+uWgR+OmJOhyOygpFZrAXpLZ2kMmzWRWBYNnE3AQH/sPnxY2ETnjcFUQp0sZbP4B
	 wauZ1iNKlG0xIEsZKYANtAzHGYMMJ3Vb3+YVvJgU=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CFB9C3ABC0;
	Wed,  7 May 2025 07:52:21 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Subject: [PATCH v4 00/10] Add strobe/flash duration v4l2 ctrl & use it for
 ov9282
Date: Wed, 07 May 2025 09:51:29 +0200
Message-Id: <20250507-ov9282-flash-strobe-v4-0-72b299c1b7c9@linux.dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAERG2gC/33OzYrCMBQF4FcpWZshuUla09W8x+AiPzc2IO1MU
 oMiffeJFVFEXJ4D5+NcSMYUMZO+uZCEJeY4jTXITUPcYMY90uhrJsBAMcEEnYqGLdBwMHmgeU6
 TRWpcaz1jTntsSV3+JgzxtKo/u1tO+Hes+HwrH3bfrDKAolbe8b2JI8XAnTfWKBt8Xzi5QkPM8
 5TO69taXaWPxwqnjLLgVWe4aqU134c4Hk9fHsvqFXgyuHxvQDW49J2BLRcS/KshHoYE/d4Q1QD
 OlEPeaa3g2ViW5R+zeMRvhwEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746604340; l=3478;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=eeEVorPJN0nXCrBRZypjiRCYewlw7IZRHx4JfomHnDs=;
 b=E1Lase4cSqMwUx7/+BwSD9ViFiV2pxg8SyjeuLN7PPr5X9TL5us8oRJaMUSpFckDImpAEdnd2
 p3lokN+U1W0AN5gWe7WjZxB/yYDDt5eDLTyR+Z7g50YZp0M8j1QSVLb
X-Developer-Key: i=richard.leitner@linux.dev; a=ed25519;
 pk=8hZNyyyQFqZ5ruVJsSGBSPIrmJpfDm5HwHU4QVOP1Pk=
X-Endpoint-Received: by B4 Relay for richard.leitner@linux.dev/20250225
 with auth_id=350

This series adds a new v4l2 controls named "strobe duration" with id
V4L2_CID_FLASH_DURATION. This control enables setting a desired
flash/strobe length/duration in µs.

As a first user of this new control add basic flash/strobe support for
ov9282 sensors using their "hardware strobe output". The duration
calculation is only interpolated from various measurements, as no
documentation was found.

Further flash/strobe-related controls as well as a migration to v4l2-cci
helpers for ov9282 will likely be implemented in future series.

All register addresses/values are based on the OV9281 datasheet v1.53
(january 2019). This series was tested using an ov9281 VisionComponents
camera module.

Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
---
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
      leds: flash: add support for flash/stobe duration
      media: v4l2-flash: add support for flash/strobe duration
      media: v4l2-flash: fix flash_timeout comment
      Documentation: uAPI: media: add V4L2_CID_FLASH_DURATION
      media: i2c: ov9282: add output enable register definitions
      media: i2c: ov9282: add led_mode v4l2 control
      media: i2c: ov9282: add strobe_duration v4l2 control
      media: i2c: ov9282: add strobe_source v4l2 control
      media: i2c: ov9282: implement try_ctrl for strobe_duration

 .../userspace-api/media/v4l/ext-ctrls-flash.rst    |   5 +
 drivers/leds/led-class-flash.c                     |  15 +++
 drivers/media/i2c/ov9282.c                         | 148 ++++++++++++++++++++-
 drivers/media/v4l2-core/v4l2-ctrls-defs.c          |   1 +
 drivers/media/v4l2-core/v4l2-flash-led-class.c     |  25 ++++
 include/linux/led-class-flash.h                    |  18 ++-
 include/uapi/linux/v4l2-controls.h                 |   1 +
 7 files changed, 208 insertions(+), 5 deletions(-)
---
base-commit: 92a09c47464d040866cf2b4cd052bc60555185fb
change-id: 20250303-ov9282-flash-strobe-ac6bd00c9de6
prerequisite-change-id: 20250225-b4-ov9282-gain-ef1cdaba5bfd:v1
prerequisite-patch-id: 86f2582378ff7095ab65ce4bb25a143eb639e840
prerequisite-patch-id: b06eb6ec697aaf0b3155b4b2370f171d0d304ae2
prerequisite-patch-id: b123047d71bfb9b93f743bbdd6893d5a98495801

Best regards,
-- 
Richard Leitner <richard.leitner@linux.dev>



