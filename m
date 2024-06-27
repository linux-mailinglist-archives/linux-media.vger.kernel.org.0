Return-Path: <linux-media+bounces-14265-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F41C991AAF6
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 17:18:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 760511F24F35
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 15:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4E3D198E80;
	Thu, 27 Jun 2024 15:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bZpipSl0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8B21327E5;
	Thu, 27 Jun 2024 15:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719501496; cv=none; b=dSnfjokNoa2WlEkztQ3Na5kHJfoo1bnsdlX21uLXSeRrBTspOXcHXP7OLX/61fBvoJzDf6VOiEx8svLJCnIk2xNvUMXtnjcH9FT3P/fIwzo/rlUoBZXlHwgoDYKqW+rVV0k2DiRpEJ7t1Iy2uvqkdHPMhX37hccU7CyYfEVMf5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719501496; c=relaxed/simple;
	bh=4FN17hwiOOR4kWltOR8kKLGuAbA0CI9kPbkdubBN6NU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KN4BuZ/aS43WJosS3nMGMPjd5L4vPIxD70wRkmYIU+CBE0XyoGvW9chpwrjAgYshLMXCewlzE5bMjPD5ZkTMDvQjtTvzx1GmVczX83aTcV1to0gBGfntTdwYgY8nJz1UcEy9+66hp11Xk1591araIwjkXS4CUls+Zu6EBwEJaDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bZpipSl0; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a6fe7a0cb58so349537266b.1;
        Thu, 27 Jun 2024 08:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719501493; x=1720106293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pwj00KbFGVI9iZfJpyj93Cdc+KrMZypezfv+qEu90t0=;
        b=bZpipSl0xg8FSwqAl0H2FTun45Ne/n5qfP69nb0whqLKgNCIq3LyDI7eTz81tCi17O
         MQEgENJrLlYTWqhUiJ8CP1nWjuclPpy0/MNqsLrpxhgC+8RpLYavC2NHA5CaKiS9nH8O
         sTk5PuwH7oq5NQUOdIxEvD5v+7ZPVk0SFV1TuLSxsHQ27dVhOy71Dae1Mw5Fd6BKdmPw
         p7xicxXB39T1wPMXhE35zo/XazN5EGzJpLgR1F36RxuuqEepH6Jo9I4hiI3m4WtXO0er
         uBFDQfl6Yd4jEl6sfSk1Kge/UJ6pXbrHQP0V1vcNAqxvGdR1MUMpQBVkmIYSKV6QvHC9
         T+3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719501493; x=1720106293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pwj00KbFGVI9iZfJpyj93Cdc+KrMZypezfv+qEu90t0=;
        b=gMA5uJQIvB2Ogq9E1cK/JBGo6eW4xAe+DGz2aZp8MRZuinXOVXBRwyZqIxgFXBVv+L
         KUvxxmQ+7jCwMWOPHBEazPUBI/H9t+Hq+AzvFUVQPjpO6WgYkX/1SuPSx/y381v8sUoO
         ktfmd4L0MsYz2LKTMZcEA9h31yQFnyhd29WrnngMpoXBZGspPEdwHogF/ZZXg7MYKDpm
         BPFlbLuxi2H53EO9XVjOrl7qeKdyJFMhWQ5aAuZqJ02djNa17EUs5vZoMS+qs4EAsFZk
         snQ4i4gVjYLAA3Qv7M2tMPXNdH5JTNSjO72LwloMNMvBlJS0XgpUtPgka15vKvvK4QJ8
         kqqw==
X-Forwarded-Encrypted: i=1; AJvYcCWgENgVJuOpOV0Hx1MEtp3TRccWlAKgc0/WYgTGQkWa4D4I5gCDEDbYk8rk6yDlqBgas0TsODCCU8pqT2qQmGkf81XZOgP0pDAzzdiqTSV00SooVgXw3Y4jJ46QyWtVFYiejKj9ZWLv50Q=
X-Gm-Message-State: AOJu0YxA0VO7VbzZJt6cpmx2A7PSdd8j/R52zisttDKdqnUr4FHUvSNn
	ZUr6darTP+zi7CxnN8AAvnblb1yKH+eI8yKqtK6W1kvTt1VffgL7
X-Google-Smtp-Source: AGHT+IH5K2AU0qfBFKOl160r+EwI+rNTRpquBW4X3vSJcrYQCeKKEGAwBO+3NlRPmouYzu1lNIi7sA==
X-Received: by 2002:a50:ccc4:0:b0:57c:8e57:c3f0 with SMTP id 4fb4d7f45d1cf-57d4bd740dbmr10794284a12.16.1719501492578;
        Thu, 27 Jun 2024 08:18:12 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation.station (net-188-217-57-134.cust.vodafonedsl.it. [188.217.57.134])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5855a0f07cdsm553347a12.42.2024.06.27.08.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 08:18:12 -0700 (PDT)
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: 
Cc: linuxfancy@googlegroups.com,
	sakari.ailus@linux.intel.com,
	tomm.merciai@gmail.com,
	michael.roeder@avnet.eu,
	julien.massot@collabora.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/1] media: i2c: max96717: add test pattern ctrl
Date: Thu, 27 Jun 2024 17:18:06 +0200
Message-Id: <20240627151806.3999400-2-tomm.merciai@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240627151806.3999400-1-tomm.merciai@gmail.com>
References: <20240627151806.3999400-1-tomm.merciai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add v4l2 test pattern control.

Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
---
Changes since v1:
 - Rename and move pattern regs under VTX section as suggested by JMassot
 - Fix VTX regs order
 - Add comment saying that the deserializer should manage the link in
   pixel mode as suggested by JMassot

 drivers/media/i2c/max96717.c | 213 ++++++++++++++++++++++++++++++++---
 1 file changed, 197 insertions(+), 16 deletions(-)

diff --git a/drivers/media/i2c/max96717.c b/drivers/media/i2c/max96717.c
index 949306485873..859a439b64d9 100644
--- a/drivers/media/i2c/max96717.c
+++ b/drivers/media/i2c/max96717.c
@@ -16,6 +16,7 @@
 #include <linux/regmap.h>
 
 #include <media/v4l2-cci.h>
+#include <media/v4l2-ctrls.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
 
@@ -38,9 +39,35 @@
 #define MAX96717_DEV_REV_MASK GENMASK(3, 0)
 
 /* VID_TX Z */
+#define MAX96717_VIDEO_TX0 CCI_REG8(0x110)
+#define MAX96717_VIDEO_AUTO_BPP BIT(3)
 #define MAX96717_VIDEO_TX2 CCI_REG8(0x112)
 #define MAX96717_VIDEO_PCLKDET BIT(7)
 
+/* VTX_Z */
+#define MAX96717_VTX0                  CCI_REG8(0x24e)
+#define MAX96717_VTX1                  CCI_REG8(0x24f)
+#define MAX96717_PATTERN_CLK_FREQ      GENMASK(3, 1)
+#define MAX96717_VTX_VS_DLY            CCI_REG24(0x250)
+#define MAX96717_VTX_VS_HIGH           CCI_REG24(0x253)
+#define MAX96717_VTX_VS_LOW            CCI_REG24(0x256)
+#define MAX96717_VTX_V2H               CCI_REG24(0x259)
+#define MAX96717_VTX_HS_HIGH           CCI_REG16(0x25c)
+#define MAX96717_VTX_HS_LOW            CCI_REG16(0x25e)
+#define MAX96717_VTX_HS_CNT            CCI_REG16(0x260)
+#define MAX96717_VTX_V2D               CCI_REG24(0x262)
+#define MAX96717_VTX_DE_HIGH           CCI_REG16(0x265)
+#define MAX96717_VTX_DE_LOW            CCI_REG16(0x267)
+#define MAX96717_VTX_DE_CNT            CCI_REG16(0x269)
+#define MAX96717_VTX29                 CCI_REG8(0x26b)
+#define MAX96717_VTX_MODE              GENMASK(1, 0)
+#define MAX96717_VTX_GRAD_INC          CCI_REG8(0x26c)
+#define MAX96717_VTX_CHKB_COLOR_A      CCI_REG24(0x26d)
+#define MAX96717_VTX_CHKB_COLOR_B      CCI_REG24(0x270)
+#define MAX96717_VTX_CHKB_RPT_CNT_A    CCI_REG8(0x273)
+#define MAX96717_VTX_CHKB_RPT_CNT_B    CCI_REG8(0x274)
+#define MAX96717_VTX_CHKB_ALT          CCI_REG8(0x275)
+
 /* GPIO */
 #define MAX96717_NUM_GPIO         11
 #define MAX96717_GPIO_REG_A(gpio) CCI_REG8(0x2be + (gpio) * 3)
@@ -82,6 +109,12 @@
 /* MISC */
 #define PIO_SLEW_1 CCI_REG8(0x570)
 
+enum max96717_vpg_mode {
+	MAX96717_VPG_DISABLED = 0,
+	MAX96717_VPG_CHECKERBOARD = 1,
+	MAX96717_VPG_GRADIENT = 2,
+};
+
 struct max96717_priv {
 	struct i2c_client		  *client;
 	struct regmap			  *regmap;
@@ -89,6 +122,7 @@ struct max96717_priv {
 	struct v4l2_mbus_config_mipi_csi2 mipi_csi2;
 	struct v4l2_subdev                sd;
 	struct media_pad                  pads[MAX96717_PORTS];
+	struct v4l2_ctrl_handler          ctrl_handler;
 	struct v4l2_async_notifier        notifier;
 	struct v4l2_subdev                *source_sd;
 	u16                               source_sd_pad;
@@ -96,6 +130,7 @@ struct max96717_priv {
 	u8                                pll_predef_index;
 	struct clk_hw                     clk_hw;
 	struct gpio_chip                  gpio_chip;
+	enum max96717_vpg_mode            pattern;
 };
 
 static inline struct max96717_priv *sd_to_max96717(struct v4l2_subdev *sd)
@@ -131,6 +166,118 @@ static inline int max96717_start_csi(struct max96717_priv *priv, bool start)
 			       start ? MAX96717_START_PORT_B : 0, NULL);
 }
 
+static int max96717_apply_patgen_timing(struct max96717_priv *priv,
+					struct v4l2_subdev_state *state)
+{
+	struct v4l2_mbus_framefmt *fmt =
+		v4l2_subdev_state_get_format(state, MAX96717_PAD_SOURCE);
+	const u32 h_active = fmt->width;
+	const u32 h_fp = 88;
+	const u32 h_sw = 44;
+	const u32 h_bp = 148;
+	u32 h_tot;
+	const u32 v_active = fmt->height;
+	const u32 v_fp = 4;
+	const u32 v_sw = 5;
+	const u32 v_bp = 36;
+	u32 v_tot;
+	int ret = 0;
+
+	h_tot = h_active + h_fp + h_sw + h_bp;
+	v_tot = v_active + v_fp + v_sw + v_bp;
+
+	/* 75 Mhz pixel clock */
+	cci_update_bits(priv->regmap, MAX96717_VTX1,
+			MAX96717_PATTERN_CLK_FREQ, 0xa, &ret);
+
+	dev_info(&priv->client->dev, "height: %d width: %d\n", fmt->height,
+		 fmt->width);
+
+	cci_write(priv->regmap, MAX96717_VTX_VS_DLY, 0, &ret);
+	cci_write(priv->regmap, MAX96717_VTX_VS_HIGH, v_sw * h_tot, &ret);
+	cci_write(priv->regmap, MAX96717_VTX_VS_LOW,
+		  (v_active + v_fp + v_bp) * h_tot, &ret);
+	cci_write(priv->regmap, MAX96717_VTX_HS_HIGH, h_sw, &ret);
+	cci_write(priv->regmap, MAX96717_VTX_HS_LOW, h_active + h_fp + h_bp,
+		  &ret);
+	cci_write(priv->regmap, MAX96717_VTX_V2D,
+		  h_tot * (v_sw + v_bp) + (h_sw + h_bp), &ret);
+	cci_write(priv->regmap, MAX96717_VTX_HS_CNT, v_tot, &ret);
+	cci_write(priv->regmap, MAX96717_VTX_DE_HIGH, h_active, &ret);
+	cci_write(priv->regmap, MAX96717_VTX_DE_LOW, h_fp + h_sw + h_bp,
+		  &ret);
+	cci_write(priv->regmap, MAX96717_VTX_DE_CNT, v_active, &ret);
+	/* B G R */
+	cci_write(priv->regmap, MAX96717_VTX_CHKB_COLOR_A, 0xfecc00, &ret);
+	/* B G R */
+	cci_write(priv->regmap, MAX96717_VTX_CHKB_COLOR_B, 0x006aa7, &ret);
+	cci_write(priv->regmap, MAX96717_VTX_CHKB_RPT_CNT_A, 0x3c, &ret);
+	cci_write(priv->regmap, MAX96717_VTX_CHKB_RPT_CNT_B, 0x3c, &ret);
+	cci_write(priv->regmap, MAX96717_VTX_CHKB_ALT, 0x3c, &ret);
+	cci_write(priv->regmap, MAX96717_VTX_GRAD_INC, 0x10, &ret);
+
+	return ret;
+}
+
+static int max96717_apply_patgen(struct max96717_priv *priv,
+				 struct v4l2_subdev_state *state)
+{
+	unsigned int val;
+	int ret = 0;
+
+	if (priv->pattern)
+		ret = max96717_apply_patgen_timing(priv, state);
+
+	cci_write(priv->regmap, MAX96717_VTX0, priv->pattern ? 0xfb : 0,
+		  &ret);
+
+	val = FIELD_PREP(MAX96717_VTX_MODE, priv->pattern);
+	cci_update_bits(priv->regmap, MAX96717_VTX29, MAX96717_VTX_MODE,
+			val, &ret);
+	return ret;
+}
+
+static int max96717_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct max96717_priv *priv =
+		container_of(ctrl->handler, struct max96717_priv, ctrl_handler);
+	int ret;
+
+	switch (ctrl->id) {
+	case V4L2_CID_TEST_PATTERN:
+		if (priv->enabled_source_streams)
+			return -EBUSY;
+		priv->pattern = ctrl->val;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	/* Use bpp from bpp register */
+	ret = cci_update_bits(priv->regmap, MAX96717_VIDEO_TX0,
+			      MAX96717_VIDEO_AUTO_BPP,
+			      priv->pattern ? 0 : MAX96717_VIDEO_AUTO_BPP,
+			      NULL);
+
+	/*
+	 * Pattern generator doesn't work with tunnel mode.
+	 * Needs RGB color format and deserializer tunnel mode must be disabled.
+	 */
+	return cci_update_bits(priv->regmap, MAX96717_MIPI_RX_EXT11,
+			       MAX96717_TUN_MODE,
+			       priv->pattern ? 0 : MAX96717_TUN_MODE, &ret);
+}
+
+static const char * const max96717_test_pattern[] = {
+	"Disabled",
+	"Checkerboard",
+	"Gradient"
+};
+
+static const struct v4l2_ctrl_ops max96717_ctrl_ops = {
+	.s_ctrl = max96717_s_ctrl,
+};
+
 static int max96717_gpiochip_get(struct gpio_chip *gpiochip,
 				 unsigned int offset)
 {
@@ -352,20 +499,28 @@ static int max96717_enable_streams(struct v4l2_subdev *sd,
 	u64 sink_streams;
 	int ret;
 
-	sink_streams = v4l2_subdev_state_xlate_streams(state,
-						       MAX96717_PAD_SOURCE,
-						       MAX96717_PAD_SINK,
-						       &streams_mask);
-
 	if (!priv->enabled_source_streams)
 		max96717_start_csi(priv, true);
 
-	ret = v4l2_subdev_enable_streams(priv->source_sd, priv->source_sd_pad,
-					 sink_streams);
-	if (ret) {
-		dev_err(dev, "Fail to start streams:%llu on remote subdev\n",
-			sink_streams);
+	ret = max96717_apply_patgen(priv, state);
+	if (ret)
 		goto stop_csi;
+
+	if (!priv->pattern) {
+		sink_streams =
+			v4l2_subdev_state_xlate_streams(state,
+							MAX96717_PAD_SOURCE,
+							MAX96717_PAD_SINK,
+							&streams_mask);
+
+		ret = v4l2_subdev_enable_streams(priv->source_sd,
+						 priv->source_sd_pad,
+						 sink_streams);
+		if (ret) {
+			dev_err(dev, "Fail to start streams:%llu on remote subdev\n",
+				sink_streams);
+			goto stop_csi;
+		}
 	}
 
 	priv->enabled_source_streams |= streams_mask;
@@ -394,13 +549,23 @@ static int max96717_disable_streams(struct v4l2_subdev *sd,
 	if (!priv->enabled_source_streams)
 		max96717_start_csi(priv, false);
 
-	sink_streams = v4l2_subdev_state_xlate_streams(state,
-						       MAX96717_PAD_SOURCE,
-						       MAX96717_PAD_SINK,
-						       &streams_mask);
+	if (!priv->pattern) {
+		int ret;
+
+		sink_streams =
+			v4l2_subdev_state_xlate_streams(state,
+							MAX96717_PAD_SOURCE,
+							MAX96717_PAD_SINK,
+							&streams_mask);
 
-	return v4l2_subdev_disable_streams(priv->source_sd, priv->source_sd_pad,
-					   sink_streams);
+		ret = v4l2_subdev_disable_streams(priv->source_sd,
+						  priv->source_sd_pad,
+						  sink_streams);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
 }
 
 static const struct v4l2_subdev_pad_ops max96717_pad_ops = {
@@ -513,6 +678,19 @@ static int max96717_subdev_init(struct max96717_priv *priv)
 	v4l2_i2c_subdev_init(&priv->sd, priv->client, &max96717_subdev_ops);
 	priv->sd.internal_ops = &max96717_internal_ops;
 
+	v4l2_ctrl_handler_init(&priv->ctrl_handler, 1);
+	priv->sd.ctrl_handler = &priv->ctrl_handler;
+
+	v4l2_ctrl_new_std_menu_items(&priv->ctrl_handler,
+				     &max96717_ctrl_ops,
+				     V4L2_CID_TEST_PATTERN,
+				     ARRAY_SIZE(max96717_test_pattern) - 1,
+				     0, 0, max96717_test_pattern);
+	if (priv->ctrl_handler.error) {
+		ret = priv->ctrl_handler.error;
+		goto err_free_ctrl;
+	}
+
 	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
 	priv->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
 	priv->sd.entity.ops = &max96717_entity_ops;
@@ -552,6 +730,8 @@ static int max96717_subdev_init(struct max96717_priv *priv)
 	v4l2_subdev_cleanup(&priv->sd);
 err_entity_cleanup:
 	media_entity_cleanup(&priv->sd.entity);
+err_free_ctrl:
+	v4l2_ctrl_handler_free(&priv->ctrl_handler);
 
 	return ret;
 }
@@ -563,6 +743,7 @@ static void max96717_subdev_uninit(struct max96717_priv *priv)
 	v4l2_async_nf_cleanup(&priv->notifier);
 	v4l2_subdev_cleanup(&priv->sd);
 	media_entity_cleanup(&priv->sd.entity);
+	v4l2_ctrl_handler_free(&priv->ctrl_handler);
 }
 
 struct max96717_pll_predef_freq {
-- 
2.34.1


