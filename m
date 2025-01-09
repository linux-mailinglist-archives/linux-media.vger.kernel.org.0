Return-Path: <linux-media+bounces-24505-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 51ED5A07471
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 12:17:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3291E3A6FB7
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 11:17:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6239217651;
	Thu,  9 Jan 2025 11:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="dLe+fCjL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAC72165F7
	for <linux-media@vger.kernel.org>; Thu,  9 Jan 2025 11:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736421431; cv=none; b=iS1SNwa1kys8VCJvB4lgYkuPfd1r1lFgQg1hVqVxYphDMjTtJt5mKkGT+0p0JPnX9VIsimIt4LeV81l5J0LjwHT/yWk0H3j7nQ2UkFskgblyKg4gyOb/zW3U2ABt7IqR7oYpCKhkoKPatSbHI88ulTey5seMCj1qwoy7KxIH8Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736421431; c=relaxed/simple;
	bh=xthAa1cQTtOTVbLk7Tq3zBebO5O/vfenPLhC6pmLsM4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aDJ0yFqa3Td+GGjQL/bVcs8SPzMhmhA3I8WMY1rsPI2rZN/rWEorN0oGiGWW8MUoUltr/86sRo4SwXYCyUSP1ZxytNw3SZl6xMzo/pwpD1MxhMRyJUwHRknWRG0wAgrHYGzV93zIgh5GZjhCyyYAAqf9sposUuBoYRpGkfQG9iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=dLe+fCjL; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4361815b96cso6004755e9.1
        for <linux-media@vger.kernel.org>; Thu, 09 Jan 2025 03:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1736421428; x=1737026228; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ENKXg0WVMIM6tIrW1zc4FaXBY9LbCyw/evnc79n5e0k=;
        b=dLe+fCjLLCuBvozJZ8XjOV3Tu39MIQoP2lCUrtk92MJrzNSCHnqDSbCfv0Ztovq1ou
         7f1zg9SCu/naLFqW5mBk/BaxHV1Sj+xI7RbQiMISnz/m4IOCJN2mJfxQkj0i1tUa3pAu
         ENy1mYFRqFKgw49yGxPv55EDYdg3HT5Jciuclk1dFpix+LcY4b/Y5G5kdPLEn3NjsKku
         89goOxJvkVI+OvVMuUN211BqKchrVWF0vtlqXoBbJ8IbTKnpSMrwCSsGyeh7qtF7zIOj
         e+Sp86g3vlTeu+3pnRNZm8UQYEDJ5Pu9/hHSDbxwmBVETuMrbpKGyIg/I+UJVqJpQr7W
         K5qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736421428; x=1737026228;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ENKXg0WVMIM6tIrW1zc4FaXBY9LbCyw/evnc79n5e0k=;
        b=eFLq3mS3hmx/Hp29BolcXgT6mNZVQ3PpcDefetVq03gkubwDX9DTCji2nQU2usgrds
         mNgm3vNRNVtpSk52KY5/UJa2o4aISoIOlv8jhGy8Lo9UqLj5q5vj78eb/7IYMITzDRVK
         7hCgSpzxcxv7KPJfUl6c1jqeRTL+w6nvydOQSjP3H9rIorTKS2HAtDDcIKuS+6RmmqtE
         g6j4PzPgi7CI63gqKZ6XBQAmaGjLOYpo26LFG3PRFEA5Uaqv+bhsJI5WwMySUi/fEZ9O
         ZDtjXW5t+nPFDH+GZdirIpgKdvulWi6VXwkYD4walam5wHCf4c2kAwapCCn7AWvxL99o
         Yonw==
X-Gm-Message-State: AOJu0YwoYvahG8C1nwvoSkcDnlFufpMYDgv9UzPjI2rB9MAvqN7H/l97
	jSwpQe7+FPVUN0E0aK0E+HCRG14TABB/vnfV6I+jtxTs4c+zDjhcvdabuXgzX3T1YKaXuq04Xh2
	w
X-Gm-Gg: ASbGncvsfjE5axfUK6/yxh+bwkFBtGEL58uIwPyw8Pggm2bnRv99a3b3lbHypohdac0
	PJQU4zcUOfiRBs/RtDi2gohacwXgl+GAp0ud+8oF49J9KkvInO/tHUgL3xVA77UaiueJ1Irs2Nm
	qjOWrf/hbn7/Ff6+kJVosSn1qN8sS4+DN8hKaMjAhwxy1hDwTGlpFOi3vCZgXmC4CftixG5xP0V
	VvM6l1bbpUl5y81IrKqcOXCaWwM7Iox0sckceTRN3sgvMph
X-Google-Smtp-Source: AGHT+IEG6RDcQzUUAmt24CybgylRmmcezNzdtUB8E8rnoCU+2bOcaekT9eUJt1BxsyPj/AuO1ssEzg==
X-Received: by 2002:a05:600c:1d9c:b0:436:1af4:5e07 with SMTP id 5b1f17b1804b1-436e2696d35mr51753455e9.1.1736421427705;
        Thu, 09 Jan 2025 03:17:07 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-436e2dc0bb7sm51383635e9.16.2025.01.09.03.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 03:17:07 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 09 Jan 2025 11:17:02 +0000
Subject: [PATCH 3/3] media: i2c: imx415: Link frequencies are not exclusive
 to num lanes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-media-imx415-v1-3-366ba6a234ab@raspberrypi.com>
References: <20250109-media-imx415-v1-0-366ba6a234ab@raspberrypi.com>
In-Reply-To: <20250109-media-imx415-v1-0-366ba6a234ab@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Michael Riesch <michael.riesch@wolfvision.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

The link frequencies are equally valid in 2 or 4 lane modes, but
they change the hmax_min value for the mode as the MIPI block
has to have sufficient time to send the pixel data for each line.

Remove the association with number of lanes, and add hmax_min
configuration for both lane options.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx415.c | 53 ++++++++++++++++++++++------------------------
 1 file changed, 25 insertions(+), 28 deletions(-)

diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
index e23b41027987..1071900416d2 100644
--- a/drivers/media/i2c/imx415.c
+++ b/drivers/media/i2c/imx415.c
@@ -452,9 +452,8 @@ static const struct imx415_clk_params imx415_clk_params[] = {
 	},
 };
 
-/* all-pixel 2-lane 720 Mbps 15.74 Hz mode */
-static const struct cci_reg_sequence imx415_mode_2_720[] = {
-	{ IMX415_LANEMODE, IMX415_LANEMODE_2 },
+/* 720 Mbps CSI configuration */
+static const struct cci_reg_sequence imx415_linkrate_720mbps[] = {
 	{ IMX415_TCLKPOST, 0x006F },
 	{ IMX415_TCLKPREPARE, 0x002F },
 	{ IMX415_TCLKTRAIL, 0x002F },
@@ -466,9 +465,8 @@ static const struct cci_reg_sequence imx415_mode_2_720[] = {
 	{ IMX415_TLPX, 0x0027 },
 };
 
-/* all-pixel 2-lane 1440 Mbps 30.01 Hz mode */
-static const struct cci_reg_sequence imx415_mode_2_1440[] = {
-	{ IMX415_LANEMODE, IMX415_LANEMODE_2 },
+/* 1440 Mbps CSI configuration */
+static const struct cci_reg_sequence imx415_linkrate_1440mbps[] = {
 	{ IMX415_TCLKPOST, 0x009F },
 	{ IMX415_TCLKPREPARE, 0x0057 },
 	{ IMX415_TCLKTRAIL, 0x0057 },
@@ -480,9 +478,8 @@ static const struct cci_reg_sequence imx415_mode_2_1440[] = {
 	{ IMX415_TLPX, 0x004F },
 };
 
-/* all-pixel 4-lane 891 Mbps 30 Hz mode */
-static const struct cci_reg_sequence imx415_mode_4_891[] = {
-	{ IMX415_LANEMODE, IMX415_LANEMODE_4 },
+/* 891 Mbps CSI configuration */
+static const struct cci_reg_sequence imx415_linkrate_891mbps[] = {
 	{ IMX415_TCLKPOST, 0x007F },
 	{ IMX415_TCLKPREPARE, 0x0037 },
 	{ IMX415_TCLKTRAIL, 0x0037 },
@@ -501,8 +498,7 @@ struct imx415_mode_reg_list {
 
 struct imx415_mode {
 	u64 lane_rate;
-	u32 lanes;
-	u32 hmax_min;
+	u32 hmax_min[2];
 	struct imx415_mode_reg_list reg_list;
 };
 
@@ -510,29 +506,26 @@ struct imx415_mode {
 static const struct imx415_mode supported_modes[] = {
 	{
 		.lane_rate = 720000000,
-		.lanes = 2,
-		.hmax_min = 2032,
+		.hmax_min = { 2032, 1066 },
 		.reg_list = {
-			.num_of_regs = ARRAY_SIZE(imx415_mode_2_720),
-			.regs = imx415_mode_2_720,
+			.num_of_regs = ARRAY_SIZE(imx415_linkrate_720mbps),
+			.regs = imx415_linkrate_720mbps,
 		},
 	},
 	{
 		.lane_rate = 1440000000,
-		.lanes = 2,
-		.hmax_min = 1066,
+		.hmax_min = { 1066, 533 },
 		.reg_list = {
-			.num_of_regs = ARRAY_SIZE(imx415_mode_2_1440),
-			.regs = imx415_mode_2_1440,
+			.num_of_regs = ARRAY_SIZE(imx415_linkrate_1440mbps),
+			.regs = imx415_linkrate_1440mbps,
 		},
 	},
 	{
 		.lane_rate = 891000000,
-		.lanes = 4,
-		.hmax_min = 1100,
+		.hmax_min = { 1100, 550 },
 		.reg_list = {
-			.num_of_regs = ARRAY_SIZE(imx415_mode_4_891),
-			.regs = imx415_mode_4_891,
+			.num_of_regs = ARRAY_SIZE(imx415_linkrate_891mbps),
+			.regs = imx415_linkrate_891mbps,
 		},
 	},
 };
@@ -782,7 +775,8 @@ static int imx415_ctrls_init(struct imx415 *sensor)
 {
 	struct v4l2_fwnode_device_properties props;
 	struct v4l2_ctrl *ctrl;
-	u64 lane_rate = supported_modes[sensor->cur_mode].lane_rate;
+	const struct imx415_mode *cur_mode = &supported_modes[sensor->cur_mode];
+	u64 lane_rate = cur_mode->lane_rate;
 	u32 exposure_max = IMX415_PIXEL_ARRAY_HEIGHT +
 			   IMX415_PIXEL_ARRAY_VBLANK -
 			   IMX415_EXPOSURE_OFFSET;
@@ -823,7 +817,7 @@ static int imx415_ctrls_init(struct imx415 *sensor)
 			  IMX415_AGAIN_MAX, IMX415_AGAIN_STEP,
 			  IMX415_AGAIN_MIN);
 
-	hblank_min = (supported_modes[sensor->cur_mode].hmax_min *
+	hblank_min = (cur_mode->hmax_min[sensor->num_data_lanes == 2 ? 0 : 1] *
 		      IMX415_HMAX_MULTIPLIER) - IMX415_PIXEL_ARRAY_WIDTH;
 	hblank_max = (IMX415_HMAX_MAX * IMX415_HMAX_MULTIPLIER) -
 		     IMX415_PIXEL_ARRAY_WIDTH;
@@ -885,7 +879,12 @@ static int imx415_set_mode(struct imx415 *sensor, int mode)
 			    IMX415_NUM_CLK_PARAM_REGS,
 			    &ret);
 
-	return 0;
+	ret = cci_write(sensor->regmap, IMX415_LANEMODE,
+			sensor->num_data_lanes == 2 ? IMX415_LANEMODE_2 :
+						      IMX415_LANEMODE_4,
+			NULL);
+
+	return ret;
 }
 
 static int imx415_setup(struct imx415 *sensor, struct v4l2_subdev_state *state)
@@ -1296,8 +1295,6 @@ static int imx415_parse_hw_config(struct imx415 *sensor)
 		}
 
 		for (j = 0; j < ARRAY_SIZE(supported_modes); ++j) {
-			if (sensor->num_data_lanes != supported_modes[j].lanes)
-				continue;
 			if (bus_cfg.link_frequencies[i] * 2 !=
 			    supported_modes[j].lane_rate)
 				continue;

-- 
2.34.1


