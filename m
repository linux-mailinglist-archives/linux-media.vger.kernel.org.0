Return-Path: <linux-media+bounces-28157-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A52A5FFAA
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 19:43:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BDF23B3DC6
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 18:43:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C67CD1EBA14;
	Thu, 13 Mar 2025 18:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AkHfsy2k"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FB21EE7B1
	for <linux-media@vger.kernel.org>; Thu, 13 Mar 2025 18:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741891415; cv=none; b=Vr1weTqZrukN2WU+LrU37+gdV09zW/Q2oN71YQytN46cNxnUlWK2kiJIlWhbYiWRq0frlNypU25wnnTESMZ9U+F2AWf4ld4VeEArRBxo1Nbs8o3qCG/dThfGdTCsZqlwmiS9VKl7KN1E4IedDLmMWQ4HKGO0bbSNZyLkbdRTOeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741891415; c=relaxed/simple;
	bh=nPI5LnJTaaOlW3Hi17cJkxi2pJiSlTDDnBvuBh98Gnc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lpTWLCU10zlzNjAfdS2tVBZsz8xeoV/5sHmV+fJXhL51E7OQrG0AWIvM6HI7A//J+4ekUcK8Jxao1Ij+tMaNLf9aNdYIuSY1eY3OtPLFA0WClX1D0shbe8t3kF01a7svCZTQJNlUMd95C+gZDUp4lfLSRK3A9ZnejGd+gTWmDp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AkHfsy2k; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741891412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XjZTVrzFNhXKswbVEu0W+WdDn/XUGAJhoMEJalg+Kr0=;
	b=AkHfsy2kDgJnPih+5/PIfUAsKESgttO975lHWPRlEbt8YjFFLzngUg29WCCiVpU+tw4Zus
	fdaKN3z9/JRrFS7Kuvxed5zb6fEOIVfXA3kOkLvsG4mrlOeP6CHndwT1jivx+YuA64iFeB
	5XaDT3GeYggbGLmDJUaca6xM9G5uRUA=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-58-VLcbs-9jODilJtfO8q8c3Q-1; Thu,
 13 Mar 2025 14:43:28 -0400
X-MC-Unique: VLcbs-9jODilJtfO8q8c3Q-1
X-Mimecast-MFC-AGG-ID: VLcbs-9jODilJtfO8q8c3Q_1741891407
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C38681809CA5;
	Thu, 13 Mar 2025 18:43:26 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.45.224.5])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 82894300376F;
	Thu, 13 Mar 2025 18:43:23 +0000 (UTC)
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
Subject: [PATCH v8 02/14] media: ov02c10: merge shared register settings into a shared reg_sequence array
Date: Thu, 13 Mar 2025 19:43:02 +0100
Message-ID: <20250313184314.91410-3-hdegoede@redhat.com>
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

Merge shared register settings into a shared reg_sequence array.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov02c10.c | 256 +++++-------------------------------
 1 file changed, 34 insertions(+), 222 deletions(-)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index 291da9ee1788..f18b48fe8c0d 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -85,20 +85,21 @@ struct ov02c10_mode {
 	/* Sensor register settings for this resolution */
 	const struct reg_sequence *reg_sequence;
 	const int sequence_length;
+	/* Sensor register settings for 1 or 2 lane config */
+	const struct reg_sequence *lane_settings;
+	const int lane_settings_length;
 };
 
-static const struct reg_sequence sensor_1928x1092_1lane_30fps_setting[] = {
+static const struct reg_sequence sensor_1928x1092_30fps_setting[] = {
 	{0x0301, 0x08},
 	{0x0303, 0x06},
 	{0x0304, 0x01},
 	{0x0305, 0xe0},
 	{0x0313, 0x40},
 	{0x031c, 0x4f},
-	{0x301b, 0xd2},
 	{0x3020, 0x97},
 	{0x3022, 0x01},
 	{0x3026, 0xb4},
-	{0x3027, 0xe1},
 	{0x303b, 0x00},
 	{0x303c, 0x4f},
 	{0x303d, 0xe6},
@@ -174,10 +175,6 @@ static const struct reg_sequence sensor_1928x1092_1lane_30fps_setting[] = {
 	{0x3809, 0x88},
 	{0x380a, 0x04},
 	{0x380b, 0x44},
-	{0x380c, 0x08},
-	{0x380d, 0xe8},
-	{0x380e, 0x04},
-	{0x380f, 0x8c},
 	{0x3810, 0x00},
 	{0x3811, 0x02},
 	{0x3812, 0x00},
@@ -209,7 +206,6 @@ static const struct reg_sequence sensor_1928x1092_1lane_30fps_setting[] = {
 	{0x394b, 0x06},
 	{0x394c, 0x06},
 	{0x394d, 0x08},
-	{0x394e, 0x0b},
 	{0x394f, 0x01},
 	{0x3950, 0x01},
 	{0x3951, 0x01},
@@ -286,11 +282,9 @@ static const struct reg_sequence sensor_1928x1092_1lane_30fps_setting[] = {
 	{0x450a, 0x04},
 	{0x450e, 0x00},
 	{0x450f, 0x00},
-	{0x4800, 0x24},
 	{0x4900, 0x00},
 	{0x4901, 0x00},
 	{0x4902, 0x01},
-	{0x5000, 0xf5},
 	{0x5001, 0x50},
 	{0x5006, 0x00},
 	{0x5080, 0x40},
@@ -304,6 +298,18 @@ static const struct reg_sequence sensor_1928x1092_1lane_30fps_setting[] = {
 	{0x4815, 0x40},
 	{0x4816, 0x12},
 	{0x4f00, 0x01},
+};
+
+static const struct reg_sequence sensor_1928x1092_30fps_1lane_setting[] = {
+	{0x301b, 0xd2},
+	{0x3027, 0xe1},
+	{0x380c, 0x08},
+	{0x380d, 0xe8},
+	{0x380e, 0x04},
+	{0x380f, 0x8c},
+	{0x394e, 0x0b},
+	{0x4800, 0x24},
+	{0x5000, 0xf5},
 	/* plls */
 	{0x0303, 0x05},
 	{0x0305, 0x90},
@@ -311,211 +317,17 @@ static const struct reg_sequence sensor_1928x1092_1lane_30fps_setting[] = {
 	{0x3016, 0x12},
 };
 
-static const struct reg_sequence sensor_1928x1092_2lane_30fps_setting[] = {
-	{0x0301, 0x08},
-	{0x0303, 0x06},
-	{0x0304, 0x01},
-	{0x0305, 0xe0},
-	{0x0313, 0x40},
-	{0x031c, 0x4f},
+static const struct reg_sequence sensor_1928x1092_30fps_2lane_setting[] = {
 	{0x301b, 0xf0},
-	{0x3020, 0x97},
-	{0x3022, 0x01},
-	{0x3026, 0xb4},
 	{0x3027, 0xf1},
-	{0x303b, 0x00},
-	{0x303c, 0x4f},
-	{0x303d, 0xe6},
-	{0x303e, 0x00},
-	{0x303f, 0x03},
-	{0x3021, 0x23},
-	{0x3501, 0x04},
-	{0x3502, 0x6c},
-	{0x3504, 0x0c},
-	{0x3507, 0x00},
-	{0x3508, 0x08},
-	{0x3509, 0x00},
-	{0x350a, 0x01},
-	{0x350b, 0x00},
-	{0x350c, 0x41},
-	{0x3600, 0x84},
-	{0x3603, 0x08},
-	{0x3610, 0x57},
-	{0x3611, 0x1b},
-	{0x3613, 0x78},
-	{0x3623, 0x00},
-	{0x3632, 0xa0},
-	{0x3642, 0xe8},
-	{0x364c, 0x70},
-	{0x365f, 0x0f},
-	{0x3708, 0x30},
-	{0x3714, 0x24},
-	{0x3725, 0x02},
-	{0x3737, 0x08},
-	{0x3739, 0x28},
-	{0x3749, 0x32},
-	{0x374a, 0x32},
-	{0x374b, 0x32},
-	{0x374c, 0x32},
-	{0x374d, 0x81},
-	{0x374e, 0x81},
-	{0x374f, 0x81},
-	{0x3752, 0x36},
-	{0x3753, 0x36},
-	{0x3754, 0x36},
-	{0x3761, 0x00},
-	{0x376c, 0x81},
-	{0x3774, 0x18},
-	{0x3776, 0x08},
-	{0x377c, 0x81},
-	{0x377d, 0x81},
-	{0x377e, 0x81},
-	{0x37a0, 0x44},
-	{0x37a6, 0x44},
-	{0x37aa, 0x0d},
-	{0x37ae, 0x00},
-	{0x37cb, 0x03},
-	{0x37cc, 0x01},
-	{0x37d8, 0x02},
-	{0x37d9, 0x10},
-	{0x37e1, 0x10},
-	{0x37e2, 0x18},
-	{0x37e3, 0x08},
-	{0x37e4, 0x08},
-	{0x37e5, 0x02},
-	{0x37e6, 0x08},
-
-	/* 1928x1092 */
-	{0x3800, 0x00},
-	{0x3801, 0x00},
-	{0x3802, 0x00},
-	{0x3803, 0x00},
-	{0x3804, 0x07},
-	{0x3805, 0x8f},
-	{0x3806, 0x04},
-	{0x3807, 0x47},
-	{0x3808, 0x07},
-	{0x3809, 0x88},
-	{0x380a, 0x04},
-	{0x380b, 0x44},
 	{0x380c, 0x04},
 	{0x380d, 0x74},
 	{0x380e, 0x09},
 	{0x380f, 0x18},
-	{0x3810, 0x00},
-	{0x3811, 0x02},
-	{0x3812, 0x00},
-	{0x3813, 0x02},
-	{0x3814, 0x01},
-	{0x3815, 0x01},
-	{0x3816, 0x01},
-	{0x3817, 0x01},
-
-	{0x3820, 0xb0},
-	{0x3821, 0x00},
-	{0x3822, 0x80},
-	{0x3823, 0x08},
-	{0x3824, 0x00},
-	{0x3825, 0x20},
-	{0x3826, 0x00},
-	{0x3827, 0x08},
-	{0x382a, 0x00},
-	{0x382b, 0x08},
-	{0x382d, 0x00},
-	{0x382e, 0x00},
-	{0x382f, 0x23},
-	{0x3834, 0x00},
-	{0x3839, 0x00},
-	{0x383a, 0xd1},
-	{0x383e, 0x03},
-	{0x393d, 0x29},
-	{0x393f, 0x6e},
-	{0x394b, 0x06},
-	{0x394c, 0x06},
-	{0x394d, 0x08},
 	{0x394e, 0x0a},
-	{0x394f, 0x01},
-	{0x3950, 0x01},
-	{0x3951, 0x01},
-	{0x3952, 0x01},
-	{0x3953, 0x01},
-	{0x3954, 0x01},
-	{0x3955, 0x01},
-	{0x3956, 0x01},
-	{0x3957, 0x0e},
-	{0x3958, 0x08},
-	{0x3959, 0x08},
-	{0x395a, 0x08},
-	{0x395b, 0x13},
-	{0x395c, 0x09},
-	{0x395d, 0x05},
-	{0x395e, 0x02},
-	{0x395f, 0x00},
-	{0x395f, 0x00},
-	{0x3960, 0x00},
-	{0x3961, 0x00},
-	{0x3962, 0x00},
-	{0x3963, 0x00},
-	{0x3964, 0x00},
-	{0x3965, 0x00},
-	{0x3966, 0x00},
-	{0x3967, 0x00},
-	{0x3968, 0x01},
-	{0x3969, 0x01},
-	{0x396a, 0x01},
-	{0x396b, 0x01},
-	{0x396c, 0x10},
-	{0x396d, 0xf0},
-	{0x396e, 0x11},
-	{0x396f, 0x00},
-	{0x3970, 0x37},
-	{0x3971, 0x37},
-	{0x3972, 0x37},
-	{0x3973, 0x37},
-	{0x3974, 0x00},
-	{0x3975, 0x3c},
-	{0x3976, 0x3c},
-	{0x3977, 0x3c},
-	{0x3978, 0x3c},
-	{0x3c00, 0x0f},
-	{0x3c20, 0x01},
-	{0x3c21, 0x08},
-	{0x3f00, 0x8b},
-	{0x3f02, 0x0f},
-	{0x4000, 0xc3},
-	{0x4001, 0xe0},
-	{0x4002, 0x00},
-	{0x4003, 0x40},
-	{0x4008, 0x04},
-	{0x4009, 0x23},
-	{0x400a, 0x04},
-	{0x400b, 0x01},
 	{0x4041, 0x20},
-	{0x4077, 0x06},
-	{0x4078, 0x00},
-	{0x4079, 0x1a},
-	{0x407a, 0x7f},
-	{0x407b, 0x01},
-	{0x4080, 0x03},
-	{0x4081, 0x84},
-	{0x4308, 0x03},
-	{0x4309, 0xff},
-	{0x430d, 0x00},
-	{0x4806, 0x00},
-	{0x4813, 0x00},
-	{0x4837, 0x10},
-	{0x4857, 0x05},
 	{0x4884, 0x04},
-	{0x4500, 0x07},
-	{0x4501, 0x00},
-	{0x4503, 0x00},
-	{0x450a, 0x04},
-	{0x450e, 0x00},
-	{0x450f, 0x00},
 	{0x4800, 0x64},
-	{0x4900, 0x00},
-	{0x4901, 0x00},
-	{0x4902, 0x01},
 	{0x4d00, 0x03},
 	{0x4d01, 0xd8},
 	{0x4d02, 0xba},
@@ -524,20 +336,7 @@ static const struct reg_sequence sensor_1928x1092_2lane_30fps_setting[] = {
 	{0x4d05, 0x34},
 	{0x4d0d, 0x00},
 	{0x5000, 0xfd},
-	{0x5001, 0x50},
-	{0x5006, 0x00},
-	{0x5080, 0x40},
-	{0x5181, 0x2b},
-	{0x5202, 0xa3},
-	{0x5206, 0x01},
-	{0x5207, 0x00},
-	{0x520a, 0x01},
-	{0x520b, 0x00},
-	{0x365d, 0x00},
-	{0x4815, 0x40},
-	{0x4816, 0x12},
 	{0x481f, 0x30},
-	{0x4f00, 0x01},
 	/* plls */
 	{0x0303, 0x05},
 	{0x0305, 0x90},
@@ -565,8 +364,10 @@ static const struct ov02c10_mode supported_modes[] = {
 		.vts_def = 1164,
 		.vts_min = 1164,
 		.mipi_lanes = 1,
-		.reg_sequence = sensor_1928x1092_1lane_30fps_setting,
-		.sequence_length = ARRAY_SIZE(sensor_1928x1092_1lane_30fps_setting),
+		.reg_sequence = sensor_1928x1092_30fps_setting,
+		.sequence_length = ARRAY_SIZE(sensor_1928x1092_30fps_setting),
+		.lane_settings = sensor_1928x1092_30fps_1lane_setting,
+		.lane_settings_length = ARRAY_SIZE(sensor_1928x1092_30fps_1lane_setting),
 	},
 	{
 		.width = 1928,
@@ -575,8 +376,10 @@ static const struct ov02c10_mode supported_modes[] = {
 		.vts_def = 2328,
 		.vts_min = 2328,
 		.mipi_lanes = 2,
-		.reg_sequence = sensor_1928x1092_2lane_30fps_setting,
-		.sequence_length = ARRAY_SIZE(sensor_1928x1092_2lane_30fps_setting),
+		.reg_sequence = sensor_1928x1092_30fps_setting,
+		.sequence_length = ARRAY_SIZE(sensor_1928x1092_30fps_setting),
+		.lane_settings = sensor_1928x1092_30fps_2lane_setting,
+		.lane_settings_length = ARRAY_SIZE(sensor_1928x1092_30fps_2lane_setting),
 	},
 };
 
@@ -791,6 +594,15 @@ static int ov02c10_start_streaming(struct ov02c10 *ov02c10)
 		return ret;
 	}
 
+	reg_sequence = ov02c10->cur_mode->lane_settings;
+	sequence_length = ov02c10->cur_mode->lane_settings_length;
+	ret = regmap_multi_reg_write(ov02c10->regmap,
+				     reg_sequence, sequence_length);
+	if (ret) {
+		dev_err(&client->dev, "failed to write lane settings\n");
+		return ret;
+	}
+
 	ret = __v4l2_ctrl_handler_setup(ov02c10->sd.ctrl_handler);
 	if (ret)
 		return ret;
-- 
2.48.1


