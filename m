Return-Path: <linux-media+bounces-49028-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2E4CC9ADC
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 23:17:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 24826303DD34
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 22:17:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9FD430F546;
	Wed, 17 Dec 2025 22:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=schnwalter.eu header.i=@schnwalter.eu header.b="IZGAx/5K";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="lrwWDfQj"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784DD288513
	for <linux-media@vger.kernel.org>; Wed, 17 Dec 2025 22:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766009823; cv=none; b=MEEyHUs4hXSe0KmbQixScjbwc9WXP+EYZLKgbknnQ1N6GqM3+1xsqp4L0quSiLIjFL+RgMeLWYoglRVivsc8dkFHrRB3Z01f/2fROxDMu5+YXjAUf9yQWpGOyMDiCug4hFBwwCg48jYu2+l5QG52CtZ16Lrt3zYDzXhrObJW6/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766009823; c=relaxed/simple;
	bh=/iOHZ3EVKb/eiVFQlu8kpB+hSVQeP9fYLoN3fZJ8gL8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m7ZUdysD5NhbEQKDPbPQ/nnoE98uKMWIfveRzAqN/UNS7inlZ/4bvSHWKpSR0KZM5YCZgiRMlFcpuwL0pYTbaTAjaWx8cogbmsQS0KbdVnVTpK5gPibaklsQP95HxF9bzVLloAhiiwa2rLZYs0vAATB2x1QRo/WwdFFyzt6K5UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=schnwalter.eu; spf=pass smtp.mailfrom=schnwalter.eu; dkim=pass (2048-bit key) header.d=schnwalter.eu header.i=@schnwalter.eu header.b=IZGAx/5K; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=lrwWDfQj; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=schnwalter.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=schnwalter.eu
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 9A6411D00045;
	Wed, 17 Dec 2025 17:16:59 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 17 Dec 2025 17:16:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=schnwalter.eu;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1766009819; x=1766096219; bh=u+w5CS24zlE8nZYndz6isRdM64kRXKsM
	IaU2K37craE=; b=IZGAx/5KY/6kKFv49eKErG8mzzO8PXmmfAVI7ZuqSj1QEbf7
	DJn1A5m+w9zXex7ZM3JO2xJKeBSQKw40ZAVmaE7D7mnWWXpLucvjvBVI2NubBst/
	MHpjxbPIF7AIPttFLi9ySydD8M3puhgvh3LMXBMBV6Snx8xe9/uNqMT6veQHqJup
	4ffDa8zg8uuaRYbid+HWJRXNtqFk4ayHO8kPR8blztobEpdabdxHQKwm5Li6Ql9T
	Ne01X852Pc+7rzoaXkpcDnB0FOj+tlJYBeVPSaE8Rm6rwY8IPhNlgFEfU4uFMplU
	Ai6WQh9AbyMEIy3jFPWedi4GybQJw6RR4BZ5Rw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1766009819; x=
	1766096219; bh=u+w5CS24zlE8nZYndz6isRdM64kRXKsMIaU2K37craE=; b=l
	rwWDfQjtLl7+pMD14k8DzFOxQXKOjwe1fUsUmRpX+4ZEhnmeF1ResrUX3nSJtKcg
	aZNA0Wu4wgHI2bMnYysK9VgLu8WsDlTwavzfv2wovr8CIchhdJUyrQrRUyKlwAwF
	x+/7Ja/nlzxi2d/ExekYmT/rxLZOokXE+p4ETKP0fZt89bWTUdvYw+aS2bTZaJYw
	BxL/zExn/2ip911phyFg7Y5NNm3v6ydC95xVelgHahlLhOnziSQe6eCimnrv/OJ4
	32OLtPgJSTOfVr6rC9ZIpTXPDrm9wortUW1QTEV1/u515xSePu6ykDJJRW6whDZa
	tmTrug8kUnAZ0Umll0YNA==
X-ME-Sender: <xms:2ytDaS_ipi81iFmo-2rsYxMmdY2l-zQStHPWrNK_b5sgjqPeF4RX9w>
    <xme:2ytDaQiWuFeSyhHD1L7FOQQbh6tF7tMDhzN9nUz85LuW-sGftk-Xu4Ozp7d8dvUtA
    PjCX22bOaQ8jB7bbNoiUZlABFajYsIGrceO0pgyjXoOLnM9-H3hM-A>
X-ME-Received: <xmr:2ytDaSdHBB1u6U5Bi_u3Prm9KW2iU11DwpFJzU_3ffQXg2Y3Ccg5wPngDenUgI4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdegfeejgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhephggrlhhtvghr
    ucghvghrnhgvrhcuufevjffpgffkfffgtfcuoegtohhnthgrtghtsehstghhnhifrghlth
    gvrhdrvghuqeenucggtffrrghtthgvrhhnpeegleefvdelhefghfffhfdvvdelkeejjeek
    fffggeejhffhgeevveduheetheeileenucffohhmrghinheplhhinhhugihtvhdrohhrgh
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegtohhn
    thgrtghtsehstghhnhifrghlthgvrhdrvghupdhnsggprhgtphhtthhopeegpdhmohguvg
    epshhmthhpohhuthdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgv
    rhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhtrggtthesshgthhhnfigrlhhtvghrrd
    gvuhdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehsrghkrghrihdrrghilhhusheslhhinhhugidrihhnthgvlhdrtghomh
X-ME-Proxy: <xmx:2ytDaXqjSetC9vapb0PjlKef1rSaDgr7RdX0shOzE_X6AedFkx9zMg>
    <xmx:2ytDaXBKnV_eoAsvkEzFO54o-a0XmeGimAadoAN3BQn1fTfJ_JzqHg>
    <xmx:2ytDaUY4RuFpbosaP2YmW3KXZ06_EtiCqI1lpA6Htlm7P0G7dKWIpg>
    <xmx:2ytDaa5sDznRQMdjj4U0TF3UK9PQWEDF0V1zfPBWDOWR5u80UeSkFA>
    <xmx:2ytDabl1YeT1XQscSX0Elz0inMMIyq1VVSKhG8e-5h_OyIKWr34Prsug>
Feedback-ID: i455149b6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Dec 2025 17:16:58 -0500 (EST)
From: Walter Werner SCHNEIDER <contact@schnwalter.eu>
Date: Thu, 18 Dec 2025 00:16:24 +0200
Subject: [PATCH 1/2] media: i2c: Add ov2732 image sensor driver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-ov2732-driver-v1-1-0ceef92c4016@schnwalter.eu>
References: <20251218-ov2732-driver-v1-0-0ceef92c4016@schnwalter.eu>
In-Reply-To: <20251218-ov2732-driver-v1-0-0ceef92c4016@schnwalter.eu>
To: linux-media@vger.kernel.org
Cc: Walter Werner SCHNEIDER <contact@schnwalter.eu>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766009816; l=25451;
 i=contact@schnwalter.eu; s=20251106; h=from:subject:message-id;
 bh=/iOHZ3EVKb/eiVFQlu8kpB+hSVQeP9fYLoN3fZJ8gL8=;
 b=tkjoQxnR4fYRNkFjnvyNpvFG9eyQ8JzHILPSnhq0SnvPFaekMZciBz52DGJUjPs1z8qItTAgm
 s7TmE5E01prBFy/dDzzlG13S3BS4kW91SJDDnrU503g1ga/MDpz+OAp
X-Developer-Key: i=contact@schnwalter.eu; a=ed25519;
 pk=OoafUGtB7zQJLYhKA7ALCjqddXAaem/uP/eb3GGNkTI=

Add a V4L2 subdevice driver for the Omnivision OV2732 sensor.

The OV2732 is a 1/4" color CMOS 1080p (1920x1080) HD image sensor with
programmable controls like: gain, exposure, frame rate, image and windowing
size, horizontal mirror, vertical flip, cropping.

Signed-off-by: Walter Werner SCHNEIDER <contact@schnwalter.eu>
---
 MAINTAINERS                |   6 +
 drivers/media/i2c/Kconfig  |  13 +
 drivers/media/i2c/Makefile |   1 +
 drivers/media/i2c/ov2732.c | 797 +++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 817 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5b11839cba9de1e9e43f63787578edd8c429ca39..62bb866e4fed1187f8be12e7f41a175e0bdc701e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19308,6 +19308,12 @@ T:	git git://linuxtv.org/media.git
 F:	Documentation/devicetree/bindings/media/i2c/ovti,ov2685.yaml
 F:	drivers/media/i2c/ov2685.c
 
+OMNIVISION OV2732 SENSOR DRIVER
+M:	Walter Werner SCHNEIDER <contact@schnwalter.eu>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	drivers/media/i2c/ov2732.c
+
 OMNIVISION OV2735 SENSOR DRIVER
 M:	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
 M:	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 4b4db8c4f49657e19018535927eb41f7ad2a4f80..9dc60091c99b18d034d78efda4eff501dedc5d33 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -477,6 +477,19 @@ config VIDEO_OV2685
 	  To compile this driver as a module, choose M here: the
 	  module will be called ov2685.
 
+config VIDEO_OV2732
+	tristate "OmniVision OV2732 sensor support"
+	depends on OF
+	select MEDIA_CONTROLLER
+	select V4L2_CCI_I2C
+	select VIDEO_V4L2_SUBDEV_API
+	help
+	  This is a Video4Linux2 sensor driver for the OmniVision
+	  OV2732 camera.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called ov2732.
+
 config VIDEO_OV2735
 	tristate "OmniVision OV2735 sensor support"
 	select V4L2_CCI_I2C
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index c5f17602454ffaa698a925f508244a7ddbb60e0f..d6435ea5cc12fdada181bf3e2885ceff4d5a23fa 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -96,6 +96,7 @@ obj-$(CONFIG_VIDEO_OV2640) += ov2640.o
 obj-$(CONFIG_VIDEO_OV2659) += ov2659.o
 obj-$(CONFIG_VIDEO_OV2680) += ov2680.o
 obj-$(CONFIG_VIDEO_OV2685) += ov2685.o
+obj-$(CONFIG_VIDEO_OV2732) += ov2732.o
 obj-$(CONFIG_VIDEO_OV2735) += ov2735.o
 obj-$(CONFIG_VIDEO_OV2740) += ov2740.o
 obj-$(CONFIG_VIDEO_OV4689) += ov4689.o
diff --git a/drivers/media/i2c/ov2732.c b/drivers/media/i2c/ov2732.c
new file mode 100644
index 0000000000000000000000000000000000000000..7266cf07c886aa75e94163ab07d77eb390392593
--- /dev/null
+++ b/drivers/media/i2c/ov2732.c
@@ -0,0 +1,797 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ov2732 driver
+ *
+ * Copyright (C) 2017 Fuzhou Rockchip Electronics Co., Ltd.
+ * Copyright (C) 2025 Walter Werner SCHNEIDER <contact@schnwalter.eu>
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
+#include <media/v4l2-cci.h>
+#include <media/v4l2-common.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
+
+#define OV2732_LANES				2
+#define OV2732_BITS_PER_SAMPLE			10
+#define OV2732_LINK_FREQ_DEFAULT		360000000
+#define OV2732_XVCLK_FREQ			24000000
+#define OV2732_PIXEL_RATE			\
+	(OV2732_LINK_FREQ_DEFAULT * 2 * OV2732_LANES / OV2732_BITS_PER_SAMPLE)
+#define OV2732_NATIVE_WIDTH			1920U
+#define OV2732_NATIVE_HEIGHT			1080U
+
+/* Delay from power up to the first SCCB transaction. */
+#define OV2732_POWER_UP_DELAY_CYCLES		8192
+/* Delay from the last SCCB transaction to power down. */
+#define OV2732_POWER_DOWN_DELAY_CYCLES		512
+#define OV2732_DELAY_US(cycles)			\
+	(DIV_ROUND_UP((cycles), OV2732_XVCLK_FREQ / USEC_PER_SEC))
+
+#define OV2732_REG_CHIP_ID			CCI_REG24(0x300a)
+#define OV2732_CHIP_ID				0x002732
+
+#define OV2732_REG_MODE_SELECT			CCI_REG8(0x0100)
+#define OV2732_MODE_STANDBY			0x00
+#define OV2732_MODE_STREAMING			0x01
+
+#define OV2732_REG_ANALOGUE_GAIN		CCI_REG24(0x3508)
+#define OV2732_REG_DIGITAL_GAIN			CCI_REG24(0x350a)
+#define OV2732_REG_EXPOSURE			CCI_REG24(0x3500)
+#define OV2732_REG_HTS				CCI_REG16(0x380c)
+#define OV2732_REG_VTS				CCI_REG16(0x380e)
+#define OV2732_ANALOGUE_GAIN_MIN		0x80
+#define OV2732_ANALOGUE_GAIN_MAX		0x3fff
+#define OV2732_ANALOGUE_GAIN_DEFAULT		0x80
+#define OV2732_DIGITAL_GAIN_MIN			0x00
+#define OV2732_DIGITAL_GAIN_MAX			0x1fff
+#define OV2732_DIGITAL_GAIN_DEFAULT		0x0400
+#define OV2732_EXPOSURE_DEFAULT			0x640
+#define OV2732_EXPOSURE_MIN			0x10
+#define OV2732_EXPOSURE_OFFSET			4
+#define OV2732_HBLANK_DEFAULT			0x0068
+#define OV2732_VTS_MAX				0x7FFF
+
+#define OV2732_REG_TEST_PATTERN			CCI_REG8(0x5080)
+#define OV2732_TEST_PATTERN_DISABLE		0x00
+#define OV2732_TEST_PATTERN_BAR1		0x80
+#define OV2732_TEST_PATTERN_BAR2		0x84
+#define OV2732_TEST_PATTERN_BAR3		0x88
+#define OV2732_TEST_PATTERN_BAR4		0x8c
+
+static const char * const ov2732_supply_names[] = {
+	"avdd", /* Analog power */
+	"dovdd", /* Digital I/O power */
+	"dvdd", /* Digital core power */
+};
+
+#define OV2732_NUM_SUPPLIES ARRAY_SIZE(ov2732_supply_names)
+
+static const struct cci_reg_sequence ov2732_common_regs[] = {
+	// PLL control, reset all registers.
+	{ CCI_REG8(0x0103), 0x01 },
+
+	// Analog control
+	{ CCI_REG8(0x3600), 0x55 },
+	{ CCI_REG8(0x3601), 0x52 },
+	{ CCI_REG8(0x3612), 0xb5 },
+	{ CCI_REG8(0x3613), 0xb3 },
+	{ CCI_REG8(0x3616), 0x83 },
+	{ CCI_REG8(0x3621), 0x00 },
+	{ CCI_REG8(0x3624), 0x06 },
+	{ CCI_REG8(0x3642), 0x88 },
+	{ CCI_REG8(0x3660), 0x00 },
+	{ CCI_REG8(0x3661), 0x00 },
+	{ CCI_REG8(0x366a), 0x64 },
+	{ CCI_REG8(0x366c), 0x00 },
+	{ CCI_REG8(0x366e), 0xff },
+	{ CCI_REG8(0x366f), 0xff },
+	{ CCI_REG8(0x3677), 0x11 },
+	{ CCI_REG8(0x3678), 0x11 },
+	{ CCI_REG8(0x3679), 0x0c },
+	{ CCI_REG8(0x3680), 0xff },
+	{ CCI_REG8(0x3681), 0x16 },
+	{ CCI_REG8(0x3682), 0x16 },
+	{ CCI_REG8(0x3683), 0x90 },
+	{ CCI_REG8(0x3684), 0x90 },
+
+	// ADC sync control
+	{ CCI_REG8(0x4503), 0x00 },
+	{ CCI_REG8(0x4508), 0x14 },
+	{ CCI_REG8(0x450a), 0x00 },
+	{ CCI_REG8(0x450b), 0x40 },
+
+	// ISP control, enable: WIN, DPC & ISP
+	{ CCI_REG8(0x5000), 0xa1 },
+};
+
+struct ov2732_mode {
+	u32 width;
+	u32 height;
+	u32 vts;
+};
+
+static const struct ov2732_mode supported_modes[] = {
+	{
+		.width = 1920,
+		.height = 1080,
+		.vts = 1184,
+	},
+};
+
+struct ov2732 {
+	struct device *dev;
+	struct regmap *regmap;
+
+	struct media_pad pad;
+	struct v4l2_subdev sd;
+	struct v4l2_ctrl_handler ctrl_handler;
+	struct v4l2_ctrl *hblank;
+	struct v4l2_ctrl *vblank;
+	struct v4l2_ctrl *exposure;
+	struct v4l2_ctrl *anal_gain;
+	struct v4l2_ctrl *digi_gain;
+	struct v4l2_ctrl *test_pattern;
+
+	struct clk *xvclk;
+	u32 xvclk_freq;
+	struct gpio_desc *pwdn_gpio;
+	struct gpio_desc *reset_gpio;
+	struct regulator_bulk_data supplies[OV2732_NUM_SUPPLIES];
+};
+
+#define to_ov2732(_sd) container_of(_sd, struct ov2732, sd)
+
+static const s64 link_freq_menu_items[] = {
+	OV2732_LINK_FREQ_DEFAULT,
+};
+
+static const char * const ov2732_test_pattern_menu[] = {
+	"Disabled",
+	"Vertical Color Bar Type 1",
+	"Vertical Color Bar Type 2",
+	"Vertical Color Bar Type 3",
+	"Vertical Color Bar Type 4",
+};
+
+static const int ov2732_test_pattern_val[] = {
+	OV2732_TEST_PATTERN_DISABLE,
+	OV2732_TEST_PATTERN_BAR1,
+	OV2732_TEST_PATTERN_BAR2,
+	OV2732_TEST_PATTERN_BAR3,
+	OV2732_TEST_PATTERN_BAR4,
+};
+
+static int ov2732_power_on(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct ov2732 *ov2732 = to_ov2732(sd);
+	int ret;
+
+	ret = regulator_bulk_enable(OV2732_NUM_SUPPLIES, ov2732->supplies);
+	if (ret) {
+		dev_err(dev, "failed to enable regulators\n");
+		return ret;
+	}
+
+	ret = clk_prepare_enable(ov2732->xvclk);
+	if (ret) {
+		dev_err(dev, "failed to enable clock\n");
+		goto reg_off;
+	}
+
+	/* Wait 10ms before power up, as per datasheet. */
+	fsleep(10 * USEC_PER_MSEC);
+
+	gpiod_set_value_cansleep(ov2732->reset_gpio, 0);
+	gpiod_set_value_cansleep(ov2732->pwdn_gpio, 0);
+
+	/* Wait 8192 cycles, as per datasheet. */
+	fsleep(OV2732_DELAY_US(OV2732_POWER_UP_DELAY_CYCLES));
+
+	return 0;
+
+reg_off:
+	regulator_bulk_disable(OV2732_NUM_SUPPLIES, ov2732->supplies);
+
+	return ret;
+}
+
+static int ov2732_power_off(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct ov2732 *ov2732 = to_ov2732(sd);
+
+	/* After streaming has stopped, wait 10ms, as per datasheet. */
+	fsleep(10 * USEC_PER_MSEC);
+
+	clk_disable_unprepare(ov2732->xvclk);
+
+	/* Wait for 512 cycles as per datasheet. */
+	fsleep(OV2732_DELAY_US(OV2732_POWER_DOWN_DELAY_CYCLES));
+
+	gpiod_set_value_cansleep(ov2732->pwdn_gpio, 1);
+	gpiod_set_value_cansleep(ov2732->reset_gpio, 1);
+
+	regulator_bulk_disable(OV2732_NUM_SUPPLIES, ov2732->supplies);
+
+	return 0;
+}
+
+static int ov2732_identify_chip(struct ov2732 *ov2732)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&ov2732->sd);
+	int ret;
+	u64 val;
+
+	ret = cci_read(ov2732->regmap, OV2732_REG_CHIP_ID, &val, NULL);
+	if (ret)
+		return dev_err_probe(&client->dev, ret,
+				     "failed to read chip id\n");
+
+	if (val != OV2732_CHIP_ID)
+		return dev_err_probe(&client->dev, -ENODEV,
+				     "chip id mismatch: %x!=%llx\n",
+				     OV2732_CHIP_ID, val);
+
+	return 0;
+}
+
+static int ov2732_enum_mbus_code(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state,
+				 struct v4l2_subdev_mbus_code_enum *code)
+{
+	if (code->index != 0)
+		return -EINVAL;
+
+	code->code = MEDIA_BUS_FMT_SBGGR10_1X10;
+
+	return 0;
+}
+
+static int ov2732_enum_frame_size(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state,
+				  struct v4l2_subdev_frame_size_enum *fse)
+{
+	if (fse->index >= ARRAY_SIZE(supported_modes))
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
+static int ov2732_set_fmt(struct v4l2_subdev *sd,
+			  struct v4l2_subdev_state *state,
+			  struct v4l2_subdev_format *fmt)
+{
+	struct ov2732 *ov2732 = to_ov2732(sd);
+	const struct ov2732_mode *mode;
+	struct v4l2_mbus_framefmt *format;
+	u32 prev_line_len;
+	s64 vblank_def;
+
+	format = v4l2_subdev_state_get_format(state, 0);
+	prev_line_len = format->width + ov2732->hblank->val;
+
+	mode = v4l2_find_nearest_size(supported_modes,
+				      ARRAY_SIZE(supported_modes),
+				      width, height,
+				      fmt->format.width, fmt->format.height);
+
+	fmt->format.code = MEDIA_BUS_FMT_SBGGR10_1X10;
+	fmt->format.width = mode->width;
+	fmt->format.height = mode->height;
+	fmt->format.field = V4L2_FIELD_NONE;
+
+	*v4l2_subdev_state_get_format(state, fmt->pad) = fmt->format;
+
+	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
+		vblank_def = mode->vts - mode->height;
+		__v4l2_ctrl_modify_range(ov2732->vblank,
+					 vblank_def,
+					 OV2732_VTS_MAX - mode->height,
+					 1, vblank_def);
+	}
+
+	return 0;
+}
+
+static int ov2732_get_selection(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *state,
+				struct v4l2_subdev_selection *sel)
+{
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP:
+		sel->r = *v4l2_subdev_state_get_crop(state, 0);
+		return 0;
+
+	case V4L2_SEL_TGT_NATIVE_SIZE:
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		sel->r.top = 0;
+		sel->r.left = 0;
+		sel->r.width = OV2732_NATIVE_WIDTH;
+		sel->r.height = OV2732_NATIVE_HEIGHT;
+
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static int ov2732_enable_streams(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state, u32 pad,
+				 u64 streams_mask)
+{
+	struct ov2732 *ov2732 = to_ov2732(sd);
+	struct i2c_client *client = v4l2_get_subdevdata(&ov2732->sd);
+	int ret;
+
+	ret = pm_runtime_resume_and_get(&client->dev);
+	if (ret < 0)
+		return ret;
+
+	/* Wait 10ms to avoid intermittent communication errors at startup. */
+	fsleep(10 * USEC_PER_MSEC);
+
+	/* Set stream off register for PLL changes. */
+	ret = cci_write(ov2732->regmap, OV2732_REG_MODE_SELECT,
+			OV2732_MODE_STANDBY, NULL);
+	if (ret)
+		goto err_put_autosuspend;
+
+	/* Send all registers that are common to all modes */
+	ret = cci_multi_reg_write(ov2732->regmap, ov2732_common_regs,
+				  ARRAY_SIZE(ov2732_common_regs), NULL);
+	if (ret) {
+		dev_err(&client->dev, "failed to init registers\n");
+		goto err_put_autosuspend;
+	}
+
+	/* Apply customized values from user */
+	ret =  __v4l2_ctrl_handler_setup(ov2732->sd.ctrl_handler);
+	if (ret)
+		goto err_put_autosuspend;
+
+	// Wait 10ms, as per datasheet.
+	fsleep(10 * USEC_PER_MSEC);
+
+	/* Set stream on register */
+	ret = cci_write(ov2732->regmap, OV2732_REG_MODE_SELECT,
+			OV2732_MODE_STREAMING, NULL);
+	if (ret)
+		goto err_put_autosuspend;
+
+	return 0;
+
+err_put_autosuspend:
+	pm_runtime_put_autosuspend(&client->dev);
+
+	return ret;
+}
+
+static int ov2732_disable_streams(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state, u32 pad,
+				  u64 streams_mask)
+{
+	struct ov2732 *ov2732 = to_ov2732(sd);
+	struct i2c_client *client = v4l2_get_subdevdata(&ov2732->sd);
+	int ret;
+
+	/* set stream off register */
+	ret = cci_write(ov2732->regmap, OV2732_REG_MODE_SELECT,
+			OV2732_MODE_STANDBY, NULL);
+	if (ret)
+		dev_err(&client->dev, "%s failed to set stream\n", __func__);
+
+	pm_runtime_put_autosuspend(&client->dev);
+
+	return ret;
+}
+
+static const struct v4l2_subdev_video_ops ov2732_video_ops = {
+	.s_stream = v4l2_subdev_s_stream_helper,
+};
+
+static const struct v4l2_subdev_pad_ops ov2732_pad_ops = {
+	.enum_mbus_code = ov2732_enum_mbus_code,
+	.enum_frame_size = ov2732_enum_frame_size,
+	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = ov2732_set_fmt,
+	.get_selection = ov2732_get_selection,
+	.enable_streams = ov2732_enable_streams,
+	.disable_streams = ov2732_disable_streams,
+};
+
+static const struct v4l2_subdev_ops ov2732_subdev_ops = {
+	.video  = &ov2732_video_ops,
+	.pad = &ov2732_pad_ops,
+};
+
+static int ov2732_init_state(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *sd_state)
+{
+	struct v4l2_subdev_format fmt = {
+		.which = V4L2_SUBDEV_FORMAT_TRY,
+		.format = {
+			.width = 1920,
+			.height = 1080,
+		}
+	};
+
+	return ov2732_set_fmt(sd, sd_state, &fmt);
+}
+
+static const struct v4l2_subdev_internal_ops ov2732_internal_ops = {
+	.init_state = ov2732_init_state,
+};
+
+static int ov2732_set_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct ov2732 *ov2732 =
+		container_of(ctrl->handler, struct ov2732, ctrl_handler);
+	struct i2c_client *client = v4l2_get_subdevdata(&ov2732->sd);
+	const struct v4l2_mbus_framefmt *format;
+	struct v4l2_subdev_state *state;
+	int ret = 0;
+
+	state = v4l2_subdev_get_locked_active_state(&ov2732->sd);
+	format = v4l2_subdev_state_get_format(state, 0);
+
+	if (ctrl->id == V4L2_CID_VBLANK) {
+		int exposure_max, exposure_def;
+
+		exposure_max = format->height + ctrl->val -
+			       OV2732_EXPOSURE_OFFSET;
+		exposure_def = exposure_max;
+		ret = __v4l2_ctrl_modify_range(ov2732->exposure,
+					       OV2732_EXPOSURE_MIN,
+					       exposure_max,
+					       ov2732->exposure->step,
+					       exposure_def);
+		if (ret)
+			return ret;
+	}
+
+	if (pm_runtime_get_if_in_use(&client->dev) == 0)
+		return 0;
+
+	switch (ctrl->id) {
+	case V4L2_CID_ANALOGUE_GAIN:
+		cci_write(ov2732->regmap, OV2732_REG_ANALOGUE_GAIN,
+			  ctrl->val, &ret);
+		break;
+	case V4L2_CID_DIGITAL_GAIN:
+		cci_write(ov2732->regmap, OV2732_REG_DIGITAL_GAIN,
+			  ctrl->val, &ret);
+		break;
+	case V4L2_CID_EXPOSURE:
+		cci_write(ov2732->regmap, OV2732_REG_EXPOSURE,
+			  ctrl->val, &ret);
+		break;
+	case V4L2_CID_VBLANK:
+		cci_write(ov2732->regmap, OV2732_REG_VTS,
+			  (format->height + ctrl->val), &ret);
+		break;
+	case V4L2_CID_TEST_PATTERN:
+		cci_write(ov2732->regmap, OV2732_REG_TEST_PATTERN,
+			  ov2732_test_pattern_val[ctrl->val], &ret);
+		break;
+	default:
+		dev_info(&client->dev,
+			 "ctrl(id:0x%x,val:0x%x) is not handled\n",
+			 ctrl->id, ctrl->val);
+		ret = -EINVAL;
+		break;
+	}
+
+	pm_runtime_put(&client->dev);
+
+	return ret;
+};
+
+static const struct v4l2_ctrl_ops ov2732_ctrl_ops = {
+	.s_ctrl = ov2732_set_ctrl,
+};
+
+static int ov2732_init_controls(struct ov2732 *ov2732)
+{
+	const struct ov2732_mode *mode = &supported_modes[0];
+	struct v4l2_ctrl_handler *handler;
+	struct v4l2_ctrl *ctrl;
+	struct v4l2_fwnode_device_properties props;
+	s64 exposure_max, vblank_def, vblank_max;
+	int ret;
+
+	handler = &ov2732->ctrl_handler;
+	ret = v4l2_ctrl_handler_init(handler, 10);
+	if (ret)
+		return ret;
+
+	ctrl = v4l2_ctrl_new_std(handler, &ov2732_ctrl_ops, V4L2_CID_PIXEL_RATE,
+				 OV2732_PIXEL_RATE, OV2732_PIXEL_RATE,
+				 1, OV2732_PIXEL_RATE);
+
+	ctrl = v4l2_ctrl_new_int_menu(handler, &ov2732_ctrl_ops,
+				      V4L2_CID_LINK_FREQ, 0, 0,
+				      link_freq_menu_items);
+	if (ctrl)
+		ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	ov2732->hblank = v4l2_ctrl_new_std(handler, &ov2732_ctrl_ops,
+					   V4L2_CID_HBLANK,
+					   OV2732_HBLANK_DEFAULT,
+					   OV2732_HBLANK_DEFAULT,
+					   1, OV2732_HBLANK_DEFAULT);
+	if (ov2732->hblank)
+		ov2732->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	vblank_def = mode->vts - mode->height;
+	vblank_max = OV2732_VTS_MAX - mode->height;
+	ov2732->vblank = v4l2_ctrl_new_std(handler, &ov2732_ctrl_ops,
+					   V4L2_CID_VBLANK,
+					   vblank_def, vblank_max,
+					   1, vblank_def);
+
+	exposure_max = mode->vts - OV2732_EXPOSURE_OFFSET;
+	ov2732->exposure = v4l2_ctrl_new_std(handler, &ov2732_ctrl_ops,
+					     V4L2_CID_EXPOSURE,
+					     OV2732_EXPOSURE_MIN, exposure_max,
+					     1, exposure_max);
+
+	ov2732->anal_gain = v4l2_ctrl_new_std(handler, &ov2732_ctrl_ops,
+					      V4L2_CID_ANALOGUE_GAIN,
+					      OV2732_ANALOGUE_GAIN_MIN,
+					      OV2732_ANALOGUE_GAIN_MAX,
+					      1, OV2732_ANALOGUE_GAIN_DEFAULT);
+
+	ov2732->digi_gain = v4l2_ctrl_new_std(handler, &ov2732_ctrl_ops,
+					      V4L2_CID_DIGITAL_GAIN,
+					      OV2732_DIGITAL_GAIN_MIN,
+					      OV2732_DIGITAL_GAIN_MAX,
+					      1, OV2732_DIGITAL_GAIN_DEFAULT);
+
+	ov2732->test_pattern = v4l2_ctrl_new_std_menu_items(
+					handler, &ov2732_ctrl_ops,
+					V4L2_CID_TEST_PATTERN,
+					ARRAY_SIZE(ov2732_test_pattern_menu) - 1,
+					0, 0, ov2732_test_pattern_menu);
+
+	if (handler->error) {
+		ret = handler->error;
+		dev_err_probe(ov2732->dev, ret, "Control init failed\n");
+		goto err_handler_free;
+	}
+
+	ret = v4l2_fwnode_device_parse(ov2732->dev, &props);
+	if (ret)
+		goto err_handler_free;
+
+	ret = v4l2_ctrl_new_fwnode_properties(handler, &ov2732_ctrl_ops, &props);
+	if (ret)
+		goto err_handler_free;
+
+	ov2732->sd.ctrl_handler = handler;
+
+	return 0;
+
+err_handler_free:
+	v4l2_ctrl_handler_free(handler);
+
+	return ret;
+}
+
+static int ov2632_probe_dt(struct ov2732 *ov2732)
+{
+	int ret;
+	struct fwnode_handle *ep;
+	struct fwnode_handle *fwnode = dev_fwnode(ov2732->dev);
+	struct v4l2_fwnode_endpoint bus_cfg = {
+		.bus_type = V4L2_MBUS_CSI2_DPHY,
+	};
+
+	if (!fwnode)
+		return -ENXIO;
+
+	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
+	if (!ep)
+		return dev_err_probe(ov2732->dev, -EPROBE_DEFER,
+				     "waiting for fwnode graph endpoint\n");
+
+	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
+	fwnode_handle_put(ep);
+	if (ret) {
+		dev_err_probe(ov2732->dev, -EINVAL, "could not parse endpoint\n");
+		goto err_probe_dt;
+	}
+
+	if (bus_cfg.bus.mipi_csi2.num_data_lanes != OV2732_LANES) {
+		dev_err(ov2732->dev, "only a 2-lane CSI2 config is supported\n");
+		ret = -EINVAL;
+	}
+
+err_probe_dt:
+	v4l2_fwnode_endpoint_free(&bus_cfg);
+
+	return ret;
+}
+
+static int ov2732_get_regulators(struct ov2732 *ov2732)
+{
+	unsigned int i;
+
+	for (i = 0; i < OV2732_NUM_SUPPLIES; i++)
+		ov2732->supplies[i].supply = ov2732_supply_names[i];
+
+	return devm_regulator_bulk_get(ov2732->dev,
+				       OV2732_NUM_SUPPLIES,
+				       ov2732->supplies);
+}
+
+static int ov2732_probe(struct i2c_client *client)
+{
+	struct ov2732 *ov2732;
+	int ret;
+
+	ov2732 = devm_kzalloc(&client->dev, sizeof(*ov2732), GFP_KERNEL);
+	if (!ov2732)
+		return -ENOMEM;
+
+	ov2732->dev = &client->dev;
+
+	ret = ov2632_probe_dt(ov2732);
+	if (ret)
+		return dev_err_probe(ov2732->dev, ret,
+				     "failed to probe device tree\n");
+
+	ov2732->xvclk = devm_v4l2_sensor_clk_get(ov2732->dev, "xvclk");
+	if (IS_ERR(ov2732->xvclk))
+		return dev_err_probe(ov2732->dev, PTR_ERR(ov2732->xvclk),
+				     "failed to get xvclk\n");
+
+	ov2732->xvclk_freq = clk_get_rate(ov2732->xvclk);
+	if (ov2732->xvclk_freq != OV2732_XVCLK_FREQ)
+		return dev_err_probe(ov2732->dev, -EINVAL,
+				     "xvclk frequency not supported: %dHz\n",
+				      ov2732->xvclk_freq);
+
+	ov2732->pwdn_gpio = devm_gpiod_get_optional(ov2732->dev, "pwdn",
+						    GPIOD_OUT_HIGH);
+
+	ov2732->reset_gpio = devm_gpiod_get_optional(ov2732->dev, "reset",
+						     GPIOD_OUT_HIGH);
+
+	ov2732->regmap = devm_cci_regmap_init_i2c(client, 16);
+	if (IS_ERR(ov2732->regmap))
+		return dev_err_probe(ov2732->dev, PTR_ERR(ov2732->regmap),
+				     "failed to init CCI\n");
+
+	ret = ov2732_get_regulators(ov2732);
+	if (ret)
+		return dev_err_probe(ov2732->dev, ret,
+				     "failed to get regulators\n");
+
+	v4l2_i2c_subdev_init(&ov2732->sd, client, &ov2732_subdev_ops);
+
+	/* Device must be powered on for ov2732_identify_chip(). */
+	ret = ov2732_power_on(ov2732->dev);
+	if (ret)
+		return ret;
+
+	pm_runtime_set_active(ov2732->dev);
+	pm_runtime_enable(ov2732->dev);
+
+	/* Wait 10ms to avoid intermittent communication errors at startup. */
+	fsleep(10 * USEC_PER_MSEC);
+
+	ret = ov2732_identify_chip(ov2732);
+	if (ret)
+		goto err_power_off;
+
+	ret = ov2732_init_controls(ov2732);
+	if (ret)
+		goto err_power_off;
+
+	/* Initialize subdev */
+	ov2732->sd.internal_ops = &ov2732_internal_ops;
+	ov2732->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	ov2732->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
+
+	/* Initialize source pad */
+	ov2732->pad.flags = MEDIA_PAD_FL_SOURCE;
+
+	ret = media_entity_pads_init(&ov2732->sd.entity, 1, &ov2732->pad);
+	if (ret) {
+		dev_err_probe(ov2732->dev, ret, "failed to init entity pads\n");
+		goto error_handler_free;
+	}
+
+	ov2732->sd.state_lock = ov2732->ctrl_handler.lock;
+	ret = v4l2_subdev_init_finalize(&ov2732->sd);
+	if (ret < 0) {
+		dev_err_probe(ov2732->dev, ret, "subdev init error\n");
+		goto err_media_entity;
+	}
+
+	ret = v4l2_async_register_subdev_sensor(&ov2732->sd);
+	if (ret < 0) {
+		dev_err_probe(ov2732->dev, ret,
+			      "failed to register sensor sub-device\n");
+		goto err_subdev_cleanup;
+	}
+
+	pm_runtime_set_autosuspend_delay(ov2732->dev, 1000);
+	pm_runtime_use_autosuspend(ov2732->dev);
+	pm_runtime_idle(ov2732->dev);
+
+	return 0;
+
+err_subdev_cleanup:
+	v4l2_subdev_cleanup(&ov2732->sd);
+
+err_media_entity:
+	media_entity_cleanup(&ov2732->sd.entity);
+
+error_handler_free:
+	v4l2_ctrl_handler_free(&ov2732->ctrl_handler);
+
+err_power_off:
+	pm_runtime_disable(ov2732->dev);
+	pm_runtime_put_noidle(ov2732->dev);
+	ov2732_power_off(ov2732->dev);
+
+	return dev_err_probe(ov2732->dev, ret, "probing failed\n");
+}
+
+static void ov2732_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct ov2732 *ov2732 = to_ov2732(sd);
+
+	v4l2_async_unregister_subdev(sd);
+	v4l2_subdev_cleanup(sd);
+	media_entity_cleanup(&sd->entity);
+	v4l2_ctrl_handler_free(&ov2732->ctrl_handler);
+
+	pm_runtime_disable(ov2732->dev);
+	if (!pm_runtime_status_suspended(ov2732->dev)) {
+		ov2732_power_off(ov2732->dev);
+		pm_runtime_set_suspended(ov2732->dev);
+	}
+}
+
+static const struct of_device_id ov2732_of_match[] = {
+	{ .compatible = "ovti,ov2732", },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, ov2732_of_match);
+
+static DEFINE_RUNTIME_DEV_PM_OPS(ov2732_pm_ops, ov2732_power_off,
+				 ov2732_power_on, NULL);
+
+static struct i2c_driver ov2732_i2c_driver = {
+	.driver = {
+		.name = "ov2732",
+		.of_match_table = of_match_ptr(ov2732_of_match),
+		.pm = pm_sleep_ptr(&ov2732_pm_ops),
+	},
+	.probe = ov2732_probe,
+	.remove = ov2732_remove,
+};
+module_i2c_driver(ov2732_i2c_driver);
+
+MODULE_DESCRIPTION("OmniVision ov2732 sensor driver");
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Walter Werner SCHNEIDER <contact@schnwalter.eu>");

-- 
2.51.1


