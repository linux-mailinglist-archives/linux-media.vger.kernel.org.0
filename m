Return-Path: <linux-media+bounces-25412-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C33CCA21FEE
	for <lists+linux-media@lfdr.de>; Wed, 29 Jan 2025 16:04:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27392168014
	for <lists+linux-media@lfdr.de>; Wed, 29 Jan 2025 15:04:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E4731DC99A;
	Wed, 29 Jan 2025 15:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="JKbCv5TZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBD718F2EA
	for <linux-media@vger.kernel.org>; Wed, 29 Jan 2025 15:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738163039; cv=none; b=SPWZdkDOY0y1HGvD5pXtYJOZpW6Pm1TdsxDWCaPeI7kBePjejsn82hMs/UX1YslGFfiO+YY7Mzan4mcxXTYo4SCtYTdFx8WdoaTR3FSst5bp5ksqYXLSvs1brOltkCIeuM4P4kE+IGmElfZV3FjBVS4Zcn1nQQmuXwyCqqyCRoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738163039; c=relaxed/simple;
	bh=TqdDfVnt1s5oLrNMWo9iFiZRdsBIv+vctprwtCvzwRY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GpDby0HjvA7YeRIdmNZWxwJ2/OHZKnDTsPmayuQRxIj4IZSxSWYr57MUVZUinIbm0HG3nYzdRwtCG5GbpPO+eTM8/KYeDaDNpNkzxd1708P2DX5f+eRm2WuCG0Pnh9L9/Z+pW8lP8ClHhZeX25Dp34G6vYI+OtMCjt7IsgURmq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=JKbCv5TZ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-436a03197b2so47925015e9.2
        for <linux-media@vger.kernel.org>; Wed, 29 Jan 2025 07:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1738163036; x=1738767836; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2RdELdmmM00SLhxC3lWyk5JiMZUv4m8x+ewbzx0VpYU=;
        b=JKbCv5TZqhJ/7iuevg+GCkrFLGYdKN8SUdPCSU/GZBhHzItgu2Q29YGh47VnWVkFMS
         oFqM1A4NFgx+D39Tv1fhzY1/bShTCrqcLie8cNzaw24EX4STHCsEROI7DstOIL+YFa4e
         Y8WRRZdZxI/L8iN5zCTKD9KvcK7fKVAzvG6+R3g/mr4ZaAIWd3EVK59p2zJjPwnuCbmJ
         MrhluHyeaL0UxOSWb9J7ejGA6vnqo/dVlFTrvwmLt6s73le5F2xtxc689KJXfSoQaOX4
         +BQ5tm7KRDIjCX/DyfqZjcZ32+ZbykkEJzH2gEE70hAYaIpW2LVApw2zRjo+70jWGkwC
         N0YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738163036; x=1738767836;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2RdELdmmM00SLhxC3lWyk5JiMZUv4m8x+ewbzx0VpYU=;
        b=hx9v8dnp4/tbXq7LPxLonad3lv869zeFUp6yxpX5QV/K/a730uAUYH62RUFEGNJFLD
         20hMqsea78x7NYUQ1ID0SYhdaTNtEJ70cGT6pSg8xy8ifjOhOI2Yqxh36xXau82tb/6Y
         HpSAS/7Elr/AzqZDui/SriDzPpvaTcWU0uZ4FdsYF3xKoX/yH3XdPt0HGNARBV+wty2/
         Pc4HlG4VixKQxqQBF+mH+Zuh/TSFslEr+F/PIN7/iGF3BI6GsKP6Pm2jByCnRCNU8rNg
         AhH/CNUe2/EqkwJTJXXgMU2coiN5PRWwOXwfd2whgvavha8pfZPK30T8JIEH3k3TpDV2
         rvYA==
X-Forwarded-Encrypted: i=1; AJvYcCV9AHv2r0JMLCNfWE3+vMKyQF289bd2p0H8kGyCZcsfgIJdw9KxhX3gttrx2QuQJH8egvdQ9chOvdaHOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZFrhMEUbFErCap/Wxxsryfe7Nw4rvAKqtFnq6/pKdaHT+D+bJ
	kYjLfvntNjjqEoyEqP53xd+EeZrtDgwJHBlFIvq++oca6PHdQj16VTIrq72QiDQ=
X-Gm-Gg: ASbGncv/ywe1iWFadCFlMYO7pIyZBIH8sObcv9NTg0HrfxYuDGMxOfvtqMq59gna83g
	mGvYC5/mhCQjvg0sKWoHNcxiHMefdfyzBm4J/1fcMXI5ogcJ8f4Bn5X+4olKRY0Rad2dYXzb2NP
	35EmEc51YpySmxJgczj7RQB4EBoNRSDsbVWguCxss/ZIgaPTnjLHOVotR5blcDFtPje1i8EgULK
	qPzYhfyXkgjMABNiGpdFJgkcGIvL4jA9Zz2bI2QFNA5LcfQ//FNKsZF2ysx6ixcJ29q5f2c/f4u
	WN/NRqE=
X-Google-Smtp-Source: AGHT+IEfdr26yni6vLyodzHwXpuihA52ws3krKB6jrbt5LefZJKD6s0VHpLBRoXv+pWE+xtfo+h3kw==
X-Received: by 2002:a05:600c:3b98:b0:434:a4fe:cd71 with SMTP id 5b1f17b1804b1-438dc3be214mr31220785e9.12.1738163035433;
        Wed, 29 Jan 2025 07:03:55 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-438d755375bsm39074745e9.0.2025.01.29.07.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 07:03:54 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 29 Jan 2025 15:03:49 +0000
Subject: [PATCH v3 1/3] media: i2c: imx415: Add read/write control of
 VBLANK
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250129-media-imx415-v3-1-d16d4fa8fc10@raspberrypi.com>
References: <20250129-media-imx415-v3-0-d16d4fa8fc10@raspberrypi.com>
In-Reply-To: <20250129-media-imx415-v3-0-d16d4fa8fc10@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Michael Riesch <michael.riesch@wolfvision.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Gerald Loacker <Gerald.Loacker@wolfvision.net>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

This also requires that the ranges for the exposure control
are updated.

Reviewed-by: Michael Riesch <michael.riesch@wolfvision.net>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx415.c | 52 ++++++++++++++++++++++++++++++----------------
 1 file changed, 34 insertions(+), 18 deletions(-)

diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
index 3f7924aa1bd3..fa7ffb9220e5 100644
--- a/drivers/media/i2c/imx415.c
+++ b/drivers/media/i2c/imx415.c
@@ -26,6 +26,7 @@
 #define IMX415_PIXEL_ARRAY_WIDTH  3864
 #define IMX415_PIXEL_ARRAY_HEIGHT 2192
 #define IMX415_PIXEL_ARRAY_VBLANK 58
+#define IMX415_EXPOSURE_OFFSET	  8
 
 #define IMX415_NUM_CLK_PARAM_REGS 11
 
@@ -51,6 +52,7 @@
 #define IMX415_OUTSEL		  CCI_REG8(0x30c0)
 #define IMX415_DRV		  CCI_REG8(0x30c1)
 #define IMX415_VMAX		  CCI_REG24_LE(0x3024)
+#define IMX415_VMAX_MAX		  0xfffff
 #define IMX415_HMAX		  CCI_REG16_LE(0x3028)
 #define IMX415_SHR0		  CCI_REG24_LE(0x3050)
 #define IMX415_GAIN_PCG_0	  CCI_REG16_LE(0x3090)
@@ -447,7 +449,6 @@ static const struct imx415_clk_params imx415_clk_params[] = {
 
 /* all-pixel 2-lane 720 Mbps 15.74 Hz mode */
 static const struct cci_reg_sequence imx415_mode_2_720[] = {
-	{ IMX415_VMAX, 0x08CA },
 	{ IMX415_HMAX, 0x07F0 },
 	{ IMX415_LANEMODE, IMX415_LANEMODE_2 },
 	{ IMX415_TCLKPOST, 0x006F },
@@ -463,7 +464,6 @@ static const struct cci_reg_sequence imx415_mode_2_720[] = {
 
 /* all-pixel 2-lane 1440 Mbps 30.01 Hz mode */
 static const struct cci_reg_sequence imx415_mode_2_1440[] = {
-	{ IMX415_VMAX, 0x08CA },
 	{ IMX415_HMAX, 0x042A },
 	{ IMX415_LANEMODE, IMX415_LANEMODE_2 },
 	{ IMX415_TCLKPOST, 0x009F },
@@ -479,7 +479,6 @@ static const struct cci_reg_sequence imx415_mode_2_1440[] = {
 
 /* all-pixel 4-lane 891 Mbps 30 Hz mode */
 static const struct cci_reg_sequence imx415_mode_4_891[] = {
-	{ IMX415_VMAX, 0x08CA },
 	{ IMX415_HMAX, 0x044C },
 	{ IMX415_LANEMODE, IMX415_LANEMODE_4 },
 	{ IMX415_TCLKPOST, 0x007F },
@@ -600,6 +599,7 @@ struct imx415 {
 	struct v4l2_ctrl *vblank;
 	struct v4l2_ctrl *hflip;
 	struct v4l2_ctrl *vflip;
+	struct v4l2_ctrl *exposure;
 
 	unsigned int cur_mode;
 	unsigned int num_data_lanes;
@@ -730,17 +730,38 @@ static int imx415_s_ctrl(struct v4l2_ctrl *ctrl)
 					     ctrls);
 	const struct v4l2_mbus_framefmt *format;
 	struct v4l2_subdev_state *state;
+	u32 exposure_max;
 	unsigned int vmax;
 	unsigned int flip;
 	int ret;
 
-	if (!pm_runtime_get_if_in_use(sensor->dev))
-		return 0;
-
 	state = v4l2_subdev_get_locked_active_state(&sensor->subdev);
 	format = v4l2_subdev_state_get_format(state, 0);
 
+	if (ctrl->id == V4L2_CID_VBLANK) {
+		exposure_max = format->height + ctrl->val -
+			       IMX415_EXPOSURE_OFFSET;
+		__v4l2_ctrl_modify_range(sensor->exposure,
+					 sensor->exposure->minimum,
+					 exposure_max, sensor->exposure->step,
+					 sensor->exposure->default_value);
+	}
+
+	if (!pm_runtime_get_if_in_use(sensor->dev))
+		return 0;
+
 	switch (ctrl->id) {
+	case V4L2_CID_VBLANK:
+		ret = cci_write(sensor->regmap, IMX415_VMAX,
+				format->height + ctrl->val, NULL);
+		if (ret)
+			return ret;
+		/*
+		 * Exposure is set based on VMAX which has just changed, so
+		 * program exposure register as well
+		 */
+		ctrl = sensor->exposure;
+		fallthrough;
 	case V4L2_CID_EXPOSURE:
 		/* clamp the exposure value to VMAX. */
 		vmax = format->height + sensor->vblank->cur.val;
@@ -787,7 +808,8 @@ static int imx415_ctrls_init(struct imx415 *sensor)
 	u64 pixel_rate = supported_modes[sensor->cur_mode].pixel_rate;
 	u64 lane_rate = supported_modes[sensor->cur_mode].lane_rate;
 	u32 exposure_max = IMX415_PIXEL_ARRAY_HEIGHT +
-			   IMX415_PIXEL_ARRAY_VBLANK - 8;
+			   IMX415_PIXEL_ARRAY_VBLANK -
+			   IMX415_EXPOSURE_OFFSET;
 	u32 hblank;
 	unsigned int i;
 	int ret;
@@ -816,8 +838,9 @@ static int imx415_ctrls_init(struct imx415 *sensor)
 	if (ctrl)
 		ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
-	v4l2_ctrl_new_std(&sensor->ctrls, &imx415_ctrl_ops, V4L2_CID_EXPOSURE,
-			  4, exposure_max, 1, exposure_max);
+	sensor->exposure = v4l2_ctrl_new_std(&sensor->ctrls, &imx415_ctrl_ops,
+					     V4L2_CID_EXPOSURE, 4,
+					     exposure_max, 1, exposure_max);
 
 	v4l2_ctrl_new_std(&sensor->ctrls, &imx415_ctrl_ops,
 			  V4L2_CID_ANALOGUE_GAIN, IMX415_AGAIN_MIN,
@@ -834,16 +857,9 @@ static int imx415_ctrls_init(struct imx415 *sensor)
 	sensor->vblank = v4l2_ctrl_new_std(&sensor->ctrls, &imx415_ctrl_ops,
 					   V4L2_CID_VBLANK,
 					   IMX415_PIXEL_ARRAY_VBLANK,
-					   IMX415_PIXEL_ARRAY_VBLANK, 1,
-					   IMX415_PIXEL_ARRAY_VBLANK);
-	if (sensor->vblank)
-		sensor->vblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+					   IMX415_VMAX_MAX - IMX415_PIXEL_ARRAY_HEIGHT,
+					   1, IMX415_PIXEL_ARRAY_VBLANK);
 
-	/*
-	 * The pixel rate used here is a virtual value and can be used for
-	 * calculating the frame rate together with hblank. It may not
-	 * necessarily be the physically correct pixel clock.
-	 */
 	v4l2_ctrl_new_std(&sensor->ctrls, NULL, V4L2_CID_PIXEL_RATE, pixel_rate,
 			  pixel_rate, 1, pixel_rate);
 

-- 
2.34.1


