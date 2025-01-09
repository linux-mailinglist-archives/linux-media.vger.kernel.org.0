Return-Path: <linux-media+bounces-24502-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF27A0746C
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 12:17:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 61751188B49D
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 11:17:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEE2921661B;
	Thu,  9 Jan 2025 11:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="kyGl3OGS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9DAC2FB
	for <linux-media@vger.kernel.org>; Thu,  9 Jan 2025 11:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736421429; cv=none; b=DSjiEZNdmb/f6z9YVq/mfwnkPQ+XhUFXvm3jy4mwdCFgD7DlCtYDbKMEByZ7V0FZl2lDAFdZd2wgjDC9a9qMoiVWbgvq2U1ltXWjPBkOsBADdODvPhussXCbtHZ2ATLR5B9fG8/yXuP3bseKD6QCh4bBVIDQmIJZ1TQ9KTmjJ1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736421429; c=relaxed/simple;
	bh=P5rmfT+DUSR4asm5Gjw6aql5IBSI7KzjoYlfc6YPovA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cOBr/X99gjHIjC4XGW3wQ8l4aBDlPhK+/8ApBrsuwu9cgeSqNJm667W9Y+bunq44zZfenCds3Hj3bSt81ebau3pDR2s4Led86NsTzTo41BRYThAoWpiXJjkeqWHOfKZ/AECPmZisLTjca8XiJcXADtKewUQfBAyaHfBtBY2it08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=kyGl3OGS; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-436a03197b2so5938995e9.2
        for <linux-media@vger.kernel.org>; Thu, 09 Jan 2025 03:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1736421426; x=1737026226; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QDdoRqFWp8CVeTiidXm9/TF+voRsLtSMvxR1TwzmO9M=;
        b=kyGl3OGSTYIQkMnYLN/OtEiMUhQXedLbMN7M60RnxwSmsGvvU9aq6KtqvhHx2mj1LJ
         4cIpT2NoW3XyFsmO3xYBSZTOAkhsrQCTMO6sddQjMsQ91ZTvXnyHNyPnR6O0it2+CDmo
         QI223svogXQS2A+VXAOr2dapWuDEsT4IsIlNFITVPh8+FJ/wo3eIkH2oi4BnLQAws3bN
         2FISrApUtH3lmwEI+HhoMhjskANX6CREqPGeNTb8MxKS2xAz4hq5F4/MTjUY9RrMr87p
         GHu8h/3OiW61lCtr4TUIipoxeQBdL1Waalh29Xvsjs6LpZao2kav/CtNyiuUqJVP123c
         KEvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736421426; x=1737026226;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QDdoRqFWp8CVeTiidXm9/TF+voRsLtSMvxR1TwzmO9M=;
        b=OSSYJULl/9JtZ9qsjmwDKeI2jjBCdXE648OOcGmCoRg0Hb3EToPGL7CGc9lGDahbT6
         Pv36D25hJvf241TKu3Dekt3Cb19KcFhAZ2aYLVhz7EsYYmmkoHXnCkoQjHNr7Ol+Nkun
         sk9BG+WW+zMc6zr9HAy8arLwCS/3oIiMyq8F05QUHQRwOcPx6zHT8anNcE41JvXqXGXD
         02dMYtiWilo/vxzWHi9DOz/BjEt4ceDSTMmULyD7jPRbND36cLJZ6NVs+ONmZrjncLtl
         uSgRQWzV+KPypfmXuuqifqAVFIfPAvbTh2dzOYF5aD9+wKV3/iLLtuF6tRtdo8tWTouX
         L6NA==
X-Gm-Message-State: AOJu0Yy1tQCOh1kJudQgzaP+JMNGrZM2ah1CNZra3nEOiN2lPepGopcM
	J/dMZ76EZlLd5hK0e3DvIiVRmLWA1tEn0t2ioPE61f8lF6yjvQdRPYgeAuSc+mE8804EzEuVYT4
	o
X-Gm-Gg: ASbGncs49c0aOEMeJ2UHkIafNqVzVpwEQMCoQqDmll0DV4sH+d7tiik0Ap7PP7epvBg
	eqMuOEK7Gsi3aSyDZ7IfRO+oDeMUTktsxtC3WJ19ZganvldGIGfPc2K0oNMsauBf682pgtLKz4g
	1g+8y+JQsbhPw+2iuPLeefvFUVmQCtb56uHqIaQsqg38o8F6BC1GraAXLcy5tbeFKRuHLldo7VR
	3EE3j+TuAO2TyaDcEVphCiOVqNdzepVSeZ3lYa1NeX3ItRb
X-Google-Smtp-Source: AGHT+IGxW9l3fSCerDGzK3rf7x9nD9OspcRLe2JZVa23n7iAsWmXbz7f5JIE0MjVjI6CztxS9Y/A1w==
X-Received: by 2002:a5d:584d:0:b0:386:4a16:dad7 with SMTP id ffacd0b85a97d-38a872d2a33mr6039436f8f.10.1736421425737;
        Thu, 09 Jan 2025 03:17:05 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-436e2dc0bb7sm51383635e9.16.2025.01.09.03.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 03:17:05 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 09 Jan 2025 11:17:00 +0000
Subject: [PATCH 1/3] media: i2c: imx415: Add read/write control of VBLANK
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-media-imx415-v1-1-366ba6a234ab@raspberrypi.com>
References: <20250109-media-imx415-v1-0-366ba6a234ab@raspberrypi.com>
In-Reply-To: <20250109-media-imx415-v1-0-366ba6a234ab@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Michael Riesch <michael.riesch@wolfvision.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

This also requires that the ranges for the exposure control
are updated.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx415.c | 51 ++++++++++++++++++++++++++++++----------------
 1 file changed, 33 insertions(+), 18 deletions(-)

diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
index 3f7924aa1bd3..2c8c0905aa99 100644
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
@@ -730,17 +730,37 @@ static int imx415_s_ctrl(struct v4l2_ctrl *ctrl)
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
+		 * Deliberately fall through as exposure is set based on VMAX
+		 * which has just changed.
+		 */
+		fallthrough;
 	case V4L2_CID_EXPOSURE:
 		/* clamp the exposure value to VMAX. */
 		vmax = format->height + sensor->vblank->cur.val;
@@ -787,7 +807,8 @@ static int imx415_ctrls_init(struct imx415 *sensor)
 	u64 pixel_rate = supported_modes[sensor->cur_mode].pixel_rate;
 	u64 lane_rate = supported_modes[sensor->cur_mode].lane_rate;
 	u32 exposure_max = IMX415_PIXEL_ARRAY_HEIGHT +
-			   IMX415_PIXEL_ARRAY_VBLANK - 8;
+			   IMX415_PIXEL_ARRAY_VBLANK -
+			   IMX415_EXPOSURE_OFFSET;
 	u32 hblank;
 	unsigned int i;
 	int ret;
@@ -816,8 +837,9 @@ static int imx415_ctrls_init(struct imx415 *sensor)
 	if (ctrl)
 		ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
-	v4l2_ctrl_new_std(&sensor->ctrls, &imx415_ctrl_ops, V4L2_CID_EXPOSURE,
-			  4, exposure_max, 1, exposure_max);
+	sensor->exposure = v4l2_ctrl_new_std(&sensor->ctrls, &imx415_ctrl_ops,
+					     V4L2_CID_EXPOSURE, 4,
+					     exposure_max, 1, exposure_max);
 
 	v4l2_ctrl_new_std(&sensor->ctrls, &imx415_ctrl_ops,
 			  V4L2_CID_ANALOGUE_GAIN, IMX415_AGAIN_MIN,
@@ -834,16 +856,9 @@ static int imx415_ctrls_init(struct imx415 *sensor)
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


