Return-Path: <linux-media+bounces-31924-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC652AAD900
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 09:52:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 31878504455
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 07:52:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB077221FAC;
	Wed,  7 May 2025 07:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="hTaDlHRU"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1BB22128F;
	Wed,  7 May 2025 07:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746604342; cv=none; b=IXYLwbCtmkU8/21z9WJaU3OROnKOQmiflq42mpg+7Wd3zAu68Cw+g7d5rlxH0w2apCDxt3s4+cwbKYMW/6gn0L3PXEonYuP+j1UMs2IZKOWf2w3lZjH/EMkU3K5oEbQSHLi/ebJJV68AtE7lwCKsnhR+xUhCasLFuDM9E5+NCSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746604342; c=relaxed/simple;
	bh=HDEsgaluUKEPdxixqt/Aekf5T3lFNnaVwddtdEWptfw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F+L6lVzLP8ZVKusJFrrOE3/zJB5w75ns8fgMBSPD6whq4D5BWiXoCK6V9f9ABNXuDIOOT6l93YVjpbYzxyZsl4VMAqexoJNVyVzEfThLPpKXzaZt17HnP1HfIw59lo1nUSLVX7D4gu7/qFKSmbq7ZWvgEDWwNyiJ1h/nngCttOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=hTaDlHRU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A1E87C4CEF0;
	Wed,  7 May 2025 07:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1746604341; bh=HDEsgaluUKEPdxixqt/Aekf5T3lFNnaVwddtdEWptfw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hTaDlHRUIBy1bwLIoANv0KIi88k2EkNnh9a3D4AocBMggKEqmkxjXmg8phe1wKK9r
	 RM0TPbQ9Xw23TRA8bz/CsknxHwSqkv/suOnzxv4F7vBUN0fCQItasXhM/QxcnjquoC
	 F4MqHebHz+e4WSQlrljXVA834ySDKmj30VBFRtmc=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97323C3ABC5;
	Wed,  7 May 2025 07:52:21 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Wed, 07 May 2025 09:51:31 +0200
Subject: [PATCH v4 02/10] leds: flash: add support for flash/stobe duration
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-ov9282-flash-strobe-v4-2-72b299c1b7c9@linux.dev>
References: <20250507-ov9282-flash-strobe-v4-0-72b299c1b7c9@linux.dev>
In-Reply-To: <20250507-ov9282-flash-strobe-v4-0-72b299c1b7c9@linux.dev>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 Richard Leitner <richard.leitner@linux.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746604340; l=2827;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=HDEsgaluUKEPdxixqt/Aekf5T3lFNnaVwddtdEWptfw=;
 b=L6C9/W6cdHBb+g9hw0+DOmZZ250LALX105tP2ZD+8LdwzzyUF8269B56sm6ZnMm6F2OMB67lj
 A4h36ScTg2cA3ODn+fvPpSpqgbr8GuZSB7/8QHmL6ayvwNbPq0ulaAd
X-Developer-Key: i=richard.leitner@linux.dev; a=ed25519;
 pk=8hZNyyyQFqZ5ruVJsSGBSPIrmJpfDm5HwHU4QVOP1Pk=
X-Endpoint-Received: by B4 Relay for richard.leitner@linux.dev/20250225
 with auth_id=350

Add support for the new V4L2_CID_FLASH_DURATION control to the leds
driver.

Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
---
 drivers/leds/led-class-flash.c  | 15 +++++++++++++++
 include/linux/led-class-flash.h | 16 ++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/drivers/leds/led-class-flash.c b/drivers/leds/led-class-flash.c
index f4e26ce84862c05092a9598e63ed301967852f13..165035a8826ca7d44a5cd265a5130a76c6e94347 100644
--- a/drivers/leds/led-class-flash.c
+++ b/drivers/leds/led-class-flash.c
@@ -440,6 +440,21 @@ int led_update_flash_brightness(struct led_classdev_flash *fled_cdev)
 }
 EXPORT_SYMBOL_GPL(led_update_flash_brightness);
 
+int led_set_flash_duration(struct led_classdev_flash *fled_cdev, u32 duration)
+{
+	struct led_classdev *led_cdev = &fled_cdev->led_cdev;
+	struct led_flash_setting *s = &fled_cdev->duration;
+
+	s->val = duration;
+	led_clamp_align(s);
+
+	if (!(led_cdev->flags & LED_SUSPENDED))
+		return call_flash_op(fled_cdev, duration_set, s->val);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(led_set_flash_duration);
+
 MODULE_AUTHOR("Jacek Anaszewski <j.anaszewski@samsung.com>");
 MODULE_DESCRIPTION("LED Flash class interface");
 MODULE_LICENSE("GPL v2");
diff --git a/include/linux/led-class-flash.h b/include/linux/led-class-flash.h
index 36df927ec4b7dcaf9074c6ef32ac8ce83a87a79d..21ec856c36bc67decda46aa8ff1c040ffdcf1181 100644
--- a/include/linux/led-class-flash.h
+++ b/include/linux/led-class-flash.h
@@ -45,6 +45,8 @@ struct led_flash_ops {
 	int (*timeout_set)(struct led_classdev_flash *fled_cdev, u32 timeout);
 	/* get the flash LED fault */
 	int (*fault_get)(struct led_classdev_flash *fled_cdev, u32 *fault);
+	/* set flash duration */
+	int (*duration_set)(struct led_classdev_flash *fled_cdev, u32 duration);
 };
 
 /*
@@ -75,6 +77,9 @@ struct led_classdev_flash {
 	/* flash timeout value in microseconds along with its constraints */
 	struct led_flash_setting timeout;
 
+	/* flash timeout value in microseconds along with its constraints */
+	struct led_flash_setting duration;
+
 	/* LED Flash class sysfs groups */
 	const struct attribute_group *sysfs_groups[LED_FLASH_SYSFS_GROUPS_SIZE];
 };
@@ -209,4 +214,15 @@ int led_set_flash_timeout(struct led_classdev_flash *fled_cdev, u32 timeout);
  */
 int led_get_flash_fault(struct led_classdev_flash *fled_cdev, u32 *fault);
 
+/**
+ * led_set_flash_duration - set flash LED duration
+ * @fled_cdev: the flash LED to set
+ * @timeout: the flash duration to set it to
+ *
+ * Set the flash strobe duration.
+ *
+ * Returns: 0 on success or negative error value on failure
+ */
+int led_set_flash_duration(struct led_classdev_flash *fled_cdev, u32 duration);
+
 #endif	/* __LINUX_FLASH_LEDS_H_INCLUDED */

-- 
2.47.2



