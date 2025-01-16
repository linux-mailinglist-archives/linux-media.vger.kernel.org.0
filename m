Return-Path: <linux-media+bounces-24852-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FEFA14109
	for <lists+linux-media@lfdr.de>; Thu, 16 Jan 2025 18:43:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 83A79188C966
	for <lists+linux-media@lfdr.de>; Thu, 16 Jan 2025 17:43:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68ACF22D4F3;
	Thu, 16 Jan 2025 17:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="YZ8oURHv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA07D14884F
	for <linux-media@vger.kernel.org>; Thu, 16 Jan 2025 17:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737049403; cv=none; b=ggeC8lBUazWEgqDLQHbZiL4u4JHPdahIM7+YFPzKrZRvNsa4RR2CrWx9O2Q8n/mUksnP4JM9TF1yOsXsIwm8Ps8JOKzmX2EkkhPv0iXKWMCVKRm1PnFJH+h08dtwmODR/NY+3P38xPQBYbf0I49cIx9KtD4kBGaCG5BUTRfVA2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737049403; c=relaxed/simple;
	bh=6KoalZ0ghIt/CsoIyMX4CFT3D6yl8EI9lw0o7rdluiY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JXFCXghGGoO/7BizFWgXwboa4n3zcygrudKISV8/sW2SX2SYxV6xwGk/P/5er1SKO53WhSSLNKKt59yNK3sR/hK25Vaa0Qa0eBUbkSUXO2LoVji6tOlKN8HLIJeLM2+NkMRp7Y8/Kbh7SE5AOllXWB1jbfcyJvAgbIbJ48jy/Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=YZ8oURHv; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-436637e8c8dso11568955e9.1
        for <linux-media@vger.kernel.org>; Thu, 16 Jan 2025 09:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1737049400; x=1737654200; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sFUmY5bxO6t8UNGqtBvm5S37BxnI3MNuaB1bun9ydgk=;
        b=YZ8oURHvJ0IqQuXfk5VZi5uJFqJC+Zn+ATXbI6rzy2Z6gfk9RGRTRueBgnWWLhXkNZ
         rhKiNAx3rr/7EgoQ78uODaWzcSR3rzCHT4Ex9RVy0ajBDKGkRGZUzljm2waWFbNjD3tb
         etYsoHkaBAUendQOw9bKayFK4maZqXXmMV8oIyD87AS/3GJQyizwb2pKK79vRWFD0Yex
         jIsrV4XKfbeFrno+QcG+7nS6vu6KpgPzHky/KvAKOETHQAiXHpxwGpmO2RylMFVQx4ou
         hYEypRzh8plIgsFB+SvuNMoTvpzbpYnCknym//G6xGzDPzlEarEsB4qOVP4HmQhs1mCh
         8b1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737049400; x=1737654200;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sFUmY5bxO6t8UNGqtBvm5S37BxnI3MNuaB1bun9ydgk=;
        b=qB3YVxSoBq+xiup66z6TA6LJHsjUX48nbpXmW20z5Kk1KmE2ne1503ozgOMfsVjylQ
         nafCv7UvxcGGeAWFoHzBKqp4L83qnlo+h1fzJdes/3Gbzlqjrzoa0QArqSE2aNP1RCIi
         e1mtt7b7JwZ6qQM6gKiMivq5Pqv9Pri3w4aiZYbnopVKcNeFfSkkHrWLXdky26Sbl/+q
         Aeyltb4YqEsGX126cx5ARb0lwBGCSsimN7JlaL2gXjtuHOd9wYW/ikFyd/8rMbIPLvpT
         19nlWr8B1x/iAgNZV39WwROT+MNYWh35LsfIMKFH+7ueebp8cfznKG+N9+xX0sINuF/S
         XhsA==
X-Forwarded-Encrypted: i=1; AJvYcCUFpTzKX8DeRn389dezXz844n4c9YCdjT97KvvFUwolvGp5jaIN3BNkHv4Ll4VSoP14ECLlBmo6oPJb+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwilrXjoZgJ7ED7S5NUYnm/zavJV1HxmhL7rcFvhkfSTq2MAiEi
	EjPr40SGh8Ty9zN/VLA8HXetUnHnZOWP4EJSEeDaW0y43hB91Wk41zJ+9vKipbs=
X-Gm-Gg: ASbGncu5pIWc3KRrGT6zqNfdqMofqs3pieisccwqNOC8PDZNyWm2uTrL1CzTOkS7fDz
	Wir64/+t8g9h2LaAjxbFKU6ba8/KJdq8Yp+/Ej5v40+IHdhWQl27ygZrAyrmZcxXWgELksmdqSg
	rbefSqpIkLUhMRdYxp3+DvrrXRun1ewfJFCmYT6osr1iPXGETw0KNoY15HmE1JzkIC+AOHgZU9k
	58dgmKT1AHbqZ0iGe2Z/n3P7APTjLcOIJc6GaLc+BMSU5/w
X-Google-Smtp-Source: AGHT+IFC+OXvCmVsIdw8ejrPDR+0n3pDOimziwX8sqXmNsprU+6Q0BH+anPzv5EQJWOZscqpxZePGw==
X-Received: by 2002:a05:600c:3149:b0:434:f297:8e78 with SMTP id 5b1f17b1804b1-436e267fbe1mr324889155e9.7.1737049400135;
        Thu, 16 Jan 2025 09:43:20 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43890413053sm6302515e9.10.2025.01.16.09.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 09:43:19 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 16 Jan 2025 17:43:09 +0000
Subject: [PATCH v2 1/3] media: i2c: imx415: Add read/write control of
 VBLANK
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250116-media-imx415-v2-1-735263f04652@raspberrypi.com>
References: <20250116-media-imx415-v2-0-735263f04652@raspberrypi.com>
In-Reply-To: <20250116-media-imx415-v2-0-735263f04652@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Michael Riesch <michael.riesch@wolfvision.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Gerald Loacker <Gerald.Loacker@wolfvision.net>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

This also requires that the ranges for the exposure control
are updated.

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


