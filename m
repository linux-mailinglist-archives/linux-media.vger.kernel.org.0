Return-Path: <linux-media+bounces-35024-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D71E2ADC355
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 09:32:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A4C3176E6F
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 07:32:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E75728F958;
	Tue, 17 Jun 2025 07:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="SXICAKXx"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3503B3C2F;
	Tue, 17 Jun 2025 07:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750145503; cv=none; b=B1MpLkb/vtVzZNLcqLHnrlWInchDGtavTZm0huhOdSMDNPXjFc0vLCsdz8jb5NWIDwXapsWa2nrDKYoE7n3Jsixi45MRMJgPIEadVj2rygsF3E8utGm3ZsPW4nPZaeRyt60hlnCsc6jxy+K88Beqji189+9thJ303j9HQ/CnzCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750145503; c=relaxed/simple;
	bh=iuZy087uQZZHRiVbI+0AynS1qyJ01TbB2pVSypVdqgo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cs7JjB9yOkIJVW/Ja5hxm2z7t9H0FnSAinFHoQ3Bi+Rsba5VW5FaXvRjte8PzhWxuIBx4Rlsrjp8NIYHo/Tfe1OAutcbhdKAsB65nL6nON0WhUZfXSJtI3Vt6KAsthIST6t5vPtKUkSfH5PbRlEltJ1MriQK9F4LeaOyTBAPDkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=SXICAKXx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9DE95C4CEE3;
	Tue, 17 Jun 2025 07:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1750145502; bh=iuZy087uQZZHRiVbI+0AynS1qyJ01TbB2pVSypVdqgo=;
	h=From:Subject:Date:To:Cc:From;
	b=SXICAKXxpFo81fPoOCkfhnADFWUW08kRWZkb6xDlt4o9OJ7ufw5Nf766oLcBDjmmX
	 JFX0OhTigmaG261gX4zxrUNGEbdDWUhej1XqFI+uSMCyX6W7SAU1jgoGH7NfSGWdYJ
	 BrK67X1gQIs3ZVeO61ZlRkCJ1u9ygkQ6bRSoA6dg=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89494C71136;
	Tue, 17 Jun 2025 07:31:42 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Subject: [PATCH v5 00/10] Add strobe/flash duration v4l2 ctrl & use it for
 ov9282
Date: Tue, 17 Jun 2025 09:31:34 +0200
Message-Id: <20250617-ov9282-flash-strobe-v5-0-9762da74d065@linux.dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIANYZUWgC/33OTW7CMBAF4KtEXtfIM7FjzKr3qLrwz6SxBAm1g
 0WFcve6YQFCUZdv9OabubFMKVJmh+bGEpWY4zTWoN4a5gc7fhGPoWaGApVoRcunYnCPvD/aPPA
 8p8kRt75zQQhvAnWsbp4T9fG6qh+f95zo+1Lx+T5kzmbifjqd4nxoSreDjicP7K88xDxP6Wf9q
 MDa/vd4AS646IPSFlQnnX0/xvFy3QUqq1fwyQC5bWA1QAZtcQ+txPBqtA9Dotk22mogCOUJtDE
 KXw35MJTQ24ashkaHxnhw2ptnY1mWX4NADjWvAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750145501; l=3525;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=iuZy087uQZZHRiVbI+0AynS1qyJ01TbB2pVSypVdqgo=;
 b=ZraxU0Tl9bZD/n9qh3GDNOkiWlmIvPZ91+HxuK8WT3uI++pyu+761/+o3XytdY9a0pUl8CR7u
 Adc4WqvxciBBE6agGB3TTa78m28M8AtMtjU569oBmf8sgMRkOAW6WG/
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
      media: v4l2-flash: fix flash_timeout comment
      Documentation: uAPI: media: add V4L2_CID_FLASH_DURATION
      media: i2c: ov9282: add output enable register definitions
      media: i2c: ov9282: add led_mode v4l2 control
      media: i2c: ov9282: add strobe_duration v4l2 control
      media: i2c: ov9282: add strobe_source v4l2 control
      media: i2c: ov9282: implement try_ctrl for strobe_duration
      media: i2c: ov9282: dynamic flash_duration maximum

 .../userspace-api/media/v4l/ext-ctrls-flash.rst    |   5 +
 drivers/media/i2c/ov9282.c                         | 172 ++++++++++++++++++++-
 drivers/media/v4l2-core/v4l2-ctrls-defs.c          |   1 +
 drivers/media/v4l2-core/v4l2-flash-led-class.c     |  25 +++
 include/linux/led-class-flash.h                    |   2 +-
 include/uapi/linux/v4l2-controls.h                 |   1 +
 6 files changed, 199 insertions(+), 7 deletions(-)
---
base-commit: d9946fe286439c2aeaa7953b8c316efe5b83d515
change-id: 20250303-ov9282-flash-strobe-ac6bd00c9de6

Best regards,
-- 
Richard Leitner <richard.leitner@linux.dev>



