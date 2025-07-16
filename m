Return-Path: <linux-media+bounces-37844-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C55B07128
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 11:07:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D9D11A60D49
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 09:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC89B2F2345;
	Wed, 16 Jul 2025 09:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jlbVdEv2"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4C42F002A;
	Wed, 16 Jul 2025 09:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752656849; cv=none; b=jHoTgZESjzjTTawAAE0c1aSSyoH02mMNjRJvCM9V6Wx3eqlQuAbasL73LIXJh1tzTGPNWSlRuxML5BmbD2R9CrqTKMQqlu7E+KIayC0bk2IRfbpp2oar+dqUWb6FonmqsJaeWbkPGhKqrP7xHEKk3h4KFExk++LtE/B6bVMBZxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752656849; c=relaxed/simple;
	bh=gr3klb2qn/si0DKlrwgsy7RcVLdFswJfwWGpC4vYwHU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qSWZSTJqNn1bjwHZ6HPGGINixhptYisU4Wy/cNMDRKmrqt6KIBhdhSKDsSJDXdSBh8d4oqQhcVFzBYS9Jkz167CA/OYZSDTzDlEOudiCkIstaWzwmIlkPi0DEMgGx+goeVye++goJeCH3sKvgGJn6te+9MmT6AqFBZ7/ee1JVyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jlbVdEv2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 87DA3C4CEF7;
	Wed, 16 Jul 2025 09:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1752656848; bh=gr3klb2qn/si0DKlrwgsy7RcVLdFswJfwWGpC4vYwHU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jlbVdEv23bSJIVPXAiYmoDhI54KK8+I2HlyNp0ibloUXltnAfpfZQggo1lu7PCGHf
	 xyw2LiSIWNTUohp4rH+ys+wFczuTvESuRqW7FPSs/b8Eg051UtbT1H34LmBu7zgk5P
	 RzJlCFNYfzrLj+29AOORWhdO6mwi6o1+Hb5WHC48=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AB58C83F34;
	Wed, 16 Jul 2025 09:07:28 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Wed, 16 Jul 2025 11:06:52 +0200
Subject: [PATCH v6 02/11] media: v4l2-flash: add support for flash/strobe
 duration
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250716-ov9282-flash-strobe-v6-2-934f12aeff33@linux.dev>
References: <20250716-ov9282-flash-strobe-v6-0-934f12aeff33@linux.dev>
In-Reply-To: <20250716-ov9282-flash-strobe-v6-0-934f12aeff33@linux.dev>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 Richard Leitner <richard.leitner@linux.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752656846; l=2308;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=gr3klb2qn/si0DKlrwgsy7RcVLdFswJfwWGpC4vYwHU=;
 b=px+x9vE68LStX/ralvumHYmo9bqPNJpgMqwVzRd1Y2yGTgcdLwXo5m//qJDFo25dv5XhLFm+D
 vMbnpH40fLNBCN2hOb+RbWApZIL3U1KQRlobj4tQayhty5JNWxKd4tC
X-Developer-Key: i=richard.leitner@linux.dev; a=ed25519;
 pk=8hZNyyyQFqZ5ruVJsSGBSPIrmJpfDm5HwHU4QVOP1Pk=
X-Endpoint-Received: by B4 Relay for richard.leitner@linux.dev/20250225
 with auth_id=350

Add support for the new V4L2_CID_FLASH_DURATION control to the v4l2
flash led class.

Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
---
 drivers/media/v4l2-core/v4l2-flash-led-class.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-flash-led-class.c b/drivers/media/v4l2-core/v4l2-flash-led-class.c
index 355595a0fefac72c2f6941a30fa430d37dbdccfe..875d56d7190592c1e5ab7acd617b76dcec8792da 100644
--- a/drivers/media/v4l2-core/v4l2-flash-led-class.c
+++ b/drivers/media/v4l2-core/v4l2-flash-led-class.c
@@ -29,6 +29,7 @@ enum ctrl_init_data_id {
 	INDICATOR_INTENSITY,
 	FLASH_TIMEOUT,
 	STROBE_SOURCE,
+	FLASH_DURATION,
 	/*
 	 * Only above values are applicable to
 	 * the 'ctrls' array in the struct v4l2_flash.
@@ -298,6 +299,12 @@ static int v4l2_flash_s_ctrl(struct v4l2_ctrl *c)
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
@@ -424,6 +431,14 @@ static void __fill_ctrl_init_data(struct v4l2_flash *v4l2_flash,
 		ctrl_cfg->flags = V4L2_CTRL_FLAG_VOLATILE |
 				  V4L2_CTRL_FLAG_EXECUTE_ON_WRITE;
 	}
+
+	/* Init FLASH_DURATION ctrl data */
+	if (has_flash_op(fled_cdev, duration_set)) {
+		ctrl_init_data[FLASH_DURATION].cid = V4L2_CID_FLASH_DURATION;
+		ctrl_cfg = &ctrl_init_data[FLASH_DURATION].config;
+		__lfs_to_v4l2_ctrl_config(&fled_cdev->duration, ctrl_cfg);
+		ctrl_cfg->id = V4L2_CID_FLASH_DURATION;
+	}
 }
 
 static int v4l2_flash_init_controls(struct v4l2_flash *v4l2_flash,
@@ -543,6 +558,16 @@ static int __sync_device_with_v4l2_controls(struct v4l2_flash *v4l2_flash)
 			return ret;
 	}
 
+	if (ctrls[FLASH_DURATION]) {
+		if (WARN_ON_ONCE(!fled_cdev))
+			return -EINVAL;
+
+		ret = led_set_flash_duration(fled_cdev,
+					     ctrls[FLASH_DURATION]->val);
+		if (ret < 0)
+			return ret;
+	}
+
 	/*
 	 * For some hardware arrangements setting strobe source may affect
 	 * torch mode. Synchronize strobe source setting only if not in torch

-- 
2.47.2



