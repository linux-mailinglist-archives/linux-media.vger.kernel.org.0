Return-Path: <linux-media+bounces-35023-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE61ADC35B
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 09:32:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBA473B3631
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 07:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07E7B28F93F;
	Tue, 17 Jun 2025 07:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="0c1nJcL6"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33912136A;
	Tue, 17 Jun 2025 07:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750145503; cv=none; b=nZg0rMwE9KWxWsbmbqtR4Lq0yQWMD9eFp1lp+SNZzecCDiPTguNp0rfDcj2UyvRILg6JfyKf+XDzfZPTymSQ91qQa1fXXdN4lj/iIFMvOeih0qhUXgvYhCnAVeXZB27+DxDCauP+T+9gZL6IKLlcx02z7LKIagJXou2rGGvYAzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750145503; c=relaxed/simple;
	bh=FrCl/fSGFBnOk0+MAcM+KHDO4zcSf1DpGTy1y8P+ack=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lAm7NvX4rFXyKaoLNJJIwUUfxBqeUlCpSKO3nlS245207heUe83GMcM8l2Pp0QSBSxNxwd+uheND5HWQIhDD58pieaq7IAJpNImCcYbF6ccLtosjoyaviwoPRZK9DlhgV/sOSvvKohEwDHrLNL8C/ELg7Lm1xVWJhtbwMbbDgMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=0c1nJcL6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C42FCC4AF0B;
	Tue, 17 Jun 2025 07:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1750145502; bh=FrCl/fSGFBnOk0+MAcM+KHDO4zcSf1DpGTy1y8P+ack=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=0c1nJcL69M6vekzc5cJBP1WmMzNxszsUzMx9ymqObEkRfWBo8L2B2UONgojLRZjN+
	 IAKXuXX5G7M/jagiHzT74yVwktqiO4GcSt9fAfiR3Amsw7M9aZeAKOTeIUmF+wkoid
	 nW2NubFhcGmzAzytAngNhr96D83TRDpEzNENHQ40=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1E69C71157;
	Tue, 17 Jun 2025 07:31:42 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Tue, 17 Jun 2025 09:31:36 +0200
Subject: [PATCH v5 02/10] media: v4l2-flash: add support for flash/strobe
 duration
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-ov9282-flash-strobe-v5-2-9762da74d065@linux.dev>
References: <20250617-ov9282-flash-strobe-v5-0-9762da74d065@linux.dev>
In-Reply-To: <20250617-ov9282-flash-strobe-v5-0-9762da74d065@linux.dev>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 Richard Leitner <richard.leitner@linux.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750145501; l=2303;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=FrCl/fSGFBnOk0+MAcM+KHDO4zcSf1DpGTy1y8P+ack=;
 b=3UFNRqcZuesqNlodPeYt8efWwjzdPgRjCVXwRt/jIpJBrLTp9ghLKj6Wf9kqDIIYXrsUjEqZy
 Rz92q8lYGiSC1l1yvAJh2SwGAKIGx/nzJJZeSn3Pi/6+Wxkko2LY2Xy
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
index 355595a0fefac72c2f6941a30fa430d37dbdccfe..69b6c2026e0ad905aaebcdabe1e7002fc48f9e2c 100644
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
+					ctrls[FLASH_DURATION]->val);
+		if (ret < 0)
+			return ret;
+	}
+
 	/*
 	 * For some hardware arrangements setting strobe source may affect
 	 * torch mode. Synchronize strobe source setting only if not in torch

-- 
2.47.2



