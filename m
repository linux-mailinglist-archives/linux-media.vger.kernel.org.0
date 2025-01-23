Return-Path: <linux-media+bounces-25212-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBC3A1A72D
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 16:38:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B7803A2792
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 15:38:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB58413D502;
	Thu, 23 Jan 2025 15:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="OUDyE73V"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DE72F852
	for <linux-media@vger.kernel.org>; Thu, 23 Jan 2025 15:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737646684; cv=none; b=bwZXJqR8C3DvpRkQdnO74Up4/t19nSYOT0+ibg/nzVVx9BSAyuNeNLfunNAN2E7M8buJupEfyG+eJqa82m787Uq0bukiU/euyFIULToedrqUfqR6Q+sSyxzo+0oAwhkWxOW1FSN6rm9ZjMtwLJcLBM15pJYaklUd3V22JsO7Bm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737646684; c=relaxed/simple;
	bh=go9UwyolASGgtSXstruaJesfxVG21rAb0RLMdlmz3mo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=RPULb2yXyKG0ubPSYg43dy/47zqA8e+F1ClH7ohwL1Ou1n+ZeLOIW1gopLOcXptzJ7vtfGeE1bqpgYGsxNG5zXEB8tJcKQihqa+0z4NM4PNFW7tUQ4z5bhiWsaeT22TY7S+75A2SjnDTQ4noMGkUZ9qBmG5HlYawreMufhfqS6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=OUDyE73V; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-385df53e559so793702f8f.3
        for <linux-media@vger.kernel.org>; Thu, 23 Jan 2025 07:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1737646680; x=1738251480; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TUn3iKdWrTKdy42YK9lrN5yhRM0D/wGv3Rh4t6Q5I5M=;
        b=OUDyE73Vlo6Q48wll3iQAr7qGwZnHWX0QMRNKnvmN/PJEl4luyFfR4ACThkcxB1Tr4
         c8DNBGpE+QHPjtszOCHEdKODrfUHYLEfkbLaiRCPd53inAnFcihzBp4vJYQl1wZ8L9LR
         awNKOHKc/kFFq+5NXgl+FXiyS5RmaMjA88iYc+C1WgAtmwwp12pUSuVghrtukziIDQka
         YXvFnmB2scKYNndEK1sLx8oo6e4W49x1XmBnkYcIxAqavqa0BNCW1/a0yDmwGhOhdjVT
         gYQ28bKFCfEjOvTVUWM4uFYbzyuxhsdMxfaL9ne3d2EzGjcuL392uQb18Bj8stId1s7z
         1oZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737646680; x=1738251480;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TUn3iKdWrTKdy42YK9lrN5yhRM0D/wGv3Rh4t6Q5I5M=;
        b=j3X4i4gsJXagtf1V2yMjpNWCzsLihfIAI32c+gbtteeGLedzr7MGGuWFgxROwf+QEr
         f3HzfFni7MzIsmR7glmeIiGta98znRVYs+iNxc1K6mTecYD2oPdyTXLcB2dHviq7ywW6
         4o5SsCvjkvHIlbwVNvw0cs51+zwlkr//MewIw3SY0xh1iNzKpZf134HP0HginnwWcoio
         xZx3hIx1AJy3ttUiNx/VHV0izUJlEnYBl4xsmLnYw3kMSC/i3tMlyAtlOEUVqY8/qkN1
         XKP5VGS7gIq0vvG8Ca9stu3hiQfEIaPYVZrZ54QQo4FQgwapZtFBAQ37UzOO0O8hhuaa
         lC0A==
X-Gm-Message-State: AOJu0Yxjt2/43J94S1nOLGi9etkVmyI1t/fck9E7q/tBWfRWKoIs3YdQ
	neyCmc7jORXH7CnCs+hYiHbUfHzJatgL9Q1N15L3BbJFgfLXTP9wRbHE7AUQPO4=
X-Gm-Gg: ASbGncury/3v1dVDc9Ry+mMtMG6LbvcyN1kiiM6WbvSXe7lu/WeQ+r7h6RpzLbjueKm
	ADlaRecnOmnpNe6h8UrzOupGn8sbXjubKVEC6Azr72pm86FUvgXzTJkYLzy0jx0uHKLFgybG8J+
	P3TjLLfHxTK/tWn3QwfLswHoOSVEbFClEra9S1sXMP+Rs8JN+SLFLPHCJ/nfsZ5Ic9WtW43MFAs
	5nMdfFZDkxjaTZ3dBCixFbwUf/RmH6VBgWcxx79ObUN3OKDIfWEfAm8E45F+tgdEtVZnjCe
X-Google-Smtp-Source: AGHT+IGUP7W8Lban32wv+e4thc74TOLm+KZ4xfI/RK+Cafh67K7b18iKCh+s1CnARQIwWaAxVlzKmQ==
X-Received: by 2002:a5d:64a1:0:b0:385:f7d9:99f5 with SMTP id ffacd0b85a97d-38bf57d3813mr29730924f8f.51.1737646679979;
        Thu, 23 Jan 2025 07:37:59 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38bf328dc08sm19356058f8f.101.2025.01.23.07.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 07:37:59 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 23 Jan 2025 15:37:49 +0000
Subject: [PATCH v2] media: imx219: Adjust PLL settings based on the number
 of MIPI lanes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250123-media-imx219-4lane-v2-1-b001662f4310@raspberrypi.com>
X-B4-Tracking: v=1; b=H4sIAExikmcC/32NTQ6CQAxGr0K6toaOIMGV9zAs6kyRJvKTjiEQw
 t0dOYDL95LvfRtEMZUIt2wDk1mjjkMCd8rAdzy8BDUkBpe7MieXYy9BGbVfHNVYvHkQbCkIc1m
 XV1dBGk4mrS5H9NEk7jR+RluPj5l+9m9uJiT0FTNxQZcQ/N04Tk8xWyc9+7GHZt/3L36W1fq6A
 AAA
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
Changes in v2:
- Reworked to use v4l2_link_freq_to_bitmap instead of manual checks of
  the link frequency (Sakari).
- Link to v1: https://lore.kernel.org/r/20250120-media-imx219-4lane-v1-1-c7aa1a413ddc@raspberrypi.com
---
 drivers/media/i2c/imx219.c | 93 ++++++++++++++++++++++++++++++++++------------
 1 file changed, 69 insertions(+), 24 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 2d54cea113e1..fd6cafc32847 100644
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
@@ -201,12 +193,45 @@ static const struct cci_reg_sequence imx219_common_regs[] = {
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
 
 static const s64 imx219_link_freq_4lane_menu[] = {
 	IMX219_DEFAULT_LINK_FREQ_4LANE,
+	/*
+	 * This will never be advertised to userspace, but will be used for
+	 * v4l2_link_freq_to_bitmap
+	 */
+	IMX219_DEFAULT_LINK_FREQ_4LANE_UNSUPPORTED,
 };
 
 static const char * const imx219_test_pattern_menu[] = {
@@ -662,9 +687,11 @@ static int imx219_set_framefmt(struct imx219 *imx219,
 
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
@@ -1035,6 +1062,7 @@ static int imx219_check_hwcfg(struct device *dev, struct imx219 *imx219)
 	struct v4l2_fwnode_endpoint ep_cfg = {
 		.bus_type = V4L2_MBUS_CSI2_DPHY
 	};
+	unsigned long link_freq_bitmap;
 	int ret = -EINVAL;
 
 	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
@@ -1056,23 +1084,40 @@ static int imx219_check_hwcfg(struct device *dev, struct imx219 *imx219)
 	imx219->lanes = ep_cfg.bus.mipi_csi2.num_data_lanes;
 
 	/* Check the link frequency set in device tree */
-	if (!ep_cfg.nr_of_link_frequencies) {
-		dev_err_probe(dev, -EINVAL,
-			      "link-frequency property not found in DT\n");
-		goto error_out;
+	switch (imx219->lanes) {
+	case 2:
+		ret = v4l2_link_freq_to_bitmap(dev,
+					       ep_cfg.link_frequencies,
+					       ep_cfg.nr_of_link_frequencies,
+					       imx219_link_freq_menu,
+					       ARRAY_SIZE(imx219_link_freq_menu),
+					       &link_freq_bitmap);
+		break;
+	case 4:
+		ret = v4l2_link_freq_to_bitmap(dev,
+					       ep_cfg.link_frequencies,
+					       ep_cfg.nr_of_link_frequencies,
+					       imx219_link_freq_4lane_menu,
+					       ARRAY_SIZE(imx219_link_freq_4lane_menu),
+					       &link_freq_bitmap);
+
+		if (!ret && (link_freq_bitmap & BIT(1))) {
+			dev_warn(dev, "Link frequency of %d not supported, but has been incorrectly advertised previously\n",
+				 IMX219_DEFAULT_LINK_FREQ_4LANE_UNSUPPORTED);
+			dev_warn(dev, "Using link frequency of %d\n",
+				 IMX219_DEFAULT_LINK_FREQ_4LANE);
+			link_freq_bitmap |= BIT(0);
+		}
+		break;
 	}
 
-	if (ep_cfg.nr_of_link_frequencies != 1 ||
-	   (ep_cfg.link_frequencies[0] != ((imx219->lanes == 2) ?
-	    IMX219_DEFAULT_LINK_FREQ : IMX219_DEFAULT_LINK_FREQ_4LANE))) {
+	if (ret || !(link_freq_bitmap & BIT(0))) {
+		ret = -EINVAL;
 		dev_err_probe(dev, -EINVAL,
 			      "Link frequency not supported: %lld\n",
 			      ep_cfg.link_frequencies[0]);
-		goto error_out;
 	}
 
-	ret = 0;
-
 error_out:
 	v4l2_fwnode_endpoint_free(&ep_cfg);
 	fwnode_handle_put(endpoint);

---
base-commit: 94794b5ce4d90ab134b0b101a02fddf6e74c437d
change-id: 20250120-media-imx219-4lane-f1deaa595627

Best regards,
-- 
Dave Stevenson <dave.stevenson@raspberrypi.com>


