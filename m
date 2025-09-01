Return-Path: <linux-media+bounces-41446-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B44F4B3E88F
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 17:08:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 539751A879FF
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 15:07:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDC6334DCC4;
	Mon,  1 Sep 2025 15:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="cOzv1ag5"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FFC343D8C;
	Mon,  1 Sep 2025 15:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756739147; cv=none; b=VDlpfNINIHcOQmeiv7KCcyjkbWSfo3igieCVkDI7clEya2qzXqwQ87hCX9TLufDwENeB/5nIZ9ZPXBNFNnD3ZNBdHHpOtjYpvwHmAKIrsYWltXXnC8zKE7ph+Hgu4XBRxemlJo8O60KL99ZFBjon/Z2dIpv2YIEZkeeUOotilu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756739147; c=relaxed/simple;
	bh=gr3klb2qn/si0DKlrwgsy7RcVLdFswJfwWGpC4vYwHU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bWwNcTGGJ/cvtBK4VxSmIBawLSds3yzw+uNCz0lJudVuCiPk8fuF6au2KVs4Xffp2fsPgCdwiEX+zRHULdtLGVbcVID9TrPatRXur0Pnjlmux12bB+E/2FxPFFWRphNApdRkdro9ZBA/LNpuJ2sC8324rpyedZjXkPShdSs4RBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=cOzv1ag5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A2B76C4CEF4;
	Mon,  1 Sep 2025 15:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1756739146; bh=gr3klb2qn/si0DKlrwgsy7RcVLdFswJfwWGpC4vYwHU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cOzv1ag5G42XlBEoqWhWZvgO7WOygo/O+erun3nELVdVMi6R4hBA8BFM+umyOQvz+
	 C//j5QuceSaVaqKpxpDdZDybDr9DS4dmy6Q4ihz13GXDj7Lh9llQLwJQV4pwCTcH1n
	 fv0q8Dn17whPHif0hOsJ+e93H3rZ9n5JoJt/L334=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 955E3CA0FF0;
	Mon,  1 Sep 2025 15:05:46 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Mon, 01 Sep 2025 17:05:07 +0200
Subject: [PATCH v7 02/10] media: v4l2-flash: add support for flash/strobe
 duration
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-ov9282-flash-strobe-v7-2-d58d5a694afc@linux.dev>
References: <20250901-ov9282-flash-strobe-v7-0-d58d5a694afc@linux.dev>
In-Reply-To: <20250901-ov9282-flash-strobe-v7-0-d58d5a694afc@linux.dev>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-leds@vger.kernel.org, Richard Leitner <richard.leitner@linux.dev>, 
 Hans Verkuil <hverkuil@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756739145; l=2308;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=gr3klb2qn/si0DKlrwgsy7RcVLdFswJfwWGpC4vYwHU=;
 b=+GMtDNCAg6zaUQRBR32sNircYZlJevf1Zz/NTChceKaK0wfQmryDyDcKs1Ui2mEs32ijAfa/X
 IrY+nkH+pwiDfneC2s6q4sAqDQt8pssgswYwRqHapRb2DJVyGhPen1o
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



