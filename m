Return-Path: <linux-media+bounces-48112-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F0BC9DB3B
	for <lists+linux-media@lfdr.de>; Wed, 03 Dec 2025 05:03:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BEE3B3A6510
	for <lists+linux-media@lfdr.de>; Wed,  3 Dec 2025 04:03:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32D9726FDA8;
	Wed,  3 Dec 2025 04:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OkOoioqT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2048C26980F
	for <linux-media@vger.kernel.org>; Wed,  3 Dec 2025 04:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764734590; cv=none; b=pz5m2YnljbLbPWujdwoJQpiMZZQa0Jy2UOdg8VbDlOob1kESbiJwgkfHCVPEHL9QvFMYMpGH0cr9UEMaMhb9/WIQ9zEyRRY1WrVikZSPdAL0RjITXBnkbfJ0dDrLDef+pljvC9SHwQiS4GLi7l1xfq/gigzMhD700N5o8mnyDzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764734590; c=relaxed/simple;
	bh=ao0pJRO6YY3z1B35owrbpB3a2X8Uwia8/374Cpsa+bM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yzmo8rGs9zxHzDVM9HFv/Ljl6bDH1Zkb0jT3DaOY+SsjPSWy3mgM4b8XwekQwVw/76RVX/mzSfa7vRSU1PSd3ECISc2XJZVf0npbb/o6vE1ptNhZc9FJhKnBElMfxoVhCsYlIKO4cDX/bNW5gyw7AC27jS39+0xhO4FXraRRUmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OkOoioqT; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-594285eed50so521421e87.0
        for <linux-media@vger.kernel.org>; Tue, 02 Dec 2025 20:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764734585; x=1765339385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/y5fkX0oyejElBr8DfpctBiz5JcCLcRbWlHPG9Wf7jU=;
        b=OkOoioqTpcpN8zwipgt97ckGsRbxw70zC9T5eNcaUgfb4nTQxEoB38b2dhh9ELvJEN
         MElu8qXDc4A0JzByqUZgVc3if39ogWHJk2JyEhDFSPJENV8ouUcopxQTvIaLJvpgqxid
         mg4QtAkfvNSIW1rUFYjPhhZf4xIYeSrPws615fwt3Aq3mmKBCyeI4bBr6jzfoYAnO3bg
         FscGvtTom8bz240Suuy6i6A3A/LwQorSOxcxhAMEf2Dfu71X3HpiVznGZ59jHnwMiQoY
         lqCri2KVw0pPjO+I60ZaB59WW//EFtVrcgOWFXQ7aosVk6T5fMQxCvSPQMNIk/ySq3a9
         XMrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764734585; x=1765339385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/y5fkX0oyejElBr8DfpctBiz5JcCLcRbWlHPG9Wf7jU=;
        b=c1CqyuyAMvLbwQW0BN2/8SqiT+JrPdrJ5PZhZamCITIeELydq/8rELmrGMsX/JfrcE
         BjNzYf6jEvSlwZvF9vx76skAAOQaMsQnmUCcABcVb1qd+CsXzb/cra476uQC+SMPS1+c
         MfmtGQt4WGLzAwJCqn+/W8kOpWFn4W8qBruY/0fJkY38axJtr2uH7OnYgh0rm4OEg65O
         XYRIBCRiuD2/bHM7jDeITvH5NhvxRWqEt6O1TROJovkdnTFCocnLWvWhnGWD1mN58ykI
         ScArweQZcu9LZXUpX7S5nFtauSZ0elKAU6l0fr4/XS64B9YQjhxnv3BFmoD1q4BUe0nQ
         +lCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmd9/nPRcLwG1nt+20ni/FJlqh4sxdQAWBQyoxfem2+JjneDDJIdCi/RbmF2TW1XkShPacVsREOtLLyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmoosErWmA90U7ijU2GMtx7J5A/ipsC5M1oAmjUBqwRW0EYDK6
	02V5IUUfZjYb1pzHJM/qK6LMI6H4OPwxFFIBvVNUPn2Tpn8z3+sTghcIl4MUIlciogE=
X-Gm-Gg: ASbGncst0xkSb98KOhxOlQ16L6vSW9D7J8xRmqppH5rXIZq5ibhxMhb8IaLV5GjM5xU
	a4ViX6g7waj45rLlUbRc8jUftvr6up9pE0bORq1XqHZ80Nupq3vEoR9IoweYml4+/BtgMkjhW9o
	jKHDyhhGdrqvXLO82SSCdE27z+kE0RvOtAEk/14QWoYhbz4nmSK9aWSDk8SxS9Ce73RvwX49a2N
	/QkdXo2XZ7Ost90hRmtQ/tm/zFDz1pyNiDgW0iR6upYNDM+6cPWvMfIJm+Zr+I80EGRSjaBkq8U
	7m2pKG1/gguIrQCYIAtrpuwjBxZ1hE9+ujjdXnztpRtnCLuDQhpbnQQOlepadJe2T3BCR1jGTmM
	I+11/yDqnwkmPmq+HjqAJ0hkfRot3qUK19P8ioNctvdVzt4vJeTtkKKF4JhPNq4luU8CIKTsIP2
	AGp5rKPsKKsJpDj7e2QqOqraeq/hNFnFw2YNCyzgGhgeH/mQplukty3A==
X-Google-Smtp-Source: AGHT+IH07MZA2HtCEmL8yjI/nF7Oe3k+QGkjHSMMhXcMGtvHDLQl3vTnlvMmLIyR9sxDkzzRIEOXgw==
X-Received: by 2002:a05:6512:3f12:b0:594:2654:5e6f with SMTP id 2adb3069b0e04-597d4b2a84emr249e87.3.1764734584845;
        Tue, 02 Dec 2025 20:03:04 -0800 (PST)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bf8b1082sm5210181e87.29.2025.12.02.20.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 20:03:02 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v2 2/2] media: i2c: Add Samsung S5K3M5 13MP camera sensor driver
Date: Wed,  3 Dec 2025 06:02:40 +0200
Message-ID: <20251203040241.71018-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251203040241.71018-1-vladimir.zapolskiy@linaro.org>
References: <20251203040241.71018-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Samsung S5K3M5 (ISOCELL 3M5) is a 13MP image sensor, it produces
Bayer GRBG (2x2) frames in RAW10 output format, the maximum supported
output resolution is 4208x3120 at 30 frames per second.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 MAINTAINERS                |    8 +
 drivers/media/i2c/Kconfig  |   10 +
 drivers/media/i2c/Makefile |    1 +
 drivers/media/i2c/s5k3m5.c | 1377 ++++++++++++++++++++++++++++++++++++
 4 files changed, 1396 insertions(+)
 create mode 100644 drivers/media/i2c/s5k3m5.c

diff --git a/MAINTAINERS b/MAINTAINERS
index b0f989f6bde2..64a8a643b2cc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22892,6 +22892,14 @@ S:	Supported
 F:	Documentation/devicetree/bindings/media/samsung,s5c73m3.yaml
 F:	drivers/media/i2c/s5c73m3/*
 
+SAMSUNG S5K3M5 CAMERA DRIVER
+M:	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/devicetree/bindings/media/i2c/samsung,s5k3m5.yaml
+F:	drivers/media/i2c/s5k3m5.c
+
 SAMSUNG S5K5BAF CAMERA DRIVER
 M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
 M:	Andrzej Hajda <andrzej.hajda@intel.com>
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index ec90f58ef698..83468cf59445 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -733,6 +733,16 @@ config VIDEO_S5C73M3
 	  This is a V4L2 sensor driver for Samsung S5C73M3
 	  8 Mpixel camera.
 
+config VIDEO_S5K3M5
+	tristate "Samsung S5K3M5 sensor support"
+	select V4L2_CCI_I2C
+	help
+	  This is a V4L2 sensor driver for Samsung S5K3M5 13MP raw
+	  camera sensor.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called s5k3m5.
+
 config VIDEO_S5K5BAF
 	tristate "Samsung S5K5BAF sensor support"
 	help
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index b7f5c3f020e8..8fc3a7712c16 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -124,6 +124,7 @@ obj-$(CONFIG_VIDEO_RDACM20) += rdacm20.o
 obj-$(CONFIG_VIDEO_RDACM21) += rdacm21.o
 obj-$(CONFIG_VIDEO_RJ54N1) += rj54n1cb0c.o
 obj-$(CONFIG_VIDEO_S5C73M3) += s5c73m3/
+obj-$(CONFIG_VIDEO_S5K3M5) += s5k3m5.o
 obj-$(CONFIG_VIDEO_S5K5BAF) += s5k5baf.o
 obj-$(CONFIG_VIDEO_S5K6A3) += s5k6a3.o
 obj-$(CONFIG_VIDEO_S5KJN1) += s5kjn1.o
diff --git a/drivers/media/i2c/s5k3m5.c b/drivers/media/i2c/s5k3m5.c
new file mode 100644
index 000000000000..c591b580d2e7
--- /dev/null
+++ b/drivers/media/i2c/s5k3m5.c
@@ -0,0 +1,1377 @@
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
+#define S5K3M5_LINK_FREQ_602P5MHZ	(602500ULL * HZ_PER_KHZ)
+#define S5K3M5_MCLK_FREQ_24MHZ		(24 * HZ_PER_MHZ)
+#define S5K3M5_DATA_LANES		4
+
+/* Register map is similar to MIPI CCS compliant camera sensors */
+#define S5K3M5_REG_CHIP_ID		CCI_REG16(0x0000)
+#define S5K3M5_CHIP_ID			0x30d5
+
+/* Both streaming and flipping settings are controlled at the same time */
+#define S5K3M5_REG_CTRL_MODE		CCI_REG16(0x0100)
+#define S5K3M5_MODE_STREAMING		BIT(8)
+#define S5K3M5_VFLIP			BIT(1)
+#define S5K3M5_HFLIP			BIT(0)
+
+#define S5K3M5_REG_EXPOSURE		CCI_REG16(0x0202)
+#define S5K3M5_EXPOSURE_MIN		8
+#define S5K3M5_EXPOSURE_STEP		1
+#define S5K3M5_EXPOSURE_MARGIN		4
+
+#define S5K3M5_REG_AGAIN		CCI_REG16(0x0204)
+#define S5K3M5_AGAIN_MIN		1
+#define S5K3M5_AGAIN_MAX		16
+#define S5K3M5_AGAIN_STEP		1
+#define S5K3M5_AGAIN_DEFAULT		1
+#define S5K3M5_AGAIN_SHIFT		5
+
+#define S5K3M5_REG_VTS			CCI_REG16(0x0340)
+#define S5K3M5_VTS_MAX			0xffff
+
+#define S5K3M5_REG_HTS			CCI_REG16(0x0342)
+#define S5K3M5_REG_X_ADDR_START		CCI_REG16(0x0344)
+#define S5K3M5_REG_Y_ADDR_START		CCI_REG16(0x0346)
+#define S5K3M5_REG_X_ADDR_END		CCI_REG16(0x0348)
+#define S5K3M5_REG_Y_ADDR_END		CCI_REG16(0x034a)
+#define S5K3M5_REG_X_OUTPUT_SIZE	CCI_REG16(0x034c)
+#define S5K3M5_REG_Y_OUTPUT_SIZE	CCI_REG16(0x034e)
+
+#define S5K3M5_REG_TEST_PATTERN		CCI_REG16(0x0600)
+
+#define to_s5k3m5(_sd)			container_of(_sd, struct s5k3m5, sd)
+
+static const s64 s5k3m5_link_freq_menu[] = {
+	S5K3M5_LINK_FREQ_602P5MHZ,
+};
+
+/* List of supported formats to cover horizontal and vertical flip controls */
+static const u32 s5k3m5_mbus_formats[] = {
+	MEDIA_BUS_FMT_SGRBG10_1X10,	MEDIA_BUS_FMT_SRGGB10_1X10,
+	MEDIA_BUS_FMT_SBGGR10_1X10,	MEDIA_BUS_FMT_SGBRG10_1X10,
+};
+
+struct s5k3m5_reg_list {
+	const struct cci_reg_sequence *regs;
+	unsigned int num_regs;
+};
+
+struct s5k3m5_mode {
+	u32 width;			/* Frame width in pixels */
+	u32 height;			/* Frame height in pixels */
+	u32 hts;			/* Horizontal timing size */
+	u32 vts;			/* Default vertical timing size */
+	u32 exposure;			/* Default exposure value */
+
+	const struct s5k3m5_reg_list reg_list;	/* Sensor register setting */
+};
+
+static const char * const s5k3m5_test_pattern_menu[] = {
+	"Disabled",
+	"Solid colour",
+	"Colour bars",
+	"Fade to grey colour bars",
+	"PN9",
+};
+
+static const char * const s5k3m5_supply_names[] = {
+	"afvdd",	/* Autofocus power */
+	"vdda",		/* Analog power */
+	"vddd",		/* Digital core power */
+	"vddio",	/* Digital I/O power */
+};
+
+#define S5K3M5_NUM_SUPPLIES	ARRAY_SIZE(s5k3m5_supply_names)
+
+struct s5k3m5 {
+	struct device *dev;
+	struct regmap *regmap;
+	struct clk *mclk;
+	struct gpio_desc *reset_gpio;
+	struct regulator_bulk_data supplies[S5K3M5_NUM_SUPPLIES];
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
+	const struct s5k3m5_mode *mode;
+};
+
+static const struct cci_reg_sequence burst_array_setting[] = {
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6f12), 0x0549 },
+	{ CCI_REG16(0x6f12), 0x0448 },
+	{ CCI_REG16(0x6f12), 0x054a },
+	{ CCI_REG16(0x6f12), 0xc1f8 },
+	{ CCI_REG16(0x6f12), 0xc804 },
+	{ CCI_REG16(0x6f12), 0x101a },
+	{ CCI_REG16(0x6f12), 0xa1f8 },
+	{ CCI_REG16(0x6f12), 0xcc04 },
+	{ CCI_REG16(0x6f12), 0x00f0 },
+	{ CCI_REG16(0x6f12), 0x1bb9 },
+	{ CCI_REG16(0x6f12), 0x2000 },
+	{ CCI_REG16(0x6f12), 0x4210 },
+	{ CCI_REG16(0x6f12), 0x2000 },
+	{ CCI_REG16(0x6f12), 0x2e50 },
+	{ CCI_REG16(0x6f12), 0x2000 },
+	{ CCI_REG16(0x6f12), 0x7000 },
+	{ CCI_REG16(0x6f12), 0x10b5 },
+	{ CCI_REG16(0x6f12), 0x00f0 },
+	{ CCI_REG16(0x6f12), 0x4ff9 },
+	{ CCI_REG16(0x6f12), 0x9949 },
+	{ CCI_REG16(0x6f12), 0x0120 },
+	{ CCI_REG16(0x6f12), 0x0880 },
+	{ CCI_REG16(0x6f12), 0x10bd },
+	{ CCI_REG16(0x6f12), 0x2de9 },
+	{ CCI_REG16(0x6f12), 0xf041 },
+	{ CCI_REG16(0x6f12), 0x974c },
+	{ CCI_REG16(0x6f12), 0x954f },
+	{ CCI_REG16(0x6f12), 0x0026 },
+	{ CCI_REG16(0x6f12), 0xb4f8 },
+	{ CCI_REG16(0x6f12), 0x6a52 },
+	{ CCI_REG16(0x6f12), 0x3888 },
+	{ CCI_REG16(0x6f12), 0x08b1 },
+	{ CCI_REG16(0x6f12), 0xa4f8 },
+	{ CCI_REG16(0x6f12), 0x6a62 },
+	{ CCI_REG16(0x6f12), 0x00f0 },
+	{ CCI_REG16(0x6f12), 0x43f9 },
+	{ CCI_REG16(0x6f12), 0x3e80 },
+	{ CCI_REG16(0x6f12), 0xa4f8 },
+	{ CCI_REG16(0x6f12), 0x6a52 },
+	{ CCI_REG16(0x6f12), 0xbde8 },
+	{ CCI_REG16(0x6f12), 0xf081 },
+	{ CCI_REG16(0x6f12), 0x2de9 },
+	{ CCI_REG16(0x6f12), 0xf041 },
+	{ CCI_REG16(0x6f12), 0x0746 },
+	{ CCI_REG16(0x6f12), 0x8c48 },
+	{ CCI_REG16(0x6f12), 0x0e46 },
+	{ CCI_REG16(0x6f12), 0x0022 },
+	{ CCI_REG16(0x6f12), 0x4068 },
+	{ CCI_REG16(0x6f12), 0x84b2 },
+	{ CCI_REG16(0x6f12), 0x050c },
+	{ CCI_REG16(0x6f12), 0x2146 },
+	{ CCI_REG16(0x6f12), 0x2846 },
+	{ CCI_REG16(0x6f12), 0x00f0 },
+	{ CCI_REG16(0x6f12), 0x36f9 },
+	{ CCI_REG16(0x6f12), 0x3146 },
+	{ CCI_REG16(0x6f12), 0x3846 },
+	{ CCI_REG16(0x6f12), 0x00f0 },
+	{ CCI_REG16(0x6f12), 0x37f9 },
+	{ CCI_REG16(0x6f12), 0x874f },
+	{ CCI_REG16(0x6f12), 0x4df2 },
+	{ CCI_REG16(0x6f12), 0x0c26 },
+	{ CCI_REG16(0x6f12), 0x4ff4 },
+	{ CCI_REG16(0x6f12), 0x8061 },
+	{ CCI_REG16(0x6f12), 0x3a78 },
+	{ CCI_REG16(0x6f12), 0x3046 },
+	{ CCI_REG16(0x6f12), 0x00f0 },
+	{ CCI_REG16(0x6f12), 0x29f9 },
+	{ CCI_REG16(0x6f12), 0x7878 },
+	{ CCI_REG16(0x6f12), 0xb8b3 },
+	{ CCI_REG16(0x6f12), 0x0022 },
+	{ CCI_REG16(0x6f12), 0x8021 },
+	{ CCI_REG16(0x6f12), 0x3046 },
+	{ CCI_REG16(0x6f12), 0x00f0 },
+	{ CCI_REG16(0x6f12), 0x22f9 },
+	{ CCI_REG16(0x6f12), 0x8048 },
+	{ CCI_REG16(0x6f12), 0x0088 },
+	{ CCI_REG16(0x6f12), 0x804b },
+	{ CCI_REG16(0x6f12), 0xa3f8 },
+	{ CCI_REG16(0x6f12), 0x5c02 },
+	{ CCI_REG16(0x6f12), 0x7e48 },
+	{ CCI_REG16(0x6f12), 0x001d },
+	{ CCI_REG16(0x6f12), 0x0088 },
+	{ CCI_REG16(0x6f12), 0xa3f8 },
+	{ CCI_REG16(0x6f12), 0x5e02 },
+	{ CCI_REG16(0x6f12), 0xb3f8 },
+	{ CCI_REG16(0x6f12), 0x5c02 },
+	{ CCI_REG16(0x6f12), 0xb3f8 },
+	{ CCI_REG16(0x6f12), 0x5e12 },
+	{ CCI_REG16(0x6f12), 0x4218 },
+	{ CCI_REG16(0x6f12), 0x02d0 },
+	{ CCI_REG16(0x6f12), 0x8002 },
+	{ CCI_REG16(0x6f12), 0xb0fb },
+	{ CCI_REG16(0x6f12), 0xf2f2 },
+	{ CCI_REG16(0x6f12), 0x91b2 },
+	{ CCI_REG16(0x6f12), 0x784a },
+	{ CCI_REG16(0x6f12), 0xa3f8 },
+	{ CCI_REG16(0x6f12), 0x6012 },
+	{ CCI_REG16(0x6f12), 0xb2f8 },
+	{ CCI_REG16(0x6f12), 0x1602 },
+	{ CCI_REG16(0x6f12), 0xb2f8 },
+	{ CCI_REG16(0x6f12), 0x1422 },
+	{ CCI_REG16(0x6f12), 0xa3f8 },
+	{ CCI_REG16(0x6f12), 0x9805 },
+	{ CCI_REG16(0x6f12), 0xa3f8 },
+	{ CCI_REG16(0x6f12), 0x9a25 },
+	{ CCI_REG16(0x6f12), 0x8018 },
+	{ CCI_REG16(0x6f12), 0x04d0 },
+	{ CCI_REG16(0x6f12), 0x9202 },
+	{ CCI_REG16(0x6f12), 0xb2fb },
+	{ CCI_REG16(0x6f12), 0xf0f0 },
+	{ CCI_REG16(0x6f12), 0xa3f8 },
+	{ CCI_REG16(0x6f12), 0x9c05 },
+	{ CCI_REG16(0x6f12), 0xb3f8 },
+	{ CCI_REG16(0x6f12), 0x9c05 },
+	{ CCI_REG16(0x6f12), 0x0a18 },
+	{ CCI_REG16(0x6f12), 0x01fb },
+	{ CCI_REG16(0x6f12), 0x1020 },
+	{ CCI_REG16(0x6f12), 0x40f3 },
+	{ CCI_REG16(0x6f12), 0x9510 },
+	{ CCI_REG16(0x6f12), 0x1028 },
+	{ CCI_REG16(0x6f12), 0x06dc },
+	{ CCI_REG16(0x6f12), 0x0028 },
+	{ CCI_REG16(0x6f12), 0x05da },
+	{ CCI_REG16(0x6f12), 0x0020 },
+	{ CCI_REG16(0x6f12), 0x03e0 },
+	{ CCI_REG16(0x6f12), 0xffe7 },
+	{ CCI_REG16(0x6f12), 0x0122 },
+	{ CCI_REG16(0x6f12), 0xc5e7 },
+	{ CCI_REG16(0x6f12), 0x1020 },
+	{ CCI_REG16(0x6f12), 0x6849 },
+	{ CCI_REG16(0x6f12), 0x0880 },
+	{ CCI_REG16(0x6f12), 0x2146 },
+	{ CCI_REG16(0x6f12), 0x2846 },
+	{ CCI_REG16(0x6f12), 0xbde8 },
+	{ CCI_REG16(0x6f12), 0xf041 },
+	{ CCI_REG16(0x6f12), 0x0122 },
+	{ CCI_REG16(0x6f12), 0x00f0 },
+	{ CCI_REG16(0x6f12), 0xe2b8 },
+	{ CCI_REG16(0x6f12), 0xf0b5 },
+	{ CCI_REG16(0x6f12), 0x644c },
+	{ CCI_REG16(0x6f12), 0xdde9 },
+	{ CCI_REG16(0x6f12), 0x0565 },
+	{ CCI_REG16(0x6f12), 0x08b1 },
+	{ CCI_REG16(0x6f12), 0x2788 },
+	{ CCI_REG16(0x6f12), 0x0760 },
+	{ CCI_REG16(0x6f12), 0x09b1 },
+	{ CCI_REG16(0x6f12), 0x6088 },
+	{ CCI_REG16(0x6f12), 0x0860 },
+	{ CCI_REG16(0x6f12), 0x12b1 },
+	{ CCI_REG16(0x6f12), 0xa088 },
+	{ CCI_REG16(0x6f12), 0x401c },
+	{ CCI_REG16(0x6f12), 0x1060 },
+	{ CCI_REG16(0x6f12), 0x0bb1 },
+	{ CCI_REG16(0x6f12), 0xe088 },
+	{ CCI_REG16(0x6f12), 0x1860 },
+	{ CCI_REG16(0x6f12), 0x0eb1 },
+	{ CCI_REG16(0x6f12), 0xa07b },
+	{ CCI_REG16(0x6f12), 0x3060 },
+	{ CCI_REG16(0x6f12), 0x002d },
+	{ CCI_REG16(0x6f12), 0x01d0 },
+	{ CCI_REG16(0x6f12), 0xe07b },
+	{ CCI_REG16(0x6f12), 0x2860 },
+	{ CCI_REG16(0x6f12), 0xf0bd },
+	{ CCI_REG16(0x6f12), 0x70b5 },
+	{ CCI_REG16(0x6f12), 0x0646 },
+	{ CCI_REG16(0x6f12), 0x5048 },
+	{ CCI_REG16(0x6f12), 0x0022 },
+	{ CCI_REG16(0x6f12), 0x8068 },
+	{ CCI_REG16(0x6f12), 0x84b2 },
+	{ CCI_REG16(0x6f12), 0x050c },
+	{ CCI_REG16(0x6f12), 0x2146 },
+	{ CCI_REG16(0x6f12), 0x2846 },
+	{ CCI_REG16(0x6f12), 0x00f0 },
+	{ CCI_REG16(0x6f12), 0xbef8 },
+	{ CCI_REG16(0x6f12), 0x3046 },
+	{ CCI_REG16(0x6f12), 0x00f0 },
+	{ CCI_REG16(0x6f12), 0xc5f8 },
+	{ CCI_REG16(0x6f12), 0x5248 },
+	{ CCI_REG16(0x6f12), 0x0368 },
+	{ CCI_REG16(0x6f12), 0xb3f8 },
+	{ CCI_REG16(0x6f12), 0x7401 },
+	{ CCI_REG16(0x6f12), 0x010a },
+	{ CCI_REG16(0x6f12), 0x5048 },
+	{ CCI_REG16(0x6f12), 0x4268 },
+	{ CCI_REG16(0x6f12), 0x82f8 },
+	{ CCI_REG16(0x6f12), 0x5010 },
+	{ CCI_REG16(0x6f12), 0x93f8 },
+	{ CCI_REG16(0x6f12), 0x7511 },
+	{ CCI_REG16(0x6f12), 0x82f8 },
+	{ CCI_REG16(0x6f12), 0x5210 },
+	{ CCI_REG16(0x6f12), 0xb3f8 },
+	{ CCI_REG16(0x6f12), 0x7811 },
+	{ CCI_REG16(0x6f12), 0x090a },
+	{ CCI_REG16(0x6f12), 0x82f8 },
+	{ CCI_REG16(0x6f12), 0x5810 },
+	{ CCI_REG16(0x6f12), 0x93f8 },
+	{ CCI_REG16(0x6f12), 0x7911 },
+	{ CCI_REG16(0x6f12), 0x82f8 },
+	{ CCI_REG16(0x6f12), 0x5a10 },
+	{ CCI_REG16(0x6f12), 0x33f8 },
+	{ CCI_REG16(0x6f12), 0xf01f },
+	{ CCI_REG16(0x6f12), 0x0068 },
+	{ CCI_REG16(0x6f12), 0x090a },
+	{ CCI_REG16(0x6f12), 0x00f8 },
+	{ CCI_REG16(0x6f12), 0xce1f },
+	{ CCI_REG16(0x6f12), 0x5978 },
+	{ CCI_REG16(0x6f12), 0x8170 },
+	{ CCI_REG16(0x6f12), 0x5988 },
+	{ CCI_REG16(0x6f12), 0x090a },
+	{ CCI_REG16(0x6f12), 0x0171 },
+	{ CCI_REG16(0x6f12), 0xd978 },
+	{ CCI_REG16(0x6f12), 0x8171 },
+	{ CCI_REG16(0x6f12), 0x988c },
+	{ CCI_REG16(0x6f12), 0x000a },
+	{ CCI_REG16(0x6f12), 0x9074 },
+	{ CCI_REG16(0x6f12), 0x93f8 },
+	{ CCI_REG16(0x6f12), 0x2500 },
+	{ CCI_REG16(0x6f12), 0x1075 },
+	{ CCI_REG16(0x6f12), 0xd88c },
+	{ CCI_REG16(0x6f12), 0x000a },
+	{ CCI_REG16(0x6f12), 0x9075 },
+	{ CCI_REG16(0x6f12), 0x93f8 },
+	{ CCI_REG16(0x6f12), 0x2700 },
+	{ CCI_REG16(0x6f12), 0x1076 },
+	{ CCI_REG16(0x6f12), 0xb3f8 },
+	{ CCI_REG16(0x6f12), 0xb000 },
+	{ CCI_REG16(0x6f12), 0x000a },
+	{ CCI_REG16(0x6f12), 0x82f8 },
+	{ CCI_REG16(0x6f12), 0x7e00 },
+	{ CCI_REG16(0x6f12), 0x93f8 },
+	{ CCI_REG16(0x6f12), 0xb100 },
+	{ CCI_REG16(0x6f12), 0x82f8 },
+	{ CCI_REG16(0x6f12), 0x8000 },
+	{ CCI_REG16(0x6f12), 0x2f48 },
+	{ CCI_REG16(0x6f12), 0x90f8 },
+	{ CCI_REG16(0x6f12), 0xb313 },
+	{ CCI_REG16(0x6f12), 0x82f8 },
+	{ CCI_REG16(0x6f12), 0x8210 },
+	{ CCI_REG16(0x6f12), 0x90f8 },
+	{ CCI_REG16(0x6f12), 0xb103 },
+	{ CCI_REG16(0x6f12), 0x82f8 },
+	{ CCI_REG16(0x6f12), 0x8400 },
+	{ CCI_REG16(0x6f12), 0x93f8 },
+	{ CCI_REG16(0x6f12), 0xb400 },
+	{ CCI_REG16(0x6f12), 0x82f8 },
+	{ CCI_REG16(0x6f12), 0x8600 },
+	{ CCI_REG16(0x6f12), 0x0020 },
+	{ CCI_REG16(0x6f12), 0x82f8 },
+	{ CCI_REG16(0x6f12), 0x8800 },
+	{ CCI_REG16(0x6f12), 0x93f8 },
+	{ CCI_REG16(0x6f12), 0x6211 },
+	{ CCI_REG16(0x6f12), 0x82f8 },
+	{ CCI_REG16(0x6f12), 0x9610 },
+	{ CCI_REG16(0x6f12), 0x93f8 },
+	{ CCI_REG16(0x6f12), 0x0112 },
+	{ CCI_REG16(0x6f12), 0x82f8 },
+	{ CCI_REG16(0x6f12), 0x9e10 },
+	{ CCI_REG16(0x6f12), 0x93f8 },
+	{ CCI_REG16(0x6f12), 0x0212 },
+	{ CCI_REG16(0x6f12), 0x82f8 },
+	{ CCI_REG16(0x6f12), 0xa010 },
+	{ CCI_REG16(0x6f12), 0x82f8 },
+	{ CCI_REG16(0x6f12), 0xa200 },
+	{ CCI_REG16(0x6f12), 0x82f8 },
+	{ CCI_REG16(0x6f12), 0xa400 },
+	{ CCI_REG16(0x6f12), 0x93f8 },
+	{ CCI_REG16(0x6f12), 0x0512 },
+	{ CCI_REG16(0x6f12), 0x82f8 },
+	{ CCI_REG16(0x6f12), 0xa610 },
+	{ CCI_REG16(0x6f12), 0x93f8 },
+	{ CCI_REG16(0x6f12), 0x0612 },
+	{ CCI_REG16(0x6f12), 0x82f8 },
+	{ CCI_REG16(0x6f12), 0xa810 },
+	{ CCI_REG16(0x6f12), 0x93f8 },
+	{ CCI_REG16(0x6f12), 0x0712 },
+	{ CCI_REG16(0x6f12), 0x82f8 },
+	{ CCI_REG16(0x6f12), 0xaa10 },
+	{ CCI_REG16(0x6f12), 0x82f8 },
+	{ CCI_REG16(0x6f12), 0xac00 },
+	{ CCI_REG16(0x6f12), 0x5a20 },
+	{ CCI_REG16(0x6f12), 0x82f8 },
+	{ CCI_REG16(0x6f12), 0xad00 },
+	{ CCI_REG16(0x6f12), 0x93f8 },
+	{ CCI_REG16(0x6f12), 0x0902 },
+	{ CCI_REG16(0x6f12), 0x82f8 },
+	{ CCI_REG16(0x6f12), 0xae00 },
+	{ CCI_REG16(0x6f12), 0x2146 },
+	{ CCI_REG16(0x6f12), 0x2846 },
+	{ CCI_REG16(0x6f12), 0xbde8 },
+	{ CCI_REG16(0x6f12), 0x7040 },
+	{ CCI_REG16(0x6f12), 0x0122 },
+	{ CCI_REG16(0x6f12), 0x00f0 },
+	{ CCI_REG16(0x6f12), 0x47b8 },
+	{ CCI_REG16(0x6f12), 0x10b5 },
+	{ CCI_REG16(0x6f12), 0x0f4c },
+	{ CCI_REG16(0x6f12), 0x0020 },
+	{ CCI_REG16(0x6f12), 0x2080 },
+	{ CCI_REG16(0x6f12), 0xaff2 },
+	{ CCI_REG16(0x6f12), 0x3321 },
+	{ CCI_REG16(0x6f12), 0x1748 },
+	{ CCI_REG16(0x6f12), 0x0161 },
+	{ CCI_REG16(0x6f12), 0xaff2 },
+	{ CCI_REG16(0x6f12), 0x2d21 },
+	{ CCI_REG16(0x6f12), 0x0022 },
+	{ CCI_REG16(0x6f12), 0x8161 },
+	{ CCI_REG16(0x6f12), 0xaff2 },
+	{ CCI_REG16(0x6f12), 0x1121 },
+	{ CCI_REG16(0x6f12), 0x1448 },
+	{ CCI_REG16(0x6f12), 0x00f0 },
+	{ CCI_REG16(0x6f12), 0x45f8 },
+	{ CCI_REG16(0x6f12), 0x0022 },
+	{ CCI_REG16(0x6f12), 0xaff2 },
+	{ CCI_REG16(0x6f12), 0x2911 },
+	{ CCI_REG16(0x6f12), 0x6060 },
+	{ CCI_REG16(0x6f12), 0x1148 },
+	{ CCI_REG16(0x6f12), 0x00f0 },
+	{ CCI_REG16(0x6f12), 0x3ef8 },
+	{ CCI_REG16(0x6f12), 0x0022 },
+	{ CCI_REG16(0x6f12), 0xaff2 },
+	{ CCI_REG16(0x6f12), 0x6b11 },
+	{ CCI_REG16(0x6f12), 0xa060 },
+	{ CCI_REG16(0x6f12), 0x0f48 },
+	{ CCI_REG16(0x6f12), 0x00f0 },
+	{ CCI_REG16(0x6f12), 0x37f8 },
+	{ CCI_REG16(0x6f12), 0xe060 },
+	{ CCI_REG16(0x6f12), 0x10bd },
+	{ CCI_REG16(0x6f12), 0x2000 },
+	{ CCI_REG16(0x6f12), 0x4200 },
+	{ CCI_REG16(0x6f12), 0x2000 },
+	{ CCI_REG16(0x6f12), 0x2e50 },
+	{ CCI_REG16(0x6f12), 0x2000 },
+	{ CCI_REG16(0x6f12), 0x41d0 },
+	{ CCI_REG16(0x6f12), 0x4000 },
+	{ CCI_REG16(0x6f12), 0x9404 },
+	{ CCI_REG16(0x6f12), 0x2000 },
+	{ CCI_REG16(0x6f12), 0x38e0 },
+	{ CCI_REG16(0x6f12), 0x4000 },
+	{ CCI_REG16(0x6f12), 0xd000 },
+	{ CCI_REG16(0x6f12), 0x4000 },
+	{ CCI_REG16(0x6f12), 0xa410 },
+	{ CCI_REG16(0x6f12), 0x2000 },
+	{ CCI_REG16(0x6f12), 0x2c66 },
+	{ CCI_REG16(0x6f12), 0x2000 },
+	{ CCI_REG16(0x6f12), 0x0890 },
+	{ CCI_REG16(0x6f12), 0x2000 },
+	{ CCI_REG16(0x6f12), 0x3620 },
+	{ CCI_REG16(0x6f12), 0x2000 },
+	{ CCI_REG16(0x6f12), 0x0840 },
+	{ CCI_REG16(0x6f12), 0x0001 },
+	{ CCI_REG16(0x6f12), 0x020d },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6f12), 0x67cd },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6f12), 0x3ae1 },
+	{ CCI_REG16(0x6f12), 0x45f6 },
+	{ CCI_REG16(0x6f12), 0x250c },
+	{ CCI_REG16(0x6f12), 0xc0f2 },
+	{ CCI_REG16(0x6f12), 0x000c },
+	{ CCI_REG16(0x6f12), 0x6047 },
+	{ CCI_REG16(0x6f12), 0x45f6 },
+	{ CCI_REG16(0x6f12), 0xf31c },
+	{ CCI_REG16(0x6f12), 0xc0f2 },
+	{ CCI_REG16(0x6f12), 0x000c },
+	{ CCI_REG16(0x6f12), 0x6047 },
+	{ CCI_REG16(0x6f12), 0x4af2 },
+	{ CCI_REG16(0x6f12), 0xd74c },
+	{ CCI_REG16(0x6f12), 0xc0f2 },
+	{ CCI_REG16(0x6f12), 0x000c },
+	{ CCI_REG16(0x6f12), 0x6047 },
+	{ CCI_REG16(0x6f12), 0x40f2 },
+	{ CCI_REG16(0x6f12), 0x0d2c },
+	{ CCI_REG16(0x6f12), 0xc0f2 },
+	{ CCI_REG16(0x6f12), 0x010c },
+	{ CCI_REG16(0x6f12), 0x6047 },
+	{ CCI_REG16(0x6f12), 0x46f2 },
+	{ CCI_REG16(0x6f12), 0xcd7c },
+	{ CCI_REG16(0x6f12), 0xc0f2 },
+	{ CCI_REG16(0x6f12), 0x000c },
+	{ CCI_REG16(0x6f12), 0x6047 },
+	{ CCI_REG16(0x6f12), 0x4af6 },
+	{ CCI_REG16(0x6f12), 0xe75c },
+	{ CCI_REG16(0x6f12), 0xc0f2 },
+	{ CCI_REG16(0x6f12), 0x000c },
+	{ CCI_REG16(0x6f12), 0x6047 },
+	{ CCI_REG16(0x6f12), 0x30d5 },
+	{ CCI_REG16(0x6f12), 0x00fc },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x6f12), 0x000e },
+};
+
+static const struct cci_reg_sequence init_array_setting[] = {
+	{ CCI_REG16(0x602a), 0x41d0 },
+	{ CCI_REG16(0x6f12), 0x0100 },
+	{ CCI_REG16(0x602a), 0x1662 },
+	{ CCI_REG16(0x6f12), 0x1e00 },
+	{ CCI_REG16(0x602a), 0x1c9a },
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
+	{ CCI_REG16(0x602a), 0x0ff2 },
+	{ CCI_REG16(0x6f12), 0x0020 },
+	{ CCI_REG16(0x602a), 0x0ef6 },
+	{ CCI_REG16(0x6f12), 0x0100 },
+	{ CCI_REG16(0x602a), 0x23b2 },
+	{ CCI_REG16(0x6f12), 0x0001 },
+	{ CCI_REG16(0x602a), 0x0fe4 },
+	{ CCI_REG16(0x6f12), 0x0107 },
+	{ CCI_REG16(0x6f12), 0x07d0 },
+	{ CCI_REG16(0x602a), 0x12f8 },
+	{ CCI_REG16(0x6f12), 0x3d09 },
+	{ CCI_REG16(0x602a), 0x0e18 },
+	{ CCI_REG16(0x6f12), 0x0040 },
+	{ CCI_REG16(0x602a), 0x1066 },
+	{ CCI_REG16(0x6f12), 0x000c },
+	{ CCI_REG16(0x602a), 0x13de },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x602a), 0x12f2 },
+	{ CCI_REG16(0x6f12), 0x0f0f },
+	{ CCI_REG16(0x602a), 0x13dc },
+	{ CCI_REG16(0x6f12), 0x806f },
+	{ CCI_REG16(0xf46e), 0x00c3 },
+	{ CCI_REG16(0xf46c), 0xbfa0 },
+	{ CCI_REG16(0xf44a), 0x0007 },
+	{ CCI_REG16(0xf456), 0x000a },
+	{ CCI_REG16(0x6028), 0x2000 },
+	{ CCI_REG16(0x602a), 0x12f6 },
+	{ CCI_REG16(0x6f12), 0x7008 },
+	{ CCI_REG16(0x0bc6), 0x0000 },
+	{ CCI_REG16(0x0b36), 0x0001 },
+};
+
+static const struct cci_reg_sequence s5k3m5_4208x3120_30fps_mode[] = {
+	{ CCI_REG16(0x6214), 0x7971 },
+	{ CCI_REG16(0x6218), 0x7150 },
+	{ S5K3M5_REG_X_ADDR_START,  0x0000 },
+	{ S5K3M5_REG_Y_ADDR_START,  0x0008 },
+	{ S5K3M5_REG_X_ADDR_END,    0x1077 },
+	{ S5K3M5_REG_Y_ADDR_END,    0x0c37 },
+	{ S5K3M5_REG_X_OUTPUT_SIZE, 0x1070 },
+	{ S5K3M5_REG_Y_OUTPUT_SIZE, 0x0c30 },
+	{ S5K3M5_REG_VTS, 0x0cf2 },
+	{ S5K3M5_REG_HTS, 0x12f0 },
+
+	{ CCI_REG16(0x0900), 0x0011 },
+	{ CCI_REG16(0x0380), 0x0001 },
+	{ CCI_REG16(0x0382), 0x0001 },
+	{ CCI_REG16(0x0384), 0x0001 },
+	{ CCI_REG16(0x0386), 0x0001 },
+	{ CCI_REG16(0x0402), 0x1010 },
+	{ CCI_REG16(0x0404), 0x1000 },
+	{ CCI_REG16(0x0350), 0x0008 },
+	{ CCI_REG16(0x0352), 0x0000 },
+
+	/* Clock settings */
+	{ CCI_REG16(0x0136), 0x1800 },
+	{ CCI_REG16(0x013e), 0x0000 },
+	{ CCI_REG16(0x0300), 0x0008 },
+	{ CCI_REG16(0x0302), 0x0001 },
+	{ CCI_REG16(0x0304), 0x0006 },
+	{ CCI_REG16(0x0306), 0x00f1 },
+	{ CCI_REG16(0x0308), 0x0008 },
+	{ CCI_REG16(0x030a), 0x0001 },
+	{ CCI_REG16(0x030c), 0x0000 },
+	{ CCI_REG16(0x030e), 0x0003 },
+	{ CCI_REG16(0x0310), 0x005a },
+	{ CCI_REG16(0x0312), 0x0000 },
+
+	{ CCI_REG16(0x0b06), 0x0101 },
+	{ CCI_REG16(0x6028), 0x2000 },
+	{ CCI_REG16(0x602a), 0x1ff6 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x021e), 0x0000 },
+	{ CCI_REG16(0x0202), 0x0100 },
+	{ CCI_REG16(0x0204), 0x0020 },
+	{ CCI_REG16(0x0d00), 0x0100 },
+	{ CCI_REG16(0x0d02), 0x0001 },
+	{ CCI_REG16(0x0114), 0x0301 },
+	{ CCI_REG16(0x0d06), 0x0208 },
+	{ CCI_REG16(0x0d08), 0x0300 },
+	{ CCI_REG16(0x6028), 0x2000 },
+	{ CCI_REG16(0x602a), 0x0f10 },
+	{ CCI_REG16(0x6f12), 0x0003 },
+	{ CCI_REG16(0x602a), 0x0f12 },
+	{ CCI_REG16(0x6f12), 0x0200 },
+	{ CCI_REG16(0x602a), 0x2bc0 },
+	{ CCI_REG16(0x6f12), 0x0001 },
+	{ CCI_REG16(0x0b30), 0x0000 },
+	{ CCI_REG16(0x0b32), 0x0000 },
+	{ CCI_REG16(0x0b34), 0x0001 },
+	{ CCI_REG16(0x0804), 0x0200 },
+	{ CCI_REG16(0x0810), 0x0020 },
+};
+
+static const struct cci_reg_sequence s5k3m5_2104x1184_60fps_mode[] = {
+	{ CCI_REG16(0x6214), 0x7971 },
+	{ CCI_REG16(0x6218), 0x7150 },
+	{ S5K3M5_REG_X_ADDR_START,  0x0000 },
+	{ S5K3M5_REG_Y_ADDR_START,  0x0180 },
+	{ S5K3M5_REG_X_ADDR_END,    0x1077 },
+	{ S5K3M5_REG_Y_ADDR_END,    0x0abf },
+	{ S5K3M5_REG_X_OUTPUT_SIZE, 0x0838 },
+	{ S5K3M5_REG_Y_OUTPUT_SIZE, 0x04a0 },
+	{ S5K3M5_REG_VTS, 0x0658 },
+	{ S5K3M5_REG_HTS, 0x1340 },
+
+	{ CCI_REG16(0x0900), 0x0112 },
+	{ CCI_REG16(0x0380), 0x0001 },
+	{ CCI_REG16(0x0382), 0x0001 },
+	{ CCI_REG16(0x0384), 0x0001 },
+	{ CCI_REG16(0x0386), 0x0003 },
+	{ CCI_REG16(0x0402), 0x1010 },
+	{ CCI_REG16(0x0404), 0x2000 },
+	{ CCI_REG16(0x0350), 0x0004 },
+	{ CCI_REG16(0x0352), 0x0000 },
+
+	/* Clock settings */
+	{ CCI_REG16(0x0136), 0x1800 },
+	{ CCI_REG16(0x013e), 0x0000 },
+	{ CCI_REG16(0x0300), 0x0008 },
+	{ CCI_REG16(0x0302), 0x0001 },
+	{ CCI_REG16(0x0304), 0x0006 },
+	{ CCI_REG16(0x0306), 0x00f1 },
+	{ CCI_REG16(0x0308), 0x0008 },
+	{ CCI_REG16(0x030a), 0x0001 },
+	{ CCI_REG16(0x030c), 0x0000 },
+	{ CCI_REG16(0x030e), 0x0003 },
+	{ CCI_REG16(0x0310), 0x0063 },
+	{ CCI_REG16(0x0312), 0x0001 },
+
+	{ CCI_REG16(0x0b06), 0x0101 },
+	{ CCI_REG16(0x6028), 0x2000 },
+	{ CCI_REG16(0x602a), 0x1ff6 },
+	{ CCI_REG16(0x6f12), 0x0000 },
+	{ CCI_REG16(0x021e), 0x0000 },
+	{ CCI_REG16(0x0202), 0x0100 },
+	{ CCI_REG16(0x0204), 0x0020 },
+	{ CCI_REG16(0x0d00), 0x0101 },
+	{ CCI_REG16(0x0d02), 0x0101 },
+	{ CCI_REG16(0x0114), 0x0301 },
+	{ CCI_REG16(0x0d06), 0x0208 },
+	{ CCI_REG16(0x0d08), 0x0300 },
+	{ CCI_REG16(0x6028), 0x2000 },
+	{ CCI_REG16(0x602a), 0x0f10 },
+	{ CCI_REG16(0x6f12), 0x0003 },
+	{ CCI_REG16(0x602a), 0x0f12 },
+	{ CCI_REG16(0x6f12), 0x0200 },
+	{ CCI_REG16(0x602a), 0x2bc0 },
+	{ CCI_REG16(0x6f12), 0x0001 },
+	{ CCI_REG16(0x0b30), 0x0000 },
+	{ CCI_REG16(0x0b32), 0x0000 },
+	{ CCI_REG16(0x0b34), 0x0001 },
+	{ CCI_REG16(0x0804), 0x0200 },
+	{ CCI_REG16(0x0810), 0x0020 },
+};
+
+static const struct s5k3m5_mode s5k3m5_supported_modes[] = {
+	{
+		.width = 4208,
+		.height = 3120,
+		.hts = 4848,
+		.vts = 3314,
+		.exposure = 256,
+		.reg_list = {
+			.regs = s5k3m5_4208x3120_30fps_mode,
+			.num_regs = ARRAY_SIZE(s5k3m5_4208x3120_30fps_mode),
+		},
+	},
+	{
+		.width = 2104,
+		.height = 1184,
+		.hts = 4928,
+		.vts = 1624,
+		.exposure = 256,
+		.reg_list = {
+			.regs = s5k3m5_2104x1184_60fps_mode,
+			.num_regs = ARRAY_SIZE(s5k3m5_2104x1184_60fps_mode),
+		},
+	},
+};
+
+static int s5k3m5_set_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct s5k3m5 *s5k3m5 = container_of(ctrl->handler, struct s5k3m5,
+					     ctrl_handler);
+	const struct s5k3m5_mode *mode = s5k3m5->mode;
+	s64 exposure_max;
+	int ret;
+
+	/* Propagate change of current control to all related controls */
+	switch (ctrl->id) {
+	case V4L2_CID_HFLIP:
+	case V4L2_CID_VFLIP:
+		/* The orientation settings are applied along with streaming */
+		return 0;
+	case V4L2_CID_VBLANK:
+		/* Update max exposure while meeting expected vblanking */
+		exposure_max = mode->height + ctrl->val - S5K3M5_EXPOSURE_MARGIN;
+		__v4l2_ctrl_modify_range(s5k3m5->exposure,
+					 s5k3m5->exposure->minimum,
+					 exposure_max,
+					 s5k3m5->exposure->step,
+					 s5k3m5->exposure->default_value);
+		break;
+	}
+
+	/* V4L2 controls are applied, when sensor is powered up for streaming */
+	if (!pm_runtime_get_if_active(s5k3m5->dev))
+		return 0;
+
+	switch (ctrl->id) {
+	case V4L2_CID_ANALOGUE_GAIN:
+		ret = cci_write(s5k3m5->regmap, S5K3M5_REG_AGAIN,
+				ctrl->val << S5K3M5_AGAIN_SHIFT, NULL);
+		break;
+	case V4L2_CID_EXPOSURE:
+		ret = cci_write(s5k3m5->regmap, S5K3M5_REG_EXPOSURE,
+				ctrl->val, NULL);
+		break;
+	case V4L2_CID_VBLANK:
+		ret = cci_write(s5k3m5->regmap, S5K3M5_REG_VTS,
+				ctrl->val + mode->height, NULL);
+		break;
+	case V4L2_CID_TEST_PATTERN:
+		ret = cci_write(s5k3m5->regmap, S5K3M5_REG_TEST_PATTERN,
+				ctrl->val, NULL);
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	pm_runtime_put(s5k3m5->dev);
+
+	return ret;
+}
+
+static const struct v4l2_ctrl_ops s5k3m5_ctrl_ops = {
+	.s_ctrl = s5k3m5_set_ctrl,
+};
+
+static inline u64 s5k3m5_freq_to_pixel_rate(const u64 freq)
+{
+	return div_u64(freq * 2 * S5K3M5_DATA_LANES, 10);
+}
+
+static int s5k3m5_init_controls(struct s5k3m5 *s5k3m5)
+{
+	struct v4l2_ctrl_handler *ctrl_hdlr = &s5k3m5->ctrl_handler;
+	const struct s5k3m5_mode *mode = s5k3m5->mode;
+	s64 pixel_rate, hblank, vblank, exposure_max;
+	struct v4l2_fwnode_device_properties props;
+	int ret;
+
+	v4l2_ctrl_handler_init(ctrl_hdlr, 9);
+
+	s5k3m5->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &s5k3m5_ctrl_ops,
+					V4L2_CID_LINK_FREQ,
+					ARRAY_SIZE(s5k3m5_link_freq_menu) - 1,
+					0, s5k3m5_link_freq_menu);
+	if (s5k3m5->link_freq)
+		s5k3m5->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	pixel_rate = s5k3m5_freq_to_pixel_rate(s5k3m5_link_freq_menu[0]);
+	s5k3m5->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &s5k3m5_ctrl_ops,
+					       V4L2_CID_PIXEL_RATE,
+					       0, pixel_rate, 1, pixel_rate);
+
+	hblank = mode->hts - mode->width;
+	s5k3m5->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &s5k3m5_ctrl_ops,
+					   V4L2_CID_HBLANK, hblank,
+					   hblank, 1, hblank);
+	if (s5k3m5->hblank)
+		s5k3m5->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	vblank = mode->vts - mode->height;
+	s5k3m5->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &s5k3m5_ctrl_ops,
+					   V4L2_CID_VBLANK, vblank,
+					   S5K3M5_VTS_MAX - mode->height, 1,
+					   vblank);
+
+	v4l2_ctrl_new_std(ctrl_hdlr, &s5k3m5_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
+			  S5K3M5_AGAIN_MIN, S5K3M5_AGAIN_MAX,
+			  S5K3M5_AGAIN_STEP, S5K3M5_AGAIN_DEFAULT);
+
+	exposure_max = mode->vts - S5K3M5_EXPOSURE_MARGIN;
+	s5k3m5->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &s5k3m5_ctrl_ops,
+					     V4L2_CID_EXPOSURE,
+					     S5K3M5_EXPOSURE_MIN,
+					     exposure_max,
+					     S5K3M5_EXPOSURE_STEP,
+					     mode->exposure);
+
+	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &s5k3m5_ctrl_ops,
+				     V4L2_CID_TEST_PATTERN,
+				     ARRAY_SIZE(s5k3m5_test_pattern_menu) - 1,
+				     0, 0, s5k3m5_test_pattern_menu);
+
+	s5k3m5->hflip = v4l2_ctrl_new_std(ctrl_hdlr, &s5k3m5_ctrl_ops,
+					  V4L2_CID_HFLIP, 0, 1, 1, 0);
+	if (s5k3m5->hflip)
+		s5k3m5->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
+
+	s5k3m5->vflip = v4l2_ctrl_new_std(ctrl_hdlr, &s5k3m5_ctrl_ops,
+					  V4L2_CID_VFLIP, 0, 1, 1, 0);
+	if (s5k3m5->vflip)
+		s5k3m5->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
+
+	ret = v4l2_fwnode_device_parse(s5k3m5->dev, &props);
+	if (ret)
+		goto error_free_hdlr;
+
+	ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &s5k3m5_ctrl_ops,
+					      &props);
+	if (ret)
+		goto error_free_hdlr;
+
+	s5k3m5->sd.ctrl_handler = ctrl_hdlr;
+
+	return 0;
+
+error_free_hdlr:
+	v4l2_ctrl_handler_free(ctrl_hdlr);
+
+	return ret;
+}
+
+static int s5k3m5_enable_streams(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state, u32 pad,
+				 u64 streams_mask)
+{
+	struct s5k3m5 *s5k3m5 = to_s5k3m5(sd);
+	const struct s5k3m5_reg_list *reg_list = &s5k3m5->mode->reg_list;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(s5k3m5->dev);
+	if (ret)
+		return ret;
+
+	/* Page pointer */
+	cci_write(s5k3m5->regmap, CCI_REG16(0x6028), 0x4000, &ret);
+
+	/* Set version */
+	cci_write(s5k3m5->regmap, CCI_REG16(0x0000), 0x0006, &ret);
+	cci_write(s5k3m5->regmap, CCI_REG16(0x0000), S5K3M5_CHIP_ID, &ret);
+	cci_write(s5k3m5->regmap, CCI_REG16(0x6214), 0x7971, &ret);
+	cci_write(s5k3m5->regmap, CCI_REG16(0x6218), 0x7150, &ret);
+	if (ret)
+		goto error;
+
+	usleep_range(4 * USEC_PER_MSEC, 5 * USEC_PER_MSEC);
+
+	cci_write(s5k3m5->regmap, CCI_REG16(0x0a02), 0x7800, &ret);
+	cci_write(s5k3m5->regmap, CCI_REG16(0x6028), 0x2000, &ret);
+	cci_write(s5k3m5->regmap, CCI_REG16(0x602a), 0x3eac, &ret);
+
+	/* Sensor init settings */
+	cci_multi_reg_write(s5k3m5->regmap, burst_array_setting,
+			    ARRAY_SIZE(burst_array_setting), &ret);
+	cci_multi_reg_write(s5k3m5->regmap, init_array_setting,
+			    ARRAY_SIZE(init_array_setting), &ret);
+	cci_multi_reg_write(s5k3m5->regmap, reg_list->regs,
+			    reg_list->num_regs, &ret);
+	if (ret)
+		goto error;
+
+	ret = __v4l2_ctrl_handler_setup(s5k3m5->sd.ctrl_handler);
+
+	cci_write(s5k3m5->regmap, S5K3M5_REG_CTRL_MODE,
+		  S5K3M5_MODE_STREAMING |
+		  (s5k3m5->vflip->val ? S5K3M5_VFLIP : 0) |
+		  (s5k3m5->hflip->val ? S5K3M5_HFLIP : 0), &ret);
+	if (ret)
+		goto error;
+
+	return 0;
+
+error:
+	dev_err(s5k3m5->dev, "failed to start streaming: %d\n", ret);
+	pm_runtime_put_autosuspend(s5k3m5->dev);
+
+	return ret;
+}
+
+static int s5k3m5_disable_streams(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state, u32 pad,
+				  u64 streams_mask)
+{
+	struct s5k3m5 *s5k3m5 = to_s5k3m5(sd);
+	int ret;
+
+	ret = cci_write(s5k3m5->regmap, S5K3M5_REG_CTRL_MODE, 0, NULL);
+	if (ret)
+		dev_err(s5k3m5->dev, "failed to stop streaming: %d\n", ret);
+
+	pm_runtime_put_autosuspend(s5k3m5->dev);
+
+	return ret;
+}
+
+static u32 s5k3m5_get_format_code(struct s5k3m5 *s5k3m5)
+{
+	unsigned int i;
+
+	i = (s5k3m5->vflip->val ? 2 : 0) | (s5k3m5->hflip->val ? 1 : 0);
+
+	return s5k3m5_mbus_formats[i];
+}
+
+static void s5k3m5_update_pad_format(struct s5k3m5 *s5k3m5,
+				     const struct s5k3m5_mode *mode,
+				     struct v4l2_mbus_framefmt *fmt)
+{
+	fmt->code = s5k3m5_get_format_code(s5k3m5);
+	fmt->width = mode->width;
+	fmt->height = mode->height;
+	fmt->field = V4L2_FIELD_NONE;
+	fmt->colorspace = V4L2_COLORSPACE_SRGB;
+	fmt->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
+	fmt->xfer_func = V4L2_XFER_FUNC_NONE;
+}
+
+static int s5k3m5_set_pad_format(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state,
+				 struct v4l2_subdev_format *fmt)
+{
+	struct s5k3m5 *s5k3m5 = to_s5k3m5(sd);
+	s64 hblank, vblank, exposure_max;
+	const struct s5k3m5_mode *mode;
+
+	mode = v4l2_find_nearest_size(s5k3m5_supported_modes,
+				      ARRAY_SIZE(s5k3m5_supported_modes),
+				      width, height,
+				      fmt->format.width, fmt->format.height);
+
+	s5k3m5_update_pad_format(s5k3m5, mode, &fmt->format);
+
+	/* Format code could be updated with respect to flip controls */
+	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY || s5k3m5->mode == mode)
+		goto set_format;
+
+	/* Update limits and set FPS and exposure to default values */
+	hblank = mode->hts - mode->width;
+	__v4l2_ctrl_modify_range(s5k3m5->hblank, hblank, hblank, 1, hblank);
+
+	vblank = mode->vts - mode->height;
+	__v4l2_ctrl_modify_range(s5k3m5->vblank, vblank,
+				 S5K3M5_VTS_MAX - mode->height, 1, vblank);
+	__v4l2_ctrl_s_ctrl(s5k3m5->vblank, vblank);
+
+	exposure_max = mode->vts - S5K3M5_EXPOSURE_MARGIN;
+	__v4l2_ctrl_modify_range(s5k3m5->exposure, S5K3M5_EXPOSURE_MIN,
+				 exposure_max, S5K3M5_EXPOSURE_STEP,
+				 mode->exposure);
+	__v4l2_ctrl_s_ctrl(s5k3m5->exposure, mode->exposure);
+
+	if (s5k3m5->sd.ctrl_handler->error)
+		return s5k3m5->sd.ctrl_handler->error;
+
+	s5k3m5->mode = mode;
+
+set_format:
+	*v4l2_subdev_state_get_format(state, 0) = fmt->format;
+
+	return 0;
+}
+
+static int s5k3m5_enum_mbus_code(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *sd_state,
+				 struct v4l2_subdev_mbus_code_enum *code)
+{
+	struct s5k3m5 *s5k3m5 = to_s5k3m5(sd);
+
+	/* Media bus code index is constant, but code formats are not */
+	if (code->index > 0)
+		return -EINVAL;
+
+	code->code = s5k3m5_get_format_code(s5k3m5);
+
+	return 0;
+}
+
+static int s5k3m5_enum_frame_size(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *sd_state,
+				  struct v4l2_subdev_frame_size_enum *fse)
+{
+	struct s5k3m5 *s5k3m5 = to_s5k3m5(sd);
+
+	if (fse->index >= ARRAY_SIZE(s5k3m5_supported_modes))
+		return -EINVAL;
+
+	if (fse->code != s5k3m5_get_format_code(s5k3m5))
+		return -EINVAL;
+
+	fse->min_width = s5k3m5_supported_modes[fse->index].width;
+	fse->max_width = fse->min_width;
+	fse->min_height = s5k3m5_supported_modes[fse->index].height;
+	fse->max_height = fse->min_height;
+
+	return 0;
+}
+
+static int s5k3m5_get_selection(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *sd_state,
+				struct v4l2_subdev_selection *sel)
+{
+	struct s5k3m5 *s5k3m5 = to_s5k3m5(sd);
+
+	if (sel->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		sel->r.left = 0;
+		sel->r.top = 0;
+		sel->r.width = s5k3m5->mode->width;
+		sel->r.height = s5k3m5->mode->width;
+		return 0;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int s5k3m5_init_state(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *state)
+{
+	struct s5k3m5 *s5k3m5 = to_s5k3m5(sd);
+	struct v4l2_subdev_format fmt = {
+		.which = V4L2_SUBDEV_FORMAT_TRY,
+		.pad = 0,
+		.format = {
+			/* Media bus code depends on current flip controls */
+			.width = s5k3m5->mode->width,
+			.height = s5k3m5->mode->height,
+		},
+	};
+
+	s5k3m5_set_pad_format(sd, state, &fmt);
+
+	return 0;
+}
+
+static const struct v4l2_subdev_video_ops s5k3m5_video_ops = {
+	.s_stream = v4l2_subdev_s_stream_helper,
+};
+
+static const struct v4l2_subdev_pad_ops s5k3m5_pad_ops = {
+	.set_fmt = s5k3m5_set_pad_format,
+	.get_fmt = v4l2_subdev_get_fmt,
+	.get_selection = s5k3m5_get_selection,
+	.enum_mbus_code = s5k3m5_enum_mbus_code,
+	.enum_frame_size = s5k3m5_enum_frame_size,
+	.enable_streams = s5k3m5_enable_streams,
+	.disable_streams = s5k3m5_disable_streams,
+};
+
+static const struct v4l2_subdev_ops s5k3m5_subdev_ops = {
+	.video = &s5k3m5_video_ops,
+	.pad = &s5k3m5_pad_ops,
+};
+
+static const struct v4l2_subdev_internal_ops s5k3m5_internal_ops = {
+	.init_state = s5k3m5_init_state,
+};
+
+static const struct media_entity_operations s5k3m5_subdev_entity_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+};
+
+static int s5k3m5_identify_sensor(struct s5k3m5 *s5k3m5)
+{
+	u64 val;
+	int ret;
+
+	ret = cci_read(s5k3m5->regmap, S5K3M5_REG_CHIP_ID, &val, NULL);
+	if (ret) {
+		dev_err(s5k3m5->dev, "failed to read chip id: %d\n", ret);
+		return ret;
+	}
+
+	if (val != S5K3M5_CHIP_ID) {
+		dev_err(s5k3m5->dev, "chip id mismatch: %x!=%llx\n",
+			S5K3M5_CHIP_ID, val);
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
+static int s5k3m5_check_hwcfg(struct s5k3m5 *s5k3m5)
+{
+	struct fwnode_handle *fwnode = dev_fwnode(s5k3m5->dev), *ep;
+	struct v4l2_fwnode_endpoint bus_cfg = {
+		.bus = {
+			.mipi_csi2 = {
+				.num_data_lanes = S5K3M5_DATA_LANES,
+			},
+		},
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
+	if (bus_cfg.bus.mipi_csi2.num_data_lanes != S5K3M5_DATA_LANES) {
+		dev_err(s5k3m5->dev, "Invalid number of data lanes: %u\n",
+			bus_cfg.bus.mipi_csi2.num_data_lanes);
+		ret = -EINVAL;
+		goto endpoint_free;
+	}
+
+	ret = v4l2_link_freq_to_bitmap(s5k3m5->dev, bus_cfg.link_frequencies,
+				       bus_cfg.nr_of_link_frequencies,
+				       s5k3m5_link_freq_menu,
+				       ARRAY_SIZE(s5k3m5_link_freq_menu),
+				       &freq_bitmap);
+
+endpoint_free:
+	v4l2_fwnode_endpoint_free(&bus_cfg);
+
+	return ret;
+}
+
+static int s5k3m5_power_on(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct s5k3m5 *s5k3m5 = to_s5k3m5(sd);
+	int ret;
+
+	ret = regulator_bulk_enable(S5K3M5_NUM_SUPPLIES, s5k3m5->supplies);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(s5k3m5->mclk);
+	if (ret)
+		goto disable_regulators;
+
+	gpiod_set_value_cansleep(s5k3m5->reset_gpio, 0);
+	usleep_range(10 * USEC_PER_MSEC, 15 * USEC_PER_MSEC);
+
+	return 0;
+
+disable_regulators:
+	regulator_bulk_disable(S5K3M5_NUM_SUPPLIES, s5k3m5->supplies);
+
+	return ret;
+}
+
+static int s5k3m5_power_off(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct s5k3m5 *s5k3m5 = to_s5k3m5(sd);
+
+	gpiod_set_value_cansleep(s5k3m5->reset_gpio, 1);
+
+	clk_disable_unprepare(s5k3m5->mclk);
+
+	regulator_bulk_disable(S5K3M5_NUM_SUPPLIES, s5k3m5->supplies);
+
+	return 0;
+}
+
+static int s5k3m5_probe(struct i2c_client *client)
+{
+	struct s5k3m5 *s5k3m5;
+	unsigned long freq;
+	unsigned int i;
+	int ret;
+
+	s5k3m5 = devm_kzalloc(&client->dev, sizeof(*s5k3m5), GFP_KERNEL);
+	if (!s5k3m5)
+		return -ENOMEM;
+
+	s5k3m5->dev = &client->dev;
+	v4l2_i2c_subdev_init(&s5k3m5->sd, client, &s5k3m5_subdev_ops);
+
+	s5k3m5->regmap = devm_cci_regmap_init_i2c(client, 16);
+	if (IS_ERR(s5k3m5->regmap))
+		return dev_err_probe(s5k3m5->dev, PTR_ERR(s5k3m5->regmap),
+				     "failed to init CCI\n");
+
+	s5k3m5->mclk = devm_v4l2_sensor_clk_get(s5k3m5->dev, NULL);
+	if (IS_ERR(s5k3m5->mclk))
+		return dev_err_probe(s5k3m5->dev, PTR_ERR(s5k3m5->mclk),
+				     "failed to get MCLK clock\n");
+
+	freq = clk_get_rate(s5k3m5->mclk);
+	if (freq != S5K3M5_MCLK_FREQ_24MHZ)
+		return dev_err_probe(s5k3m5->dev, -EINVAL,
+				     "MCLK clock frequency %lu is not supported\n",
+				     freq);
+
+	ret = s5k3m5_check_hwcfg(s5k3m5);
+	if (ret)
+		return dev_err_probe(s5k3m5->dev, ret,
+				     "failed to check HW configuration\n");
+
+	s5k3m5->reset_gpio = devm_gpiod_get_optional(s5k3m5->dev, "reset",
+						     GPIOD_OUT_HIGH);
+	if (IS_ERR(s5k3m5->reset_gpio))
+		return dev_err_probe(s5k3m5->dev, PTR_ERR(s5k3m5->reset_gpio),
+				     "cannot get reset GPIO\n");
+
+	for (i = 0; i < S5K3M5_NUM_SUPPLIES; i++)
+		s5k3m5->supplies[i].supply = s5k3m5_supply_names[i];
+
+	ret = devm_regulator_bulk_get(s5k3m5->dev, S5K3M5_NUM_SUPPLIES,
+				      s5k3m5->supplies);
+	if (ret)
+		return dev_err_probe(s5k3m5->dev, ret,
+				     "failed to get supply regulators\n");
+
+	/* The sensor must be powered on to read the CHIP_ID register */
+	ret = s5k3m5_power_on(s5k3m5->dev);
+	if (ret)
+		return ret;
+
+	ret = s5k3m5_identify_sensor(s5k3m5);
+	if (ret) {
+		dev_err_probe(s5k3m5->dev, ret, "failed to find sensor\n");
+		goto power_off;
+	}
+
+	s5k3m5->mode = &s5k3m5_supported_modes[0];
+	ret = s5k3m5_init_controls(s5k3m5);
+	if (ret) {
+		dev_err_probe(s5k3m5->dev, ret, "failed to init controls\n");
+		goto power_off;
+	}
+
+	s5k3m5->sd.state_lock = s5k3m5->ctrl_handler.lock;
+	s5k3m5->sd.internal_ops = &s5k3m5_internal_ops;
+	s5k3m5->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	s5k3m5->sd.entity.ops = &s5k3m5_subdev_entity_ops;
+	s5k3m5->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
+	s5k3m5->pad.flags = MEDIA_PAD_FL_SOURCE;
+
+	ret = media_entity_pads_init(&s5k3m5->sd.entity, 1, &s5k3m5->pad);
+	if (ret) {
+		dev_err_probe(s5k3m5->dev, ret,
+			      "failed to init media entity pads\n");
+		goto v4l2_ctrl_handler_free;
+	}
+
+	ret = v4l2_subdev_init_finalize(&s5k3m5->sd);
+	if (ret < 0) {
+		dev_err_probe(s5k3m5->dev, ret,
+			      "failed to init media entity pads\n");
+		goto media_entity_cleanup;
+	}
+
+	pm_runtime_set_active(s5k3m5->dev);
+	pm_runtime_enable(s5k3m5->dev);
+
+	ret = v4l2_async_register_subdev_sensor(&s5k3m5->sd);
+	if (ret < 0) {
+		dev_err_probe(s5k3m5->dev, ret,
+			      "failed to register V4L2 subdev\n");
+		goto subdev_cleanup;
+	}
+
+	pm_runtime_set_autosuspend_delay(s5k3m5->dev, 1000);
+	pm_runtime_use_autosuspend(s5k3m5->dev);
+	pm_runtime_idle(s5k3m5->dev);
+
+	return 0;
+
+subdev_cleanup:
+	v4l2_subdev_cleanup(&s5k3m5->sd);
+	pm_runtime_disable(s5k3m5->dev);
+	pm_runtime_set_suspended(s5k3m5->dev);
+
+media_entity_cleanup:
+	media_entity_cleanup(&s5k3m5->sd.entity);
+
+v4l2_ctrl_handler_free:
+	v4l2_ctrl_handler_free(s5k3m5->sd.ctrl_handler);
+
+power_off:
+	s5k3m5_power_off(s5k3m5->dev);
+
+	return ret;
+}
+
+static void s5k3m5_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct s5k3m5 *s5k3m5 = to_s5k3m5(sd);
+
+	v4l2_async_unregister_subdev(sd);
+	v4l2_subdev_cleanup(sd);
+	media_entity_cleanup(&sd->entity);
+	v4l2_ctrl_handler_free(sd->ctrl_handler);
+	pm_runtime_disable(s5k3m5->dev);
+
+	if (!pm_runtime_status_suspended(s5k3m5->dev)) {
+		s5k3m5_power_off(s5k3m5->dev);
+		pm_runtime_set_suspended(s5k3m5->dev);
+	}
+}
+
+static const struct dev_pm_ops s5k3m5_pm_ops = {
+	SET_RUNTIME_PM_OPS(s5k3m5_power_off, s5k3m5_power_on, NULL)
+};
+
+static const struct of_device_id s5k3m5_of_match[] = {
+	{ .compatible = "samsung,s5k3m5" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, s5k3m5_of_match);
+
+static struct i2c_driver s5k3m5_i2c_driver = {
+	.driver = {
+		.name = "s5k3m5",
+		.pm = &s5k3m5_pm_ops,
+		.of_match_table = s5k3m5_of_match,
+	},
+	.probe = s5k3m5_probe,
+	.remove = s5k3m5_remove,
+};
+
+module_i2c_driver(s5k3m5_i2c_driver);
+
+MODULE_AUTHOR("Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>");
+MODULE_DESCRIPTION("Samsung S5K3M5 image sensor driver");
+MODULE_LICENSE("GPL");
-- 
2.49.0


