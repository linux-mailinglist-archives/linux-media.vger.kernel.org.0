Return-Path: <linux-media+bounces-24854-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EAEA14110
	for <lists+linux-media@lfdr.de>; Thu, 16 Jan 2025 18:44:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03A071888D5F
	for <lists+linux-media@lfdr.de>; Thu, 16 Jan 2025 17:44:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA85F22FDFD;
	Thu, 16 Jan 2025 17:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="l4YsjycP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F90B1DED44
	for <linux-media@vger.kernel.org>; Thu, 16 Jan 2025 17:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737049405; cv=none; b=UUnY8rwRf0YoiLFXm4PL1vf5kDtfcLhImktGctIoUlyFN6TUze2eX8b6GxgjSEfRmfncqTgKTcxoKy4fZQvtcTERcNwvsK6tq/uKUxY0mNRIy/CC1xbvqOFcJBh4RlxsDmMFWVN1jWHt6mWhRHIPuhHUrIDBElIEELmg5qNPiaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737049405; c=relaxed/simple;
	bh=eWJgCm/jjyutYsF0u2FHRMTAmQxi4fcBGQ/dHrMP+UM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bzcqVsiWgil2zRrhHPBbfXkTH4T3nmV9mlClpvQ4PxeMnnrCQx1RUMpat8TP5nlPQSZOHSTdE4bTfUIGlXtMlPmEw32zg4fMZUE6/Wt6MzW5ihVVY3WFyPYMj6iYnAhnIaDQdrFxxHXT9Cetzdqf4IUI912Z/UH7sAa401IJ2Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=l4YsjycP; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4361f796586so12689375e9.3
        for <linux-media@vger.kernel.org>; Thu, 16 Jan 2025 09:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1737049402; x=1737654202; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3c5ov7st4tFk0rMU34jT12B0MxOAS1BPe9J0SsPXA2Q=;
        b=l4YsjycPU2K1PPwqkPfZbO+7gxn+mSM/QVzG9885bn6kK17jaLYIeUZSsvb9wJsp5o
         9wsES9CFOTFo46bf4jwWn1aTM+4D9QU+q3Uw8z5Ko1q1Jub0GNAYCU3+uDSWMVUD2YJ6
         YuSJcR1KyHVzsYAbnAWU7KNFN4WWBawdoSh2knGrUygrW2df4P829SEjabjmpIJIIh7J
         WjynWVgL79TY39AofORjw1ZPzNfAbQZ/hbi9z3h6m5d2WOc3a5IXx7EgNr1hOxFBOS1o
         2/+iVhM+8iA1KnEE4hWVgM2ciLvtEHpZFAQWL80JhMraoWgMkiW8IUVHEYMTZD87ba4f
         Igwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737049402; x=1737654202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3c5ov7st4tFk0rMU34jT12B0MxOAS1BPe9J0SsPXA2Q=;
        b=bRt5TI+yV6GFjdYPW6QmlXkuNX9gai1m+yOYQi3rO0Y5TGQDBfrVX1F/O/rydBlNse
         gx+rE7yK64MUuhlsIAZkBABlNujekieKP8D84xdWfj/K0g7ljXBb8qqaCA7JKvceplcY
         aMuTv5OK6nf27xV9aaIZNhsP/VYkaeySTO7CFFzwpWVVftom+6JqDtarX00zIm1hf+P2
         9MbagghnhWoM840koMCWtEG/ffvVqgXCRSFUzPtLD19RYnbqdqyNJyuGnPPB8d5Lj3c4
         7H02PJfKFySPrKv7Lr6nUkSkyUjJ3+s1IlSljXccz133aqMbg0I8HnyYcWsvbGKpDerg
         r+EA==
X-Forwarded-Encrypted: i=1; AJvYcCV4EBrc4OBukZHn6xh/S1RACEI+UovNQs0nhoIM51UdCYcvFQWha8V2VcpLu1UjC0G+kjlSIFA5sGU4Qw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywbsm7A964mHJEiudoSpN5N20Z63G6aZd6tjK3chv+zwAeikIPl
	a8WLj2eUyhz3t+UCuN91UEEjwgT9K0/EnCbNEvj6wOTNodnSOe4Fz5fzKJ2kUe4=
X-Gm-Gg: ASbGncumdAB1ZRzrcK5x8duZ9FWRYX7I0kPvwmn3NqYlwO1dVIujrotDSejNgSwmkPv
	x2cRzs+1oXpP3FEprNrffVrstrsSQ8feWafSieB2x+q5xFhp8NaV9J8ZdrRv7+zyug5i7K+0Wyc
	5HiqnfW3FP855bHTkNiZ90OViflKPT19S3pK3NvE1aGtRMl7z47NlbX3AwiGYzt7DixjEU/fXJh
	Dnz2pw47MXSqAXwmckZDeafZw0YkM1QTpSfdYU46k0PgZlB
X-Google-Smtp-Source: AGHT+IEQXYtZhwUYeCeL1LvktSO96MXKLnY+XjiG9kqdgpPIWu4aDWvI2TS60uQHB/HnbLr716bFxw==
X-Received: by 2002:a05:600c:1c9a:b0:428:d31:ef25 with SMTP id 5b1f17b1804b1-436e26975f1mr354804105e9.12.1737049401790;
        Thu, 16 Jan 2025 09:43:21 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43890413053sm6302515e9.10.2025.01.16.09.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 09:43:21 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 16 Jan 2025 17:43:11 +0000
Subject: [PATCH v2 3/3] media: i2c: imx415: Link frequencies are not
 exclusive to num lanes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250116-media-imx415-v2-3-735263f04652@raspberrypi.com>
References: <20250116-media-imx415-v2-0-735263f04652@raspberrypi.com>
In-Reply-To: <20250116-media-imx415-v2-0-735263f04652@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Michael Riesch <michael.riesch@wolfvision.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Gerald Loacker <Gerald.Loacker@wolfvision.net>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
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
index 24633d17cb09..5729edf06add 100644
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
+		.hmax_min = { 2200, 1100 },
 		.reg_list = {
-			.num_of_regs = ARRAY_SIZE(imx415_mode_4_891),
-			.regs = imx415_mode_4_891,
+			.num_of_regs = ARRAY_SIZE(imx415_linkrate_891mbps),
+			.regs = imx415_linkrate_891mbps,
 		},
 	},
 };
@@ -783,7 +776,8 @@ static int imx415_ctrls_init(struct imx415 *sensor)
 {
 	struct v4l2_fwnode_device_properties props;
 	struct v4l2_ctrl *ctrl;
-	u64 lane_rate = supported_modes[sensor->cur_mode].lane_rate;
+	const struct imx415_mode *cur_mode = &supported_modes[sensor->cur_mode];
+	u64 lane_rate = cur_mode->lane_rate;
 	u32 exposure_max = IMX415_PIXEL_ARRAY_HEIGHT +
 			   IMX415_PIXEL_ARRAY_VBLANK -
 			   IMX415_EXPOSURE_OFFSET;
@@ -824,7 +818,7 @@ static int imx415_ctrls_init(struct imx415 *sensor)
 			  IMX415_AGAIN_MAX, IMX415_AGAIN_STEP,
 			  IMX415_AGAIN_MIN);
 
-	hblank_min = (supported_modes[sensor->cur_mode].hmax_min *
+	hblank_min = (cur_mode->hmax_min[sensor->num_data_lanes == 2 ? 0 : 1] *
 		      IMX415_HMAX_MULTIPLIER) - IMX415_PIXEL_ARRAY_WIDTH;
 	hblank_max = (IMX415_HMAX_MAX * IMX415_HMAX_MULTIPLIER) -
 		     IMX415_PIXEL_ARRAY_WIDTH;
@@ -886,7 +880,12 @@ static int imx415_set_mode(struct imx415 *sensor, int mode)
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
@@ -1297,8 +1296,6 @@ static int imx415_parse_hw_config(struct imx415 *sensor)
 		}
 
 		for (j = 0; j < ARRAY_SIZE(supported_modes); ++j) {
-			if (sensor->num_data_lanes != supported_modes[j].lanes)
-				continue;
 			if (bus_cfg.link_frequencies[i] * 2 !=
 			    supported_modes[j].lane_rate)
 				continue;

-- 
2.34.1


