Return-Path: <linux-media+bounces-25414-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD61A21FF4
	for <lists+linux-media@lfdr.de>; Wed, 29 Jan 2025 16:04:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D88E3A55E7
	for <lists+linux-media@lfdr.de>; Wed, 29 Jan 2025 15:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE5541DE2C6;
	Wed, 29 Jan 2025 15:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="A/qNeR1O"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C191D934D
	for <linux-media@vger.kernel.org>; Wed, 29 Jan 2025 15:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738163041; cv=none; b=YWTqqMllfgX6i90EbwE6n/J4efgXD5B9HblMueXqt0y1ad0QCw5PWQqUv9IUqI6YH9fS5ohHQMRrdwuXe9u7DG0lIFZpAbbI8hX6H6kyv4VzOnt1E1rylyBvTArNdW9eObeM30Zo9ivtly22ekEiNJydj72FEBsh4dI5zbwk1XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738163041; c=relaxed/simple;
	bh=KjqKlVkecA17TtFQ0yN8H6t8Zx16MtZsmLBSj5htyQE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MD3wBHDo1nm01JAr5yTO4mKvfOg1sGcp7mojHMbAEYDTHAW8OYN/HSKmGkDCFWT/GudFF1jpiZkvCslzTXskP5DNZSS/sgh8CmXf9m7h/BtlAkLjnXhesv2HbD46DOAKgOozMSpa24WHgpn+TBLw7AfdgDldmk0VU3ZU2uZyOgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=A/qNeR1O; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-385eed29d17so3657772f8f.0
        for <linux-media@vger.kernel.org>; Wed, 29 Jan 2025 07:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1738163037; x=1738767837; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dRx91CfI5Jce/xhWdBK8oWXjfhN9M6Xj5IIyk3fewsg=;
        b=A/qNeR1On8LlORSOFHBV1Hmy1YEk5RnQUTULdUEaMlkf2VEfOrPB9VpZrPFCZCSbYw
         Vi2NF3uOBmR33edwrqAHDrxNzz3l2TZftSO7m2u2n049LfKgiDQft2X9E2OuJOtRVJDk
         wBgdVqOaySCIwJhyMD8Ti8JtVvD9eLhPL+nQFWviOU2EKHki+Xc/arNf8hVkBPod7uMg
         fjptDjQc0OfS77b165ji2Y4RR3EKOZGn3JSYD9mYvVdaYgUH6BOus8UCGoupjjj3V2Kn
         v998/YbTMf9+4F7+2RxTMoHhpYWNK64AqiX7hcLTmeQ4MjDtD4rbJkyYCY+Bjb2JLAef
         GBYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738163037; x=1738767837;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dRx91CfI5Jce/xhWdBK8oWXjfhN9M6Xj5IIyk3fewsg=;
        b=oapEzh0hbbJbruYSpkXDLctUS0IaGfGNq9Cct4WsRpS44JbXmcdMlQtBqCYIqPT05l
         WV4vHDEqA5sZiurIzZOd8jqZTHu9IS/5yosNDsDmZOPhU848L7RE+nVx0xnqpITHzB8K
         69UzBret8kzz3Hdob86El3TJ0KLU5DxTz6W++lqNRSADIw7ooNwhMPZVmPOFifnB8Xkt
         uXifnqDaXCZnJXRFUqqnsltV43sKjEeZIPAcYSS2ZI5Xm80imRQsMmNzenFUqHkFImJU
         sg4BHZ8NGldA29NdpAFoUYi9Hy5lsV2FVEghItNeN4fheoiqo7isEjfxjVcIHx925nST
         DS8w==
X-Forwarded-Encrypted: i=1; AJvYcCWssjQqqs0rkz5ajQFHC27Y7aV2GSdF8UAzZl1x0jY9jCMDZlr1gtSi1pyrfysKoRsfjLREzEwhfO7qMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKTJEu8GRHg8wU+V/x6Ore/UgCoCm4QhtXaoDUvI+BT7GNf6Xd
	k5b5cRFaHydEMBTboHm3hJIGk9TymgR0qxMVcQ/xJRT6tAZzsaA1mYOyqlfLU0Q=
X-Gm-Gg: ASbGncsRENgrgzo0UrhOEAKTD2ngNHM5Lj+ebvuoH0cvQmF2iqY6bVSGkNAHYiuWKIG
	U9kC8STb2v0NrMjzIQJm43vUCNCVKfZ7ekP7j1tAbO2A3yvl8XnoDj9SUXzwDL3Rx2bjnuKgAJI
	tJloO9DH1DudZJPRVvQCwsPfkJG5Lf8QMZ/hNByKRKFysv77MYbxBLlr37qRZMSw8v5/6OK1mFS
	/IXQaQAlffMRV0Y1x4hHrt7DADNWYqX2tV4v+EHjxy+nunA4PTfk8sfdXESfzf7esbyqgBwQn/e
	HPZdDOc=
X-Google-Smtp-Source: AGHT+IGXpOzhv4uE4YFrNP/QQEVBcicFNjEiwOyKZDDXY+YWGDtK3GqK5L+TZ1mNCiGfXme17bqcnw==
X-Received: by 2002:a05:6000:1fa4:b0:385:dc45:ea26 with SMTP id ffacd0b85a97d-38c5195e85cmr3073386f8f.12.1738163037084;
        Wed, 29 Jan 2025 07:03:57 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-438d755375bsm39074745e9.0.2025.01.29.07.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 07:03:56 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 29 Jan 2025 15:03:51 +0000
Subject: [PATCH v3 3/3] media: i2c: imx415: Link frequencies are not
 exclusive to num lanes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250129-media-imx415-v3-3-d16d4fa8fc10@raspberrypi.com>
References: <20250129-media-imx415-v3-0-d16d4fa8fc10@raspberrypi.com>
In-Reply-To: <20250129-media-imx415-v3-0-d16d4fa8fc10@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Michael Riesch <michael.riesch@wolfvision.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Gerald Loacker <Gerald.Loacker@wolfvision.net>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>
X-Mailer: b4 0.14.1

The link frequencies are equally valid in 2 or 4 lane modes, but
they change the hmax_min value for the mode as the MIPI block
has to have sufficient time to send the pixel data for each line.

Remove the association with number of lanes, and add hmax_min
configuration for both lane options.

Reviewed-by: Michael Riesch <michael.riesch@wolfvision.net>
Reviewed-by: Gerald Loacker <gerald.loacker@wolfvision.net>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx415.c | 53 ++++++++++++++++++++++------------------------
 1 file changed, 25 insertions(+), 28 deletions(-)

diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
index 86dbcfcd820d..9f37779bd611 100644
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
@@ -784,7 +777,8 @@ static int imx415_ctrls_init(struct imx415 *sensor)
 {
 	struct v4l2_fwnode_device_properties props;
 	struct v4l2_ctrl *ctrl;
-	u64 lane_rate = supported_modes[sensor->cur_mode].lane_rate;
+	const struct imx415_mode *cur_mode = &supported_modes[sensor->cur_mode];
+	u64 lane_rate = cur_mode->lane_rate;
 	u32 exposure_max = IMX415_PIXEL_ARRAY_HEIGHT +
 			   IMX415_PIXEL_ARRAY_VBLANK -
 			   IMX415_EXPOSURE_OFFSET;
@@ -825,7 +819,7 @@ static int imx415_ctrls_init(struct imx415 *sensor)
 			  IMX415_AGAIN_MAX, IMX415_AGAIN_STEP,
 			  IMX415_AGAIN_MIN);
 
-	hblank_min = (supported_modes[sensor->cur_mode].hmax_min *
+	hblank_min = (cur_mode->hmax_min[sensor->num_data_lanes == 2 ? 0 : 1] *
 		      IMX415_HMAX_MULTIPLIER) - IMX415_PIXEL_ARRAY_WIDTH;
 	hblank_max = (IMX415_HMAX_MAX * IMX415_HMAX_MULTIPLIER) -
 		     IMX415_PIXEL_ARRAY_WIDTH;
@@ -887,7 +881,12 @@ static int imx415_set_mode(struct imx415 *sensor, int mode)
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
@@ -1298,8 +1297,6 @@ static int imx415_parse_hw_config(struct imx415 *sensor)
 		}
 
 		for (j = 0; j < ARRAY_SIZE(supported_modes); ++j) {
-			if (sensor->num_data_lanes != supported_modes[j].lanes)
-				continue;
 			if (bus_cfg.link_frequencies[i] * 2 !=
 			    supported_modes[j].lane_rate)
 				continue;

-- 
2.34.1


