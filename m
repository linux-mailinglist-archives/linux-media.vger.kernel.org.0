Return-Path: <linux-media+bounces-32666-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E0769ABA9CD
	for <lists+linux-media@lfdr.de>; Sat, 17 May 2025 13:42:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0B493B96B2
	for <lists+linux-media@lfdr.de>; Sat, 17 May 2025 11:41:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 312501F7904;
	Sat, 17 May 2025 11:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FN4WzPfQ"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5FC1DE8B2
	for <linux-media@vger.kernel.org>; Sat, 17 May 2025 11:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747482132; cv=none; b=eApxQnRphmOJvp80RTl6FENusTBSjNAMUmdbXv2fnRokmwiaZOhHPR5wH2ubRAYjfvERyEq8LgPKJb+MOW3u3/fMzoLv+xymrdSvfaH7PG3yVz3p+prTbP7n0neF9TcRuGhYGrCfo75v6z4Bn0OZoU1NLF0oeYxLX5dLhOw8pek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747482132; c=relaxed/simple;
	bh=fuLR4WRj2vRkkjFynCZTdsI7denJ09Ca426Hwzl23Uk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n5aSngUG/l7YkrU+2A9OuddELhBE2NOCy9FXXa0y62J2J6ff+RGvGecrYamB9gKsPjND/6dbrLP6YdEBE+S6NDmwjBUsfgyzBwIwaEOEt04gdeJF6q2D0RhRgEalc/NLOOpQwUkj2YX5ND3zNcqdsGT6DQYj0HSvJaLdgLoyDwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FN4WzPfQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747482130;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jc1t80LUkkj1ewLi5OfRg/shIc4tWPxSAjx5ml0xlDM=;
	b=FN4WzPfQfn+ziSx18ZIAdMzBgaTWm1f6GP2Ho+q529A0mQcCm2O1WVwcu8rzaN5+sqQ4cJ
	1QDg01MrJMQij258Cu3chlqkZENpIIiOr0d/FHURamKvc/7Vuf4laSyC3m0lD9stW9geD5
	jnSpoqgy6/GhH5Fn6gFXZxEJV5p1KB8=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-583-YP0e3XTFOM2Brb7f1uhNvQ-1; Sat,
 17 May 2025 07:42:04 -0400
X-MC-Unique: YP0e3XTFOM2Brb7f1uhNvQ-1
X-Mimecast-MFC-AGG-ID: YP0e3XTFOM2Brb7f1uhNvQ_1747482123
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 770D418004AD;
	Sat, 17 May 2025 11:42:03 +0000 (UTC)
Received: from x1.redhat.com (unknown [10.45.224.43])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 21DB5180045B;
	Sat, 17 May 2025 11:41:58 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 08/23] media: atomisp: gc0310: Add vblank and hblank controls
Date: Sat, 17 May 2025 13:40:51 +0200
Message-ID: <20250517114106.43494-9-hdegoede@redhat.com>
In-Reply-To: <20250517114106.43494-1-hdegoede@redhat.com>
References: <20250517114106.43494-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Add support for the vblank and hblank controls, these controls
are mandatory for using the sensor driver with libcamera.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/i2c/atomisp-gc0310.c        | 38 +++++++++++++++++--
 1 file changed, 35 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index 2bb309b51a3a..568b501f7e87 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -62,9 +62,22 @@
 #define GC0310_V_CROP_START_REG			CCI_REG16(0x0B)
 #define GC0310_H_OUTSIZE_REG			CCI_REG16(0x0F)
 #define GC0310_V_OUTSIZE_REG			CCI_REG16(0x0D)
+
 #define GC0310_H_BLANKING_REG			CCI_REG16(0x05)
+/* Hblank-register + sh-delay + H-crop + 4 (from hw) */
+#define GC0310_H_BLANK_DEFAULT			(178 + 42 + 4 + 4)
+
 #define GC0310_V_BLANKING_REG			CCI_REG16(0x07)
+/* Vblank needs an offset compensate for the small V-crop done */
+#define GC0310_V_BLANK_OFFSET			2
+/* Vsync start time + 1 row vsync + vsync end time + offset */
+#define GC0310_V_BLANK_MIN			(9 + 1 + 4 + GC0310_V_BLANK_OFFSET)
+#define GC0310_V_BLANK_DEFAULT			(27 + GC0310_V_BLANK_OFFSET)
+#define GC0310_V_BLANK_MAX			(4095 - GC0310_NATIVE_HEIGHT)
+
 #define GC0310_SH_DELAY_REG			CCI_REG8(0x11)
+#define GC0310_VS_START_TIME_REG		CCI_REG8(0x12)
+#define GC0310_VS_END_TIME_REG			CCI_REG8(0x13)
 
 #define to_gc0310_sensor(x) container_of(x, struct gc0310_device, sd)
 
@@ -89,6 +102,8 @@ struct gc0310_device {
 		struct v4l2_ctrl *gain;
 		struct v4l2_ctrl *link_freq;
 		struct v4l2_ctrl *pixel_rate;
+		struct v4l2_ctrl *vblank;
+		struct v4l2_ctrl *hblank;
 	} ctrls;
 };
 
@@ -147,8 +162,7 @@ static const struct reg_sequence gc0310_reset_register[] = {
 	{ 0x04, 0xc0 }, /* 0xe8 //58 */
 	{ 0x05, 0x00 },
 	{ 0x06, 0xb2 }, /* 0x0a //HB */
-	{ 0x07, 0x00 },
-	{ 0x08, 0x1b }, /* 0x89 //VB */
+	/* Vblank (reg 0x07 + 0x08) gets set by the vblank ctrl */
 	{ 0x09, 0x00 }, /* row start */
 	{ 0x0a, 0x00 },
 	{ 0x0b, 0x00 }, /* col start */
@@ -309,6 +323,11 @@ static int gc0310_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_ANALOGUE_GAIN:
 		ret = gc0310_gain_set(sensor, ctrl->val);
 		break;
+	case V4L2_CID_VBLANK:
+		ret = cci_write(sensor->regmap, GC0310_V_BLANKING_REG,
+				ctrl->val - GC0310_V_BLANK_OFFSET,
+				NULL);
+		break;
 	default:
 		ret = -EINVAL;
 		break;
@@ -578,7 +597,7 @@ static int gc0310_init_controls(struct gc0310_device *sensor)
 {
 	struct v4l2_ctrl_handler *hdl = &sensor->ctrls.handler;
 
-	v4l2_ctrl_handler_init(hdl, 4);
+	v4l2_ctrl_handler_init(hdl, 6);
 
 	/* Use the same lock for controls as for everything else */
 	hdl->lock = &sensor->input_lock;
@@ -598,11 +617,24 @@ static int gc0310_init_controls(struct gc0310_device *sensor)
 		v4l2_ctrl_new_std(hdl, NULL, V4L2_CID_PIXEL_RATE, 0,
 				  GC0310_PIXELRATE, 1, GC0310_PIXELRATE);
 
+	sensor->ctrls.vblank =
+		v4l2_ctrl_new_std(hdl, &ctrl_ops, V4L2_CID_VBLANK,
+				  GC0310_V_BLANK_MIN,
+				  GC0310_V_BLANK_MAX, 1,
+				  GC0310_V_BLANK_DEFAULT);
+
+	sensor->ctrls.hblank =
+		v4l2_ctrl_new_std(hdl, NULL, V4L2_CID_HBLANK,
+				  GC0310_H_BLANK_DEFAULT,
+				  GC0310_H_BLANK_DEFAULT, 1,
+				  GC0310_H_BLANK_DEFAULT);
+
 	if (hdl->error)
 		return hdl->error;
 
 	sensor->ctrls.pixel_rate->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 	sensor->ctrls.link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	sensor->ctrls.hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 	return 0;
 }
 
-- 
2.49.0


