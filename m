Return-Path: <linux-media+bounces-29412-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4584EA7BFFD
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 16:55:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 95771174961
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 14:54:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EB701F417E;
	Fri,  4 Apr 2025 14:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="siEUYj9A"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081DB1F3BBD;
	Fri,  4 Apr 2025 14:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743778453; cv=none; b=oOQdexQImk5qcd/2fu//73sc3F5+K8OywP/jZgTCkXOpEl46y5jalQXtKTwz4vRDCFpLWYtZUBGo9gNNOcbq0gLg0hbs6r+HC9TzDhKQ5JTv+9z5uxts+kpHxn7sCFnvaDG+tmRaLhJNpaSxs3QA3uXBbrT46V+36rQ8FRCTPsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743778453; c=relaxed/simple;
	bh=X/uU4hGjJZ0eQEft1lZ92zPdBP9u1N1VvK/QC3wc9NE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=j/FO4AhtfTtZ5n7DdxAKFDOEHlPfC3wQjseFdjEV1Ax1/M6Ubc6+Yxk2R7cf09CJ0NHQ7FsyfH6k7yonsbvfIOCasNop6sftPFyBCDAQIrfj487MHcCS+t9F40JBrqKtKJvNXAx2dBKC4zhiu0QeuRAhZv7kdD349CUATNI9R+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=siEUYj9A; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 534C4r5f019847;
	Fri, 4 Apr 2025 16:53:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	k3lAnzeBxu1Ur6RlOF/D+shLYIiM7Vbp4jmoYXjSA2w=; b=siEUYj9AaFSzmivh
	BkTZSbK781k4Re54+k2vnlDOpDwy6lU17Xh2/H3GjfO2Rwi9zcwxZKo5g39aYGWR
	LO8slLFoowlmrS1jA8ucuhofsdB3ODe2P2S2TnlH6vUYvdpqeZUC+JFDp5UEQz3B
	aQMqfx3KGFZr9wbzHKxv3ZsFTrNVKf6g8e99DjKOww49x5P5p2wX/MYcxejtzS2w
	p0bliVyjuqwlRjnpv2ND3YRJAiz3kCWzR7V6S0Pbas4peRFb/vWOJ8UWB8XU80WV
	lRiQljL3ZsgstpiYL7HkuQxvq02uYxzx7+kX6fp5uyXTe8U+wsSYQsqN8y8MQntv
	NjO4Og==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45t2cqktnx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Apr 2025 16:53:54 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3CB5740087;
	Fri,  4 Apr 2025 16:52:49 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D107793CDA0;
	Fri,  4 Apr 2025 16:50:55 +0200 (CEST)
Received: from localhost (10.252.23.40) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Apr
 2025 16:50:55 +0200
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Date: Fri, 4 Apr 2025 16:50:52 +0200
Subject: [PATCH v5 2/2] media: i2c: Add driver for ST VD55G1 camera sensor
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250404-b4-vd55g1-v5-2-98f2f02eec59@foss.st.com>
References: <20250404-b4-vd55g1-v5-0-98f2f02eec59@foss.st.com>
In-Reply-To: <20250404-b4-vd55g1-v5-0-98f2f02eec59@foss.st.com>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Sylvain Petinot
	<sylvain.petinot@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus
	<sakari.ailus@linux.intel.com>
CC: <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_06,2025-04-03_03,2024-11-22_01

The VD55G1 is a monochrome global shutter camera with a 804x704 maximum
resolution with RAW8 and RAW10 bytes per pixel.
The driver supports :
- Auto exposure from the sensor, or manual exposure mode
- HDR subtraction mode, allowing edge detection and background removal
- Auto exposure cold start, using configuration values from last stream
to start the next one
- LED GPIOs for illumination
- Most standard camera sensor features (hblank, vblank, test patterns,
again, dgain, hflip, vflip, auto exposure bias, etc.)
Add driver source code to MAINTAINERS file.

Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
---
 MAINTAINERS                |    2 +
 drivers/media/i2c/Kconfig  |   11 +
 drivers/media/i2c/Makefile |    1 +
 drivers/media/i2c/vd55g1.c | 2005 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 2019 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4f5e9005063a157de69e81b10f8def9da9e6c04c..9991c5f63e3d49a4e7a6ef0071f3b81825e84eee 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22416,6 +22416,7 @@ M:	Sylvain Petinot <sylvain.petinot@foss.st.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml
+F:	drivers/media/i2c/vd55g1.c
 
 ST VGXY61 DRIVER
 M:	Benjamin Mugnier <benjamin.mugnier@foss.st.com>
@@ -24801,6 +24802,7 @@ F:	drivers/media/i2c/mt*
 F:	drivers/media/i2c/og*
 F:	drivers/media/i2c/ov*
 F:	drivers/media/i2c/s5*
+F:	drivers/media/i2c/vd55g1.c
 F:	drivers/media/i2c/vgxy61.c
 
 VF610 NAND DRIVER
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 8ba096b8ebca241239a327ab3af0d9bce3ee9962..6caacff021e6aad8f3508267c112322b1066dbc0 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -690,6 +690,17 @@ config VIDEO_S5K6A3
 	  This is a V4L2 sensor driver for Samsung S5K6A3 raw
 	  camera sensor.
 
+config VIDEO_VD55G1
+	tristate "ST VD55G1 sensor support"
+	select V4L2_CCI_I2C
+	depends on GPIOLIB
+	help
+	  This is a Video4Linux2 sensor driver for the ST VD55G1
+	  camera sensor.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called vd55g1.
+
 config VIDEO_VGXY61
 	tristate "ST VGXY61 sensor support"
 	select V4L2_CCI_I2C
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index fbb988bd067a1b8b577248811f18a15671eb8932..56405c0334aead46c9f5b12fefba24a52f733499 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -152,6 +152,7 @@ obj-$(CONFIG_VIDEO_TW9910) += tw9910.o
 obj-$(CONFIG_VIDEO_UDA1342) += uda1342.o
 obj-$(CONFIG_VIDEO_UPD64031A) += upd64031a.o
 obj-$(CONFIG_VIDEO_UPD64083) += upd64083.o
+obj-$(CONFIG_VIDEO_VD55G1) += vd55g1.o
 obj-$(CONFIG_VIDEO_VGXY61) += vgxy61.o
 obj-$(CONFIG_VIDEO_VP27SMPX) += vp27smpx.o
 obj-$(CONFIG_VIDEO_VPX3220) += vpx3220.o
diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
new file mode 100644
index 0000000000000000000000000000000000000000..0ec7b0948c9697789332f8856a92c3dab05a9eaf
--- /dev/null
+++ b/drivers/media/i2c/vd55g1.c
@@ -0,0 +1,2005 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for VD55G1 global shutter sensor family driver
+ *
+ * Copyright (C) 2025 STMicroelectronics SA
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <linux/unaligned.h>
+#include <linux/units.h>
+
+#include <media/mipi-csi2.h>
+#include <media/v4l2-async.h>
+#include <media/v4l2-cci.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-subdev.h>
+
+/* Register Map */
+#define VD55G1_REG_MODEL_ID				CCI_REG32_LE(0x0000)
+#define VD55G1_MODEL_ID					0x53354731
+#define VD55G1_REG_REVISION				CCI_REG16_LE(0x0004)
+#define VD55G1_REVISION_CCB				0x2020
+#define VD55G1_REG_FWPATCH_REVISION			CCI_REG16_LE(0x0012)
+#define VD55G1_REG_FWPATCH_START_ADDR			CCI_REG8(0x2000)
+#define VD55G1_REG_SYSTEM_FSM				CCI_REG8(0x001c)
+#define VD55G1_SYSTEM_FSM_READY_TO_BOOT			0x01
+#define VD55G1_SYSTEM_FSM_SW_STBY			0x02
+#define VD55G1_SYSTEM_FSM_STREAMING			0x03
+#define VD55G1_REG_BOOT					CCI_REG8(0x0200)
+#define VD55G1_BOOT_PATCH_SETUP				2
+#define VD55G1_REG_STBY					CCI_REG8(0x0201)
+#define VD55G1_STBY_START_STREAM			1
+#define VD55G1_REG_STREAMING				CCI_REG8(0x0202)
+#define VD55G1_STREAMING_STOP_STREAM			1
+#define VD55G1_REG_EXT_CLOCK				CCI_REG32_LE(0x0220)
+#define VD55G1_REG_LINE_LENGTH				CCI_REG16_LE(0x0300)
+#define VD55G1_REG_ORIENTATION				CCI_REG8(0x0302)
+#define VD55G1_REG_FORMAT_CTRL				CCI_REG8(0x030a)
+#define VD55G1_REG_OIF_CTRL				CCI_REG16_LE(0x030c)
+#define VD55G1_REG_ISL_ENABLE				CCI_REG16_LE(0x326)
+#define VD55G1_REG_OIF_IMG_CTRL				CCI_REG8(0x030f)
+#define VD55G1_REG_MIPI_DATA_RATE			CCI_REG32_LE(0x0224)
+#define VD55G1_REG_PATGEN_CTRL				CCI_REG16_LE(0x0304)
+#define VD55G1_PATGEN_TYPE_SHIFT			4
+#define VD55G1_PATGEN_ENABLE				BIT(0)
+#define VD55G1_REG_MANUAL_ANALOG_GAIN			CCI_REG8(0x0501)
+#define VD55G1_REG_MANUAL_COARSE_EXPOSURE		CCI_REG16_LE(0x0502)
+#define VD55G1_REG_MANUAL_DIGITAL_GAIN			CCI_REG16_LE(0x0504)
+#define VD55G1_REG_APPLIED_COARSE_EXPOSURE		CCI_REG16_LE(0x00e8)
+#define VD55G1_REG_APPLIED_ANALOG_GAIN			CCI_REG16_LE(0x00ea)
+#define VD55G1_REG_APPLIED_DIGITAL_GAIN			CCI_REG16_LE(0x00ec)
+#define VD55G1_REG_AE_FORCE_COLDSTART			CCI_REG16_LE(0x0308)
+#define VD55G1_REG_AE_COLDSTART_EXP_TIME		CCI_REG32_LE(0x0374)
+#define VD55G1_REG_READOUT_CTRL				CCI_REG8(0x052e)
+#define VD55G1_REG_DUSTER_CTRL				CCI_REG8(0x03ea)
+#define VD55G1_DUSTER_ENABLE				BIT(0)
+#define VD55G1_DUSTER_DISABLE				0
+#define VD55G1_DUSTER_DYN_ENABLE			BIT(1)
+#define VD55G1_DUSTER_RING_ENABLE			BIT(4)
+#define VD55G1_REG_AE_TARGET_PERCENTAGE			CCI_REG8(0x0486)
+#define VD55G1_REG_NEXT_CTX				CCI_REG16_LE(0x03e4)
+#define VD55G1_REG_EXPOSURE_USE_CASES			CCI_REG8(0x0312)
+#define VD55G1_EXPOSURE_USE_CASES_MULTI_CONTEXT		BIT(2)
+#define VD55G1_REG_EXPOSURE_MAX_COARSE			CCI_REG16_LE(0x0372)
+#define VD55G1_EXPOSURE_MAX_COARSE_DEF			0x7fff
+#define VD55G1_EXPOSURE_MAX_COARSE_SUB			446
+#define VD55G1_REG_CTX_REPEAT_COUNT_CTX0		CCI_REG16_LE(0x03dc)
+#define VD55G1_REG_CTX_REPEAT_COUNT_CTX1		CCI_REG16_LE(0x03de)
+
+#define VD55G1_REG_EXP_MODE(ctx) \
+	CCI_REG8(0x0500 + VD55G1_CTX_OFFSET * (ctx))
+#define VD55G1_REG_FRAME_LENGTH(ctx) \
+	CCI_REG32_LE(0x050c + VD55G1_CTX_OFFSET * (ctx))
+#define VD55G1_REG_X_START(ctx) \
+	CCI_REG16_LE(0x0514 + VD55G1_CTX_OFFSET * (ctx))
+#define VD55G1_REG_X_WIDTH(ctx) \
+	CCI_REG16_LE(0x0516 + VD55G1_CTX_OFFSET * (ctx))
+#define VD55G1_REG_Y_START(ctx) \
+	CCI_REG16_LE(0x0510 + VD55G1_CTX_OFFSET * (ctx))
+#define VD55G1_REG_Y_HEIGHT(ctx) \
+	CCI_REG16_LE(0x0512 + VD55G1_CTX_OFFSET * (ctx))
+#define VD55G1_REG_GPIO_0_CTRL(ctx) \
+	CCI_REG8(0x051d + VD55G1_CTX_OFFSET * (ctx))
+#define VD55G1_REG_VT_MODE(ctx) \
+	CCI_REG8(0x0536 + VD55G1_CTX_OFFSET * (ctx))
+#define VD55G1_VT_MODE_NORMAL 0
+#define VD55G1_VT_MODE_SUBTRACTION 1
+#define VD55G1_REG_MASK_FRAME_CTRL(ctx) \
+	CCI_REG8(0x0537 + VD55G1_CTX_OFFSET * (ctx))
+#define VD55G1_MASK_FRAME_CTRL_OUTPUT 0
+#define VD55G1_MASK_FRAME_CTRL_MASK 1
+#define VD55G1_REG_EXPOSURE_INSTANCE(ctx) \
+	CCI_REG32_LE(0x52D + VD55G1_CTX_OFFSET * (ctx))
+
+#define VD55G1_WIDTH					804
+#define VD55G1_HEIGHT					704
+#define VD55G1_DEFAULT_MODE				0
+#define VD55G1_NB_GPIOS					4
+#define VD55G1_MEDIA_BUS_FMT_DEF			MEDIA_BUS_FMT_Y8_1X8
+#define VD55G1_DGAIN_DEF				256
+#define VD55G1_AGAIN_DEF				19
+#define VD55G1_EXPO_MAX_TERM				64
+#define VD55G1_EXPO_DEF					500
+#define VD55G1_LINE_LENGTH_MIN				1128
+#define VD55G1_LINE_LENGTH_SUB_MIN			1344
+#define VD55G1_VBLANK_MIN				86
+#define VD55G1_VBLANK_MAX				0xffff
+#define VD55G1_FRAME_LENGTH_DEF				1860 /* 60 fps */
+#define VD55G1_MIPI_MARGIN				900
+#define VD55G1_CTX_OFFSET				0x50
+#define VD55G1_FWPATCH_REVISION_MAJOR			2
+#define VD55G1_FWPATCH_REVISION_MINOR			9
+
+static const u8 patch_array[] = {
+	0x44, 0x03, 0x09, 0x02, 0xe6, 0x01, 0x42, 0x00, 0xea, 0x01, 0x42, 0x00,
+	0xf0, 0x01, 0x42, 0x00, 0xe6, 0x01, 0x42, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x4c, 0x00, 0x00, 0xfa, 0x68, 0x40, 0x00, 0xe8,
+	0x09, 0xbe, 0x4c, 0x08, 0x00, 0xf2, 0x93, 0xdd, 0x1c, 0x00, 0xc0, 0xe2,
+	0x93, 0xdd, 0xc3, 0xc1, 0x0c, 0x04, 0x00, 0xfa, 0x6b, 0x80, 0x98, 0x7f,
+	0xfc, 0xef, 0x11, 0xc1, 0x0f, 0x82, 0x69, 0xbe, 0x0f, 0xac, 0x58, 0x40,
+	0x00, 0xe8, 0x0c, 0x0c, 0x00, 0xf2, 0x93, 0xdd, 0x1c, 0x00, 0x40, 0xe3,
+	0x93, 0xdd, 0xc3, 0xc1, 0x0c, 0x04, 0x84, 0xfa, 0x46, 0x0e, 0xe8, 0xe0,
+	0x08, 0xde, 0x4a, 0x40, 0x84, 0xe0, 0xa5, 0x86, 0xa8, 0x7d, 0xfc, 0xef,
+	0x6b, 0x80, 0x01, 0xbf, 0x28, 0x77, 0x0c, 0xef, 0x0b, 0x0e, 0x21, 0x78,
+	0x06, 0xc0, 0x0b, 0xa5, 0xb5, 0x84, 0x06, 0x42, 0x98, 0xe1, 0x01, 0x81,
+	0x01, 0x42, 0x38, 0xe0, 0x0c, 0xc4, 0x0e, 0x84, 0x46, 0x02, 0x84, 0xe0,
+	0x0c, 0x84, 0x11, 0x81, 0x21, 0x81, 0x31, 0x81, 0x41, 0x81, 0x51, 0x81,
+	0xc1, 0x81, 0x05, 0x83, 0x0c, 0x0c, 0x84, 0xf2, 0x93, 0xdd, 0x06, 0x40,
+	0x98, 0xe1, 0xc8, 0x80, 0x58, 0x82, 0x48, 0xc0, 0x38, 0xc2, 0x29, 0x00,
+	0x10, 0xe0, 0x19, 0x00, 0x14, 0xe0, 0x09, 0x00, 0x38, 0xe0, 0x5f, 0xb8,
+	0x5f, 0xa8, 0x5f, 0xa6, 0x5f, 0xa4, 0x5f, 0xa2, 0x5f, 0xa0, 0x56, 0x41,
+	0x98, 0xe1, 0x18, 0x82, 0x28, 0x80, 0x38, 0xc0, 0x5f, 0xa2, 0x19, 0x00,
+	0x20, 0xf8, 0x5f, 0xa4, 0x28, 0xc2, 0x5f, 0xa6, 0x39, 0x00, 0x10, 0xe0,
+	0x5f, 0xa2, 0x19, 0x00, 0x14, 0xe0, 0x5f, 0xa4, 0x29, 0x00, 0x18, 0xe0,
+	0x5f, 0xa6, 0x39, 0x00, 0x40, 0xe0, 0x5f, 0xa2, 0x19, 0x00, 0x44, 0xe0,
+	0x5f, 0xa4, 0x29, 0x00, 0x1c, 0xe0, 0x5f, 0xa6, 0x39, 0x00, 0x38, 0xe0,
+	0x5f, 0xa2, 0x19, 0x00, 0x20, 0xe0, 0x5f, 0xa4, 0x29, 0x00, 0x24, 0xe0,
+	0x5f, 0xa6, 0x39, 0x00, 0x28, 0xe0, 0x5f, 0xa2, 0x19, 0x00, 0x2c, 0xe0,
+	0x5f, 0xa4, 0x29, 0x00, 0x30, 0xe0, 0x5f, 0xa6, 0x09, 0x00, 0x34, 0xe0,
+	0x5f, 0xa2, 0x5f, 0xa4, 0x5f, 0xa0, 0x4a, 0x0a, 0xfc, 0xfb, 0xe5, 0x82,
+	0x08, 0xde, 0x4a, 0x40, 0x88, 0xe0, 0xf6, 0x40, 0x00, 0xe0, 0x01, 0x4e,
+	0x99, 0x78, 0x0a, 0xc0, 0x85, 0x80, 0x98, 0x40, 0x00, 0xe8, 0x35, 0x81,
+	0xa8, 0x40, 0x00, 0xe8, 0x0b, 0x8c, 0x0c, 0x0c, 0x84, 0xf2, 0xd5, 0xed,
+	0x83, 0xc1, 0x13, 0xc5, 0x93, 0xdd, 0xc3, 0xc1, 0x83, 0xc1, 0x13, 0xc3,
+	0x93, 0xdd, 0xc3, 0xc1, 0x4c, 0x04, 0x04, 0xfa, 0xc6, 0x0f, 0x94, 0xe0,
+	0x19, 0x0e, 0xc9, 0x65, 0x01, 0xc0, 0x28, 0xde, 0x0a, 0x42, 0x80, 0xe0,
+	0x24, 0x02, 0x00, 0xfc, 0x16, 0xde, 0xa5, 0x8a, 0x19, 0x00, 0xb8, 0xe0,
+	0x10, 0x02, 0x0c, 0xec, 0x1d, 0xe6, 0x14, 0x02, 0x88, 0x80, 0x4e, 0x04,
+	0x01, 0x00, 0x10, 0x80, 0x25, 0x02, 0x08, 0x9c, 0x86, 0x02, 0x00, 0x80,
+	0x08, 0x44, 0x00, 0x98, 0x55, 0x81, 0x11, 0x85, 0x45, 0x81, 0x11, 0x89,
+	0x25, 0x81, 0x11, 0x83, 0x2b, 0x00, 0x24, 0xe0, 0x64, 0xc2, 0x0b, 0x84,
+	0x08, 0x51, 0x00, 0xef, 0x2b, 0x80, 0x01, 0x83, 0x1b, 0x8c, 0x38, 0x7d,
+	0x5c, 0xef, 0x18, 0xde, 0x0b, 0xa1, 0x25, 0x82, 0x0b, 0x0e, 0x88, 0xf9,
+	0x0a, 0x00, 0x00, 0xe8, 0x10, 0x42, 0x04, 0x9c, 0x11, 0x4e, 0x0c, 0x80,
+	0x10, 0x40, 0x04, 0xf0, 0x4e, 0x05, 0x01, 0x60, 0x10, 0xc0, 0x06, 0x88,
+	0x10, 0x40, 0xf8, 0xf3, 0x06, 0xde, 0x4c, 0x0c, 0x04, 0xf2, 0x93, 0xdd,
+	0x0c, 0x04, 0x1c, 0xfe, 0xf6, 0x0f, 0x94, 0xe0, 0x38, 0x9c, 0x46, 0x51,
+	0xfc, 0xe0, 0x46, 0x49, 0x38, 0xe2, 0x30, 0x46, 0xf8, 0xf3, 0x36, 0x9c,
+	0xc6, 0x46, 0x0c, 0xe1, 0x34, 0x8c, 0x94, 0xa0, 0x4e, 0xa0, 0x39, 0x06,
+	0x80, 0xe0, 0x4a, 0x46, 0x94, 0xe0, 0x05, 0x8c, 0x6a, 0x40, 0x80, 0xe0,
+	0x2c, 0x0c, 0x00, 0xe2, 0x0b, 0x8c, 0xb8, 0x7c, 0x5c, 0xef, 0x0b, 0x8c,
+	0x9e, 0xa0, 0xf8, 0x40, 0x60, 0xef, 0x0b, 0xa1, 0x5a, 0x40, 0x80, 0xe0,
+	0x65, 0x88, 0x28, 0x02, 0x01, 0x40, 0x00, 0x80, 0x2a, 0x42, 0x9c, 0xe1,
+	0x28, 0x49, 0x60, 0xef, 0x96, 0x4d, 0x9c, 0xe1, 0x01, 0x81, 0x06, 0x98,
+	0xd5, 0x81, 0x09, 0x0e, 0xa1, 0x64, 0x01, 0xc0, 0x4a, 0x40, 0x88, 0xe0,
+	0x85, 0x80, 0xb8, 0x77, 0xfc, 0xef, 0x35, 0x81, 0xc8, 0x77, 0xfc, 0xef,
+	0x08, 0x98, 0x4a, 0x00, 0xfc, 0xfb, 0x55, 0xfc, 0xe8, 0x4a, 0x60, 0xef,
+	0x1a, 0x44, 0x9c, 0xe1, 0x35, 0x81, 0x1a, 0x4e, 0x9c, 0xe9, 0x1c, 0x00,
+	0x00, 0xe2, 0x0c, 0x0c, 0x1c, 0xf6, 0x93, 0xdd, 0x0d, 0xc3, 0x1a, 0x41,
+	0x08, 0xe4, 0x0a, 0x40, 0x84, 0xe1, 0x0c, 0x00, 0x00, 0xe2, 0x93, 0xdd,
+	0x4c, 0x04, 0x1c, 0xfa, 0x86, 0x52, 0xec, 0xe1, 0x08, 0xa6, 0x65, 0x12,
+	0x24, 0xf8, 0x0e, 0x02, 0x99, 0x7a, 0x00, 0xc0, 0x00, 0x40, 0xa0, 0xf3,
+	0x06, 0xa6, 0x0b, 0x8c, 0x08, 0x49, 0x00, 0xef, 0x85, 0x12, 0x28, 0xf8,
+	0x02, 0x02, 0xfc, 0xed, 0xf6, 0x47, 0xfd, 0x6f, 0xe0, 0xff, 0x04, 0xe2,
+	0x14, 0x04, 0xc0, 0xe0, 0x0f, 0x86, 0x2f, 0xa0, 0x0b, 0x8c, 0x2e, 0xe2,
+	0x08, 0x48, 0x00, 0xef, 0x86, 0x02, 0x84, 0xfe, 0x0e, 0x05, 0x09, 0x7d,
+	0x00, 0xc0, 0x05, 0x52, 0x08, 0xf8, 0x18, 0x7d, 0xfc, 0xef, 0x4a, 0x40,
+	0x80, 0xe0, 0x09, 0x12, 0x04, 0xc0, 0x65, 0x12, 0x20, 0xf8, 0x00, 0x40,
+	0x40, 0xdc, 0x01, 0x52, 0x04, 0xc0, 0x0e, 0x00, 0x41, 0x78, 0xf5, 0xc5,
+	0x6d, 0xc0, 0xb5, 0x82, 0x05, 0x10, 0x10, 0xe0, 0x11, 0xf1, 0x0f, 0x82,
+	0x05, 0x50, 0x10, 0xe0, 0x05, 0x10, 0x10, 0xe0, 0xfe, 0x02, 0xf0, 0xff,
+	0x0f, 0x82, 0x85, 0x83, 0x15, 0x10, 0x10, 0xe0, 0x16, 0x00, 0x91, 0x6e,
+	0x69, 0xcd, 0x21, 0xf1, 0x6d, 0xc1, 0x01, 0x83, 0x2f, 0x82, 0x26, 0x00,
+	0x00, 0x80, 0x2f, 0xa0, 0x25, 0x50, 0x10, 0xe0, 0x05, 0x10, 0x10, 0xe0,
+	0x11, 0xa1, 0xfe, 0x04, 0xf0, 0xff, 0x06, 0x42, 0x00, 0x80, 0x0f, 0x84,
+	0x0f, 0xa2, 0x05, 0x50, 0x10, 0xe0, 0x16, 0x00, 0x91, 0x6e, 0x69, 0xcd,
+	0x6d, 0xc1, 0x71, 0x8d, 0x16, 0x00, 0x79, 0x61, 0x2d, 0xcb, 0x86, 0x0e,
+	0x00, 0x80, 0x6d, 0xc1, 0x56, 0x0e, 0x00, 0xc0, 0x0b, 0x8c, 0x1b, 0x8e,
+	0x71, 0x52, 0x0c, 0xf8, 0x08, 0x43, 0x00, 0xef, 0x05, 0x52, 0x14, 0xf8,
+	0x15, 0x10, 0x28, 0xe0, 0x70, 0x04, 0x04, 0xec, 0x31, 0xe1, 0x29, 0x9e,
+	0x1f, 0x86, 0x1f, 0xa4, 0x15, 0x50, 0x28, 0xe0, 0x86, 0x42, 0x3c, 0xe0,
+	0x0e, 0x04, 0x9d, 0x64, 0x9b, 0xc2, 0x05, 0x52, 0x1c, 0xf8, 0x78, 0xa6,
+	0x48, 0x77, 0xfc, 0xef, 0x4a, 0x40, 0x80, 0xe0, 0x70, 0x4e, 0x10, 0xdc,
+	0x1e, 0x00, 0x81, 0x70, 0xeb, 0xcb, 0x70, 0x4e, 0xec, 0x93, 0x6d, 0xc1,
+	0x11, 0x85, 0x36, 0x02, 0x00, 0x80, 0x76, 0xa6, 0x11, 0x52, 0x10, 0xf8,
+	0x05, 0x10, 0x40, 0xe0, 0xfe, 0x47, 0x0c, 0xff, 0x14, 0x04, 0xa0, 0xe0,
+	0x0f, 0x86, 0x0f, 0xa4, 0x05, 0x50, 0x40, 0xe0, 0x05, 0x10, 0x28, 0xe0,
+	0xfe, 0x47, 0xfd, 0x7f, 0xe3, 0xff, 0x14, 0x04, 0xd0, 0xe0, 0x0f, 0x86,
+	0x2f, 0xa0, 0x20, 0x00, 0x01, 0x6c, 0x00, 0xd0, 0x05, 0x50, 0x28, 0xe0,
+	0x0b, 0x8c, 0xf8, 0x7e, 0xfc, 0xee, 0x0e, 0x03, 0x59, 0x78, 0xf5, 0xc5,
+	0x0d, 0xc2, 0x05, 0x52, 0x0c, 0xf8, 0x08, 0xa6, 0x46, 0x42, 0xb4, 0xe0,
+	0x18, 0x84, 0x00, 0x40, 0xf4, 0x93, 0x00, 0x40, 0x08, 0xdc, 0x1b, 0xa1,
+	0x06, 0xa6, 0x05, 0x10, 0x40, 0x80, 0x04, 0x00, 0x50, 0x9c, 0x65, 0x8a,
+	0x05, 0x10, 0x44, 0xe0, 0xf6, 0x43, 0xfd, 0x6f, 0x00, 0xf8, 0x0f, 0x82,
+	0x06, 0x02, 0x01, 0x60, 0x1e, 0xc0, 0x0f, 0xa2, 0x05, 0x50, 0x44, 0xe0,
+	0x05, 0x10, 0x44, 0xe0, 0x0e, 0x02, 0x00, 0xf8, 0x0f, 0x82, 0x09, 0xf6,
+	0x05, 0x50, 0x44, 0xe0, 0x05, 0x10, 0x40, 0xe0, 0x04, 0x00, 0x54, 0xfc,
+	0x05, 0x50, 0x40, 0xe0, 0x05, 0x10, 0x40, 0xe0, 0x04, 0x00, 0xcc, 0xfc,
+	0x05, 0x50, 0x40, 0xe0, 0x05, 0x10, 0x40, 0xe0, 0x04, 0x00, 0x4c, 0xfc,
+	0x05, 0x50, 0x40, 0xe0, 0x05, 0x10, 0x40, 0xe0, 0x04, 0x00, 0xd0, 0xfc,
+	0x05, 0x50, 0x40, 0xe0, 0x4c, 0x0c, 0x1c, 0xf2, 0x93, 0xdd, 0xc3, 0xc1,
+	0xc6, 0x40, 0xfc, 0xe0, 0x04, 0x80, 0xc6, 0x44, 0x0c, 0xe1, 0x15, 0x04,
+	0x0c, 0xf8, 0x0a, 0x80, 0x06, 0x07, 0x04, 0xe0, 0x03, 0x42, 0x48, 0xe1,
+	0x46, 0x02, 0x40, 0xe2, 0x08, 0xc6, 0x44, 0x88, 0x06, 0x46, 0x0e, 0xe0,
+	0x86, 0x01, 0x84, 0xe0, 0x33, 0x80, 0x39, 0x06, 0xd8, 0xef, 0x0a, 0x46,
+	0x80, 0xe0, 0x31, 0xbf, 0x06, 0x06, 0x00, 0xc0, 0x31, 0x48, 0x60, 0xe0,
+	0x34, 0x88, 0x49, 0x06, 0x40, 0xe1, 0x40, 0x48, 0x7c, 0xf3, 0x41, 0x46,
+	0x40, 0xe1, 0x24, 0x8a, 0x39, 0x04, 0x10, 0xe0, 0x39, 0xc2, 0x31, 0x44,
+	0x10, 0xe0, 0x14, 0xc4, 0x1b, 0xa5, 0x11, 0x83, 0x11, 0x40, 0x25, 0x6a,
+	0x01, 0xc0, 0x08, 0x5c, 0x00, 0xda, 0x15, 0x00, 0xcc, 0xe0, 0x25, 0x00,
+	0xf8, 0xe0, 0x1b, 0x85, 0x08, 0x5c, 0x00, 0x9a, 0x4e, 0x03, 0x01, 0x60,
+	0x10, 0xc0, 0x29, 0x00, 0x1c, 0xe4, 0x18, 0x84, 0x20, 0x44, 0xf8, 0xf3,
+	0x2f, 0xa2, 0x21, 0x40, 0x1c, 0xe4, 0x93, 0xdd, 0x0c, 0x00, 0x80, 0xfa,
+	0x15, 0x00, 0x3c, 0xe0, 0x21, 0x81, 0x31, 0x85, 0x21, 0x42, 0x60, 0xe0,
+	0x15, 0x00, 0x44, 0xe0, 0x31, 0x42, 0x40, 0xe1, 0x15, 0x00, 0x34, 0xe0,
+	0x21, 0x42, 0x20, 0xe0, 0x15, 0x00, 0x34, 0xe0, 0xd6, 0x04, 0x10, 0xe0,
+	0x23, 0x42, 0x30, 0xe0, 0x15, 0x00, 0x34, 0xe0, 0x86, 0x44, 0x04, 0xe0,
+	0x23, 0x42, 0x38, 0xe0, 0x05, 0x00, 0x30, 0xe0, 0xc6, 0x02, 0x08, 0xe0,
+	0x13, 0x40, 0x10, 0xe3, 0xe8, 0x56, 0x40, 0xef, 0x06, 0x40, 0x0c, 0xe1,
+	0x04, 0x80, 0x06, 0x02, 0x94, 0xe0, 0x2b, 0x02, 0xc4, 0xea, 0x3b, 0x00,
+	0x78, 0xe2, 0x20, 0x44, 0xfd, 0x73, 0x07, 0xc0, 0x30, 0x46, 0x01, 0x70,
+	0xf8, 0xc0, 0x3f, 0xa4, 0x33, 0x40, 0x78, 0xe2, 0x0a, 0x84, 0x0c, 0x08,
+	0x80, 0xf2, 0xf8, 0x3b, 0x3c, 0xff, 0xc3, 0xc1, 0x06, 0x40, 0x0c, 0xe1,
+	0x04, 0x80, 0x1b, 0x00, 0x40, 0xe4, 0x19, 0xc2, 0x13, 0x40, 0x40, 0xe4,
+	0x1b, 0x00, 0x40, 0xe4, 0x19, 0xc4, 0x13, 0x40, 0x40, 0xe4, 0x93, 0xdd,
+	0xc6, 0x43, 0xec, 0xe0, 0x46, 0x41, 0xfc, 0xe0, 0x24, 0x84, 0x04, 0x80,
+	0x31, 0x81, 0x4a, 0x44, 0x80, 0xe0, 0x86, 0x44, 0x0c, 0xe1, 0x09, 0x00,
+	0x6c, 0xe0, 0xc4, 0x8a, 0x8e, 0x47, 0xfc, 0x9f, 0x01, 0x42, 0x51, 0x78,
+	0x0c, 0xc0, 0x31, 0x58, 0x90, 0xe0, 0x34, 0x8a, 0x41, 0xbf, 0x06, 0x08,
+	0x00, 0xc0, 0x41, 0x46, 0xa0, 0xe0, 0x34, 0x8a, 0x51, 0x81, 0xf6, 0x0b,
+	0x00, 0xc0, 0x51, 0x46, 0xd0, 0xe0, 0x34, 0x8a, 0x01, 0xbf, 0x51, 0x46,
+	0xe0, 0xe0, 0x44, 0x84, 0x0a, 0x48, 0x84, 0xe0, 0x75, 0x86, 0x54, 0xca,
+	0x49, 0x88, 0x44, 0x06, 0x88, 0xe1, 0x36, 0x94, 0x4a, 0x46, 0x80, 0xe0,
+	0x34, 0xca, 0x47, 0xc6, 0x11, 0x8d, 0x41, 0x46, 0xd0, 0xe0, 0x34, 0x88,
+	0x76, 0x02, 0x00, 0xc0, 0x06, 0x00, 0x00, 0xc0, 0x16, 0x8c, 0x14, 0x88,
+	0x01, 0x42, 0xc0, 0xe1, 0x01, 0x42, 0xe0, 0xe1, 0x01, 0x42, 0xf0, 0xe1,
+	0x93, 0xdd, 0x34, 0xca, 0x41, 0x85, 0x46, 0x8c, 0x34, 0xca, 0x06, 0x48,
+	0x00, 0xe0, 0x41, 0x46, 0xd0, 0xe0, 0x34, 0x88, 0x41, 0x83, 0x46, 0x8c,
+	0x34, 0x88, 0x01, 0x46, 0xc0, 0xe1, 0x01, 0x46, 0xe0, 0xe1, 0x01, 0x46,
+	0xf0, 0xe1, 0x09, 0x02, 0x20, 0xe0, 0x14, 0xca, 0x03, 0x42, 0x58, 0xe0,
+	0x93, 0xdd, 0xc3, 0xc1, 0x4c, 0x04, 0x04, 0xfa, 0x46, 0x4e, 0x08, 0xe1,
+	0x06, 0x4c, 0x0c, 0xe1, 0x0a, 0x9e, 0x14, 0x98, 0x05, 0x42, 0x44, 0xe0,
+	0x10, 0x00, 0xe1, 0x65, 0x03, 0xc0, 0x78, 0x41, 0x00, 0xe8, 0x08, 0x9c,
+	0x0b, 0xa1, 0x04, 0x98, 0x06, 0x02, 0x10, 0x80, 0x13, 0x40, 0xf8, 0x86,
+	0x65, 0x82, 0x00, 0x00, 0xe1, 0x65, 0x03, 0xc0, 0xa8, 0x40, 0x00, 0xe8,
+	0x14, 0x98, 0x04, 0x00, 0xa0, 0xfc, 0x03, 0x42, 0x00, 0xe7, 0x4c, 0x0c,
+	0x04, 0xf2, 0x93, 0xdd, 0x0a, 0x80, 0x93, 0xdd, 0x0c, 0x04, 0x00, 0xfa,
+	0x06, 0x02, 0xec, 0xe1, 0x64, 0x84, 0x15, 0x0c, 0x2c, 0xe0, 0x14, 0x02,
+	0xa0, 0xfc, 0x15, 0x4c, 0x2c, 0xe0, 0xd8, 0x40, 0x00, 0xe8, 0x14, 0xd8,
+	0x09, 0x82, 0x14, 0x02, 0x00, 0xfc, 0x1f, 0xa0, 0x1e, 0xd8, 0x01, 0x85,
+	0x0c, 0x0c, 0x00, 0xf2, 0xe8, 0x32, 0x2c, 0xff, 0x93, 0xdd, 0xc3, 0xc1,
+	0x0c, 0x04, 0x00, 0xfa, 0x6b, 0x80, 0xf6, 0x01, 0x94, 0xe0, 0x08, 0x80,
+	0x4a, 0x40, 0x80, 0xe0, 0x45, 0x86, 0x06, 0x40, 0x0c, 0xe1, 0x04, 0x80,
+	0xc6, 0x02, 0x40, 0xe2, 0x09, 0x00, 0xd0, 0xe0, 0x14, 0x84, 0x1b, 0xa5,
+	0x15, 0x84, 0x07, 0xc5, 0x09, 0x82, 0x18, 0x41, 0x00, 0xe8, 0x46, 0x43,
+	0xfc, 0xe0, 0x14, 0x84, 0x19, 0x02, 0xd8, 0xe0, 0x19, 0x82, 0x0b, 0x83,
+	0x16, 0x00, 0x00, 0xc0, 0x01, 0x4c, 0x00, 0xc0, 0x0c, 0x0c, 0x00, 0xf2,
+	0x93, 0xdd, 0xc3, 0xc1, 0x4a, 0x00, 0x00, 0xe0, 0x0c, 0x00, 0x00, 0xe2,
+	0x93, 0xdd, 0xc3, 0xc1, 0x46, 0x40, 0x84, 0xe0, 0x11, 0xaf, 0x13, 0x40,
+	0x6c, 0xec, 0x11, 0xb3, 0x13, 0x40, 0x70, 0xec, 0xc6, 0x43, 0xf0, 0xe0,
+	0x13, 0x40, 0xdc, 0xec, 0xc6, 0x02, 0x24, 0xe0, 0x1c, 0x80, 0x93, 0xdd,
+	0x4c, 0x00, 0x00, 0xfa, 0xc8, 0x60, 0x7c, 0xef, 0xe8, 0x61, 0x7c, 0xef,
+	0x28, 0x7e, 0x80, 0xef, 0xc6, 0x40, 0x98, 0xe1, 0x11, 0x83, 0x16, 0x80,
+	0x46, 0x01, 0x10, 0xe1, 0x11, 0x81, 0x16, 0x80, 0x4c, 0x08, 0x00, 0xf2,
+	0x93, 0xdd, 0xc3, 0xc1, 0x0c, 0x04, 0x0c, 0xfa, 0x6b, 0x80, 0x04, 0x98,
+	0x7b, 0x82, 0x56, 0x42, 0xb4, 0xe0, 0x88, 0x84, 0x05, 0x00, 0x10, 0xe0,
+	0x09, 0x86, 0x0b, 0xa5, 0x46, 0x02, 0x00, 0x80, 0x06, 0x05, 0x00, 0x80,
+	0x25, 0x82, 0x0b, 0xa3, 0xa5, 0x80, 0x0b, 0xa1, 0x06, 0x00, 0xf4, 0xef,
+	0xd5, 0x84, 0x11, 0x85, 0x21, 0x91, 0x0b, 0x8e, 0x88, 0x74, 0x10, 0xef,
+	0x0b, 0xa1, 0xf5, 0x82, 0x0a, 0x9e, 0x1a, 0x9c, 0x24, 0x98, 0x07, 0xe0,
+	0x0f, 0xa2, 0x0e, 0xca, 0x0a, 0xde, 0x1a, 0xdc, 0x24, 0x98, 0x03, 0xb0,
+	0x07, 0xe0, 0x0f, 0xa2, 0x0e, 0xc8, 0x01, 0x81, 0x0c, 0x0c, 0x0c, 0xf2,
+	0x93, 0xdd, 0xc3, 0xc1, 0x0c, 0x04, 0x7c, 0xfa, 0x46, 0x42, 0x9c, 0xe0,
+	0x0b, 0x02, 0x04, 0xe3, 0xf0, 0x1e, 0x30, 0xec, 0x0b, 0xa3, 0x35, 0x96,
+	0x8e, 0x01, 0x01, 0x60, 0x10, 0xc0, 0x0e, 0xfc, 0xc6, 0x05, 0xd0, 0xe1,
+	0x0b, 0x82, 0x31, 0x81, 0x10, 0x16, 0x00, 0xe5, 0x20, 0x10, 0x20, 0xe7,
+	0x0e, 0xbe, 0xb5, 0x85, 0x94, 0xfc, 0xa4, 0xbe, 0x82, 0x4c, 0x9c, 0xf0,
+	0x05, 0x0c, 0x40, 0xe0, 0x11, 0x89, 0x93, 0x8e, 0xa3, 0x8e, 0x58, 0x44,
+	0x00, 0xe8, 0x15, 0x0c, 0xc0, 0xf8, 0x04, 0x0c, 0x80, 0xfb, 0x0c, 0xed,
+	0x0b, 0x82, 0x1b, 0x8c, 0x48, 0x44, 0x00, 0xe8, 0x15, 0x10, 0x1c, 0xfc,
+	0x0e, 0xa8, 0x0b, 0x82, 0x1b, 0x8c, 0xd8, 0x43, 0x00, 0xe8, 0x71, 0x88,
+	0x0e, 0xa4, 0x0a, 0x0e, 0x40, 0xe0, 0x35, 0xf8, 0x04, 0xbe, 0x14, 0xbc,
+	0x81, 0xa0, 0x03, 0x8e, 0x0e, 0xbe, 0x04, 0xfc, 0x11, 0x82, 0x3b, 0x82,
+	0x03, 0x8e, 0x0e, 0xfc, 0x3b, 0xa9, 0x06, 0x0e, 0x00, 0xc0, 0x35, 0x5e,
+	0x00, 0xc0, 0xd5, 0xfa, 0xc6, 0x01, 0xd0, 0xe1, 0x7b, 0x80, 0x04, 0x9e,
+	0x11, 0x91, 0x98, 0x41, 0x00, 0xe8, 0x24, 0x9c, 0x46, 0x42, 0x9c, 0xe0,
+	0x6b, 0x82, 0x03, 0x4c, 0xc4, 0xe0, 0x11, 0x91, 0x0b, 0x84, 0xf8, 0x40,
+	0x00, 0xe8, 0x19, 0x0e, 0x20, 0xe5, 0x03, 0x4c, 0xc0, 0xe0, 0x0b, 0x82,
+	0x08, 0x72, 0xfc, 0xef, 0x01, 0x4c, 0x24, 0xf9, 0xf1, 0x98, 0x0c, 0x0c,
+	0x7c, 0xf2, 0x93, 0xdd, 0x4c, 0x00, 0x00, 0xfa, 0x48, 0x65, 0x2c, 0xef,
+	0x4c, 0x08, 0x00, 0xf2, 0x93, 0xdd, 0xc3, 0xc1, 0x0c, 0x04, 0x00, 0xfa,
+	0x6b, 0x82, 0x78, 0x6e, 0xfc, 0xee, 0x46, 0x42, 0xec, 0xe0, 0x24, 0x84,
+	0x24, 0x02, 0x80, 0xfa, 0x1d, 0xcc, 0x11, 0x83, 0xf5, 0x82, 0x24, 0x02,
+	0xa0, 0xe1, 0x14, 0x02, 0x80, 0xfa, 0x1d, 0xcc, 0x11, 0x85, 0x15, 0x82,
+	0x27, 0xe1, 0x24, 0x02, 0x80, 0xfa, 0x1d, 0xcc, 0x11, 0x89, 0x86, 0x02,
+	0x00, 0x80, 0x0c, 0x0c, 0x00, 0xf2, 0x18, 0x17, 0xfc, 0xfe, 0xc3, 0xc1,
+	0x0c, 0x04, 0x00, 0xfa, 0x06, 0x41, 0x8c, 0xe0, 0x1b, 0x00, 0xec, 0xe4,
+	0x1b, 0xa3, 0x75, 0x84, 0x11, 0x81, 0x8e, 0x05, 0x01, 0x60, 0x10, 0xc0,
+	0x00, 0x06, 0xc0, 0xe5, 0x95, 0x81, 0x44, 0x88, 0x1d, 0xee, 0x75, 0x80,
+	0x4e, 0xc1, 0x25, 0x81, 0x4e, 0xcd, 0x21, 0x88, 0x11, 0x82, 0x0a, 0x02,
+	0x40, 0xe0, 0xd5, 0xfc, 0x56, 0x00, 0x00, 0xe1, 0x18, 0x80, 0x1b, 0xa1,
+	0xc5, 0x84, 0x08, 0x82, 0x4a, 0x00, 0xfc, 0xfb, 0x45, 0x84, 0x86, 0x4d,
+	0x84, 0xe1, 0x04, 0x98, 0x05, 0x00, 0x10, 0xe0, 0x4a, 0x40, 0x80, 0xe0,
+	0x45, 0x82, 0x11, 0x81, 0x0b, 0x8c, 0x58, 0x76, 0x28, 0xef, 0x0b, 0x8c,
+	0x0c, 0x0c, 0x00, 0xf2, 0x88, 0x35, 0x28, 0xff, 0x0c, 0x0c, 0x00, 0xf2,
+	0x93, 0xdd, 0xc3, 0xc1, 0x46, 0x41, 0xfc, 0xe0, 0x04, 0x80, 0x09, 0x00,
+	0x80, 0xe0, 0x09, 0x9e, 0x0b, 0xa3, 0x75, 0x82, 0x46, 0x41, 0x80, 0xe1,
+	0x04, 0x80, 0xc6, 0x42, 0x8c, 0xe0, 0x04, 0xc2, 0x00, 0x40, 0x00, 0xf2,
+	0x07, 0xcf, 0x06, 0x84, 0x06, 0x40, 0x84, 0xe0, 0x15, 0x00, 0x28, 0xe5,
+	0x1c, 0xc2, 0x93, 0xdd, 0x0b, 0xa1, 0xc6, 0x00, 0xa0, 0xe1, 0x15, 0x00,
+	0x04, 0xf8, 0x05, 0x84, 0x21, 0x8b, 0x2c, 0x84, 0x14, 0x80, 0x2c, 0x84,
+	0x14, 0x82, 0x2c, 0x84, 0x15, 0x00, 0x10, 0xe0, 0x21, 0xa1, 0x21, 0x42,
+	0x10, 0xe0, 0x05, 0x00, 0x14, 0xe0, 0x01, 0x88, 0x75, 0x83, 0x21, 0x85,
+	0x2c, 0x84, 0x14, 0x80, 0x06, 0x46, 0x00, 0xe0, 0x2c, 0x84, 0x14, 0x82,
+	0x2c, 0x84, 0x14, 0xc0, 0x21, 0xa1, 0x21, 0x42, 0x20, 0xe0, 0x14, 0xc2,
+	0x31, 0x42, 0x20, 0xe0, 0x15, 0x00, 0x10, 0xe0, 0x21, 0x42, 0x20, 0xe0,
+	0x05, 0x00, 0x14, 0xe0, 0x01, 0x90, 0x06, 0x42, 0x00, 0xe0, 0x16, 0x80,
+	0x93, 0xdd, 0xc3, 0xc1, 0x0c, 0x04, 0x7c, 0xfa, 0x4a, 0x40, 0x80, 0xe0,
+	0xf0, 0x1e, 0x30, 0xec, 0xe5, 0x82, 0xa6, 0x40, 0x00, 0xe1, 0x1a, 0x80,
+	0x2a, 0xc0, 0x3a, 0xc2, 0x13, 0x40, 0x10, 0xe0, 0x1a, 0x82, 0x23, 0x40,
+	0x18, 0xe0, 0x33, 0x40, 0x1c, 0xe0, 0x13, 0x40, 0x14, 0xe0, 0xf8, 0x61,
+	0x68, 0xef, 0xc6, 0x13, 0x00, 0xe1, 0x15, 0x12, 0x28, 0xf8, 0x0b, 0x02,
+	0x2c, 0xe0, 0x1b, 0x02, 0x24, 0xe0, 0x8a, 0x00, 0xa5, 0x64, 0x03, 0xc0,
+	0x35, 0x82, 0x0a, 0x4e, 0x9c, 0xe1, 0x1a, 0x03, 0x11, 0x6f, 0x02, 0xc0,
+	0xe8, 0x13, 0x01, 0x20, 0x00, 0xc0, 0x1f, 0xa0, 0x5a, 0x42, 0x80, 0xe0,
+	0x0a, 0x4e, 0x9c, 0xe1, 0x68, 0x13, 0x00, 0xa0, 0x09, 0x12, 0x78, 0xf8,
+	0xa1, 0x81, 0xf0, 0x02, 0x10, 0xe4, 0x07, 0xc4, 0x0c, 0xfc, 0xf0, 0x00,
+	0x20, 0xe4, 0xa6, 0x91, 0xa8, 0x53, 0x74, 0xef, 0x05, 0x12, 0x30, 0xf8,
+	0x25, 0x12, 0x28, 0xf8, 0x61, 0x87, 0x09, 0x00, 0x48, 0xe0, 0x81, 0x85,
+	0x09, 0x86, 0x0b, 0xa7, 0x26, 0x0c, 0x00, 0xc0, 0x0b, 0xa1, 0x0b, 0x04,
+	0x28, 0xe0, 0x16, 0x0c, 0x00, 0x80, 0x03, 0x52, 0x04, 0xf8, 0x0b, 0x04,
+	0x20, 0xe0, 0x0c, 0xa6, 0x1b, 0x04, 0x2c, 0xe0, 0x3b, 0x04, 0x28, 0xe0,
+	0x4b, 0x04, 0x20, 0xe0, 0x13, 0x86, 0x3b, 0x04, 0x24, 0xe0, 0x10, 0x0a,
+	0x04, 0xec, 0x1a, 0xfc, 0x33, 0x88, 0x30, 0x06, 0x04, 0xec, 0x12, 0x4e,
+	0x94, 0xf0, 0x32, 0x48, 0x84, 0xf0, 0x4c, 0xe4, 0x7c, 0xa4, 0xcb, 0x04,
+	0x28, 0xe0, 0x14, 0x08, 0x84, 0xe1, 0xcd, 0xc9, 0xc2, 0x58, 0x90, 0x91,
+	0x42, 0x4e, 0x94, 0x90, 0xc3, 0x52, 0x04, 0x98, 0x73, 0x52, 0x00, 0x80,
+	0x5b, 0x04, 0x20, 0xe0, 0x5d, 0xc9, 0x52, 0x40, 0x90, 0x91, 0x42, 0x48,
+	0x8c, 0x90, 0x03, 0x52, 0x04, 0x80, 0x43, 0x52, 0x08, 0x80, 0x3b, 0x04,
+	0x2c, 0xe0, 0x49, 0x04, 0xb8, 0xe0, 0x33, 0x52, 0x1c, 0xf8, 0x2b, 0x04,
+	0x24, 0xe0, 0x4b, 0xab, 0x23, 0x52, 0x18, 0xf8, 0x65, 0x8a, 0x4b, 0xa9,
+	0xe5, 0x90, 0x4b, 0xa7, 0x22, 0x44, 0x84, 0xd0, 0x32, 0x46, 0x84, 0xd0,
+	0x33, 0x52, 0x1c, 0xd8, 0x23, 0x52, 0x18, 0xd8, 0x95, 0x96, 0x20, 0x44,
+	0xf9, 0x73, 0xff, 0xc0, 0x27, 0xc3, 0x23, 0x82, 0x23, 0x52, 0x18, 0xf8,
+	0x24, 0x02, 0x80, 0xfb, 0x04, 0x00, 0x80, 0xfb, 0x2b, 0x8c, 0x58, 0x52,
+	0x74, 0xef, 0x1b, 0x12, 0x1c, 0xf8, 0x2a, 0xfc, 0x0c, 0xe4, 0x17, 0xc3,
+	0x13, 0x84, 0x13, 0x52, 0x1c, 0xf8, 0x0b, 0x12, 0x04, 0xf8, 0x14, 0x02,
+	0x80, 0xfb, 0x2b, 0x8c, 0x68, 0x51, 0x74, 0xef, 0xc5, 0x87, 0x20, 0x44,
+	0xe1, 0x73, 0xff, 0xc0, 0x27, 0xc7, 0x23, 0x82, 0x23, 0x52, 0x18, 0xf8,
+	0x24, 0x02, 0x80, 0xfb, 0x04, 0x00, 0x80, 0xfb, 0x2b, 0x8c, 0x78, 0x57,
+	0x74, 0xef, 0x1b, 0x12, 0x1c, 0xf8, 0x2a, 0xfc, 0x0c, 0xe4, 0x17, 0xc7,
+	0x13, 0x84, 0x13, 0x52, 0x1c, 0xf8, 0x0b, 0x12, 0x04, 0xf8, 0x14, 0x02,
+	0x80, 0xfb, 0x2b, 0x8c, 0x88, 0x56, 0x74, 0xef, 0xe5, 0x83, 0x20, 0x44,
+	0xf1, 0x73, 0xff, 0xc0, 0x27, 0xc5, 0x23, 0x82, 0x23, 0x52, 0x18, 0xf8,
+	0x24, 0x02, 0x80, 0xfb, 0x04, 0x00, 0x80, 0xfb, 0x2b, 0x8c, 0x18, 0x52,
+	0x74, 0xef, 0x1b, 0x12, 0x1c, 0xf8, 0x2a, 0xfc, 0x0c, 0xe4, 0x17, 0xc5,
+	0x13, 0x84, 0x13, 0x52, 0x1c, 0xf8, 0x0b, 0x12, 0x04, 0xf8, 0x14, 0x02,
+	0x80, 0xfb, 0x2b, 0x8c, 0x28, 0x51, 0x74, 0xef, 0x7b, 0x80, 0x7c, 0xa4,
+	0x08, 0x91, 0xa3, 0x52, 0x1c, 0xe0, 0xa3, 0x52, 0x24, 0xe0, 0x0b, 0xa1,
+	0x83, 0x52, 0x1c, 0x80, 0x83, 0x52, 0x24, 0x80, 0x89, 0x12, 0x78, 0xf8,
+	0xf6, 0x57, 0xfc, 0xef, 0x6b, 0x12, 0x1c, 0xf8, 0xab, 0x12, 0x18, 0xf8,
+	0xd6, 0x57, 0xfc, 0x8f, 0x8b, 0xa3, 0xa0, 0x40, 0x00, 0x9c, 0xa5, 0x86,
+	0x64, 0x00, 0x80, 0xfb, 0x1b, 0x90, 0xf8, 0x7d, 0xf8, 0xee, 0x6b, 0x80,
+	0xa4, 0x00, 0x80, 0xfb, 0x1b, 0x90, 0x98, 0x7d, 0xf8, 0xee, 0x15, 0x12,
+	0x28, 0xf8, 0x19, 0x02, 0xb8, 0xe0, 0x1b, 0xad, 0x95, 0x82, 0x1a, 0xa6,
+	0xa0, 0x44, 0xf9, 0x73, 0xff, 0xc0, 0x27, 0xc3, 0x13, 0x94, 0x10, 0x02,
+	0x08, 0xec, 0x1c, 0xe4, 0x23, 0x52, 0x18, 0xf8, 0x1b, 0x12, 0x04, 0xf8,
+	0x03, 0x96, 0x03, 0x52, 0x28, 0xe0, 0x1c, 0xe6, 0x0a, 0xa6, 0x1a, 0xe4,
+	0x63, 0x96, 0x63, 0x52, 0x20, 0xe0, 0x73, 0x52, 0x10, 0xe0, 0x03, 0x52,
+	0x14, 0xe0, 0x13, 0x52, 0x18, 0xe0, 0x98, 0x52, 0x74, 0xef, 0x09, 0x12,
+	0x8c, 0xe0, 0x0b, 0xa1, 0x01, 0x81, 0x01, 0x52, 0x90, 0xe0, 0x65, 0x82,
+	0x05, 0x12, 0x30, 0xf8, 0x09, 0x00, 0xa8, 0xe0, 0x0a, 0x00, 0x0c, 0xf8,
+	0x16, 0x00, 0x00, 0xc0, 0x01, 0x52, 0x90, 0xc0, 0x46, 0x41, 0x84, 0xe0,
+	0x0a, 0x80, 0x0a, 0x4e, 0x9c, 0xe9, 0x1a, 0x00, 0x08, 0xe0, 0x38, 0x01,
+	0x01, 0x20, 0x00, 0xc0, 0x0b, 0x12, 0x1c, 0xe0, 0x1b, 0x12, 0x24, 0xe0,
+	0x2b, 0x12, 0x28, 0xe0, 0x03, 0x52, 0x2c, 0xe0, 0x0b, 0x12, 0x20, 0xe0,
+	0x13, 0x52, 0x34, 0xe0, 0x23, 0x52, 0x38, 0xe0, 0x03, 0x52, 0x30, 0xe0,
+	0x0c, 0x00, 0x00, 0xe2, 0xf1, 0x98, 0x0c, 0x0c, 0x7c, 0xf2, 0x93, 0xdd,
+	0x13, 0xa9, 0x00, 0x00, 0xa8, 0xc1, 0x40, 0x00, 0x68, 0x04, 0xa0, 0xe0,
+	0x40, 0x6c, 0x40, 0x00, 0xe8, 0x34, 0xc8, 0xe0, 0xfc, 0x91, 0x40, 0x00,
+	0x68, 0x1f, 0xb8, 0xe0, 0x30, 0x16, 0x41, 0x00, 0x28, 0x39, 0x74, 0xe0,
+	0xb0, 0x7e, 0x40, 0x00, 0xe8, 0x38, 0xc0, 0xe0, 0x30, 0x04, 0x41, 0x00,
+	0x48, 0x1b, 0x80, 0xe0, 0x30, 0x2e, 0x40, 0x00, 0x88, 0x0c, 0xec, 0xe0,
+	0x10, 0x9f, 0x40, 0x00, 0x88, 0x08, 0xb4, 0xe0, 0x10, 0x01, 0x41, 0x00,
+	0x68, 0x01, 0x84, 0xe0, 0x54, 0xd6, 0x40, 0x00, 0xc8, 0x1a, 0x98, 0xe0,
+	0xd0, 0xc8, 0x40, 0x00, 0x68, 0x08, 0xa0, 0xe0, 0x80, 0xdb, 0x40, 0x00,
+	0xe8, 0x35, 0x94, 0xe0, 0x74, 0xff, 0x40, 0x00, 0xa8, 0x11, 0x80, 0xe0,
+	0xf8, 0x89, 0x40, 0x00, 0x88, 0x16, 0xbc, 0xe0, 0x00, 0x90, 0x40, 0x00,
+	0x08, 0x35, 0xb8, 0xe0, 0x7c, 0x73, 0x40, 0x00, 0x88, 0x1b, 0xc8, 0xe0,
+	0xf4, 0xff, 0x40, 0x00, 0x68, 0x39, 0x80, 0xe0, 0xa4, 0xa4, 0x40, 0x00,
+	0xa8, 0x16, 0xb0, 0xe0, 0x50, 0xc9, 0x40, 0x00, 0x28, 0x3a, 0x98, 0xe0,
+	0x00, 0xb9, 0x00, 0x00, 0xb6, 0x85, 0x00, 0x00,
+};
+
+static const char * const vd55g1_tp_menu[] = {
+	"Disabled",
+	"Dgrey",
+	"PN28",
+};
+
+static const s64 vd55g1_ev_bias_menu[] = {
+	-3000, -2500, -2000, -1500, -1000, -500,
+	    0,
+	  500,  1000,  1500,  2000,  2500, 3000,
+};
+
+static const char * const vd55g1_hdr_menu[] = {
+	"No HDR",
+	/*
+	 * This mode acquires 2 frames on the sensor, the first one is ditched
+	 * out and only used for auto exposure data, the second one is output to
+	 * the host
+	 */
+	"Internal subtraction",
+};
+
+static const char * const vd55g1_supply_name[] = {
+	"vcore",
+	"vddio",
+	"vana",
+};
+
+enum vd55g1_hdr_mode {
+	VD55G1_NO_HDR,
+	VD55G1_HDR_SUB,
+};
+
+enum vd55g1_bin_mode {
+	VD55G1_BIN_MODE_NORMAL,
+	VD55G1_BIN_MODE_DIGITAL_X2,
+	VD55G1_BIN_MODE_DIGITAL_X4,
+};
+
+enum vd55g1_gpio_mode {
+	VD55G1_GPIO_MODE_IN = 0x01,
+	VD55G1_GPIO_MODE_STROBE = 0x02,
+};
+
+struct vd55g1_mode {
+	u32 width;
+	u32 height;
+};
+
+struct vd55g1_fmt_desc {
+	u32 code;
+	u8 bpp;
+	u8 data_type;
+};
+
+static const struct vd55g1_fmt_desc vd55g1_mbus_codes[] = {
+	{
+		.code = MEDIA_BUS_FMT_Y8_1X8,
+		.bpp = 8,
+		.data_type = MIPI_CSI2_DT_RAW8,
+	},
+	{
+		.code = MEDIA_BUS_FMT_Y10_1X10,
+		.bpp = 10,
+		.data_type = MIPI_CSI2_DT_RAW10,
+	},
+};
+
+static const struct vd55g1_mode vd55g1_supported_modes[] = {
+	{
+		.width = VD55G1_WIDTH,
+		.height = VD55G1_HEIGHT,
+	},
+	{
+		.width = 800,
+		.height = VD55G1_HEIGHT,
+	},
+	{
+		.width = 800,
+		.height = 600,
+	},
+	{
+		.width = 640,
+		.height = 480,
+	},
+	{
+		.width = 320,
+		.height = 240,
+	},
+};
+
+enum vd55g1_expo_state {
+	VD55G1_EXP_AUTO,
+	VD55G1_EXP_FREEZE,
+	VD55G1_EXP_MANUAL,
+	VD55G1_EXP_SINGLE_STEP,
+	VD55G1_EXP_BYPASS,
+};
+
+struct vblank_limits {
+	u16 min;
+	u16 def;
+	u16 max;
+};
+
+struct vd55g1 {
+	struct i2c_client *i2c_client;
+	struct v4l2_subdev sd;
+	struct media_pad pad;
+	struct regulator_bulk_data supplies[ARRAY_SIZE(vd55g1_supply_name)];
+	struct gpio_desc *reset_gpio;
+	struct clk *xclk;
+	struct regmap *regmap;
+	u32 xclk_freq;
+	u16 oif_ctrl;
+	enum vd55g1_gpio_mode gpios[VD55G1_NB_GPIOS];
+	unsigned long ext_leds_mask;
+	int data_rate_in_mbps;
+	u32 pixel_clock;
+	u64 link_freq;
+	struct v4l2_ctrl_handler ctrl_handler;
+	struct v4l2_ctrl *pixel_rate_ctrl;
+	struct v4l2_ctrl *vblank_ctrl;
+	struct v4l2_ctrl *hblank_ctrl;
+	struct {
+		struct v4l2_ctrl *hflip_ctrl;
+		struct v4l2_ctrl *vflip_ctrl;
+	};
+	struct v4l2_ctrl *patgen_ctrl;
+	struct {
+		struct v4l2_ctrl *ae_ctrl;
+		struct v4l2_ctrl *expo_ctrl;
+		struct v4l2_ctrl *again_ctrl;
+		struct v4l2_ctrl *dgain_ctrl;
+	};
+	struct v4l2_ctrl *ae_lock_ctrl;
+	struct v4l2_ctrl *ae_bias_ctrl;
+	struct v4l2_ctrl *led_ctrl;
+	struct v4l2_ctrl *hdr_ctrl;
+};
+
+static inline struct vd55g1 *to_vd55g1(struct v4l2_subdev *sd)
+{
+	return container_of_const(sd, struct vd55g1, sd);
+}
+
+static inline struct v4l2_subdev *ctrl_to_sd(struct v4l2_ctrl *ctrl)
+{
+	return &container_of_const(ctrl->handler, struct vd55g1,
+				   ctrl_handler)->sd;
+}
+
+static u8 get_bpp_by_code(struct vd55g1 *sensor, u32 code)
+{
+	struct i2c_client *client = sensor->i2c_client;
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(vd55g1_mbus_codes); i++) {
+		if (vd55g1_mbus_codes[i].code == code)
+			return vd55g1_mbus_codes[i].bpp;
+	}
+	/* Should never happen */
+	dev_warn(&client->dev, "Unsupported code %d. default to 8 bpp", code);
+	return 8;
+}
+
+static u8 get_data_type_by_code(struct vd55g1 *sensor, u32 code)
+{
+	struct i2c_client *client = sensor->i2c_client;
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(vd55g1_mbus_codes); i++) {
+		if (vd55g1_mbus_codes[i].code == code)
+			return vd55g1_mbus_codes[i].data_type;
+	}
+	/* Should never happen */
+	dev_warn(&client->dev, "Unsupported code %d. default to MIPI_CSI2_DT_RAW8 data type",
+		 code);
+	return MIPI_CSI2_DT_RAW8;
+}
+
+static s32 get_pixel_rate(struct vd55g1 *sensor)
+{
+	struct v4l2_subdev_state *state =
+		v4l2_subdev_get_locked_active_state(&sensor->sd);
+	const struct v4l2_mbus_framefmt *format =
+		v4l2_subdev_state_get_format(state, 0);
+
+	return div64_u64((u64)sensor->data_rate_in_mbps,
+			 get_bpp_by_code(sensor, format->code));
+}
+
+static s32 get_min_line_length(struct vd55g1 *sensor)
+{
+	u32 mipi_req_line_time;
+	u32 mipi_req_line_length;
+	u32 min_line_length;
+	struct v4l2_subdev_state *state =
+		v4l2_subdev_get_locked_active_state(&sensor->sd);
+	const struct v4l2_rect *crop =
+		v4l2_subdev_state_get_crop(state, 0);
+	const struct v4l2_mbus_framefmt *format =
+		v4l2_subdev_state_get_format(state, 0);
+
+	/* MIPI required time */
+	mipi_req_line_time = (crop->width *
+			      get_bpp_by_code(sensor, format->code) +
+			      VD55G1_MIPI_MARGIN) /
+			      (sensor->data_rate_in_mbps / MEGA);
+	mipi_req_line_length = mipi_req_line_time * sensor->pixel_clock /
+			       HZ_PER_MHZ;
+
+	/* Absolute time required for ADCs to convert pixels */
+	min_line_length = VD55G1_LINE_LENGTH_MIN;
+	if (sensor->hdr_ctrl->val == VD55G1_HDR_SUB)
+		min_line_length = VD55G1_LINE_LENGTH_SUB_MIN;
+
+	/* Respect both constraint */
+	return max(min_line_length, mipi_req_line_length);
+}
+
+static unsigned int get_hblank_min(struct vd55g1 *sensor)
+{
+	struct v4l2_subdev_state *state =
+		v4l2_subdev_get_locked_active_state(&sensor->sd);
+	const struct v4l2_rect *crop = v4l2_subdev_state_get_crop(state, 0);
+
+	return get_min_line_length(sensor) - crop->width;
+}
+
+static void get_vblank_limits(struct vd55g1 *sensor,
+			      struct vblank_limits *limits)
+{
+	struct v4l2_subdev_state *state =
+		v4l2_subdev_get_locked_active_state(&sensor->sd);
+	const struct v4l2_rect *crop = v4l2_subdev_state_get_crop(state, 0);
+
+	limits->min = VD55G1_VBLANK_MIN;
+	limits->def = VD55G1_FRAME_LENGTH_DEF - crop->height;
+	limits->max = VD55G1_VBLANK_MAX - crop->height;
+}
+
+#define vd55g1_read(sensor, reg, val, err) \
+	cci_read((sensor)->regmap, reg, val, err)
+
+#define vd55g1_write(sensor, reg, val, err) \
+	cci_write((sensor)->regmap, reg, val, err)
+
+static int vd55g1_write_array(struct vd55g1 *sensor, u32 reg, unsigned int len,
+			      const u8 *array, int *err)
+{
+	unsigned int chunk_sz = 1024;
+	unsigned int sz;
+	int ret = 0;
+
+	if (err && *err)
+		return *err;
+
+	/*
+	 * This loop isn't necessary but in certains conditions (platforms, cpu
+	 * load, etc.) it has been observed that the bulk write could timeout.
+	 */
+	while (len) {
+		sz = min(len, chunk_sz);
+		ret = regmap_bulk_write(sensor->regmap, reg, array, sz);
+		if (ret < 0)
+			goto out;
+		len -= sz;
+		reg += sz;
+		array += sz;
+	}
+
+out:
+	if (ret && err)
+		*err = ret;
+
+	return ret;
+}
+
+static int vd55g1_poll_reg(struct vd55g1 *sensor, u32 reg, u8 poll_val,
+			   int *err)
+{
+	unsigned int val = 0;
+	int ret;
+
+	if (err && *err)
+		return *err;
+
+	ret = regmap_read_poll_timeout(sensor->regmap, CCI_REG_ADDR(reg), val,
+				       (val == poll_val), 2000,
+				       500 * USEC_PER_MSEC);
+
+	if (ret && err)
+		*err = ret;
+
+	return ret;
+}
+
+static int vd55g1_wait_state(struct vd55g1 *sensor, int state, int *err)
+{
+	return vd55g1_poll_reg(sensor, VD55G1_REG_SYSTEM_FSM, state, err);
+}
+
+static int vd55g1_get_regulators(struct vd55g1 *sensor)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(vd55g1_supply_name); i++)
+		sensor->supplies[i].supply = vd55g1_supply_name[i];
+
+	return devm_regulator_bulk_get(&sensor->i2c_client->dev,
+				       ARRAY_SIZE(vd55g1_supply_name),
+				       sensor->supplies);
+}
+
+static int vd55g1_prepare_clock_tree(struct vd55g1 *sensor)
+{
+	struct i2c_client *client = sensor->i2c_client;
+	/* Double data rate */
+	u32 mipi_freq = sensor->link_freq * 2;
+	u32 sys_clk, mipi_div, pixel_div;
+	int ret = 0;
+
+	if (sensor->xclk_freq < 6 * HZ_PER_MHZ ||
+	    sensor->xclk_freq > 27 * HZ_PER_MHZ) {
+		dev_err(&client->dev,
+			"Only 6Mhz-27Mhz clock range supported. Provided %lu MHz\n",
+			sensor->xclk_freq / HZ_PER_MHZ);
+		return -EINVAL;
+	}
+
+	if (mipi_freq < 250 * HZ_PER_MHZ ||
+	    mipi_freq > 1200 * HZ_PER_MHZ) {
+		dev_err(&client->dev,
+			"Only 250Mhz-1200Mhz link frequency range supported. Provided %lu MHz\n",
+			mipi_freq / HZ_PER_MHZ);
+		return -EINVAL;
+	}
+
+	if (mipi_freq <= 300 * HZ_PER_MHZ)
+		mipi_div = 4;
+	else if (mipi_freq <= 600 * HZ_PER_MHZ)
+		mipi_div = 2;
+	else
+		mipi_div = 1;
+
+	sys_clk = mipi_freq * mipi_div;
+
+	if (sys_clk <= 780 * HZ_PER_MHZ)
+		pixel_div = 5;
+	else if (sys_clk <= 900 * HZ_PER_MHZ)
+		pixel_div = 6;
+	else
+		pixel_div = 8;
+
+	sensor->pixel_clock = sys_clk / pixel_div;
+	/* Frequency to data rate is 1:1 ratio for MIPI */
+	sensor->data_rate_in_mbps = mipi_freq;
+
+	return ret;
+}
+
+static int vd55g1_update_patgen(struct vd55g1 *sensor, u32 patgen_index)
+{
+	static const u8 index2val[] = {
+		0x0, 0x22, 0x28
+	};
+	u32 pattern = index2val[patgen_index];
+	u32 reg = pattern << VD55G1_PATGEN_TYPE_SHIFT;
+	u8 duster = VD55G1_DUSTER_RING_ENABLE | VD55G1_DUSTER_DYN_ENABLE |
+		    VD55G1_DUSTER_ENABLE;
+	int ret = 0;
+
+	BUILD_BUG_ON(ARRAY_SIZE(index2val) != ARRAY_SIZE(vd55g1_tp_menu));
+
+	if (pattern != 0) {
+		reg |= VD55G1_PATGEN_ENABLE;
+		/* Take care of duster to not mess up the test pattern output */
+		duster = VD55G1_DUSTER_DISABLE;
+	}
+
+	vd55g1_write(sensor, VD55G1_REG_DUSTER_CTRL, duster, &ret);
+	vd55g1_write(sensor, VD55G1_REG_PATGEN_CTRL, reg, &ret);
+
+	return ret;
+}
+
+static int vd55g1_update_expo_cluster(struct vd55g1 *sensor, bool is_auto)
+{
+	enum vd55g1_expo_state expo_state = is_auto ? VD55G1_EXP_AUTO :
+						      VD55G1_EXP_MANUAL;
+	int ret = 0;
+
+	if (sensor->ae_ctrl->is_new)
+		vd55g1_write(sensor, VD55G1_REG_EXP_MODE(0), expo_state, &ret);
+
+	if (sensor->hdr_ctrl->val == VD55G1_HDR_SUB &&
+	    sensor->hdr_ctrl->is_new) {
+		vd55g1_write(sensor, VD55G1_REG_EXP_MODE(1), VD55G1_EXP_BYPASS,
+			     &ret);
+		if (ret)
+			return ret;
+	}
+
+	if (!is_auto && sensor->expo_ctrl->is_new)
+		vd55g1_write(sensor, VD55G1_REG_MANUAL_COARSE_EXPOSURE,
+			     sensor->expo_ctrl->val, &ret);
+
+	if (!is_auto && sensor->again_ctrl->is_new)
+		vd55g1_write(sensor, VD55G1_REG_MANUAL_ANALOG_GAIN,
+			     sensor->again_ctrl->val, &ret);
+
+	if (!is_auto && sensor->dgain_ctrl->is_new) {
+		vd55g1_write(sensor, VD55G1_REG_MANUAL_DIGITAL_GAIN,
+			     sensor->dgain_ctrl->val, &ret);
+	}
+
+	return ret;
+}
+
+static int vd55g1_lock_exposure(struct vd55g1 *sensor, u32 lock_val)
+{
+	bool ae_lock = lock_val & V4L2_LOCK_EXPOSURE;
+	enum vd55g1_expo_state expo_state = ae_lock ? VD55G1_EXP_FREEZE :
+						      VD55G1_EXP_AUTO;
+	int ret = 0;
+
+	if (sensor->ae_ctrl->val == V4L2_EXPOSURE_AUTO)
+		vd55g1_write(sensor, VD55G1_REG_EXP_MODE(0), expo_state, &ret);
+
+	return ret;
+}
+
+static int vd55g1_read_expo_cluster(struct vd55g1 *sensor)
+{
+	u64 exposure = 0;
+	u64 again = 0;
+	u64 dgain = 0;
+	int ret = 0;
+
+	vd55g1_read(sensor, VD55G1_REG_APPLIED_COARSE_EXPOSURE, &exposure,
+		    &ret);
+	vd55g1_read(sensor, VD55G1_REG_APPLIED_ANALOG_GAIN, &again, &ret);
+	vd55g1_read(sensor, VD55G1_REG_APPLIED_DIGITAL_GAIN, &dgain, &ret);
+	if (ret)
+		return ret;
+
+	sensor->expo_ctrl->cur.val = exposure;
+	sensor->again_ctrl->cur.val = again;
+	sensor->dgain_ctrl->cur.val = dgain;
+
+	return 0;
+}
+
+static int vd55g1_update_frame_length(struct vd55g1 *sensor,
+				      unsigned int frame_length)
+{
+	int ret = 0;
+
+	if (sensor->hdr_ctrl->val == VD55G1_HDR_SUB)
+		vd55g1_write(sensor, VD55G1_REG_FRAME_LENGTH(1), frame_length,
+			     &ret);
+	vd55g1_write(sensor, VD55G1_REG_FRAME_LENGTH(0), frame_length, &ret);
+
+	return ret;
+}
+
+static int vd55g1_update_exposure_target(struct vd55g1 *sensor, int index)
+{
+	/*
+	 * Find auto exposure target with: default target exposure * 2^EV
+	 * Defaut target exposure being 27 for the sensor.
+	 */
+	static const unsigned int index2exposure_target[] = {
+		3, 5, 7, 10, 14, 19, 27, 38, 54, 76, 108, 153, 216,
+	};
+	int exposure_target = index2exposure_target[index];
+
+	return vd55g1_write(sensor, VD55G1_REG_AE_TARGET_PERCENTAGE,
+			    exposure_target, NULL);
+}
+
+static int vd55g1_apply_cold_start(struct vd55g1 *sensor)
+{
+	struct v4l2_subdev_state *state =
+		v4l2_subdev_get_locked_active_state(&sensor->sd);
+	const struct v4l2_rect *crop = v4l2_subdev_state_get_crop(state, 0);
+
+	/*
+	 * Cold start register is a single register expressed as exposure time
+	 * in us. This differ from status registers being a combination of
+	 * exposure, digital gain, and analog gain, requiring the following
+	 * format conversion.
+	 */
+	unsigned int line_length = crop->width + sensor->hblank_ctrl->val;
+	unsigned int line_time_us = DIV_ROUND_UP(line_length * MEGA,
+						 sensor->pixel_clock);
+	u8 d_gain = DIV_ROUND_CLOSEST(sensor->dgain_ctrl->val, 1 << 8);
+	u8 a_gain = DIV_ROUND_CLOSEST(32, (32 - sensor->again_ctrl->val));
+	unsigned int expo_us = sensor->expo_ctrl->val * d_gain * a_gain *
+			       line_time_us;
+	int ret = 0;
+
+	vd55g1_write(sensor, VD55G1_REG_AE_FORCE_COLDSTART, 1, &ret);
+	vd55g1_write(sensor, VD55G1_REG_AE_COLDSTART_EXP_TIME, expo_us, &ret);
+
+	return ret;
+}
+
+static void vd55g1_update_img_pad_format(struct vd55g1 *sensor,
+					 const struct vd55g1_mode *mode,
+					 u32 code,
+					 struct v4l2_mbus_framefmt *fmt)
+{
+	fmt->code = code;
+	fmt->width = mode->width;
+	fmt->height = mode->height;
+	fmt->colorspace = V4L2_COLORSPACE_RAW;
+	fmt->field = V4L2_FIELD_NONE;
+	fmt->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	fmt->quantization = V4L2_QUANTIZATION_DEFAULT;
+	fmt->xfer_func = V4L2_XFER_FUNC_DEFAULT;
+}
+
+static int vd55g1_update_hdr_mode(struct vd55g1 *sensor)
+{
+	int ret = 0;
+
+	switch (sensor->hdr_ctrl->val) {
+	case VD55G1_NO_HDR:
+		vd55g1_write(sensor, VD55G1_REG_EXPOSURE_MAX_COARSE,
+			     VD55G1_EXPOSURE_MAX_COARSE_DEF, &ret);
+		vd55g1_write(sensor, VD55G1_REG_EXPOSURE_USE_CASES, 0, &ret);
+		vd55g1_write(sensor, VD55G1_REG_NEXT_CTX, 0x0, &ret);
+
+		vd55g1_write(sensor, VD55G1_REG_CTX_REPEAT_COUNT_CTX0, 0, &ret);
+
+		vd55g1_write(sensor, VD55G1_REG_VT_MODE(0),
+			     VD55G1_VT_MODE_NORMAL, &ret);
+		vd55g1_write(sensor, VD55G1_REG_MASK_FRAME_CTRL(0),
+			     VD55G1_MASK_FRAME_CTRL_OUTPUT, &ret);
+		break;
+	case VD55G1_HDR_SUB:
+		vd55g1_write(sensor, VD55G1_REG_EXPOSURE_MAX_COARSE,
+			     VD55G1_EXPOSURE_MAX_COARSE_SUB, &ret);
+		vd55g1_write(sensor, VD55G1_REG_EXPOSURE_USE_CASES,
+			     VD55G1_EXPOSURE_USE_CASES_MULTI_CONTEXT, &ret);
+		vd55g1_write(sensor, VD55G1_REG_NEXT_CTX, 0x0001, &ret);
+
+		vd55g1_write(sensor, VD55G1_REG_CTX_REPEAT_COUNT_CTX0, 1, &ret);
+		vd55g1_write(sensor, VD55G1_REG_CTX_REPEAT_COUNT_CTX1, 1, &ret);
+
+		vd55g1_write(sensor, VD55G1_REG_VT_MODE(0),
+			     VD55G1_VT_MODE_NORMAL, &ret);
+		vd55g1_write(sensor, VD55G1_REG_MASK_FRAME_CTRL(0),
+			     VD55G1_MASK_FRAME_CTRL_MASK, &ret);
+		vd55g1_write(sensor, VD55G1_REG_EXPOSURE_INSTANCE(0), 0, &ret);
+		vd55g1_write(sensor, VD55G1_REG_VT_MODE(1),
+			     VD55G1_VT_MODE_SUBTRACTION, &ret);
+		vd55g1_write(sensor, VD55G1_REG_MASK_FRAME_CTRL(1),
+			     VD55G1_MASK_FRAME_CTRL_OUTPUT, &ret);
+		vd55g1_write(sensor, VD55G1_REG_EXPOSURE_INSTANCE(1), 1, &ret);
+		break;
+	default:
+		ret = -EINVAL;
+	}
+
+	return ret;
+}
+
+static int vd55g1_set_framefmt(struct vd55g1 *sensor)
+{
+	struct v4l2_subdev_state *state =
+		v4l2_subdev_get_locked_active_state(&sensor->sd);
+	const struct v4l2_rect *crop =
+		v4l2_subdev_state_get_crop(state, 0);
+	const struct v4l2_mbus_framefmt *format =
+		v4l2_subdev_state_get_format(state, 0);
+	enum vd55g1_bin_mode binning;
+	int ret = 0;
+
+	vd55g1_write(sensor, VD55G1_REG_FORMAT_CTRL,
+		     get_bpp_by_code(sensor, format->code), &ret);
+	vd55g1_write(sensor, VD55G1_REG_OIF_IMG_CTRL,
+		     get_data_type_by_code(sensor, format->code), &ret);
+
+	switch (crop->width / format->width) {
+	case 1:
+	default:
+		binning = VD55G1_BIN_MODE_NORMAL;
+		break;
+	case 2:
+		binning = VD55G1_BIN_MODE_DIGITAL_X2;
+		break;
+	}
+	vd55g1_write(sensor, VD55G1_REG_READOUT_CTRL, binning, &ret);
+
+	vd55g1_write(sensor, VD55G1_REG_X_START(0), crop->left, &ret);
+	vd55g1_write(sensor, VD55G1_REG_X_WIDTH(0), crop->width, &ret);
+	vd55g1_write(sensor, VD55G1_REG_Y_START(0), crop->top, &ret);
+	vd55g1_write(sensor, VD55G1_REG_Y_HEIGHT(0), crop->height, &ret);
+
+	vd55g1_write(sensor, VD55G1_REG_X_START(1), crop->left, &ret);
+	vd55g1_write(sensor, VD55G1_REG_X_WIDTH(1), crop->width, &ret);
+	vd55g1_write(sensor, VD55G1_REG_Y_START(1), crop->top, &ret);
+	vd55g1_write(sensor, VD55G1_REG_Y_HEIGHT(1), crop->height, &ret);
+
+	return ret;
+}
+
+static int vd55g1_update_gpios(struct vd55g1 *sensor, unsigned long gpio_mask)
+{
+	unsigned long io;
+	u32 gpio_val;
+	int ret = 0;
+
+	for_each_set_bit(io, &gpio_mask, VD55G1_NB_GPIOS) {
+		gpio_val = sensor->gpios[io];
+
+		if (gpio_val == VD55G1_GPIO_MODE_STROBE &&
+		    sensor->led_ctrl->val == V4L2_FLASH_LED_MODE_NONE) {
+			gpio_val = VD55G1_GPIO_MODE_IN;
+			if (sensor->hdr_ctrl->val == VD55G1_HDR_SUB) {
+				/* Make its context 1 counterpart strobe too */
+				vd55g1_write(sensor,
+					     VD55G1_REG_GPIO_0_CTRL(1) + io,
+					     gpio_val, &ret);
+			}
+		}
+
+		ret = vd55g1_write(sensor, VD55G1_REG_GPIO_0_CTRL(0) + io,
+				   gpio_val, &ret);
+	}
+
+	return ret;
+}
+
+static int vd55g1_ro_ctrls_setup(struct vd55g1 *sensor)
+{
+	struct v4l2_subdev_state *state =
+		v4l2_subdev_get_locked_active_state(&sensor->sd);
+	const struct v4l2_rect *crop = v4l2_subdev_state_get_crop(state, 0);
+
+	return vd55g1_write(sensor, VD55G1_REG_LINE_LENGTH,
+			    crop->width + sensor->hblank_ctrl->val, NULL);
+}
+
+static void vd55g1_lock_ctrls(struct vd55g1 *sensor, bool enable)
+{
+	/* These settings cannot change during stream */
+	v4l2_ctrl_grab(sensor->hflip_ctrl, enable);
+	v4l2_ctrl_grab(sensor->vflip_ctrl, enable);
+	v4l2_ctrl_grab(sensor->patgen_ctrl, enable);
+	v4l2_ctrl_grab(sensor->hdr_ctrl, enable);
+	v4l2_ctrl_grab(sensor->hblank_ctrl, enable);
+}
+
+static int vd55g1_enable_streams(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state, u32 pad,
+				 u64 streams_mask)
+{
+	struct vd55g1 *sensor = to_vd55g1(sd);
+	struct i2c_client *client = v4l2_get_subdevdata(&sensor->sd);
+	int ret = 0;
+
+	ret = pm_runtime_resume_and_get(&client->dev);
+	if (ret < 0)
+		return ret;
+
+	vd55g1_write(sensor, VD55G1_REG_EXT_CLOCK, sensor->xclk_freq, &ret);
+
+	/* configure output */
+	vd55g1_write(sensor, VD55G1_REG_MIPI_DATA_RATE,
+		     sensor->data_rate_in_mbps, &ret);
+	vd55g1_write(sensor, VD55G1_REG_OIF_CTRL, sensor->oif_ctrl, &ret);
+	vd55g1_write(sensor, VD55G1_REG_ISL_ENABLE, 0, &ret);
+	if (ret)
+		goto err_rpm_put;
+
+	ret = vd55g1_set_framefmt(sensor);
+	if (ret)
+		goto err_rpm_put;
+
+	/* Setup default GPIO values; could be overridden by V4L2 ctrl setup */
+	ret = vd55g1_update_gpios(sensor, GENMASK(VD55G1_NB_GPIOS - 1, 0));
+	if (ret)
+		goto err_rpm_put;
+
+	ret = vd55g1_apply_cold_start(sensor);
+	if (ret)
+		goto err_rpm_put;
+
+	/* Apply settings from V4L2 ctrls */
+	ret = __v4l2_ctrl_handler_setup(&sensor->ctrl_handler);
+	if (ret)
+		goto err_rpm_put;
+
+	/* Also apply settings from read-only V4L2 ctrls */
+	ret = vd55g1_ro_ctrls_setup(sensor);
+	if (ret)
+		goto err_rpm_put;
+
+	/* Start streaming */
+	vd55g1_write(sensor, VD55G1_REG_STBY, VD55G1_STBY_START_STREAM, &ret);
+	vd55g1_poll_reg(sensor, VD55G1_REG_STBY, 0, &ret);
+	vd55g1_wait_state(sensor, VD55G1_SYSTEM_FSM_STREAMING, &ret);
+	if (ret)
+		goto err_rpm_put;
+
+	vd55g1_lock_ctrls(sensor, true);
+
+	return ret;
+
+err_rpm_put:
+	pm_runtime_put(&client->dev);
+	return ret;
+}
+
+static int vd55g1_disable_streams(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state, u32 pad,
+				  u64 streams_mask)
+{
+	struct vd55g1 *sensor = to_vd55g1(sd);
+	struct i2c_client *client = v4l2_get_subdevdata(&sensor->sd);
+	int ret = 0;
+
+	/* Retrieve Expo cluster to enable coldstart of AE */
+	ret = vd55g1_read_expo_cluster(sensor);
+
+	vd55g1_write(sensor, VD55G1_REG_STREAMING, VD55G1_STREAMING_STOP_STREAM,
+		     &ret);
+	vd55g1_poll_reg(sensor, VD55G1_REG_STREAMING, 0, &ret);
+	vd55g1_wait_state(sensor, VD55G1_SYSTEM_FSM_SW_STBY, &ret);
+
+	if (ret)
+		dev_warn(&client->dev, "Can't disable stream");
+
+	vd55g1_lock_ctrls(sensor, false);
+
+	pm_runtime_mark_last_busy(&client->dev);
+	pm_runtime_put_autosuspend(&client->dev);
+
+	return ret;
+}
+
+static int vd55g1_patch(struct vd55g1 *sensor)
+{
+	struct i2c_client *client = sensor->i2c_client;
+	u64 patch;
+	int ret = 0;
+
+	vd55g1_write_array(sensor, VD55G1_REG_FWPATCH_START_ADDR,
+			   sizeof(patch_array), patch_array, &ret);
+	vd55g1_write(sensor, VD55G1_REG_BOOT, VD55G1_BOOT_PATCH_SETUP, &ret);
+	vd55g1_poll_reg(sensor, VD55G1_REG_BOOT, 0, &ret);
+	if (ret) {
+		dev_err(&client->dev, "Failed to apply patch");
+		return ret;
+	}
+
+	vd55g1_read(sensor, VD55G1_REG_FWPATCH_REVISION, &patch, &ret);
+	if (patch != (VD55G1_FWPATCH_REVISION_MAJOR << 8) +
+	    VD55G1_FWPATCH_REVISION_MINOR) {
+		dev_err(&client->dev, "Bad patch version expected %d.%d got %d.%d",
+			VD55G1_FWPATCH_REVISION_MAJOR,
+			VD55G1_FWPATCH_REVISION_MINOR,
+			(u8)(patch >> 8), (u8)(patch & 0xff));
+		return -ENODEV;
+	}
+	dev_dbg(&client->dev, "patch %d.%d applied",
+		(u8)(patch >> 8), (u8)(patch & 0xff));
+
+	return 0;
+}
+
+static int vd55g1_get_selection(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *sd_state,
+				struct v4l2_subdev_selection *sel)
+{
+	const struct v4l2_rect *crop = v4l2_subdev_state_get_crop(sd_state, 0);
+
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP:
+		sel->r = *crop;
+		return 0;
+	case V4L2_SEL_TGT_NATIVE_SIZE:
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		sel->r.top = 0;
+		sel->r.left = 0;
+		sel->r.width = VD55G1_WIDTH;
+		sel->r.height = VD55G1_HEIGHT;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static int vd55g1_enum_mbus_code(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *sd_state,
+				 struct v4l2_subdev_mbus_code_enum *code)
+{
+	if (code->index >= ARRAY_SIZE(vd55g1_mbus_codes))
+		return -EINVAL;
+
+	code->code = vd55g1_mbus_codes[code->index].code;
+
+	return 0;
+}
+
+static int vd55g1_new_format_change_controls(struct vd55g1 *sensor)
+{
+	struct v4l2_subdev_state *state =
+		v4l2_subdev_get_locked_active_state(&sensor->sd);
+	const struct v4l2_rect *crop = v4l2_subdev_state_get_crop(state, 0);
+	struct vblank_limits vblank;
+	unsigned int hblank;
+	unsigned int frame_length = 0;
+	unsigned int expo_max;
+	int ret;
+
+	/* Reset vblank and frame length to default */
+	get_vblank_limits(sensor, &vblank);
+	ret = __v4l2_ctrl_modify_range(sensor->vblank_ctrl, vblank.min,
+				       vblank.max, 1, vblank.def);
+	if (ret)
+		return ret;
+
+	/* Max exposure changes with vblank */
+	frame_length = crop->height + sensor->vblank_ctrl->val;
+	expo_max = frame_length - VD55G1_EXPO_MAX_TERM;
+	ret = __v4l2_ctrl_modify_range(sensor->expo_ctrl, 0, expo_max, 1,
+				       VD55G1_EXPO_DEF);
+	if (ret)
+		return ret;
+
+	/* Update pixel rate to reflect new bpp */
+	ret = __v4l2_ctrl_s_ctrl_int64(sensor->pixel_rate_ctrl,
+				       get_pixel_rate(sensor));
+	if (ret)
+		return ret;
+
+	/* Update hblank according to new width */
+	hblank = get_hblank_min(sensor);
+	ret = __v4l2_ctrl_modify_range(sensor->hblank_ctrl, hblank, hblank, 1,
+				       hblank);
+
+	return ret;
+}
+
+static int vd55g1_set_pad_fmt(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *sd_state,
+			      struct v4l2_subdev_format *sd_fmt)
+{
+	struct vd55g1 *sensor = to_vd55g1(sd);
+	const struct vd55g1_mode *new_mode;
+	struct v4l2_mbus_framefmt *format;
+	struct v4l2_rect pad_crop;
+	unsigned int binning;
+
+	new_mode = v4l2_find_nearest_size(vd55g1_supported_modes,
+					  ARRAY_SIZE(vd55g1_supported_modes),
+					  width, height, sd_fmt->format.width,
+					  sd_fmt->format.height);
+
+	vd55g1_update_img_pad_format(sensor, new_mode, sd_fmt->format.code,
+				     &sd_fmt->format);
+
+	/*
+	 * Use binning to maximize the crop rectangle size, and centre it in the
+	 * sensor.
+	 */
+	binning = min(VD55G1_WIDTH / sd_fmt->format.width,
+		      VD55G1_HEIGHT / sd_fmt->format.height);
+	binning = min(binning, 2U);
+	pad_crop.width = sd_fmt->format.width * binning;
+	pad_crop.height = sd_fmt->format.height * binning;
+	pad_crop.left = (VD55G1_WIDTH - pad_crop.width) / 2;
+	pad_crop.top = (VD55G1_HEIGHT - pad_crop.height) / 2;
+
+	format = v4l2_subdev_state_get_format(sd_state, sd_fmt->pad);
+
+	*format = sd_fmt->format;
+
+	*v4l2_subdev_state_get_crop(sd_state, sd_fmt->pad) = pad_crop;
+	if (sd_fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE)
+		return vd55g1_new_format_change_controls(sensor);
+
+	return 0;
+}
+
+static int vd55g1_init_state(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *sd_state)
+{
+	unsigned int def_mode = VD55G1_DEFAULT_MODE;
+	struct vd55g1 *sensor = to_vd55g1(sd);
+	struct v4l2_subdev_format fmt = { 0 };
+	struct v4l2_subdev_route routes[] = {
+		{ .flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE }
+	};
+	struct v4l2_subdev_krouting routing = {
+	    .num_routes = ARRAY_SIZE(routes),
+	    .routes = routes,
+	};
+	int ret;
+
+	/* Needed by v4l2_subdev_s_stream_helper(), even with 1 stream only */
+	ret = v4l2_subdev_set_routing(sd, sd_state, &routing);
+	if (ret)
+		return ret;
+
+	vd55g1_update_img_pad_format(sensor, &vd55g1_supported_modes[def_mode],
+				     VD55G1_MEDIA_BUS_FMT_DEF, &fmt.format);
+
+	return vd55g1_set_pad_fmt(sd, sd_state, &fmt);
+}
+
+static int vd55g1_enum_frame_size(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *sd_state,
+				  struct v4l2_subdev_frame_size_enum *fse)
+{
+	if (fse->index >= ARRAY_SIZE(vd55g1_supported_modes))
+		return -EINVAL;
+
+	fse->min_width = vd55g1_supported_modes[fse->index].width;
+	fse->max_width = fse->min_width;
+	fse->min_height = vd55g1_supported_modes[fse->index].height;
+	fse->max_height = fse->min_height;
+
+	return 0;
+}
+
+static const struct v4l2_subdev_internal_ops vd55g1_internal_ops = {
+	.init_state = vd55g1_init_state,
+};
+
+static const struct v4l2_subdev_pad_ops vd55g1_pad_ops = {
+	.enum_mbus_code = vd55g1_enum_mbus_code,
+	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = vd55g1_set_pad_fmt,
+	.get_selection = vd55g1_get_selection,
+	.enum_frame_size = vd55g1_enum_frame_size,
+	.enable_streams = vd55g1_enable_streams,
+	.disable_streams = vd55g1_disable_streams,
+};
+
+static const struct v4l2_subdev_video_ops vd55g1_video_ops = {
+	.s_stream = v4l2_subdev_s_stream_helper,
+};
+
+static const struct v4l2_subdev_ops vd55g1_subdev_ops = {
+	.video = &vd55g1_video_ops,
+	.pad = &vd55g1_pad_ops,
+};
+
+static int vd55g1_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
+	struct vd55g1 *sensor = to_vd55g1(sd);
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	int ret = 0;
+
+	/* Interact with HW only when it is powered ON */
+	if (!pm_runtime_get_if_in_use(&client->dev))
+		return 0;
+
+	switch (ctrl->id) {
+	case V4L2_CID_EXPOSURE_AUTO:
+		ret = vd55g1_read_expo_cluster(sensor);
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	pm_runtime_mark_last_busy(&client->dev);
+	pm_runtime_put_autosuspend(&client->dev);
+
+	return ret;
+}
+
+static int vd55g1_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
+	struct vd55g1 *sensor = to_vd55g1(sd);
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	unsigned int frame_length = 0;
+	unsigned int expo_max;
+	unsigned int hblank = get_hblank_min(sensor);
+	bool is_auto = false;
+	struct v4l2_subdev_state *state =
+		v4l2_subdev_get_locked_active_state(&sensor->sd);
+	const struct v4l2_rect *crop = v4l2_subdev_state_get_crop(state, 0);
+	int ret = 0;
+
+	if (ctrl->flags & V4L2_CTRL_FLAG_READ_ONLY)
+		return 0;
+
+	/* Update controls state, range, etc. whatever the state of the HW */
+	switch (ctrl->id) {
+	case V4L2_CID_VBLANK:
+		frame_length = crop->height + ctrl->val;
+		expo_max = frame_length - VD55G1_EXPO_MAX_TERM;
+		ret = __v4l2_ctrl_modify_range(sensor->expo_ctrl, 0, expo_max,
+					       1, VD55G1_EXPO_DEF);
+		break;
+	case V4L2_CID_EXPOSURE_AUTO:
+		is_auto = (ctrl->val == V4L2_EXPOSURE_AUTO);
+		__v4l2_ctrl_grab(sensor->ae_lock_ctrl, !is_auto);
+		__v4l2_ctrl_grab(sensor->ae_bias_ctrl, !is_auto);
+		break;
+	case V4L2_CID_HDR_SENSOR_MODE:
+		/* Discriminate if the userspace changed the control value */
+		if (ctrl->val != ctrl->cur.val) {
+			/* Max horizontal blanking changes with hdr mode */
+			ret = __v4l2_ctrl_modify_range(sensor->hblank_ctrl,
+						       hblank, hblank, 1,
+						       hblank);
+		}
+		break;
+	default:
+		break;
+	}
+
+	/* Don't modify hardware if controls modification failed */
+	if (ret)
+		return ret;
+
+	/* Interact with HW only when it is powered ON */
+	if (!pm_runtime_get_if_in_use(&client->dev))
+		return 0;
+
+	switch (ctrl->id) {
+	case V4L2_CID_HFLIP:
+		ret = vd55g1_write(sensor, VD55G1_REG_ORIENTATION,
+				   sensor->hflip_ctrl->val |
+					   (sensor->vflip_ctrl->val << 1),
+				   NULL);
+		break;
+	case V4L2_CID_TEST_PATTERN:
+		ret = vd55g1_update_patgen(sensor, ctrl->val);
+		break;
+	case V4L2_CID_EXPOSURE_AUTO:
+		ret = vd55g1_update_expo_cluster(sensor, is_auto);
+		break;
+	case V4L2_CID_3A_LOCK:
+		ret = vd55g1_lock_exposure(sensor, ctrl->val);
+		break;
+	case V4L2_CID_AUTO_EXPOSURE_BIAS:
+		/*
+		 * We use auto exposure target percentage register to control
+		 * exposure bias for more precision.
+		 */
+		ret = vd55g1_update_exposure_target(sensor, ctrl->val);
+		break;
+	case V4L2_CID_VBLANK:
+		ret = vd55g1_update_frame_length(sensor, frame_length);
+		break;
+	case V4L2_CID_FLASH_LED_MODE:
+		ret = vd55g1_update_gpios(sensor, sensor->ext_leds_mask);
+		break;
+	case V4L2_CID_HDR_SENSOR_MODE:
+		ret = vd55g1_update_hdr_mode(sensor);
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	pm_runtime_mark_last_busy(&client->dev);
+	pm_runtime_put_autosuspend(&client->dev);
+
+	return ret;
+}
+
+static const struct v4l2_ctrl_ops vd55g1_ctrl_ops = {
+	.g_volatile_ctrl = vd55g1_g_volatile_ctrl,
+	.s_ctrl = vd55g1_s_ctrl,
+};
+
+static int vd55g1_init_ctrls(struct vd55g1 *sensor)
+{
+	const struct v4l2_ctrl_ops *ops = &vd55g1_ctrl_ops;
+	struct v4l2_ctrl_handler *hdl = &sensor->ctrl_handler;
+	struct v4l2_ctrl *ctrl;
+	struct v4l2_fwnode_device_properties fwnode_props;
+	struct vblank_limits vblank;
+	unsigned int hblank;
+	int ret;
+
+	v4l2_ctrl_handler_init(hdl, 16);
+
+	/* Flip cluster */
+	sensor->hflip_ctrl = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HFLIP,
+					       0, 1, 1, 0);
+	sensor->vflip_ctrl = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VFLIP,
+					       0, 1, 1, 0);
+	v4l2_ctrl_cluster(2, &sensor->hflip_ctrl);
+
+	/* Exposition cluster */
+	sensor->ae_ctrl = v4l2_ctrl_new_std_menu(hdl, ops,
+						 V4L2_CID_EXPOSURE_AUTO, 1,
+						 ~0x3, V4L2_EXPOSURE_AUTO);
+	sensor->again_ctrl = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_ANALOGUE_GAIN,
+					       0, 0x1c, 1, VD55G1_AGAIN_DEF);
+	sensor->dgain_ctrl = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_DIGITAL_GAIN,
+					       256, 0xffff, 1,
+					       VD55G1_DGAIN_DEF);
+	sensor->expo_ctrl = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_EXPOSURE, 0,
+					      VD55G1_FRAME_LENGTH_DEF -
+					      VD55G1_EXPO_MAX_TERM,
+					      1, VD55G1_EXPO_DEF);
+	v4l2_ctrl_auto_cluster(4, &sensor->ae_ctrl, V4L2_EXPOSURE_MANUAL, true);
+
+	sensor->patgen_ctrl =
+		v4l2_ctrl_new_std_menu_items(hdl, ops, V4L2_CID_TEST_PATTERN,
+					     ARRAY_SIZE(vd55g1_tp_menu) - 1, 0,
+					     0, vd55g1_tp_menu);
+	ctrl = v4l2_ctrl_new_int_menu(hdl, ops, V4L2_CID_LINK_FREQ,
+				      0, 0, &sensor->link_freq);
+	if (ctrl)
+		ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	sensor->pixel_rate_ctrl = v4l2_ctrl_new_std(hdl, ops,
+						    V4L2_CID_PIXEL_RATE, 1,
+						    INT_MAX, 1,
+						    get_pixel_rate(sensor));
+	if (sensor->pixel_rate_ctrl)
+		sensor->pixel_rate_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	sensor->ae_lock_ctrl = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_3A_LOCK,
+						 0, 1, 0, 0);
+	sensor->ae_bias_ctrl =
+		v4l2_ctrl_new_int_menu(hdl, ops,
+				       V4L2_CID_AUTO_EXPOSURE_BIAS,
+				       ARRAY_SIZE(vd55g1_ev_bias_menu) - 1,
+				       ARRAY_SIZE(vd55g1_ev_bias_menu) / 2,
+				       vd55g1_ev_bias_menu);
+	sensor->hdr_ctrl =
+		v4l2_ctrl_new_std_menu_items(hdl, ops,
+					     V4L2_CID_HDR_SENSOR_MODE,
+					     ARRAY_SIZE(vd55g1_hdr_menu) - 1, 0,
+					     VD55G1_NO_HDR, vd55g1_hdr_menu);
+	hblank = get_hblank_min(sensor);
+	sensor->hblank_ctrl = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HBLANK,
+						hblank, hblank, 1, hblank);
+	if (sensor->hblank_ctrl)
+		sensor->hblank_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	get_vblank_limits(sensor, &vblank);
+	sensor->vblank_ctrl = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VBLANK,
+						vblank.min, vblank.max,
+						1, vblank.def);
+
+	/* Additional controls based on device tree properties */
+	if (sensor->ext_leds_mask) {
+		sensor->led_ctrl =
+			v4l2_ctrl_new_std_menu(hdl, ops,
+					       V4L2_CID_FLASH_LED_MODE,
+					       V4L2_FLASH_LED_MODE_FLASH, 0,
+					       V4L2_FLASH_LED_MODE_NONE);
+	}
+
+	ret = v4l2_fwnode_device_parse(&sensor->i2c_client->dev, &fwnode_props);
+	if (ret)
+		goto free_ctrls;
+
+	ret = v4l2_ctrl_new_fwnode_properties(hdl, ops, &fwnode_props);
+	if (ret)
+		goto free_ctrls;
+
+	sensor->sd.ctrl_handler = hdl;
+	return 0;
+
+free_ctrls:
+	v4l2_ctrl_handler_free(hdl);
+	return ret;
+}
+
+static int vd55g1_check_sensor_revision(struct vd55g1 *sensor)
+{
+	struct i2c_client *client = sensor->i2c_client;
+	u64 device_rev;
+	int ret;
+
+	ret = vd55g1_read(sensor, VD55G1_REG_REVISION, &device_rev, NULL);
+	if (ret)
+		return ret;
+
+	if (device_rev != VD55G1_REVISION_CCB) {
+		dev_err(&client->dev, "Unsupported sensor revision (0x%x)\n",
+			(u16)device_rev);
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
+static int vd55g1_detect(struct vd55g1 *sensor)
+{
+	struct i2c_client *client = sensor->i2c_client;
+	u64 id;
+	int ret;
+
+	ret = vd55g1_read(sensor, VD55G1_REG_MODEL_ID, &id, NULL);
+	if (ret)
+		return ret;
+
+	if (id != VD55G1_MODEL_ID) {
+		dev_warn(&client->dev, "Unsupported sensor id %x", (u32)id);
+		return -ENODEV;
+	}
+
+	return vd55g1_check_sensor_revision(sensor);
+}
+
+static int vd55g1_power_on(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct vd55g1 *sensor = to_vd55g1(sd);
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(vd55g1_supply_name),
+				    sensor->supplies);
+	if (ret) {
+		dev_err(dev, "Failed to enable regulators %d", ret);
+		return ret;
+	}
+
+	ret = clk_prepare_enable(sensor->xclk);
+	if (ret) {
+		dev_err(dev, "Failed to enable clock %d", ret);
+		goto disable_bulk;
+	}
+
+	gpiod_set_value_cansleep(sensor->reset_gpio, 0);
+	usleep_range(5000, 10000);
+	ret = vd55g1_wait_state(sensor, VD55G1_SYSTEM_FSM_READY_TO_BOOT, NULL);
+	if (ret) {
+		dev_err(dev, "Sensor reset failed %d\n", ret);
+		goto disable_clock;
+	}
+
+	ret = vd55g1_detect(sensor);
+	if (ret) {
+		dev_err(dev, "Sensor detect failed %d", ret);
+		goto disable_clock;
+	}
+
+	ret = vd55g1_patch(sensor);
+	if (ret) {
+		dev_err(dev, "Sensor patch failed %d", ret);
+		goto disable_clock;
+	}
+
+	ret = vd55g1_wait_state(sensor, VD55G1_SYSTEM_FSM_SW_STBY, NULL);
+	if (ret) {
+		dev_err(dev, "Sensor waiting after patch failed %d",
+			ret);
+		goto disable_clock;
+	}
+
+	return 0;
+
+disable_clock:
+	gpiod_set_value_cansleep(sensor->reset_gpio, 1);
+	clk_disable_unprepare(sensor->xclk);
+disable_bulk:
+	regulator_bulk_disable(ARRAY_SIZE(vd55g1_supply_name),
+			       sensor->supplies);
+
+	return ret;
+}
+
+static int vd55g1_power_off(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct vd55g1 *sensor = to_vd55g1(sd);
+
+	clk_disable_unprepare(sensor->xclk);
+	gpiod_set_value_cansleep(sensor->reset_gpio, 1);
+	regulator_bulk_disable(ARRAY_SIZE(sensor->supplies), sensor->supplies);
+	return 0;
+}
+
+static int vd55g1_check_csi_conf(struct vd55g1 *sensor,
+				 struct fwnode_handle *endpoint)
+{
+	struct i2c_client *client = sensor->i2c_client;
+	struct v4l2_fwnode_endpoint ep = { .bus_type = V4L2_MBUS_CSI2_DPHY };
+	u8 n_lanes;
+	int ret = 0;
+
+	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &ep);
+	if (ret)
+		return -EINVAL;
+
+	/* Check lanes number */
+	n_lanes = ep.bus.mipi_csi2.num_data_lanes;
+	if (n_lanes != 1) {
+		dev_err(&client->dev, "Sensor only supports 1 lane, found %d\n",
+			n_lanes);
+		ret = -EINVAL;
+		goto done;
+	}
+
+	/* Clock lane must be first */
+	if (ep.bus.mipi_csi2.clock_lane != 0) {
+		dev_err(&client->dev, "Clock lane must be mapped to lane 0\n");
+		ret = -EINVAL;
+		goto done;
+	}
+
+	/* Handle polarities in sensor configuration */
+	sensor->oif_ctrl = (ep.bus.mipi_csi2.lane_polarities[0] << 3) |
+			   (ep.bus.mipi_csi2.lane_polarities[1] << 6);
+
+	/* Check the link frequency set in device tree */
+	if (!ep.nr_of_link_frequencies) {
+		dev_err(&client->dev, "link-frequency property not found in DT\n");
+		ret = -EINVAL;
+		goto done;
+	}
+	if (ep.nr_of_link_frequencies != 1) {
+		dev_err(&client->dev, "Multiple link frequencies not supported\n");
+		ret = -EINVAL;
+		goto done;
+	}
+	sensor->link_freq = ep.link_frequencies[0];
+
+done:
+	v4l2_fwnode_endpoint_free(&ep);
+
+	return ret;
+}
+
+static int vd55g1_parse_dt_gpios_array(struct vd55g1 *sensor,
+				       char *prop_name, u32 *array, int *nb)
+{
+	struct i2c_client *client = sensor->i2c_client;
+	struct device *dev = &client->dev;
+	unsigned int i;
+	int ret;
+
+	*nb = device_property_count_u32(dev, prop_name);
+	if (*nb == -EINVAL) {
+		/* Property not found */
+		*nb = 0;
+		return 0;
+	}
+
+	ret = device_property_read_u32_array(dev, prop_name, array, *nb);
+	if (ret) {
+		dev_err(&client->dev, "Failed to read %s prop\n", prop_name);
+		return ret;
+	}
+	for (i = 0; i < *nb;  i++) {
+		if (array[i] >= VD55G1_NB_GPIOS) {
+			dev_err(&client->dev, "Invalid GPIO number %d\n",
+				array[i]);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+static int vd55g1_parse_dt_gpios(struct vd55g1 *sensor)
+{
+	u32 led_gpios[VD55G1_NB_GPIOS];
+	int nb_gpios_leds;
+	unsigned int i;
+	int ret;
+
+	/* Initialize GPIOs to default */
+	for (i = 0; i < VD55G1_NB_GPIOS; i++)
+		sensor->gpios[i] = VD55G1_GPIO_MODE_IN;
+	sensor->ext_leds_mask = 0;
+
+	/* Take into account optional 'st,leds' output for GPIOs */
+	ret = vd55g1_parse_dt_gpios_array(sensor, "st,leds", led_gpios,
+					  &nb_gpios_leds);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < nb_gpios_leds; i++) {
+		sensor->gpios[led_gpios[i]] = VD55G1_GPIO_MODE_STROBE;
+		set_bit(led_gpios[i], &sensor->ext_leds_mask);
+	}
+
+	return 0;
+}
+
+static int vd55g1_parse_dt(struct vd55g1 *sensor)
+{
+	struct i2c_client *client = sensor->i2c_client;
+	struct device *dev = &client->dev;
+	struct fwnode_handle *endpoint;
+	int ret;
+
+	endpoint = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0, 0);
+	if (!endpoint) {
+		dev_err(dev, "Endpoint node not found\n");
+		return -EINVAL;
+	}
+
+	ret = vd55g1_check_csi_conf(sensor, endpoint);
+	fwnode_handle_put(endpoint);
+	if (ret)
+		return ret;
+
+	return vd55g1_parse_dt_gpios(sensor);
+}
+
+static int vd55g1_subdev_init(struct vd55g1 *sensor)
+{
+	struct i2c_client *client = sensor->i2c_client;
+	int ret;
+
+	/* Init sub device */
+	sensor->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	sensor->sd.internal_ops = &vd55g1_internal_ops;
+
+	/* Init source pad */
+	sensor->pad.flags = MEDIA_PAD_FL_SOURCE;
+	sensor->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
+	ret = media_entity_pads_init(&sensor->sd.entity, 1, &sensor->pad);
+	if (ret) {
+		dev_err(&client->dev, "Failed to init media entity : %d", ret);
+		return ret;
+	}
+
+	sensor->sd.state_lock = sensor->ctrl_handler.lock;
+	ret = v4l2_subdev_init_finalize(&sensor->sd);
+	if (ret) {
+		dev_err(&client->dev, "Subdev init error: %d", ret);
+		goto err_ctrls;
+	}
+
+	/*
+	 * Initiliaze controls after v4l2_subdev_init_finalize() to make sure
+	 * default values are set.
+	 */
+	ret = vd55g1_init_ctrls(sensor);
+	if (ret) {
+		dev_err(&client->dev, "Controls initialization failed %d", ret);
+		goto err_media;
+	}
+
+	return ret;
+
+err_ctrls:
+	v4l2_ctrl_handler_free(sensor->sd.ctrl_handler);
+
+err_media:
+	media_entity_cleanup(&sensor->sd.entity);
+	return ret;
+}
+
+static void vd55g1_subdev_cleanup(struct vd55g1 *sensor)
+{
+	v4l2_async_unregister_subdev(&sensor->sd);
+	v4l2_subdev_cleanup(&sensor->sd);
+	media_entity_cleanup(&sensor->sd.entity);
+	v4l2_ctrl_handler_free(sensor->sd.ctrl_handler);
+}
+
+static int vd55g1_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct vd55g1 *sensor;
+	int ret;
+
+	sensor = devm_kzalloc(dev, sizeof(*sensor), GFP_KERNEL);
+	if (!sensor)
+		return -ENOMEM;
+
+	v4l2_i2c_subdev_init(&sensor->sd, client, &vd55g1_subdev_ops);
+	sensor->i2c_client = client;
+
+	ret = vd55g1_parse_dt(sensor);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to parse Device Tree.");
+
+	/* Get (and check) resources : power regs, ext clock, reset gpio */
+	ret = vd55g1_get_regulators(sensor);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get regulators.");
+
+	sensor->xclk = devm_clk_get(dev, NULL);
+	if (IS_ERR(sensor->xclk))
+		return dev_err_probe(dev, PTR_ERR(sensor->xclk),
+				     "Failed to get xclk.");
+
+	sensor->xclk_freq = clk_get_rate(sensor->xclk);
+	ret = vd55g1_prepare_clock_tree(sensor);
+	if (ret)
+		return ret;
+
+	sensor->reset_gpio = devm_gpiod_get_optional(dev, "reset",
+						     GPIOD_OUT_HIGH);
+	if (IS_ERR(sensor->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(sensor->reset_gpio),
+				     "Failed to get reset gpio.");
+
+	sensor->regmap = devm_cci_regmap_init_i2c(client, 16);
+	if (IS_ERR(sensor->regmap))
+		return dev_err_probe(dev, PTR_ERR(sensor->regmap),
+				     "Failed to init regmap.");
+
+	/* Detect if sensor is present and if its revision is supported */
+	ret = vd55g1_power_on(dev);
+	if (ret)
+		return ret;
+
+	/* Enable pm_runtime and power off the sensor */
+	pm_runtime_set_active(dev);
+	pm_runtime_get_noresume(dev);
+	pm_runtime_enable(dev);
+	pm_runtime_set_autosuspend_delay(dev, 4000);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_mark_last_busy(dev);
+
+	ret = vd55g1_subdev_init(sensor);
+	if (ret) {
+		dev_err(dev, "V4l2 init failed : %d", ret);
+		goto err_power_off;
+	}
+
+	ret = v4l2_async_register_subdev(&sensor->sd);
+	if (ret) {
+		dev_err(dev, "async subdev register failed %d", ret);
+		goto err_subdev;
+	}
+
+	return 0;
+
+err_subdev:
+	vd55g1_subdev_cleanup(sensor);
+err_power_off:
+	pm_runtime_disable(dev);
+	pm_runtime_put_noidle(dev);
+	vd55g1_power_off(dev);
+
+	return ret;
+}
+
+static void vd55g1_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct vd55g1 *sensor = to_vd55g1(sd);
+
+	vd55g1_subdev_cleanup(sensor);
+
+	pm_runtime_disable(&client->dev);
+	if (!pm_runtime_status_suspended(&client->dev))
+		vd55g1_power_off(&client->dev);
+	pm_runtime_set_suspended(&client->dev);
+	pm_runtime_dont_use_autosuspend(&client->dev);
+}
+
+static const struct of_device_id vd55g1_dt_ids[] = {
+	{ .compatible = "st,vd55g1" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, vd55g1_dt_ids);
+
+static const struct dev_pm_ops vd55g1_pm_ops = {
+	SET_RUNTIME_PM_OPS(vd55g1_power_off, vd55g1_power_on, NULL)
+};
+
+static struct i2c_driver vd55g1_i2c_driver = {
+	.driver = {
+		.name  = "vd55g1",
+		.of_match_table = vd55g1_dt_ids,
+		.pm = &vd55g1_pm_ops,
+	},
+	.probe = vd55g1_probe,
+	.remove = vd55g1_remove,
+};
+
+module_i2c_driver(vd55g1_i2c_driver);
+
+MODULE_AUTHOR("Benjamin Mugnier <benjamin.mugnier@foss.st.com>");
+MODULE_AUTHOR("Sylvain Petinot <sylvain.petinot@foss.st.com>");
+MODULE_DESCRIPTION("VD55G1 camera subdev driver");
+MODULE_LICENSE("GPL");

-- 
2.25.1


