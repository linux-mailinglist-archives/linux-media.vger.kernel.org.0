Return-Path: <linux-media+bounces-40802-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B6DB3239F
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 22:36:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 95727623EE0
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 20:36:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AC182D7803;
	Fri, 22 Aug 2025 20:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YI5APLAN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3FC286D53
	for <linux-media@vger.kernel.org>; Fri, 22 Aug 2025 20:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755894999; cv=none; b=Lw5DfmAXrybN/RHzGr+XwI1RmAiq9p544vanxNem+/9jSr4NZ2pRAs/kjjOSlQXk4OCguIJuEWCczK2a7LVJ/1K+/m8lLk0MABjXT8xS+rGgRTlOIjEWvsH2WEc2MhTjCWPfDs/ttjFi2Ay1+EohcQvjHhStUdy6jxlQ5GpbLzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755894999; c=relaxed/simple;
	bh=w+NbomQssk8VroI/4QKNu6DbeLnU/bv16OxZkKPGltI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RVJ6hPp5w8/TDmX5Ngx5TG3iBb1cRClU9qttFEJff7xMq21yDDDs7rsXDAdKiIlDChoeJaVkonZY9Q/jN9emcoNfPQRQrHGvi2IluW68nGv83mj8vgDi7QBGNSpjlreKjVqaClY8QOvwqH/iHqVuq9NI+j6IaMfQt+LnzPT4EW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YI5APLAN; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-335495789c6so1783841fa.1
        for <linux-media@vger.kernel.org>; Fri, 22 Aug 2025 13:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755894995; x=1756499795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cml04TN8w9vMVtAg0Qq5njc0NmmlP84Ss3JKeiOSi9E=;
        b=YI5APLAN9JxIhW4oXEgoooRyClM9bohz1mDv3wVpyZKY+AhfLmmVT/iT+57Fq1EwHb
         l6ANywkc+SorvH2dlL4adlsoHy2awYU3tBIcPiR5DK8YlRmeEFg+zW454x8NEbm0Wxbn
         gIK61d66a0AZsxRKsNAfvaE5GXjfnzZqE/wd2z5Fv+uDwKEVEURXfRkWh2A3ospV2w/j
         eUs9qWvOktcsDxdzsGE+RIPNwVWADHSa36TV7bwF72oNb1vHOA6MHhctGUcASjg1/Reh
         EVQbE+nIEdvtncXtVmXNdMUppe/oA1tbu6zI4O3X9veF9pvma5Bo44lUQUvTdEAT/btZ
         9KYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755894995; x=1756499795;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cml04TN8w9vMVtAg0Qq5njc0NmmlP84Ss3JKeiOSi9E=;
        b=l0X7V8B9asRvXBRFr9AbNRE4YUfUGovU346hXJLuGNZbKo7IUwUiFelyGUoHN4zwXY
         gd5CXF8JUzjiqbcWZ5actYK7ubAK/doT1uVWPnyVieHVjQfHiyyTBxWyvPZ3shJuc9mN
         xjZW2r/IYCj3Xx8UzV3xBcd1wQYv3DW+w12GTNmvSIoj9pX8fRhTosOeai3LTv12w3IR
         8iQvWSu5CfcM8mMdsqmAR4RV3Br49w+1dQTEt7DHOU+BZE97GxYlXIqqJnsc0c3GfBmd
         JTA8LLz8rrJmMyl0p1h+M17SQa3O2Sc8ack9pPxDqT27UvAZfcQsY9/svrhCbcNtN0RT
         TP5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVgqAehmFlMcqKyRpK5V45N8tWDf3pGwLdnjbM2WaTFYHuqvbbKa2ruD9vRfxN9Hc6t8q/GdQLTFp5FAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhqIfkCoIaqOGEgpiqzAtU0wtaoyGE6piMgoXC//LwDruGo0H0
	/hoZd01gxd6lNHwJMKMh4nCmwGMZiDKMAf4SSgpJ/3Fv8IYOjfutPjIWn3f+x+U/9hU=
X-Gm-Gg: ASbGnctzkLFd4Mg2YNYJ8ynaA81EVYWxkflKQlb7In3VHwwMCcS204CUd6WufBdtxoT
	1S2bp2PywI4X7XNrHpDPh4nAoUU6R5bWHbnoZJwj99efPAY3kOepz6Ab942cOXZ4/ihu+WxAXJC
	ty6Cj3cltvRWPhx83Pxx6TqexEIxet2Apmf6oKHHyNKCmFpLppsxV/abyzQiJMTrNomlRrNgo+K
	WyPilaFoyeK9giVe81Yi5bkRg4k8eAZ8q3J/lijbANIZfM44M7NL6DY2+0r6u+IScahWqr+Pr1M
	EDBS+OTnn45A8rxU3N19sUrtfMcZDt6vGnq40MBqTDdYTcNSOL4ubCaEDM6hNa0kDIb37y9rB0I
	ur33hDUdhJAdLGKRYNPvWKhnIHsNEaOjl16oozIM72GSIur7YbrpXBAZPFd+o+yAUO25vt0zlsd
	TkfREppw==
X-Google-Smtp-Source: AGHT+IGwI80tH+a6tMANMjnZQU+Rx2EOCUu4e0v6IedKaHxDsVsFumR/NmMR4jMYnPDFV0eMmlO/PA==
X-Received: by 2002:a05:6512:a85:b0:553:24b4:6492 with SMTP id 2adb3069b0e04-55f0cd6ef0bmr615581e87.5.1755894994551;
        Fri, 22 Aug 2025 13:36:34 -0700 (PDT)
Received: from thyme.local (88-112-128-43.elisa-laajakaista.fi. [88.112.128.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f35c9a0bbsm130319e87.121.2025.08.22.13.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 13:36:34 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <hansg@kernel.org>
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	linux-media@vger.kernel.org
Subject: [PATCH] media: i2c: og01a1b: Change I2C interface controls to V4L2 CCI
Date: Fri, 22 Aug 2025 23:36:32 +0300
Message-ID: <20250822203632.159005-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch the sensor driver to exploit V4L2 CCI helper interfaces instead
of driver specific wrappers over I2C read/write functions.

The change is intended to be non-function, on the conversion two
register defines were removed as unused ones.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/i2c/Kconfig   |   1 +
 drivers/media/i2c/og01a1b.c | 684 ++++++++++++++++--------------------
 2 files changed, 304 insertions(+), 381 deletions(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 1f5a3082ead9..389461d3a37a 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -333,6 +333,7 @@ config VIDEO_MT9V111
 
 config VIDEO_OG01A1B
 	tristate "OmniVision OG01A1B sensor support"
+	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OG01A1B camera.
diff --git a/drivers/media/i2c/og01a1b.c b/drivers/media/i2c/og01a1b.c
index 78d5d406e4b7..8c62d0903426 100644
--- a/drivers/media/i2c/og01a1b.c
+++ b/drivers/media/i2c/og01a1b.c
@@ -1,7 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2022 Intel Corporation.
 
-#include <linux/unaligned.h>
 #include <linux/acpi.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
@@ -10,6 +9,7 @@
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
+#include <media/v4l2-cci.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
@@ -24,49 +24,40 @@
 #define OG01A1B_DATA_LANES		2
 #define OG01A1B_RGB_DEPTH		10
 
-#define OG01A1B_REG_CHIP_ID		0x300a
+#define OG01A1B_REG_CHIP_ID		CCI_REG24(0x300a)
 #define OG01A1B_CHIP_ID			0x470141
 
-#define OG01A1B_REG_MODE_SELECT		0x0100
+#define OG01A1B_REG_MODE_SELECT		CCI_REG8(0x0100)
 #define OG01A1B_MODE_STANDBY		0x00
 #define OG01A1B_MODE_STREAMING		0x01
 
 /* vertical-timings from sensor */
-#define OG01A1B_REG_VTS			0x380e
+#define OG01A1B_REG_VTS			CCI_REG16(0x380e)
 #define OG01A1B_VTS_120FPS		0x0498
 #define OG01A1B_VTS_120FPS_MIN		0x0498
 #define OG01A1B_VTS_MAX			0x7fff
 
-/* horizontal-timings from sensor */
-#define OG01A1B_REG_HTS			0x380c
-
 /* Exposure controls from sensor */
-#define OG01A1B_REG_EXPOSURE		0x3501
+#define OG01A1B_REG_EXPOSURE		CCI_REG16(0x3501)
 #define	OG01A1B_EXPOSURE_MIN		1
 #define OG01A1B_EXPOSURE_MAX_MARGIN	14
 #define	OG01A1B_EXPOSURE_STEP		1
 
 /* Analog gain controls from sensor */
-#define OG01A1B_REG_ANALOG_GAIN		0x3508
+#define OG01A1B_REG_ANALOG_GAIN		CCI_REG16(0x3508)
 #define	OG01A1B_ANAL_GAIN_MIN		16
 #define	OG01A1B_ANAL_GAIN_MAX		248 /* Max = 15.5x */
 #define	OG01A1B_ANAL_GAIN_STEP		1
 
 /* Digital gain controls from sensor */
-#define OG01A1B_REG_DIG_GAIN		0x350a
+#define OG01A1B_REG_DIG_GAIN		CCI_REG24(0x350a)
 #define OG01A1B_DGTL_GAIN_MIN		1024
 #define OG01A1B_DGTL_GAIN_MAX		16384 /* Max = 16x */
 #define OG01A1B_DGTL_GAIN_STEP		1
 #define OG01A1B_DGTL_GAIN_DEFAULT	1024
 
-/* Group Access */
-#define OG01A1B_REG_GROUP_ACCESS	0x3208
-#define OG01A1B_GROUP_HOLD_START	0x0
-#define OG01A1B_GROUP_HOLD_END		0x10
-#define OG01A1B_GROUP_HOLD_LAUNCH	0xa0
-
 /* Test Pattern Control */
-#define OG01A1B_REG_TEST_PATTERN	0x5100
+#define OG01A1B_REG_TEST_PATTERN	CCI_REG8(0x5100)
 #define OG01A1B_TEST_PATTERN_ENABLE	BIT(7)
 #define OG01A1B_TEST_PATTERN_BAR_SHIFT	2
 
@@ -76,14 +67,9 @@ enum {
 	OG01A1B_LINK_FREQ_1000MBPS,
 };
 
-struct og01a1b_reg {
-	u16 address;
-	u8 val;
-};
-
 struct og01a1b_reg_list {
+	const struct cci_reg_sequence *regs;
 	u32 num_of_regs;
-	const struct og01a1b_reg *regs;
 };
 
 struct og01a1b_link_freq_config {
@@ -113,275 +99,275 @@ struct og01a1b_mode {
 	const struct og01a1b_reg_list reg_list;
 };
 
-static const struct og01a1b_reg mipi_data_rate_1000mbps[] = {
-	{0x0103, 0x01},
-	{0x0303, 0x02},
-	{0x0304, 0x00},
-	{0x0305, 0xd2},
-	{0x0323, 0x02},
-	{0x0324, 0x01},
-	{0x0325, 0x77},
+static const struct cci_reg_sequence mipi_data_rate_1000mbps[] = {
+	{ CCI_REG8(0x0103), 0x01 },
+	{ CCI_REG8(0x0303), 0x02 },
+	{ CCI_REG8(0x0304), 0x00 },
+	{ CCI_REG8(0x0305), 0xd2 },
+	{ CCI_REG8(0x0323), 0x02 },
+	{ CCI_REG8(0x0324), 0x01 },
+	{ CCI_REG8(0x0325), 0x77 },
 };
 
-static const struct og01a1b_reg mode_1280x1024_regs[] = {
-	{0x0300, 0x0a},
-	{0x0301, 0x29},
-	{0x0302, 0x31},
-	{0x0303, 0x02},
-	{0x0304, 0x00},
-	{0x0305, 0xd2},
-	{0x0306, 0x00},
-	{0x0307, 0x01},
-	{0x0308, 0x02},
-	{0x0309, 0x00},
-	{0x0310, 0x00},
-	{0x0311, 0x00},
-	{0x0312, 0x07},
-	{0x0313, 0x00},
-	{0x0314, 0x00},
-	{0x0315, 0x00},
-	{0x0320, 0x02},
-	{0x0321, 0x01},
-	{0x0322, 0x01},
-	{0x0323, 0x02},
-	{0x0324, 0x01},
-	{0x0325, 0x77},
-	{0x0326, 0xce},
-	{0x0327, 0x04},
-	{0x0329, 0x02},
-	{0x032a, 0x04},
-	{0x032b, 0x04},
-	{0x032c, 0x02},
-	{0x032d, 0x01},
-	{0x032e, 0x00},
-	{0x300d, 0x02},
-	{0x300e, 0x04},
-	{0x3021, 0x08},
-	{0x301e, 0x03},
-	{0x3103, 0x00},
-	{0x3106, 0x08},
-	{0x3107, 0x40},
-	{0x3216, 0x01},
-	{0x3217, 0x00},
-	{0x3218, 0xc0},
-	{0x3219, 0x55},
-	{0x3500, 0x00},
-	{0x3501, 0x04},
-	{0x3502, 0x8a},
-	{0x3506, 0x01},
-	{0x3507, 0x72},
-	{0x3508, 0x01},
-	{0x3509, 0x00},
-	{0x350a, 0x01},
-	{0x350b, 0x00},
-	{0x350c, 0x00},
-	{0x3541, 0x00},
-	{0x3542, 0x40},
-	{0x3605, 0xe0},
-	{0x3606, 0x41},
-	{0x3614, 0x20},
-	{0x3620, 0x0b},
-	{0x3630, 0x07},
-	{0x3636, 0xa0},
-	{0x3637, 0xf9},
-	{0x3638, 0x09},
-	{0x3639, 0x38},
-	{0x363f, 0x09},
-	{0x3640, 0x17},
-	{0x3662, 0x04},
-	{0x3665, 0x80},
-	{0x3670, 0x68},
-	{0x3674, 0x00},
-	{0x3677, 0x3f},
-	{0x3679, 0x00},
-	{0x369f, 0x19},
-	{0x36a0, 0x03},
-	{0x36a2, 0x19},
-	{0x36a3, 0x03},
-	{0x370d, 0x66},
-	{0x370f, 0x00},
-	{0x3710, 0x03},
-	{0x3715, 0x03},
-	{0x3716, 0x03},
-	{0x3717, 0x06},
-	{0x3733, 0x00},
-	{0x3778, 0x00},
-	{0x37a8, 0x0f},
-	{0x37a9, 0x01},
-	{0x37aa, 0x07},
-	{0x37bd, 0x1c},
-	{0x37c1, 0x2f},
-	{0x37c3, 0x09},
-	{0x37c8, 0x1d},
-	{0x37ca, 0x30},
-	{0x37df, 0x00},
-	{0x3800, 0x00},
-	{0x3801, 0x00},
-	{0x3802, 0x00},
-	{0x3803, 0x00},
-	{0x3804, 0x05},
-	{0x3805, 0x0f},
-	{0x3806, 0x04},
-	{0x3807, 0x0f},
-	{0x3808, 0x05},
-	{0x3809, 0x00},
-	{0x380a, 0x04},
-	{0x380b, 0x00},
-	{0x380c, 0x03},
-	{0x380d, 0x50},
-	{0x380e, 0x04},
-	{0x380f, 0x98},
-	{0x3810, 0x00},
-	{0x3811, 0x08},
-	{0x3812, 0x00},
-	{0x3813, 0x08},
-	{0x3814, 0x11},
-	{0x3815, 0x11},
-	{0x3820, 0x40},
-	{0x3821, 0x04},
-	{0x3826, 0x00},
-	{0x3827, 0x00},
-	{0x382a, 0x08},
-	{0x382b, 0x52},
-	{0x382d, 0xba},
-	{0x383d, 0x14},
-	{0x384a, 0xa2},
-	{0x3866, 0x0e},
-	{0x3867, 0x07},
-	{0x3884, 0x00},
-	{0x3885, 0x08},
-	{0x3893, 0x68},
-	{0x3894, 0x2a},
-	{0x3898, 0x00},
-	{0x3899, 0x31},
-	{0x389a, 0x04},
-	{0x389b, 0x00},
-	{0x389c, 0x0b},
-	{0x389d, 0xad},
-	{0x389f, 0x08},
-	{0x38a0, 0x00},
-	{0x38a1, 0x00},
-	{0x38a8, 0x70},
-	{0x38ac, 0xea},
-	{0x38b2, 0x00},
-	{0x38b3, 0x08},
-	{0x38bc, 0x20},
-	{0x38c4, 0x0c},
-	{0x38c5, 0x3a},
-	{0x38c7, 0x3a},
-	{0x38e1, 0xc0},
-	{0x38ec, 0x3c},
-	{0x38f0, 0x09},
-	{0x38f1, 0x6f},
-	{0x38fe, 0x3c},
-	{0x391e, 0x00},
-	{0x391f, 0x00},
-	{0x3920, 0xa5},
-	{0x3921, 0x00},
-	{0x3922, 0x00},
-	{0x3923, 0x00},
-	{0x3924, 0x05},
-	{0x3925, 0x00},
-	{0x3926, 0x00},
-	{0x3927, 0x00},
-	{0x3928, 0x1a},
-	{0x3929, 0x01},
-	{0x392a, 0xb4},
-	{0x392b, 0x00},
-	{0x392c, 0x10},
-	{0x392f, 0x40},
-	{0x4000, 0xcf},
-	{0x4003, 0x40},
-	{0x4008, 0x00},
-	{0x4009, 0x07},
-	{0x400a, 0x02},
-	{0x400b, 0x54},
-	{0x400c, 0x00},
-	{0x400d, 0x07},
-	{0x4010, 0xc0},
-	{0x4012, 0x02},
-	{0x4014, 0x04},
-	{0x4015, 0x04},
-	{0x4017, 0x02},
-	{0x4042, 0x01},
-	{0x4306, 0x04},
-	{0x4307, 0x12},
-	{0x4509, 0x00},
-	{0x450b, 0x83},
-	{0x4604, 0x68},
-	{0x4608, 0x0a},
-	{0x4700, 0x06},
-	{0x4800, 0x64},
-	{0x481b, 0x3c},
-	{0x4825, 0x32},
-	{0x4833, 0x18},
-	{0x4837, 0x0f},
-	{0x4850, 0x40},
-	{0x4860, 0x00},
-	{0x4861, 0xec},
-	{0x4864, 0x00},
-	{0x4883, 0x00},
-	{0x4888, 0x90},
-	{0x4889, 0x05},
-	{0x488b, 0x04},
-	{0x4f00, 0x04},
-	{0x4f10, 0x04},
-	{0x4f21, 0x01},
-	{0x4f22, 0x40},
-	{0x4f23, 0x44},
-	{0x4f24, 0x51},
-	{0x4f25, 0x41},
-	{0x5000, 0x1f},
-	{0x500a, 0x00},
-	{0x5100, 0x00},
-	{0x5111, 0x20},
-	{0x3020, 0x20},
-	{0x3613, 0x03},
-	{0x38c9, 0x02},
-	{0x5304, 0x01},
-	{0x3620, 0x08},
-	{0x3639, 0x58},
-	{0x363a, 0x10},
-	{0x3674, 0x04},
-	{0x3780, 0xff},
-	{0x3781, 0xff},
-	{0x3782, 0x00},
-	{0x3783, 0x01},
-	{0x3798, 0xa3},
-	{0x37aa, 0x10},
-	{0x38a8, 0xf0},
-	{0x38c4, 0x09},
-	{0x38c5, 0xb0},
-	{0x38df, 0x80},
-	{0x38ff, 0x05},
-	{0x4010, 0xf1},
-	{0x4011, 0x70},
-	{0x3667, 0x80},
-	{0x4d00, 0x4a},
-	{0x4d01, 0x18},
-	{0x4d02, 0xbb},
-	{0x4d03, 0xde},
-	{0x4d04, 0x93},
-	{0x4d05, 0xff},
-	{0x4d09, 0x0a},
-	{0x37aa, 0x16},
-	{0x3606, 0x42},
-	{0x3605, 0x00},
-	{0x36a2, 0x17},
-	{0x300d, 0x0a},
-	{0x4d00, 0x4d},
-	{0x4d01, 0x95},
-	{0x3d8C, 0x70},
-	{0x3d8d, 0xE9},
-	{0x5300, 0x00},
-	{0x5301, 0x10},
-	{0x5302, 0x00},
-	{0x5303, 0xE3},
-	{0x3d88, 0x00},
-	{0x3d89, 0x10},
-	{0x3d8a, 0x00},
-	{0x3d8b, 0xE3},
-	{0x4f22, 0x00},
+static const struct cci_reg_sequence mode_1280x1024_regs[] = {
+	{ CCI_REG8(0x0300), 0x0a },
+	{ CCI_REG8(0x0301), 0x29 },
+	{ CCI_REG8(0x0302), 0x31 },
+	{ CCI_REG8(0x0303), 0x02 },
+	{ CCI_REG8(0x0304), 0x00 },
+	{ CCI_REG8(0x0305), 0xd2 },
+	{ CCI_REG8(0x0306), 0x00 },
+	{ CCI_REG8(0x0307), 0x01 },
+	{ CCI_REG8(0x0308), 0x02 },
+	{ CCI_REG8(0x0309), 0x00 },
+	{ CCI_REG8(0x0310), 0x00 },
+	{ CCI_REG8(0x0311), 0x00 },
+	{ CCI_REG8(0x0312), 0x07 },
+	{ CCI_REG8(0x0313), 0x00 },
+	{ CCI_REG8(0x0314), 0x00 },
+	{ CCI_REG8(0x0315), 0x00 },
+	{ CCI_REG8(0x0320), 0x02 },
+	{ CCI_REG8(0x0321), 0x01 },
+	{ CCI_REG8(0x0322), 0x01 },
+	{ CCI_REG8(0x0323), 0x02 },
+	{ CCI_REG8(0x0324), 0x01 },
+	{ CCI_REG8(0x0325), 0x77 },
+	{ CCI_REG8(0x0326), 0xce },
+	{ CCI_REG8(0x0327), 0x04 },
+	{ CCI_REG8(0x0329), 0x02 },
+	{ CCI_REG8(0x032a), 0x04 },
+	{ CCI_REG8(0x032b), 0x04 },
+	{ CCI_REG8(0x032c), 0x02 },
+	{ CCI_REG8(0x032d), 0x01 },
+	{ CCI_REG8(0x032e), 0x00 },
+	{ CCI_REG8(0x300d), 0x02 },
+	{ CCI_REG8(0x300e), 0x04 },
+	{ CCI_REG8(0x3021), 0x08 },
+	{ CCI_REG8(0x301e), 0x03 },
+	{ CCI_REG8(0x3103), 0x00 },
+	{ CCI_REG8(0x3106), 0x08 },
+	{ CCI_REG8(0x3107), 0x40 },
+	{ CCI_REG8(0x3216), 0x01 },
+	{ CCI_REG8(0x3217), 0x00 },
+	{ CCI_REG8(0x3218), 0xc0 },
+	{ CCI_REG8(0x3219), 0x55 },
+	{ CCI_REG8(0x3500), 0x00 },
+	{ CCI_REG8(0x3501), 0x04 },
+	{ CCI_REG8(0x3502), 0x8a },
+	{ CCI_REG8(0x3506), 0x01 },
+	{ CCI_REG8(0x3507), 0x72 },
+	{ CCI_REG8(0x3508), 0x01 },
+	{ CCI_REG8(0x3509), 0x00 },
+	{ CCI_REG8(0x350a), 0x01 },
+	{ CCI_REG8(0x350b), 0x00 },
+	{ CCI_REG8(0x350c), 0x00 },
+	{ CCI_REG8(0x3541), 0x00 },
+	{ CCI_REG8(0x3542), 0x40 },
+	{ CCI_REG8(0x3605), 0xe0 },
+	{ CCI_REG8(0x3606), 0x41 },
+	{ CCI_REG8(0x3614), 0x20 },
+	{ CCI_REG8(0x3620), 0x0b },
+	{ CCI_REG8(0x3630), 0x07 },
+	{ CCI_REG8(0x3636), 0xa0 },
+	{ CCI_REG8(0x3637), 0xf9 },
+	{ CCI_REG8(0x3638), 0x09 },
+	{ CCI_REG8(0x3639), 0x38 },
+	{ CCI_REG8(0x363f), 0x09 },
+	{ CCI_REG8(0x3640), 0x17 },
+	{ CCI_REG8(0x3662), 0x04 },
+	{ CCI_REG8(0x3665), 0x80 },
+	{ CCI_REG8(0x3670), 0x68 },
+	{ CCI_REG8(0x3674), 0x00 },
+	{ CCI_REG8(0x3677), 0x3f },
+	{ CCI_REG8(0x3679), 0x00 },
+	{ CCI_REG8(0x369f), 0x19 },
+	{ CCI_REG8(0x36a0), 0x03 },
+	{ CCI_REG8(0x36a2), 0x19 },
+	{ CCI_REG8(0x36a3), 0x03 },
+	{ CCI_REG8(0x370d), 0x66 },
+	{ CCI_REG8(0x370f), 0x00 },
+	{ CCI_REG8(0x3710), 0x03 },
+	{ CCI_REG8(0x3715), 0x03 },
+	{ CCI_REG8(0x3716), 0x03 },
+	{ CCI_REG8(0x3717), 0x06 },
+	{ CCI_REG8(0x3733), 0x00 },
+	{ CCI_REG8(0x3778), 0x00 },
+	{ CCI_REG8(0x37a8), 0x0f },
+	{ CCI_REG8(0x37a9), 0x01 },
+	{ CCI_REG8(0x37aa), 0x07 },
+	{ CCI_REG8(0x37bd), 0x1c },
+	{ CCI_REG8(0x37c1), 0x2f },
+	{ CCI_REG8(0x37c3), 0x09 },
+	{ CCI_REG8(0x37c8), 0x1d },
+	{ CCI_REG8(0x37ca), 0x30 },
+	{ CCI_REG8(0x37df), 0x00 },
+	{ CCI_REG8(0x3800), 0x00 },
+	{ CCI_REG8(0x3801), 0x00 },
+	{ CCI_REG8(0x3802), 0x00 },
+	{ CCI_REG8(0x3803), 0x00 },
+	{ CCI_REG8(0x3804), 0x05 },
+	{ CCI_REG8(0x3805), 0x0f },
+	{ CCI_REG8(0x3806), 0x04 },
+	{ CCI_REG8(0x3807), 0x0f },
+	{ CCI_REG8(0x3808), 0x05 },
+	{ CCI_REG8(0x3809), 0x00 },
+	{ CCI_REG8(0x380a), 0x04 },
+	{ CCI_REG8(0x380b), 0x00 },
+	{ CCI_REG8(0x380c), 0x03 },
+	{ CCI_REG8(0x380d), 0x50 },
+	{ CCI_REG8(0x380e), 0x04 },
+	{ CCI_REG8(0x380f), 0x98 },
+	{ CCI_REG8(0x3810), 0x00 },
+	{ CCI_REG8(0x3811), 0x08 },
+	{ CCI_REG8(0x3812), 0x00 },
+	{ CCI_REG8(0x3813), 0x08 },
+	{ CCI_REG8(0x3814), 0x11 },
+	{ CCI_REG8(0x3815), 0x11 },
+	{ CCI_REG8(0x3820), 0x40 },
+	{ CCI_REG8(0x3821), 0x04 },
+	{ CCI_REG8(0x3826), 0x00 },
+	{ CCI_REG8(0x3827), 0x00 },
+	{ CCI_REG8(0x382a), 0x08 },
+	{ CCI_REG8(0x382b), 0x52 },
+	{ CCI_REG8(0x382d), 0xba },
+	{ CCI_REG8(0x383d), 0x14 },
+	{ CCI_REG8(0x384a), 0xa2 },
+	{ CCI_REG8(0x3866), 0x0e },
+	{ CCI_REG8(0x3867), 0x07 },
+	{ CCI_REG8(0x3884), 0x00 },
+	{ CCI_REG8(0x3885), 0x08 },
+	{ CCI_REG8(0x3893), 0x68 },
+	{ CCI_REG8(0x3894), 0x2a },
+	{ CCI_REG8(0x3898), 0x00 },
+	{ CCI_REG8(0x3899), 0x31 },
+	{ CCI_REG8(0x389a), 0x04 },
+	{ CCI_REG8(0x389b), 0x00 },
+	{ CCI_REG8(0x389c), 0x0b },
+	{ CCI_REG8(0x389d), 0xad },
+	{ CCI_REG8(0x389f), 0x08 },
+	{ CCI_REG8(0x38a0), 0x00 },
+	{ CCI_REG8(0x38a1), 0x00 },
+	{ CCI_REG8(0x38a8), 0x70 },
+	{ CCI_REG8(0x38ac), 0xea },
+	{ CCI_REG8(0x38b2), 0x00 },
+	{ CCI_REG8(0x38b3), 0x08 },
+	{ CCI_REG8(0x38bc), 0x20 },
+	{ CCI_REG8(0x38c4), 0x0c },
+	{ CCI_REG8(0x38c5), 0x3a },
+	{ CCI_REG8(0x38c7), 0x3a },
+	{ CCI_REG8(0x38e1), 0xc0 },
+	{ CCI_REG8(0x38ec), 0x3c },
+	{ CCI_REG8(0x38f0), 0x09 },
+	{ CCI_REG8(0x38f1), 0x6f },
+	{ CCI_REG8(0x38fe), 0x3c },
+	{ CCI_REG8(0x391e), 0x00 },
+	{ CCI_REG8(0x391f), 0x00 },
+	{ CCI_REG8(0x3920), 0xa5 },
+	{ CCI_REG8(0x3921), 0x00 },
+	{ CCI_REG8(0x3922), 0x00 },
+	{ CCI_REG8(0x3923), 0x00 },
+	{ CCI_REG8(0x3924), 0x05 },
+	{ CCI_REG8(0x3925), 0x00 },
+	{ CCI_REG8(0x3926), 0x00 },
+	{ CCI_REG8(0x3927), 0x00 },
+	{ CCI_REG8(0x3928), 0x1a },
+	{ CCI_REG8(0x3929), 0x01 },
+	{ CCI_REG8(0x392a), 0xb4 },
+	{ CCI_REG8(0x392b), 0x00 },
+	{ CCI_REG8(0x392c), 0x10 },
+	{ CCI_REG8(0x392f), 0x40 },
+	{ CCI_REG8(0x4000), 0xcf },
+	{ CCI_REG8(0x4003), 0x40 },
+	{ CCI_REG8(0x4008), 0x00 },
+	{ CCI_REG8(0x4009), 0x07 },
+	{ CCI_REG8(0x400a), 0x02 },
+	{ CCI_REG8(0x400b), 0x54 },
+	{ CCI_REG8(0x400c), 0x00 },
+	{ CCI_REG8(0x400d), 0x07 },
+	{ CCI_REG8(0x4010), 0xc0 },
+	{ CCI_REG8(0x4012), 0x02 },
+	{ CCI_REG8(0x4014), 0x04 },
+	{ CCI_REG8(0x4015), 0x04 },
+	{ CCI_REG8(0x4017), 0x02 },
+	{ CCI_REG8(0x4042), 0x01 },
+	{ CCI_REG8(0x4306), 0x04 },
+	{ CCI_REG8(0x4307), 0x12 },
+	{ CCI_REG8(0x4509), 0x00 },
+	{ CCI_REG8(0x450b), 0x83 },
+	{ CCI_REG8(0x4604), 0x68 },
+	{ CCI_REG8(0x4608), 0x0a },
+	{ CCI_REG8(0x4700), 0x06 },
+	{ CCI_REG8(0x4800), 0x64 },
+	{ CCI_REG8(0x481b), 0x3c },
+	{ CCI_REG8(0x4825), 0x32 },
+	{ CCI_REG8(0x4833), 0x18 },
+	{ CCI_REG8(0x4837), 0x0f },
+	{ CCI_REG8(0x4850), 0x40 },
+	{ CCI_REG8(0x4860), 0x00 },
+	{ CCI_REG8(0x4861), 0xec },
+	{ CCI_REG8(0x4864), 0x00 },
+	{ CCI_REG8(0x4883), 0x00 },
+	{ CCI_REG8(0x4888), 0x90 },
+	{ CCI_REG8(0x4889), 0x05 },
+	{ CCI_REG8(0x488b), 0x04 },
+	{ CCI_REG8(0x4f00), 0x04 },
+	{ CCI_REG8(0x4f10), 0x04 },
+	{ CCI_REG8(0x4f21), 0x01 },
+	{ CCI_REG8(0x4f22), 0x40 },
+	{ CCI_REG8(0x4f23), 0x44 },
+	{ CCI_REG8(0x4f24), 0x51 },
+	{ CCI_REG8(0x4f25), 0x41 },
+	{ CCI_REG8(0x5000), 0x1f },
+	{ CCI_REG8(0x500a), 0x00 },
+	{ CCI_REG8(0x5100), 0x00 },
+	{ CCI_REG8(0x5111), 0x20 },
+	{ CCI_REG8(0x3020), 0x20 },
+	{ CCI_REG8(0x3613), 0x03 },
+	{ CCI_REG8(0x38c9), 0x02 },
+	{ CCI_REG8(0x5304), 0x01 },
+	{ CCI_REG8(0x3620), 0x08 },
+	{ CCI_REG8(0x3639), 0x58 },
+	{ CCI_REG8(0x363a), 0x10 },
+	{ CCI_REG8(0x3674), 0x04 },
+	{ CCI_REG8(0x3780), 0xff },
+	{ CCI_REG8(0x3781), 0xff },
+	{ CCI_REG8(0x3782), 0x00 },
+	{ CCI_REG8(0x3783), 0x01 },
+	{ CCI_REG8(0x3798), 0xa3 },
+	{ CCI_REG8(0x37aa), 0x10 },
+	{ CCI_REG8(0x38a8), 0xf0 },
+	{ CCI_REG8(0x38c4), 0x09 },
+	{ CCI_REG8(0x38c5), 0xb0 },
+	{ CCI_REG8(0x38df), 0x80 },
+	{ CCI_REG8(0x38ff), 0x05 },
+	{ CCI_REG8(0x4010), 0xf1 },
+	{ CCI_REG8(0x4011), 0x70 },
+	{ CCI_REG8(0x3667), 0x80 },
+	{ CCI_REG8(0x4d00), 0x4a },
+	{ CCI_REG8(0x4d01), 0x18 },
+	{ CCI_REG8(0x4d02), 0xbb },
+	{ CCI_REG8(0x4d03), 0xde },
+	{ CCI_REG8(0x4d04), 0x93 },
+	{ CCI_REG8(0x4d05), 0xff },
+	{ CCI_REG8(0x4d09), 0x0a },
+	{ CCI_REG8(0x37aa), 0x16 },
+	{ CCI_REG8(0x3606), 0x42 },
+	{ CCI_REG8(0x3605), 0x00 },
+	{ CCI_REG8(0x36a2), 0x17 },
+	{ CCI_REG8(0x300d), 0x0a },
+	{ CCI_REG8(0x4d00), 0x4d },
+	{ CCI_REG8(0x4d01), 0x95 },
+	{ CCI_REG8(0x3d8c), 0x70 },
+	{ CCI_REG8(0x3d8d), 0xe9 },
+	{ CCI_REG8(0x5300), 0x00 },
+	{ CCI_REG8(0x5301), 0x10 },
+	{ CCI_REG8(0x5302), 0x00 },
+	{ CCI_REG8(0x5303), 0xe3 },
+	{ CCI_REG8(0x3d88), 0x00 },
+	{ CCI_REG8(0x3d89), 0x10 },
+	{ CCI_REG8(0x3d8a), 0x00 },
+	{ CCI_REG8(0x3d8b), 0xe3 },
+	{ CCI_REG8(0x4f22), 0x00 },
 };
 
 static const char * const og01a1b_test_pattern_menu[] = {
@@ -421,6 +407,7 @@ static const struct og01a1b_mode supported_modes[] = {
 };
 
 struct og01a1b {
+	struct regmap *regmap;
 	struct clk *xvclk;
 	struct gpio_desc *reset_gpio;
 	struct regulator *avdd;
@@ -463,81 +450,14 @@ static u64 to_pixels_per_line(u32 hts, u32 f_index)
 	return ppl;
 }
 
-static int og01a1b_read_reg(struct og01a1b *og01a1b, u16 reg, u16 len, u32 *val)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(&og01a1b->sd);
-	struct i2c_msg msgs[2];
-	u8 addr_buf[2];
-	u8 data_buf[4] = {0};
-	int ret;
-
-	if (len > 4)
-		return -EINVAL;
-
-	put_unaligned_be16(reg, addr_buf);
-	msgs[0].addr = client->addr;
-	msgs[0].flags = 0;
-	msgs[0].len = sizeof(addr_buf);
-	msgs[0].buf = addr_buf;
-	msgs[1].addr = client->addr;
-	msgs[1].flags = I2C_M_RD;
-	msgs[1].len = len;
-	msgs[1].buf = &data_buf[4 - len];
-
-	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
-	if (ret != ARRAY_SIZE(msgs))
-		return -EIO;
-
-	*val = get_unaligned_be32(data_buf);
-
-	return 0;
-}
-
-static int og01a1b_write_reg(struct og01a1b *og01a1b, u16 reg, u16 len, u32 val)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(&og01a1b->sd);
-	u8 buf[6];
-
-	if (len > 4)
-		return -EINVAL;
-
-	put_unaligned_be16(reg, buf);
-	put_unaligned_be32(val << 8 * (4 - len), buf + 2);
-	if (i2c_master_send(client, buf, len + 2) != len + 2)
-		return -EIO;
-
-	return 0;
-}
-
-static int og01a1b_write_reg_list(struct og01a1b *og01a1b,
-				  const struct og01a1b_reg_list *r_list)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(&og01a1b->sd);
-	unsigned int i;
-	int ret;
-
-	for (i = 0; i < r_list->num_of_regs; i++) {
-		ret = og01a1b_write_reg(og01a1b, r_list->regs[i].address, 1,
-					r_list->regs[i].val);
-		if (ret) {
-			dev_err_ratelimited(&client->dev,
-					    "failed to write reg 0x%4.4x. error = %d",
-					    r_list->regs[i].address, ret);
-			return ret;
-		}
-	}
-
-	return 0;
-}
-
 static int og01a1b_test_pattern(struct og01a1b *og01a1b, u32 pattern)
 {
 	if (pattern)
 		pattern = (pattern - 1) << OG01A1B_TEST_PATTERN_BAR_SHIFT |
 			  OG01A1B_TEST_PATTERN_ENABLE;
 
-	return og01a1b_write_reg(og01a1b, OG01A1B_REG_TEST_PATTERN,
-				 OG01A1B_REG_VALUE_08BIT, pattern);
+	return cci_write(og01a1b->regmap, OG01A1B_REG_TEST_PATTERN,
+			 pattern, NULL);
 }
 
 static int og01a1b_set_ctrl(struct v4l2_ctrl *ctrl)
@@ -565,26 +485,23 @@ static int og01a1b_set_ctrl(struct v4l2_ctrl *ctrl)
 
 	switch (ctrl->id) {
 	case V4L2_CID_ANALOGUE_GAIN:
-		ret = og01a1b_write_reg(og01a1b, OG01A1B_REG_ANALOG_GAIN,
-					OG01A1B_REG_VALUE_16BIT,
-					ctrl->val << 4);
+		ret = cci_write(og01a1b->regmap, OG01A1B_REG_ANALOG_GAIN,
+				ctrl->val << 4, NULL);
 		break;
 
 	case V4L2_CID_DIGITAL_GAIN:
-		ret = og01a1b_write_reg(og01a1b, OG01A1B_REG_DIG_GAIN,
-					OG01A1B_REG_VALUE_24BIT,
-					ctrl->val << 6);
+		ret = cci_write(og01a1b->regmap, OG01A1B_REG_DIG_GAIN,
+				ctrl->val << 6, NULL);
 		break;
 
 	case V4L2_CID_EXPOSURE:
-		ret = og01a1b_write_reg(og01a1b, OG01A1B_REG_EXPOSURE,
-					OG01A1B_REG_VALUE_16BIT, ctrl->val);
+		ret = cci_write(og01a1b->regmap, OG01A1B_REG_EXPOSURE,
+				ctrl->val, NULL);
 		break;
 
 	case V4L2_CID_VBLANK:
-		ret = og01a1b_write_reg(og01a1b, OG01A1B_REG_VTS,
-					OG01A1B_REG_VALUE_16BIT,
-					og01a1b->cur_mode->height + ctrl->val);
+		ret = cci_write(og01a1b->regmap, OG01A1B_REG_VTS,
+				og01a1b->cur_mode->height + ctrl->val, NULL);
 		break;
 
 	case V4L2_CID_TEST_PATTERN:
@@ -695,14 +612,16 @@ static int og01a1b_start_streaming(struct og01a1b *og01a1b)
 	link_freq_index = og01a1b->cur_mode->link_freq_index;
 	reg_list = &link_freq_configs[link_freq_index].reg_list;
 
-	ret = og01a1b_write_reg_list(og01a1b, reg_list);
+	ret = cci_multi_reg_write(og01a1b->regmap, reg_list->regs,
+				  reg_list->num_of_regs, NULL);
 	if (ret) {
 		dev_err(&client->dev, "failed to set plls");
 		return ret;
 	}
 
 	reg_list = &og01a1b->cur_mode->reg_list;
-	ret = og01a1b_write_reg_list(og01a1b, reg_list);
+	ret = cci_multi_reg_write(og01a1b->regmap, reg_list->regs,
+				  reg_list->num_of_regs, NULL);
 	if (ret) {
 		dev_err(&client->dev, "failed to set mode");
 		return ret;
@@ -712,9 +631,8 @@ static int og01a1b_start_streaming(struct og01a1b *og01a1b)
 	if (ret)
 		return ret;
 
-	ret = og01a1b_write_reg(og01a1b, OG01A1B_REG_MODE_SELECT,
-				OG01A1B_REG_VALUE_08BIT,
-				OG01A1B_MODE_STREAMING);
+	ret = cci_write(og01a1b->regmap, OG01A1B_REG_MODE_SELECT,
+			OG01A1B_MODE_STREAMING, NULL);
 	if (ret) {
 		dev_err(&client->dev, "failed to set stream");
 		return ret;
@@ -727,8 +645,8 @@ static void og01a1b_stop_streaming(struct og01a1b *og01a1b)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&og01a1b->sd);
 
-	if (og01a1b_write_reg(og01a1b, OG01A1B_REG_MODE_SELECT,
-			      OG01A1B_REG_VALUE_08BIT, OG01A1B_MODE_STANDBY))
+	if (cci_write(og01a1b->regmap, OG01A1B_REG_MODE_SELECT,
+		      OG01A1B_MODE_STANDBY, NULL))
 		dev_err(&client->dev, "failed to set stream");
 }
 
@@ -891,15 +809,14 @@ static int og01a1b_identify_module(struct og01a1b *og01a1b)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&og01a1b->sd);
 	int ret;
-	u32 val;
+	u64 val;
 
-	ret = og01a1b_read_reg(og01a1b, OG01A1B_REG_CHIP_ID,
-			       OG01A1B_REG_VALUE_24BIT, &val);
+	ret = cci_read(og01a1b->regmap, OG01A1B_REG_CHIP_ID, &val, NULL);
 	if (ret)
 		return ret;
 
 	if (val != OG01A1B_CHIP_ID) {
-		dev_err(&client->dev, "chip id mismatch: %x!=%x",
+		dev_err(&client->dev, "chip id mismatch: %x!=%llx",
 			OG01A1B_CHIP_ID, val);
 		return -ENXIO;
 	}
@@ -1081,6 +998,11 @@ static int og01a1b_probe(struct i2c_client *client)
 
 	v4l2_i2c_subdev_init(&og01a1b->sd, client, &og01a1b_subdev_ops);
 
+	og01a1b->regmap = devm_cci_regmap_init_i2c(client, 16);
+	if (IS_ERR(og01a1b->regmap))
+		return dev_err_probe(&client->dev, PTR_ERR(og01a1b->regmap),
+				     "failed to init CCI\n");
+
 	og01a1b->xvclk = devm_clk_get_optional(&client->dev, NULL);
 	if (IS_ERR(og01a1b->xvclk)) {
 		ret = PTR_ERR(og01a1b->xvclk);
-- 
2.49.0


