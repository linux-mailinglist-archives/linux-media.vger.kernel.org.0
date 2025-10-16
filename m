Return-Path: <linux-media+bounces-44648-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C4ABE1371
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 04:04:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DA53407667
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 02:04:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84C3B200127;
	Thu, 16 Oct 2025 02:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yWZi9LUj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B21A20F08D
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 02:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760580275; cv=none; b=DumG3jUVrqBr7cmrDukI5ER98d3+azF1ZbJ6EROZEx82ruHi6DdJsMIzNreQlHFfovPNcKruIRLbfRf3JJk3VrBwWwSCEkCn5RAduhX1p3AIEGlOY5Pq1Txr42meOfbIEGUV4l8j5ZimLvfS2cDsw6wPiLKZvhYWFqVFTFMX0cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760580275; c=relaxed/simple;
	bh=dDF1Xm9mn6QiXvTEXo0bxHy/PfJadp4KN0w6jCBxOm4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VTwNMd/ZlT3Vd65M9G69xUp2pHJ0De175feKxkvQijGZgg37am4lFN8S/PNFuZTG4/F2s8YCMj17SEL0Qd1S7sjaYWgBoovXRPmndNroF7vAd7O8meqcQJT04qp1/QE2mMipd1SZw0Bqn8v/MQPIttPtz0v0IUhmaQx6C9KiL4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yWZi9LUj; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-58b002614d2so43844e87.2
        for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 19:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760580271; x=1761185071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P/oeg7yvyQiYHoxI/pWVXbzKbqjR1ieysraiifd7P/A=;
        b=yWZi9LUjJxipx5/pJzTpZOjAssguD/0R5HV4uR+OhIJOpeG8FortvgffNL0vwp9zew
         yEPqhHtLsFlrYNpSaKvK7SJK2JxoLPZeO2RBbN9QZ5+AiohYZkpFLs0x33Povkcu4m0V
         AHQPqYDdLryAVeJi7WeARqavLJx8A7lyhfP8zOdSKbY6lEJOnd0qo+x4uGGO0kQzC3Nb
         KzSs78SrGi8qcPpn2lCVkuOx/E4ZB+rV+4lGBcWA+NiP5nZugUhhQbXUepqHbz6k5esD
         /S9RvUUEg31ozBeIxHlSCEG/zTgxQivKANvZZEEwyTXNEbu1dHIi3wXi+w6lWfLXQ3gV
         yDlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760580271; x=1761185071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P/oeg7yvyQiYHoxI/pWVXbzKbqjR1ieysraiifd7P/A=;
        b=wgkue+WLGBDxNkeLAfKmOwvdyVislOIzktg/PoZHYGNaY1ctVku8dD+0+oKPJDrXz6
         JcurLf+uq3f/ZpLzGDBKNeUTHR37XavFL7D9ftsGShVJN43SwfudWZ1UYcg9hcaV2OVF
         VyVv0eVKiYttO/571Ye1J0wHPHColUiMiV1Zx6AhxMaFHpa1lStlBt3j7PV3keUwGlVa
         2oaYw+/2IsxEKrn9ftJR3P/OUhYb78wnBc2eJqYprjWGvrPkGfvUIt4I8PNXaU2v03WZ
         pYW+D+mZcnSaKILNI5JWWe4pEHpRcbYhRSR8kZ35+2d0fs0RD1arjrbw1i1Vl28mrw0N
         5wvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJOjwlHVwiR9Ii9GTR1+uJUamzbrUa67ru9MD/EFgEsARi4IbmZj8hoONad792rziExmV+IhkAhCXNlg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2mt+t4FvvgVGKRw2F//D35NkpwzA7L6eCkrEVLmzOPX31wDai
	VsmlFXAqwLIw4ZiqMGRfmdC//g1+O3bRGgUQUeQO/HUpmDsEmcjNDU1kAjpGUJxUa9O5Tly6/Pc
	AaqNE
X-Gm-Gg: ASbGncvnzrhKBPsU87vWpXdeEAO4unU6dEtdXQd4eJ4HT83FWP1PUCimXueSEbpfOwj
	Uux+MGqku8Ak2JOK4o6yGCq+MjBdV5H8CZ7Bxp49iJ+gLG2YMHvQn9zmEQnVQnLMvoiXVEuK9F2
	WhGMepnHr0tzwYwEclGgKsFnkWaEb1haf25dyse6yVfY+qnsVuWskyUcp1DwwexUL9WHBxhwkPg
	pSe6yUsBtOe1gJ+K+QwagsqcLNYSzrR+TT3tQcJZX+bL51gqDQ9K1jzX5QYeKS9I/U5eT8Jl59L
	Fjeos3TUa5Fepv4/gPyi41yQTOqmRqtqxZkyXRIJThC7d55EyqIqssEdrsmq3sNoM2Oib7fWFKI
	cGzqYe/tycToE63d7PTV1M5eK2PUx7gGsXN5o2iBMqZhTVAEL6EAlQT10HMkOiCRe3NBmGmnCr8
	dtS1PikG0/zQCN/VPPqXaogj1T66d09TP0x197m1ONZPFnEkZ6DeC2eGEjmA==
X-Google-Smtp-Source: AGHT+IEwdfF1dV/t5JLuSMexpViBavKzRNLSsWX42zrgOeJv04PfCneYXmdcyKQ1H6RvFUuCrM7lTw==
X-Received: by 2002:a05:6512:a8f:b0:56f:de71:1f7c with SMTP id 2adb3069b0e04-5906dae70d7mr5120245e87.7.1760580270200;
        Wed, 15 Oct 2025 19:04:30 -0700 (PDT)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59088563c98sm6703951e87.74.2025.10.15.19.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 19:04:28 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <hansg@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 2/2] media: i2c: add Samsung S5KJN1 image sensor device driver
Date: Thu, 16 Oct 2025 05:04:19 +0300
Message-ID: <20251016020419.2137290-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251016020419.2137290-1-vladimir.zapolskiy@linaro.org>
References: <20251016020419.2137290-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Samsung S5KJN1 is a 50MP image sensor, it produces Bayer GRBG (2x2)
frames in RAW10 output format, the maximum supported output resolution
is 8160x6144 at 10 frames per second rate.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 MAINTAINERS                |    8 +
 drivers/media/i2c/Kconfig  |   10 +
 drivers/media/i2c/Makefile |    1 +
 drivers/media/i2c/s5kjn1.c | 1387 ++++++++++++++++++++++++++++++++++++
 4 files changed, 1406 insertions(+)
 create mode 100644 drivers/media/i2c/s5kjn1.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 46126ce2f968..6334f5c1917e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22863,6 +22863,14 @@ L:	linux-media@vger.kernel.org
 S:	Supported
 F:	drivers/media/i2c/s5k5baf.c
 
+SAMSUNG S5KJN1 CAMERA DRIVER
+M:	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/devicetree/bindings/media/i2c/samsung,s5kjn1.yaml
+F:	drivers/media/i2c/s5kjn1.c
+
 SAMSUNG S5P Security SubSystem (SSS) DRIVER
 M:	Krzysztof Kozlowski <krzk@kernel.org>
 M:	Vladimir Zapolskiy <vz@mleia.com>
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index cdd7ba5da0d5..ec90f58ef698 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -745,6 +745,16 @@ config VIDEO_S5K6A3
 	  This is a V4L2 sensor driver for Samsung S5K6A3 raw
 	  camera sensor.
 
+config VIDEO_S5KJN1
+	tristate "Samsung S5KJN1 sensor support"
+	select V4L2_CCI_I2C
+	help
+	  This is a V4L2 sensor driver for Samsung S5KJN1 50MP raw
+	  camera sensor.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called s5kjn1.
+
 config VIDEO_VD55G1
 	tristate "ST VD55G1 sensor support"
 	select V4L2_CCI_I2C
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index 57cdd8dc96f6..b7f5c3f020e8 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -126,6 +126,7 @@ obj-$(CONFIG_VIDEO_RJ54N1) += rj54n1cb0c.o
 obj-$(CONFIG_VIDEO_S5C73M3) += s5c73m3/
 obj-$(CONFIG_VIDEO_S5K5BAF) += s5k5baf.o
 obj-$(CONFIG_VIDEO_S5K6A3) += s5k6a3.o
+obj-$(CONFIG_VIDEO_S5KJN1) += s5kjn1.o
 obj-$(CONFIG_VIDEO_SAA6588) += saa6588.o
 obj-$(CONFIG_VIDEO_SAA6752HS) += saa6752hs.o
 obj-$(CONFIG_VIDEO_SAA7110) += saa7110.o
diff --git a/drivers/media/i2c/s5kjn1.c b/drivers/media/i2c/s5kjn1.c
new file mode 100644
index 000000000000..aeadd9a4d2d0
--- /dev/null
+++ b/drivers/media/i2c/s5kjn1.c
@@ -0,0 +1,1387 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2025 Linaro Ltd
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
+#include <linux/units.h>
+#include <media/v4l2-cci.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
+
+#define S5KJN1_LINK_FREQ_700MHZ		(700ULL * HZ_PER_MHZ)
+#define S5KJN1_MCLK_FREQ_24MHZ		(24 * HZ_PER_MHZ)
+#define S5KJN1_DATA_LANES		4
+
+/* Register map is similar to MIPI CCS compliant camera sensors */
+#define S5KJN1_REG_CHIP_ID		CCI_REG16(0x0000)
+#define S5KJN1_CHIP_ID			0x38e1
+
+#define S5KJN1_REG_CTRL_MODE		CCI_REG8(0x0100)
+#define S5KJN1_MODE_STREAMING		BIT(0)
+
+#define S5KJN1_REG_ORIENTATION		CCI_REG8(0x0101)
+#define S5KJN1_VFLIP			BIT(1)
+#define S5KJN1_HFLIP			BIT(0)
+
+#define S5KJN1_REG_EXPOSURE		CCI_REG16(0x0202)
+#define S5KJN1_EXPOSURE_MIN		8
+#define S5KJN1_EXPOSURE_STEP		1
+
+#define S5KJN1_REG_AGAIN		CCI_REG16(0x0204)
+#define S5KJN1_AGAIN_MIN		1
+#define S5KJN1_AGAIN_MAX		64
+#define S5KJN1_AGAIN_STEP		1
+#define S5KJN1_AGAIN_DEFAULT		6
+#define S5KJN1_AGAIN_SHIFT		5
+
+#define S5KJN1_REG_VTS			CCI_REG16(0x0340)
+#define S5KJN1_VTS_MAX			0xffff
+
+#define S5KJN1_REG_HTS			CCI_REG16(0x0342)
+#define S5KJN1_REG_X_ADDR_START		CCI_REG16(0x0344)
+#define S5KJN1_REG_Y_ADDR_START		CCI_REG16(0x0346)
+#define S5KJN1_REG_X_ADDR_END		CCI_REG16(0x0348)
+#define S5KJN1_REG_Y_ADDR_END		CCI_REG16(0x034a)
+#define S5KJN1_REG_X_OUTPUT_SIZE	CCI_REG16(0x034c)
+#define S5KJN1_REG_Y_OUTPUT_SIZE	CCI_REG16(0x034e)
+
+#define S5KJN1_REG_TEST_PATTERN		CCI_REG16(0x0600)
+
+#define to_s5kjn1(_sd)			container_of(_sd, struct s5kjn1, sd)
+
+static const s64 s5kjn1_link_freq_menu[] = {
+	S5KJN1_LINK_FREQ_700MHZ,
+};
+
+/* List of supported formats to cover horizontal and vertical flip controls */
+static const u32 s5kjn1_mbus_formats[] = {
+	MEDIA_BUS_FMT_SGRBG10_1X10,	MEDIA_BUS_FMT_SRGGB10_1X10,
+	MEDIA_BUS_FMT_SBGGR10_1X10,	MEDIA_BUS_FMT_SGBRG10_1X10,
+};
+
+struct s5kjn1_reg_list {
+	const struct cci_reg_sequence *regs;
+	unsigned int num_regs;
+};
+
+struct s5kjn1_mode {
+	u32 width;			/* Frame width in pixels */
+	u32 height;			/* Frame height in pixels */
+	u32 hts;			/* Horizontal timing size */
+	u32 vts;			/* Default vertical timing size */
+	u32 exposure;			/* Default exposure value */
+	u32 exposure_margin;		/* Exposure margin */
+
+	const struct s5kjn1_reg_list reg_list;	/* Sensor register setting */
+};
+
+static const char * const s5kjn1_test_pattern_menu[] = {
+	"Disabled",
+	"Solid color",
+	"Color bars",
+	"Fade to grey color bars",
+	"PN9",
+};
+
+static const char * const s5kjn1_supply_names[] = {
+	"afvdd",	/* Autofocus power */
+	"avdd",		/* Analog power */
+	"dovdd",	/* Digital I/O power */
+	"dvdd",		/* Digital core power */
+};
+
+#define S5KJN1_NUM_SUPPLIES	ARRAY_SIZE(s5kjn1_supply_names)
+
+struct s5kjn1 {
+	struct device *dev;
+	struct regmap *regmap;
+	struct clk *mclk;
+	struct gpio_desc *reset_gpio;
+	struct regulator_bulk_data supplies[S5KJN1_NUM_SUPPLIES];
+
+	struct v4l2_subdev sd;
+	struct media_pad pad;
+
+	struct v4l2_ctrl_handler ctrl_handler;
+	struct v4l2_ctrl *link_freq;
+	struct v4l2_ctrl *pixel_rate;
+	struct v4l2_ctrl *hblank;
+	struct v4l2_ctrl *vblank;
+	struct v4l2_ctrl *exposure;
+	struct v4l2_ctrl *vflip;
+	struct v4l2_ctrl *hflip;
+
+	const struct s5kjn1_mode *mode;
+};
+
+static const struct cci_reg_sequence init_array_setting[] = {
+	{ CCI_REG16(0x6028), 0x2400 },
+	{ CCI_REG16(0x602a), 0x1354 },
+	{ CCI_REG16(0x6f12), 0x0100 },
+	{ CCI_REG16(0x6f12), 0x7017 },
+	{ CCI_REG16(0x602a), 0x13b2 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x602a), 0x1236 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x602a), 0x1a0a },
+	{ CCI_REG16(0x6f12), 0x4c0a },
+	{ CCI_REG16(0x602a), 0x2210 },
+	{ CCI_REG16(0x6f12), 0x3401 },
+	{ CCI_REG16(0x602a), 0x2176 },
+	{ CCI_REG16(0x6f12), 0x6400 },
+	{ CCI_REG16(0x602a), 0x222e },
+	{ CCI_REG16(0x6f12), 0x0001 },
+	{ CCI_REG16(0x602a), 0x06b6 },
+	{ CCI_REG16(0x6f12), 0x0a00 },
+	{ CCI_REG16(0x602a), 0x06bc },
+	{ CCI_REG16(0x6f12), 0x1001 },
+	{ CCI_REG16(0x602a), 0x2140 },
+	{ CCI_REG16(0x6f12), 0x0101 },
+	{ CCI_REG16(0x602a), 0x1a0e },
+	{ CCI_REG16(0x6f12), 0x9600 },
+	{ CCI_REG16(0x6028), 0x4000 },
+	{ CCI_REG16(0xf44e), 0x0011 },
+	{ CCI_REG16(0xf44c), 0x0b0b },
+	{ CCI_REG16(0xf44a), 0x0006 },
+	{ CCI_REG16(0x0118), 0x0002 },
+	{ CCI_REG16(0x011a), 0x0001 },
+};
+
+static const struct cci_reg_sequence s5kjn1_4080x3072_30fps_mode[] = {
+	{ CCI_REG16(0x6028), 0x2400 },
+	{ CCI_REG16(0x602a), 0x1a28 },
+	{ CCI_REG16(0x6f12), 0x4c00 },
+	{ CCI_REG16(0x602a), 0x065a },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x602a), 0x139e },
+	{ CCI_REG16(0x6f12), 0x0100 },
+	{ CCI_REG16(0x602a), 0x139c },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x602a), 0x13a0 },
+	{ CCI_REG16(0x6f12), 0x0a00 },
+	{ CCI_REG16(0x6f12), 0x0120 },
+	{ CCI_REG16(0x602a), 0x2072 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x602a), 0x1a64 },
+	{ CCI_REG16(0x6f12), 0x0301 },
+	{ CCI_REG16(0x6f12), 0xff00 },
+	{ CCI_REG16(0x602a), 0x19e6 },
+	{ CCI_REG16(0x6f12), 0x0200 },
+	{ CCI_REG16(0x602a), 0x1a30 },
+	{ CCI_REG16(0x6f12), 0x3401 },
+	{ CCI_REG16(0x602a), 0x19fc },
+	{ CCI_REG16(0x6f12), 0x0b00 },
+	{ CCI_REG16(0x602a), 0x19f4 },
+	{ CCI_REG16(0x6f12), 0x0606 },
+	{ CCI_REG16(0x602a), 0x19f8 },
+	{ CCI_REG16(0x6f12), 0x1010 },
+	{ CCI_REG16(0x602a), 0x1b26 },
+	{ CCI_REG16(0x6f12), 0x6f80 },
+	{ CCI_REG16(0x6f12), 0xa060 },
+	{ CCI_REG16(0x602a), 0x1a3c },
+	{ CCI_REG16(0x6f12), 0x6207 },
+	{ CCI_REG16(0x602a), 0x1a48 },
+	{ CCI_REG16(0x6f12), 0x6207 },
+	{ CCI_REG16(0x602a), 0x1444 },
+	{ CCI_REG16(0x6f12), 0x2000 },
+	{ CCI_REG16(0x6f12), 0x2000 },
+	{ CCI_REG16(0x602a), 0x144c },
+	{ CCI_REG16(0x6f12), 0x3f00 },
+	{ CCI_REG16(0x6f12), 0x3f00 },
+	{ CCI_REG16(0x602a), 0x7f6c },
+	{ CCI_REG16(0x6f12), 0x0100 },
+	{ CCI_REG16(0x6f12), 0x2f00 },
+	{ CCI_REG16(0x6f12), 0xfa00 },
+	{ CCI_REG16(0x6f12), 0x2400 },
+	{ CCI_REG16(0x6f12), 0xe500 },
+	{ CCI_REG16(0x602a), 0x0650 },
+	{ CCI_REG16(0x6f12), 0x0600 },
+	{ CCI_REG16(0x602a), 0x0654 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x602a), 0x1a46 },
+	{ CCI_REG16(0x6f12), 0x8a00 },
+	{ CCI_REG16(0x602a), 0x1a52 },
+	{ CCI_REG16(0x6f12), 0xbf00 },
+	{ CCI_REG16(0x602a), 0x0674 },
+	{ CCI_REG16(0x6f12), 0x0500 },
+	{ CCI_REG16(0x6f12), 0x0500 },
+	{ CCI_REG16(0x6f12), 0x0500 },
+	{ CCI_REG16(0x6f12), 0x0500 },
+	{ CCI_REG16(0x602a), 0x0668 },
+	{ CCI_REG16(0x6f12), 0x0800 },
+	{ CCI_REG16(0x6f12), 0x0800 },
+	{ CCI_REG16(0x6f12), 0x0800 },
+	{ CCI_REG16(0x6f12), 0x0800 },
+	{ CCI_REG16(0x602a), 0x0684 },
+	{ CCI_REG16(0x6f12), 0x4001 },
+	{ CCI_REG16(0x602a), 0x0688 },
+	{ CCI_REG16(0x6f12), 0x4001 },
+	{ CCI_REG16(0x602a), 0x147c },
+	{ CCI_REG16(0x6f12), 0x1000 },
+	{ CCI_REG16(0x602a), 0x1480 },
+	{ CCI_REG16(0x6f12), 0x1000 },
+	{ CCI_REG16(0x602a), 0x19f6 },
+	{ CCI_REG16(0x6f12), 0x0904 },
+	{ CCI_REG16(0x602a), 0x0812 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x602a), 0x1a02 },
+	{ CCI_REG16(0x6f12), 0x1800 },
+	{ CCI_REG16(0x602a), 0x2148 },
+	{ CCI_REG16(0x6f12), 0x0100 },
+	{ CCI_REG16(0x602a), 0x2042 },
+	{ CCI_REG16(0x6f12), 0x1a00 },
+	{ CCI_REG16(0x602a), 0x0874 },
+	{ CCI_REG16(0x6f12), 0x0100 },
+	{ CCI_REG16(0x602a), 0x09c0 },
+	{ CCI_REG16(0x6f12), 0x2008 },
+	{ CCI_REG16(0x602a), 0x09c4 },
+	{ CCI_REG16(0x6f12), 0x2000 },
+	{ CCI_REG16(0x602a), 0x19fe },
+	{ CCI_REG16(0x6f12), 0x0e1c },
+	{ CCI_REG16(0x602a), 0x4d92 },
+	{ CCI_REG16(0x6f12), 0x0100 },
+	{ CCI_REG16(0x602a), 0x84c8 },
+	{ CCI_REG16(0x6f12), 0x0100 },
+	{ CCI_REG16(0x602a), 0x4d94 },
+	{ CCI_REG16(0x6f12), 0x0005 },
+	{ CCI_REG16(0x6f12), 0x000a },
+	{ CCI_REG16(0x6f12), 0x0010 },
+	{ CCI_REG16(0x6f12), 0x0810 },
+	{ CCI_REG16(0x6f12), 0x000a },
+	{ CCI_REG16(0x6f12), 0x0040 },
+	{ CCI_REG16(0x6f12), 0x0810 },
+	{ CCI_REG16(0x6f12), 0x0810 },
+	{ CCI_REG16(0x6f12), 0x8002 },
+	{ CCI_REG16(0x6f12), 0xfd03 },
+	{ CCI_REG16(0x6f12), 0x0010 },
+	{ CCI_REG16(0x6f12), 0x1510 },
+	{ CCI_REG16(0x602a), 0x3570 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x602a), 0x3574 },
+	{ CCI_REG16(0x6f12), 0x1201 },
+	{ CCI_REG16(0x602a), 0x21e4 },
+	{ CCI_REG16(0x6f12), 0x0400 },
+	{ CCI_REG16(0x602a), 0x21ec },
+	{ CCI_REG16(0x6f12), 0x1f04 },
+	{ CCI_REG16(0x602a), 0x2080 },
+	{ CCI_REG16(0x6f12), 0x0101 },
+	{ CCI_REG16(0x6f12), 0xff00 },
+	{ CCI_REG16(0x6f12), 0x7f01 },
+	{ CCI_REG16(0x6f12), 0x0001 },
+	{ CCI_REG16(0x6f12), 0x8001 },
+	{ CCI_REG16(0x6f12), 0xd244 },
+	{ CCI_REG16(0x6f12), 0xd244 },
+	{ CCI_REG16(0x6f12), 0x14f4 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x602a), 0x20ba },
+	{ CCI_REG16(0x6f12), 0x141c },
+	{ CCI_REG16(0x6f12), 0x111c },
+	{ CCI_REG16(0x6f12), 0x54f4 },
+	{ CCI_REG16(0x602a), 0x120e },
+	{ CCI_REG16(0x6f12), 0x1000 },
+	{ CCI_REG16(0x602a), 0x212e },
+	{ CCI_REG16(0x6f12), 0x0200 },
+	{ CCI_REG16(0x602a), 0x13ae },
+	{ CCI_REG16(0x6f12), 0x0101 },
+	{ CCI_REG16(0x602a), 0x0718 },
+	{ CCI_REG16(0x6f12), 0x0001 },
+	{ CCI_REG16(0x602a), 0x0710 },
+	{ CCI_REG16(0x6f12), 0x0002 },
+	{ CCI_REG16(0x6f12), 0x0804 },
+	{ CCI_REG16(0x6f12), 0x0100 },
+	{ CCI_REG16(0x602a), 0x1b5c },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x602a), 0x0786 },
+	{ CCI_REG16(0x6f12), 0x7701 },
+	{ CCI_REG16(0x602a), 0x2022 },
+	{ CCI_REG16(0x6f12), 0x0500 },
+	{ CCI_REG16(0x6f12), 0x0500 },
+	{ CCI_REG16(0x602a), 0x1360 },
+	{ CCI_REG16(0x6f12), 0x0100 },
+	{ CCI_REG16(0x602a), 0x1376 },
+	{ CCI_REG16(0x6f12), 0x0100 },
+	{ CCI_REG16(0x6f12), 0x6038 },
+	{ CCI_REG16(0x6f12), 0x7038 },
+	{ CCI_REG16(0x6f12), 0x8038 },
+	{ CCI_REG16(0x602a), 0x1386 },
+	{ CCI_REG16(0x6f12), 0x0b00 },
+	{ CCI_REG16(0x602a), 0x06fa },
+	{ CCI_REG16(0x6f12), 0x1000 },
+	{ CCI_REG16(0x602a), 0x4a94 },
+	{ CCI_REG16(0x6f12), 0x0900 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6f12), 0x0300 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6f12), 0x0300 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6f12), 0x0900 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x602a), 0x0a76 },
+	{ CCI_REG16(0x6f12), 0x1000 },
+	{ CCI_REG16(0x602a), 0x0aee },
+	{ CCI_REG16(0x6f12), 0x1000 },
+	{ CCI_REG16(0x602a), 0x0b66 },
+	{ CCI_REG16(0x6f12), 0x1000 },
+	{ CCI_REG16(0x602a), 0x0bde },
+	{ CCI_REG16(0x6f12), 0x1000 },
+	{ CCI_REG16(0x602a), 0x0be8 },
+	{ CCI_REG16(0x6f12), 0x3000 },
+	{ CCI_REG16(0x6f12), 0x3000 },
+	{ CCI_REG16(0x602a), 0x0c56 },
+	{ CCI_REG16(0x6f12), 0x1000 },
+	{ CCI_REG16(0x602a), 0x0c60 },
+	{ CCI_REG16(0x6f12), 0x3000 },
+	{ CCI_REG16(0x6f12), 0x3000 },
+	{ CCI_REG16(0x602a), 0x0cb6 },
+	{ CCI_REG16(0x6f12), 0x0100 },
+	{ CCI_REG16(0x602a), 0x0cf2 },
+	{ CCI_REG16(0x6f12), 0x0001 },
+	{ CCI_REG16(0x602a), 0x0cf0 },
+	{ CCI_REG16(0x6f12), 0x0101 },
+	{ CCI_REG16(0x602a), 0x11b8 },
+	{ CCI_REG16(0x6f12), 0x0100 },
+	{ CCI_REG16(0x602a), 0x11f6 },
+	{ CCI_REG16(0x6f12), 0x0020 },
+	{ CCI_REG16(0x602a), 0x4a74 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6f12), 0xd8ff },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6f12), 0xd8ff },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x602a), 0x218e },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x602a), 0x2268 },
+	{ CCI_REG16(0x6f12), 0xf279 },
+	{ CCI_REG16(0x602a), 0x5006 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x602a), 0x500e },
+	{ CCI_REG16(0x6f12), 0x0100 },
+	{ CCI_REG16(0x602a), 0x4e70 },
+	{ CCI_REG16(0x6f12), 0x2062 },
+	{ CCI_REG16(0x6f12), 0x5501 },
+	{ CCI_REG16(0x602a), 0x06dc },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6028), 0x4000 },
+	{ CCI_REG16(0xf46a), 0xae80 },
+	{ S5KJN1_REG_X_ADDR_START,  0x0000 },
+	{ S5KJN1_REG_Y_ADDR_START,  0x0000 },
+	{ S5KJN1_REG_X_ADDR_END,    0x1fff },
+	{ S5KJN1_REG_Y_ADDR_END,    0x181f },
+	{ S5KJN1_REG_X_OUTPUT_SIZE, 0x0ff0 },
+	{ S5KJN1_REG_Y_OUTPUT_SIZE, 0x0c00 },
+	{ CCI_REG16(0x0350), 0x0008 },
+	{ CCI_REG16(0x0352), 0x0008 },
+	{ CCI_REG16(0x0900), 0x0122 },
+	{ CCI_REG16(0x0380), 0x0002 },
+	{ CCI_REG16(0x0382), 0x0002 },
+	{ CCI_REG16(0x0384), 0x0002 },
+	{ CCI_REG16(0x0386), 0x0002 },
+	{ CCI_REG16(0x0110), 0x1002 },
+	{ CCI_REG16(0x0114), 0x0301 },
+	{ CCI_REG16(0x0116), 0x3000 },
+
+	/* Clock settings */
+	{ CCI_REG16(0x0136), 0x1800 },
+	{ CCI_REG16(0x013e), 0x0000 },
+	{ CCI_REG16(0x0300), 0x0006 },
+	{ CCI_REG16(0x0302), 0x0001 },
+	{ CCI_REG16(0x0304), 0x0004 },
+	{ CCI_REG16(0x0306), 0x008c },
+	{ CCI_REG16(0x0308), 0x0008 },
+	{ CCI_REG16(0x030a), 0x0001 },
+	{ CCI_REG16(0x030c), 0x0000 },
+	{ CCI_REG16(0x030e), 0x0004 },
+	{ CCI_REG16(0x0310), 0x0092 },
+	{ CCI_REG16(0x0312), 0x0000 },
+
+	{ CCI_REG16(0x080e), 0x0000 },
+	{ S5KJN1_REG_VTS,    0x10c0 },
+	{ S5KJN1_REG_HTS,    0x1100 },
+	{ CCI_REG16(0x0702), 0x0000 },
+	{ S5KJN1_REG_EXPOSURE, 0x0100 },
+	{ CCI_REG16(0x0200), 0x0100 },
+	{ CCI_REG16(0x0d00), 0x0101 },
+	{ CCI_REG16(0x0d02), 0x0101 },
+	{ CCI_REG16(0x0d04), 0x0102 },
+	{ CCI_REG16(0x6226), 0x0000 },
+	{ CCI_REG16(0x0816), 0x1c00 },
+};
+
+static const struct cci_reg_sequence s5kjn1_8160x6144_10fps_mode[] = {
+	{ CCI_REG16(0x6028), 0x2400 },
+	{ CCI_REG16(0x602a), 0x1a28 },
+	{ CCI_REG16(0x6f12), 0x4c00 },
+	{ CCI_REG16(0x602a), 0x065a },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x602a), 0x139e },
+	{ CCI_REG16(0x6f12), 0x0400 },
+	{ CCI_REG16(0x602a), 0x139c },
+	{ CCI_REG16(0x6f12), 0x0100 },
+	{ CCI_REG16(0x602a), 0x13a0 },
+	{ CCI_REG16(0x6f12), 0x0500 },
+	{ CCI_REG16(0x6f12), 0x0120 },
+	{ CCI_REG16(0x602a), 0x2072 },
+	{ CCI_REG16(0x6f12), 0x0101 },
+	{ CCI_REG16(0x602a), 0x1a64 },
+	{ CCI_REG16(0x6f12), 0x0001 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x602a), 0x19e6 },
+	{ CCI_REG16(0x6f12), 0x0200 },
+	{ CCI_REG16(0x602a), 0x1a30 },
+	{ CCI_REG16(0x6f12), 0x3403 },
+	{ CCI_REG16(0x602a), 0x19fc },
+	{ CCI_REG16(0x6f12), 0x0700 },
+	{ CCI_REG16(0x602a), 0x19f4 },
+	{ CCI_REG16(0x6f12), 0x0707 },
+	{ CCI_REG16(0x602a), 0x19f8 },
+	{ CCI_REG16(0x6f12), 0x0b0b },
+	{ CCI_REG16(0x602a), 0x1b26 },
+	{ CCI_REG16(0x6f12), 0x6f80 },
+	{ CCI_REG16(0x6f12), 0xa060 },
+	{ CCI_REG16(0x602a), 0x1a3c },
+	{ CCI_REG16(0x6f12), 0x8207 },
+	{ CCI_REG16(0x602a), 0x1a48 },
+	{ CCI_REG16(0x6f12), 0x8207 },
+	{ CCI_REG16(0x602a), 0x1444 },
+	{ CCI_REG16(0x6f12), 0x2000 },
+	{ CCI_REG16(0x6f12), 0x2000 },
+	{ CCI_REG16(0x602a), 0x144c },
+	{ CCI_REG16(0x6f12), 0x3f00 },
+	{ CCI_REG16(0x6f12), 0x3f00 },
+	{ CCI_REG16(0x602a), 0x7f6c },
+	{ CCI_REG16(0x6f12), 0x0100 },
+	{ CCI_REG16(0x6f12), 0x2f00 },
+	{ CCI_REG16(0x6f12), 0xfa00 },
+	{ CCI_REG16(0x6f12), 0x2400 },
+	{ CCI_REG16(0x6f12), 0xe500 },
+	{ CCI_REG16(0x602a), 0x0650 },
+	{ CCI_REG16(0x6f12), 0x0600 },
+	{ CCI_REG16(0x602a), 0x0654 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x602a), 0x1a46 },
+	{ CCI_REG16(0x6f12), 0x8500 },
+	{ CCI_REG16(0x602a), 0x1a52 },
+	{ CCI_REG16(0x6f12), 0x9800 },
+	{ CCI_REG16(0x602a), 0x0674 },
+	{ CCI_REG16(0x6f12), 0x0500 },
+	{ CCI_REG16(0x6f12), 0x0500 },
+	{ CCI_REG16(0x6f12), 0x0500 },
+	{ CCI_REG16(0x6f12), 0x0500 },
+	{ CCI_REG16(0x602a), 0x0668 },
+	{ CCI_REG16(0x6f12), 0x0800 },
+	{ CCI_REG16(0x6f12), 0x0800 },
+	{ CCI_REG16(0x6f12), 0x0800 },
+	{ CCI_REG16(0x6f12), 0x0800 },
+	{ CCI_REG16(0x602a), 0x0684 },
+	{ CCI_REG16(0x6f12), 0x4001 },
+	{ CCI_REG16(0x602a), 0x0688 },
+	{ CCI_REG16(0x6f12), 0x4001 },
+	{ CCI_REG16(0x602a), 0x147c },
+	{ CCI_REG16(0x6f12), 0x0400 },
+	{ CCI_REG16(0x602a), 0x1480 },
+	{ CCI_REG16(0x6f12), 0x0400 },
+	{ CCI_REG16(0x602a), 0x19f6 },
+	{ CCI_REG16(0x6f12), 0x0404 },
+	{ CCI_REG16(0x602a), 0x0812 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x602a), 0x1a02 },
+	{ CCI_REG16(0x6f12), 0x1800 },
+	{ CCI_REG16(0x602a), 0x2148 },
+	{ CCI_REG16(0x6f12), 0x0100 },
+	{ CCI_REG16(0x602a), 0x2042 },
+	{ CCI_REG16(0x6f12), 0x1a00 },
+	{ CCI_REG16(0x602a), 0x0874 },
+	{ CCI_REG16(0x6f12), 0x0106 },
+	{ CCI_REG16(0x602a), 0x09c0 },
+	{ CCI_REG16(0x6f12), 0x4000 },
+	{ CCI_REG16(0x602a), 0x09c4 },
+	{ CCI_REG16(0x6f12), 0x4000 },
+	{ CCI_REG16(0x602a), 0x19fe },
+	{ CCI_REG16(0x6f12), 0x0c1c },
+	{ CCI_REG16(0x602a), 0x4d92 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x602a), 0x84c8 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x602a), 0x4d94 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x602a), 0x3570 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x602a), 0x3574 },
+	{ CCI_REG16(0x6f12), 0x7306 },
+	{ CCI_REG16(0x602a), 0x21e4 },
+	{ CCI_REG16(0x6f12), 0x0400 },
+	{ CCI_REG16(0x602a), 0x21ec },
+	{ CCI_REG16(0x6f12), 0x6902 },
+	{ CCI_REG16(0x602a), 0x2080 },
+	{ CCI_REG16(0x6f12), 0x0100 },
+	{ CCI_REG16(0x6f12), 0xff00 },
+	{ CCI_REG16(0x6f12), 0x0002 },
+	{ CCI_REG16(0x6f12), 0x0001 },
+	{ CCI_REG16(0x6f12), 0x0002 },
+	{ CCI_REG16(0x6f12), 0xd244 },
+	{ CCI_REG16(0x6f12), 0xd244 },
+	{ CCI_REG16(0x6f12), 0x14f4 },
+	{ CCI_REG16(0x6f12), 0x101c },
+	{ CCI_REG16(0x6f12), 0x0d1c },
+	{ CCI_REG16(0x6f12), 0x54f4 },
+	{ CCI_REG16(0x602a), 0x20ba },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x602a), 0x120e },
+	{ CCI_REG16(0x6f12), 0x1000 },
+	{ CCI_REG16(0x602a), 0x212e },
+	{ CCI_REG16(0x6f12), 0x0200 },
+	{ CCI_REG16(0x602a), 0x13ae },
+	{ CCI_REG16(0x6f12), 0x0100 },
+	{ CCI_REG16(0x602a), 0x0718 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x602a), 0x0710 },
+	{ CCI_REG16(0x6f12), 0x0010 },
+	{ CCI_REG16(0x6f12), 0x0201 },
+	{ CCI_REG16(0x6f12), 0x0800 },
+	{ CCI_REG16(0x602a), 0x1b5c },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x602a), 0x0786 },
+	{ CCI_REG16(0x6f12), 0x1401 },
+	{ CCI_REG16(0x602a), 0x2022 },
+	{ CCI_REG16(0x6f12), 0x0500 },
+	{ CCI_REG16(0x6f12), 0x0500 },
+	{ CCI_REG16(0x602a), 0x1360 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x602a), 0x1376 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6f12), 0x6038 },
+	{ CCI_REG16(0x6f12), 0x7038 },
+	{ CCI_REG16(0x6f12), 0x8038 },
+	{ CCI_REG16(0x602a), 0x1386 },
+	{ CCI_REG16(0x6f12), 0x0b00 },
+	{ CCI_REG16(0x602a), 0x06fa },
+	{ CCI_REG16(0x6f12), 0x1000 },
+	{ CCI_REG16(0x602a), 0x4a94 },
+	{ CCI_REG16(0x6f12), 0x0400 },
+	{ CCI_REG16(0x6f12), 0x0400 },
+	{ CCI_REG16(0x6f12), 0x0400 },
+	{ CCI_REG16(0x6f12), 0x0400 },
+	{ CCI_REG16(0x6f12), 0x0800 },
+	{ CCI_REG16(0x6f12), 0x0800 },
+	{ CCI_REG16(0x6f12), 0x0800 },
+	{ CCI_REG16(0x6f12), 0x0800 },
+	{ CCI_REG16(0x6f12), 0x0400 },
+	{ CCI_REG16(0x6f12), 0x0400 },
+	{ CCI_REG16(0x6f12), 0x0400 },
+	{ CCI_REG16(0x6f12), 0x0400 },
+	{ CCI_REG16(0x6f12), 0x0800 },
+	{ CCI_REG16(0x6f12), 0x0800 },
+	{ CCI_REG16(0x6f12), 0x0800 },
+	{ CCI_REG16(0x6f12), 0x0800 },
+	{ CCI_REG16(0x602a), 0x0a76 },
+	{ CCI_REG16(0x6f12), 0x1000 },
+	{ CCI_REG16(0x602a), 0x0aee },
+	{ CCI_REG16(0x6f12), 0x1000 },
+	{ CCI_REG16(0x602a), 0x0b66 },
+	{ CCI_REG16(0x6f12), 0x1000 },
+	{ CCI_REG16(0x602a), 0x0bde },
+	{ CCI_REG16(0x6f12), 0x1000 },
+	{ CCI_REG16(0x602a), 0x0be8 },
+	{ CCI_REG16(0x6f12), 0x5000 },
+	{ CCI_REG16(0x6f12), 0x5000 },
+	{ CCI_REG16(0x602a), 0x0c56 },
+	{ CCI_REG16(0x6f12), 0x1000 },
+	{ CCI_REG16(0x602a), 0x0c60 },
+	{ CCI_REG16(0x6f12), 0x5000 },
+	{ CCI_REG16(0x6f12), 0x5000 },
+	{ CCI_REG16(0x602a), 0x0cb6 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x602a), 0x0cf2 },
+	{ CCI_REG16(0x6f12), 0x0001 },
+	{ CCI_REG16(0x602a), 0x0cf0 },
+	{ CCI_REG16(0x6f12), 0x0101 },
+	{ CCI_REG16(0x602a), 0x11b8 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x602a), 0x11f6 },
+	{ CCI_REG16(0x6f12), 0x0010 },
+	{ CCI_REG16(0x602a), 0x4a74 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x602a), 0x218e },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x602a), 0x2268 },
+	{ CCI_REG16(0x6f12), 0xf279 },
+	{ CCI_REG16(0x602a), 0x5006 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x602a), 0x500e },
+	{ CCI_REG16(0x6f12), 0x0100 },
+	{ CCI_REG16(0x602a), 0x4e70 },
+	{ CCI_REG16(0x6f12), 0x2062 },
+	{ CCI_REG16(0x6f12), 0x5501 },
+	{ CCI_REG16(0x602a), 0x06dc },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6028), 0x4000 },
+	{ CCI_REG16(0xf46a), 0xae80 },
+	{ S5KJN1_REG_X_ADDR_START,  0x0000 },
+	{ S5KJN1_REG_Y_ADDR_START,  0x0000 },
+	{ S5KJN1_REG_X_ADDR_END,    0x1fff },
+	{ S5KJN1_REG_Y_ADDR_END,    0x181f },
+	{ S5KJN1_REG_X_OUTPUT_SIZE, 0x1fe0 },
+	{ S5KJN1_REG_Y_OUTPUT_SIZE, 0x1800 },
+	{ CCI_REG16(0x0350), 0x0010 },
+	{ CCI_REG16(0x0352), 0x0010 },
+	{ CCI_REG16(0x0900), 0x0111 },
+	{ CCI_REG16(0x0380), 0x0001 },
+	{ CCI_REG16(0x0382), 0x0001 },
+	{ CCI_REG16(0x0384), 0x0001 },
+	{ CCI_REG16(0x0386), 0x0001 },
+	{ CCI_REG16(0x0110), 0x1002 },
+	{ CCI_REG16(0x0114), 0x0300 },
+	{ CCI_REG16(0x0116), 0x3000 },
+
+	/* Clock settings */
+	{ CCI_REG16(0x0136), 0x1800 },
+	{ CCI_REG16(0x013e), 0x0000 },
+	{ CCI_REG16(0x0300), 0x0006 },
+	{ CCI_REG16(0x0302), 0x0001 },
+	{ CCI_REG16(0x0304), 0x0004 },
+	{ CCI_REG16(0x0306), 0x008c },
+	{ CCI_REG16(0x0308), 0x0008 },
+	{ CCI_REG16(0x030a), 0x0001 },
+	{ CCI_REG16(0x030c), 0x0000 },
+	{ CCI_REG16(0x030e), 0x0004 },
+	{ CCI_REG16(0x0310), 0x0074 },
+	{ CCI_REG16(0x0312), 0x0000 },
+
+	{ CCI_REG16(0x080e), 0x0000 },
+	{ S5KJN1_REG_VTS,    0x1900 },
+	{ S5KJN1_REG_HTS,    0x21f0 },
+	{ CCI_REG16(0x0702), 0x0000 },
+	{ S5KJN1_REG_EXPOSURE, 0x0100 },
+	{ CCI_REG16(0x0200), 0x0100 },
+	{ CCI_REG16(0x0d00), 0x0100 },
+	{ CCI_REG16(0x0d02), 0x0001 },
+	{ CCI_REG16(0x0d04), 0x0002 },
+	{ CCI_REG16(0x6226), 0x0000 },
+};
+
+static const struct s5kjn1_mode s5kjn1_supported_modes[] = {
+	{
+		.width = 4080,
+		.height = 3072,
+		.hts = 4352,
+		.vts = 4288,
+		.exposure = 3840,
+		.exposure_margin = 22,
+		.reg_list = {
+			.regs = s5kjn1_4080x3072_30fps_mode,
+			.num_regs = ARRAY_SIZE(s5kjn1_4080x3072_30fps_mode),
+		},
+	},
+	{
+		.width = 8160,
+		.height = 6144,
+		.hts = 8688,
+		.vts = 6400,
+		.exposure = 6144,
+		.exposure_margin = 44,
+		.reg_list = {
+			.regs = s5kjn1_8160x6144_10fps_mode,
+			.num_regs = ARRAY_SIZE(s5kjn1_8160x6144_10fps_mode),
+		},
+	},
+};
+
+static int s5kjn1_set_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct s5kjn1 *s5kjn1 = container_of(ctrl->handler, struct s5kjn1,
+					     ctrl_handler);
+	const struct s5kjn1_mode *mode = s5kjn1->mode;
+	s64 exposure_max;
+	int ret;
+
+	/* Propagate change of current control to all related controls */
+	switch (ctrl->id) {
+	case V4L2_CID_VBLANK:
+		/* Update max exposure while meeting expected vblanking */
+		exposure_max = mode->height + ctrl->val - mode->exposure_margin;
+		__v4l2_ctrl_modify_range(s5kjn1->exposure,
+					 s5kjn1->exposure->minimum,
+					 exposure_max,
+					 s5kjn1->exposure->step,
+					 s5kjn1->exposure->default_value);
+		break;
+	}
+
+	/* V4L2 controls are applied, when sensor is powered up for streaming */
+	if (!pm_runtime_get_if_active(s5kjn1->dev))
+		return 0;
+
+	switch (ctrl->id) {
+	case V4L2_CID_ANALOGUE_GAIN:
+		ret = cci_write(s5kjn1->regmap, S5KJN1_REG_AGAIN,
+				ctrl->val << S5KJN1_AGAIN_SHIFT, NULL);
+		break;
+	case V4L2_CID_EXPOSURE:
+		ret = cci_write(s5kjn1->regmap, S5KJN1_REG_EXPOSURE,
+				ctrl->val, NULL);
+		break;
+	case V4L2_CID_VBLANK:
+		ret = cci_write(s5kjn1->regmap, S5KJN1_REG_VTS,
+				ctrl->val + mode->height, NULL);
+		break;
+	case V4L2_CID_VFLIP:
+	case V4L2_CID_HFLIP:
+		ret = cci_write(s5kjn1->regmap, S5KJN1_REG_ORIENTATION,
+				(s5kjn1->vflip->val ? S5KJN1_VFLIP : 0) |
+				(s5kjn1->hflip->val ? S5KJN1_HFLIP : 0), NULL);
+		break;
+	case V4L2_CID_TEST_PATTERN:
+		ret = cci_write(s5kjn1->regmap, S5KJN1_REG_TEST_PATTERN,
+				ctrl->val, NULL);
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	pm_runtime_put(s5kjn1->dev);
+
+	return ret;
+}
+
+static const struct v4l2_ctrl_ops s5kjn1_ctrl_ops = {
+	.s_ctrl = s5kjn1_set_ctrl,
+};
+
+static u64 s5kjn1_mode_to_pixel_rate(const struct s5kjn1_mode *mode)
+{
+	u64 pixel_rate;
+
+	pixel_rate = s5kjn1_link_freq_menu[0] * 2 * S5KJN1_DATA_LANES;
+	do_div(pixel_rate, 10);			/* bits per pixel */
+
+	return pixel_rate;
+}
+
+static int s5kjn1_init_controls(struct s5kjn1 *s5kjn1)
+{
+	struct v4l2_ctrl_handler *ctrl_hdlr = &s5kjn1->ctrl_handler;
+	const struct s5kjn1_mode *mode = s5kjn1->mode;
+	s64 pixel_rate, hblank, vblank, exposure_max;
+	struct v4l2_fwnode_device_properties props;
+	int ret;
+
+	v4l2_ctrl_handler_init(ctrl_hdlr, 9);
+
+	s5kjn1->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &s5kjn1_ctrl_ops,
+					V4L2_CID_LINK_FREQ,
+					ARRAY_SIZE(s5kjn1_link_freq_menu) - 1,
+					0, s5kjn1_link_freq_menu);
+	if (s5kjn1->link_freq)
+		s5kjn1->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	pixel_rate = s5kjn1_mode_to_pixel_rate(mode);
+	s5kjn1->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &s5kjn1_ctrl_ops,
+					       V4L2_CID_PIXEL_RATE,
+					       0, pixel_rate, 1, pixel_rate);
+
+	hblank = mode->hts - mode->width;
+	s5kjn1->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &s5kjn1_ctrl_ops,
+					   V4L2_CID_HBLANK, hblank,
+					   hblank, 1, hblank);
+	if (s5kjn1->hblank)
+		s5kjn1->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	vblank = mode->vts - mode->height;
+	s5kjn1->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &s5kjn1_ctrl_ops,
+					   V4L2_CID_VBLANK, vblank,
+					   S5KJN1_VTS_MAX - mode->height, 1,
+					   vblank);
+
+	v4l2_ctrl_new_std(ctrl_hdlr, &s5kjn1_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
+			  S5KJN1_AGAIN_MIN, S5KJN1_AGAIN_MAX,
+			  S5KJN1_AGAIN_STEP, S5KJN1_AGAIN_DEFAULT);
+
+	exposure_max = mode->vts - mode->exposure_margin;
+	s5kjn1->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &s5kjn1_ctrl_ops,
+					     V4L2_CID_EXPOSURE,
+					     S5KJN1_EXPOSURE_MIN,
+					     exposure_max,
+					     S5KJN1_EXPOSURE_STEP,
+					     mode->exposure);
+
+	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &s5kjn1_ctrl_ops,
+				     V4L2_CID_TEST_PATTERN,
+				     ARRAY_SIZE(s5kjn1_test_pattern_menu) - 1,
+				     0, 0, s5kjn1_test_pattern_menu);
+
+	s5kjn1->hflip = v4l2_ctrl_new_std(ctrl_hdlr, &s5kjn1_ctrl_ops,
+					  V4L2_CID_HFLIP, 0, 1, 1, 0);
+	if (s5kjn1->hflip)
+		s5kjn1->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
+
+	s5kjn1->vflip = v4l2_ctrl_new_std(ctrl_hdlr, &s5kjn1_ctrl_ops,
+					  V4L2_CID_VFLIP, 0, 1, 1, 0);
+	if (s5kjn1->vflip)
+		s5kjn1->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
+
+	if (ctrl_hdlr->error)
+		return ctrl_hdlr->error;
+
+	ret = v4l2_fwnode_device_parse(s5kjn1->dev, &props);
+	if (ret)
+		goto error_free_hdlr;
+
+	ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &s5kjn1_ctrl_ops,
+					      &props);
+	if (ret)
+		goto error_free_hdlr;
+
+	s5kjn1->sd.ctrl_handler = ctrl_hdlr;
+
+	return 0;
+
+error_free_hdlr:
+	v4l2_ctrl_handler_free(ctrl_hdlr);
+
+	return ret;
+}
+
+static int s5kjn1_enable_streams(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state, u32 pad,
+				 u64 streams_mask)
+{
+	struct s5kjn1 *s5kjn1 = to_s5kjn1(sd);
+	const struct s5kjn1_reg_list *reg_list = &s5kjn1->mode->reg_list;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(s5kjn1->dev);
+	if (ret)
+		return ret;
+
+	/* Page pointer */
+	cci_write(s5kjn1->regmap, CCI_REG16(0x6028), 0x4000, &ret);
+	/* Set version */
+	cci_write(s5kjn1->regmap, CCI_REG16(0x0000), 0x0003, &ret);
+	cci_write(s5kjn1->regmap, CCI_REG16(0x0000), S5KJN1_CHIP_ID, &ret);
+	cci_write(s5kjn1->regmap, CCI_REG16(0x001e), 0x0007, &ret);
+	cci_write(s5kjn1->regmap, CCI_REG16(0x6028), 0x4000, &ret);
+	cci_write(s5kjn1->regmap, CCI_REG16(0x6010), 0x0001, &ret);
+	if (ret)
+		goto error;
+
+	usleep_range(5 * USEC_PER_MSEC, 6 * USEC_PER_MSEC);
+
+	cci_write(s5kjn1->regmap, CCI_REG16(0x6226), 0x0001, &ret);
+	if (ret)
+		goto error;
+
+	usleep_range(10 * USEC_PER_MSEC, 11 * USEC_PER_MSEC);
+
+	/* Sensor init settings */
+	cci_multi_reg_write(s5kjn1->regmap, init_array_setting,
+			    ARRAY_SIZE(init_array_setting), &ret);
+	cci_multi_reg_write(s5kjn1->regmap, reg_list->regs,
+			    reg_list->num_regs, &ret);
+	if (ret)
+		goto error;
+
+	ret = __v4l2_ctrl_handler_setup(s5kjn1->sd.ctrl_handler);
+
+	cci_write(s5kjn1->regmap, S5KJN1_REG_CTRL_MODE,
+		  S5KJN1_MODE_STREAMING, &ret);
+	if (ret)
+		goto error;
+
+	return 0;
+
+error:
+	dev_err(s5kjn1->dev, "failed to start streaming: %d\n", ret);
+	pm_runtime_put_autosuspend(s5kjn1->dev);
+
+	return ret;
+}
+
+static int s5kjn1_disable_streams(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state, u32 pad,
+				  u64 streams_mask)
+{
+	struct s5kjn1 *s5kjn1 = to_s5kjn1(sd);
+	int ret;
+
+	ret = cci_write(s5kjn1->regmap, S5KJN1_REG_CTRL_MODE, 0x0, NULL);
+	if (ret)
+		dev_err(s5kjn1->dev, "failed to stop streaming: %d\n", ret);
+
+	pm_runtime_put_autosuspend(s5kjn1->dev);
+
+	return ret;
+}
+
+static u32 s5kjn1_get_format_code(struct s5kjn1 *s5kjn1)
+{
+	unsigned int i;
+
+	i = (s5kjn1->vflip->val ? 2 : 0) | (s5kjn1->hflip->val ? 1 : 0);
+
+	return s5kjn1_mbus_formats[i];
+}
+
+static void s5kjn1_update_pad_format(struct s5kjn1 *s5kjn1,
+				     const struct s5kjn1_mode *mode,
+				     struct v4l2_mbus_framefmt *fmt)
+{
+	fmt->code = s5kjn1_get_format_code(s5kjn1);
+	fmt->width = mode->width;
+	fmt->height = mode->height;
+	fmt->field = V4L2_FIELD_NONE;
+	fmt->colorspace = V4L2_COLORSPACE_SRGB;
+	fmt->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
+	fmt->xfer_func = V4L2_XFER_FUNC_NONE;
+}
+
+static int s5kjn1_set_pad_format(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state,
+				 struct v4l2_subdev_format *fmt)
+{
+	struct s5kjn1 *s5kjn1 = to_s5kjn1(sd);
+	s64 hblank, vblank, exposure_max;
+	const struct s5kjn1_mode *mode;
+
+	mode = v4l2_find_nearest_size(s5kjn1_supported_modes,
+				      ARRAY_SIZE(s5kjn1_supported_modes),
+				      width, height,
+				      fmt->format.width, fmt->format.height);
+
+	s5kjn1_update_pad_format(s5kjn1, mode, &fmt->format);
+
+	/* Format code can be updated with respect to flip controls */
+	*v4l2_subdev_state_get_format(state, 0) = fmt->format;
+
+	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
+		return 0;
+
+	if (s5kjn1->mode == mode)
+		return 0;
+
+	s5kjn1->mode = mode;
+
+	/* Update limits and set FPS and exposure to default values */
+	hblank = mode->hts - mode->width;
+	__v4l2_ctrl_modify_range(s5kjn1->hblank, hblank, hblank, 1, hblank);
+
+	vblank = mode->vts - mode->height;
+	__v4l2_ctrl_modify_range(s5kjn1->vblank, vblank,
+				 S5KJN1_VTS_MAX - mode->height, 1, vblank);
+	__v4l2_ctrl_s_ctrl(s5kjn1->vblank, vblank);
+
+	exposure_max = mode->vts - mode->exposure_margin;
+	__v4l2_ctrl_modify_range(s5kjn1->exposure, S5KJN1_EXPOSURE_MIN,
+				 exposure_max, S5KJN1_EXPOSURE_STEP,
+				 mode->exposure);
+	__v4l2_ctrl_s_ctrl(s5kjn1->exposure, mode->exposure);
+
+	return 0;
+}
+
+static int s5kjn1_enum_mbus_code(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *sd_state,
+				 struct v4l2_subdev_mbus_code_enum *code)
+{
+	struct s5kjn1 *s5kjn1 = to_s5kjn1(sd);
+
+	/* Media bus code index is constant, but code formats are not */
+	if (code->index > 0)
+		return -EINVAL;
+
+	code->code = s5kjn1_get_format_code(s5kjn1);
+
+	return 0;
+}
+
+static int s5kjn1_enum_frame_size(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *sd_state,
+				  struct v4l2_subdev_frame_size_enum *fse)
+{
+	struct s5kjn1 *s5kjn1 = to_s5kjn1(sd);
+
+	if (fse->index >= ARRAY_SIZE(s5kjn1_supported_modes))
+		return -EINVAL;
+
+	if (fse->code != s5kjn1_get_format_code(s5kjn1))
+		return -EINVAL;
+
+	fse->min_width = s5kjn1_supported_modes[fse->index].width;
+	fse->max_width = fse->min_width;
+	fse->min_height = s5kjn1_supported_modes[fse->index].height;
+	fse->max_height = fse->min_height;
+
+	return 0;
+}
+
+static int s5kjn1_init_state(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *state)
+{
+	struct s5kjn1 *s5kjn1 = to_s5kjn1(sd);
+	struct v4l2_subdev_format fmt = {
+		.which = V4L2_SUBDEV_FORMAT_TRY,
+		.pad = 0,
+		.format = {
+			/* Media bus code depends on current flip controls */
+			.width = s5kjn1->mode->width,
+			.height = s5kjn1->mode->height,
+		},
+	};
+
+	s5kjn1_set_pad_format(sd, state, &fmt);
+
+	return 0;
+}
+
+static const struct v4l2_subdev_video_ops s5kjn1_video_ops = {
+	.s_stream = v4l2_subdev_s_stream_helper,
+};
+
+static const struct v4l2_subdev_pad_ops s5kjn1_pad_ops = {
+	.set_fmt = s5kjn1_set_pad_format,
+	.get_fmt = v4l2_subdev_get_fmt,
+	.enum_mbus_code = s5kjn1_enum_mbus_code,
+	.enum_frame_size = s5kjn1_enum_frame_size,
+	.enable_streams = s5kjn1_enable_streams,
+	.disable_streams = s5kjn1_disable_streams,
+};
+
+static const struct v4l2_subdev_ops s5kjn1_subdev_ops = {
+	.video = &s5kjn1_video_ops,
+	.pad = &s5kjn1_pad_ops,
+};
+
+static const struct v4l2_subdev_internal_ops s5kjn1_internal_ops = {
+	.init_state = s5kjn1_init_state,
+};
+
+static const struct media_entity_operations s5kjn1_subdev_entity_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+};
+
+static int s5kjn1_identify_sensor(struct s5kjn1 *s5kjn1)
+{
+	u64 val;
+	int ret;
+
+	ret = cci_read(s5kjn1->regmap, S5KJN1_REG_CHIP_ID, &val, NULL);
+	if (ret) {
+		dev_err(s5kjn1->dev, "failed to read chip id: %d\n", ret);
+		return ret;
+	}
+
+	if (val != S5KJN1_CHIP_ID) {
+		dev_err(s5kjn1->dev, "chip id mismatch: %x!=%llx\n",
+			S5KJN1_CHIP_ID, val);
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
+static int s5kjn1_check_hwcfg(struct s5kjn1 *s5kjn1)
+{
+	struct fwnode_handle *fwnode = dev_fwnode(s5kjn1->dev), *ep;
+	struct v4l2_fwnode_endpoint bus_cfg = {
+		.bus_type = V4L2_MBUS_CSI2_DPHY,
+	};
+	unsigned long freq_bitmap;
+	int ret;
+
+	if (!fwnode)
+		return -ENODEV;
+
+	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
+	if (!ep)
+		return -EINVAL;
+
+	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
+	fwnode_handle_put(ep);
+	if (ret)
+		return ret;
+
+	if (bus_cfg.bus.mipi_csi2.num_data_lanes != S5KJN1_DATA_LANES) {
+		dev_err(s5kjn1->dev, "Invalid number of data lanes: %u\n",
+			bus_cfg.bus.mipi_csi2.num_data_lanes);
+		ret = -EINVAL;
+		goto endpoint_free;
+	}
+
+	ret = v4l2_link_freq_to_bitmap(s5kjn1->dev, bus_cfg.link_frequencies,
+				       bus_cfg.nr_of_link_frequencies,
+				       s5kjn1_link_freq_menu,
+				       ARRAY_SIZE(s5kjn1_link_freq_menu),
+				       &freq_bitmap);
+
+endpoint_free:
+	v4l2_fwnode_endpoint_free(&bus_cfg);
+
+	return ret;
+}
+
+static int s5kjn1_power_on(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct s5kjn1 *s5kjn1 = to_s5kjn1(sd);
+	int ret;
+
+	ret = regulator_bulk_enable(S5KJN1_NUM_SUPPLIES, s5kjn1->supplies);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(s5kjn1->mclk);
+	if (ret)
+		goto disable_regulators;
+
+	gpiod_set_value_cansleep(s5kjn1->reset_gpio, 0);
+	usleep_range(10 * USEC_PER_MSEC, 15 * USEC_PER_MSEC);
+
+	return 0;
+
+disable_regulators:
+	regulator_bulk_disable(S5KJN1_NUM_SUPPLIES, s5kjn1->supplies);
+
+	return ret;
+}
+
+static int s5kjn1_power_off(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct s5kjn1 *s5kjn1 = to_s5kjn1(sd);
+
+	gpiod_set_value_cansleep(s5kjn1->reset_gpio, 1);
+
+	clk_disable_unprepare(s5kjn1->mclk);
+
+	regulator_bulk_disable(S5KJN1_NUM_SUPPLIES, s5kjn1->supplies);
+
+	return 0;
+}
+
+static int s5kjn1_probe(struct i2c_client *client)
+{
+	struct s5kjn1 *s5kjn1;
+	unsigned long freq;
+	unsigned int i;
+	int ret;
+
+	s5kjn1 = devm_kzalloc(&client->dev, sizeof(*s5kjn1), GFP_KERNEL);
+	if (!s5kjn1)
+		return -ENOMEM;
+
+	s5kjn1->dev = &client->dev;
+	v4l2_i2c_subdev_init(&s5kjn1->sd, client, &s5kjn1_subdev_ops);
+
+	s5kjn1->regmap = devm_cci_regmap_init_i2c(client, 16);
+	if (IS_ERR(s5kjn1->regmap))
+		return dev_err_probe(s5kjn1->dev, PTR_ERR(s5kjn1->regmap),
+				     "failed to init CCI\n");
+
+	s5kjn1->mclk = devm_v4l2_sensor_clk_get(s5kjn1->dev, NULL);
+	if (IS_ERR(s5kjn1->mclk))
+		return dev_err_probe(s5kjn1->dev, PTR_ERR(s5kjn1->mclk),
+				     "failed to get MCLK clock\n");
+
+	freq = clk_get_rate(s5kjn1->mclk);
+	if (freq && freq != S5KJN1_MCLK_FREQ_24MHZ)
+		return dev_err_probe(s5kjn1->dev, -EINVAL,
+				     "MCLK clock frequency %lu is not supported\n",
+				     freq);
+
+	ret = s5kjn1_check_hwcfg(s5kjn1);
+	if (ret)
+		return dev_err_probe(s5kjn1->dev, ret,
+				     "failed to check HW configuration\n");
+
+	s5kjn1->reset_gpio = devm_gpiod_get_optional(s5kjn1->dev, "reset",
+						     GPIOD_OUT_HIGH);
+	if (IS_ERR(s5kjn1->reset_gpio))
+		return dev_err_probe(s5kjn1->dev, PTR_ERR(s5kjn1->reset_gpio),
+				     "cannot get reset GPIO\n");
+
+	for (i = 0; i < S5KJN1_NUM_SUPPLIES; i++)
+		s5kjn1->supplies[i].supply = s5kjn1_supply_names[i];
+
+	ret = devm_regulator_bulk_get(s5kjn1->dev, S5KJN1_NUM_SUPPLIES,
+				      s5kjn1->supplies);
+	if (ret)
+		return dev_err_probe(s5kjn1->dev, ret,
+				     "failed to get supply regulators\n");
+
+	/* The sensor must be powered on to read the CHIP_ID register */
+	ret = s5kjn1_power_on(s5kjn1->dev);
+	if (ret)
+		return ret;
+
+	ret = s5kjn1_identify_sensor(s5kjn1);
+	if (ret) {
+		dev_err_probe(s5kjn1->dev, ret, "failed to find sensor\n");
+		goto power_off;
+	}
+
+	s5kjn1->mode = &s5kjn1_supported_modes[0];
+	ret = s5kjn1_init_controls(s5kjn1);
+	if (ret) {
+		dev_err_probe(s5kjn1->dev, ret, "failed to init controls\n");
+		goto power_off;
+	}
+
+	s5kjn1->sd.state_lock = s5kjn1->ctrl_handler.lock;
+	s5kjn1->sd.internal_ops = &s5kjn1_internal_ops;
+	s5kjn1->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	s5kjn1->sd.entity.ops = &s5kjn1_subdev_entity_ops;
+	s5kjn1->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
+	s5kjn1->pad.flags = MEDIA_PAD_FL_SOURCE;
+
+	ret = media_entity_pads_init(&s5kjn1->sd.entity, 1, &s5kjn1->pad);
+	if (ret) {
+		dev_err_probe(s5kjn1->dev, ret,
+			      "failed to init media entity pads\n");
+		goto v4l2_ctrl_handler_free;
+	}
+
+	ret = v4l2_subdev_init_finalize(&s5kjn1->sd);
+	if (ret < 0) {
+		dev_err_probe(s5kjn1->dev, ret,
+			      "failed to init media entity pads\n");
+		goto media_entity_cleanup;
+	}
+
+	pm_runtime_set_active(s5kjn1->dev);
+	pm_runtime_enable(s5kjn1->dev);
+
+	ret = v4l2_async_register_subdev_sensor(&s5kjn1->sd);
+	if (ret < 0) {
+		dev_err_probe(s5kjn1->dev, ret,
+			      "failed to register V4L2 subdev\n");
+		goto subdev_cleanup;
+	}
+
+	/* Enable runtime PM and turn off the device */
+	pm_runtime_idle(s5kjn1->dev);
+	pm_runtime_set_autosuspend_delay(s5kjn1->dev, 1000);
+	pm_runtime_use_autosuspend(s5kjn1->dev);
+
+	return 0;
+
+subdev_cleanup:
+	v4l2_subdev_cleanup(&s5kjn1->sd);
+	pm_runtime_disable(s5kjn1->dev);
+	pm_runtime_set_suspended(s5kjn1->dev);
+
+media_entity_cleanup:
+	media_entity_cleanup(&s5kjn1->sd.entity);
+
+v4l2_ctrl_handler_free:
+	v4l2_ctrl_handler_free(s5kjn1->sd.ctrl_handler);
+
+power_off:
+	s5kjn1_power_off(s5kjn1->dev);
+
+	return ret;
+}
+
+static void s5kjn1_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct s5kjn1 *s5kjn1 = to_s5kjn1(sd);
+
+	v4l2_async_unregister_subdev(sd);
+	v4l2_subdev_cleanup(sd);
+	media_entity_cleanup(&sd->entity);
+	v4l2_ctrl_handler_free(sd->ctrl_handler);
+	pm_runtime_disable(s5kjn1->dev);
+
+	if (!pm_runtime_status_suspended(s5kjn1->dev)) {
+		s5kjn1_power_off(s5kjn1->dev);
+		pm_runtime_set_suspended(s5kjn1->dev);
+	}
+}
+
+static const struct dev_pm_ops s5kjn1_pm_ops = {
+	SET_RUNTIME_PM_OPS(s5kjn1_power_off, s5kjn1_power_on, NULL)
+};
+
+static const struct of_device_id s5kjn1_of_match[] = {
+	{ .compatible = "samsung,s5kjn1" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, s5kjn1_of_match);
+
+static struct i2c_driver s5kjn1_i2c_driver = {
+	.driver = {
+		.name = "s5kjn1",
+		.pm = &s5kjn1_pm_ops,
+		.of_match_table = s5kjn1_of_match,
+	},
+	.probe = s5kjn1_probe,
+	.remove = s5kjn1_remove,
+};
+
+module_i2c_driver(s5kjn1_i2c_driver);
+
+MODULE_AUTHOR("Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>");
+MODULE_DESCRIPTION("Samsung S5KJN1 image sensor driver");
+MODULE_LICENSE("GPL");
-- 
2.49.0


