Return-Path: <linux-media+bounces-38009-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A88B08D32
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 14:40:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6D913B002C
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 12:39:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95D5F2C17A0;
	Thu, 17 Jul 2025 12:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NZ4p4ueP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58AA2230981
	for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 12:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752756011; cv=none; b=Qs9YxXqcohfvINVREbZvpNNt6zyb7xUz+sppYhAfgWViKHnJ4ysG5fzH15eQRdjDreC3bcaPnD8U6D6K4LwwZ9uDlwc/XMGBoXmQSoGhmy2fDhmBOJ2/QWslNqhVVxj2zj3nJTjNcoMtY/d7uN9CkNdeqYEYlso24Cr53WEH5kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752756011; c=relaxed/simple;
	bh=UwOhSOTngCD4g9mHxxTckLKQ7nqK80F23AMaCNz2JqI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NZXMMc8IxXn2ELSlG8izFUZZ/QkRTsM9idfeSkh2WNXWwCZh3USa8nVEuo6j1V7rTelF4kaixPySYsaF4iVEuMGcAvm4m/NWfRgcXqxpOTwnIDt9qlwETd4gdKYSlmI2mfZwfRSWVhs/W3gGEPXmppQD5dATcGxbfr60kGhAb5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NZ4p4ueP; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-553aba2f99eso167348e87.3
        for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 05:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752756005; x=1753360805; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DXVkAcYLPAPVOMdlnbPKzxmdtFFIc0QiHO27s80bhQ0=;
        b=NZ4p4uePFZprGqrG+xB071dk7gLKI6EIYn2JSqX2ISjzzKhWqj7Sf6uex680YeMKgn
         N4vVP0Y0kMgX7oHlezBOzNDyWtLecYTi+rJuN+WD5GiSedQqq82Sa5o4ZiXM2ckgsWu2
         Ur0Cvrzoc4eQHHboplWQFToNQ02Q9/tfCuScnnuH2m3cl6byn1AV6quWEfnLH4/sj9RP
         5OoVF3kHHRckWmHNTgmsku6N4yx16ZEhhA40vZj460Xefo1JC+ynGXV0RLrSbUVIBa9M
         FaE0lJs1SSk3R9eZJd9PKMlh7uaXH2sJeyqGkCrt9o+L0Ay2BFZnP7qdXZqRKwpuaI7s
         szdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752756005; x=1753360805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DXVkAcYLPAPVOMdlnbPKzxmdtFFIc0QiHO27s80bhQ0=;
        b=P5SBMtBCduOCrHUo2H4vaODTV/OAd8+5m6LSeBm9yqwe1CnJ9dKqruXowxEV9pAhI6
         Vf7j4u4rJBaNIuABH6mDWB7NpPSxZrt/q0PPZ723f/WsZrvJn1hWALitQmUDKfVNja4r
         TudwdDT6vSD8iimnJoV9zbp6wDxZ6OF4zo/iI8AAOg0uB5YTjqMqsh+2CkzGRE5iKeba
         NJ/DgX4g0zQm+1CbRj4egvEsfLI0tAUnGDOoaQeXU7n7JYC924bvnt0SH3EDLM0qi1eu
         5q3z125d209q2i+DfEm6F23diZeLZix0K2itCoUtPxCiTb9onr4wqF9SHfCBLoZo4XOA
         wnqg==
X-Gm-Message-State: AOJu0Yx3gu4I7XC4vpOtfzG4bqBtSGOomzXWt5me0eccJwFUljmACCoa
	kw2ITV8YrSReRvC3G7rG9RMbpZxSHP3Rv7CERb9eX0b9wGPDJgKo9bUvH2rrf+pbNi8=
X-Gm-Gg: ASbGncs44a2ijbjO0lvwij3RYV7X8hvmtvv+ofeEQdPpIm0NnmiMIj5QK1T6sjVOgso
	yPMqBxT1eoKq2+5YzjCkuRFUzd5Y4XY9JBYXv5X/gqFJhYVYI5Eg1khZNTI1GB322LO5x2Ezjzy
	iRU0vi7lGTMVnEXV4FcUOS7Wr77qEPBlSyWECWkoRuzk6uf13qQ6i4zX4KZR8njMeSdVq+tFymD
	VPkRGRkltReR+EAh4lgvAGYCqPQmI2nUAerat965HO9Q89neNUkozfJQChcPe99c/i07cFMz/P7
	sdX1c4CksKLKncNWPYsUqQHM3xP8XgA+A3OMtTWFZYkH3yUOPOCir//unHS8XtyKNuBuXxaxdt6
	UWS/YFQk9v3SueHc/Kpjxa7p/wE/TC85BfKsOG84gcS5YZj4pl84isonEI06I+xE/BXU4u4dtW+
	sFs2MkGelw
X-Google-Smtp-Source: AGHT+IEZo7ZveLsk78tSgl4Cpf65tJRVQnGEGzD/0SJ+wXeBPMr4Y1bu0KO/GAS+/ZuchRStTS09Bg==
X-Received: by 2002:a05:651c:4ca:b0:32b:75f0:cfaf with SMTP id 38308e7fff4ca-3308e0e51bfmr8000581fa.0.1752756005361;
        Thu, 17 Jul 2025 05:40:05 -0700 (PDT)
Received: from localhost.localdomain (88-112-128-43.elisa-laajakaista.fi. [88.112.128.43])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32fab8ed701sm24624871fa.90.2025.07.17.05.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 05:40:04 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/2] media: i2c: Add OmniVision OV6211 image sensor driver
Date: Thu, 17 Jul 2025 15:40:01 +0300
Message-ID: <20250717124001.108486-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250717124001.108486-1-vladimir.zapolskiy@linaro.org>
References: <20250717124001.108486-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

OmniVision OV6211 is a monochrome image sensor, which produces frames in
8/10-bit raw output format and supports 400x400, 200x200 and 100x100
output image resolution modes.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 MAINTAINERS                |   8 +
 drivers/media/i2c/Kconfig  |   9 +
 drivers/media/i2c/Makefile |   1 +
 drivers/media/i2c/ov6211.c | 877 +++++++++++++++++++++++++++++++++++++
 4 files changed, 895 insertions(+)
 create mode 100644 drivers/media/i2c/ov6211.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 1ef99240a57e..364914ca2d45 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18433,6 +18433,14 @@ S:	Maintained
 T:	git git://linuxtv.org/media.git
 F:	drivers/media/i2c/ov5695.c
 
+OMNIVISION OV6211 SENSOR DRIVER
+M:	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/devicetree/bindings/media/i2c/ovti,ov6211.yaml
+F:	drivers/media/i2c/ov6211.c
+
 OMNIVISION OV64A40 SENSOR DRIVER
 M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
 L:	linux-media@vger.kernel.org
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 6237fe804a5c..2c54753e1b25 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -542,6 +542,15 @@ config VIDEO_OV5695
 	  To compile this driver as a module, choose M here: the
 	  module will be called ov5695.
 
+config VIDEO_OV6211
+	tristate "OmniVision OV6211 sensor support"
+	help
+	  This is a Video4Linux2 sensor driver for the OmniVision
+	  OV6211 camera.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called ov6211.
+
 config VIDEO_OV64A40
 	tristate "OmniVision OV64A40 sensor support"
 	select V4L2_CCI_I2C
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index 5873d29433ee..03814fc8e2f7 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -103,6 +103,7 @@ obj-$(CONFIG_VIDEO_OV5670) += ov5670.o
 obj-$(CONFIG_VIDEO_OV5675) += ov5675.o
 obj-$(CONFIG_VIDEO_OV5693) += ov5693.o
 obj-$(CONFIG_VIDEO_OV5695) += ov5695.o
+obj-$(CONFIG_VIDEO_OV6211) += ov6211.o
 obj-$(CONFIG_VIDEO_OV64A40) += ov64a40.o
 obj-$(CONFIG_VIDEO_OV6650) += ov6650.o
 obj-$(CONFIG_VIDEO_OV7251) += ov7251.o
diff --git a/drivers/media/i2c/ov6211.c b/drivers/media/i2c/ov6211.c
new file mode 100644
index 000000000000..f2a9daf40896
--- /dev/null
+++ b/drivers/media/i2c/ov6211.c
@@ -0,0 +1,877 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2024-2025 Linaro Ltd
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
+#include <linux/unaligned.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
+
+#define OV6211_REG_VALUE_08BIT		1
+#define OV6211_REG_VALUE_16BIT		2
+#define OV6211_REG_VALUE_24BIT		3
+
+#define OV6211_LINK_FREQ_240MHZ		240000000ULL
+#define OV6211_MCLK_FREQ_24MHZ		24000000
+#define OV6211_DATA_LANES		1
+
+#define OV6211_REG_CHIP_ID		0x300a
+#define OV6211_CHIP_ID			0x6710
+
+#define OV6211_REG_MODE_SELECT		0x0100
+#define OV6211_MODE_STANDBY		0x00
+#define OV6211_MODE_STREAMING		0x01
+
+/* Exposure controls from sensor */
+#define OV6211_REG_EXPOSURE		0x3500
+#define OV6211_EXPOSURE_MIN		1
+#define OV6211_EXPOSURE_MAX_MARGIN	4
+#define OV6211_EXPOSURE_STEP		1
+#define OV6211_EXPOSURE_DEFAULT		210
+
+/* Analogue gain controls from sensor */
+#define OV6211_REG_ANALOGUE_GAIN	0x350a
+#define OV6211_ANALOGUE_GAIN_MIN	1
+#define OV6211_ANALOGUE_GAIN_MAX	0x3ff
+#define OV6211_ANALOGUE_GAIN_STEP	1
+#define OV6211_ANALOGUE_GAIN_DEFAULT	0xa0
+
+#define to_ov6211(_sd)			container_of(_sd, struct ov6211, sd)
+
+struct ov6211_reg {
+	u16 address;
+	u8 val;
+};
+
+struct ov6211_reg_list {
+	const struct ov6211_reg *regs;
+	u32 num_of_regs;
+};
+
+struct ov6211_mode {
+	/* Frame width in pixels */
+	u32 width;
+
+	/* Frame height in pixels */
+	u32 height;
+
+	/* Horizontal timining size */
+	u32 hts;
+
+	/* Default vertical timining size */
+	u32 vts;
+
+	/* Sensor register settings for this resolution */
+	const struct ov6211_reg_list reg_list;
+};
+
+static const s64 link_freq_menu_items[] = {
+	OV6211_LINK_FREQ_240MHZ,
+};
+
+static const struct ov6211_reg mode_400x400_regs[] = {
+	{ 0x0103, 0x01 },
+	{ 0x0100, 0x00 },
+	{ 0x3005, 0x08 },
+	{ 0x3013, 0x12 },
+	{ 0x3014, 0x04 },
+	{ 0x3016, 0x10 },
+	{ 0x3017, 0x00 },
+	{ 0x3018, 0x00 },
+	{ 0x301a, 0x00 },
+	{ 0x301b, 0x00 },
+	{ 0x301c, 0x00 },
+	{ 0x3037, 0xf0 },
+	{ 0x3080, 0x01 },
+	{ 0x3081, 0x00 },
+	{ 0x3082, 0x01 },
+	{ 0x3098, 0x04 },
+	{ 0x3099, 0x28 },
+	{ 0x309a, 0x06 },
+	{ 0x309b, 0x04 },
+	{ 0x309c, 0x00 },
+	{ 0x309d, 0x00 },
+	{ 0x309e, 0x01 },
+	{ 0x309f, 0x00 },
+	{ 0x30b0, 0x08 },
+	{ 0x30b1, 0x02 },
+	{ 0x30b2, 0x00 },
+	{ 0x30b3, 0x28 },
+	{ 0x30b4, 0x02 },
+	{ 0x30b5, 0x00 },
+	{ 0x3106, 0xd9 },
+	{ 0x3500, 0x00 },
+	{ 0x3501, 0x0d },
+	{ 0x3502, 0x20 },
+	{ 0x3503, 0x07 },
+	{ 0x3509, 0x10 },
+	{ 0x350b, 0xa0 },
+	{ 0x3600, 0xfc },
+	{ 0x3620, 0xb7 },
+	{ 0x3621, 0x05 },
+	{ 0x3626, 0x31 },
+	{ 0x3627, 0x40 },
+	{ 0x3632, 0xa3 },
+	{ 0x3633, 0x34 },
+	{ 0x3634, 0x40 },
+	{ 0x3636, 0x00 },
+	{ 0x3660, 0x80 },
+	{ 0x3662, 0x03 },
+	{ 0x3664, 0xf0 },
+	{ 0x366a, 0x10 },
+	{ 0x366b, 0x06 },
+	{ 0x3680, 0xf4 },
+	{ 0x3681, 0x50 },
+	{ 0x3682, 0x00 },
+	{ 0x3708, 0x20 },
+	{ 0x3709, 0x40 },
+	{ 0x370d, 0x03 },
+	{ 0x373b, 0x02 },
+	{ 0x373c, 0x08 },
+	{ 0x3742, 0x00 },
+	{ 0x3744, 0x16 },
+	{ 0x3745, 0x08 },
+	{ 0x3781, 0xfc },
+	{ 0x3788, 0x00 },
+	{ 0x3800, 0x00 },
+	{ 0x3801, 0x04 },
+	{ 0x3802, 0x00 },
+	{ 0x3803, 0x04 },
+	{ 0x3804, 0x01 },
+	{ 0x3805, 0x9b },
+	{ 0x3806, 0x01 },
+	{ 0x3807, 0x9b },
+	{ 0x3808, 0x01 },
+	{ 0x3809, 0x90 },
+	{ 0x380a, 0x01 },
+	{ 0x380b, 0x90 },
+	{ 0x380c, 0x05 },
+	{ 0x380d, 0xf2 },
+	{ 0x380e, 0x01 },
+	{ 0x380f, 0xb6 },
+	{ 0x3810, 0x00 },
+	{ 0x3811, 0x04 },
+	{ 0x3812, 0x00 },
+	{ 0x3813, 0x04 },
+	{ 0x3814, 0x11 },
+	{ 0x3815, 0x11 },
+	{ 0x3820, 0x00 },
+	{ 0x3821, 0x00 },
+	{ 0x382b, 0xfa },
+	{ 0x382f, 0x04 },
+	{ 0x3832, 0x00 },
+	{ 0x3833, 0x05 },
+	{ 0x3834, 0x00 },
+	{ 0x3835, 0x05 },
+	{ 0x3882, 0x04 },
+	{ 0x3883, 0x00 },
+	{ 0x38a4, 0x10 },
+	{ 0x38a5, 0x00 },
+	{ 0x38b1, 0x03 },
+	{ 0x3b80, 0x00 },
+	{ 0x3b81, 0xff },
+	{ 0x3b82, 0x10 },
+	{ 0x3b83, 0x00 },
+	{ 0x3b84, 0x08 },
+	{ 0x3b85, 0x00 },
+	{ 0x3b86, 0x01 },
+	{ 0x3b87, 0x00 },
+	{ 0x3b88, 0x00 },
+	{ 0x3b89, 0x00 },
+	{ 0x3b8a, 0x00 },
+	{ 0x3b8b, 0x05 },
+	{ 0x3b8c, 0x00 },
+	{ 0x3b8d, 0x00 },
+	{ 0x3b8e, 0x01 },
+	{ 0x3b8f, 0xb2 },
+	{ 0x3b94, 0x05 },
+	{ 0x3b95, 0xf2 },
+	{ 0x3b96, 0xc0 },
+	{ 0x4004, 0x04 },
+	{ 0x404e, 0x01 },
+	{ 0x4801, 0x0f },
+	{ 0x4806, 0x0f },
+	{ 0x4837, 0x43 },
+	{ 0x5a08, 0x00 },
+	{ 0x5a01, 0x00 },
+	{ 0x5a03, 0x00 },
+	{ 0x5a04, 0x10 },
+	{ 0x5a05, 0xa0 },
+	{ 0x5a06, 0x0c },
+	{ 0x5a07, 0x78 },
+};
+
+static const struct ov6211_mode supported_modes[] = {
+	{
+		.width = 400,
+		.height = 400,
+		.hts = 1522,
+		.vts = 438,
+		.reg_list = {
+			.regs = mode_400x400_regs,
+			.num_of_regs = ARRAY_SIZE(mode_400x400_regs),
+		},
+	},
+};
+
+struct ov6211 {
+	struct clk *xvclk;
+	struct gpio_desc *reset_gpio;
+	struct regulator *avdd;
+	struct regulator *dovdd;
+	struct regulator *dvdd;
+
+	struct v4l2_subdev sd;
+	struct media_pad pad;
+	struct v4l2_ctrl_handler ctrl_handler;
+
+	/* V4L2 Controls */
+	struct v4l2_ctrl *link_freq;
+	struct v4l2_ctrl *exposure;
+
+	/* Current mode */
+	const struct ov6211_mode *cur_mode;
+
+	/* To serialize asynchronous callbacks */
+	struct mutex mutex;
+};
+
+static int ov6211_read_reg(struct ov6211 *ov6211, u16 reg, u16 len, u32 *val)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&ov6211->sd);
+	u8 addr_buf[2], data_buf[4] = { 0 };
+	struct i2c_msg msgs[2];
+	int ret;
+
+	if (len > 4)
+		return -EINVAL;
+
+	put_unaligned_be16(reg, addr_buf);
+	msgs[0].addr = client->addr;
+	msgs[0].flags = 0;
+	msgs[0].len = sizeof(addr_buf);
+	msgs[0].buf = addr_buf;
+	msgs[1].addr = client->addr;
+	msgs[1].flags = I2C_M_RD;
+	msgs[1].len = len;
+	msgs[1].buf = &data_buf[4 - len];
+
+	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
+	if (ret != ARRAY_SIZE(msgs))
+		return -EIO;
+
+	*val = get_unaligned_be32(data_buf);
+
+	return 0;
+}
+
+static int ov6211_write_reg(struct ov6211 *ov6211, u16 reg, u16 len, u32 val)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&ov6211->sd);
+	u8 buf[6];
+
+	if (len > 4)
+		return -EINVAL;
+
+	put_unaligned_be16(reg, buf);
+	put_unaligned_be32(val << 8 * (4 - len), buf + 2);
+	if (i2c_master_send(client, buf, len + 2) != len + 2)
+		return -EIO;
+
+	return 0;
+}
+
+static int ov6211_write_reg_list(struct ov6211 *ov6211,
+				 const struct ov6211_reg_list *r_list)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&ov6211->sd);
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < r_list->num_of_regs; i++) {
+		ret = ov6211_write_reg(ov6211, r_list->regs[i].address, 1,
+				       r_list->regs[i].val);
+		if (ret) {
+			dev_err_ratelimited(&client->dev,
+					    "failed to write reg 0x%4.4x. error = %d\n",
+					    r_list->regs[i].address, ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int ov6211_set_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct ov6211 *ov6211 = container_of(ctrl->handler, struct ov6211,
+					     ctrl_handler);
+	struct i2c_client *client = v4l2_get_subdevdata(&ov6211->sd);
+	int ret;
+
+	/* V4L2 controls values will be applied only when power is already up */
+	if (!pm_runtime_get_if_in_use(&client->dev))
+		return 0;
+
+	switch (ctrl->id) {
+	case V4L2_CID_ANALOGUE_GAIN:
+		ret = ov6211_write_reg(ov6211, OV6211_REG_ANALOGUE_GAIN,
+				       OV6211_REG_VALUE_16BIT, ctrl->val);
+		break;
+	case V4L2_CID_EXPOSURE:
+		ret = ov6211_write_reg(ov6211, OV6211_REG_EXPOSURE,
+				       OV6211_REG_VALUE_24BIT, ctrl->val << 4);
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	pm_runtime_put(&client->dev);
+
+	return ret;
+}
+
+static const struct v4l2_ctrl_ops ov6211_ctrl_ops = {
+	.s_ctrl = ov6211_set_ctrl,
+};
+
+static int ov6211_init_controls(struct ov6211 *ov6211)
+{
+	struct v4l2_ctrl_handler *ctrl_hdlr;
+	s64 exposure_max;
+	int ret;
+
+	ctrl_hdlr = &ov6211->ctrl_handler;
+	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 3);
+	if (ret)
+		return ret;
+
+	ctrl_hdlr->lock = &ov6211->mutex;
+
+	ov6211->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &ov6211_ctrl_ops,
+					V4L2_CID_LINK_FREQ,
+					ARRAY_SIZE(link_freq_menu_items) - 1,
+					0, link_freq_menu_items);
+	if (ov6211->link_freq)
+		ov6211->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	v4l2_ctrl_new_std(ctrl_hdlr, &ov6211_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
+			  OV6211_ANALOGUE_GAIN_MIN, OV6211_ANALOGUE_GAIN_MAX,
+			  OV6211_ANALOGUE_GAIN_STEP,
+			  OV6211_ANALOGUE_GAIN_DEFAULT);
+
+	exposure_max = (ov6211->cur_mode->vts - OV6211_EXPOSURE_MAX_MARGIN);
+	ov6211->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &ov6211_ctrl_ops,
+					     V4L2_CID_EXPOSURE,
+					     OV6211_EXPOSURE_MIN, exposure_max,
+					     OV6211_EXPOSURE_STEP,
+					     OV6211_EXPOSURE_DEFAULT);
+
+	if (ctrl_hdlr->error)
+		return ctrl_hdlr->error;
+
+	ov6211->sd.ctrl_handler = ctrl_hdlr;
+
+	return 0;
+}
+
+static void ov6211_update_pad_format(const struct ov6211_mode *mode,
+				     struct v4l2_mbus_framefmt *fmt)
+{
+	fmt->width = mode->width;
+	fmt->height = mode->height;
+	fmt->code = MEDIA_BUS_FMT_Y8_1X8;
+	fmt->field = V4L2_FIELD_NONE;
+}
+
+static int ov6211_start_streaming(struct ov6211 *ov6211)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&ov6211->sd);
+	const struct ov6211_reg_list *reg_list;
+	int ret;
+
+	reg_list = &ov6211->cur_mode->reg_list;
+	ret = ov6211_write_reg_list(ov6211, reg_list);
+	if (ret) {
+		dev_err(&client->dev, "failed to set mode\n");
+		return ret;
+	}
+
+	ret = __v4l2_ctrl_handler_setup(ov6211->sd.ctrl_handler);
+	if (ret)
+		return ret;
+
+	ret = ov6211_write_reg(ov6211, OV6211_REG_MODE_SELECT,
+			       OV6211_REG_VALUE_08BIT,
+			       OV6211_MODE_STREAMING);
+	if (ret) {
+		dev_err(&client->dev, "failed to start streaming\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static void ov6211_stop_streaming(struct ov6211 *ov6211)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&ov6211->sd);
+
+	if (ov6211_write_reg(ov6211, OV6211_REG_MODE_SELECT,
+			     OV6211_REG_VALUE_08BIT, OV6211_MODE_STANDBY))
+		dev_err(&client->dev, "failed to stop streaming\n");
+}
+
+static int ov6211_set_stream(struct v4l2_subdev *sd, int enable)
+{
+	struct ov6211 *ov6211 = to_ov6211(sd);
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	int ret = 0;
+
+	mutex_lock(&ov6211->mutex);
+
+	if (enable) {
+		ret = pm_runtime_resume_and_get(&client->dev);
+		if (ret) {
+			mutex_unlock(&ov6211->mutex);
+			return ret;
+		}
+
+		ret = ov6211_start_streaming(ov6211);
+		if (!ret) {
+			mutex_unlock(&ov6211->mutex);
+			return 0;
+		}
+	}
+
+	ov6211_stop_streaming(ov6211);
+	pm_runtime_put(&client->dev);
+
+	mutex_unlock(&ov6211->mutex);
+
+	return ret;
+}
+
+static int ov6211_set_format(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *sd_state,
+			     struct v4l2_subdev_format *fmt)
+{
+	struct ov6211 *ov6211 = to_ov6211(sd);
+	const struct ov6211_mode *mode;
+
+	mode = v4l2_find_nearest_size(supported_modes,
+				      ARRAY_SIZE(supported_modes),
+				      width, height,
+				      fmt->format.width,
+				      fmt->format.height);
+
+	mutex_lock(&ov6211->mutex);
+
+	ov6211_update_pad_format(mode, &fmt->format);
+	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
+		*v4l2_subdev_state_get_format(sd_state, fmt->pad) = fmt->format;
+	else
+		ov6211->cur_mode = mode;
+
+	mutex_unlock(&ov6211->mutex);
+
+	return 0;
+}
+
+static int ov6211_get_format(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *sd_state,
+			     struct v4l2_subdev_format *fmt)
+{
+	struct ov6211 *ov6211 = to_ov6211(sd);
+
+	mutex_lock(&ov6211->mutex);
+
+	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
+		fmt->format = *v4l2_subdev_state_get_format(sd_state, fmt->pad);
+	else
+		ov6211_update_pad_format(ov6211->cur_mode, &fmt->format);
+
+	mutex_unlock(&ov6211->mutex);
+
+	return 0;
+}
+
+static int ov6211_enum_mbus_code(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *sd_state,
+				 struct v4l2_subdev_mbus_code_enum *code)
+{
+	if (code->index > 0)
+		return -EINVAL;
+
+	code->code = MEDIA_BUS_FMT_Y8_1X8;
+
+	return 0;
+}
+
+static int ov6211_enum_frame_size(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *sd_state,
+				  struct v4l2_subdev_frame_size_enum *fse)
+{
+	if (fse->index >= ARRAY_SIZE(supported_modes))
+		return -EINVAL;
+
+	if (fse->code != MEDIA_BUS_FMT_Y8_1X8)
+		return -EINVAL;
+
+	fse->min_width = supported_modes[fse->index].width;
+	fse->max_width = fse->min_width;
+	fse->min_height = supported_modes[fse->index].height;
+	fse->max_height = fse->min_height;
+
+	return 0;
+}
+
+static int ov6211_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
+{
+	struct ov6211 *ov6211 = to_ov6211(sd);
+
+	mutex_lock(&ov6211->mutex);
+
+	ov6211_update_pad_format(&supported_modes[0],
+				 v4l2_subdev_state_get_format(fh->state, 0));
+
+	mutex_unlock(&ov6211->mutex);
+
+	return 0;
+}
+
+static const struct v4l2_subdev_video_ops ov6211_video_ops = {
+	.s_stream = ov6211_set_stream,
+};
+
+static const struct v4l2_subdev_pad_ops ov6211_pad_ops = {
+	.set_fmt = ov6211_set_format,
+	.get_fmt = ov6211_get_format,
+	.enum_mbus_code = ov6211_enum_mbus_code,
+	.enum_frame_size = ov6211_enum_frame_size,
+};
+
+static const struct v4l2_subdev_ops ov6211_subdev_ops = {
+	.video = &ov6211_video_ops,
+	.pad = &ov6211_pad_ops,
+};
+
+static const struct media_entity_operations ov6211_subdev_entity_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+};
+
+static const struct v4l2_subdev_internal_ops ov6211_internal_ops = {
+	.open = ov6211_open,
+};
+
+static int ov6211_identify_module(struct ov6211 *ov6211)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&ov6211->sd);
+	int ret;
+	u32 val;
+
+	ret = ov6211_read_reg(ov6211, OV6211_REG_CHIP_ID,
+			      OV6211_REG_VALUE_16BIT, &val);
+	if (ret)
+		return ret;
+
+	if (val != OV6211_CHIP_ID) {
+		dev_err(&client->dev, "chip id mismatch: %x!=%x\n",
+			OV6211_CHIP_ID, val);
+		return -ENXIO;
+	}
+
+	return 0;
+}
+
+static int ov6211_check_hwcfg(struct ov6211 *ov6211)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&ov6211->sd);
+	struct device *dev = &client->dev;
+	struct fwnode_handle *fwnode = dev_fwnode(dev), *ep;
+	struct v4l2_fwnode_endpoint bus_cfg = {
+		.bus_type = V4L2_MBUS_CSI2_DPHY
+	};
+	int ret;
+
+	if (!fwnode)
+		return -ENXIO;
+
+	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
+	if (!ep)
+		return -ENXIO;
+
+	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
+	fwnode_handle_put(ep);
+	if (ret)
+		return ret;
+
+	if (bus_cfg.bus.mipi_csi2.num_data_lanes &&
+	    bus_cfg.bus.mipi_csi2.num_data_lanes != OV6211_DATA_LANES) {
+		dev_err(dev, "Invalid number of data lanes: %u\n",
+			bus_cfg.bus.mipi_csi2.num_data_lanes);
+		ret = -EINVAL;
+		goto check_hwcfg_error;
+	}
+
+	if (!bus_cfg.nr_of_link_frequencies) {
+		dev_err(dev, "link-frequency property is not found\n");
+		ret = -EINVAL;
+		goto check_hwcfg_error;
+	}
+
+	if (bus_cfg.nr_of_link_frequencies != 1 ||
+	    bus_cfg.link_frequencies[0] != link_freq_menu_items[0]) {
+		dev_err(dev, "Unsupported link-frequency property is found\n");
+		ret = -EINVAL;
+		goto check_hwcfg_error;
+	}
+
+check_hwcfg_error:
+	v4l2_fwnode_endpoint_free(&bus_cfg);
+
+	return ret;
+}
+
+static int ov6211_power_on(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct ov6211 *ov6211 = to_ov6211(sd);
+	int ret;
+
+	if (ov6211->avdd) {
+		ret = regulator_enable(ov6211->avdd);
+		if (ret)
+			return ret;
+	}
+
+	if (ov6211->dovdd) {
+		ret = regulator_enable(ov6211->dovdd);
+		if (ret)
+			goto avdd_disable;
+	}
+
+	if (ov6211->dvdd) {
+		ret = regulator_enable(ov6211->dvdd);
+		if (ret)
+			goto dovdd_disable;
+	}
+
+	gpiod_set_value_cansleep(ov6211->reset_gpio, 0);
+	usleep_range(10 * USEC_PER_MSEC, 15 * USEC_PER_MSEC);
+
+	ret = clk_prepare_enable(ov6211->xvclk);
+	if (ret)
+		goto dvdd_disable;
+
+	return 0;
+
+dvdd_disable:
+	if (ov6211->dvdd)
+		regulator_disable(ov6211->dvdd);
+dovdd_disable:
+	if (ov6211->dovdd)
+		regulator_disable(ov6211->dovdd);
+avdd_disable:
+	if (ov6211->avdd)
+		regulator_disable(ov6211->avdd);
+
+	return ret;
+}
+
+static int ov6211_power_off(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct ov6211 *ov6211 = to_ov6211(sd);
+
+	clk_disable_unprepare(ov6211->xvclk);
+
+	gpiod_set_value_cansleep(ov6211->reset_gpio, 1);
+
+	if (ov6211->dvdd)
+		regulator_disable(ov6211->dvdd);
+
+	if (ov6211->dovdd)
+		regulator_disable(ov6211->dovdd);
+
+	if (ov6211->avdd)
+		regulator_disable(ov6211->avdd);
+
+	return 0;
+}
+
+static void ov6211_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct ov6211 *ov6211 = to_ov6211(sd);
+
+	v4l2_async_unregister_subdev(sd);
+	media_entity_cleanup(&sd->entity);
+	v4l2_ctrl_handler_free(sd->ctrl_handler);
+	pm_runtime_disable(&client->dev);
+	mutex_destroy(&ov6211->mutex);
+}
+
+static int ov6211_probe(struct i2c_client *client)
+{
+	struct ov6211 *ov6211;
+	unsigned long freq;
+	int ret;
+
+	ov6211 = devm_kzalloc(&client->dev, sizeof(*ov6211), GFP_KERNEL);
+	if (!ov6211)
+		return -ENOMEM;
+
+	v4l2_i2c_subdev_init(&ov6211->sd, client, &ov6211_subdev_ops);
+
+	ov6211->xvclk = devm_clk_get_optional(&client->dev, NULL);
+	if (IS_ERR(ov6211->xvclk)) {
+		ret = PTR_ERR(ov6211->xvclk);
+		dev_err(&client->dev, "failed to get XVCLK clock: %d\n", ret);
+		return ret;
+	}
+
+	freq = clk_get_rate(ov6211->xvclk);
+	if (freq && freq != OV6211_MCLK_FREQ_24MHZ)
+		return dev_err_probe(&client->dev, -EINVAL,
+				"XVCLK clock frequency %lu is not supported\n",
+				freq);
+
+	ret = ov6211_check_hwcfg(ov6211);
+	if (ret) {
+		dev_err(&client->dev, "failed to check HW configuration: %d",
+			ret);
+		return ret;
+	}
+
+	ov6211->reset_gpio = devm_gpiod_get_optional(&client->dev, "reset",
+						     GPIOD_OUT_HIGH);
+	if (IS_ERR(ov6211->reset_gpio)) {
+		dev_err(&client->dev, "cannot get reset GPIO\n");
+		return PTR_ERR(ov6211->reset_gpio);
+	}
+
+	ov6211->avdd = devm_regulator_get_optional(&client->dev, "avdd");
+	if (IS_ERR(ov6211->avdd)) {
+		ret = PTR_ERR(ov6211->avdd);
+		if (ret != -ENODEV) {
+			dev_err_probe(&client->dev, ret,
+				      "Failed to get 'avdd' regulator\n");
+			return ret;
+		}
+
+		ov6211->avdd = NULL;
+	}
+
+	ov6211->dovdd = devm_regulator_get_optional(&client->dev, "dovdd");
+	if (IS_ERR(ov6211->dovdd)) {
+		ret = PTR_ERR(ov6211->dovdd);
+		if (ret != -ENODEV) {
+			dev_err_probe(&client->dev, ret,
+				      "Failed to get 'dovdd' regulator\n");
+			return ret;
+		}
+
+		ov6211->dovdd = NULL;
+	}
+
+	ov6211->dvdd = devm_regulator_get_optional(&client->dev, "dvdd");
+	if (IS_ERR(ov6211->dvdd)) {
+		ret = PTR_ERR(ov6211->dvdd);
+		if (ret != -ENODEV) {
+			dev_err_probe(&client->dev, ret,
+				      "Failed to get 'dvdd' regulator\n");
+			return ret;
+		}
+
+		ov6211->dvdd = NULL;
+	}
+
+	/* The sensor must be powered on to read the CHIP_ID register */
+	ret = ov6211_power_on(&client->dev);
+	if (ret)
+		return ret;
+
+	ret = ov6211_identify_module(ov6211);
+	if (ret) {
+		dev_err(&client->dev, "failed to find sensor: %d\n", ret);
+		goto power_off;
+	}
+
+	mutex_init(&ov6211->mutex);
+	ov6211->cur_mode = &supported_modes[0];
+	ret = ov6211_init_controls(ov6211);
+	if (ret) {
+		dev_err(&client->dev, "failed to init controls: %d\n", ret);
+		goto probe_error_v4l2_ctrl_handler_free;
+	}
+
+	ov6211->sd.internal_ops = &ov6211_internal_ops;
+	ov6211->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	ov6211->sd.entity.ops = &ov6211_subdev_entity_ops;
+	ov6211->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
+	ov6211->pad.flags = MEDIA_PAD_FL_SOURCE;
+	ret = media_entity_pads_init(&ov6211->sd.entity, 1, &ov6211->pad);
+	if (ret) {
+		dev_err(&client->dev, "failed to init entity pads: %d\n", ret);
+		goto probe_error_v4l2_ctrl_handler_free;
+	}
+
+	ret = v4l2_async_register_subdev_sensor(&ov6211->sd);
+	if (ret < 0) {
+		dev_err(&client->dev, "failed to register V4L2 subdev: %d\n",
+			ret);
+		goto probe_error_media_entity_cleanup;
+	}
+
+	/* Enable runtime PM and turn off the device */
+	pm_runtime_set_active(&client->dev);
+	pm_runtime_enable(&client->dev);
+	pm_runtime_idle(&client->dev);
+
+	return 0;
+
+probe_error_media_entity_cleanup:
+	media_entity_cleanup(&ov6211->sd.entity);
+
+probe_error_v4l2_ctrl_handler_free:
+	v4l2_ctrl_handler_free(ov6211->sd.ctrl_handler);
+	mutex_destroy(&ov6211->mutex);
+
+power_off:
+	ov6211_power_off(&client->dev);
+
+	return ret;
+}
+
+static const struct dev_pm_ops ov6211_pm_ops = {
+	SET_RUNTIME_PM_OPS(ov6211_power_off, ov6211_power_on, NULL)
+};
+
+static const struct of_device_id ov6211_of_match[] = {
+	{ .compatible = "ovti,ov6211" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, ov6211_of_match);
+
+static struct i2c_driver ov6211_i2c_driver = {
+	.driver = {
+		.name = "ov6211",
+		.pm = &ov6211_pm_ops,
+		.of_match_table = ov6211_of_match,
+	},
+	.probe = ov6211_probe,
+	.remove = ov6211_remove,
+};
+
+module_i2c_driver(ov6211_i2c_driver);
+
+MODULE_AUTHOR("Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>");
+MODULE_DESCRIPTION("OmniVision OV6211 sensor driver");
+MODULE_LICENSE("GPL");
-- 
2.49.0


