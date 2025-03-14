Return-Path: <linux-media+bounces-28183-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0974AA60C1D
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 09:50:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4038917F4EE
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 08:50:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 399041DE3A0;
	Fri, 14 Mar 2025 08:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="c2TFpzEW"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76392192D6B;
	Fri, 14 Mar 2025 08:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741942205; cv=none; b=hhQYwltgMyLdhvBtMB2kLKLv+JVofR4Vz9QpU26SO29TP59VQyr7aq3/ahlmcvzcW+3Cpcim4D1Mdu1oraBcgCP+tUT5X2yW87W3FtOs/ZHSvEp+Imjf5QK9n/WJJLTd70Qzf3oZdnx+F+94Mo1r/iNgHs5EBK7ZSgEyjZ1yt38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741942205; c=relaxed/simple;
	bh=LVdkx1HHnCgF9PxdCqbpp0HAodzXvbi8+XOQgquqxWI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PFDUNGeLUpWISnYxntoUudKopQEDOI4IC6Vw068QKnnRN9u57Gpr1DPh0wQAymvAgPPSRyCUJeDdpdkIGXn7Kq47IUm4gAz+FIjcEHCPQNoDu6LSZq0XeVvQXgqgYJnz3sPI3gDvT0fjvaZreWaa5BsonfmSVXoXLPYqvwYteh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=c2TFpzEW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2CF7FC4CEEC;
	Fri, 14 Mar 2025 08:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1741942205; bh=LVdkx1HHnCgF9PxdCqbpp0HAodzXvbi8+XOQgquqxWI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=c2TFpzEWgV8S/3f05pw7yugAlBsi7Rv43PYboTGk/KZ0zpYBNFIlPGm+mnN4soim/
	 kguSMs538tuAMdfmizPkxtu9MVLNhAwBv7Nd+v4Izn1lA1gIFCB33XhithA6k94iL6
	 CNI8bNBeqy/rw9QTG9lycR/3UG6fmTgz8hcWB/mM=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20975C282EC;
	Fri, 14 Mar 2025 08:50:05 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Fri, 14 Mar 2025 09:49:56 +0100
Subject: [PATCH v2 2/8] media: v4l2-flash: add support for flash/stobe
 duration
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-ov9282-flash-strobe-v2-2-14d7a281342d@linux.dev>
References: <20250314-ov9282-flash-strobe-v2-0-14d7a281342d@linux.dev>
In-Reply-To: <20250314-ov9282-flash-strobe-v2-0-14d7a281342d@linux.dev>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-leds@vger.kernel.org, Richard Leitner <richard.leitner@linux.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741942203; l=4241;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=LVdkx1HHnCgF9PxdCqbpp0HAodzXvbi8+XOQgquqxWI=;
 b=T1N5UmGtWggEUhkBBhtxOf4UrOFcr+ii4LAMLTErvZNeQNiORQpROhK5RQ3cEdsBBUMhe747v
 KEdPSOnnljvCi26vO01sRUdQVDkVNPTuf7ehSGa+OGdlM0bq25ye3+K
X-Developer-Key: i=richard.leitner@linux.dev; a=ed25519;
 pk=8hZNyyyQFqZ5ruVJsSGBSPIrmJpfDm5HwHU4QVOP1Pk=
X-Endpoint-Received: by B4 Relay for richard.leitner@linux.dev/20250225
 with auth_id=350

Add support for the new V4L2_CID_FLASH_DURATION control to the v4l2
led flash class.

Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
---
 drivers/leds/led-class-flash.c                 | 15 +++++++++++++++
 drivers/media/v4l2-core/v4l2-flash-led-class.c | 13 +++++++++++++
 include/linux/led-class-flash.h                | 16 ++++++++++++++++
 3 files changed, 44 insertions(+)

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
diff --git a/drivers/media/v4l2-core/v4l2-flash-led-class.c b/drivers/media/v4l2-core/v4l2-flash-led-class.c
index 355595a0fefac72c2f6941a30fa430d37dbdccfe..963b549480f6eb3b9eb0d80696a764de7ffcc1a2 100644
--- a/drivers/media/v4l2-core/v4l2-flash-led-class.c
+++ b/drivers/media/v4l2-core/v4l2-flash-led-class.c
@@ -298,6 +298,12 @@ static int v4l2_flash_s_ctrl(struct v4l2_ctrl *c)
 		 * microamperes for flash intensity units.
 		 */
 		return led_set_flash_brightness(fled_cdev, c->val);
+	case V4L2_CID_FLASH_DURATION:
+		/*
+		 * No conversion is needed as LED Flash class also uses
+		 * microseconds for flash duration units.
+		 */
+		return led_set_flash_duration(fled_cdev, c->val);
 	}
 
 	return -EINVAL;
@@ -424,6 +430,13 @@ static void __fill_ctrl_init_data(struct v4l2_flash *v4l2_flash,
 		ctrl_cfg->flags = V4L2_CTRL_FLAG_VOLATILE |
 				  V4L2_CTRL_FLAG_EXECUTE_ON_WRITE;
 	}
+
+	/* Init FLASH_DURATION ctrl data */
+	if (has_flash_op(fled_cdev, timeout_set)) {
+		ctrl_init_data[FLASH_DURATION].cid = V4L2_CID_FLASH_DURATION;
+		ctrl_cfg = &ctrl_init_data[FLASH_DURATION].config;
+		__lfs_to_v4l2_ctrl_config(&fled_cdev->duration, ctrl_cfg);
+		ctrl_cfg->id = V4L2_CID_FLASH_DURATION;
 }
 
 static int v4l2_flash_init_controls(struct v4l2_flash *v4l2_flash,
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



