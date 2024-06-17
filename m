Return-Path: <linux-media+bounces-13453-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1E690B44B
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 17:29:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA13028622D
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 15:29:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A80E78685;
	Mon, 17 Jun 2024 15:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hd+LlsyK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B0473537;
	Mon, 17 Jun 2024 15:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718636407; cv=none; b=GJrwX2iFs4e4q12TeAGFzAQnD48WewB11baJsYawZMfCV/LTRNGafwbPvJVmJXHQO1E6v4bqbZqa5i8Cjr+j5PsktbXRAANWx2TO9gD/FRn9R0687aOUZzuJ/M9C1zgGVDsOfPk3WDjZQd02NyQ2zLmg1x92HAxBrZxH7tAIW/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718636407; c=relaxed/simple;
	bh=dE7IawEElh22D2G0wNawPtW9eRHk+xPxa4PHlt2YBZo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YYc/KFcxApQf3f64zAzpPk95CCoZpTbXAdMG/3o6YDBhhaRve0ee/mD+mYSpQIg6emWSiwYss+2eWHrRGObinOFg6IVLBe5BtumnFsEgR5DqhGshBZSI3VIqcepCS6XpCxzdWVXRKVRbiFyS086wwSCCliK2dD+jsljqdifVDjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hd+LlsyK; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4218008c613so34010025e9.2;
        Mon, 17 Jun 2024 08:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718636403; x=1719241203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D/Vr185pwjfdWj1H42pwMIWOffHSW+e3AxP8pX1Tr7I=;
        b=hd+LlsyKxP+ipD7ukkUPGGWWHX74hpKGp/WjzG5vBKrKEgRJYJkZ5mCP6WyLMwTrJz
         nTq/Tfun+/IANb2VMEhpSHT0S4Ay/lQGv+wOdNRw3ljPHnYgYgVvRzrn/5eHk6L6pZu/
         OtzV2hECM+a+bd8S8nATgoC/SFcxPbp66l/puRdRGW68u72lQtf3eCSQvWWRAaRLe29i
         Bq4t75WBSIG/QxA+BXveP7ppM9MGm+WSM4o/m0DHK+xBSTXr6QEyKFDUiaRyqgNzchgW
         EyOj8GyVj4q29Eq177bSfrDLPTEf1d//NUog0gIUwQ9HGS01vsTUc5QAqv3PL6/gKOgL
         JC1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718636403; x=1719241203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D/Vr185pwjfdWj1H42pwMIWOffHSW+e3AxP8pX1Tr7I=;
        b=mLvSVaje8/aFJsFudT/Fga9mOqrRCPPfW2UH/gkS5PbhbVFyUmwyLlKKw/8FN8BG6Z
         10efDdTQhV8BoM5NRluZ7njChaFjsgu3dqa2QBRhI/N/0fH1XqV2O3WaQDbdgC1+TzVO
         ALQ+oOCvnMwYlycli0plNDhO1at4jXSc3TD7X1HhDBDzs/8IjKxDBCSj3oZoPmjL7InN
         0yop0WnS/JznOAWPtj2mZmbAWpqrUDGs1j6bKKC5cS7TrUTuSrQnmYBKPRe60P5LqGwr
         OL29XqsED3ryn6m9hfG4xBBgW4bKyera9Pt/ZJC5XM4CKKxH+nqviI/IqejiLdWR75LV
         snVg==
X-Forwarded-Encrypted: i=1; AJvYcCVVC8mjwtvlMYS4HfCTLg4Ou2c02iQJVpkGsWGFtJCR1C5Cs4PcWpB/plcApJQW4lw0WB9L2t4hhgHMlLhefpK2YLh4Um6us94QsR77KL23yUwv3OW0UkG7aykRX6haUvaKFD6BuVtRWwI=
X-Gm-Message-State: AOJu0Yxn76kW7Mnld2YMmEMb3pDytc2HJ2ox1YbzKWLm7ajyrNKqWOHa
	B66KUOzZHZK48AwjSGDoP+z7/8tts6vnBW9aGu37WtYv8XjTaqCm
X-Google-Smtp-Source: AGHT+IHWqpCQbFGslhl4bQyuZrE4VO1mOvN/RJzrFkao4p6hpKf6v+gno3oqprTBE2FzuQZE/8T4iA==
X-Received: by 2002:a05:600c:1f92:b0:421:7407:d778 with SMTP id 5b1f17b1804b1-423048272eamr74598355e9.14.1718636403406;
        Mon, 17 Jun 2024 08:00:03 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation.station (net-188-217-57-134.cust.vodafonedsl.it. [188.217.57.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42285574e33sm87060615e9.1.2024.06.17.08.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 08:00:02 -0700 (PDT)
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: 
Cc: linuxfancy@googlegroups.com,
	sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	tomm.merciai@gmail.com,
	julien.massot@collabora.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] media: i2c: max96717: add test pattern ctrl
Date: Mon, 17 Jun 2024 16:59:58 +0200
Message-Id: <20240617145958.1819069-2-tomm.merciai@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240617145958.1819069-1-tomm.merciai@gmail.com>
References: <20240617145958.1819069-1-tomm.merciai@gmail.com>
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
 drivers/media/i2c/max96717.c | 210 ++++++++++++++++++++++++++++++++---
 1 file changed, 194 insertions(+), 16 deletions(-)

diff --git a/drivers/media/i2c/max96717.c b/drivers/media/i2c/max96717.c
index 949306485873..c263bbca7318 100644
--- a/drivers/media/i2c/max96717.c
+++ b/drivers/media/i2c/max96717.c
@@ -16,6 +16,7 @@
 #include <linux/regmap.h>
 
 #include <media/v4l2-cci.h>
+#include <media/v4l2-ctrls.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
 
@@ -36,11 +37,37 @@
 #define MAX96717_DEV_ID  CCI_REG8(0xd)
 #define MAX96717_DEV_REV CCI_REG8(0xe)
 #define MAX96717_DEV_REV_MASK GENMASK(3, 0)
+#define MAX96717_IO_CHK0 CCI_REG8(0x24f)
+#define MAX96717_PATTERN_CLK_FREQ GENMASK(3, 1)
 
 /* VID_TX Z */
+#define MAX96717_VIDEO_TX0 CCI_REG8(0x110)
+#define MAX96717_VIDEO_AUTO_BPP BIT(3)
 #define MAX96717_VIDEO_TX2 CCI_REG8(0x112)
 #define MAX96717_VIDEO_PCLKDET BIT(7)
 
+/* VRX_PATGEN_0 */
+#define MAX96717_PATGEN_0              CCI_REG8(0x24e)
+#define MAX96717_PATGEN_1              CCI_REG8(0x26b)
+#define MAX96717_PATGEN_MODE           GENMASK(1, 0)
+#define MAX96717_PATGEN_VS_DLY         CCI_REG24(0x250)
+#define MAX96717_PATGEN_VS_HIGH        CCI_REG24(0x253)
+#define MAX96717_PATGEN_VS_LOW         CCI_REG24(0x256)
+#define MAX96717_PATGEN_V2H            CCI_REG24(0x259)
+#define MAX96717_PATGEN_HS_HIGH        CCI_REG16(0x25c)
+#define MAX96717_PATGEN_HS_LOW         CCI_REG16(0x25e)
+#define MAX96717_PATGEN_HS_CNT         CCI_REG16(0x260)
+#define MAX96717_PATGEN_V2D            CCI_REG24(0x262)
+#define MAX96717_PATGEN_DE_HIGH        CCI_REG16(0x265)
+#define MAX96717_PATGEN_DE_LOW         CCI_REG16(0x267)
+#define MAX96717_PATGEN_DE_CNT         CCI_REG16(0x269)
+#define MAX96717_PATGEN_GRAD_INC       CCI_REG8(0x26c)
+#define MAX96717_PATGEN_CHKB_COLOR_A   CCI_REG24(0x26d)
+#define MAX96717_PATGEN_CHKB_COLOR_B   CCI_REG24(0x270)
+#define MAX96717_PATGEN_CHKB_RPT_CNT_A CCI_REG8(0x273)
+#define MAX96717_PATGEN_CHKB_RPT_CNT_B CCI_REG8(0x274)
+#define MAX96717_PATGEN_CHKB_ALT       CCI_REG8(0x275)
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
@@ -131,6 +166,115 @@ static inline int max96717_start_csi(struct max96717_priv *priv, bool start)
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
+	cci_update_bits(priv->regmap, MAX96717_IO_CHK0,
+			MAX96717_PATTERN_CLK_FREQ, 0xa, &ret);
+
+	dev_info(&priv->client->dev, "height: %d width: %d\n", fmt->height,
+		 fmt->width);
+
+	cci_write(priv->regmap, MAX96717_PATGEN_VS_DLY, 0, &ret);
+	cci_write(priv->regmap, MAX96717_PATGEN_VS_HIGH, v_sw * h_tot, &ret);
+	cci_write(priv->regmap, MAX96717_PATGEN_VS_LOW,
+		  (v_active + v_fp + v_bp) * h_tot, &ret);
+	cci_write(priv->regmap, MAX96717_PATGEN_HS_HIGH, h_sw, &ret);
+	cci_write(priv->regmap, MAX96717_PATGEN_HS_LOW, h_active + h_fp + h_bp,
+		  &ret);
+	cci_write(priv->regmap, MAX96717_PATGEN_V2D,
+		  h_tot * (v_sw + v_bp) + (h_sw + h_bp), &ret);
+	cci_write(priv->regmap, MAX96717_PATGEN_HS_CNT, v_tot, &ret);
+	cci_write(priv->regmap, MAX96717_PATGEN_DE_HIGH, h_active, &ret);
+	cci_write(priv->regmap, MAX96717_PATGEN_DE_LOW, h_fp + h_sw + h_bp,
+		  &ret);
+	cci_write(priv->regmap, MAX96717_PATGEN_DE_CNT, v_active, &ret);
+	/* B G R */
+	cci_write(priv->regmap, MAX96717_PATGEN_CHKB_COLOR_A, 0xfecc00, &ret);
+	/* B G R */
+	cci_write(priv->regmap, MAX96717_PATGEN_CHKB_COLOR_B, 0x006aa7, &ret);
+	cci_write(priv->regmap, MAX96717_PATGEN_CHKB_RPT_CNT_A, 0x3c, &ret);
+	cci_write(priv->regmap, MAX96717_PATGEN_CHKB_RPT_CNT_B, 0x3c, &ret);
+	cci_write(priv->regmap, MAX96717_PATGEN_CHKB_ALT, 0x3c, &ret);
+	cci_write(priv->regmap, MAX96717_PATGEN_GRAD_INC, 0x10, &ret);
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
+	cci_write(priv->regmap, MAX96717_PATGEN_0, priv->pattern ? 0xfb : 0,
+		  &ret);
+
+	val = FIELD_PREP(MAX96717_PATGEN_MODE, priv->pattern);
+	cci_update_bits(priv->regmap, MAX96717_PATGEN_1, MAX96717_PATGEN_MODE,
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
+	/* Pattern generator doesn't work with tunnel mode */
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
@@ -352,20 +496,28 @@ static int max96717_enable_streams(struct v4l2_subdev *sd,
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
@@ -394,13 +546,23 @@ static int max96717_disable_streams(struct v4l2_subdev *sd,
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
@@ -513,6 +675,19 @@ static int max96717_subdev_init(struct max96717_priv *priv)
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
@@ -552,6 +727,8 @@ static int max96717_subdev_init(struct max96717_priv *priv)
 	v4l2_subdev_cleanup(&priv->sd);
 err_entity_cleanup:
 	media_entity_cleanup(&priv->sd.entity);
+err_free_ctrl:
+	v4l2_ctrl_handler_free(&priv->ctrl_handler);
 
 	return ret;
 }
@@ -563,6 +740,7 @@ static void max96717_subdev_uninit(struct max96717_priv *priv)
 	v4l2_async_nf_cleanup(&priv->notifier);
 	v4l2_subdev_cleanup(&priv->sd);
 	media_entity_cleanup(&priv->sd.entity);
+	v4l2_ctrl_handler_free(&priv->ctrl_handler);
 }
 
 struct max96717_pll_predef_freq {
-- 
2.34.1


