Return-Path: <linux-media+bounces-24954-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9120A16BB2
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 12:36:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D272A1699B0
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 11:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 104171BBBD3;
	Mon, 20 Jan 2025 11:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="htbPlpq3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C6D1DED72
	for <linux-media@vger.kernel.org>; Mon, 20 Jan 2025 11:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737372959; cv=none; b=qR+PUALRaynhLrrFIYfrrFVoBCEppay7j3SvjBKoHxP95xVxXcbx7ubCJcl77EW6eg6FVy+dZyL1nzS1cLWnYHwpLIjoWVD5mvwyJjXjhMFhb4wgxRMe39Up/AiJSdczVLX1SyxoNMT+5AS5GJCcaplB5yup5IAOR9PkjAKTRxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737372959; c=relaxed/simple;
	bh=YCPqhmUhxIwQKIIMV6xbGbwnQb1JUFI6QWNv9xPhcgQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dORG5IzRgASo5eDYkRGqXUl+m8EhysO8msxiw8vUCmpT3qz7/Klvoq1jFkUoQTsRVj4qlqrc8gJVQHVpdVueepDLKj0LIakbTfgNnTsuirmeYksJX0Alb9EiMzV3UuMlpmmX/I/qMJEAtf2LdR0/KVFLt15n0/RV50JlcI9XbKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=htbPlpq3; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-38789e5b6a7so2428640f8f.1
        for <linux-media@vger.kernel.org>; Mon, 20 Jan 2025 03:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1737372955; x=1737977755; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=amJ0jOMIO8CuVby4PA+XmUkcGtCYKWXLsW9/gX7rcEI=;
        b=htbPlpq38UAAE5Baxi2ZwYbT4VgLKbAtE7in3OVgQhF2AADNSGGcOMj3adZ0VZoWBB
         OBg2bP9k9pgthHZciR4CR1KJLd3ckPkGuTj0bIGexMwQkw2QHVO98aaThFnIO2YSW+TB
         0HFRI/FCFfOINUzwSE6GDGH70UmbRaeGIUb+2abOBWsuXIFVABFtwcWQyz/u/sboU66w
         L585DogdOPZlKu6UTAbrAnBvwZ/ccUbyqMxQ85dj5RszH5Uisx3LYStjY/NPBlUR+7M/
         HYdcRNLFAun4AyosAD4gRimL6pEVYNz5G5Z84t1ccEDKYY8IiJht9hr2BK3Qao5BwY9f
         TvyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737372955; x=1737977755;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=amJ0jOMIO8CuVby4PA+XmUkcGtCYKWXLsW9/gX7rcEI=;
        b=LwX8j5Iz67HYC04Lkg6aT60IgujuCd/38VLz9YfHQXolCK9BjK6UIUHFrTLBLgCnvl
         Mb547hqsgZjbPtkvqp3HL7HKHp6qJmm2zSnecsvQyUo0qifo11j15Uuv0I8IFjC0uz5+
         3Pi6uOhRfMt5p0haZ+biNOCpKtDkl3NPbAyaWNvBxdbtBEC2hantcKHlO+wMZbeKeHtT
         NurjzbZwIsb02TRFJwJF1rxHPYQcMdPvThKeGm3CbjzM32wjAsjDBD6+Oku+ApmjfBz1
         1ajZ695ioNYdguKb7IiP2Dkx/MV5MotPnVC3uBiuIia+SGU5bzSfbpKlyzFzPX3/ZQ90
         ODFA==
X-Gm-Message-State: AOJu0YxrLhKBVYTQQo7gRDF0A18RH/zaGXaizndugymknLlwvm/k9dzW
	0GTfy0OKPhdzKb8HgUMf7pTqByYCrFgkk+eUTfief20KOY42tk2cnHU+0H1XQpQ=
X-Gm-Gg: ASbGnct6SKAHawjUG4P3SJwn3V8TWZ9OW3AUbzFA1zeM/iOjDAg4qCrU5tO8vtjoQs3
	YktZj3n8P9aa49Q6vEFmwXZHrG3shqwBdGHoAa3l6f9u0DM1l9Ld0xLLrmjsTPdf1Qgq5FilYO6
	OA/jLPW7U/FnnA0amQB3Vbkzv3ioI3qXRdKEXiT02mvqr9uR8r0AlOY9aCQF61y0OMFhMjxl0IX
	sjyobPAjprOZ5XjKbndOOc68JQpAE1R5FwASubH1qeLNLhhuTYdfTrGzg28l+i38X+Iu7F/
X-Google-Smtp-Source: AGHT+IHZJggxxO8vsAoxlaCmMuIR0iSAjF+i6Hp49uWpEdXOzq7nGkP7B1JrPb1TfAqYw9liXpH+Pg==
X-Received: by 2002:a05:6000:1a87:b0:38a:5a37:4a46 with SMTP id ffacd0b85a97d-38bf565f65dmr10829816f8f.17.1737372953758;
        Mon, 20 Jan 2025 03:35:53 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38bf32755f0sm10227484f8f.76.2025.01.20.03.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 03:35:53 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 20 Jan 2025 11:35:40 +0000
Subject: [PATCH] media: imx219: Adjust PLL settings based on the number of
 MIPI lanes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250120-media-imx219-4lane-v1-1-c7aa1a413ddc@raspberrypi.com>
X-B4-Tracking: v=1; b=H4sIAAs1jmcC/x3MMQqAMAxA0atIZgNtsIpeRRyCjRrQKi2IULy7x
 fEN/2dIElUSDFWGKLcmPUOBrSuYNw6roPpiIEPOWDJ4iFdGPR6yPTY7B8HFemF2vWupgxJeURZ
 9/uk4ve8Hw/cjIWQAAAA=
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Adam Ford <aford173@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Peyton Howe <peyton.howe@bellsouth.net>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

Commit ceddfd4493b3 ("media: i2c: imx219: Support four-lane operation")
added support for device tree to allow configuration of the sensor to
use 4 lanes with a link frequency of 363MHz, and amended the advertised
pixel rate to 280.8MPix/s.

However it didn't change any of the PLL settings, so actually it would
have been running overclocked in the MIPI block, and with the frame
rate and exposure calculations being wrong as the pixel rate was
unchanged.

The pixel rate and link frequency advertised were taken from the "Clock
Setting Example" section of the datasheet. However those are based on an
external clock of 12MHz, and are unachievable with a clock of 24MHz - it
seems PREPLLCLK_VT_DIV and PREPLLCK_OP_DIV can ONLY be set via the
automatic configuration documented in "9-1-2 EXCK_FREQ setting depend on
INCK frequency", not by writing the registers.
The closest we can get with a 24MHz clock is 281.6MPix/s and 364MHz.

Dropping all support for the 363MHz link frequency would cause problems
for existing users, so allow it, but log a warning that the requested
value is being changed to the supported one.

Fixes: ceddfd4493b3 ("media: i2c: imx219: Support four-lane operation")
Co-developed-by: Peyton Howe <peyton.howe@bellsouth.net>
Signed-off-by: Peyton Howe <peyton.howe@bellsouth.net>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
This was fed back to us by Peyton Howe as giving image corruption
on a Raspberry Pi with DF Robot imx219 module, and confirmed with
a Soho Enterprises module.
Effectively the module was being overclocked and misbehaving.

With this patch and the Soho Enterprises module no image corruption
is observed, and the frame rates are spot on. I haven't checked
exposure times, but those should follow frame rate as they are
based on the same clock.
---
 drivers/media/i2c/imx219.c | 78 ++++++++++++++++++++++++++++++++++++----------
 1 file changed, 61 insertions(+), 17 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 2d54cea113e1..562b3eb0cb1e 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -133,10 +133,11 @@
 
 /* Pixel rate is fixed for all the modes */
 #define IMX219_PIXEL_RATE		182400000
-#define IMX219_PIXEL_RATE_4LANE		280800000
+#define IMX219_PIXEL_RATE_4LANE		281600000
 
 #define IMX219_DEFAULT_LINK_FREQ	456000000
-#define IMX219_DEFAULT_LINK_FREQ_4LANE	363000000
+#define IMX219_DEFAULT_LINK_FREQ_4LANE_UNSUPPORTED	363000000
+#define IMX219_DEFAULT_LINK_FREQ_4LANE	364000000
 
 /* IMX219 native and active pixel array size. */
 #define IMX219_NATIVE_WIDTH		3296U
@@ -168,15 +169,6 @@ static const struct cci_reg_sequence imx219_common_regs[] = {
 	{ CCI_REG8(0x30eb), 0x05 },
 	{ CCI_REG8(0x30eb), 0x09 },
 
-	/* PLL Clock Table */
-	{ IMX219_REG_VTPXCK_DIV, 5 },
-	{ IMX219_REG_VTSYCK_DIV, 1 },
-	{ IMX219_REG_PREPLLCK_VT_DIV, 3 },	/* 0x03 = AUTO set */
-	{ IMX219_REG_PREPLLCK_OP_DIV, 3 },	/* 0x03 = AUTO set */
-	{ IMX219_REG_PLL_VT_MPY, 57 },
-	{ IMX219_REG_OPSYCK_DIV, 1 },
-	{ IMX219_REG_PLL_OP_MPY, 114 },
-
 	/* Undocumented registers */
 	{ CCI_REG8(0x455e), 0x00 },
 	{ CCI_REG8(0x471e), 0x4b },
@@ -201,6 +193,34 @@ static const struct cci_reg_sequence imx219_common_regs[] = {
 	{ IMX219_REG_EXCK_FREQ, IMX219_EXCK_FREQ(IMX219_XCLK_FREQ / 1000000) },
 };
 
+static const struct cci_reg_sequence imx219_2lane_regs[] = {
+	/* PLL Clock Table */
+	{ IMX219_REG_VTPXCK_DIV, 5 },
+	{ IMX219_REG_VTSYCK_DIV, 1 },
+	{ IMX219_REG_PREPLLCK_VT_DIV, 3 },	/* 0x03 = AUTO set */
+	{ IMX219_REG_PREPLLCK_OP_DIV, 3 },	/* 0x03 = AUTO set */
+	{ IMX219_REG_PLL_VT_MPY, 57 },
+	{ IMX219_REG_OPSYCK_DIV, 1 },
+	{ IMX219_REG_PLL_OP_MPY, 114 },
+
+	/* 2-Lane CSI Mode */
+	{ IMX219_REG_CSI_LANE_MODE, IMX219_CSI_2_LANE_MODE },
+};
+
+static const struct cci_reg_sequence imx219_4lane_regs[] = {
+	/* PLL Clock Table */
+	{ IMX219_REG_VTPXCK_DIV, 5 },
+	{ IMX219_REG_VTSYCK_DIV, 1 },
+	{ IMX219_REG_PREPLLCK_VT_DIV, 3 },	/* 0x03 = AUTO set */
+	{ IMX219_REG_PREPLLCK_OP_DIV, 3 },	/* 0x03 = AUTO set */
+	{ IMX219_REG_PLL_VT_MPY, 88 },
+	{ IMX219_REG_OPSYCK_DIV, 1 },
+	{ IMX219_REG_PLL_OP_MPY, 91 },
+
+	/* 4-Lane CSI Mode */
+	{ IMX219_REG_CSI_LANE_MODE, IMX219_CSI_4_LANE_MODE },
+};
+
 static const s64 imx219_link_freq_menu[] = {
 	IMX219_DEFAULT_LINK_FREQ,
 };
@@ -662,9 +682,11 @@ static int imx219_set_framefmt(struct imx219 *imx219,
 
 static int imx219_configure_lanes(struct imx219 *imx219)
 {
-	return cci_write(imx219->regmap, IMX219_REG_CSI_LANE_MODE,
-			 imx219->lanes == 2 ? IMX219_CSI_2_LANE_MODE :
-			 IMX219_CSI_4_LANE_MODE, NULL);
+	/* Write the appropriate PLL settings for the number of MIPI lanes */
+	return cci_multi_reg_write(imx219->regmap,
+				  imx219->lanes == 2 ? imx219_2lane_regs : imx219_4lane_regs,
+				  imx219->lanes == 2 ? ARRAY_SIZE(imx219_2lane_regs) :
+				  ARRAY_SIZE(imx219_4lane_regs), NULL);
 };
 
 static int imx219_start_streaming(struct imx219 *imx219,
@@ -1036,6 +1058,7 @@ static int imx219_check_hwcfg(struct device *dev, struct imx219 *imx219)
 		.bus_type = V4L2_MBUS_CSI2_DPHY
 	};
 	int ret = -EINVAL;
+	bool link_frequency_valid = false;
 
 	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
 	if (!endpoint)
@@ -1062,9 +1085,30 @@ static int imx219_check_hwcfg(struct device *dev, struct imx219 *imx219)
 		goto error_out;
 	}
 
-	if (ep_cfg.nr_of_link_frequencies != 1 ||
-	   (ep_cfg.link_frequencies[0] != ((imx219->lanes == 2) ?
-	    IMX219_DEFAULT_LINK_FREQ : IMX219_DEFAULT_LINK_FREQ_4LANE))) {
+	if (ep_cfg.nr_of_link_frequencies == 1) {
+		switch (imx219->lanes) {
+		case 2:
+			if (ep_cfg.link_frequencies[0] ==
+						IMX219_DEFAULT_LINK_FREQ)
+				link_frequency_valid = true;
+			break;
+		case 4:
+			if (ep_cfg.link_frequencies[0] ==
+						IMX219_DEFAULT_LINK_FREQ_4LANE)
+				link_frequency_valid = true;
+			else if (ep_cfg.link_frequencies[0] ==
+				   IMX219_DEFAULT_LINK_FREQ_4LANE_UNSUPPORTED) {
+				dev_warn(dev, "Link frequency of %d not supported, but has been incorrectly advertised previously\n",
+					 IMX219_DEFAULT_LINK_FREQ_4LANE_UNSUPPORTED);
+				dev_warn(dev, "Using link frequency of %d\n",
+					 IMX219_DEFAULT_LINK_FREQ_4LANE);
+				link_frequency_valid = true;
+			}
+			break;
+		}
+	}
+
+	if (!link_frequency_valid) {
 		dev_err_probe(dev, -EINVAL,
 			      "Link frequency not supported: %lld\n",
 			      ep_cfg.link_frequencies[0]);

---
base-commit: 94794b5ce4d90ab134b0b101a02fddf6e74c437d
change-id: 20250120-media-imx219-4lane-f1deaa595627

Best regards,
-- 
Dave Stevenson <dave.stevenson@raspberrypi.com>


