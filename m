Return-Path: <linux-media+bounces-42835-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 984C8B8CFEB
	for <lists+linux-media@lfdr.de>; Sat, 20 Sep 2025 21:48:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA4041B21BEE
	for <lists+linux-media@lfdr.de>; Sat, 20 Sep 2025 19:49:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E4BA2676DE;
	Sat, 20 Sep 2025 19:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SSQWrA/m"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93520265614
	for <linux-media@vger.kernel.org>; Sat, 20 Sep 2025 19:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758397697; cv=none; b=iVR6+Om6hG3Uk+GkjoCB6sp48UwyQgG7WGA0hqvZd3dmXhtQoZb8ZwJnhT3lpU7hvVn4icFp5DTeYelUCQg280BaUGxwxwFpGKLd5E+ei3Mh5Npy4/ONpQGdQN8kOSZOi/MqSq554gM+9qTVqNNPc7iG+WGLvhZ2+VeM7m10JPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758397697; c=relaxed/simple;
	bh=oi94Y20+q+RQjYECZU5Z1ZMBh7h8lKokywdILl1iK+k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SSSlhVq5zNm8s39VkZF1k6Dgg/2TMMs5vSsMP2B3XiprA4pvCfQAto7ThqBgDBSxV3TnG5sPFvBUfgRp8NjMKwHh4AlEIv5PyHP0YRSguPjn+emcNTmRw7a4m08rUGX2pkss7MWNREaUtp90vqlMF30q6+nBiPVRbA/3uo9E+NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SSQWrA/m; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b042cc3954fso534833366b.0
        for <linux-media@vger.kernel.org>; Sat, 20 Sep 2025 12:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758397691; x=1759002491; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kvjXv2YmC4lT/Av6UcwtTKMGoS5MDevBXY707VxUEBA=;
        b=SSQWrA/mzhdpcvE51ChWxXa66ykqvxfJz+v3MM84zBHB7k2NznO43QgAkPTCsWJB/4
         NtlwJLny3rh88yR90pQUYJmKtyebGXvz6EvsN9//nK2Mde84xaDlNhXXDOD4YFcu9Esw
         iNrLZrZHsmbAjLvs16930pZHnA3RkpCQLacDFCasikq9VIWA7BwhyZKmSyl21ItzKq3b
         YrvNocExj9XgpEDMJb0c5cpRR2r5f9+f0awZjfUZ06eA2NDe0LBUddRl0BmB9xim8iWv
         1WO8Lh/4Oo+ydrLGPTolJFhyYgIFDVgKIkvy8xNn9pMizZwGpf67R4OS8u2IdGr+ixuW
         EkYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758397691; x=1759002491;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kvjXv2YmC4lT/Av6UcwtTKMGoS5MDevBXY707VxUEBA=;
        b=DNF6TJ0juJK7ziwfnM+5JWvTZIN1TrSLQGlPY2LfHRj+DzItvAoD7i0CrlIUoIhE/k
         V4MQxqIXlSJoWYcDfY5o+Sw2p/PpcLzAtkXjsrsf8oyxSJaMHlKbz65X83kZMX/pCBFx
         bBrFdv2ICn0BLLqMDG8oCu0OU3AecdqP4z2QvPElaUshQc5JPKNkCfKgqnVr2tnsTbE6
         NGYNsw4U38RibMQ/t5quBWw9Vf+DX8U9YFyg9H+93xTsqkw9DnYnb8fVLn3CHNjIvBst
         4ewUCtnkD+JVD8ICmX7+VSIL+ICkDncwiaN8w7gTjSlZ4XVYoNFNKShwOymbBc0AlDFd
         ENCA==
X-Gm-Message-State: AOJu0Ywi3xluePYRZ17n2jO6nXPcv5/u0Herkga2nu9qVNTOYYqIYFFj
	w9vUtEbZRDJqC3bHHhv9Z2EQdd6iQ8IoRf7nvShcJ3zy+//YkDSg5WtK
X-Gm-Gg: ASbGncsi1G9hEe2+VlagZq7+1WJsVVrLHl5forW/RQnNb21Qg1mok6tjtugNvCXhKk3
	GjYaAux03Kn3JPNx+XhbcypfNtZDxPKZ/VBJGHw+AxRMGtSEz3wYlU4q/CkXljmJjRJ5dvq+LxR
	ah4n9FCp2iBt+KPVG890h7IS7KAzBEzX5q52CZvObDdD6r7HgYAO/C7suWswmOue78ImzjsKCtH
	sPd26WwieifWO/fFEYW7r5JXxydVFKtwO49dRJBrC1fhJwjhoWciPNGYLSQBK4cWEkkKaS9vwqJ
	AffX6R8HP4vnr4Opk+/RIPp0HyYaCzP3SYetUdvzWRBToHQJICmRIXtBQJeu0W1+tb1iIQd28mM
	fNuiYYWaNw/FRi3Gj8ZwNmCuH9xKB/nwOJRdiHZfHQv/qb5HSCVp1f1ODw8OavTnoX0z+k93sIu
	Re
X-Google-Smtp-Source: AGHT+IGxPS0GeCGOnwVvlR6lbqVgQt4JT16u8ft/ZKLqgH2KqvJYI1BCmKsOx7E5qqeUik9OM96aXA==
X-Received: by 2002:a17:907:d08:b0:b0f:4ae:c83 with SMTP id a640c23a62f3a-b24f7f1a31emr779560366b.63.1758397690325;
        Sat, 20 Sep 2025 12:48:10 -0700 (PDT)
Received: from UC-PF4PV1FX. (246.79-78-194.adsl-static.isp.belgacom.be. [194.78.79.246])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1fd15cb2fesm729271466b.89.2025.09.20.12.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 12:48:09 -0700 (PDT)
From: Philippe Baetens <philippebaetens@gmail.com>
Date: Sat, 20 Sep 2025 21:47:59 +0200
Subject: [PATCH v4 2/2] media: i2c: ams,mira220 Add a driver for the
 Mira220 image sensor.
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250920-mira220-v4-2-921b2e83a352@gmail.com>
References: <20250920-mira220-v4-0-921b2e83a352@gmail.com>
In-Reply-To: <20250920-mira220-v4-0-921b2e83a352@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Philippe Baetens <philippebaetens@gmail.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758397685; l=67621;
 i=philippebaetens@gmail.com; s=20250821; h=from:subject:message-id;
 bh=oi94Y20+q+RQjYECZU5Z1ZMBh7h8lKokywdILl1iK+k=;
 b=nqBWTFWpC8OUwoLaLvy/nUbEEe3VN1rHqD53hevccOIvjat3l5SjAztKJzoBYmCABq2pMNkZl
 3fUdZ5yDiBiDAAxxHy9fZlTUcp4/c51NblofVGt2/dmFPONQh8wVrBP
X-Developer-Key: i=philippebaetens@gmail.com; a=ed25519;
 pk=ncW5oAP1p6X8AZAmXP1ADcmlj6QUxXkN7oPfZV/DqYg=

Mira220 is a global shutter image sensor with 1600x1400 resolution.
This driver implements 12b, 10b and 8b RAW RGB color format.
The output datarate is 1500Mbit/s, 2 lane. Framerate is up to 90 fps.
Note: this sensor does not support analog gain.

Signed-off-by: Philippe Baetens <philippebaetens@gmail.com>
---
Changes in v4:
- Remove empty lines
- Remove unneeded sleep statements
- Change comment formatting style
- Include patch from Kieran to support endpoint configuration..

media: i2c: mira220: Implement endpoint configuration

Implement the endpoint parser and configuration to
identify the configured lanes and supported rates.

While these are currently only supporting 2 lanes and a single
data rate - both of these can be customised with a public datasheet
so provide the framework already.

Using this we can then report the link frequency correctly
which is required to operate the camera on an i.MX8MP platform
with the imx-mipi-csis driver.

Draft: Whitespace cleanups required, and this should all be squashed
       into the upstream submission for a v4 or v5.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 drivers/media/i2c/Kconfig   |   14 +
 drivers/media/i2c/Makefile  |    1 +
 drivers/media/i2c/mira220.c | 2032 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 2047 insertions(+)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 1f5a3082e..231c6299a 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -270,6 +270,20 @@ config VIDEO_IMX415
 config VIDEO_MAX9271_LIB
 	tristate
 
+config VIDEO_MIRA220
+	tristate "ams MIRA220 sensor support"
+	depends on I2C && VIDEO_DEV
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
+	select V4L2_CCI_I2C
+	select V4L2_FWNODE
+	help
+	  This is a Video4Linux2 sensor driver for the ams
+	  MIRA220 camera.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called mira220.
+
 config VIDEO_MT9M001
 	tristate "mt9m001 support"
 	help
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index 5873d2943..1d169cd0d 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -70,6 +70,7 @@ obj-$(CONFIG_VIDEO_MAX9271_LIB) += max9271.o
 obj-$(CONFIG_VIDEO_MAX9286) += max9286.o
 obj-$(CONFIG_VIDEO_MAX96714) += max96714.o
 obj-$(CONFIG_VIDEO_MAX96717) += max96717.o
+obj-$(CONFIG_VIDEO_MIRA220)	+= mira220.o
 obj-$(CONFIG_VIDEO_ML86V7667) += ml86v7667.o
 obj-$(CONFIG_VIDEO_MSP3400) += msp3400.o
 obj-$(CONFIG_VIDEO_MT9M001) += mt9m001.o
diff --git a/drivers/media/i2c/mira220.c b/drivers/media/i2c/mira220.c
new file mode 100644
index 000000000..6e0efbc8e
--- /dev/null
+++ b/drivers/media/i2c/mira220.c
@@ -0,0 +1,2032 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * A V4L2 driver for ams MIRA220 cameras.
+ * Copyright (C) 2022, ams-OSRAM
+ *
+ * Based on Sony IMX219 camera driver
+ * Copyright (C) 2019, Raspberry Pi (Trading) Ltd
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
+#include <linux/units.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-mediabus.h>
+#include <media/v4l2-cci.h>
+#include <linux/unaligned.h>
+
+/*
+ * Active pixel array is 1600 (H) x 1400 (V) pixels.
+ * Physical resolution including buffer pixels: 1642 (H) x 1464 (V) pixels.
+ */
+
+#define MIRA220_NATIVE_WIDTH 1642U
+#define MIRA220_NATIVE_HEIGHT 1464U
+#define MIRA220_PIXEL_ARRAY_LEFT 21U
+#define MIRA220_PIXEL_ARRAY_TOP 32U
+#define MIRA220_PIXEL_ARRAY_WIDTH 1600U
+#define MIRA220_PIXEL_ARRAY_HEIGHT 1400U
+
+/* Mira220 does not support analog gain. */
+#define MIRA220_ANALOG_GAIN_MIN 1
+#define MIRA220_ANALOG_GAIN_MAX 1
+#define MIRA220_ANALOG_GAIN_STEP 1
+#define MIRA220_ANALOG_GAIN_DEFAULT MIRA220_ANALOG_GAIN_MIN
+
+/* Bit depth */
+#define MIRA220_BIT_DEPTH_REG CCI_REG8(0x209e)
+#define MIRA220_BIT_DEPTH_12_BIT 0x02
+#define MIRA220_BIT_DEPTH_10_BIT 0x04
+#define MIRA220_BIT_DEPTH_8_BIT 0x06
+#define MIRA220_CSI_DATA_TYPE_REG CCI_REG8(0x208d)
+#define MIRA220_CSI_DATA_TYPE_12_BIT 0x04
+#define MIRA220_CSI_DATA_TYPE_10_BIT 0x02
+#define MIRA220_CSI_DATA_TYPE_8_BIT 0x01
+
+/* Imager state master/slave registers */
+#define MIRA220_IMAGER_STATE_REG CCI_REG8(0x1003)
+#define MIRA220_IMAGER_STATE_STOP_AT_ROW 0x02
+#define MIRA220_IMAGER_STATE_STOP_AT_FRAME 0x04
+#define MIRA220_IMAGER_STATE_MASTER_CONTROL 0x10
+#define MIRA220_IMAGER_STATE_SLAVE_CONTROL 0x08
+
+/* Start image acquisition */
+#define MIRA220_IMAGER_RUN_REG CCI_REG8(0x10f0)
+#define MIRA220_IMAGER_RUN_START 0x01
+#define MIRA220_IMAGER_RUN_STOP 0x00
+
+/* Continuous running, not limited to nr of frames. */
+#define MIRA220_IMAGER_RUN_CONT_REG CCI_REG8(0x1002)
+#define MIRA220_IMAGER_RUN_CONT_ENABLE 0x04
+#define MIRA220_IMAGER_RUN_CONT_DISABLE 0x00
+
+/* Exposure time is indicated in number of rows */
+#define MIRA220_EXP_TIME_REG CCI_REG16_LE(0x100c)
+
+/* Vertical Blank */
+#define MIRA220_VBLANK_REG CCI_REG16_LE(0x1012)
+
+/* Horizontal flip */
+#define MIRA220_HFLIP_REG CCI_REG8(0x209c)
+#define MIRA220_HFLIP_ENABLE_MIRROR 1
+#define MIRA220_HFLIP_DISABLE_MIRROR 0
+
+/* Vertical flip */
+#define MIRA220_VFLIP_REG CCI_REG8(0x1095)
+#define MIRA220_VFLIP_ENABLE_FLIP 1
+#define MIRA220_VFLIP_DISABLE_FLIP 0
+
+/* OTP control */
+#define MIRA220_OTP_CMD_REG CCI_REG8(0x0080)
+#define MIRA220_OTP_CMD_UP 0x4
+#define MIRA220_OTP_CMD_DOWN 0x8
+
+/* Global sampling time */
+#define MIRA220_GLOB_NUM_CLK_CYCLES 1928
+
+/* External clock frequency is 38.4 M */
+#define MIRA220_SUPPORTED_XCLK_FREQ 38400000
+
+/* Default exposure is adjusted to mode with smallest height*/
+#define MIRA220_DEFAULT_EXPOSURE 1000
+#define MIRA220_EXPOSURE_MIN 1
+/* Power on function timing*/
+#define MIRA220_XCLR_MIN_DELAY_US 100000
+#define MIRA220_XCLR_DELAY_RANGE_US 30
+
+/* Pixel rate is an artificial value
+ * This value is used for timing calculations
+ * in combination with vblank/hblank
+ */
+#define MIRA220_PIXEL_RATE (384 * MEGA) /*384M (x10)*/
+
+#define MIRA220_HBLANK_1600x1400_304 1440
+
+/* Test Pattern */
+#define MIRA220_REG_TEST_PATTERN CCI_REG8(0x2091)
+#define MIRA220_TEST_PATTERN_DISABLE 0x00
+#define MIRA220_TEST_PATTERN_VERTICAL_GRADIENT 0x01
+
+struct mira220_reg {
+	u16 address;
+	u8 val;
+};
+
+struct mira220_reg_list {
+	unsigned int num_of_regs;
+	const struct cci_reg_sequence *regs;
+};
+
+/* Mode : resolution and related config&values */
+struct mira220_mode {
+	unsigned int width;
+	unsigned int height;
+	struct v4l2_rect crop;
+	struct mira220_reg_list reg_list;
+	u32 row_length;
+	u32 pixel_rate;
+	u32 min_vblank;
+	u32 max_vblank;
+	u32 hblank;
+	u32 code;
+};
+
+static const struct cci_reg_sequence full_1600_1400_1500_12b_2lanes_reg_new[] = {
+	/* Base configuration*/
+	{ CCI_REG8(0x1003), 0x2 },
+	{ CCI_REG8(0x6006), 0x0 },
+	{ CCI_REG8(0x6012), 0x1 },
+	{ CCI_REG8(0x6013), 0x0 },
+	{ CCI_REG8(0x6006), 0x1 },
+	{ CCI_REG8(0x205d), 0x0 },
+	{ CCI_REG8(0x2063), 0x0 },
+	{ CCI_REG8(0x24dc), 0x13 },
+	{ CCI_REG8(0x24dd), 0x3 },
+	{ CCI_REG8(0x24de), 0x3 },
+	{ CCI_REG8(0x24df), 0x0 },
+	{ CCI_REG8(0x4006), 0x8 },
+	{ CCI_REG8(0x401c), 0x6f },
+	{ CCI_REG8(0x204b), 0x3 },
+	{ CCI_REG8(0x205b), 0x64 },
+	{ CCI_REG8(0x205c), 0x0 },
+	{ CCI_REG8(0x4018), 0x3f },
+	{ CCI_REG8(0x403b), 0xb },
+	{ CCI_REG8(0x403e), 0xe },
+	{ CCI_REG8(0x402b), 0x6 },
+	{ CCI_REG8(0x401e), 0x2 },
+	{ CCI_REG8(0x4038), 0x3b },
+	{ CCI_REG8(0x1077), 0x0 },
+	{ CCI_REG8(0x1078), 0x0 },
+	{ CCI_REG8(0x1009), 0x8 },
+	{ CCI_REG8(0x100a), 0x0 },
+	{ CCI_REG8(0x110f), 0x8 },
+	{ CCI_REG8(0x1110), 0x0 },
+	{ CCI_REG8(0x1006), 0x2 },
+	{ CCI_REG8(0x402c), 0x64 },
+	{ CCI_REG8(0x3064), 0x0 },
+	{ CCI_REG8(0x3065), 0xf0 },
+	{ CCI_REG8(0x4013), 0x13 },
+	{ CCI_REG8(0x401f), 0x9 },
+	{ CCI_REG8(0x4020), 0x13 },
+	{ CCI_REG8(0x4044), 0x75 },
+	{ CCI_REG8(0x4027), 0x0 },
+	{ CCI_REG8(0x3215), 0x69 },
+	{ CCI_REG8(0x3216), 0xf },
+	{ CCI_REG8(0x322b), 0x69 },
+	{ CCI_REG8(0x322c), 0xf },
+	{ CCI_REG8(0x4051), 0x80 },
+	{ CCI_REG8(0x4052), 0x10 },
+	{ CCI_REG8(0x4057), 0x80 },
+	{ CCI_REG8(0x4058), 0x10 },
+	{ CCI_REG8(0x3212), 0x59 },
+	{ CCI_REG8(0x4047), 0x8f },
+	{ CCI_REG8(0x4026), 0x10 },
+	{ CCI_REG8(0x4032), 0x53 },
+	{ CCI_REG8(0x4036), 0x17 },
+	{ CCI_REG8(0x50b8), 0xf4 },
+	{ CCI_REG8(0x3016), 0x0 },
+	{ CCI_REG8(0x3017), 0x2c },
+	{ CCI_REG8(0x3018), 0x8c },
+	{ CCI_REG8(0x3019), 0x45 },
+	{ CCI_REG8(0x301a), 0x5 },
+	{ CCI_REG8(0x3013), 0xa },
+	{ CCI_REG8(0x301b), 0x0 },
+	{ CCI_REG8(0x301c), 0x4 },
+	{ CCI_REG8(0x301d), 0x88 },
+	{ CCI_REG8(0x301e), 0x45 },
+	{ CCI_REG8(0x301f), 0x5 },
+	{ CCI_REG8(0x3020), 0x0 },
+	{ CCI_REG8(0x3021), 0x4 },
+	{ CCI_REG8(0x3022), 0x88 },
+	{ CCI_REG8(0x3023), 0x45 },
+	{ CCI_REG8(0x3024), 0x5 },
+	{ CCI_REG8(0x3025), 0x0 },
+	{ CCI_REG8(0x3026), 0x4 },
+	{ CCI_REG8(0x3027), 0x88 },
+	{ CCI_REG8(0x3028), 0x45 },
+	{ CCI_REG8(0x3029), 0x5 },
+	{ CCI_REG8(0x302f), 0x0 },
+	{ CCI_REG8(0x3056), 0x0 },
+	{ CCI_REG8(0x3057), 0x0 },
+	{ CCI_REG8(0x3300), 0x1 },
+	{ CCI_REG8(0x3301), 0x0 },
+	{ CCI_REG8(0x3302), 0xb0 },
+	{ CCI_REG8(0x3303), 0xb0 },
+	{ CCI_REG8(0x3304), 0x16 },
+	{ CCI_REG8(0x3305), 0x15 },
+	{ CCI_REG8(0x3306), 0x1 },
+	{ CCI_REG8(0x3307), 0x0 },
+	{ CCI_REG8(0x3308), 0x30 },
+	{ CCI_REG8(0x3309), 0xa0 },
+	{ CCI_REG8(0x330a), 0x16 },
+	{ CCI_REG8(0x330b), 0x15 },
+	{ CCI_REG8(0x330c), 0x1 },
+	{ CCI_REG8(0x330d), 0x0 },
+	{ CCI_REG8(0x330e), 0x30 },
+	{ CCI_REG8(0x330f), 0xa0 },
+	{ CCI_REG8(0x3310), 0x16 },
+	{ CCI_REG8(0x3311), 0x15 },
+	{ CCI_REG8(0x3312), 0x1 },
+	{ CCI_REG8(0x3313), 0x0 },
+	{ CCI_REG8(0x3314), 0x30 },
+	{ CCI_REG8(0x3315), 0xa0 },
+	{ CCI_REG8(0x3316), 0x16 },
+	{ CCI_REG8(0x3317), 0x15 },
+	{ CCI_REG8(0x3318), 0x1 },
+	{ CCI_REG8(0x3319), 0x0 },
+	{ CCI_REG8(0x331a), 0x30 },
+	{ CCI_REG8(0x331b), 0xa0 },
+	{ CCI_REG8(0x331c), 0x16 },
+	{ CCI_REG8(0x331d), 0x15 },
+	{ CCI_REG8(0x331e), 0x1 },
+	{ CCI_REG8(0x331f), 0x0 },
+	{ CCI_REG8(0x3320), 0x30 },
+	{ CCI_REG8(0x3321), 0xa0 },
+	{ CCI_REG8(0x3322), 0x16 },
+	{ CCI_REG8(0x3323), 0x15 },
+	{ CCI_REG8(0x3324), 0x1 },
+	{ CCI_REG8(0x3325), 0x0 },
+	{ CCI_REG8(0x3326), 0x30 },
+	{ CCI_REG8(0x3327), 0xa0 },
+	{ CCI_REG8(0x3328), 0x16 },
+	{ CCI_REG8(0x3329), 0x15 },
+	{ CCI_REG8(0x332a), 0x2b },
+	{ CCI_REG8(0x332b), 0x0 },
+	{ CCI_REG8(0x332c), 0x30 },
+	{ CCI_REG8(0x332d), 0xa0 },
+	{ CCI_REG8(0x332e), 0x16 },
+	{ CCI_REG8(0x332f), 0x15 },
+	{ CCI_REG8(0x3330), 0x1 },
+	{ CCI_REG8(0x3331), 0x0 },
+	{ CCI_REG8(0x3332), 0x10 },
+	{ CCI_REG8(0x3333), 0xa0 },
+	{ CCI_REG8(0x3334), 0x16 },
+	{ CCI_REG8(0x3335), 0x15 },
+	{ CCI_REG8(0x3058), 0x8 },
+	{ CCI_REG8(0x3059), 0x0 },
+	{ CCI_REG8(0x305a), 0x9 },
+	{ CCI_REG8(0x305b), 0x0 },
+	{ CCI_REG8(0x3336), 0x1 },
+	{ CCI_REG8(0x3337), 0x0 },
+	{ CCI_REG8(0x3338), 0x90 },
+	{ CCI_REG8(0x3339), 0xb0 },
+	{ CCI_REG8(0x333a), 0x16 },
+	{ CCI_REG8(0x333b), 0x15 },
+	{ CCI_REG8(0x333c), 0x1f },
+	{ CCI_REG8(0x333d), 0x0 },
+	{ CCI_REG8(0x333e), 0x10 },
+	{ CCI_REG8(0x333f), 0xa0 },
+	{ CCI_REG8(0x3340), 0x16 },
+	{ CCI_REG8(0x3341), 0x15 },
+	{ CCI_REG8(0x3342), 0x52 },
+	{ CCI_REG8(0x3343), 0x0 },
+	{ CCI_REG8(0x3344), 0x10 },
+	{ CCI_REG8(0x3345), 0x80 },
+	{ CCI_REG8(0x3346), 0x16 },
+	{ CCI_REG8(0x3347), 0x15 },
+	{ CCI_REG8(0x3348), 0x1 },
+	{ CCI_REG8(0x3349), 0x0 },
+	{ CCI_REG8(0x334a), 0x10 },
+	{ CCI_REG8(0x334b), 0x80 },
+	{ CCI_REG8(0x334c), 0x16 },
+	{ CCI_REG8(0x334d), 0x1d },
+	{ CCI_REG8(0x334e), 0x1 },
+	{ CCI_REG8(0x334f), 0x0 },
+	{ CCI_REG8(0x3350), 0x50 },
+	{ CCI_REG8(0x3351), 0x84 },
+	{ CCI_REG8(0x3352), 0x16 },
+	{ CCI_REG8(0x3353), 0x1d },
+	{ CCI_REG8(0x3354), 0x18 },
+	{ CCI_REG8(0x3355), 0x0 },
+	{ CCI_REG8(0x3356), 0x10 },
+	{ CCI_REG8(0x3357), 0x84 },
+	{ CCI_REG8(0x3358), 0x16 },
+	{ CCI_REG8(0x3359), 0x1d },
+	{ CCI_REG8(0x335a), 0x80 },
+	{ CCI_REG8(0x335b), 0x2 },
+	{ CCI_REG8(0x335c), 0x10 },
+	{ CCI_REG8(0x335d), 0xc4 },
+	{ CCI_REG8(0x335e), 0x14 },
+	{ CCI_REG8(0x335f), 0x1d },
+	{ CCI_REG8(0x3360), 0xa5 },
+	{ CCI_REG8(0x3361), 0x0 },
+	{ CCI_REG8(0x3362), 0x10 },
+	{ CCI_REG8(0x3363), 0x84 },
+	{ CCI_REG8(0x3364), 0x16 },
+	{ CCI_REG8(0x3365), 0x1d },
+	{ CCI_REG8(0x3366), 0x1 },
+	{ CCI_REG8(0x3367), 0x0 },
+	{ CCI_REG8(0x3368), 0x90 },
+	{ CCI_REG8(0x3369), 0x84 },
+	{ CCI_REG8(0x336a), 0x16 },
+	{ CCI_REG8(0x336b), 0x1d },
+	{ CCI_REG8(0x336c), 0x12 },
+	{ CCI_REG8(0x336d), 0x0 },
+	{ CCI_REG8(0x336e), 0x10 },
+	{ CCI_REG8(0x336f), 0x84 },
+	{ CCI_REG8(0x3370), 0x16 },
+	{ CCI_REG8(0x3371), 0x15 },
+	{ CCI_REG8(0x3372), 0x32 },
+	{ CCI_REG8(0x3373), 0x0 },
+	{ CCI_REG8(0x3374), 0x30 },
+	{ CCI_REG8(0x3375), 0x84 },
+	{ CCI_REG8(0x3376), 0x16 },
+	{ CCI_REG8(0x3377), 0x15 },
+	{ CCI_REG8(0x3378), 0x26 },
+	{ CCI_REG8(0x3379), 0x0 },
+	{ CCI_REG8(0x337a), 0x10 },
+	{ CCI_REG8(0x337b), 0x84 },
+	{ CCI_REG8(0x337c), 0x16 },
+	{ CCI_REG8(0x337d), 0x15 },
+	{ CCI_REG8(0x337e), 0x80 },
+	{ CCI_REG8(0x337f), 0x2 },
+	{ CCI_REG8(0x3380), 0x10 },
+	{ CCI_REG8(0x3381), 0xc4 },
+	{ CCI_REG8(0x3382), 0x14 },
+	{ CCI_REG8(0x3383), 0x15 },
+	{ CCI_REG8(0x3384), 0xa9 },
+	{ CCI_REG8(0x3385), 0x0 },
+	{ CCI_REG8(0x3386), 0x10 },
+	{ CCI_REG8(0x3387), 0x84 },
+	{ CCI_REG8(0x3388), 0x16 },
+	{ CCI_REG8(0x3389), 0x15 },
+	{ CCI_REG8(0x338a), 0x41 },
+	{ CCI_REG8(0x338b), 0x0 },
+	{ CCI_REG8(0x338c), 0x10 },
+	{ CCI_REG8(0x338d), 0x80 },
+	{ CCI_REG8(0x338e), 0x16 },
+	{ CCI_REG8(0x338f), 0x15 },
+	{ CCI_REG8(0x3390), 0x2 },
+	{ CCI_REG8(0x3391), 0x0 },
+	{ CCI_REG8(0x3392), 0x10 },
+	{ CCI_REG8(0x3393), 0xa0 },
+	{ CCI_REG8(0x3394), 0x16 },
+	{ CCI_REG8(0x3395), 0x15 },
+	{ CCI_REG8(0x305c), 0x18 },
+	{ CCI_REG8(0x305d), 0x0 },
+	{ CCI_REG8(0x305e), 0x19 },
+	{ CCI_REG8(0x305f), 0x0 },
+	{ CCI_REG8(0x3396), 0x1 },
+	{ CCI_REG8(0x3397), 0x0 },
+	{ CCI_REG8(0x3398), 0x90 },
+	{ CCI_REG8(0x3399), 0x30 },
+	{ CCI_REG8(0x339a), 0x56 },
+	{ CCI_REG8(0x339b), 0x57 },
+	{ CCI_REG8(0x339c), 0x1 },
+	{ CCI_REG8(0x339d), 0x0 },
+	{ CCI_REG8(0x339e), 0x10 },
+	{ CCI_REG8(0x339f), 0x20 },
+	{ CCI_REG8(0x33a0), 0xd6 },
+	{ CCI_REG8(0x33a1), 0x17 },
+	{ CCI_REG8(0x33a2), 0x1 },
+	{ CCI_REG8(0x33a3), 0x0 },
+	{ CCI_REG8(0x33a4), 0x10 },
+	{ CCI_REG8(0x33a5), 0x28 },
+	{ CCI_REG8(0x33a6), 0xd6 },
+	{ CCI_REG8(0x33a7), 0x17 },
+	{ CCI_REG8(0x33a8), 0x3 },
+	{ CCI_REG8(0x33a9), 0x0 },
+	{ CCI_REG8(0x33aa), 0x10 },
+	{ CCI_REG8(0x33ab), 0x20 },
+	{ CCI_REG8(0x33ac), 0xd6 },
+	{ CCI_REG8(0x33ad), 0x17 },
+	{ CCI_REG8(0x33ae), 0x61 },
+	{ CCI_REG8(0x33af), 0x0 },
+	{ CCI_REG8(0x33b0), 0x10 },
+	{ CCI_REG8(0x33b1), 0x20 },
+	{ CCI_REG8(0x33b2), 0xd6 },
+	{ CCI_REG8(0x33b3), 0x15 },
+	{ CCI_REG8(0x33b4), 0x1 },
+	{ CCI_REG8(0x33b5), 0x0 },
+	{ CCI_REG8(0x33b6), 0x10 },
+	{ CCI_REG8(0x33b7), 0x20 },
+	{ CCI_REG8(0x33b8), 0xd6 },
+	{ CCI_REG8(0x33b9), 0x1d },
+	{ CCI_REG8(0x33ba), 0x1 },
+	{ CCI_REG8(0x33bb), 0x0 },
+	{ CCI_REG8(0x33bc), 0x50 },
+	{ CCI_REG8(0x33bd), 0x20 },
+	{ CCI_REG8(0x33be), 0xd6 },
+	{ CCI_REG8(0x33bf), 0x1d },
+	{ CCI_REG8(0x33c0), 0x2c },
+	{ CCI_REG8(0x33c1), 0x0 },
+	{ CCI_REG8(0x33c2), 0x10 },
+	{ CCI_REG8(0x33c3), 0x20 },
+	{ CCI_REG8(0x33c4), 0xd6 },
+	{ CCI_REG8(0x33c5), 0x1d },
+	{ CCI_REG8(0x33c6), 0x1 },
+	{ CCI_REG8(0x33c7), 0x0 },
+	{ CCI_REG8(0x33c8), 0x90 },
+	{ CCI_REG8(0x33c9), 0x20 },
+	{ CCI_REG8(0x33ca), 0xd6 },
+	{ CCI_REG8(0x33cb), 0x1d },
+	{ CCI_REG8(0x33cc), 0x83 },
+	{ CCI_REG8(0x33cd), 0x0 },
+	{ CCI_REG8(0x33ce), 0x10 },
+	{ CCI_REG8(0x33cf), 0x20 },
+	{ CCI_REG8(0x33d0), 0xd6 },
+	{ CCI_REG8(0x33d1), 0x15 },
+	{ CCI_REG8(0x33d2), 0x1 },
+	{ CCI_REG8(0x33d3), 0x0 },
+	{ CCI_REG8(0x33d4), 0x10 },
+	{ CCI_REG8(0x33d5), 0x30 },
+	{ CCI_REG8(0x33d6), 0xd6 },
+	{ CCI_REG8(0x33d7), 0x15 },
+	{ CCI_REG8(0x33d8), 0x1 },
+	{ CCI_REG8(0x33d9), 0x0 },
+	{ CCI_REG8(0x33da), 0x10 },
+	{ CCI_REG8(0x33db), 0x20 },
+	{ CCI_REG8(0x33dc), 0xd6 },
+	{ CCI_REG8(0x33dd), 0x15 },
+	{ CCI_REG8(0x33de), 0x1 },
+	{ CCI_REG8(0x33df), 0x0 },
+	{ CCI_REG8(0x33e0), 0x10 },
+	{ CCI_REG8(0x33e1), 0x20 },
+	{ CCI_REG8(0x33e2), 0x56 },
+	{ CCI_REG8(0x33e3), 0x15 },
+	{ CCI_REG8(0x33e4), 0x7 },
+	{ CCI_REG8(0x33e5), 0x0 },
+	{ CCI_REG8(0x33e6), 0x10 },
+	{ CCI_REG8(0x33e7), 0x20 },
+	{ CCI_REG8(0x33e8), 0x16 },
+	{ CCI_REG8(0x33e9), 0x15 },
+	{ CCI_REG8(0x3060), 0x26 },
+	{ CCI_REG8(0x3061), 0x0 },
+	{ CCI_REG8(0x302a), 0xff },
+	{ CCI_REG8(0x302b), 0xff },
+	{ CCI_REG8(0x302c), 0xff },
+	{ CCI_REG8(0x302d), 0xff },
+	{ CCI_REG8(0x302e), 0x3f },
+	{ CCI_REG8(0x3013), 0xb },
+	{ CCI_REG8(0x102b), 0x2c },
+	{ CCI_REG8(0x102c), 0x1 },
+	{ CCI_REG8(0x1035), 0x54 },
+	{ CCI_REG8(0x1036), 0x0 },
+	{ CCI_REG8(0x3090), 0x2a },
+	{ CCI_REG8(0x3091), 0x1 },
+	{ CCI_REG8(0x30c6), 0x5 },
+	{ CCI_REG8(0x30c7), 0x0 },
+	{ CCI_REG8(0x30c8), 0x0 },
+	{ CCI_REG8(0x30c9), 0x0 },
+	{ CCI_REG8(0x30ca), 0x0 },
+	{ CCI_REG8(0x30cb), 0x0 },
+	{ CCI_REG8(0x30cc), 0x0 },
+	{ CCI_REG8(0x30cd), 0x0 },
+	{ CCI_REG8(0x30ce), 0x0 },
+	{ CCI_REG8(0x30cf), 0x5 },
+	{ CCI_REG8(0x30d0), 0x0 },
+	{ CCI_REG8(0x30d1), 0x0 },
+	{ CCI_REG8(0x30d2), 0x0 },
+	{ CCI_REG8(0x30d3), 0x0 },
+	{ CCI_REG8(0x30d4), 0x0 },
+	{ CCI_REG8(0x30d5), 0x0 },
+	{ CCI_REG8(0x30d6), 0x0 },
+	{ CCI_REG8(0x30d7), 0x0 },
+	{ CCI_REG8(0x30f3), 0x5 },
+	{ CCI_REG8(0x30f4), 0x0 },
+	{ CCI_REG8(0x30f5), 0x0 },
+	{ CCI_REG8(0x30f6), 0x0 },
+	{ CCI_REG8(0x30f7), 0x0 },
+	{ CCI_REG8(0x30f8), 0x0 },
+	{ CCI_REG8(0x30f9), 0x0 },
+	{ CCI_REG8(0x30fa), 0x0 },
+	{ CCI_REG8(0x30fb), 0x0 },
+	{ CCI_REG8(0x30d8), 0x5 },
+	{ CCI_REG8(0x30d9), 0x0 },
+	{ CCI_REG8(0x30da), 0x0 },
+	{ CCI_REG8(0x30db), 0x0 },
+	{ CCI_REG8(0x30dc), 0x0 },
+	{ CCI_REG8(0x30dd), 0x0 },
+	{ CCI_REG8(0x30de), 0x0 },
+	{ CCI_REG8(0x30df), 0x0 },
+	{ CCI_REG8(0x30e0), 0x0 },
+	{ CCI_REG8(0x30e1), 0x5 },
+	{ CCI_REG8(0x30e2), 0x0 },
+	{ CCI_REG8(0x30e3), 0x0 },
+	{ CCI_REG8(0x30e4), 0x0 },
+	{ CCI_REG8(0x30e5), 0x0 },
+	{ CCI_REG8(0x30e6), 0x0 },
+	{ CCI_REG8(0x30e7), 0x0 },
+	{ CCI_REG8(0x30e8), 0x0 },
+	{ CCI_REG8(0x30e9), 0x0 },
+	{ CCI_REG8(0x30f3), 0x5 },
+	{ CCI_REG8(0x30f4), 0x2 },
+	{ CCI_REG8(0x30f5), 0x0 },
+	{ CCI_REG8(0x30f6), 0x17 },
+	{ CCI_REG8(0x30f7), 0x1 },
+	{ CCI_REG8(0x30f8), 0x0 },
+	{ CCI_REG8(0x30f9), 0x0 },
+	{ CCI_REG8(0x30fa), 0x0 },
+	{ CCI_REG8(0x30fb), 0x0 },
+	{ CCI_REG8(0x30d8), 0x3 },
+	{ CCI_REG8(0x30d9), 0x1 },
+	{ CCI_REG8(0x30da), 0x0 },
+	{ CCI_REG8(0x30db), 0x19 },
+	{ CCI_REG8(0x30dc), 0x1 },
+	{ CCI_REG8(0x30dd), 0x0 },
+	{ CCI_REG8(0x30de), 0x0 },
+	{ CCI_REG8(0x30df), 0x0 },
+	{ CCI_REG8(0x30e0), 0x0 },
+	{ CCI_REG8(0x30a2), 0x5 },
+	{ CCI_REG8(0x30a3), 0x2 },
+	{ CCI_REG8(0x30a4), 0x0 },
+	{ CCI_REG8(0x30a5), 0x22 },
+	{ CCI_REG8(0x30a6), 0x0 },
+	{ CCI_REG8(0x30a7), 0x0 },
+	{ CCI_REG8(0x30a8), 0x0 },
+	{ CCI_REG8(0x30a9), 0x0 },
+	{ CCI_REG8(0x30aa), 0x0 },
+	{ CCI_REG8(0x30ab), 0x5 },
+	{ CCI_REG8(0x30ac), 0x2 },
+	{ CCI_REG8(0x30ad), 0x0 },
+	{ CCI_REG8(0x30ae), 0x22 },
+	{ CCI_REG8(0x30af), 0x0 },
+	{ CCI_REG8(0x30b0), 0x0 },
+	{ CCI_REG8(0x30b1), 0x0 },
+	{ CCI_REG8(0x30b2), 0x0 },
+	{ CCI_REG8(0x30b3), 0x0 },
+	{ CCI_REG8(0x30bd), 0x5 },
+	{ CCI_REG8(0x30be), 0x9f },
+	{ CCI_REG8(0x30bf), 0x0 },
+	{ CCI_REG8(0x30c0), 0x7d },
+	{ CCI_REG8(0x30c1), 0x0 },
+	{ CCI_REG8(0x30c2), 0x0 },
+	{ CCI_REG8(0x30c3), 0x0 },
+	{ CCI_REG8(0x30c4), 0x0 },
+	{ CCI_REG8(0x30c5), 0x0 },
+	{ CCI_REG8(0x30b4), 0x4 },
+	{ CCI_REG8(0x30b5), 0x9c },
+	{ CCI_REG8(0x30b6), 0x0 },
+	{ CCI_REG8(0x30b7), 0x7d },
+	{ CCI_REG8(0x30b8), 0x0 },
+	{ CCI_REG8(0x30b9), 0x0 },
+	{ CCI_REG8(0x30ba), 0x0 },
+	{ CCI_REG8(0x30bb), 0x0 },
+	{ CCI_REG8(0x30bc), 0x0 },
+	{ CCI_REG8(0x30fc), 0x5 },
+	{ CCI_REG8(0x30fd), 0x0 },
+	{ CCI_REG8(0x30fe), 0x0 },
+	{ CCI_REG8(0x30ff), 0x0 },
+	{ CCI_REG8(0x3100), 0x0 },
+	{ CCI_REG8(0x3101), 0x0 },
+	{ CCI_REG8(0x3102), 0x0 },
+	{ CCI_REG8(0x3103), 0x0 },
+	{ CCI_REG8(0x3104), 0x0 },
+	{ CCI_REG8(0x3105), 0x5 },
+	{ CCI_REG8(0x3106), 0x0 },
+	{ CCI_REG8(0x3107), 0x0 },
+	{ CCI_REG8(0x3108), 0x0 },
+	{ CCI_REG8(0x3109), 0x0 },
+	{ CCI_REG8(0x310a), 0x0 },
+	{ CCI_REG8(0x310b), 0x0 },
+	{ CCI_REG8(0x310c), 0x0 },
+	{ CCI_REG8(0x310d), 0x0 },
+	{ CCI_REG8(0x3099), 0x5 },
+	{ CCI_REG8(0x309a), 0x96 },
+	{ CCI_REG8(0x309b), 0x0 },
+	{ CCI_REG8(0x309c), 0x6 },
+	{ CCI_REG8(0x309d), 0x0 },
+	{ CCI_REG8(0x309e), 0x0 },
+	{ CCI_REG8(0x309f), 0x0 },
+	{ CCI_REG8(0x30a0), 0x0 },
+	{ CCI_REG8(0x30a1), 0x0 },
+	{ CCI_REG8(0x310e), 0x5 },
+	{ CCI_REG8(0x310f), 0x2 },
+	{ CCI_REG8(0x3110), 0x0 },
+	{ CCI_REG8(0x3111), 0x2b },
+	{ CCI_REG8(0x3112), 0x0 },
+	{ CCI_REG8(0x3113), 0x0 },
+	{ CCI_REG8(0x3114), 0x0 },
+	{ CCI_REG8(0x3115), 0x0 },
+	{ CCI_REG8(0x3116), 0x0 },
+	{ CCI_REG8(0x3117), 0x5 },
+	{ CCI_REG8(0x3118), 0x2 },
+	{ CCI_REG8(0x3119), 0x0 },
+	{ CCI_REG8(0x311a), 0x2c },
+	{ CCI_REG8(0x311b), 0x0 },
+	{ CCI_REG8(0x311c), 0x0 },
+	{ CCI_REG8(0x311d), 0x0 },
+	{ CCI_REG8(0x311e), 0x0 },
+	{ CCI_REG8(0x311f), 0x0 },
+	{ CCI_REG8(0x30ea), 0x0 },
+	{ CCI_REG8(0x30eb), 0x0 },
+	{ CCI_REG8(0x30ec), 0x0 },
+	{ CCI_REG8(0x30ed), 0x0 },
+	{ CCI_REG8(0x30ee), 0x0 },
+	{ CCI_REG8(0x30ef), 0x0 },
+	{ CCI_REG8(0x30f0), 0x0 },
+	{ CCI_REG8(0x30f1), 0x0 },
+	{ CCI_REG8(0x30f2), 0x0 },
+	{ CCI_REG8(0x313b), 0x3 },
+	{ CCI_REG8(0x313c), 0x31 },
+	{ CCI_REG8(0x313d), 0x0 },
+	{ CCI_REG8(0x313e), 0x7 },
+	{ CCI_REG8(0x313f), 0x0 },
+	{ CCI_REG8(0x3140), 0x68 },
+	{ CCI_REG8(0x3141), 0x0 },
+	{ CCI_REG8(0x3142), 0x34 },
+	{ CCI_REG8(0x3143), 0x0 },
+	{ CCI_REG8(0x31a0), 0x3 },
+	{ CCI_REG8(0x31a1), 0x16 },
+	{ CCI_REG8(0x31a2), 0x0 },
+	{ CCI_REG8(0x31a3), 0x8 },
+	{ CCI_REG8(0x31a4), 0x0 },
+	{ CCI_REG8(0x31a5), 0x7e },
+	{ CCI_REG8(0x31a6), 0x0 },
+	{ CCI_REG8(0x31a7), 0x8 },
+	{ CCI_REG8(0x31a8), 0x0 },
+	{ CCI_REG8(0x31a9), 0x3 },
+	{ CCI_REG8(0x31aa), 0x16 },
+	{ CCI_REG8(0x31ab), 0x0 },
+	{ CCI_REG8(0x31ac), 0x8 },
+	{ CCI_REG8(0x31ad), 0x0 },
+	{ CCI_REG8(0x31ae), 0x7e },
+	{ CCI_REG8(0x31af), 0x0 },
+	{ CCI_REG8(0x31b0), 0x8 },
+	{ CCI_REG8(0x31b1), 0x0 },
+	{ CCI_REG8(0x31b2), 0x3 },
+	{ CCI_REG8(0x31b3), 0x16 },
+	{ CCI_REG8(0x31b4), 0x0 },
+	{ CCI_REG8(0x31b5), 0x8 },
+	{ CCI_REG8(0x31b6), 0x0 },
+	{ CCI_REG8(0x31b7), 0x7e },
+	{ CCI_REG8(0x31b8), 0x0 },
+	{ CCI_REG8(0x31b9), 0x8 },
+	{ CCI_REG8(0x31ba), 0x0 },
+	{ CCI_REG8(0x3120), 0x5 },
+	{ CCI_REG8(0x3121), 0x45 },
+	{ CCI_REG8(0x3122), 0x0 },
+	{ CCI_REG8(0x3123), 0x1d },
+	{ CCI_REG8(0x3124), 0x0 },
+	{ CCI_REG8(0x3125), 0xa9 },
+	{ CCI_REG8(0x3126), 0x0 },
+	{ CCI_REG8(0x3127), 0x6d },
+	{ CCI_REG8(0x3128), 0x0 },
+	{ CCI_REG8(0x3129), 0x5 },
+	{ CCI_REG8(0x312a), 0x15 },
+	{ CCI_REG8(0x312b), 0x0 },
+	{ CCI_REG8(0x312c), 0xa },
+	{ CCI_REG8(0x312d), 0x0 },
+	{ CCI_REG8(0x312e), 0x45 },
+	{ CCI_REG8(0x312f), 0x0 },
+	{ CCI_REG8(0x3130), 0x1d },
+	{ CCI_REG8(0x3131), 0x0 },
+	{ CCI_REG8(0x3132), 0x5 },
+	{ CCI_REG8(0x3133), 0x7d },
+	{ CCI_REG8(0x3134), 0x0 },
+	{ CCI_REG8(0x3135), 0xa },
+	{ CCI_REG8(0x3136), 0x0 },
+	{ CCI_REG8(0x3137), 0xa9 },
+	{ CCI_REG8(0x3138), 0x0 },
+	{ CCI_REG8(0x3139), 0x6d },
+	{ CCI_REG8(0x313a), 0x0 },
+	{ CCI_REG8(0x3144), 0x5 },
+	{ CCI_REG8(0x3145), 0x0 },
+	{ CCI_REG8(0x3146), 0x0 },
+	{ CCI_REG8(0x3147), 0x30 },
+	{ CCI_REG8(0x3148), 0x0 },
+	{ CCI_REG8(0x3149), 0x0 },
+	{ CCI_REG8(0x314a), 0x0 },
+	{ CCI_REG8(0x314b), 0x0 },
+	{ CCI_REG8(0x314c), 0x0 },
+	{ CCI_REG8(0x314d), 0x3 },
+	{ CCI_REG8(0x314e), 0x0 },
+	{ CCI_REG8(0x314f), 0x0 },
+	{ CCI_REG8(0x3150), 0x31 },
+	{ CCI_REG8(0x3151), 0x0 },
+	{ CCI_REG8(0x3152), 0x0 },
+	{ CCI_REG8(0x3153), 0x0 },
+	{ CCI_REG8(0x3154), 0x0 },
+	{ CCI_REG8(0x3155), 0x0 },
+	{ CCI_REG8(0x31d8), 0x5 },
+	{ CCI_REG8(0x31d9), 0x3a },
+	{ CCI_REG8(0x31da), 0x0 },
+	{ CCI_REG8(0x31db), 0x2e },
+	{ CCI_REG8(0x31dc), 0x0 },
+	{ CCI_REG8(0x31dd), 0x9e },
+	{ CCI_REG8(0x31de), 0x0 },
+	{ CCI_REG8(0x31df), 0x7e },
+	{ CCI_REG8(0x31e0), 0x0 },
+	{ CCI_REG8(0x31e1), 0x5 },
+	{ CCI_REG8(0x31e2), 0x4 },
+	{ CCI_REG8(0x31e3), 0x0 },
+	{ CCI_REG8(0x31e4), 0x4 },
+	{ CCI_REG8(0x31e5), 0x0 },
+	{ CCI_REG8(0x31e6), 0x73 },
+	{ CCI_REG8(0x31e7), 0x0 },
+	{ CCI_REG8(0x31e8), 0x4 },
+	{ CCI_REG8(0x31e9), 0x0 },
+	{ CCI_REG8(0x31ea), 0x5 },
+	{ CCI_REG8(0x31eb), 0x0 },
+	{ CCI_REG8(0x31ec), 0x0 },
+	{ CCI_REG8(0x31ed), 0x0 },
+	{ CCI_REG8(0x31ee), 0x0 },
+	{ CCI_REG8(0x31ef), 0x0 },
+	{ CCI_REG8(0x31f0), 0x0 },
+	{ CCI_REG8(0x31f1), 0x0 },
+	{ CCI_REG8(0x31f2), 0x0 },
+	{ CCI_REG8(0x31f3), 0x0 },
+	{ CCI_REG8(0x31f4), 0x0 },
+	{ CCI_REG8(0x31f5), 0x0 },
+	{ CCI_REG8(0x31f6), 0x0 },
+	{ CCI_REG8(0x31f7), 0x0 },
+	{ CCI_REG8(0x31f8), 0x0 },
+	{ CCI_REG8(0x31f9), 0x0 },
+	{ CCI_REG8(0x31fa), 0x0 },
+	{ CCI_REG8(0x31fb), 0x5 },
+	{ CCI_REG8(0x31fc), 0x0 },
+	{ CCI_REG8(0x31fd), 0x0 },
+	{ CCI_REG8(0x31fe), 0x0 },
+	{ CCI_REG8(0x31ff), 0x0 },
+	{ CCI_REG8(0x3200), 0x0 },
+	{ CCI_REG8(0x3201), 0x0 },
+	{ CCI_REG8(0x3202), 0x0 },
+	{ CCI_REG8(0x3203), 0x0 },
+	{ CCI_REG8(0x3204), 0x0 },
+	{ CCI_REG8(0x3205), 0x0 },
+	{ CCI_REG8(0x3206), 0x0 },
+	{ CCI_REG8(0x3207), 0x0 },
+	{ CCI_REG8(0x3208), 0x0 },
+	{ CCI_REG8(0x3209), 0x0 },
+	{ CCI_REG8(0x320a), 0x0 },
+	{ CCI_REG8(0x320b), 0x0 },
+	{ CCI_REG8(0x3164), 0x5 },
+	{ CCI_REG8(0x3165), 0x14 },
+	{ CCI_REG8(0x3166), 0x0 },
+	{ CCI_REG8(0x3167), 0xc },
+	{ CCI_REG8(0x3168), 0x0 },
+	{ CCI_REG8(0x3169), 0x44 },
+	{ CCI_REG8(0x316a), 0x0 },
+	{ CCI_REG8(0x316b), 0x1f },
+	{ CCI_REG8(0x316c), 0x0 },
+	{ CCI_REG8(0x316d), 0x5 },
+	{ CCI_REG8(0x316e), 0x7c },
+	{ CCI_REG8(0x316f), 0x0 },
+	{ CCI_REG8(0x3170), 0xc },
+	{ CCI_REG8(0x3171), 0x0 },
+	{ CCI_REG8(0x3172), 0xa8 },
+	{ CCI_REG8(0x3173), 0x0 },
+	{ CCI_REG8(0x3174), 0x6f },
+	{ CCI_REG8(0x3175), 0x0 },
+	{ CCI_REG8(0x31c4), 0x5 },
+	{ CCI_REG8(0x31c5), 0x24 },
+	{ CCI_REG8(0x31c6), 0x1 },
+	{ CCI_REG8(0x31c7), 0x4 },
+	{ CCI_REG8(0x31c8), 0x0 },
+	{ CCI_REG8(0x31c9), 0x5 },
+	{ CCI_REG8(0x31ca), 0x24 },
+	{ CCI_REG8(0x31cb), 0x1 },
+	{ CCI_REG8(0x31cc), 0x4 },
+	{ CCI_REG8(0x31cd), 0x0 },
+	{ CCI_REG8(0x31ce), 0x5 },
+	{ CCI_REG8(0x31cf), 0x24 },
+	{ CCI_REG8(0x31d0), 0x1 },
+	{ CCI_REG8(0x31d1), 0x4 },
+	{ CCI_REG8(0x31d2), 0x0 },
+	{ CCI_REG8(0x31d3), 0x5 },
+	{ CCI_REG8(0x31d4), 0x73 },
+	{ CCI_REG8(0x31d5), 0x0 },
+	{ CCI_REG8(0x31d6), 0xb1 },
+	{ CCI_REG8(0x31d7), 0x0 },
+	{ CCI_REG8(0x3176), 0x5 },
+	{ CCI_REG8(0x3177), 0x10 },
+	{ CCI_REG8(0x3178), 0x0 },
+	{ CCI_REG8(0x3179), 0x56 },
+	{ CCI_REG8(0x317a), 0x0 },
+	{ CCI_REG8(0x317b), 0x0 },
+	{ CCI_REG8(0x317c), 0x0 },
+	{ CCI_REG8(0x317d), 0x0 },
+	{ CCI_REG8(0x317e), 0x0 },
+	{ CCI_REG8(0x317f), 0x5 },
+	{ CCI_REG8(0x3180), 0x6a },
+	{ CCI_REG8(0x3181), 0x0 },
+	{ CCI_REG8(0x3182), 0xad },
+	{ CCI_REG8(0x3183), 0x0 },
+	{ CCI_REG8(0x3184), 0x0 },
+	{ CCI_REG8(0x3185), 0x0 },
+	{ CCI_REG8(0x3186), 0x0 },
+	{ CCI_REG8(0x3187), 0x0 },
+	{ CCI_REG8(0x100c), 0x7e },
+	{ CCI_REG8(0x100d), 0x0 },
+	{ CCI_REG8(0x1012), 0xdf },
+	{ CCI_REG8(0x1013), 0x2b },
+	{ CCI_REG8(0x1002), 0x4 },
+	/* Sensor control mode */
+	{ CCI_REG8(0x0043), 0x0 }, /*  Sensor Control Mode.SLEEP_POWER_MODE(0)*/
+	{ CCI_REG8(0x0043), 0x0 }, /*  Sensor Control Mode.IDLE_POWER_MODE(0)*/
+	{ CCI_REG8(0x0043), 0x4 }, /*  Sensor Control Mode.SYSTEM_CLOCK_ENABLE(0)*/
+	{ CCI_REG8(0x0043), 0xc }, /*  Sensor Control Mode.SRAM_CLOCK_ENABLE(0)*/
+	{ CCI_REG8(0x1002), 0x4 }, /*  Sensor Control Mode.IMAGER_RUN_CONT(0)*/
+	{ CCI_REG8(0x1001), 0x41 }, /*  Sensor Control Mode.EXT_EVENT_SEL(0)*/
+	{ CCI_REG8(0x10f2), 0x1 }, /*  Sensor Control Mode.NB_OF_FRAMES_A(0)*/
+	{ CCI_REG8(0x10f3), 0x0 }, /*  Sensor Control Mode.NB_OF_FRAMES_A(1)*/
+	{ CCI_REG8(0x1111), 0x1 }, /*  Sensor Control Mode.NB_OF_FRAMES_B(0)*/
+	{ CCI_REG8(0x1112), 0x0 }, /*  Sensor Control Mode.NB_OF_FRAMES_B(1)*/
+	{ CCI_REG8(0x0012), 0x0 }, /*  IO Drive Strength.DIG_DRIVE_STRENGTH(0)*/
+	{ CCI_REG8(0x0012), 0x0 }, /*  IO Drive Strength.CCI_DRIVE_STRENGTH(0)*/
+	{ CCI_REG8(0x1001), 0x41 }, /*  Readout && Exposure.EXT_EXP_PW_SEL(0)*/
+	{ CCI_REG8(0x10d0), 0x0 }, /*  Readout && Exposure.EXT_EXP_PW_DELAY(0)*/
+	{ CCI_REG8(0x10d1), 0x0 }, /*  Readout && Exposure.EXT_EXP_PW_DELAY(1)*/
+	{ CCI_REG8(0x1012), 0x91 }, /*  Readout && Exposure.VBLANK_A(0)*/
+	{ CCI_REG8(0x1013), 0xd }, /*  Readout && Exposure.VBLANK_A(1)*/
+	{ CCI_REG8(0x1103), 0x91 }, /*  Readout && Exposure.VBLANK_B(0)*/
+	{ CCI_REG8(0x1104), 0xd }, /*  Readout && Exposure.VBLANK_B(1)*/
+	{ CCI_REG8(0x100c), 0x80 }, /*  Readout && Exposure.EXP_TIME_A(0)*/
+	{ CCI_REG8(0x100d), 0x0 }, /*  Readout && Exposure.EXP_TIME_A(1)*/
+	{ CCI_REG8(0x1115), 0x80 }, /*  Readout && Exposure.EXP_TIME_B(0)*/
+	{ CCI_REG8(0x1116), 0x0 }, /*  Readout && Exposure.EXP_TIME_B(1)*/
+	{ CCI_REG8(0x102b), 0x30 }, /*  Readout && Exposure.ROW_LENGTH_A(0)*/
+	{ CCI_REG8(0x102c), 0x1 }, /*  Readout && Exposure.ROW_LENGTH_A(1)*/
+	{ CCI_REG8(0x1113), 0x30 }, /*  Readout && Exposure.ROW_LENGTH_B(0)*/
+	{ CCI_REG8(0x1114), 0x1 }, /*  Readout && Exposure.ROW_LENGTH_B(1)*/
+	/* ROI */
+	{ CCI_REG8(0x2008), 0x20 }, /*  Horizontal ROI.HSIZE_A(0)*/
+	{ CCI_REG8(0x2009), 0x3 }, /*  Horizontal ROI.HSIZE_A(1)*/
+	{ CCI_REG8(0x2098), 0x20 }, /*  Horizontal ROI.HSIZE_B(0)*/
+	{ CCI_REG8(0x2099), 0x3 }, /*  Horizontal ROI.HSIZE_B(1)*/
+	{ CCI_REG8(0x200a), 0x0 }, /*  Horizontal ROI.HSTART_A(0)*/
+	{ CCI_REG8(0x200b), 0x0 }, /*  Horizontal ROI.HSTART_A(1)*/
+	{ CCI_REG8(0x209a), 0x0 }, /*  Horizontal ROI.HSTART_B(0)*/
+	{ CCI_REG8(0x209b), 0x0 }, /*  Horizontal ROI.HSTART_B(1)*/
+	{ CCI_REG8(0x207d), 0x40 }, /*  Horizontal ROI.MIPI_HSIZE(0)*/
+	{ CCI_REG8(0x207e), 0x6 }, /*  Horizontal ROI.MIPI_HSIZE(1)*/
+	{ CCI_REG8(0x107d), 0x0 }, /*  Vertical ROI.VSTART0_A(0)*/
+	{ CCI_REG8(0x107e), 0x0 }, /*  Vertical ROI.VSTART0_A(1)*/
+	{ CCI_REG8(0x1087), 0x78 }, /*  Vertical ROI.VSIZE0_A(0)*/
+	{ CCI_REG8(0x1088), 0x5 }, /*  Vertical ROI.VSIZE0_A(1)*/
+	{ CCI_REG8(0x1105), 0x0 }, /*  Vertical ROI.VSTART0_B(0)*/
+	{ CCI_REG8(0x1106), 0x0 }, /*  Vertical ROI.VSTART0_B(1)*/
+	{ CCI_REG8(0x110a), 0x78 }, /*  Vertical ROI.VSIZE0_B(0)*/
+	{ CCI_REG8(0x110b), 0x5 }, /*  Vertical ROI.VSIZE0_B(1)*/
+	{ CCI_REG8(0x107d), 0x0 }, /*  Vertical ROI.VSTART1_A(0)*/
+	{ CCI_REG8(0x107e), 0x0 }, /*  Vertical ROI.VSTART1_A(1)*/
+	{ CCI_REG8(0x107f), 0x0 }, /*  Vertical ROI.VSTART1_A(2)*/
+	{ CCI_REG8(0x1087), 0x78 }, /*  Vertical ROI.VSIZE1_A(0)*/
+	{ CCI_REG8(0x1088), 0x5 }, /*  Vertical ROI.VSIZE1_A(1)*/
+	{ CCI_REG8(0x1089), 0x0 }, /*  Vertical ROI.VSIZE1_A(2)*/
+	{ CCI_REG8(0x1105), 0x0 }, /*  Vertical ROI.VSTART1_B(0)*/
+	{ CCI_REG8(0x1106), 0x0 }, /*  Vertical ROI.VSTART1_B(1)*/
+	{ CCI_REG8(0x1107), 0x0 }, /*  Vertical ROI.VSTART1_B(2)*/
+	{ CCI_REG8(0x110a), 0x78 }, /*  Vertical ROI.VSIZE1_B(0)*/
+	{ CCI_REG8(0x110b), 0x5 }, /*  Vertical ROI.VSIZE1_B(1)*/
+	{ CCI_REG8(0x110c), 0x0 }, /*  Vertical ROI.VSIZE1_B(2)*/
+	{ CCI_REG8(0x107d), 0x0 }, /*  Vertical ROI.VSTART2_A(0)*/
+	{ CCI_REG8(0x107e), 0x0 }, /*  Vertical ROI.VSTART2_A(1)*/
+	{ CCI_REG8(0x107f), 0x0 }, /*  Vertical ROI.VSTART2_A(2)*/
+	{ CCI_REG8(0x1080), 0x0 }, /*  Vertical ROI.VSTART2_A(3)*/
+	{ CCI_REG8(0x1081), 0x0 }, /*  Vertical ROI.VSTART2_A(4)*/
+	{ CCI_REG8(0x1087), 0x78 }, /*  Vertical ROI.VSIZE2_A(0)*/
+	{ CCI_REG8(0x1088), 0x5 }, /*  Vertical ROI.VSIZE2_A(1)*/
+	{ CCI_REG8(0x1089), 0x0 }, /*  Vertical ROI.VSIZE2_A(2)*/
+	{ CCI_REG8(0x108a), 0x0 }, /*  Vertical ROI.VSIZE2_A(3)*/
+	{ CCI_REG8(0x108b), 0x0 }, /*  Vertical ROI.VSIZE2_A(4)*/
+	{ CCI_REG8(0x1105), 0x0 }, /*  Vertical ROI.VSTART2_B(0)*/
+	{ CCI_REG8(0x1106), 0x0 }, /*  Vertical ROI.VSTART2_B(1)*/
+	{ CCI_REG8(0x1107), 0x0 }, /*  Vertical ROI.VSTART2_B(2)*/
+	{ CCI_REG8(0x1108), 0x0 }, /*  Vertical ROI.VSTART2_B(3)*/
+	{ CCI_REG8(0x1109), 0x0 }, /*  Vertical ROI.VSTART2_B(4)*/
+	{ CCI_REG8(0x110a), 0x78 }, /*  Vertical ROI.VSIZE2_B(0)*/
+	{ CCI_REG8(0x110b), 0x5 }, /*  Vertical ROI.VSIZE2_B(1)*/
+	{ CCI_REG8(0x110c), 0x0 }, /*  Vertical ROI.VSIZE2_B(2)*/
+	{ CCI_REG8(0x110d), 0x0 }, /*  Vertical ROI.VSIZE2_B(3)*/
+	{ CCI_REG8(0x110e), 0x0 }, /*  Vertical ROI.VSIZE2_B(4)*/
+	/* Mirror and Flip */
+	{ CCI_REG8(0x209c), 0x0 }, /*  Mirroring && Flipping.HFLIP_A(0)*/
+	{ CCI_REG8(0x209d), 0x0 }, /*  Mirroring && Flipping.HFLIP_B(0)*/
+	{ CCI_REG8(0x1095), 0x0 }, /*  Mirroring && Flipping.VFLIP(0)*/
+	{ CCI_REG8(0x2063), 0x0 }, /*  Mirroring && Flipping.BIT_ORDER(0)*/
+
+	/* MIPI 1.5 Gbit/s */
+	{ CCI_REG8(0x6006), 0x0 }, /*  MIPI.TX_CTRL_EN(0)*/
+	{ CCI_REG8(0x5004), 0x1 }, /*  MIPI.datarate*/
+	{ CCI_REG8(0x5086), 0x2 }, /*  MIPI.datarate*/
+	{ CCI_REG8(0x5087), 0x4e }, /*  MIPI.datarate*/
+	{ CCI_REG8(0x5088), 0x0 }, /*  MIPI.datarate*/
+	{ CCI_REG8(0x5090), 0x0 }, /*  MIPI.datarate*/
+	{ CCI_REG8(0x5091), 0x8 }, /*  MIPI.datarate*/
+	{ CCI_REG8(0x5092), 0x14 }, /*  MIPI.datarate*/
+	{ CCI_REG8(0x5093), 0xf }, /*  MIPI.datarate*/
+	{ CCI_REG8(0x5094), 0x6 }, /*  MIPI.datarate*/
+	{ CCI_REG8(0x5095), 0x32 }, /*  MIPI.datarate*/
+	{ CCI_REG8(0x5096), 0xe }, /*  MIPI.datarate*/
+	{ CCI_REG8(0x5097), 0x0 }, /*  MIPI.datarate*/
+	{ CCI_REG8(0x5098), 0x11 }, /*  MIPI.datarate*/
+	{ CCI_REG8(0x5004), 0x0 }, /*  MIPI.datarate*/
+	{ CCI_REG8(0x2066), 0x6c }, /*  MIPI.datarate*/
+	{ CCI_REG8(0x2067), 0x7 }, /*  MIPI.datarate*/
+	{ CCI_REG8(0x206e), 0x7e }, /*  MIPI.datarate*/
+	{ CCI_REG8(0x206f), 0x6 }, /*  MIPI.datarate*/
+	{ CCI_REG8(0x20ac), 0x7e }, /*  MIPI.datarate*/
+	{ CCI_REG8(0x20ad), 0x6 }, /*  MIPI.datarate*/
+	{ CCI_REG8(0x2076), 0xc8 }, /*  MIPI.datarate*/
+	{ CCI_REG8(0x2077), 0x0 }, /*  MIPI.datarate*/
+	{ CCI_REG8(0x20b4), 0xc8 }, /*  MIPI.datarate*/
+	{ CCI_REG8(0x20b5), 0x0 }, /*  MIPI.datarate*/
+	{ CCI_REG8(0x2078), 0x1e }, /*  MIPI.datarate*/
+	{ CCI_REG8(0x2079), 0x4 }, /*  MIPI.datarate*/
+	{ CCI_REG8(0x20b6), 0x1e }, /*  MIPI.datarate*/
+	{ CCI_REG8(0x20b7), 0x4 }, /*  MIPI.datarate*/
+	{ CCI_REG8(0x207a), 0xd4 }, /*  MIPI.datarate*/
+	{ CCI_REG8(0x207b), 0x4 }, /*  MIPI.datarate*/
+	{ CCI_REG8(0x20b8), 0xd4 }, /*  MIPI.datarate*/
+	{ CCI_REG8(0x20b9), 0x4 }, /*  MIPI.datarate*/
+	{ CCI_REG8(0x208d), 0x4 }, /*  MIPI.CSI2_DTYPE(0)*/
+	{ CCI_REG8(0x208e), 0x0 }, /*  MIPI.CSI2_DTYPE(1)*/
+	{ CCI_REG8(0x207c), 0x0 }, /*  MIPI.VC_ID(0)*/
+	{ CCI_REG8(0x6001), 0x7 }, /*  MIPI.TINIT(0)*/
+	{ CCI_REG8(0x6002), 0xd8 }, /*  MIPI.TINIT(1)*/
+	{ CCI_REG8(0x6010), 0x0 }, /*  MIPI.FRAME_MODE(0)*/
+	{ CCI_REG8(0x6010), 0x0 }, /*  MIPI.EMBEDDED_FRAME_MODE(0)*/
+	{ CCI_REG8(0x6011), 0x0 }, /*  MIPI.DATA_ENABLE_POLARITY(0)*/
+	{ CCI_REG8(0x6011), 0x0 }, /*  MIPI.HSYNC_POLARITY(0)*/
+	{ CCI_REG8(0x6011), 0x0 }, /*  MIPI.VSYNC_POLARITY(0)*/
+	{ CCI_REG8(0x6012), 0x1 }, /*  MIPI.LANE(0)*/
+	{ CCI_REG8(0x6013), 0x0 }, /*  MIPI.CLK_MODE(0)*/
+	{ CCI_REG8(0x6016), 0x0 }, /*  MIPI.FRAME_COUNTER(0)*/
+	{ CCI_REG8(0x6017), 0x0 }, /*  MIPI.FRAME_COUNTER(1)*/
+	{ CCI_REG8(0x6037), 0x1 }, /*  MIPI.LINE_COUNT_RAW8(0)*/
+	{ CCI_REG8(0x6037), 0x3 }, /*  MIPI.LINE_COUNT_RAW10(0)*/
+	{ CCI_REG8(0x6037), 0x7 }, /*  MIPI.LINE_COUNT_RAW12(0)*/
+	{ CCI_REG8(0x6039), 0x1 }, /*  MIPI.LINE_COUNT_EMB(0)*/
+	{ CCI_REG8(0x6018), 0x0 }, /*  MIPI.CCI_READ_INTERRUPT_EN(0)*/
+	{ CCI_REG8(0x6018), 0x0 }, /*  MIPI.CCI_WRITE_INTERRUPT_EN(0)*/
+	{ CCI_REG8(0x6065), 0x0 }, /*  MIPI.TWAKE_TIMER(0)*/
+	{ CCI_REG8(0x6066), 0x0 }, /*  MIPI.TWAKE_TIMER(1)*/
+	{ CCI_REG8(0x601c), 0x0 }, /*  MIPI.SKEW_CAL_EN(0)*/
+	{ CCI_REG8(0x601d), 0x0 }, /*  MIPI.SKEW_COUNT(0)*/
+	{ CCI_REG8(0x601e), 0x22 }, /*  MIPI.SKEW_COUNT(1)*/
+	{ CCI_REG8(0x601f), 0x0 }, /*  MIPI.SCRAMBLING_EN(0)*/
+	{ CCI_REG8(0x6003), 0x1 }, /*  MIPI.INIT_SKEW_EN(0)*/
+	{ CCI_REG8(0x6004), 0x7a }, /*  MIPI.INIT_SKEW(0)*/
+	{ CCI_REG8(0x6005), 0x12 }, /*  MIPI.INIT_SKEW(1)*/
+	{ CCI_REG8(0x6006), 0x1 }, /*  MIPI.TX_CTRL_EN(0)*/
+	/* Processing */
+	{ CCI_REG8(0x4006), 0x8 }, /*  Processing.BSP(0)*/
+	{ CCI_REG8(0x209e), 0x2 }, /*  Processing.BIT_DEPTH(0)*/
+	{ CCI_REG8(0x2045), 0x1 }, /*  Processing.CDS_RNC(0)*/
+	{ CCI_REG8(0x2048), 0x1 }, /*  Processing.CDS_IMG(0)*/
+	{ CCI_REG8(0x204b), 0x3 }, /*  Processing.RNC_EN(0)*/
+	{ CCI_REG8(0x205b), 0x64 }, /*  Processing.RNC_DARK_TARGET(0)*/
+	{ CCI_REG8(0x205c), 0x0 }, /*  Processing.RNC_DARK_TARGET(1)*/
+	{ CCI_REG8(0x24dc), 0x12 }, /*  Defect Pixel Correction.DC_ENABLE(0)*/
+	{ CCI_REG8(0x24dc), 0x10 }, /*  Defect Pixel Correction.DC_MODE(0)*/
+	{ CCI_REG8(0x24dc),	0x0 }, /*  Defect Pixel Correction.DC_REPLACEMENT_VALUE(0)*/
+	{ CCI_REG8(0x24dd), 0x0 }, /*  Defect Pixel Correction.DC_LIMIT_LOW(0)*/
+	{ CCI_REG8(0x24de), 0x0 }, /*  Defect Pixel Correction.DC_LIMIT_HIGH(0)*/
+	{ CCI_REG8(0x24df),	0x0 }, /*  Defect Pixel Correction.DC_LIMIT_HIGH_MODE(0)*/
+	/* Illumination */
+	{ CCI_REG8(0x10d7), 0x1 }, /*  Illumination Trigger.ILLUM_EN(0)*/
+	{ CCI_REG8(0x10d8), 0x2 }, /*  Illumination Trigger.ILLUM_POL(0)*/
+	/* Histogram */
+	{ CCI_REG8(0x205d), 0x0 }, /*  Histogram.HIST_EN(0)*/
+	{ CCI_REG8(0x205e), 0x0 }, /*  Histogram.HIST_USAGE_RATIO(0)*/
+	{ CCI_REG8(0x2063), 0x0 }, /*  Histogram.PIXEL_DATA_SUPP(0)*/
+	{ CCI_REG8(0x2063), 0x0 }, /*  Histogram.PIXEL_TRANSMISSION(0)*/
+	/* TP */
+	{ CCI_REG8(0x2091), 0x0 }, /*  Test Pattern Generator.TPG_EN(0)*/
+	{ CCI_REG8(0x2091), 0x0 }, /*  Test Pattern Generator.TPG_CONFIG(0)*/
+};
+
+static const char *const mira220_test_pattern_menu[] = {
+	"Disabled",
+	"Vertial Gradient",
+};
+
+static const int mira220_test_pattern_val[] = {
+	MIRA220_TEST_PATTERN_DISABLE,
+	MIRA220_TEST_PATTERN_VERTICAL_GRADIENT,
+};
+
+/* regulator supplies */
+static const char *const mira220_supply_name[] = {
+	/* Supplies can be enabled in any order */
+	"vana", /* Analog (2.8V) supply */
+	"vdig", /* Digital Core (1.8V) supply */
+	"vddl", /* IF (1.2V) supply */
+};
+
+#define MIRA220_NUM_SUPPLIES ARRAY_SIZE(mira220_supply_name)
+
+/* Mira220 comes in monochrome and RGB variants. This driver implements the RGB variant.*/
+/*
+ * The supported formats.
+ * This table MUST contain 4 entries per format, to cover the various flip
+ * combinations in the order
+ * - no flip
+ * - h flip
+ * - v flip
+ * - h&v flips
+ */
+static const u32 mira220_mbus_formats[] = {
+	MEDIA_BUS_FMT_SRGGB12_1X12,
+	MEDIA_BUS_FMT_SGRBG12_1X12,
+	MEDIA_BUS_FMT_SGBRG12_1X12,
+	MEDIA_BUS_FMT_SBGGR12_1X12,
+
+	MEDIA_BUS_FMT_SRGGB10_1X10,
+	MEDIA_BUS_FMT_SGRBG10_1X10,
+	MEDIA_BUS_FMT_SGBRG10_1X10,
+	MEDIA_BUS_FMT_SBGGR10_1X10,
+
+	MEDIA_BUS_FMT_SRGGB8_1X8,
+	MEDIA_BUS_FMT_SGRBG8_1X8,
+	MEDIA_BUS_FMT_SGBRG8_1X8,
+	MEDIA_BUS_FMT_SBGGR8_1X8,
+
+};
+
+static const s64 link_frequencies[] = {
+	750 * HZ_PER_MHZ, /* 1500 Mbps lane data rate */
+	/* Many more are supported in the datasheet and can be added later */
+};
+
+/* Mode configs */
+static const struct mira220_mode supported_modes[] = {
+	/* 2 MPx 30fps 12bpp mode */
+	{
+		.width = 1600,
+		.height = 1400,
+		.crop = {
+			.left = MIRA220_PIXEL_ARRAY_LEFT,
+			.top = MIRA220_PIXEL_ARRAY_TOP,
+			.width = 1600,
+			.height = 1400
+		},
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(full_1600_1400_1500_12b_2lanes_reg_new),
+			.regs = full_1600_1400_1500_12b_2lanes_reg_new,
+		},
+		/* vblank is ceil(MIRA220_GLOB_NUM_CLK_CYCLES / ROW_LENGTH)  + 11*/
+		/* ROW_LENGTH is configured by register 0x102b, 0x102c.*/
+		.row_length = 304,
+		.pixel_rate = MIRA220_PIXEL_RATE,
+		.min_vblank = 20,
+		.max_vblank = 50000,
+		.hblank = MIRA220_HBLANK_1600x1400_304,
+	},
+};
+
+struct mira220 {
+	struct v4l2_subdev sd;
+	struct media_pad pad;
+
+	struct v4l2_mbus_framefmt fmt;
+
+	struct clk *xclk; /* system clock to MIRA220 */
+	u32 xclk_freq;
+
+	struct regulator_bulk_data supplies[MIRA220_NUM_SUPPLIES];
+
+	struct v4l2_ctrl_handler ctrl_handler;
+	struct v4l2_ctrl *pixel_rate;
+	struct v4l2_ctrl *vflip;
+	struct v4l2_ctrl *hflip;
+	struct v4l2_ctrl *vblank;
+	struct v4l2_ctrl *hblank;
+	struct v4l2_ctrl *exposure;
+	struct v4l2_ctrl *gain;
+
+	unsigned long link_freq_bitmap;
+
+	/* Current mode */
+	const struct mira220_mode *mode;
+
+	struct mutex mutex; /*comment*/
+	/* mutex ensures correct initialization */
+
+	struct regmap *regmap;
+};
+
+static inline struct mira220 *to_mira220(struct v4l2_subdev *_sd)
+{
+	return container_of(_sd, struct mira220, sd);
+}
+
+/* Power/clock management functions */
+static int mira220_power_on(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct mira220 *mira220 = to_mira220(sd);
+	int ret = -EINVAL;
+
+	ret = regulator_bulk_enable(MIRA220_NUM_SUPPLIES, mira220->supplies);
+	if (ret) {
+		dev_err(&client->dev, "%s: failed to enable regulators\n",
+			__func__);
+		goto reg_off;
+	}
+	ret = clk_prepare_enable(mira220->xclk);
+	if (ret) {
+		dev_err(&client->dev, "%s: failed to enable clock\n", __func__);
+		goto clk_off;
+	}
+	fsleep(MIRA220_XCLR_MIN_DELAY_US);
+
+	return 0;
+
+clk_off:
+	clk_disable_unprepare(mira220->xclk);
+reg_off:
+	ret = regulator_bulk_disable(MIRA220_NUM_SUPPLIES, mira220->supplies);
+	return ret;
+}
+
+static int mira220_power_off(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct mira220 *mira220 = to_mira220(sd);
+	(void)mira220;
+
+	clk_disable_unprepare(mira220->xclk);
+	regulator_bulk_disable(MIRA220_NUM_SUPPLIES, mira220->supplies);
+
+	return 0;
+}
+
+static int mira220_write_start_streaming_regs(struct mira220 *mira220)
+{
+	struct i2c_client *const client = v4l2_get_subdevdata(&mira220->sd);
+	int ret = 0;
+
+	/* Setting master control*/
+	ret = cci_write(mira220->regmap, MIRA220_IMAGER_STATE_REG,
+			MIRA220_IMAGER_STATE_MASTER_CONTROL, NULL);
+	if (ret) {
+		dev_err(&client->dev, "Error setting master control");
+		return ret;
+	}
+
+	/* Enable continuous streaming*/
+	ret = cci_write(mira220->regmap, MIRA220_IMAGER_RUN_CONT_REG,
+			MIRA220_IMAGER_RUN_CONT_ENABLE, NULL);
+	if (ret) {
+		dev_err(&client->dev, "Error enabling continuous streaming");
+		return ret;
+	}
+
+	ret = cci_write(mira220->regmap, MIRA220_IMAGER_RUN_REG,
+			MIRA220_IMAGER_RUN_START, NULL);
+	if (ret) {
+		dev_err(&client->dev, "Error setting internal trigger");
+		return ret;
+	}
+
+	return ret;
+}
+
+static int mira220_write_stop_streaming_regs(struct mira220 *mira220)
+{
+	struct i2c_client *const client = v4l2_get_subdevdata(&mira220->sd);
+	int ret = 0;
+
+	ret = cci_write(mira220->regmap, MIRA220_IMAGER_STATE_REG,
+			MIRA220_IMAGER_STATE_STOP_AT_ROW, NULL);
+
+	if (ret) {
+		dev_err(&client->dev,
+			"Error setting stop-at-row imager state.");
+		return ret;
+	}
+
+	ret = cci_write(mira220->regmap, MIRA220_IMAGER_RUN_REG,
+			MIRA220_IMAGER_RUN_STOP, NULL);
+	if (ret) {
+		dev_err(&client->dev, "Error setting run reg to stop");
+		return ret;
+	}
+
+	return ret;
+}
+
+/* Returns the maximum exposure time in row_length (reg value).*/
+/* Calculation is baded on Mira220 datasheet Section 9.2.*/
+static u32 mira220_calc_exp_max(u32 height, u32 vblank, u32 row_length)
+{
+	return (height + vblank) -
+	       (int)(MIRA220_GLOB_NUM_CLK_CYCLES / row_length);
+}
+
+static int mira220_write_exposure_reg(struct mira220 *mira220, u32 exposure)
+{
+	struct i2c_client *const client = v4l2_get_subdevdata(&mira220->sd);
+	const u32 max_exposure = mira220_calc_exp_max(mira220->mode->height,
+		mira220->vblank->val,
+		mira220->mode->row_length);
+	u32 ret = 0;
+
+	u32 capped_exposure = exposure;
+
+	if (exposure > max_exposure)
+		capped_exposure = max_exposure;
+
+	ret = cci_write(mira220->regmap, MIRA220_EXP_TIME_REG, capped_exposure,
+			NULL);
+
+	if (ret) {
+		dev_err_ratelimited(&client->dev,
+				    "Error setting exposure time to %d",
+				    capped_exposure);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+/* Get bayer order based on flip setting. */
+static u32 mira220_get_format_code(struct mira220 *mira220, u32 code)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(mira220_mbus_formats); i++)
+		if (mira220_mbus_formats[i] == code)
+			break;
+
+	if (i >= ARRAY_SIZE(mira220_mbus_formats))
+		i = 0;
+
+	i = (i & ~3) | (mira220->vflip->val ? 2 : 0) |
+	    (mira220->hflip->val ? 0 : 1);
+
+	return mira220_mbus_formats[i];
+}
+
+static int mira220_set_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct mira220 *mira220 =
+		container_of(ctrl->handler, struct mira220, ctrl_handler);
+	struct i2c_client *client = v4l2_get_subdevdata(&mira220->sd);
+	int ret = 0;
+
+	if (ctrl->id == V4L2_CID_VBLANK) {
+		int exposure_max, exposure_def;
+
+		/* Update max exposure while meeting expected vblanking */
+		exposure_max = mira220_calc_exp_max(mira220->mode->height,
+						    ctrl->val,
+						    mira220->mode->row_length);
+		exposure_def = (exposure_max < MIRA220_DEFAULT_EXPOSURE) ?
+				       exposure_max :
+				       MIRA220_DEFAULT_EXPOSURE;
+		__v4l2_ctrl_modify_range(mira220->exposure,
+					 mira220->exposure->minimum,
+					 exposure_max, mira220->exposure->step,
+					 exposure_def);
+	}
+
+	/*
+	 * Applying V4L2 control value only happens
+	 * when power is up for streaming
+	 */
+	if (pm_runtime_get_if_in_use(&client->dev) == 0) {
+		dev_info(&client->dev,
+			 "device in use, ctrl(id:0x%x,val:0x%x) is not handled\n",
+			ctrl->id, ctrl->val);
+		return 0;
+	}
+
+	switch (ctrl->id) {
+	case V4L2_CID_ANALOGUE_GAIN:
+		break;
+	case V4L2_CID_EXPOSURE:
+		ret = mira220_write_exposure_reg(mira220, ctrl->val);
+		break;
+	case V4L2_CID_TEST_PATTERN:
+		ret = cci_write(mira220->regmap, MIRA220_REG_TEST_PATTERN,
+				mira220_test_pattern_val[ctrl->val], NULL);
+		break;
+	case V4L2_CID_HFLIP:
+		ret = cci_write(mira220->regmap, MIRA220_HFLIP_REG,
+				mira220->hflip->val, NULL);
+		break;
+
+	case V4L2_CID_VFLIP:
+		ret = cci_write(mira220->regmap, MIRA220_VFLIP_REG, mira220->vflip->val,
+				NULL);
+		break;
+	case V4L2_CID_VBLANK:
+		ret = cci_write(mira220->regmap, MIRA220_VBLANK_REG, ctrl->val,
+				NULL);
+
+		break;
+	case V4L2_CID_HBLANK:
+		break;
+	default:
+		dev_info(&client->dev,
+			 "ctrl(id:0x%x,val:0x%x) is not handled\n", ctrl->id,
+			 ctrl->val);
+		ret = -EINVAL;
+		break;
+	}
+
+	pm_runtime_put(&client->dev);
+
+	return ret;
+}
+
+static const struct v4l2_ctrl_ops mira220_ctrl_ops = {
+	.s_ctrl = mira220_set_ctrl,
+};
+
+static void mira220_update_pad_format(struct mira220 *mira220,
+				      const struct mira220_mode *mode,
+				      struct v4l2_mbus_framefmt *fmt, u32 code)
+{
+	/* Bayer order varies with flips */
+	fmt->code = mira220_get_format_code(mira220, code);
+	fmt->width = mode->width;
+	fmt->height = mode->height;
+	fmt->field = V4L2_FIELD_NONE;
+	fmt->colorspace = V4L2_COLORSPACE_RAW;
+	fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
+	fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
+	fmt->xfer_func = V4L2_XFER_FUNC_NONE;
+}
+
+static int mira220_set_pad_format(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state,
+				  struct v4l2_subdev_format *fmt)
+{
+	struct mira220 *mira220 = to_mira220(sd);
+	const struct mira220_mode *mode;
+	struct v4l2_mbus_framefmt *format;
+
+	u32 max_exposure = 0, default_exp = 0;
+
+	/* Validate format or use default */
+
+	mode = v4l2_find_nearest_size(supported_modes,
+				      ARRAY_SIZE(supported_modes), width,
+				      height, fmt->format.width,
+				      fmt->format.height);
+
+	mira220_update_pad_format(mira220, mode, &fmt->format, fmt->format.code);
+
+	format = v4l2_subdev_state_get_format(state, 0);
+	*format = fmt->format;
+
+	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
+		/* mira220->fmt = fmt->format;*/
+		/* mira220->mode = mode;*/
+
+		/* Update controls based on new mode (range and current value).*/
+		max_exposure = mira220_calc_exp_max(mira220->mode->height,
+						    mira220->mode->min_vblank,
+						    mira220->mode->row_length);
+		default_exp = (max_exposure < MIRA220_DEFAULT_EXPOSURE) ?
+				      max_exposure :
+				      MIRA220_DEFAULT_EXPOSURE;
+		__v4l2_ctrl_modify_range(mira220->exposure,
+					 MIRA220_EXPOSURE_MIN, max_exposure, 1,
+					 default_exp);
+
+		/* Update pixel rate based on new mode.*/
+		__v4l2_ctrl_modify_range(mira220->pixel_rate,
+					 mira220->mode->pixel_rate,
+					 mira220->mode->pixel_rate, 1,
+					 mira220->mode->pixel_rate);
+
+		/* Update hblank based on new mode.*/
+		__v4l2_ctrl_modify_range(mira220->hblank, mira220->mode->hblank,
+					 mira220->mode->hblank, 1,
+					 mira220->mode->hblank);
+
+		__v4l2_ctrl_modify_range(mira220->vblank,
+					 mira220->mode->min_vblank,
+					 mira220->mode->max_vblank, 1,
+					 mira220->mode->min_vblank);
+
+		__v4l2_ctrl_s_ctrl(mira220->vblank, mira220->mode->min_vblank);
+	}
+
+	return 0;
+}
+
+/*
+ * This function should enumerate all the media bus formats for the requested pads.
+ * If the requested
+ * format index is beyond the number of avaialble formats it shall return -EINVAL;
+ */
+static int mira220_enum_mbus_code(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state,
+				  struct v4l2_subdev_mbus_code_enum *code)
+{
+	struct mira220 *mira220 = to_mira220(sd);
+
+	if (code->index >= (ARRAY_SIZE(mira220_mbus_formats) / 4))
+		return -EINVAL;
+
+	code->code = mira220_get_format_code(mira220,
+					     mira220_mbus_formats[code->index * 4]);
+
+	return 0;
+}
+
+static int mira220_enum_frame_size(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state,
+				   struct v4l2_subdev_frame_size_enum *fse)
+{
+	struct mira220 *mira220 = to_mira220(sd);
+	u32 code;
+
+	if (fse->index >= ARRAY_SIZE(supported_modes))
+		return -EINVAL;
+
+	code = mira220_get_format_code(mira220, fse->code);
+	if (fse->code != code)
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
+static int mira220_init_state(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *state)
+{
+	struct v4l2_subdev_format fmt = {
+		.which = V4L2_SUBDEV_FORMAT_TRY,
+		.pad = 0,
+		.format = {
+			.code = MEDIA_BUS_FMT_SGRBG12_1X12,
+			.width = supported_modes[0].width,
+			.height = supported_modes[0].height,
+		},
+	};
+
+	mira220_set_pad_format(sd, state, &fmt);
+
+	return 0;
+}
+
+static int mira220_set_framefmt(struct mira220 *mira220,
+				struct v4l2_subdev_state *state)
+{
+	const struct v4l2_mbus_framefmt *format;
+	int ret = 0;
+
+	format = v4l2_subdev_state_get_format(state, 0);
+	switch (format->code) {
+	case MEDIA_BUS_FMT_Y8_1X8:
+	case MEDIA_BUS_FMT_SRGGB8_1X8:
+	case MEDIA_BUS_FMT_SGRBG8_1X8:
+	case MEDIA_BUS_FMT_SGBRG8_1X8:
+	case MEDIA_BUS_FMT_SBGGR8_1X8:
+		cci_write(mira220->regmap, MIRA220_BIT_DEPTH_REG,
+			  MIRA220_BIT_DEPTH_8_BIT, NULL);
+		cci_write(mira220->regmap, MIRA220_CSI_DATA_TYPE_REG,
+			  MIRA220_CSI_DATA_TYPE_8_BIT, NULL);
+		break;
+	case MEDIA_BUS_FMT_Y10_1X10:
+	case MEDIA_BUS_FMT_SRGGB10_1X10:
+	case MEDIA_BUS_FMT_SGRBG10_1X10:
+	case MEDIA_BUS_FMT_SGBRG10_1X10:
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
+		cci_write(mira220->regmap, MIRA220_BIT_DEPTH_REG,
+			  MIRA220_BIT_DEPTH_10_BIT, NULL);
+		cci_write(mira220->regmap, MIRA220_CSI_DATA_TYPE_REG,
+			  MIRA220_CSI_DATA_TYPE_10_BIT, NULL);
+
+		break;
+	case MEDIA_BUS_FMT_Y12_1X12:
+	case MEDIA_BUS_FMT_SGRBG12_1X12:
+	case MEDIA_BUS_FMT_SGBRG12_1X12:
+	case MEDIA_BUS_FMT_SBGGR12_1X12:
+	case MEDIA_BUS_FMT_SRGGB12_1X12:
+		cci_write(mira220->regmap, MIRA220_BIT_DEPTH_REG,
+			  MIRA220_BIT_DEPTH_12_BIT, NULL);
+		cci_write(mira220->regmap, MIRA220_CSI_DATA_TYPE_REG,
+			  MIRA220_CSI_DATA_TYPE_12_BIT, NULL);
+
+		break;
+	default:
+			ret = -EINVAL;
+			break;
+	}
+
+	return ret;
+}
+
+static int mira220_get_selection(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state,
+				 struct v4l2_subdev_selection *sel)
+{
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP: {
+		sel->r = *v4l2_subdev_state_get_crop(state, 0);
+		return 0;
+	}
+
+	case V4L2_SEL_TGT_NATIVE_SIZE:
+		sel->r.top = 0;
+		sel->r.left = 0;
+		sel->r.width = MIRA220_NATIVE_WIDTH;
+		sel->r.height = MIRA220_NATIVE_HEIGHT;
+		return 0;
+
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		sel->r.top = MIRA220_PIXEL_ARRAY_TOP;
+		sel->r.left = MIRA220_PIXEL_ARRAY_LEFT;
+		sel->r.width = MIRA220_PIXEL_ARRAY_WIDTH;
+		sel->r.height = MIRA220_PIXEL_ARRAY_HEIGHT;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static int mira220_start_streaming(struct mira220 *mira220,
+				   struct v4l2_subdev_state *state)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&mira220->sd);
+	const struct mira220_reg_list *reg_list;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(&client->dev);
+	if (ret < 0) {
+		pm_runtime_put_noidle(&client->dev);
+		return ret;
+	}
+
+	/* Apply default values of current mode */
+	/* Stop streaming before uploading register sequence */
+	ret = mira220_write_stop_streaming_regs(mira220);
+	if (ret) {
+		dev_err(&client->dev, "Could not write stream-on sequence");
+		goto err_rpm_put;
+	}
+
+	reg_list = &mira220->mode->reg_list;
+	ret = cci_multi_reg_write(mira220->regmap, reg_list->regs,
+				  reg_list->num_of_regs, NULL);
+	if (ret) {
+		dev_err(&client->dev, "%s failed to set mode\n", __func__);
+		goto err_rpm_put;
+	}
+
+	ret = mira220_set_framefmt(mira220, state);
+	if (ret) {
+		dev_err(&client->dev, "%s failed to set frame format: %d\n",
+			__func__, ret);
+		goto err_rpm_put;
+	}
+
+	/* Apply customized values from user */
+	ret = __v4l2_ctrl_handler_setup(mira220->sd.ctrl_handler);
+	if (ret)
+		goto err_rpm_put;
+
+	ret = mira220_write_start_streaming_regs(mira220);
+	if (ret) {
+		dev_err(&client->dev, "Could not write stream-on sequence");
+		goto err_rpm_put;
+	}
+	/* vflip and hflip cannot change during streaming */
+	__v4l2_ctrl_grab(mira220->hflip, true);
+	__v4l2_ctrl_grab(mira220->vflip, true);
+
+	return 0;
+
+err_rpm_put:
+	pm_runtime_put(&client->dev);
+	return ret;
+}
+
+static void mira220_stop_streaming(struct mira220 *mira220)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&mira220->sd);
+	int ret = 0;
+
+	ret = mira220_write_stop_streaming_regs(mira220);
+	if (ret) {
+		dev_err(&client->dev,
+			"Could not write the stream-off sequence");
+	}
+	__v4l2_ctrl_grab(mira220->hflip, false);
+	__v4l2_ctrl_grab(mira220->vflip, false);
+	pm_runtime_put(&client->dev);
+}
+
+static int mira220_set_stream(struct v4l2_subdev *sd, int enable)
+{
+	struct mira220 *mira220 = to_mira220(sd);
+	struct v4l2_subdev_state *state;
+	int ret = 0;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+
+	if (enable)
+		ret = mira220_start_streaming(mira220, state);
+	else
+		mira220_stop_streaming(mira220);
+
+	v4l2_subdev_unlock_state(state);
+	return ret;
+}
+
+static int mira220_get_regulators(struct mira220 *mira220)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&mira220->sd);
+	unsigned int i;
+
+	for (i = 0; i < MIRA220_NUM_SUPPLIES; i++)
+		mira220->supplies[i].supply = mira220_supply_name[i];
+
+	return devm_regulator_bulk_get(&client->dev, MIRA220_NUM_SUPPLIES,
+				       mira220->supplies);
+}
+
+/* OTP power on */
+static void mira220_otp_power_on(struct mira220 *mira220)
+{
+	cci_write(mira220->regmap, MIRA220_OTP_CMD_REG, MIRA220_OTP_CMD_UP,
+		  NULL);
+}
+
+/* OTP power off */
+static void mira220_otp_power_off(struct mira220 *mira220)
+{
+	cci_write(mira220->regmap, MIRA220_OTP_CMD_REG, MIRA220_OTP_CMD_DOWN,
+		  NULL);
+}
+
+/* OTP power on */
+static int mira220_otp_read(struct mira220 *mira220, u8 addr, u8 offset,
+			    u8 *val)
+{
+	int ret;
+	u64 readback;
+
+	ret = cci_write(mira220->regmap, CCI_REG8(0x0086), addr, NULL);
+	if (ret)
+		return ret;
+	ret = cci_write(mira220->regmap, CCI_REG8(0x0080), 0x02, NULL);
+	if (ret)
+		return ret;
+	ret = cci_read(mira220->regmap, CCI_REG8(0x0082 + offset), &readback,
+		       NULL);
+	*val = readback & 0xff;
+
+	return ret;
+}
+
+/* Verify chip ID */
+static int mira220_identify_module(struct mira220 *mira220)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&mira220->sd);
+	int ret;
+	u8 val;
+
+	mira220_otp_power_on(mira220);
+
+	fsleep(100);
+
+	ret = mira220_otp_read(mira220, 0x0d, 0, &val);
+	dev_info(&client->dev, "Read OTP add 0x0d with val %x\n", val);
+	ret = mira220_otp_read(mira220, 0x19, 0, &val);
+	dev_info(&client->dev, "Read OTP add 0x19 with val %x\n", val);
+	ret = mira220_otp_read(mira220, 0x19, 1, &val);
+	dev_info(&client->dev, "Read OTP add 0x19+1 with val %x\n", val);
+
+	mira220_otp_power_off(mira220);
+
+	return ret;
+}
+
+static const struct v4l2_subdev_core_ops mira220_core_ops = {
+	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
+	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
+};
+
+static const struct v4l2_subdev_video_ops mira220_video_ops = {
+	.s_stream = mira220_set_stream,
+};
+
+static const struct v4l2_subdev_pad_ops mira220_pad_ops = {
+	.enum_mbus_code = mira220_enum_mbus_code,
+	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = mira220_set_pad_format,
+	.get_selection = mira220_get_selection,
+	.enum_frame_size = mira220_enum_frame_size,
+};
+
+static const struct v4l2_subdev_ops mira220_subdev_ops = {
+	.core = &mira220_core_ops,
+	.video = &mira220_video_ops,
+	.pad = &mira220_pad_ops,
+};
+
+static const struct v4l2_subdev_internal_ops mira220_internal_ops = {
+	.init_state = mira220_init_state,
+};
+
+/* Initialize control handlers */
+static int mira220_init_controls(struct mira220 *mira220)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&mira220->sd);
+	struct v4l2_ctrl_handler *ctrl_hdlr;
+	struct v4l2_fwnode_device_properties props;
+	struct v4l2_ctrl *link_freq;
+	int ret;
+
+	u32 max_exposure = 0;
+
+	ctrl_hdlr = &mira220->ctrl_handler;
+	/* v4l2_ctrl_handler_init gives a hint/guess of the number of v4l2_ctrl_new */
+	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 9);
+	if (ret)
+		return ret;
+
+	mutex_init(&mira220->mutex);
+	ctrl_hdlr->lock = &mira220->mutex;
+	/* By default, PIXEL_RATE is read only */
+	mira220->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &mira220_ctrl_ops,
+						V4L2_CID_PIXEL_RATE,
+						mira220->mode->pixel_rate,
+						mira220->mode->pixel_rate, 1,
+						mira220->mode->pixel_rate);
+
+	link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &mira220_ctrl_ops,
+					   V4L2_CID_LINK_FREQ,
+					   __fls(mira220->link_freq_bitmap),
+					   __ffs(mira220->link_freq_bitmap),
+					   link_frequencies);
+	if (link_freq)
+		link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	mira220->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &mira220_ctrl_ops,
+					    V4L2_CID_VBLANK,
+					    mira220->mode->min_vblank,
+					    mira220->mode->max_vblank, 1,
+					    mira220->mode->min_vblank);
+
+	mira220->hblank =
+		v4l2_ctrl_new_std(ctrl_hdlr, &mira220_ctrl_ops, V4L2_CID_HBLANK,
+				  mira220->mode->hblank, mira220->mode->hblank,
+				  1, mira220->mode->hblank);
+
+	/* Exposure is indicated in number of lines here*/
+	/* Max is determined by vblank + vsize and Tglob.*/
+	max_exposure = mira220_calc_exp_max(mira220->mode->height,
+					    mira220->vblank->val,
+					    mira220->mode->row_length);
+
+	mira220->exposure =	v4l2_ctrl_new_std(ctrl_hdlr, &mira220_ctrl_ops,
+						  V4L2_CID_EXPOSURE, MIRA220_EXPOSURE_MIN,
+						  max_exposure, 1, MIRA220_DEFAULT_EXPOSURE);
+
+	mira220->gain = v4l2_ctrl_new_std(ctrl_hdlr, &mira220_ctrl_ops,
+					  V4L2_CID_ANALOGUE_GAIN,
+					  MIRA220_ANALOG_GAIN_MIN,
+					  MIRA220_ANALOG_GAIN_MAX,
+					  MIRA220_ANALOG_GAIN_STEP,
+					  MIRA220_ANALOG_GAIN_DEFAULT);
+
+	mira220->hflip = v4l2_ctrl_new_std(ctrl_hdlr, &mira220_ctrl_ops,
+					   V4L2_CID_HFLIP, 0, 1, 1, 0);
+	if (mira220->hflip)
+		mira220->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
+
+	mira220->vflip = v4l2_ctrl_new_std(ctrl_hdlr, &mira220_ctrl_ops,
+					   V4L2_CID_VFLIP, 0, 1, 1, 0);
+	if (mira220->vflip)
+		mira220->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
+
+	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &mira220_ctrl_ops,
+				     V4L2_CID_TEST_PATTERN,
+				     ARRAY_SIZE(mira220_test_pattern_menu) - 1,
+				     0, 0, mira220_test_pattern_menu);
+
+	if (ctrl_hdlr->error) {
+		ret = ctrl_hdlr->error;
+		dev_err(&client->dev, "%s control init failed (%d)\n", __func__,
+			ret);
+		goto error;
+	}
+
+	ret = v4l2_fwnode_device_parse(&client->dev, &props);
+	if (ret)
+		goto error;
+
+	ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &mira220_ctrl_ops,
+					      &props);
+	if (ret)
+		goto error;
+
+	mira220->sd.ctrl_handler = ctrl_hdlr;
+
+	return 0;
+
+error:
+	v4l2_ctrl_handler_free(ctrl_hdlr);
+	mutex_destroy(&mira220->mutex);
+
+	return ret;
+}
+
+static void mira220_free_controls(struct mira220 *mira220)
+{
+	v4l2_ctrl_handler_free(mira220->sd.ctrl_handler);
+	mutex_destroy(&mira220->mutex);
+}
+
+static int mira220_parse_endpoint(struct mira220 *mira220)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&mira220->sd);
+	struct fwnode_handle *fwnode;
+	struct v4l2_fwnode_endpoint bus_cfg = { .bus_type =
+							V4L2_MBUS_CSI2_DPHY };
+	struct fwnode_handle *ep;
+	int ret;
+
+	fwnode = dev_fwnode(&client->dev);
+	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
+	if (!ep) {
+		dev_err(&client->dev, "Failed to get next endpoint\n");
+		return -ENXIO;
+	}
+
+	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
+	fwnode_handle_put(ep);
+	if (ret)
+		return ret;
+
+	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 2) {
+		dev_err(&client->dev,
+			"number of CSI2 data lanes %d is not supported\n",
+			bus_cfg.bus.mipi_csi2.num_data_lanes);
+		ret = -EINVAL;
+		goto done_endpoint_free;
+	}
+
+	ret = v4l2_link_freq_to_bitmap(&client->dev, bus_cfg.link_frequencies,
+				       bus_cfg.nr_of_link_frequencies,
+				       link_frequencies,
+				       ARRAY_SIZE(link_frequencies),
+				       &mira220->link_freq_bitmap);
+done_endpoint_free:
+	v4l2_fwnode_endpoint_free(&bus_cfg);
+	return ret;
+}
+
+static int mira220_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct mira220 *mira220;
+	int ret;
+
+	mira220 = devm_kzalloc(&client->dev, sizeof(*mira220), GFP_KERNEL);
+	if (!mira220)
+		return -ENOMEM;
+
+	v4l2_i2c_subdev_init(&mira220->sd, client, &mira220_subdev_ops);
+	mira220->sd.internal_ops = &mira220_internal_ops;
+
+	mira220->regmap = devm_cci_regmap_init_i2c(client, 16);
+	if (IS_ERR(mira220->regmap))
+		return dev_err_probe(dev, PTR_ERR(mira220->regmap),
+				     "failed to initialize CCI\n");
+	/* Get system clock (xclk) */
+	mira220->xclk = devm_clk_get(dev, NULL);
+	if (IS_ERR(mira220->xclk)) {
+		dev_err(dev, "failed to get xclk\n");
+		return PTR_ERR(mira220->xclk);
+	}
+	mira220->xclk_freq = clk_get_rate(mira220->xclk);
+	if (mira220->xclk_freq != MIRA220_SUPPORTED_XCLK_FREQ) {
+		dev_err(dev, "xclk frequency not supported: %d Hz\n",
+			mira220->xclk_freq);
+		return -EINVAL;
+	}
+
+	ret = mira220_get_regulators(mira220);
+	if (ret) {
+		dev_err(dev, "failed to get regulators\n");
+		return ret;
+	}
+
+	ret = mira220_parse_endpoint(mira220);
+	if (ret) {
+		dev_err(dev, "failed to parse endpoint configuration\n");
+		return ret;
+	}
+	/*
+	 *The sensor must be powered for mira220_identify_module()
+	 * to be able to read the CHIP_ID register
+	 */
+	ret = mira220_power_on(dev);
+	if (ret)
+		return ret;
+	ret = mira220_identify_module(mira220);
+	if (ret)
+		goto error_power_off;
+	/* Set default mode to max resolution */
+	mira220->mode = &supported_modes[0];
+
+	ret = mira220_init_controls(mira220);
+	if (ret)
+		goto error_power_off;
+
+	/* Initialize subdev */
+	mira220->sd.internal_ops = &mira220_internal_ops;
+	mira220->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
+		V4L2_SUBDEV_FL_HAS_EVENTS;
+	mira220->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
+
+	/* Initialize source pads */
+	mira220->pad.flags = MEDIA_PAD_FL_SOURCE;
+
+	ret = media_entity_pads_init(&mira220->sd.entity, 1, &mira220->pad);
+	if (ret) {
+		dev_err_probe(dev, ret, "failed to init entity pads\n");
+		goto error_handler_free;
+	}
+
+	mira220->sd.state_lock = mira220->ctrl_handler.lock;
+	ret = v4l2_subdev_init_finalize(&mira220->sd);
+	if (ret < 0) {
+		dev_err_probe(dev, ret, "subdev init error\n");
+		goto error_media_entity;
+	}
+
+	ret = v4l2_async_register_subdev_sensor(&mira220->sd);
+	if (ret < 0) {
+		dev_err_probe(dev, ret,
+			      "failed to register sensor sub-device\n");
+		goto error_subdev_cleanup;
+	}
+
+	/* Enable runtime PM and turn off the device */
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+	pm_runtime_idle(dev);
+
+	return 0;
+
+error_subdev_cleanup:
+	v4l2_subdev_cleanup(&mira220->sd);
+
+error_media_entity:
+	media_entity_cleanup(&mira220->sd.entity);
+
+error_handler_free:
+	mira220_free_controls(mira220);
+
+error_power_off:
+	mira220_power_off(dev);
+
+	return ret;
+}
+
+static void mira220_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct mira220 *mira220 = to_mira220(sd);
+
+	v4l2_async_unregister_subdev(sd);
+	media_entity_cleanup(&sd->entity);
+	mira220_free_controls(mira220);
+
+	pm_runtime_disable(&client->dev);
+	if (!pm_runtime_status_suspended(&client->dev))
+		mira220_power_off(&client->dev);
+	pm_runtime_set_suspended(&client->dev);
+}
+
+static const struct dev_pm_ops mira220_pm_ops = {
+		SET_RUNTIME_PM_OPS(mira220_power_off, mira220_power_on, NULL)
+};
+
+static const struct of_device_id mira220_dt_ids[] = {
+	{ .compatible = "ams,mira220" },
+	{ /* sentinel */ } };
+MODULE_DEVICE_TABLE(of, mira220_dt_ids);
+
+static struct i2c_driver mira220_i2c_driver = {
+	.driver = {
+		.name = "mira220",
+		.of_match_table	= mira220_dt_ids,
+		.pm = &mira220_pm_ops,
+	},
+	.probe = mira220_probe,
+	.remove = mira220_remove,
+};
+
+module_i2c_driver(mira220_i2c_driver);
+
+MODULE_AUTHOR("Philippe Baetens <philippebaetens@gmail.com>");
+MODULE_DESCRIPTION("ams MIRA220 sensor driver");
+MODULE_LICENSE("GPL");

-- 
2.43.0


