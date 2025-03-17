Return-Path: <linux-media+bounces-28324-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D288A638F0
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 01:40:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 179D1188D679
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 00:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF4BE49620;
	Mon, 17 Mar 2025 00:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LODKKn6K"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BA0EED8
	for <linux-media@vger.kernel.org>; Mon, 17 Mar 2025 00:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742171984; cv=none; b=SMQJwsv6PB0hxpSEaANqB0lXyn+8BrmypXRf5Hy/8ecQD1Pzlk3UCCfh2kihAnKSXkpw7X4yXBP5hPwCX529r4u6wGl3v3HCZ6dZr1hWbGQ/CKHtOH1NWrTXQnfKrgn2Bm1kjfGbeqTljzY0/as1MwOSHYnnYkhfCq6YnPqWVl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742171984; c=relaxed/simple;
	bh=LNaAkzEltZLxOUbOqbFu9FNibqscZviTnVjPzj8sR4E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b5Ri0mV0YVXS29rrie89GOHyEwfUYOO9K+eQQdcgmRSP2OzIaPF3SC6rxU+vFVrJ6JI0j0GfNsGvcRyX85Ux0s7dwj7sg6VB3xX31O3mmfp4mOgEWigRDy2FmWJ9AI47MZcacXJ+PJ2lAdHVSqWh0QpEaHSPRHZSsF85UMxFUf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LODKKn6K; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so207293266b.3
        for <linux-media@vger.kernel.org>; Sun, 16 Mar 2025 17:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742171980; x=1742776780; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ihwPD3UMc4J97W1CrIubuAYVRcrzaarmeWo517AInDE=;
        b=LODKKn6K9eCuglMQv1zVVvHBz1znx+2ySLJgzhEdD+toCGbmg6Sfx4zU+GBUBe9GEm
         XiXQxg8Tk3oAbmWU5S0/g1dkL6R9hjCa041byrzeeoPUEaXXHtBAR6Zx4Od0x+8KgGgN
         FlubSkqMfI5Rd3rvCNF8uXSeS8DZlW6nc3iUPIJHqwzI6Rs+E5+CUGCyKpJpOwoH9Ko4
         lxkQK/+HMZfFWNuZp0pBuDGbNzupmX0xLpPAJkMJRtW/sLXfr6vlHR9jub3UsYBo4Q2Q
         wvKGWek/6m9X0qdbXkeVP+ltlbqezTKDuy5WoN/zssAf8axgHnph/0y4W5FAs6mOS22H
         IAJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742171980; x=1742776780;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihwPD3UMc4J97W1CrIubuAYVRcrzaarmeWo517AInDE=;
        b=gXTT/s6M8Crq3uXJ5zb58DgTmKz21xci3m4EKDPanHx94F0nLMQfZC9a7sxmOqs8bD
         F7kr29OsvM28jc2CBfEGWh/9Oe2/mwehru7f/mZp/+yC3jZ/YPz2a4pplgE1aBLEYRUe
         i2F7MZ2aClAdGWbfezJukcRo5Ft45gU7Fr8FPXjft0yz2puHqWed2J1J2Pz7l6wGprc/
         JQ5+6GIjaRH7KG7doeShvpjGVjrEz1QD4tO2SkwCi/byp8qGZ5eAIb6kKvdyqcmzYh7B
         q06vMNrQkj7njaTWyS0mAXATlWCL7nlBD+WVFPzK42NALlgDW4W34xpbcjx/XSigFP4q
         0kaw==
X-Forwarded-Encrypted: i=1; AJvYcCUEOADiBWa38Txdzyc+vYrIdUCWrx1PytdC0uJqT3hCRfVP2lB1klgnU1UMt6ZE+TwDeC/lxHsWNNjpvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz39/WHNxbVBpYHhOjO8Bos3chYCH3d+f0YsVex3PIoaBuVBiWO
	H5sJGlHtG1al9CQuD3JPSO5vW8+GcbuGtDoabB4s0xXinuLKUFDcMYMGQ7AFhgA=
X-Gm-Gg: ASbGncuXCuxGUPWy95wHLvCmjqi8pR92Mfmfk3ja8Fp7ORpqelmigKGWAUIzWFjIs+V
	vgNxjmDZSDZ9I/3bc+WdkQEdXTZTn76KC0urnRtwAHzx53YiMYhbf9AfItxoAir8j/xeF4SNvOD
	thSLcwhzUizyWBMN5w9lJzzYgt6SdZQu5JYJN8PZkV+XrslL06YWPE6fELbb80vMO19gyWOAvRV
	ga+dq+Hvr2GUIIF/sFDi06NsAiKZLp2/DCCImEHRKXxJ7rc3kpC2gVY5WsyTS1bnm+oVBfYghjL
	6sZDWH/w6rfBFgtcsifWjTpQnt9u1nW1g1XdYCFRpJU6NqN6ndmmFsHEDozccySj+CWcJd83wkT
	x87RQSmDK22VS5/owNT5BT5S7ewodzRKMWAUTjQzjhUcK0qtP2JsZpqTQ9+LlSpNUoctp
X-Google-Smtp-Source: AGHT+IE0OpVCIFv22B4bWrLXG3KIuV47aR4P9f6EwKgo1+B4sxrYAEkQVg1rvg7xp/ohDKUmIE9O2g==
X-Received: by 2002:a17:907:2d89:b0:ac2:fa32:f3 with SMTP id a640c23a62f3a-ac330506270mr1224633366b.52.1742171979711;
        Sun, 16 Mar 2025 17:39:39 -0700 (PDT)
Received: from [192.168.178.107] (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3146aefadsm562407166b.8.2025.03.16.17.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 17:39:38 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 17 Mar 2025 00:39:33 +0000
Subject: [PATCH 1/8] media: i2c: add OV02E10 image sensor driver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-b4-media-comitters-next-25-03-13-ov02e10-v1-1-bd924634b889@linaro.org>
References: <20250317-b4-media-comitters-next-25-03-13-ov02e10-v1-0-bd924634b889@linaro.org>
In-Reply-To: <20250317-b4-media-comitters-next-25-03-13-ov02e10-v1-0-bd924634b889@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Jingjing Xiong <jingjing.xiong@intel.com>, Hao Yao <hao.yao@intel.com>, 
 Jim Lai <jim.lai@intel.com>, You-Sheng Yang <vicamo.yang@canonical.com>, 
 Alan Stern <stern@rowland.harvard.edu>, Hans de Goede <hdegoede@redhat.com>, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2

From: Jingjing Xiong <jingjing.xiong@intel.com>

Add in the ov02e10 driver from the Intel IPU6 repository.

Signed-off-by: Jingjing Xiong <jingjing.xiong@intel.com>
Co-developed-by: Hao Yao <hao.yao@intel.com>
Signed-off-by: Hao Yao <hao.yao@intel.com>
Co-developed-by: Jim Lai <jim.lai@intel.com>
Signed-off-by: Jim Lai <jim.lai@intel.com>
Co-developed-by: You-Sheng Yang <vicamo.yang@canonical.com>
Signed-off-by: You-Sheng Yang <vicamo.yang@canonical.com>
Co-developed-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Co-developed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/i2c/Kconfig   |  10 +
 drivers/media/i2c/Makefile  |   1 +
 drivers/media/i2c/ov02e10.c | 975 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 986 insertions(+)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index e576b213084d232e90b7e556a7a855a3bb95544c..7b8af1c87a0e40c19ef8ddb9a8603a1962877163 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -356,6 +356,16 @@ config VIDEO_OV02A10
 	  To compile this driver as a module, choose M here: the
 	  module will be called ov02a10.
 
+config VIDEO_OV02E10
+	tristate "OmniVision OV02E10 sensor support"
+	select V4L2_CCI_I2C
+	help
+	  This is a Video4Linux2 sensor driver for the OmniVision
+	  OV02E10 camera.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called ov02e10.
+
 config VIDEO_OV08D10
         tristate "OmniVision OV08D10 sensor support"
         help
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index 6c23a4463527cf762032df663bbfe26be29018c8..ed5e62fd6199d8c0ab0d3104fd353243021a11be 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -83,6 +83,7 @@ obj-$(CONFIG_VIDEO_MT9V111) += mt9v111.o
 obj-$(CONFIG_VIDEO_OG01A1B) += og01a1b.o
 obj-$(CONFIG_VIDEO_OV01A10) += ov01a10.o
 obj-$(CONFIG_VIDEO_OV02A10) += ov02a10.o
+obj-$(CONFIG_VIDEO_OV02E10) += ov02e10.o
 obj-$(CONFIG_VIDEO_OV08D10) += ov08d10.o
 obj-$(CONFIG_VIDEO_OV08X40) += ov08x40.o
 obj-$(CONFIG_VIDEO_OV13858) += ov13858.o
diff --git a/drivers/media/i2c/ov02e10.c b/drivers/media/i2c/ov02e10.c
new file mode 100644
index 0000000000000000000000000000000000000000..8c4455b3643307be5b1e8110979740a7e843c146
--- /dev/null
+++ b/drivers/media/i2c/ov02e10.c
@@ -0,0 +1,975 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2023 Intel Corporation.
+
+#include <linux/acpi.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <media/v4l2-cci.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
+
+#define OV02E10_LINK_FREQ_360MHZ	360000000ULL
+#define OV02E10_SCLK			36000000LL
+#define OV02E10_MCLK			19200000
+#define OV02E10_DATA_LANES		2
+#define OV02E10_RGB_DEPTH		10
+
+#define OV02E10_REG_PAGE_FLAG		CCI_REG8(0xfd)
+#define OV02E10_PAGE_0			0x0
+#define OV02E10_PAGE_1			0x1
+#define OV02E10_PAGE_2			0x2
+#define OV02E10_PAGE_3			0x3
+#define OV02E10_PAGE_5			0x4
+#define OV02E10_PAGE_7			0x5
+#define OV02E10_PAGE_8			0x6
+#define OV02E10_PAGE_9			0xF
+#define OV02E10_PAGE_D			0x8
+#define OV02E10_PAGE_E			0x9
+#define OV02E10_PAGE_F			0xA
+
+#define OV02E10_REG_CHIP_ID		CCI_REG32(0x00)
+#define OV02E10_CHIP_ID			0x45025610
+
+/* vertical-timings from sensor */
+#define OV02E10_REG_VTS			CCI_REG16(0x35)
+#define OV02E10_VTS_DEF			2244
+#define OV02E10_VTS_MIN			2244
+#define OV02E10_VTS_MAX			0x7fff
+
+/* horizontal-timings from sensor */
+#define OV02E10_REG_HTS			CCI_REG16(0x37)
+
+/* Exposure controls from sensor */
+#define OV02E10_REG_EXPOSURE		CCI_REG16(0x03)
+#define OV02E10_EXPOSURE_MIN		1
+#define OV02E10_EXPOSURE_MAX_MARGIN	2
+#define OV02E10_EXPOSURE_STEP		1
+
+/* Analog gain controls from sensor */
+#define OV02E10_REG_ANALOG_GAIN		CCI_REG8(0x24)
+#define OV02E10_ANAL_GAIN_MIN		0x10
+#define OV02E10_ANAL_GAIN_MAX		0xf8
+#define OV02E10_ANAL_GAIN_STEP		1
+
+/* Digital gain controls from sensor */
+#define OV02E10_REG_DIGITAL_GAIN	CCI_REG16(0x21)
+#define OV02E10_DGTL_GAIN_MIN		256
+#define OV02E10_DGTL_GAIN_MAX		1020
+#define OV02E10_DGTL_GAIN_STEP		1
+#define OV02E10_DGTL_GAIN_DEFAULT	256
+
+/* Register update control */
+#define OV02E10_REG_COMMAND_UPDATE	CCI_REG8(0xE7)
+#define OV02E10_COMMAND_UPDATE		0x00
+#define OV02E10_COMMAND_HOLD		0x01
+
+/* Test Pattern Control */
+#define OV02E10_REG_TEST_PATTERN	CCI_REG8(0x12)
+#define OV02E10_TEST_PATTERN_ENABLE	BIT(0)
+#define OV02E10_TEST_PATTERN_BAR_SHIFT	1
+
+enum {
+	OV02E10_LINK_FREQ_360MHZ_INDEX,
+};
+
+struct reg_sequence_list {
+	u32 num_regs;
+	const struct reg_sequence *regs;
+};
+
+struct ov02e10_mode {
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
+	u32 vts_def;
+
+	/* Min vertical timining size */
+	u32 vts_min;
+
+	/* Link frequency needed for this resolution */
+	u32 link_freq_index;
+
+	/* Sensor register settings for this resolution */
+	const struct reg_sequence_list reg_list;
+};
+
+static const struct reg_sequence mode_1928x1088_30fps_2lane[] = {
+	{ 0xfd, 0x00 },
+	{ 0x20, 0x00 },
+	{ 0x20, 0x0b },
+	{ 0x21, 0x02 },
+	{ 0x10, 0x23 },
+	{ 0xc5, 0x04 },
+	{ 0x21, 0x00 },
+	{ 0x14, 0x96 },
+	{ 0x17, 0x01 },
+	{ 0xfd, 0x01 },
+	{ 0x03, 0x00 },
+	{ 0x04, 0x04 },
+	{ 0x05, 0x04 },
+	{ 0x06, 0x62 },
+	{ 0x07, 0x01 },
+	{ 0x22, 0x80 },
+	{ 0x24, 0xff },
+	{ 0x40, 0xc6 },
+	{ 0x41, 0x18 },
+	{ 0x45, 0x3f },
+	{ 0x48, 0x0c },
+	{ 0x4c, 0x08 },
+	{ 0x51, 0x12 },
+	{ 0x52, 0x10 },
+	{ 0x57, 0x98 },
+	{ 0x59, 0x06 },
+	{ 0x5a, 0x04 },
+	{ 0x5c, 0x38 },
+	{ 0x5e, 0x10 },
+	{ 0x67, 0x11 },
+	{ 0x7b, 0x04 },
+	{ 0x81, 0x12 },
+	{ 0x90, 0x51 },
+	{ 0x91, 0x09 },
+	{ 0x92, 0x21 },
+	{ 0x93, 0x28 },
+	{ 0x95, 0x54 },
+	{ 0x9d, 0x20 },
+	{ 0x9e, 0x04 },
+	{ 0xb1, 0x9a },
+	{ 0xb2, 0x86 },
+	{ 0xb6, 0x3f },
+	{ 0xb9, 0x30 },
+	{ 0xc1, 0x01 },
+	{ 0xc5, 0xa0 },
+	{ 0xc6, 0x73 },
+	{ 0xc7, 0x04 },
+	{ 0xc8, 0x25 },
+	{ 0xc9, 0x05 },
+	{ 0xca, 0x28 },
+	{ 0xcb, 0x00 },
+	{ 0xcf, 0x16 },
+	{ 0xd2, 0xd0 },
+	{ 0xd7, 0x3f },
+	{ 0xd8, 0x40 },
+	{ 0xd9, 0x40 },
+	{ 0xda, 0x44 },
+	{ 0xdb, 0x3d },
+	{ 0xdc, 0x3d },
+	{ 0xdd, 0x3d },
+	{ 0xde, 0x3d },
+	{ 0xdf, 0xf0 },
+	{ 0xea, 0x0f },
+	{ 0xeb, 0x04 },
+	{ 0xec, 0x29 },
+	{ 0xee, 0x47 },
+	{ 0xfd, 0x01 },
+	{ 0x31, 0x01 },
+	{ 0x27, 0x00 },
+	{ 0x2f, 0x41 },
+	{ 0xfd, 0x02 },
+	{ 0xa1, 0x01 },
+	{ 0xfd, 0x02 },
+	{ 0x9a, 0x03 },
+	{ 0xfd, 0x03 },
+	{ 0x9d, 0x0f },
+	{ 0xfd, 0x07 },
+	{ 0x42, 0x00 },
+	{ 0x43, 0xad },
+	{ 0x44, 0x00 },
+	{ 0x45, 0xa8 },
+	{ 0x46, 0x00 },
+	{ 0x47, 0xa8 },
+	{ 0x48, 0x00 },
+	{ 0x49, 0xad },
+	{ 0xfd, 0x00 },
+	{ 0xc4, 0x01 },
+	{ 0xfd, 0x01 },
+	{ 0x33, 0x03 },
+	{ 0xfd, 0x00 },
+	{ 0x20, 0x1f },
+};
+
+static const char *const ov02e10_test_pattern_menu[] = {
+	"Disabled",
+	"Color Bar",
+};
+
+static const s64 link_freq_menu_items[] = {
+	OV02E10_LINK_FREQ_360MHZ,
+};
+
+static const struct ov02e10_mode supported_modes[] = {
+	{
+		.width = 1928,
+		.height = 1088,
+		.hts = 534,
+		.vts_def = 2244,
+		.vts_min = 2244,
+		.reg_list = {
+			.num_regs = ARRAY_SIZE(mode_1928x1088_30fps_2lane),
+			.regs = mode_1928x1088_30fps_2lane,
+		},
+
+		.link_freq_index = OV02E10_LINK_FREQ_360MHZ_INDEX,
+	},
+};
+
+struct ov02e10 {
+	struct regmap *regmap;
+	struct v4l2_subdev sd;
+	struct media_pad pad;
+	struct v4l2_ctrl_handler ctrl_handler;
+
+	/* V4L2 Controls */
+	struct v4l2_ctrl *link_freq;
+	struct v4l2_ctrl *pixel_rate;
+	struct v4l2_ctrl *vblank;
+	struct v4l2_ctrl *hblank;
+	struct v4l2_ctrl *exposure;
+
+	struct clk *img_clk;
+	struct regulator *avdd;
+	struct gpio_desc *reset;
+	struct gpio_desc *handshake;
+
+	/* Current mode */
+	const struct ov02e10_mode *cur_mode;
+
+	/* To serialize asynchronus callbacks */
+	struct mutex mutex;
+
+	/* Streaming on/off */
+	bool streaming;
+};
+
+static inline struct ov02e10 *to_ov02e10(struct v4l2_subdev *subdev)
+{
+	return container_of(subdev, struct ov02e10, sd);
+}
+
+static u64 to_pixel_rate(u32 f_index)
+{
+	u64 pixel_rate = link_freq_menu_items[f_index] * 2 * OV02E10_DATA_LANES;
+
+	do_div(pixel_rate, OV02E10_RGB_DEPTH);
+
+	return pixel_rate;
+}
+
+static u64 to_pixels_per_line(u32 hts, u32 f_index)
+{
+	u64 ppl = hts * to_pixel_rate(f_index);
+
+	do_div(ppl, OV02E10_SCLK);
+
+	return ppl;
+}
+
+static void ov02e10_test_pattern(struct ov02e10 *ov02e10, u32 pattern, int *pret)
+{
+	if (pattern)
+		pattern = pattern << OV02E10_TEST_PATTERN_BAR_SHIFT |
+		    OV02E10_TEST_PATTERN_ENABLE;
+
+	cci_write(ov02e10->regmap, OV02E10_REG_TEST_PATTERN, pattern, pret);
+}
+
+static int ov02e10_set_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct ov02e10 *ov02e10 = container_of(ctrl->handler,
+					       struct ov02e10, ctrl_handler);
+	struct i2c_client *client = v4l2_get_subdevdata(&ov02e10->sd);
+	s64 exposure_max;
+	int ret;
+
+	/* Propagate change of current control to all related controls */
+	if (ctrl->id == V4L2_CID_VBLANK) {
+		/* Update max exposure while meeting expected vblanking */
+		exposure_max = ov02e10->cur_mode->height + ctrl->val -
+		    OV02E10_EXPOSURE_MAX_MARGIN;
+		__v4l2_ctrl_modify_range(ov02e10->exposure,
+					 ov02e10->exposure->minimum,
+					 exposure_max, ov02e10->exposure->step,
+					 exposure_max);
+	}
+
+	/* V4L2 controls values will be applied only when power is already up */
+	if (!pm_runtime_get_if_in_use(&client->dev))
+		return 0;
+	ret = cci_write(ov02e10->regmap, OV02E10_REG_COMMAND_UPDATE,
+			OV02E10_COMMAND_HOLD, NULL);
+
+	switch (ctrl->id) {
+	case V4L2_CID_ANALOGUE_GAIN:
+		dev_dbg(&client->dev, "set analog gain\n");
+		cci_write(ov02e10->regmap, OV02E10_REG_PAGE_FLAG,
+			  OV02E10_PAGE_1, &ret);
+		cci_write(ov02e10->regmap, OV02E10_REG_ANALOG_GAIN,
+			  ctrl->val, &ret);
+		break;
+
+	case V4L2_CID_DIGITAL_GAIN:
+		dev_dbg(&client->dev, "set digital gain\n");
+		cci_write(ov02e10->regmap, OV02E10_REG_PAGE_FLAG,
+			  OV02E10_PAGE_1, &ret);
+		cci_write(ov02e10->regmap, OV02E10_REG_DIGITAL_GAIN,
+			  ctrl->val, &ret);
+		break;
+
+	case V4L2_CID_EXPOSURE:
+		dev_dbg(&client->dev, "set exposure\n");
+		cci_write(ov02e10->regmap, OV02E10_REG_PAGE_FLAG,
+			  OV02E10_PAGE_1, &ret);
+		cci_write(ov02e10->regmap, OV02E10_REG_EXPOSURE,
+			  ctrl->val, &ret);
+		break;
+
+	case V4L2_CID_VBLANK:
+		dev_dbg(&client->dev, "set vblank\n");
+		cci_write(ov02e10->regmap, OV02E10_REG_PAGE_FLAG,
+			  OV02E10_PAGE_1, &ret);
+		cci_write(ov02e10->regmap, OV02E10_REG_VTS,
+			  ov02e10->cur_mode->height + ctrl->val, &ret);
+		break;
+
+	case V4L2_CID_TEST_PATTERN:
+		dev_dbg(&client->dev, "set test pattern\n");
+		cci_write(ov02e10->regmap, OV02E10_REG_PAGE_FLAG,
+			  OV02E10_PAGE_1, &ret);
+		ov02e10_test_pattern(ov02e10, ctrl->val, &ret);
+		break;
+
+	default:
+		ret = -EINVAL;
+		break;
+	}
+	dev_dbg(&client->dev, "will update cmd\n");
+	cci_write(ov02e10->regmap, OV02E10_REG_COMMAND_UPDATE,
+		  OV02E10_COMMAND_UPDATE, &ret);
+
+	pm_runtime_put(&client->dev);
+
+	return ret;
+}
+
+static const struct v4l2_ctrl_ops ov02e10_ctrl_ops = {
+	.s_ctrl = ov02e10_set_ctrl,
+};
+
+static int ov02e10_init_controls(struct ov02e10 *ov02e10)
+{
+	struct v4l2_ctrl_handler *ctrl_hdlr;
+	const struct ov02e10_mode *cur_mode;
+	s64 exposure_max, h_blank, pixel_rate;
+	u32 vblank_min, vblank_max, vblank_default;
+	int size;
+	int ret;
+
+	ctrl_hdlr = &ov02e10->ctrl_handler;
+	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 8);
+
+	if (ret)
+		return ret;
+
+	ctrl_hdlr->lock = &ov02e10->mutex;
+	cur_mode = ov02e10->cur_mode;
+	size = ARRAY_SIZE(link_freq_menu_items);
+
+	ov02e10->link_freq =
+	    v4l2_ctrl_new_int_menu(ctrl_hdlr, &ov02e10_ctrl_ops,
+				   V4L2_CID_LINK_FREQ, size - 1, 0,
+				   link_freq_menu_items);
+	if (ov02e10->link_freq)
+		ov02e10->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	pixel_rate = to_pixel_rate(OV02E10_LINK_FREQ_360MHZ_INDEX);
+	ov02e10->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &ov02e10_ctrl_ops,
+						V4L2_CID_PIXEL_RATE, 0,
+						pixel_rate, 1, pixel_rate);
+
+	vblank_min = cur_mode->vts_min - cur_mode->height;
+	vblank_max = OV02E10_VTS_MAX - cur_mode->height;
+	vblank_default = cur_mode->vts_def - cur_mode->height;
+	ov02e10->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &ov02e10_ctrl_ops,
+					    V4L2_CID_VBLANK, vblank_min,
+					    vblank_max, 1, vblank_default);
+
+	h_blank = to_pixels_per_line(cur_mode->hts, cur_mode->link_freq_index);
+	h_blank -= cur_mode->width;
+	ov02e10->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &ov02e10_ctrl_ops,
+					    V4L2_CID_HBLANK, h_blank, h_blank,
+					    1, h_blank);
+	if (ov02e10->hblank)
+		ov02e10->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	v4l2_ctrl_new_std(ctrl_hdlr, &ov02e10_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
+			  OV02E10_ANAL_GAIN_MIN, OV02E10_ANAL_GAIN_MAX,
+			  OV02E10_ANAL_GAIN_STEP, OV02E10_ANAL_GAIN_MIN);
+	v4l2_ctrl_new_std(ctrl_hdlr, &ov02e10_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
+			  OV02E10_DGTL_GAIN_MIN, OV02E10_DGTL_GAIN_MAX,
+			  OV02E10_DGTL_GAIN_STEP, OV02E10_DGTL_GAIN_DEFAULT);
+	exposure_max = cur_mode->vts_def - OV02E10_EXPOSURE_MAX_MARGIN;
+	ov02e10->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &ov02e10_ctrl_ops,
+					      V4L2_CID_EXPOSURE,
+					      OV02E10_EXPOSURE_MIN,
+					      exposure_max,
+					      OV02E10_EXPOSURE_STEP,
+					      exposure_max);
+	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &ov02e10_ctrl_ops,
+				     V4L2_CID_TEST_PATTERN,
+				     ARRAY_SIZE(ov02e10_test_pattern_menu) - 1,
+				     0, 0, ov02e10_test_pattern_menu);
+	if (ctrl_hdlr->error)
+		return ctrl_hdlr->error;
+
+	ov02e10->sd.ctrl_handler = ctrl_hdlr;
+
+	return 0;
+}
+
+static void ov02e10_update_pad_format(const struct ov02e10_mode *mode,
+				      struct v4l2_mbus_framefmt *fmt)
+{
+	fmt->width = mode->width;
+	fmt->height = mode->height;
+	fmt->code = MEDIA_BUS_FMT_SGRBG10_1X10;
+	fmt->field = V4L2_FIELD_NONE;
+}
+
+static int ov02e10_set_stream_mode(struct ov02e10 *ov02e10, u8 val)
+{
+	int ret = 0;
+
+	cci_write(ov02e10->regmap, OV02E10_REG_PAGE_FLAG, OV02E10_PAGE_0, &ret);
+	cci_write(ov02e10->regmap, CCI_REG8(0xa0), val, &ret);
+	cci_write(ov02e10->regmap, OV02E10_REG_PAGE_FLAG, OV02E10_PAGE_1, &ret);
+	cci_write(ov02e10->regmap, CCI_REG8(0x01), 0x02, &ret);
+
+	return ret;
+}
+
+static int ov02e10_start_streaming(struct ov02e10 *ov02e10)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&ov02e10->sd);
+	const struct reg_sequence_list *reg_list;
+	int ret;
+
+	reg_list = &ov02e10->cur_mode->reg_list;
+	ret = regmap_multi_reg_write(ov02e10->regmap, reg_list->regs,
+				     reg_list->num_regs);
+	if (ret) {
+		dev_err(&client->dev, "failed to set mode\n");
+		return ret;
+	}
+	ret = __v4l2_ctrl_handler_setup(ov02e10->sd.ctrl_handler);
+	if (ret) {
+		dev_err(&client->dev, "setup V4L2 ctrl handler fail\n");
+		return ret;
+	}
+
+	return ov02e10_set_stream_mode(ov02e10, 1);
+}
+
+static inline void ov02e10_stop_streaming(struct ov02e10 *ov02e10)
+{
+	ov02e10_set_stream_mode(ov02e10, 0);
+}
+
+static int ov02e10_set_stream(struct v4l2_subdev *sd, int enable)
+{
+	struct ov02e10 *ov02e10 = to_ov02e10(sd);
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	int ret = 0;
+
+	if (ov02e10->streaming == enable)
+		return 0;
+
+	mutex_lock(&ov02e10->mutex);
+	if (enable) {
+		ret = pm_runtime_get_sync(&client->dev);
+		if (ret < 0) {
+			pm_runtime_put_noidle(&client->dev);
+			mutex_unlock(&ov02e10->mutex);
+			return ret;
+		}
+
+		ret = ov02e10_start_streaming(ov02e10);
+		if (ret) {
+			dev_dbg(&client->dev, "start streaming failed\n");
+			enable = 0;
+			ov02e10_stop_streaming(ov02e10);
+			pm_runtime_put(&client->dev);
+		}
+	} else {
+		ov02e10_stop_streaming(ov02e10);
+		pm_runtime_put(&client->dev);
+	}
+
+	ov02e10->streaming = enable;
+	mutex_unlock(&ov02e10->mutex);
+
+	return ret;
+}
+
+/* This function tries to get power control resources */
+static int ov02e10_get_pm_resources(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct ov02e10 *ov02e10 = to_ov02e10(sd);
+	int ret;
+
+	ov02e10->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(ov02e10->reset))
+		return dev_err_probe(dev, PTR_ERR(ov02e10->reset),
+				     "failed to get reset gpio\n");
+
+	ov02e10->handshake = devm_gpiod_get_optional(dev, "handshake",
+						   GPIOD_OUT_LOW);
+	if (IS_ERR(ov02e10->handshake))
+		return dev_err_probe(dev, PTR_ERR(ov02e10->handshake),
+				     "failed to get handshake gpio\n");
+
+	ov02e10->img_clk = devm_clk_get_optional(dev, NULL);
+	if (IS_ERR(ov02e10->img_clk))
+		return dev_err_probe(dev, PTR_ERR(ov02e10->img_clk),
+				     "failed to get imaging clock\n");
+
+	ov02e10->avdd = devm_regulator_get_optional(dev, "avdd");
+	if (IS_ERR(ov02e10->avdd)) {
+		ret = PTR_ERR(ov02e10->avdd);
+		ov02e10->avdd = NULL;
+		if (ret != -ENODEV)
+			return dev_err_probe(dev, ret,
+					     "failed to get avdd regulator\n");
+	}
+
+	return 0;
+}
+
+static int ov02e10_power_off(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct ov02e10 *ov02e10 = to_ov02e10(sd);
+	int ret = 0;
+
+	gpiod_set_value_cansleep(ov02e10->reset, 1);
+	gpiod_set_value_cansleep(ov02e10->handshake, 0);
+
+	if (ov02e10->avdd)
+		ret = regulator_disable(ov02e10->avdd);
+
+	clk_disable_unprepare(ov02e10->img_clk);
+
+	return ret;
+}
+
+static int ov02e10_power_on(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct ov02e10 *ov02e10 = to_ov02e10(sd);
+	int ret;
+
+	ret = clk_prepare_enable(ov02e10->img_clk);
+	if (ret < 0) {
+		dev_err(dev, "failed to enable imaging clock: %d\n", ret);
+		return ret;
+	}
+
+	if (ov02e10->avdd) {
+		ret = regulator_enable(ov02e10->avdd);
+		if (ret < 0) {
+			dev_err(dev, "failed to enable avdd: %d\n", ret);
+			clk_disable_unprepare(ov02e10->img_clk);
+			return ret;
+		}
+	}
+	gpiod_set_value_cansleep(ov02e10->handshake, 1);
+	gpiod_set_value_cansleep(ov02e10->reset, 0);
+
+	/* Lattice MIPI aggregator with some version FW needs longer delay
+	   after handshake triggered. We set 25ms as a safe value and wait
+	   for a stable version FW. */
+	msleep_interruptible(25);
+
+	return ret;
+}
+
+static int __maybe_unused ov02e10_suspend(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct ov02e10 *ov02e10 = to_ov02e10(sd);
+
+	mutex_lock(&ov02e10->mutex);
+	if (ov02e10->streaming)
+		ov02e10_stop_streaming(ov02e10);
+
+	mutex_unlock(&ov02e10->mutex);
+
+	return 0;
+}
+
+static int __maybe_unused ov02e10_resume(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct ov02e10 *ov02e10 = to_ov02e10(sd);
+	int ret = 0;
+
+	mutex_lock(&ov02e10->mutex);
+	if (!ov02e10->streaming)
+		goto exit;
+
+	ret = ov02e10_start_streaming(ov02e10);
+	if (ret) {
+		ov02e10->streaming = false;
+		ov02e10_stop_streaming(ov02e10);
+	}
+
+exit:
+	mutex_unlock(&ov02e10->mutex);
+	return ret;
+}
+
+static int ov02e10_set_format(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *sd_state,
+			      struct v4l2_subdev_format *fmt)
+{
+	struct ov02e10 *ov02e10 = to_ov02e10(sd);
+	const struct ov02e10_mode *mode;
+	s32 vblank_def, h_blank;
+
+	mode = v4l2_find_nearest_size(supported_modes,
+				      ARRAY_SIZE(supported_modes),
+				      width, height, fmt->format.width,
+				      fmt->format.height);
+
+	mutex_lock(&ov02e10->mutex);
+	ov02e10_update_pad_format(mode, &fmt->format);
+	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
+		*v4l2_subdev_state_get_format(sd_state, fmt->pad) =
+		    fmt->format;
+	} else {
+		ov02e10->cur_mode = mode;
+		__v4l2_ctrl_s_ctrl(ov02e10->link_freq, mode->link_freq_index);
+		__v4l2_ctrl_s_ctrl_int64(ov02e10->pixel_rate,
+					 to_pixel_rate(mode->link_freq_index));
+
+		/* Update limits and set FPS to default */
+		vblank_def = mode->vts_def - mode->height;
+		__v4l2_ctrl_modify_range(ov02e10->vblank,
+					 mode->vts_min - mode->height,
+					 OV02E10_VTS_MAX - mode->height, 1,
+					 vblank_def);
+		__v4l2_ctrl_s_ctrl(ov02e10->vblank, vblank_def);
+		h_blank = to_pixels_per_line(mode->hts, mode->link_freq_index) -
+		    mode->width;
+		__v4l2_ctrl_modify_range(ov02e10->hblank, h_blank, h_blank, 1,
+					 h_blank);
+	}
+	mutex_unlock(&ov02e10->mutex);
+
+	return 0;
+}
+
+static int ov02e10_get_format(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *sd_state,
+			      struct v4l2_subdev_format *fmt)
+{
+	struct ov02e10 *ov02e10 = to_ov02e10(sd);
+
+	mutex_lock(&ov02e10->mutex);
+	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
+		fmt->format = *v4l2_subdev_state_get_format(sd_state, fmt->pad);
+	else
+		ov02e10_update_pad_format(ov02e10->cur_mode, &fmt->format);
+
+	mutex_unlock(&ov02e10->mutex);
+
+	return 0;
+}
+
+static int ov02e10_enum_mbus_code(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *sd_state,
+				  struct v4l2_subdev_mbus_code_enum *code)
+{
+	if (code->index > 0)
+		return -EINVAL;
+
+	code->code = MEDIA_BUS_FMT_SGRBG10_1X10;
+
+	return 0;
+}
+
+static int ov02e10_enum_frame_size(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *sd_state,
+				   struct v4l2_subdev_frame_size_enum *fse)
+{
+	if (fse->index >= ARRAY_SIZE(supported_modes))
+		return -EINVAL;
+
+	if (fse->code != MEDIA_BUS_FMT_SGRBG10_1X10)
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
+static int ov02e10_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
+{
+	struct ov02e10 *ov02e10 = to_ov02e10(sd);
+
+	mutex_lock(&ov02e10->mutex);
+	ov02e10_update_pad_format(&supported_modes[0],
+				  v4l2_subdev_state_get_format(fh->state, 0));
+	mutex_unlock(&ov02e10->mutex);
+
+	return 0;
+}
+
+static const struct v4l2_subdev_video_ops ov02e10_video_ops = {
+	.s_stream = ov02e10_set_stream,
+};
+
+static const struct v4l2_subdev_pad_ops ov02e10_pad_ops = {
+	.set_fmt = ov02e10_set_format,
+	.get_fmt = ov02e10_get_format,
+	.enum_mbus_code = ov02e10_enum_mbus_code,
+	.enum_frame_size = ov02e10_enum_frame_size,
+};
+
+static const struct v4l2_subdev_ops ov02e10_subdev_ops = {
+	.video = &ov02e10_video_ops,
+	.pad = &ov02e10_pad_ops,
+};
+
+static const struct media_entity_operations ov02e10_subdev_entity_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+};
+
+static const struct v4l2_subdev_internal_ops ov02e10_internal_ops = {
+	.open = ov02e10_open,
+};
+
+static int ov02e10_identify_module(struct ov02e10 *ov02e10)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&ov02e10->sd);
+	int ret;
+	u64 val;
+
+	ret = cci_write(ov02e10->regmap, OV02E10_REG_PAGE_FLAG,
+			   OV02E10_PAGE_0, NULL);
+	cci_read(ov02e10->regmap, OV02E10_REG_CHIP_ID, &val, &ret);
+	if (ret)
+		return ret;
+
+	if (val != OV02E10_CHIP_ID) {
+		dev_err(&client->dev, "chip id mismatch: %x!=%x\n",
+			OV02E10_CHIP_ID, (u32) val);
+		return -ENXIO;
+	}
+
+	return 0;
+}
+
+static int ov02e10_check_hwcfg(struct device *dev)
+{
+	struct v4l2_fwnode_endpoint bus_cfg = {
+		.bus_type = V4L2_MBUS_CSI2_DPHY
+	};
+	struct fwnode_handle *ep;
+	struct fwnode_handle *fwnode = dev_fwnode(dev);
+	unsigned int i, j;
+	int ret;
+	u32 ext_clk;
+
+	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
+	if (!ep)
+		return dev_err_probe(dev, -EPROBE_DEFER,
+				     "waiting for fwnode graph endpoint\n");
+
+	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
+	fwnode_handle_put(ep);
+	if (ret)
+		return dev_err_probe(dev, ret, "parsing endpoint failed\n");
+
+	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
+				       &ext_clk);
+	if (ret) {
+		dev_err(dev, "can't get clock frequency\n");
+		goto out_err;
+	}
+
+	if (bus_cfg.bus.mipi_csi2.num_data_lanes != OV02E10_DATA_LANES) {
+		dev_err(dev, "number of CSI2 data lanes %d is not supported\n",
+			bus_cfg.bus.mipi_csi2.num_data_lanes);
+		ret = -EINVAL;
+		goto out_err;
+	}
+
+	if (!bus_cfg.nr_of_link_frequencies) {
+		dev_err(dev, "no link frequencies defined\n");
+		ret = -EINVAL;
+		goto out_err;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(link_freq_menu_items); i++) {
+		for (j = 0; j < bus_cfg.nr_of_link_frequencies; j++) {
+			if (link_freq_menu_items[i] ==
+				bus_cfg.link_frequencies[j])
+				break;
+		}
+
+		if (j == bus_cfg.nr_of_link_frequencies) {
+			dev_err(dev, "no link frequency %lld supported\n",
+				link_freq_menu_items[i]);
+			ret = -EINVAL;
+			goto out_err;
+		}
+	}
+
+out_err:
+	v4l2_fwnode_endpoint_free(&bus_cfg);
+
+	return ret;
+}
+
+static void ov02e10_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct ov02e10 *ov02e10 = to_ov02e10(sd);
+
+	v4l2_async_unregister_subdev(sd);
+	media_entity_cleanup(&sd->entity);
+	v4l2_ctrl_handler_free(sd->ctrl_handler);
+	pm_runtime_disable(&client->dev);
+	mutex_destroy(&ov02e10->mutex);
+}
+
+static int ov02e10_probe(struct i2c_client *client)
+{
+	struct ov02e10 *ov02e;
+	int ret;
+
+	/* Check HW config */
+	ret = ov02e10_check_hwcfg(&client->dev);
+	if (ret)
+		return ret;
+
+	ov02e = devm_kzalloc(&client->dev, sizeof(*ov02e), GFP_KERNEL);
+	if (!ov02e)
+		return -ENOMEM;
+
+	/* Initialize subdev */
+	ov02e->regmap = devm_cci_regmap_init_i2c(client, 8);
+	if (IS_ERR(ov02e->regmap))
+		return PTR_ERR(ov02e->regmap);
+
+	v4l2_i2c_subdev_init(&ov02e->sd, client, &ov02e10_subdev_ops);
+	ov02e10_get_pm_resources(&client->dev);
+
+	ret = ov02e10_power_on(&client->dev);
+	if (ret) {
+		dev_err_probe(&client->dev, ret, "failed to power on\n");
+		goto error_power_off;
+	}
+
+	/* Check module identity */
+	ret = ov02e10_identify_module(ov02e);
+	if (ret) {
+		dev_err(&client->dev, "failed to find sensor: %d\n", ret);
+		goto error_power_off;
+	}
+
+	/* Set default mode to max resolution */
+	ov02e->cur_mode = &supported_modes[0];
+
+	dev_dbg(&client->dev, "will Init controls\n");
+	ret = ov02e10_init_controls(ov02e);
+	if (ret)
+		return ret;
+
+	/* Initialize subdev */
+	ov02e->sd.internal_ops = &ov02e10_internal_ops;
+	ov02e->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	ov02e->sd.entity.ops = &ov02e10_subdev_entity_ops;
+	ov02e->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
+
+	/* Initialize source pad */
+	ov02e->pad.flags = MEDIA_PAD_FL_SOURCE;
+	ret = media_entity_pads_init(&ov02e->sd.entity, 1, &ov02e->pad);
+	if (ret) {
+		dev_err(&client->dev, "%s failed:%d\n", __func__, ret);
+		goto error_handler_free;
+	}
+
+	ret = v4l2_async_register_subdev_sensor(&ov02e->sd);
+	if (ret < 0) {
+		dev_err(&client->dev, "async reg subdev error\n");
+		goto error_media_entity;
+	}
+
+	/*
+	 * Device is already turned on by i2c-core with ACPI domain PM.
+	 * Enable runtime PM and turn off the device.
+	 */
+	pm_runtime_set_active(&client->dev);
+	pm_runtime_enable(&client->dev);
+	pm_runtime_idle(&client->dev);
+
+	return 0;
+
+error_media_entity:
+	media_entity_cleanup(&ov02e->sd.entity);
+
+error_handler_free:
+	v4l2_ctrl_handler_free(ov02e->sd.ctrl_handler);
+	mutex_destroy(&ov02e->mutex);
+	dev_err(&client->dev, "%s failed:%d\n", __func__, ret);
+error_power_off:
+	ov02e10_power_off(&client->dev);
+
+	dev_dbg(&client->dev, "probe done\n");
+	return ret;
+}
+
+static const struct dev_pm_ops ov02e10_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(ov02e10_suspend, ov02e10_resume)
+	    SET_RUNTIME_PM_OPS(ov02e10_power_off, ov02e10_power_on, NULL)
+};
+
+static const struct acpi_device_id ov02e10_acpi_ids[] = {
+	{ "OVTI02E1" },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(acpi, ov02e10_acpi_ids);
+
+static struct i2c_driver ov02e10_i2c_driver = {
+	.driver = {
+		   .name = "ov02e10",
+		   .pm = &ov02e10_pm_ops,
+		   .acpi_match_table = ov02e10_acpi_ids,
+		    },
+	.probe = ov02e10_probe,
+	.remove = ov02e10_remove,
+};
+
+module_i2c_driver(ov02e10_i2c_driver);
+
+MODULE_AUTHOR("Jingjing Xiong <jingjing.xiong@intel.com>");
+MODULE_DESCRIPTION("OmniVision OV02E10 sensor driver");
+MODULE_LICENSE("GPL v2");

-- 
2.48.1


