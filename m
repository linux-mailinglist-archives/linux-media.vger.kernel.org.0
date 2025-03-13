Return-Path: <linux-media+bounces-28163-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C71BBA5FFC0
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 19:44:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07ED71767B6
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 18:44:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E3611EFFA2;
	Thu, 13 Mar 2025 18:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qoze3pZo"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B2A1DB54C
	for <linux-media@vger.kernel.org>; Thu, 13 Mar 2025 18:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741891436; cv=none; b=F1nkTFKSA6B+z0cN0boqH80pxxZbaZ8eeRVNYyFuft9XKtqi1DvLcvvjLowU2S+EIHJA7Ofkv+AGyp1GAox+9Ns/lqmI//xkuDLvIauzBlbiyGLNxCXRcJ9l1nOWttet1K8/botzTlj6jSjG+kwQ6vFvvtiS09UpBDTzcppzxYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741891436; c=relaxed/simple;
	bh=TyCrM0iNFxYyBXKhzg8Db58rlTNHKgZ3OVwlqu+AJVk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TxfTJROP7J33TJUslx6Y4BlvmZ2DSZU4+aPu8lcgvr3Z1y4uKcngVE9qNiCohxaMNeiHNbNx8SzV3ZsBYFc7rmZdA0lbSOl2TL/hlxQgYMHL8Kq8dgg9ydcvmQhqbgWGGLpNW6tVU0GQBCmzrihNtmayVfljTA8F5zjcEqMof+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qoze3pZo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741891433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=33NHCMQTlmTS51f+KPkZJsq6MZ8F2AqedGUCxOeA6aI=;
	b=Qoze3pZo40IRavIk1nkINFiEh0a4Ls3NZal2MdaSEdjwbXRjoFKvnFKl5EVficoO19KpY5
	W4Hr1p9N0MBtg/qjNQP48rqx8DCN79kjE93GVWqOEjoe3198ZNBjYFJJDwI61CbdO2U7Qx
	CZ5PI6saXp2y1HiioVdhZnmspLzkYDM=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-93-KJngkfvqMWiGZ4_1zvLZlg-1; Thu,
 13 Mar 2025 14:43:49 -0400
X-MC-Unique: KJngkfvqMWiGZ4_1zvLZlg-1
X-Mimecast-MFC-AGG-ID: KJngkfvqMWiGZ4_1zvLZlg_1741891427
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7FA9B195608F;
	Thu, 13 Mar 2025 18:43:47 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.45.224.5])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 94831300376F;
	Thu, 13 Mar 2025 18:43:44 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Ingvar Hagelund <ingvar@redpill-linpro.com>,
	Joachim Reichel <joachim.reichel@posteo.de>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Hao Yao <hao.yao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH v8 08/14] media: ov02c10: Make modes lane-count independent
Date: Thu, 13 Mar 2025 19:43:08 +0100
Message-ID: <20250313184314.91410-9-hdegoede@redhat.com>
In-Reply-To: <20250313184314.91410-1-hdegoede@redhat.com>
References: <20250313184314.91410-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

ATM the driver only supports one mode (1928x1092) but before this change
the supported_modes[] had 2 entries, 1 for 1928x1092 when using 1 mipi lane
and 1 for 1928x1092 when using 2 mipi lanes.

This causes enum_framesizes returning 2 1928x1092 modes, instead make it
one mode and dynamically adapt for the number of lanes in
ov02c10_start_streaming() and ov02c10_set_format().

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov02c10.c | 63 ++++++++++++++++---------------------
 1 file changed, 27 insertions(+), 36 deletions(-)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index b9f28368e29f..e1013d1da459 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -70,21 +70,15 @@ struct ov02c10_mode {
 	/* Horizontal timining size */
 	u32 hts;
 
-	/* Default vertical timining size */
-	u32 vts_def;
-
 	/* Min vertical timining size */
 	u32 vts_min;
 
-	/* MIPI lanes used */
-	u8 mipi_lanes;
-
 	/* Sensor register settings for this resolution */
 	const struct reg_sequence *reg_sequence;
 	const int sequence_length;
 	/* Sensor register settings for 1 or 2 lane config */
-	const struct reg_sequence *lane_settings;
-	const int lane_settings_length;
+	const struct reg_sequence *lane_settings[2];
+	const int lane_settings_length[2];
 };
 
 static const struct reg_sequence sensor_1928x1092_30fps_setting[] = {
@@ -358,25 +352,17 @@ static const struct ov02c10_mode supported_modes[] = {
 		.width = 1928,
 		.height = 1092,
 		.hts = 2280,
-		.vts_def = 1164,
 		.vts_min = 1164,
-		.mipi_lanes = 1,
 		.reg_sequence = sensor_1928x1092_30fps_setting,
 		.sequence_length = ARRAY_SIZE(sensor_1928x1092_30fps_setting),
-		.lane_settings = sensor_1928x1092_30fps_1lane_setting,
-		.lane_settings_length = ARRAY_SIZE(sensor_1928x1092_30fps_1lane_setting),
-	},
-	{
-		.width = 1928,
-		.height = 1092,
-		.hts = 2280,
-		.vts_def = 2328,
-		.vts_min = 1164,
-		.mipi_lanes = 2,
-		.reg_sequence = sensor_1928x1092_30fps_setting,
-		.sequence_length = ARRAY_SIZE(sensor_1928x1092_30fps_setting),
-		.lane_settings = sensor_1928x1092_30fps_2lane_setting,
-		.lane_settings_length = ARRAY_SIZE(sensor_1928x1092_30fps_2lane_setting),
+		.lane_settings = {
+			sensor_1928x1092_30fps_1lane_setting,
+			sensor_1928x1092_30fps_2lane_setting
+		},
+		.lane_settings_length = {
+			ARRAY_SIZE(sensor_1928x1092_30fps_1lane_setting),
+			ARRAY_SIZE(sensor_1928x1092_30fps_2lane_setting),
+		},
 	},
 };
 
@@ -499,7 +485,7 @@ static int ov02c10_init_controls(struct ov02c10 *ov02c10)
 	struct v4l2_ctrl_handler *ctrl_hdlr;
 	const struct ov02c10_mode *cur_mode;
 	s64 exposure_max, h_blank, pixel_rate;
-	u32 vblank_min, vblank_max, vblank_default;
+	u32 vblank_min, vblank_max, vblank_default, vts_def;
 	int ret = 0;
 
 	ctrl_hdlr = &ov02c10->ctrl_handler;
@@ -526,9 +512,15 @@ static int ov02c10_init_controls(struct ov02c10 *ov02c10)
 						V4L2_CID_PIXEL_RATE, 0,
 						pixel_rate, 1, pixel_rate);
 
+	/*
+	 * For default multiple min by number of lanes to keep the default
+	 * FPS the same indepenedent of the lane count.
+	 */
+	vts_def = cur_mode->vts_min * ov02c10->mipi_lanes;
+
 	vblank_min = cur_mode->vts_min - cur_mode->height;
 	vblank_max = OV02C10_VTS_MAX - cur_mode->height;
-	vblank_default = cur_mode->vts_def - cur_mode->height;
+	vblank_default = vts_def - cur_mode->height;
 	ov02c10->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &ov02c10_ctrl_ops,
 					    V4L2_CID_VBLANK, vblank_min,
 					    vblank_max, 1, vblank_default);
@@ -546,7 +538,7 @@ static int ov02c10_init_controls(struct ov02c10 *ov02c10)
 	v4l2_ctrl_new_std(ctrl_hdlr, &ov02c10_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
 			  OV02C10_DGTL_GAIN_MIN, OV02C10_DGTL_GAIN_MAX,
 			  OV02C10_DGTL_GAIN_STEP, OV02C10_DGTL_GAIN_DEFAULT);
-	exposure_max = cur_mode->vts_def - OV02C10_EXPOSURE_MAX_MARGIN;
+	exposure_max = vts_def - OV02C10_EXPOSURE_MAX_MARGIN;
 	ov02c10->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &ov02c10_ctrl_ops,
 					      V4L2_CID_EXPOSURE,
 					      OV02C10_EXPOSURE_MIN,
@@ -590,8 +582,8 @@ static int ov02c10_start_streaming(struct ov02c10 *ov02c10)
 		return ret;
 	}
 
-	reg_sequence = ov02c10->cur_mode->lane_settings;
-	sequence_length = ov02c10->cur_mode->lane_settings_length;
+	reg_sequence = ov02c10->cur_mode->lane_settings[ov02c10->mipi_lanes - 1];
+	sequence_length = ov02c10->cur_mode->lane_settings_length[ov02c10->mipi_lanes - 1];
 	ret = regmap_multi_reg_write(ov02c10->regmap,
 				     reg_sequence, sequence_length);
 	if (ret) {
@@ -775,10 +767,10 @@ static int ov02c10_set_format(struct v4l2_subdev *sd,
 	const struct ov02c10_mode *mode;
 	s32 vblank_def, h_blank;
 
-	if (ov02c10->mipi_lanes == 1)
-		mode = &supported_modes[0];
-	else
-		mode = &supported_modes[1];
+	mode = v4l2_find_nearest_size(supported_modes,
+				      ARRAY_SIZE(supported_modes), width,
+				      height, fmt->format.width,
+				      fmt->format.height);
 
 	mutex_lock(&ov02c10->mutex);
 	ov02c10_update_pad_format(mode, &fmt->format);
@@ -788,7 +780,7 @@ static int ov02c10_set_format(struct v4l2_subdev *sd,
 		ov02c10->cur_mode = mode;
 
 		/* Update limits and set FPS to default */
-		vblank_def = mode->vts_def - mode->height;
+		vblank_def = mode->vts_min * ov02c10->mipi_lanes - mode->height;
 		__v4l2_ctrl_modify_range(ov02c10->vblank,
 					 mode->vts_min - mode->height,
 					 OV02C10_VTS_MAX - mode->height, 1,
@@ -1013,8 +1005,7 @@ static int ov02c10_probe(struct i2c_client *client)
 
 	mutex_init(&ov02c10->mutex);
 	ov02c10->cur_mode = &supported_modes[0];
-	if (ov02c10->mipi_lanes == 2)
-		ov02c10->cur_mode = &supported_modes[1];
+
 	ret = ov02c10_init_controls(ov02c10);
 	if (ret) {
 		dev_err(&client->dev, "failed to init controls: %d", ret);
-- 
2.48.1


