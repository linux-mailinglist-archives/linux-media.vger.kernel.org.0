Return-Path: <linux-media+bounces-40492-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CD6B2E842
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 00:46:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 493B8172D52
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 22:46:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 389882DA746;
	Wed, 20 Aug 2025 22:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tzfy15bz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1777286D4E
	for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 22:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755729950; cv=none; b=Ae49xIv3pCTyEBWUHlLGLu1L8LxDvbSo86jgj9F0SP1jhg7lJ7Ycuv6D21lD9DrzfEt5s0FCSymDOymapJ25dmIEqoz5W0K7iIpC5Ot9Qs35juhh7SRs+aJUt2fX52XjwT+R8LTUikwAvvpsq6kxMqSl4xgvWoE5vINdnBsi6zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755729950; c=relaxed/simple;
	bh=TBx0WoahZnggjVZGZDj9cKNmSmP6Cr3U9R5gT4xBkcY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p6zge0eKtRkBgxeGc4vT2+CR97cnPntvJDswRJvcXh0krTxzsdMmyPqvPJjSZsk8r5+Z/F+RrQ0EJtRP3Gn3v0jfypJFMG9L0R+11J4dQItPiqA6F1Ojrtds4JjJmKv9zUjORud42gS4qdYepSKkT9PsyOVUVqMBPPeraqXvpco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tzfy15bz; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-55e00f9385fso26593e87.0
        for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 15:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755729946; x=1756334746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0z8w8w4ch5j4aUqo4nxWynjaGVj30ST2au9Q45qiKok=;
        b=tzfy15bz2y3IbcKnxptdQiItvfY01451CMIZ2Fl82HqU9683d739Vs0uGIaJOOLqBd
         p058cH8TnKr5bAd60/Y1CDwXlErcV/WJ1dONoNYDqFtNUdLxf7qcL0+N+kEK+z3lR1fp
         CZpxs+NOjTDzLmFo3yGrfberIwOQNFtGrHaQubu2H5KoNMVo9N9LJpXjZ/1X4fKmlON9
         1I/+8rc6YYN9WmGxaM5HTlKqrm3knSTQbYRDtCHC86nupQu6sbLUBX3xvGIDlp5A5Xqg
         s8aYcvpOTdhQBWdUaI2TG/GOtjRqM1Fsj0632MrgmP6pBZd7/9/ewLFtiFt5JB+k+Df3
         Oklw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755729946; x=1756334746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0z8w8w4ch5j4aUqo4nxWynjaGVj30ST2au9Q45qiKok=;
        b=gqABDoTM4jD36/cqhpYs7wQ7tmyY/OzKYTiO1xMrvRKkBWx4yDRVIa5Hvjwc3cNNB9
         XgfHQlyXMkpp3qAaRxkKSOwJYCaXDm7Jo0nZd01DQ2jf/1BR4PCtwwodi+jmEgI1lW4H
         hcDPcwgQydydD2zEhwwVPAUgCF5LOM21axrVPfsb5Dp+UUcoOFCKEuN0WFunD/aOgtAK
         z4SoRP6VrYKKtqa80TsAtDhVBUbRPhDHgJ4Od5OP5d8Ue5RcZNVuEo9k/sLJ6bJ8cCUn
         efwoTs7aStL0Qjh6drtMqp8C3TBHL+B3S4T/hiFMfnzbKsNQfX3RrsumS1nvkuiQLpTK
         h1HA==
X-Forwarded-Encrypted: i=1; AJvYcCWpE5Z2JXXyfwzROgNXTd/4W/VUcH1l0mPHtWoeJ9p4WLSLgl7X43iICYayyKrcxZOG1oxtskmycwQiyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvttCrQzqU2kWbEcHoJjy3HZobCjcbBl/jNkvFUpA/ESGhTNId
	Q5zmstq1XKCod//qw64hT+dpO82zb5l9LE5KovM7ayaOAGS8UrX32c6vaDY6V0foLQI=
X-Gm-Gg: ASbGncunm8bMrL24FxjsHahAkYGvC3ORA8A9Sl2F2oAY/dI0oD45oNVq55V5Iqcm4KT
	V4+D8lVBo7pmPoeof/ahQ5/g6TfyETJGtr7wAsNT10En+8CLE9V3wbotVdSC5CweI/26Q4ew/kJ
	cSc8rylK3ahZPXspAE6+svfBbULEnS5NOUCWRz99Xp6IssDvbiWGl3mgGX0mrWcJlut0CcLLz5f
	UzGkJVHQwJq2Cb2LKL8FecSuaAD2zik38pQALUu91AkIOb0NZ79L/oLh4Z/c8TDNaQGG54n/zyb
	KujfI9DRzLe+/98mQuw+ITwMSj/CPyR2Vr1mDr7YQLkWq9TfuHWdfDlpa0GFlwOCbIx9OcARcT7
	dG4G+uBvF/BIEHOjj9n/3oI4GGq2qOLIK1EK3bPpSHkl7cKzmB/K6GkBYmlETbKtLqhYtD+0=
X-Google-Smtp-Source: AGHT+IG+gJbXTfJ1+tr2yAMs9CY47tN6zg1D7eAA3/REXGHCio4XHZbqK2uMyI7dTwEec+n0N4HU1g==
X-Received: by 2002:a05:6512:3e1b:b0:55b:8200:885b with SMTP id 2adb3069b0e04-55e0d55f4femr66577e87.11.1755729945903;
        Wed, 20 Aug 2025 15:45:45 -0700 (PDT)
Received: from thyme.local (88-112-128-43.elisa-laajakaista.fi. [88.112.128.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3ffcefsm2763048e87.136.2025.08.20.15.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 15:45:45 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Tarang Raval <tarang.raval@siliconsignals.io>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 2/2] media: i2c: Add OmniVision OV6211 image sensor driver
Date: Thu, 21 Aug 2025 01:45:41 +0300
Message-ID: <20250820224541.130229-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250820224541.130229-1-vladimir.zapolskiy@linaro.org>
References: <20250820224541.130229-1-vladimir.zapolskiy@linaro.org>
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
 drivers/media/i2c/Kconfig  |  10 +
 drivers/media/i2c/Makefile |   1 +
 drivers/media/i2c/ov6211.c | 835 +++++++++++++++++++++++++++++++++++++
 4 files changed, 854 insertions(+)
 create mode 100644 drivers/media/i2c/ov6211.c

diff --git a/MAINTAINERS b/MAINTAINERS
index fe168477caa4..f2af41bd19b0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18722,6 +18722,14 @@ S:	Maintained
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
index 1f5a3082ead9..0b2ee53ac97f 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -542,6 +542,16 @@ config VIDEO_OV5695
 	  To compile this driver as a module, choose M here: the
 	  module will be called ov5695.
 
+config VIDEO_OV6211
+	tristate "OmniVision OV6211 sensor support"
+	select V4L2_CCI_I2C
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
index 000000000000..f21222e8ae35
--- /dev/null
+++ b/drivers/media/i2c/ov6211.c
@@ -0,0 +1,835 @@
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
+#include <media/v4l2-cci.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
+
+#define OV6211_LINK_FREQ_480MHZ		480000000ULL
+#define OV6211_MCLK_FREQ_24MHZ		24000000
+
+#define OV6211_REG_CHIP_ID		CCI_REG16(0x300a)
+#define OV6211_CHIP_ID			0x6710
+
+#define OV6211_REG_MODE_SELECT		CCI_REG8(0x0100)
+#define OV6211_MODE_STANDBY		0x00
+#define OV6211_MODE_STREAMING		0x01
+
+#define OV6211_REG_SOFTWARE_RST		CCI_REG8(0x0103)
+#define OV6211_SOFTWARE_RST		0x01
+
+/* Exposure controls from sensor */
+#define OV6211_REG_EXPOSURE		CCI_REG24(0x3500)
+#define OV6211_EXPOSURE_MIN		1
+#define OV6211_EXPOSURE_MAX_MARGIN	4
+#define OV6211_EXPOSURE_STEP		1
+#define OV6211_EXPOSURE_DEFAULT		210
+
+/* Analogue gain controls from sensor */
+#define OV6211_REG_ANALOGUE_GAIN	CCI_REG16(0x350a)
+#define OV6211_ANALOGUE_GAIN_MIN	1
+#define OV6211_ANALOGUE_GAIN_MAX	0x3ff
+#define OV6211_ANALOGUE_GAIN_STEP	1
+#define OV6211_ANALOGUE_GAIN_DEFAULT	0xa0
+
+/* Test pattern */
+#define OV6211_REG_PRE_ISP		CCI_REG8(0x5e00)
+#define OV6211_TEST_PATTERN_ENABLE	BIT(7)
+
+#define to_ov6211(_sd)			container_of(_sd, struct ov6211, sd)
+
+struct ov6211_reg_list {
+	const struct cci_reg_sequence *regs;
+	unsigned int num_regs;
+};
+
+struct ov6211_mode {
+	u32 width;	/* Frame width in pixels */
+	u32 height;	/* Frame height in pixels */
+	u32 hts;	/* Horizontal timing size */
+	u32 vts;	/* Default vertical timing size */
+	u32 bpp;	/* Bits per pixel */
+
+	const struct ov6211_reg_list reg_list;	/* Sensor register setting */
+};
+
+static const s64 ov6211_link_freq_menu[] = {
+	OV6211_LINK_FREQ_480MHZ,
+};
+
+static const char * const ov6211_test_pattern_menu[] = {
+	"Disabled",
+	"Vertical Colour Bars",
+};
+
+static const struct cci_reg_sequence ov6211_400x400_120fps_mode[] = {
+	{ CCI_REG8(0x3005), 0x00 },
+	{ CCI_REG8(0x3013), 0x12 },
+	{ CCI_REG8(0x3014), 0x04 },
+	{ CCI_REG8(0x3016), 0x10 },
+	{ CCI_REG8(0x3017), 0x00 },
+	{ CCI_REG8(0x3018), 0x00 },
+	{ CCI_REG8(0x301a), 0x00 },
+	{ CCI_REG8(0x301b), 0x00 },
+	{ CCI_REG8(0x301c), 0x00 },
+	{ CCI_REG8(0x3037), 0xf0 },
+	{ CCI_REG8(0x3080), 0x01 },
+	{ CCI_REG8(0x3081), 0x00 },
+	{ CCI_REG8(0x3082), 0x01 },
+	{ CCI_REG8(0x3098), 0x04 },
+	{ CCI_REG8(0x3099), 0x28 },
+	{ CCI_REG8(0x309a), 0x06 },
+	{ CCI_REG8(0x309b), 0x04 },
+	{ CCI_REG8(0x309c), 0x00 },
+	{ CCI_REG8(0x309d), 0x00 },
+	{ CCI_REG8(0x309e), 0x01 },
+	{ CCI_REG8(0x309f), 0x00 },
+	{ CCI_REG8(0x30b0), 0x08 },
+	{ CCI_REG8(0x30b1), 0x02 },
+	{ CCI_REG8(0x30b2), 0x00 },
+	{ CCI_REG8(0x30b3), 0x28 },
+	{ CCI_REG8(0x30b4), 0x02 },
+	{ CCI_REG8(0x30b5), 0x00 },
+	{ CCI_REG8(0x3106), 0xd9 },
+	{ CCI_REG8(0x3503), 0x07 },
+	{ CCI_REG8(0x3509), 0x10 },
+	{ CCI_REG8(0x3600), 0xfc },
+	{ CCI_REG8(0x3620), 0xb7 },
+	{ CCI_REG8(0x3621), 0x05 },
+	{ CCI_REG8(0x3626), 0x31 },
+	{ CCI_REG8(0x3627), 0x40 },
+	{ CCI_REG8(0x3632), 0xa3 },
+	{ CCI_REG8(0x3633), 0x34 },
+	{ CCI_REG8(0x3634), 0x40 },
+	{ CCI_REG8(0x3636), 0x00 },
+	{ CCI_REG8(0x3660), 0x80 },
+	{ CCI_REG8(0x3662), 0x03 },
+	{ CCI_REG8(0x3664), 0xf0 },
+	{ CCI_REG8(0x366a), 0x10 },
+	{ CCI_REG8(0x366b), 0x06 },
+	{ CCI_REG8(0x3680), 0xf4 },
+	{ CCI_REG8(0x3681), 0x50 },
+	{ CCI_REG8(0x3682), 0x00 },
+	{ CCI_REG8(0x3708), 0x20 },
+	{ CCI_REG8(0x3709), 0x40 },
+	{ CCI_REG8(0x370d), 0x03 },
+	{ CCI_REG8(0x373b), 0x02 },
+	{ CCI_REG8(0x373c), 0x08 },
+	{ CCI_REG8(0x3742), 0x00 },
+	{ CCI_REG8(0x3744), 0x16 },
+	{ CCI_REG8(0x3745), 0x08 },
+	{ CCI_REG8(0x3781), 0xfc },
+	{ CCI_REG8(0x3788), 0x00 },
+	{ CCI_REG8(0x3800), 0x00 },
+	{ CCI_REG8(0x3801), 0x04 },
+	{ CCI_REG8(0x3802), 0x00 },
+	{ CCI_REG8(0x3803), 0x04 },
+	{ CCI_REG8(0x3804), 0x01 },
+	{ CCI_REG8(0x3805), 0x9b },
+	{ CCI_REG8(0x3806), 0x01 },
+	{ CCI_REG8(0x3807), 0x9b },
+	{ CCI_REG8(0x3808), 0x01 },	/* output width */
+	{ CCI_REG8(0x3809), 0x90 },
+	{ CCI_REG8(0x380a), 0x01 },	/* output height */
+	{ CCI_REG8(0x380b), 0x90 },
+	{ CCI_REG8(0x380c), 0x05 },	/* horizontal timing size */
+	{ CCI_REG8(0x380d), 0xf2 },
+	{ CCI_REG8(0x380e), 0x01 },	/* vertical timing size */
+	{ CCI_REG8(0x380f), 0xb6 },
+	{ CCI_REG8(0x3810), 0x00 },
+	{ CCI_REG8(0x3811), 0x04 },
+	{ CCI_REG8(0x3812), 0x00 },
+	{ CCI_REG8(0x3813), 0x04 },
+	{ CCI_REG8(0x3814), 0x11 },
+	{ CCI_REG8(0x3815), 0x11 },
+	{ CCI_REG8(0x3820), 0x00 },
+	{ CCI_REG8(0x3821), 0x00 },
+	{ CCI_REG8(0x382b), 0xfa },
+	{ CCI_REG8(0x382f), 0x04 },
+	{ CCI_REG8(0x3832), 0x00 },
+	{ CCI_REG8(0x3833), 0x05 },
+	{ CCI_REG8(0x3834), 0x00 },
+	{ CCI_REG8(0x3835), 0x05 },
+	{ CCI_REG8(0x3882), 0x04 },
+	{ CCI_REG8(0x3883), 0x00 },
+	{ CCI_REG8(0x38a4), 0x10 },
+	{ CCI_REG8(0x38a5), 0x00 },
+	{ CCI_REG8(0x38b1), 0x03 },
+	{ CCI_REG8(0x3b80), 0x00 },
+	{ CCI_REG8(0x3b81), 0xff },
+	{ CCI_REG8(0x3b82), 0x10 },
+	{ CCI_REG8(0x3b83), 0x00 },
+	{ CCI_REG8(0x3b84), 0x08 },
+	{ CCI_REG8(0x3b85), 0x00 },
+	{ CCI_REG8(0x3b86), 0x01 },
+	{ CCI_REG8(0x3b87), 0x00 },
+	{ CCI_REG8(0x3b88), 0x00 },
+	{ CCI_REG8(0x3b89), 0x00 },
+	{ CCI_REG8(0x3b8a), 0x00 },
+	{ CCI_REG8(0x3b8b), 0x05 },
+	{ CCI_REG8(0x3b8c), 0x00 },
+	{ CCI_REG8(0x3b8d), 0x00 },
+	{ CCI_REG8(0x3b8e), 0x01 },
+	{ CCI_REG8(0x3b8f), 0xb2 },
+	{ CCI_REG8(0x3b94), 0x05 },
+	{ CCI_REG8(0x3b95), 0xf2 },
+	{ CCI_REG8(0x3b96), 0xc0 },
+	{ CCI_REG8(0x4004), 0x04 },
+	{ CCI_REG8(0x404e), 0x01 },
+	{ CCI_REG8(0x4801), 0x0f },
+	{ CCI_REG8(0x4806), 0x0f },
+	{ CCI_REG8(0x4837), 0x43 },
+	{ CCI_REG8(0x5a08), 0x00 },
+	{ CCI_REG8(0x5a01), 0x00 },
+	{ CCI_REG8(0x5a03), 0x00 },
+	{ CCI_REG8(0x5a04), 0x10 },
+	{ CCI_REG8(0x5a05), 0xa0 },
+	{ CCI_REG8(0x5a06), 0x0c },
+	{ CCI_REG8(0x5a07), 0x78 },
+};
+
+static const struct ov6211_mode supported_modes[] = {
+	{
+		.width = 400,
+		.height = 400,
+		.hts = 1522,
+		.vts = 438,
+		.bpp = 8,
+		.reg_list = {
+			.regs = ov6211_400x400_120fps_mode,
+			.num_regs = ARRAY_SIZE(ov6211_400x400_120fps_mode),
+		},
+	},
+};
+
+struct ov6211 {
+	struct device *dev;
+	struct regmap *regmap;
+	struct clk *xvclk;
+	struct gpio_desc *reset_gpio;
+	struct regulator *avdd;
+	struct regulator *dovdd;
+	struct regulator *dvdd;
+
+	struct v4l2_subdev sd;
+	struct media_pad pad;
+
+	struct v4l2_ctrl_handler ctrl_handler;
+
+	/* Saved register values */
+	u64 pre_isp;
+};
+
+static int ov6211_set_test_pattern(struct ov6211 *ov6211, u32 pattern)
+{
+	u64 val = ov6211->pre_isp;
+
+	if (pattern)
+		val |= OV6211_TEST_PATTERN_ENABLE;
+	else
+		val &= ~OV6211_TEST_PATTERN_ENABLE;
+
+	return cci_write(ov6211->regmap, OV6211_REG_PRE_ISP, val, NULL);
+}
+
+static int ov6211_set_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct ov6211 *ov6211 = container_of(ctrl->handler, struct ov6211,
+					     ctrl_handler);
+	int ret;
+
+	/* V4L2 controls are applied, when sensor is powered up for streaming */
+	if (!pm_runtime_get_if_active(ov6211->dev))
+		return 0;
+
+	switch (ctrl->id) {
+	case V4L2_CID_ANALOGUE_GAIN:
+		ret = cci_write(ov6211->regmap, OV6211_REG_ANALOGUE_GAIN,
+				ctrl->val, NULL);
+		break;
+	case V4L2_CID_EXPOSURE:
+		ret = cci_write(ov6211->regmap, OV6211_REG_EXPOSURE,
+				ctrl->val << 4, NULL);
+		break;
+	case V4L2_CID_TEST_PATTERN:
+		ret = ov6211_set_test_pattern(ov6211, ctrl->val);
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	pm_runtime_put(ov6211->dev);
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
+	struct v4l2_ctrl_handler *ctrl_hdlr = &ov6211->ctrl_handler;
+	const struct ov6211_mode *mode = &supported_modes[0];
+	struct v4l2_fwnode_device_properties props;
+	s64 exposure_max, pixel_rate, h_blank;
+	struct v4l2_ctrl *ctrl;
+	int ret;
+
+	v4l2_ctrl_handler_init(ctrl_hdlr, 9);
+
+	ctrl = v4l2_ctrl_new_int_menu(ctrl_hdlr, &ov6211_ctrl_ops,
+				      V4L2_CID_LINK_FREQ,
+				      ARRAY_SIZE(ov6211_link_freq_menu) - 1,
+				      0, ov6211_link_freq_menu);
+	if (ctrl)
+		ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	pixel_rate = ov6211_link_freq_menu[0] / mode->bpp;
+	v4l2_ctrl_new_std(ctrl_hdlr, &ov6211_ctrl_ops, V4L2_CID_PIXEL_RATE,
+			  0, pixel_rate, 1, pixel_rate);
+
+	h_blank = mode->hts - mode->width;
+	ctrl = v4l2_ctrl_new_std(ctrl_hdlr, &ov6211_ctrl_ops, V4L2_CID_HBLANK,
+				 h_blank, h_blank, 1, h_blank);
+	if (ctrl)
+		ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	ctrl = v4l2_ctrl_new_std(ctrl_hdlr, &ov6211_ctrl_ops, V4L2_CID_VBLANK,
+				 mode->vts - mode->height,
+				 mode->vts - mode->height, 1,
+				 mode->vts - mode->height);
+	if (ctrl)
+		ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	v4l2_ctrl_new_std(ctrl_hdlr, &ov6211_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
+			  OV6211_ANALOGUE_GAIN_MIN, OV6211_ANALOGUE_GAIN_MAX,
+			  OV6211_ANALOGUE_GAIN_STEP,
+			  OV6211_ANALOGUE_GAIN_DEFAULT);
+
+	exposure_max = (mode->vts - OV6211_EXPOSURE_MAX_MARGIN);
+	v4l2_ctrl_new_std(ctrl_hdlr, &ov6211_ctrl_ops,
+			  V4L2_CID_EXPOSURE,
+			  OV6211_EXPOSURE_MIN, exposure_max,
+			  OV6211_EXPOSURE_STEP,
+			  OV6211_EXPOSURE_DEFAULT);
+
+	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &ov6211_ctrl_ops,
+				     V4L2_CID_TEST_PATTERN,
+				     ARRAY_SIZE(ov6211_test_pattern_menu) - 1,
+				     0, 0, ov6211_test_pattern_menu);
+
+	if (ctrl_hdlr->error)
+		return ctrl_hdlr->error;
+
+	ret = v4l2_fwnode_device_parse(ov6211->dev, &props);
+	if (ret)
+		goto error_free_hdlr;
+
+	ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &ov6211_ctrl_ops,
+					      &props);
+	if (ret)
+		goto error_free_hdlr;
+
+	ov6211->sd.ctrl_handler = ctrl_hdlr;
+
+	return 0;
+
+error_free_hdlr:
+	v4l2_ctrl_handler_free(ctrl_hdlr);
+
+	return ret;
+}
+
+static void ov6211_update_pad_format(const struct ov6211_mode *mode,
+				     struct v4l2_mbus_framefmt *fmt)
+{
+	fmt->code = MEDIA_BUS_FMT_Y8_1X8;
+	fmt->width = mode->width;
+	fmt->height = mode->height;
+	fmt->field = V4L2_FIELD_NONE;
+	fmt->colorspace = V4L2_COLORSPACE_RAW;
+	fmt->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
+	fmt->xfer_func = V4L2_XFER_FUNC_NONE;
+}
+
+static int ov6211_enable_streams(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state, u32 pad,
+				 u64 streams_mask)
+{
+	const struct ov6211_reg_list *reg_list = &supported_modes[0].reg_list;
+	struct ov6211 *ov6211 = to_ov6211(sd);
+	int ret;
+
+	ret = pm_runtime_resume_and_get(ov6211->dev);
+	if (ret)
+		return ret;
+
+	/* Skip a step of explicit entering into the standby mode */
+	ret = cci_write(ov6211->regmap, OV6211_REG_SOFTWARE_RST,
+			OV6211_SOFTWARE_RST, NULL);
+	if (ret) {
+		dev_err(ov6211->dev, "failed to software reset: %d\n", ret);
+		goto error;
+	}
+
+	ret = cci_multi_reg_write(ov6211->regmap, reg_list->regs,
+				  reg_list->num_regs, NULL);
+	if (ret) {
+		dev_err(ov6211->dev, "failed to set mode: %d\n", ret);
+		goto error;
+	}
+
+	ret = __v4l2_ctrl_handler_setup(ov6211->sd.ctrl_handler);
+	if (ret)
+		goto error;
+
+	ret = cci_write(ov6211->regmap, OV6211_REG_MODE_SELECT,
+			OV6211_MODE_STREAMING, NULL);
+	if (ret) {
+		dev_err(ov6211->dev, "failed to start streaming: %d\n", ret);
+		goto error;
+	}
+
+	return 0;
+
+error:
+	pm_runtime_put_autosuspend(ov6211->dev);
+
+	return ret;
+}
+
+static int ov6211_disable_streams(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state, u32 pad,
+				  u64 streams_mask)
+{
+	struct ov6211 *ov6211 = to_ov6211(sd);
+	int ret;
+
+	ret = cci_write(ov6211->regmap, OV6211_REG_MODE_SELECT,
+			OV6211_MODE_STANDBY, NULL);
+	if (ret)
+		dev_err(ov6211->dev, "failed to stop streaming: %d\n", ret);
+
+	pm_runtime_put_autosuspend(ov6211->dev);
+
+	return ret;
+}
+
+static int ov6211_set_pad_format(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state,
+				 struct v4l2_subdev_format *fmt)
+{
+	struct v4l2_mbus_framefmt *format;
+	const struct ov6211_mode *mode;
+
+	format = v4l2_subdev_state_get_format(state, 0);
+
+	mode = v4l2_find_nearest_size(supported_modes,
+				      ARRAY_SIZE(supported_modes),
+				      width, height,
+				      fmt->format.width,
+				      fmt->format.height);
+
+	ov6211_update_pad_format(mode, &fmt->format);
+	*format = fmt->format;
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
+static int ov6211_init_state(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *state)
+{
+	struct v4l2_subdev_format fmt = {
+		.which = V4L2_SUBDEV_FORMAT_TRY,
+		.pad = 0,
+		.format = {
+			.code = MEDIA_BUS_FMT_Y8_1X8,
+			.width = supported_modes[0].width,
+			.height = supported_modes[0].height,
+		},
+	};
+
+	ov6211_set_pad_format(sd, state, &fmt);
+
+	return 0;
+}
+
+static const struct v4l2_subdev_video_ops ov6211_video_ops = {
+	.s_stream = v4l2_subdev_s_stream_helper,
+};
+
+static const struct v4l2_subdev_pad_ops ov6211_pad_ops = {
+	.set_fmt = ov6211_set_pad_format,
+	.get_fmt = v4l2_subdev_get_fmt,
+	.enum_mbus_code = ov6211_enum_mbus_code,
+	.enum_frame_size = ov6211_enum_frame_size,
+	.enable_streams = ov6211_enable_streams,
+	.disable_streams = ov6211_disable_streams,
+};
+
+static const struct v4l2_subdev_ops ov6211_subdev_ops = {
+	.video = &ov6211_video_ops,
+	.pad = &ov6211_pad_ops,
+};
+
+static const struct v4l2_subdev_internal_ops ov6211_internal_ops = {
+	.init_state = ov6211_init_state,
+};
+
+static const struct media_entity_operations ov6211_subdev_entity_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+};
+
+static int ov6211_identify_module(struct ov6211 *ov6211)
+{
+	u64 val;
+	int ret;
+
+	ret = cci_read(ov6211->regmap, OV6211_REG_CHIP_ID, &val, NULL);
+	if (ret) {
+		dev_err(ov6211->dev, "failed to read chip id: %d\n", ret);
+		return ret;
+	}
+
+	if (val != OV6211_CHIP_ID) {
+		dev_err(ov6211->dev, "chip id mismatch: %x!=%llx\n",
+			OV6211_CHIP_ID, val);
+		return -ENODEV;
+	}
+
+	ret = cci_read(ov6211->regmap, OV6211_REG_PRE_ISP,
+		       &ov6211->pre_isp, NULL);
+	if (ret)
+		dev_err(ov6211->dev, "failed to read pre_isp: %d\n", ret);
+
+	return ret;
+}
+
+static int ov6211_check_hwcfg(struct ov6211 *ov6211)
+{
+	struct fwnode_handle *fwnode = dev_fwnode(ov6211->dev), *ep;
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
+	ret = v4l2_link_freq_to_bitmap(ov6211->dev, bus_cfg.link_frequencies,
+				       bus_cfg.nr_of_link_frequencies,
+				       ov6211_link_freq_menu,
+				       ARRAY_SIZE(ov6211_link_freq_menu),
+				       &freq_bitmap);
+
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
+		goto reset_gpio;
+
+	return 0;
+
+reset_gpio:
+	gpiod_set_value_cansleep(ov6211->reset_gpio, 1);
+
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
+	ov6211->dev = &client->dev;
+
+	v4l2_i2c_subdev_init(&ov6211->sd, client, &ov6211_subdev_ops);
+	ov6211->sd.dev = ov6211->dev;
+
+	ov6211->regmap = devm_cci_regmap_init_i2c(client, 16);
+	if (IS_ERR(ov6211->regmap))
+		return dev_err_probe(ov6211->dev, PTR_ERR(ov6211->regmap),
+				     "failed to init CCI\n");
+
+	ov6211->xvclk = devm_v4l2_sensor_clk_get(ov6211->dev, NULL);
+	if (IS_ERR(ov6211->xvclk))
+		return dev_err_probe(ov6211->dev, PTR_ERR(ov6211->xvclk),
+				     "failed to get XVCLK clock\n");
+
+	freq = clk_get_rate(ov6211->xvclk);
+	if (freq && freq != OV6211_MCLK_FREQ_24MHZ)
+		return dev_err_probe(ov6211->dev, -EINVAL,
+				     "XVCLK clock frequency %lu is not supported\n",
+				     freq);
+
+	ret = ov6211_check_hwcfg(ov6211);
+	if (ret)
+		return dev_err_probe(ov6211->dev, ret,
+				     "failed to check HW configuration\n");
+
+	ov6211->reset_gpio = devm_gpiod_get_optional(ov6211->dev, "reset",
+						     GPIOD_OUT_HIGH);
+	if (IS_ERR(ov6211->reset_gpio))
+		return dev_err_probe(ov6211->dev, PTR_ERR(ov6211->reset_gpio),
+				     "cannot get reset GPIO\n");
+
+	ov6211->avdd = devm_regulator_get_optional(ov6211->dev, "avdd");
+	if (IS_ERR(ov6211->avdd)) {
+		ret = PTR_ERR(ov6211->avdd);
+		if (ret != -ENODEV)
+			return dev_err_probe(ov6211->dev, ret,
+					     "Failed to get avdd regulator\n");
+
+		ov6211->avdd = NULL;
+	}
+
+	ov6211->dovdd = devm_regulator_get_optional(ov6211->dev, "dovdd");
+	if (IS_ERR(ov6211->dovdd)) {
+		ret = PTR_ERR(ov6211->dovdd);
+		if (ret != -ENODEV)
+			return dev_err_probe(ov6211->dev, ret,
+					     "Failed to get dovdd regulator\n");
+
+		ov6211->dovdd = NULL;
+	}
+
+	ov6211->dvdd = devm_regulator_get_optional(ov6211->dev, "dvdd");
+	if (IS_ERR(ov6211->dvdd)) {
+		ret = PTR_ERR(ov6211->dvdd);
+		if (ret != -ENODEV)
+			return dev_err_probe(ov6211->dev, ret,
+					     "Failed to get dvdd regulator\n");
+
+		ov6211->dvdd = NULL;
+	}
+
+	/* The sensor must be powered on to read the CHIP_ID register */
+	ret = ov6211_power_on(ov6211->dev);
+	if (ret)
+		return ret;
+
+	ret = ov6211_identify_module(ov6211);
+	if (ret) {
+		dev_err_probe(ov6211->dev, ret, "failed to find sensor\n");
+		goto power_off;
+	}
+
+	ret = ov6211_init_controls(ov6211);
+	if (ret) {
+		dev_err_probe(ov6211->dev, ret, "failed to init controls\n");
+		goto power_off;
+	}
+
+	ov6211->sd.state_lock = ov6211->ctrl_handler.lock;
+	ov6211->sd.internal_ops = &ov6211_internal_ops;
+	ov6211->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	ov6211->sd.entity.ops = &ov6211_subdev_entity_ops;
+	ov6211->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
+	ov6211->pad.flags = MEDIA_PAD_FL_SOURCE;
+
+	ret = media_entity_pads_init(&ov6211->sd.entity, 1, &ov6211->pad);
+	if (ret) {
+		dev_err_probe(ov6211->dev, ret,
+			      "failed to init media entity pads\n");
+		goto v4l2_ctrl_handler_free;
+	}
+
+	ret = v4l2_subdev_init_finalize(&ov6211->sd);
+	if (ret < 0) {
+		dev_err_probe(ov6211->dev, ret,
+			      "failed to init media entity pads\n");
+		goto media_entity_cleanup;
+	}
+
+	pm_runtime_set_active(ov6211->dev);
+	pm_runtime_enable(ov6211->dev);
+
+	ret = v4l2_async_register_subdev_sensor(&ov6211->sd);
+	if (ret < 0) {
+		dev_err_probe(ov6211->dev, ret,
+			      "failed to register V4L2 subdev\n");
+		goto subdev_cleanup;
+	}
+
+	/* Enable runtime PM and turn off the device */
+	pm_runtime_idle(ov6211->dev);
+	pm_runtime_set_autosuspend_delay(ov6211->dev, 1000);
+	pm_runtime_use_autosuspend(ov6211->dev);
+
+	return 0;
+
+subdev_cleanup:
+	v4l2_subdev_cleanup(&ov6211->sd);
+	pm_runtime_disable(ov6211->dev);
+	pm_runtime_set_suspended(ov6211->dev);
+
+media_entity_cleanup:
+	media_entity_cleanup(&ov6211->sd.entity);
+
+v4l2_ctrl_handler_free:
+	v4l2_ctrl_handler_free(ov6211->sd.ctrl_handler);
+
+power_off:
+	ov6211_power_off(ov6211->dev);
+
+	return ret;
+}
+
+static void ov6211_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct ov6211 *ov6211 = to_ov6211(sd);
+
+	v4l2_async_unregister_subdev(sd);
+	v4l2_subdev_cleanup(sd);
+	media_entity_cleanup(&sd->entity);
+	v4l2_ctrl_handler_free(sd->ctrl_handler);
+	pm_runtime_disable(ov6211->dev);
+
+	if (!pm_runtime_status_suspended(ov6211->dev)) {
+		ov6211_power_off(ov6211->dev);
+		pm_runtime_set_suspended(ov6211->dev);
+	}
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


