Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BE677C5AB2
	for <lists+linux-media@lfdr.de>; Wed, 11 Oct 2023 19:59:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232869AbjJKR7B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Oct 2023 13:59:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376273AbjJKR66 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Oct 2023 13:58:58 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC171B6;
        Wed, 11 Oct 2023 10:58:50 -0700 (PDT)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39BGeDGY011170;
        Wed, 11 Oct 2023 19:58:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding:content-type; s=
        selector1; bh=Nh4eNu2M1cDgzMW8IVTARCFmMQn4hH+glnYfFKEgIpM=; b=xo
        8do6KeZ1Pi+fGvehVbh6SI2h9LbkHeLDeWlb9DhTq4h2oPQh3eilpRRDVb+y9pdt
        hZGF+1qcxgZcbOMR+SjztmLADoY9HjXMJLzam2NttCG1s3FciwwHaWVHk7twDR/k
        bUxh+BgqqSFDDb5x5ehA5yXpbvMFwkWxTIQk6QvgWdCjFOIwtr6VMX1dFa4Qv28X
        CJFs/t0BRNK3ZCZemTtmRvwVn0A6XdH35ba4ptRSZG30H3QswBNUneTGxUBtL9NV
        RITAZtlN6TkHA/X/G4jqVwt9QAqTULJhbJNvm1MvflLWDufEJG15pxi2q5nMWX7m
        vAYAF+S51jn5l60XFOhQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3tnp24k57r-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 11 Oct 2023 19:58:40 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DFEBE100057;
        Wed, 11 Oct 2023 19:58:39 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D6BDB20F2B8;
        Wed, 11 Oct 2023 19:58:39 +0200 (CEST)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 11 Oct
 2023 19:58:39 +0200
From:   Alain Volmat <alain.volmat@foss.st.com>
To:     Alain Volmat <alain.volmat@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
CC:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Rob Herring <robh@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 3/3] media: i2c: gc2145: Galaxy Core GC2145 sensor support
Date:   Wed, 11 Oct 2023 19:57:30 +0200
Message-ID: <20231011175735.1824782-4-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231011175735.1824782-1-alain.volmat@foss.st.com>
References: <20231011175735.1824782-1-alain.volmat@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-11_12,2023-10-11_01,2023-05-22_02
X-Spam-Status: No, score=0.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,PDS_OTHER_BAD_TLD,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Addition of support for the Galaxy Core GC2145 XVGA sensor.
The sensor supports both DVP and CSI-2 interfaces however for
the time being only CSI-2 is implemented.

Configurations is currently based on initialization scripts
coming from Galaxy Core and for that purpose only 3 static
resolutions are supported with static framerates.
 - 640x480 (30fps)
 - 1280x720 (30fps)
 - 1600x1200 (20fps)

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 MAINTAINERS                |    8 +
 drivers/media/i2c/Kconfig  |   10 +
 drivers/media/i2c/Makefile |    1 +
 drivers/media/i2c/gc2145.c | 1440 ++++++++++++++++++++++++++++++++++++
 4 files changed, 1459 insertions(+)
 create mode 100644 drivers/media/i2c/gc2145.c

diff --git a/MAINTAINERS b/MAINTAINERS
index ffff6f61461c..57c7d8703a76 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8600,6 +8600,14 @@ F:	kernel/futex/*
 F:	tools/perf/bench/futex*
 F:	tools/testing/selftests/futex/
 
+GALAXYCORE GC2145 SENSOR DRIVER
+M:	Alain Volmat <alain.volmat@foss.st.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/devicetree/bindings/media/i2c/galaxycore,gc2145.yaml
+F:	drivers/media/i2c/gc2145.c
+
 GATEWORKS SYSTEM CONTROLLER (GSC) DRIVER
 M:	Tim Harvey <tharvey@gateworks.com>
 S:	Maintained
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 74ff833ff48c..fbc934d00448 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -50,6 +50,16 @@ config VIDEO_AR0521
 	  To compile this driver as a module, choose M here: the
 	  module will be called ar0521.
 
+config VIDEO_GC2145
+	select V4L2_CCI_I2C
+	tristate "GalaxyCore GC2145 sensor support"
+	help
+	  This is a V4L2 sensor-level driver for GalaxyCore GC2145
+	  2 Mpixel camera.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called gc2145.
+
 config VIDEO_HI556
 	tristate "Hynix Hi-556 sensor support"
 	help
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index 80b00d39b48f..e74eded89428 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -36,6 +36,7 @@ obj-$(CONFIG_VIDEO_DW9719) += dw9719.o
 obj-$(CONFIG_VIDEO_DW9768) += dw9768.o
 obj-$(CONFIG_VIDEO_DW9807_VCM) += dw9807-vcm.o
 obj-$(CONFIG_VIDEO_ET8EK8) += et8ek8/
+obj-$(CONFIG_VIDEO_GC2145) += gc2145.o
 obj-$(CONFIG_VIDEO_HI556) += hi556.o
 obj-$(CONFIG_VIDEO_HI846) += hi846.o
 obj-$(CONFIG_VIDEO_HI847) += hi847.o
diff --git a/drivers/media/i2c/gc2145.c b/drivers/media/i2c/gc2145.c
new file mode 100644
index 000000000000..8484e5a1ea01
--- /dev/null
+++ b/drivers/media/i2c/gc2145.c
@@ -0,0 +1,1440 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * A V4L2 driver for Galaxycore GC2145 camera.
+ * Copyright (C) 2022, STMicroelectronics SA
+ *
+ * Inspired from the imx219.c driver
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
+
+#include <media/mipi-csi2.h>
+#include <media/v4l2-cci.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-mediabus.h>
+
+/* Chip ID */
+#define GC2145_CHIP_ID		0x2145
+
+/* Page 0 */
+#define GC2145_REG_EXPOSURE	CCI_REG16(0x03)
+#define GC2145_REG_HBLANK	CCI_REG16(0x05)
+#define GC2145_REG_VBLANK	CCI_REG16(0x07)
+#define GC2145_REG_ROW_START	CCI_REG16(0x09)
+#define GC2145_REG_COL_START	CCI_REG16(0x0b)
+#define GC2145_REG_WIN_HEIGHT	CCI_REG16(0x0d)
+#define GC2145_REG_WIN_WIDTH	CCI_REG16(0x0f)
+#define GC2145_REG_ANALOG_MODE1	CCI_REG8(0x17)
+#define GC2145_REG_OUTPUT_FMT	CCI_REG8(0x84)
+#define GC2145_REG_SYNC_MODE	CCI_REG8(0x86)
+#define GC2145_SYNC_MODE_COL_SWITCH	BIT(4)
+#define GC2145_SYNC_MODE_ROW_SWITCH	BIT(5)
+#define GC2145_REG_DEBUG_MODE2	CCI_REG8(0x8c)
+#define GC2145_REG_DEBUG_MODE3	CCI_REG8(0x8d)
+#define GC2145_REG_CROP_ENABLE	CCI_REG8(0x90)
+#define GC2145_REG_CROP_Y	CCI_REG16(0x91)
+#define GC2145_REG_CROP_X	CCI_REG16(0x93)
+#define GC2145_REG_CROP_HEIGHT	CCI_REG16(0x95)
+#define GC2145_REG_CROP_WIDTH	CCI_REG16(0x97)
+#define GC2145_REG_GLOBAL_GAIN	CCI_REG8(0xb0)
+#define GC2145_REG_CHIP_ID	CCI_REG16(0xf0)
+#define GC2145_REG_PAD_IO	CCI_REG8(0xf2)
+#define GC2145_REG_PAGE_SELECT	CCI_REG8(0xfe)
+/* Page 3 */
+#define GC2145_REG_DPHY_ANALOG_MODE1	CCI_REG8(0x01)
+#define GC2145_DPHY_MODE_PHY_CLK_EN	BIT(0)
+#define GC2145_DPHY_MODE_PHY_LANE0_EN	BIT(1)
+#define GC2145_DPHY_MODE_PHY_LANE1_EN	BIT(2)
+#define GC2145_DPHY_MODE_PHY_CLK_LANE_P2S_SEL	BIT(7)
+#define GC2145_REG_DPHY_ANALOG_MODE2	CCI_REG8(0x02)
+#define GC2145_DPHY_CLK_DIFF(a)		((a) & 0x07)
+#define GC2145_DPHY_LANE0_DIFF(a)	(((a) & 0x07) << 4)
+#define GC2145_REG_DPHY_ANALOG_MODE3	CCI_REG8(0x03)
+#define GC2145_DPHY_LANE1_DIFF(a)	((a) & 0x07)
+#define GC2145_DPHY_CLK_DELAY		BIT(4)
+#define GC2145_DPHY_LANE0_DELAY		BIT(5)
+#define GC2145_DPHY_LANE1_DELAY		BIT(6)
+#define GC2145_REG_FIFO_FULL_LVL_LOW	CCI_REG8(0x04)
+#define GC2145_REG_FIFO_FULL_LVL_HIGH	CCI_REG8(0x05)
+#define GC2145_REG_FIFO_MODE		CCI_REG8(0x06)
+#define GC2145_FIFO_MODE_READ_GATE	BIT(3)
+#define GC2145_FIFO_MODE_MIPI_CLK_MODULE	BIT(7)
+#define GC2145_REG_BUF_CSI2_MODE	CCI_REG8(0x10)
+#define GC2145_CSI2_MODE_DOUBLE		BIT(0)
+#define GC2145_CSI2_MODE_RAW8		BIT(2)
+#define GC2145_CSI2_MODE_MIPI_EN	BIT(4)
+#define GC2145_CSI2_MODE_EN		BIT(7)
+#define GC2145_REG_MIPI_DT	CCI_REG8(0x11)
+#define GC2145_REG_LWC_LOW	CCI_REG8(0x12)
+#define GC2145_REG_LWC_HIGH	CCI_REG8(0x13)
+#define GC2145_REG_DPHY_MODE	CCI_REG8(0x15)
+#define GC2145_DPHY_MODE_TRIGGER_PROG	BIT(4)
+#define GC2145_REG_FIFO_GATE_MODE	CCI_REG8(0x17)
+#define GC2145_REG_T_LPX	CCI_REG8(0x21)
+#define GC2145_REG_T_CLK_HS_PREPARE	CCI_REG8(0x22)
+#define GC2145_REG_T_CLK_ZERO	CCI_REG8(0x23)
+#define GC2145_REG_T_CLK_PRE	CCI_REG8(0x24)
+#define GC2145_REG_T_CLK_POST	CCI_REG8(0x25)
+#define GC2145_REG_T_CLK_TRAIL	CCI_REG8(0x26)
+#define GC2145_REG_T_HS_EXIT	CCI_REG8(0x27)
+#define GC2145_REG_T_WAKEUP	CCI_REG8(0x28)
+#define GC2145_REG_T_HS_PREPARE	CCI_REG8(0x29)
+#define GC2145_REG_T_HS_ZERO	CCI_REG8(0x2a)
+#define GC2145_REG_T_HS_TRAIL	CCI_REG8(0x2b)
+
+/* External clock frequency is 24.0MHz */
+#define GC2145_XCLK_FREQ	(24 * HZ_PER_MHZ)
+
+#define GC2145_NATIVE_WIDTH	1616U
+#define GC2145_NATIVE_HEIGHT	1232U
+
+/**
+ * struct gc2145_mode - GC2145 mode description
+ * @width: frame width (in pixel)
+ * @height: frame height (in pixel)
+ * @frame_interval: interval (fractionnal) between 2 frames
+ * @reg_seq: registers config sequence to enter into the mode
+ * @reg_seq_size: size of the sequence
+ * @pixel_rate: pixel_rate associated with the mode
+ * @crop: window area captured
+ */
+struct gc2145_mode {
+	unsigned int width;
+	unsigned int height;
+	struct v4l2_fract frame_interval;
+	const struct cci_reg_sequence *reg_seq;
+	size_t reg_seq_size;
+	unsigned long pixel_rate;
+	struct v4l2_rect crop;
+};
+
+#define GC2145_DEFAULT_EXPOSURE	0x04e2
+#define GC2145_DEFAULT_GLOBAL_GAIN	0x55
+static const struct cci_reg_sequence common_regs[] = {
+	{GC2145_REG_PAGE_SELECT, 0x00},
+	/* SH Delay */
+	{CCI_REG8(0x12), 0x2e},
+	/* Flip */
+	{GC2145_REG_ANALOG_MODE1, 0x14},
+	/* Analog Conf */
+	{CCI_REG8(0x18), 0x22}, {CCI_REG8(0x19), 0x0e}, {CCI_REG8(0x1a), 0x01},
+	{CCI_REG8(0x1b), 0x4b}, {CCI_REG8(0x1c), 0x07}, {CCI_REG8(0x1d), 0x10},
+	{CCI_REG8(0x1e), 0x88}, {CCI_REG8(0x1f), 0x78}, {CCI_REG8(0x20), 0x03},
+	{CCI_REG8(0x21), 0x40}, {CCI_REG8(0x22), 0xa0}, {CCI_REG8(0x24), 0x16},
+	{CCI_REG8(0x25), 0x01}, {CCI_REG8(0x26), 0x10}, {CCI_REG8(0x2d), 0x60},
+	{CCI_REG8(0x30), 0x01}, {CCI_REG8(0x31), 0x90}, {CCI_REG8(0x33), 0x06},
+	{CCI_REG8(0x34), 0x01},
+	/* ISP related */
+	{CCI_REG8(0x80), 0x7f}, {CCI_REG8(0x81), 0x26}, {CCI_REG8(0x82), 0xfa},
+	{CCI_REG8(0x83), 0x00}, {CCI_REG8(0x84), 0x02}, {CCI_REG8(0x86), 0x02},
+	{CCI_REG8(0x88), 0x03}, {CCI_REG8(0x89), 0x03}, {CCI_REG8(0x85), 0x08},
+	{CCI_REG8(0x8a), 0x00}, {CCI_REG8(0x8b), 0x00},
+	{GC2145_REG_GLOBAL_GAIN, GC2145_DEFAULT_GLOBAL_GAIN},
+	{CCI_REG8(0xc3), 0x00}, {CCI_REG8(0xc4), 0x80}, {CCI_REG8(0xc5), 0x90},
+	{CCI_REG8(0xc6), 0x3b}, {CCI_REG8(0xc7), 0x46},
+	/* BLK */
+	{GC2145_REG_PAGE_SELECT, 0x00},
+	{CCI_REG8(0x40), 0x42}, {CCI_REG8(0x41), 0x00}, {CCI_REG8(0x43), 0x5b},
+	{CCI_REG8(0x5e), 0x00}, {CCI_REG8(0x5f), 0x00}, {CCI_REG8(0x60), 0x00},
+	{CCI_REG8(0x61), 0x00}, {CCI_REG8(0x62), 0x00}, {CCI_REG8(0x63), 0x00},
+	{CCI_REG8(0x64), 0x00}, {CCI_REG8(0x65), 0x00}, {CCI_REG8(0x66), 0x20},
+	{CCI_REG8(0x67), 0x20}, {CCI_REG8(0x68), 0x20}, {CCI_REG8(0x69), 0x20},
+	{CCI_REG8(0x76), 0x00}, {CCI_REG8(0x6a), 0x08}, {CCI_REG8(0x6b), 0x08},
+	{CCI_REG8(0x6c), 0x08}, {CCI_REG8(0x6d), 0x08}, {CCI_REG8(0x6e), 0x08},
+	{CCI_REG8(0x6f), 0x08}, {CCI_REG8(0x70), 0x08}, {CCI_REG8(0x71), 0x08},
+	{CCI_REG8(0x76), 0x00}, {CCI_REG8(0x72), 0xf0}, {CCI_REG8(0x7e), 0x3c},
+	{CCI_REG8(0x7f), 0x00},
+	{GC2145_REG_PAGE_SELECT, 0x02},
+	{CCI_REG8(0x48), 0x15}, {CCI_REG8(0x49), 0x00}, {CCI_REG8(0x4b), 0x0b},
+	/* AEC */
+	{GC2145_REG_PAGE_SELECT, 0x00},
+	{GC2145_REG_EXPOSURE, GC2145_DEFAULT_EXPOSURE},
+	{GC2145_REG_PAGE_SELECT, 0x01},
+	{CCI_REG8(0x01), 0x04}, {CCI_REG8(0x02), 0xc0}, {CCI_REG8(0x03), 0x04},
+	{CCI_REG8(0x04), 0x90}, {CCI_REG8(0x05), 0x30}, {CCI_REG8(0x06), 0x90},
+	{CCI_REG8(0x07), 0x30}, {CCI_REG8(0x08), 0x80}, {CCI_REG8(0x09), 0x00},
+	{CCI_REG8(0x0a), 0x82}, {CCI_REG8(0x0b), 0x11}, {CCI_REG8(0x0c), 0x10},
+	{CCI_REG8(0x11), 0x10}, {CCI_REG8(0x13), 0x7b}, {CCI_REG8(0x17), 0x00},
+	{CCI_REG8(0x1c), 0x11}, {CCI_REG8(0x1e), 0x61}, {CCI_REG8(0x1f), 0x35},
+	{CCI_REG8(0x20), 0x40}, {CCI_REG8(0x22), 0x40}, {CCI_REG8(0x23), 0x20},
+	{GC2145_REG_PAGE_SELECT, 0x02},
+	{CCI_REG8(0x0f), 0x04},
+	{GC2145_REG_PAGE_SELECT, 0x01},
+	{CCI_REG8(0x12), 0x35}, {CCI_REG8(0x15), 0xb0}, {CCI_REG8(0x10), 0x31},
+	{CCI_REG8(0x3e), 0x28}, {CCI_REG8(0x3f), 0xb0}, {CCI_REG8(0x40), 0x90},
+	{CCI_REG8(0x41), 0x0f},
+	/* INTPEE */
+	{GC2145_REG_PAGE_SELECT, 0x02},
+	{CCI_REG8(0x90), 0x6c}, {CCI_REG8(0x91), 0x03}, {CCI_REG8(0x92), 0xcb},
+	{CCI_REG8(0x94), 0x33}, {CCI_REG8(0x95), 0x84}, {CCI_REG8(0x97), 0x65},
+	{CCI_REG8(0xa2), 0x11},
+	/* DNDD */
+	{GC2145_REG_PAGE_SELECT, 0x02},
+	{CCI_REG8(0x80), 0xc1}, {CCI_REG8(0x81), 0x08}, {CCI_REG8(0x82), 0x05},
+	{CCI_REG8(0x83), 0x08}, {CCI_REG8(0x84), 0x0a}, {CCI_REG8(0x86), 0xf0},
+	{CCI_REG8(0x87), 0x50}, {CCI_REG8(0x88), 0x15}, {CCI_REG8(0x89), 0xb0},
+	{CCI_REG8(0x8a), 0x30}, {CCI_REG8(0x8b), 0x10},
+	/* ASDE */
+	{GC2145_REG_PAGE_SELECT, 0x01},
+	{CCI_REG8(0x21), 0x04},
+	{GC2145_REG_PAGE_SELECT, 0x02},
+	{CCI_REG8(0xa3), 0x50}, {CCI_REG8(0xa4), 0x20}, {CCI_REG8(0xa5), 0x40},
+	{CCI_REG8(0xa6), 0x80}, {CCI_REG8(0xab), 0x40}, {CCI_REG8(0xae), 0x0c},
+	{CCI_REG8(0xb3), 0x46}, {CCI_REG8(0xb4), 0x64}, {CCI_REG8(0xb6), 0x38},
+	{CCI_REG8(0xb7), 0x01}, {CCI_REG8(0xb9), 0x2b}, {CCI_REG8(0x3c), 0x04},
+	{CCI_REG8(0x3d), 0x15}, {CCI_REG8(0x4b), 0x06}, {CCI_REG8(0x4c), 0x20},
+	/* Gamma */
+	{GC2145_REG_PAGE_SELECT, 0x02},
+	{CCI_REG8(0x10), 0x09}, {CCI_REG8(0x11), 0x0d}, {CCI_REG8(0x12), 0x13},
+	{CCI_REG8(0x13), 0x19}, {CCI_REG8(0x14), 0x27}, {CCI_REG8(0x15), 0x37},
+	{CCI_REG8(0x16), 0x45}, {CCI_REG8(0x17), 0x53}, {CCI_REG8(0x18), 0x69},
+	{CCI_REG8(0x19), 0x7d}, {CCI_REG8(0x1a), 0x8f}, {CCI_REG8(0x1b), 0x9d},
+	{CCI_REG8(0x1c), 0xa9}, {CCI_REG8(0x1d), 0xbd}, {CCI_REG8(0x1e), 0xcd},
+	{CCI_REG8(0x1f), 0xd9}, {CCI_REG8(0x20), 0xe3}, {CCI_REG8(0x21), 0xea},
+	{CCI_REG8(0x22), 0xef}, {CCI_REG8(0x23), 0xf5}, {CCI_REG8(0x24), 0xf9},
+	{CCI_REG8(0x25), 0xff},
+	{GC2145_REG_PAGE_SELECT, 0x00},
+	{CCI_REG8(0xc6), 0x20}, {CCI_REG8(0xc7), 0x2b},
+	/* Gamma 2 */
+	{GC2145_REG_PAGE_SELECT, 0x02},
+	{CCI_REG8(0x26), 0x0f}, {CCI_REG8(0x27), 0x14}, {CCI_REG8(0x28), 0x19},
+	{CCI_REG8(0x29), 0x1e}, {CCI_REG8(0x2a), 0x27}, {CCI_REG8(0x2b), 0x33},
+	{CCI_REG8(0x2c), 0x3b}, {CCI_REG8(0x2d), 0x45}, {CCI_REG8(0x2e), 0x59},
+	{CCI_REG8(0x2f), 0x69}, {CCI_REG8(0x30), 0x7c}, {CCI_REG8(0x31), 0x89},
+	{CCI_REG8(0x32), 0x98}, {CCI_REG8(0x33), 0xae}, {CCI_REG8(0x34), 0xc0},
+	{CCI_REG8(0x35), 0xcf}, {CCI_REG8(0x36), 0xda}, {CCI_REG8(0x37), 0xe2},
+	{CCI_REG8(0x38), 0xe9}, {CCI_REG8(0x39), 0xf3}, {CCI_REG8(0x3a), 0xf9},
+	{CCI_REG8(0x3b), 0xff},
+	/* YCP */
+	{GC2145_REG_PAGE_SELECT, 0x02},
+	{CCI_REG8(0xd1), 0x32}, {CCI_REG8(0xd2), 0x32}, {CCI_REG8(0xd3), 0x40},
+	{CCI_REG8(0xd6), 0xf0}, {CCI_REG8(0xd7), 0x10}, {CCI_REG8(0xd8), 0xda},
+	{CCI_REG8(0xdd), 0x14}, {CCI_REG8(0xde), 0x86}, {CCI_REG8(0xed), 0x80},
+	{CCI_REG8(0xee), 0x00}, {CCI_REG8(0xef), 0x3f}, {CCI_REG8(0xd8), 0xd8},
+	/* ABS */
+	{GC2145_REG_PAGE_SELECT, 0x01},
+	{CCI_REG8(0x9f), 0x40},
+	/* LSC */
+	{GC2145_REG_PAGE_SELECT, 0x01},
+	{CCI_REG8(0xc2), 0x14}, {CCI_REG8(0xc3), 0x0d}, {CCI_REG8(0xc4), 0x0c},
+	{CCI_REG8(0xc8), 0x15}, {CCI_REG8(0xc9), 0x0d}, {CCI_REG8(0xca), 0x0a},
+	{CCI_REG8(0xbc), 0x24}, {CCI_REG8(0xbd), 0x10}, {CCI_REG8(0xbe), 0x0b},
+	{CCI_REG8(0xb6), 0x25}, {CCI_REG8(0xb7), 0x16}, {CCI_REG8(0xb8), 0x15},
+	{CCI_REG8(0xc5), 0x00}, {CCI_REG8(0xc6), 0x00}, {CCI_REG8(0xc7), 0x00},
+	{CCI_REG8(0xcb), 0x00}, {CCI_REG8(0xcc), 0x00}, {CCI_REG8(0xcd), 0x00},
+	{CCI_REG8(0xbf), 0x07}, {CCI_REG8(0xc0), 0x00}, {CCI_REG8(0xc1), 0x00},
+	{CCI_REG8(0xb9), 0x00}, {CCI_REG8(0xba), 0x00}, {CCI_REG8(0xbb), 0x00},
+	{CCI_REG8(0xaa), 0x01}, {CCI_REG8(0xab), 0x01}, {CCI_REG8(0xac), 0x00},
+	{CCI_REG8(0xad), 0x05}, {CCI_REG8(0xae), 0x06}, {CCI_REG8(0xaf), 0x0e},
+	{CCI_REG8(0xb0), 0x0b}, {CCI_REG8(0xb1), 0x07}, {CCI_REG8(0xb2), 0x06},
+	{CCI_REG8(0xb3), 0x17}, {CCI_REG8(0xb4), 0x0e}, {CCI_REG8(0xb5), 0x0e},
+	{CCI_REG8(0xd0), 0x09}, {CCI_REG8(0xd1), 0x00}, {CCI_REG8(0xd2), 0x00},
+	{CCI_REG8(0xd6), 0x08}, {CCI_REG8(0xd7), 0x00}, {CCI_REG8(0xd8), 0x00},
+	{CCI_REG8(0xd9), 0x00}, {CCI_REG8(0xda), 0x00}, {CCI_REG8(0xdb), 0x00},
+	{CCI_REG8(0xd3), 0x0a}, {CCI_REG8(0xd4), 0x00}, {CCI_REG8(0xd5), 0x00},
+	{CCI_REG8(0xa4), 0x00}, {CCI_REG8(0xa5), 0x00}, {CCI_REG8(0xa6), 0x77},
+	{CCI_REG8(0xa7), 0x77}, {CCI_REG8(0xa8), 0x77}, {CCI_REG8(0xa9), 0x77},
+	{CCI_REG8(0xa1), 0x80}, {CCI_REG8(0xa2), 0x80},
+	{GC2145_REG_PAGE_SELECT, 0x01},
+	{CCI_REG8(0xdf), 0x0d}, {CCI_REG8(0xdc), 0x25}, {CCI_REG8(0xdd), 0x30},
+	{CCI_REG8(0xe0), 0x77}, {CCI_REG8(0xe1), 0x80}, {CCI_REG8(0xe2), 0x77},
+	{CCI_REG8(0xe3), 0x90}, {CCI_REG8(0xe6), 0x90}, {CCI_REG8(0xe7), 0xa0},
+	{CCI_REG8(0xe8), 0x90}, {CCI_REG8(0xe9), 0xa0},
+	/* AWB */
+	/* measure window */
+	{GC2145_REG_PAGE_SELECT, 0x00},
+	{CCI_REG8(0xec), 0x06}, {CCI_REG8(0xed), 0x04}, {CCI_REG8(0xee), 0x60},
+	{CCI_REG8(0xef), 0x90}, {CCI_REG8(0xb6), 0x01},
+	{GC2145_REG_PAGE_SELECT, 0x01},
+	{CCI_REG8(0x4f), 0x00}, {CCI_REG8(0x4f), 0x00}, {CCI_REG8(0x4b), 0x01},
+	{CCI_REG8(0x4f), 0x00},
+	{CCI_REG8(0x4c), 0x01}, {CCI_REG8(0x4d), 0x71}, {CCI_REG8(0x4e), 0x01},
+	{CCI_REG8(0x4c), 0x01}, {CCI_REG8(0x4d), 0x91}, {CCI_REG8(0x4e), 0x01},
+	{CCI_REG8(0x4c), 0x01}, {CCI_REG8(0x4d), 0x70}, {CCI_REG8(0x4e), 0x01},
+	{CCI_REG8(0x4c), 0x01}, {CCI_REG8(0x4d), 0x90}, {CCI_REG8(0x4e), 0x02},
+	{CCI_REG8(0x4c), 0x01}, {CCI_REG8(0x4d), 0xb0}, {CCI_REG8(0x4e), 0x02},
+	{CCI_REG8(0x4c), 0x01}, {CCI_REG8(0x4d), 0x8f}, {CCI_REG8(0x4e), 0x02},
+	{CCI_REG8(0x4c), 0x01}, {CCI_REG8(0x4d), 0x6f}, {CCI_REG8(0x4e), 0x02},
+	{CCI_REG8(0x4c), 0x01}, {CCI_REG8(0x4d), 0xaf}, {CCI_REG8(0x4e), 0x02},
+	{CCI_REG8(0x4c), 0x01}, {CCI_REG8(0x4d), 0xd0}, {CCI_REG8(0x4e), 0x02},
+	{CCI_REG8(0x4c), 0x01}, {CCI_REG8(0x4d), 0xf0}, {CCI_REG8(0x4e), 0x02},
+	{CCI_REG8(0x4c), 0x01}, {CCI_REG8(0x4d), 0xcf}, {CCI_REG8(0x4e), 0x02},
+	{CCI_REG8(0x4c), 0x01}, {CCI_REG8(0x4d), 0xef}, {CCI_REG8(0x4e), 0x02},
+	{CCI_REG8(0x4c), 0x01}, {CCI_REG8(0x4d), 0x6e}, {CCI_REG8(0x4e), 0x03},
+	{CCI_REG8(0x4c), 0x01}, {CCI_REG8(0x4d), 0x8e}, {CCI_REG8(0x4e), 0x03},
+	{CCI_REG8(0x4c), 0x01}, {CCI_REG8(0x4d), 0xae}, {CCI_REG8(0x4e), 0x03},
+	{CCI_REG8(0x4c), 0x01}, {CCI_REG8(0x4d), 0xce}, {CCI_REG8(0x4e), 0x03},
+	{CCI_REG8(0x4c), 0x01}, {CCI_REG8(0x4d), 0x4d}, {CCI_REG8(0x4e), 0x03},
+	{CCI_REG8(0x4c), 0x01}, {CCI_REG8(0x4d), 0x6d}, {CCI_REG8(0x4e), 0x03},
+	{CCI_REG8(0x4c), 0x01}, {CCI_REG8(0x4d), 0x8d}, {CCI_REG8(0x4e), 0x03},
+	{CCI_REG8(0x4c), 0x01}, {CCI_REG8(0x4d), 0xad}, {CCI_REG8(0x4e), 0x03},
+	{CCI_REG8(0x4c), 0x01}, {CCI_REG8(0x4d), 0xcd}, {CCI_REG8(0x4e), 0x03},
+	{CCI_REG8(0x4c), 0x01}, {CCI_REG8(0x4d), 0x4c}, {CCI_REG8(0x4e), 0x03},
+	{CCI_REG8(0x4c), 0x01}, {CCI_REG8(0x4d), 0x6c}, {CCI_REG8(0x4e), 0x03},
+	{CCI_REG8(0x4c), 0x01}, {CCI_REG8(0x4d), 0x8c}, {CCI_REG8(0x4e), 0x03},
+	{CCI_REG8(0x4c), 0x01}, {CCI_REG8(0x4d), 0xac}, {CCI_REG8(0x4e), 0x03},
+	{CCI_REG8(0x4c), 0x01}, {CCI_REG8(0x4d), 0xcc}, {CCI_REG8(0x4e), 0x03},
+	{CCI_REG8(0x4c), 0x01}, {CCI_REG8(0x4d), 0xcb}, {CCI_REG8(0x4e), 0x03},
+	{CCI_REG8(0x4c), 0x01}, {CCI_REG8(0x4d), 0x4b}, {CCI_REG8(0x4e), 0x03},
+	{CCI_REG8(0x4c), 0x01}, {CCI_REG8(0x4d), 0x6b}, {CCI_REG8(0x4e), 0x03},
+	{CCI_REG8(0x4c), 0x01}, {CCI_REG8(0x4d), 0x8b}, {CCI_REG8(0x4e), 0x03},
+	{CCI_REG8(0x4c), 0x01}, {CCI_REG8(0x4d), 0xab}, {CCI_REG8(0x4e), 0x03},
+	{CCI_REG8(0x4c), 0x01}, {CCI_REG8(0x4d), 0x8a}, {CCI_REG8(0x4e), 0x04},
+	{CCI_REG8(0x4c), 0x01}, {CCI_REG8(0x4d), 0xaa}, {CCI_REG8(0x4e), 0x04},
+	{CCI_REG8(0x4c), 0x01}, {CCI_REG8(0x4d), 0xca}, {CCI_REG8(0x4e), 0x04},
+	{CCI_REG8(0x4c), 0x01}, {CCI_REG8(0x4d), 0xca}, {CCI_REG8(0x4e), 0x04},
+	{CCI_REG8(0x4c), 0x01}, {CCI_REG8(0x4d), 0xc9}, {CCI_REG8(0x4e), 0x04},
+	{CCI_REG8(0x4c), 0x01}, {CCI_REG8(0x4d), 0x8a}, {CCI_REG8(0x4e), 0x04},
+	{CCI_REG8(0x4c), 0x01}, {CCI_REG8(0x4d), 0x89}, {CCI_REG8(0x4e), 0x04},
+	{CCI_REG8(0x4c), 0x01}, {CCI_REG8(0x4d), 0xa9}, {CCI_REG8(0x4e), 0x04},
+	{CCI_REG8(0x4c), 0x02}, {CCI_REG8(0x4d), 0x0b}, {CCI_REG8(0x4e), 0x05},
+	{CCI_REG8(0x4c), 0x02}, {CCI_REG8(0x4d), 0x0a}, {CCI_REG8(0x4e), 0x05},
+	{CCI_REG8(0x4c), 0x01}, {CCI_REG8(0x4d), 0xeb}, {CCI_REG8(0x4e), 0x05},
+	{CCI_REG8(0x4c), 0x01}, {CCI_REG8(0x4d), 0xea}, {CCI_REG8(0x4e), 0x05},
+	{CCI_REG8(0x4c), 0x02}, {CCI_REG8(0x4d), 0x09}, {CCI_REG8(0x4e), 0x05},
+	{CCI_REG8(0x4c), 0x02}, {CCI_REG8(0x4d), 0x29}, {CCI_REG8(0x4e), 0x05},
+	{CCI_REG8(0x4c), 0x02}, {CCI_REG8(0x4d), 0x2a}, {CCI_REG8(0x4e), 0x05},
+	{CCI_REG8(0x4c), 0x02}, {CCI_REG8(0x4d), 0x4a}, {CCI_REG8(0x4e), 0x05},
+	{CCI_REG8(0x4c), 0x02}, {CCI_REG8(0x4d), 0x8a}, {CCI_REG8(0x4e), 0x06},
+	{CCI_REG8(0x4c), 0x02}, {CCI_REG8(0x4d), 0x49}, {CCI_REG8(0x4e), 0x06},
+	{CCI_REG8(0x4c), 0x02}, {CCI_REG8(0x4d), 0x69}, {CCI_REG8(0x4e), 0x06},
+	{CCI_REG8(0x4c), 0x02}, {CCI_REG8(0x4d), 0x89}, {CCI_REG8(0x4e), 0x06},
+	{CCI_REG8(0x4c), 0x02}, {CCI_REG8(0x4d), 0xa9}, {CCI_REG8(0x4e), 0x06},
+	{CCI_REG8(0x4c), 0x02}, {CCI_REG8(0x4d), 0x48}, {CCI_REG8(0x4e), 0x06},
+	{CCI_REG8(0x4c), 0x02}, {CCI_REG8(0x4d), 0x68}, {CCI_REG8(0x4e), 0x06},
+	{CCI_REG8(0x4c), 0x02}, {CCI_REG8(0x4d), 0x69}, {CCI_REG8(0x4e), 0x06},
+	{CCI_REG8(0x4c), 0x02}, {CCI_REG8(0x4d), 0xca}, {CCI_REG8(0x4e), 0x07},
+	{CCI_REG8(0x4c), 0x02}, {CCI_REG8(0x4d), 0xc9}, {CCI_REG8(0x4e), 0x07},
+	{CCI_REG8(0x4c), 0x02}, {CCI_REG8(0x4d), 0xe9}, {CCI_REG8(0x4e), 0x07},
+	{CCI_REG8(0x4c), 0x03}, {CCI_REG8(0x4d), 0x09}, {CCI_REG8(0x4e), 0x07},
+	{CCI_REG8(0x4c), 0x02}, {CCI_REG8(0x4d), 0xc8}, {CCI_REG8(0x4e), 0x07},
+	{CCI_REG8(0x4c), 0x02}, {CCI_REG8(0x4d), 0xe8}, {CCI_REG8(0x4e), 0x07},
+	{CCI_REG8(0x4c), 0x02}, {CCI_REG8(0x4d), 0xa7}, {CCI_REG8(0x4e), 0x07},
+	{CCI_REG8(0x4c), 0x02}, {CCI_REG8(0x4d), 0xc7}, {CCI_REG8(0x4e), 0x07},
+	{CCI_REG8(0x4c), 0x02}, {CCI_REG8(0x4d), 0xe7}, {CCI_REG8(0x4e), 0x07},
+	{CCI_REG8(0x4c), 0x03}, {CCI_REG8(0x4d), 0x07}, {CCI_REG8(0x4e), 0x07},
+	{CCI_REG8(0x4f), 0x01},
+	{CCI_REG8(0x50), 0x80}, {CCI_REG8(0x51), 0xa8}, {CCI_REG8(0x52), 0x47},
+	{CCI_REG8(0x53), 0x38}, {CCI_REG8(0x54), 0xc7}, {CCI_REG8(0x56), 0x0e},
+	{CCI_REG8(0x58), 0x08}, {CCI_REG8(0x5b), 0x00}, {CCI_REG8(0x5c), 0x74},
+	{CCI_REG8(0x5d), 0x8b}, {CCI_REG8(0x61), 0xdb}, {CCI_REG8(0x62), 0xb8},
+	{CCI_REG8(0x63), 0x86}, {CCI_REG8(0x64), 0xc0}, {CCI_REG8(0x65), 0x04},
+	{CCI_REG8(0x67), 0xa8}, {CCI_REG8(0x68), 0xb0}, {CCI_REG8(0x69), 0x00},
+	{CCI_REG8(0x6a), 0xa8}, {CCI_REG8(0x6b), 0xb0}, {CCI_REG8(0x6c), 0xaf},
+	{CCI_REG8(0x6d), 0x8b}, {CCI_REG8(0x6e), 0x50}, {CCI_REG8(0x6f), 0x18},
+	{CCI_REG8(0x73), 0xf0}, {CCI_REG8(0x70), 0x0d}, {CCI_REG8(0x71), 0x60},
+	{CCI_REG8(0x72), 0x80}, {CCI_REG8(0x74), 0x01}, {CCI_REG8(0x75), 0x01},
+	{CCI_REG8(0x7f), 0x0c}, {CCI_REG8(0x76), 0x70}, {CCI_REG8(0x77), 0x58},
+	{CCI_REG8(0x78), 0xa0}, {CCI_REG8(0x79), 0x5e}, {CCI_REG8(0x7a), 0x54},
+	{CCI_REG8(0x7b), 0x58},
+	/* CC */
+	{GC2145_REG_PAGE_SELECT, 0x02},
+	{CCI_REG8(0xc0), 0x01}, {CCI_REG8(0xc1), 0x44}, {CCI_REG8(0xc2), 0xfd},
+	{CCI_REG8(0xc3), 0x04}, {CCI_REG8(0xc4), 0xf0}, {CCI_REG8(0xc5), 0x48},
+	{CCI_REG8(0xc6), 0xfd}, {CCI_REG8(0xc7), 0x46}, {CCI_REG8(0xc8), 0xfd},
+	{CCI_REG8(0xc9), 0x02}, {CCI_REG8(0xca), 0xe0}, {CCI_REG8(0xcb), 0x45},
+	{CCI_REG8(0xcc), 0xec}, {CCI_REG8(0xcd), 0x48}, {CCI_REG8(0xce), 0xf0},
+	{CCI_REG8(0xcf), 0xf0}, {CCI_REG8(0xe3), 0x0c}, {CCI_REG8(0xe4), 0x4b},
+	{CCI_REG8(0xe5), 0xe0},
+	/* ABS */
+	{GC2145_REG_PAGE_SELECT, 0x01},
+	{CCI_REG8(0x9f), 0x40},
+	/* Dark sun */
+	{GC2145_REG_PAGE_SELECT, 0x02},
+	{CCI_REG8(0x40), 0xbf}, {CCI_REG8(0x46), 0xcf},
+};
+
+#define GC2145_640_480_PIXELRATE	(60 * HZ_PER_MHZ)
+#define GC2145_640_480_HBLANK		0x0130
+#define GC2145_640_480_VBLANK		0x000c
+static const struct cci_reg_sequence mode_640_480_regs[] = {
+	{GC2145_REG_PAGE_SELECT, 0xf0}, {GC2145_REG_PAGE_SELECT, 0xf0},
+	{GC2145_REG_PAGE_SELECT, 0xf0}, {CCI_REG8(0xfc), 0x06},
+	{CCI_REG8(0xf6), 0x00}, {CCI_REG8(0xf7), 0x1d}, {CCI_REG8(0xf8), 0x86},
+	{CCI_REG8(0xfa), 0x00}, {CCI_REG8(0xf9), 0x8e},
+	/* Disable PAD IO */
+	{GC2145_REG_PAD_IO, 0x00},
+	{GC2145_REG_PAGE_SELECT, 0x00},
+	/* Row/Col start - 0/0 */
+	{GC2145_REG_ROW_START, 0x0000},
+	{GC2145_REG_COL_START, 0x0000},
+	/* Window size 1216/1618 */
+	{GC2145_REG_WIN_HEIGHT, 0x04c0},
+	{GC2145_REG_WIN_WIDTH, 0x0652},
+	/* Scalar more */
+	{CCI_REG8(0xfd), 0x01}, {CCI_REG8(0xfa), 0x00},
+	/* Crop 640-480@0-0 */
+	{GC2145_REG_CROP_ENABLE, 0x01},
+	{GC2145_REG_CROP_Y, 0x0000},
+	{GC2145_REG_CROP_X, 0x0000},
+	{GC2145_REG_CROP_HEIGHT, 0x01e0},
+	{GC2145_REG_CROP_WIDTH, 0x0280},
+	/* Subsampling configuration */
+	{CCI_REG8(0x99), 0x55}, {CCI_REG8(0x9a), 0x06}, {CCI_REG8(0x9b), 0x01},
+	{CCI_REG8(0x9c), 0x23}, {CCI_REG8(0x9d), 0x00}, {CCI_REG8(0x9e), 0x00},
+	{CCI_REG8(0x9f), 0x01}, {CCI_REG8(0xa0), 0x23}, {CCI_REG8(0xa1), 0x00},
+	{CCI_REG8(0xa2), 0x00},
+	/* Framerate */
+	{GC2145_REG_PAGE_SELECT, 0x00},
+	{GC2145_REG_HBLANK, GC2145_640_480_HBLANK},
+	{GC2145_REG_VBLANK, GC2145_640_480_VBLANK},
+	{GC2145_REG_PAGE_SELECT, 0x01},
+	/* AEC anti-flicker */
+	{CCI_REG16(0x25), 0x0175},
+	/* AEC exposure level 1-5 */
+	{CCI_REG16(0x27), 0x045f}, {CCI_REG16(0x29), 0x045f},
+	{CCI_REG16(0x2b), 0x045f}, {CCI_REG16(0x2d), 0x045f},
+};
+
+#define GC2145_1280_720_PIXELRATE	(96 * HZ_PER_MHZ)
+#define GC2145_1280_720_HBLANK		0x0156
+#define GC2145_1280_720_VBLANK		0x0011
+static const struct cci_reg_sequence mode_1280_720_regs[] = {
+	{GC2145_REG_PAGE_SELECT, 0xf0}, {GC2145_REG_PAGE_SELECT, 0xf0},
+	{GC2145_REG_PAGE_SELECT, 0xf0}, {CCI_REG8(0xfc), 0x06},
+	{CCI_REG8(0xf6), 0x00}, {CCI_REG8(0xf7), 0x1d}, {CCI_REG8(0xf8), 0x83},
+	{CCI_REG8(0xfa), 0x00}, {CCI_REG8(0xf9), 0x8e},
+	/* Disable PAD IO */
+	{GC2145_REG_PAD_IO, 0x00},
+	{GC2145_REG_PAGE_SELECT, 0x00},
+	/* Row/Col start - 240/160 */
+	{GC2145_REG_ROW_START, 0x00f0},
+	{GC2145_REG_COL_START, 0x00a0},
+	/* Window size 736/1296 */
+	{GC2145_REG_WIN_HEIGHT, 0x02e0},
+	{GC2145_REG_WIN_WIDTH, 0x0510},
+	/* Crop 1280-720@0-0 */
+	{GC2145_REG_CROP_ENABLE, 0x01},
+	{GC2145_REG_CROP_Y, 0x0000},
+	{GC2145_REG_CROP_X, 0x0000},
+	{GC2145_REG_CROP_HEIGHT, 0x02d0},
+	{GC2145_REG_CROP_WIDTH, 0x0500},
+	/* Framerate */
+	{GC2145_REG_PAGE_SELECT, 0x00},
+	{GC2145_REG_HBLANK, GC2145_1280_720_HBLANK},
+	{GC2145_REG_VBLANK, GC2145_1280_720_VBLANK},
+	{GC2145_REG_PAGE_SELECT, 0x01},
+	/* AEC anti-flicker */
+	{CCI_REG16(0x25), 0x00e6},
+	/* AEC exposure level 1-5 */
+	{CCI_REG16(0x27), 0x02b2}, {CCI_REG16(0x29), 0x02b2},
+	{CCI_REG16(0x2b), 0x02b2}, {CCI_REG16(0x2d), 0x02b2},
+};
+
+#define GC2145_1600_1200_PIXELRATE	(72 * HZ_PER_MHZ)
+#define GC2145_1600_1200_HBLANK		0x0156
+#define GC2145_1600_1200_VBLANK		0x0010
+static const struct cci_reg_sequence mode_1600_1200_regs[] = {
+	{GC2145_REG_PAGE_SELECT, 0xf0}, {GC2145_REG_PAGE_SELECT, 0xf0},
+	{GC2145_REG_PAGE_SELECT, 0xf0}, {CCI_REG8(0xfc), 0x06},
+	{CCI_REG8(0xf6), 0x00}, {CCI_REG8(0xf7), 0x1d}, {CCI_REG8(0xf8), 0x84},
+	{CCI_REG8(0xfa), 0x00}, {CCI_REG8(0xf9), 0x8e},
+	/* Disable PAD IO */
+	{GC2145_REG_PAD_IO, 0x00},
+	{GC2145_REG_PAGE_SELECT, 0x00},
+	/* Row/Col start - 0/0 */
+	{GC2145_REG_ROW_START, 0x0000},
+	{GC2145_REG_COL_START, 0x0000},
+	/* Window size: 1216/1618 */
+	{GC2145_REG_WIN_HEIGHT, 0x04c0},
+	{GC2145_REG_WIN_WIDTH, 0x0652},
+	/* Crop 1600-1200@0-0 */
+	{GC2145_REG_CROP_ENABLE, 0x01},
+	{GC2145_REG_CROP_Y, 0x0000},
+	{GC2145_REG_CROP_X, 0x0000},
+	{GC2145_REG_CROP_HEIGHT, 0x04b0},
+	{GC2145_REG_CROP_WIDTH, 0x0640},
+	/* Framerate */
+	{GC2145_REG_PAGE_SELECT, 0x00},
+	{GC2145_REG_HBLANK, GC2145_1600_1200_HBLANK},
+	{GC2145_REG_VBLANK, GC2145_1600_1200_VBLANK},
+	{GC2145_REG_PAGE_SELECT, 0x01},
+	/* AEC anti-flicker */
+	{CCI_REG16(0x25), 0x00fa},
+	/* AEC exposure level 1-5 */
+	{CCI_REG16(0x27), 0x04e2}, {CCI_REG16(0x29), 0x04e2},
+	{CCI_REG16(0x2b), 0x04e2}, {CCI_REG16(0x2d), 0x04e2},
+};
+
+/* Regulators supplies */
+static const char * const gc2145_supply_name[] = {
+	"iovdd", /* Digital I/O (1.7-3V) suppply */
+	"avdd",  /* Analog (2.7-3V) supply */
+	"dvdd",  /* Digital Core (1.7-1.9V) supply */
+};
+
+#define GC2145_NUM_SUPPLIES ARRAY_SIZE(gc2145_supply_name)
+
+/* Mode configs */
+#define GC2145_MODE_640X480	0
+#define GC2145_MODE_1280X720	1
+#define GC2145_MODE_1600X1200	2
+static const struct gc2145_mode supported_modes[] = {
+	{
+		/* 640x480 30fps mode */
+		.width = 640,
+		.height = 480,
+		.frame_interval = {
+			.numerator = 1,
+			.denominator = 30,
+		},
+		.reg_seq = mode_640_480_regs,
+		.reg_seq_size = ARRAY_SIZE(mode_640_480_regs),
+		.pixel_rate = GC2145_640_480_PIXELRATE,
+		.crop = {
+			.top = 0,
+			.left = 0,
+			.width = 640,
+			.height = 480,
+		},
+	},
+	{
+		/* 1280x720 30fps mode */
+		.width = 1280,
+		.height = 720,
+		.frame_interval = {
+			.numerator = 1,
+			.denominator = 30,
+		},
+		.reg_seq = mode_1280_720_regs,
+		.reg_seq_size = ARRAY_SIZE(mode_1280_720_regs),
+		.pixel_rate = GC2145_1280_720_PIXELRATE,
+		.crop = {
+			.top = 160,
+			.left = 240,
+			.width = 1280,
+			.height = 720,
+		},
+	},
+	{
+		/* 1600x1200 20fps mode */
+		.width = 1600,
+		.height = 1200,
+		.frame_interval = {
+			.numerator = 1,
+			.denominator = 20,
+		},
+		.reg_seq = mode_1600_1200_regs,
+		.reg_seq_size = ARRAY_SIZE(mode_1600_1200_regs),
+		.pixel_rate = GC2145_1600_1200_PIXELRATE,
+		.crop = {
+			.top = 0,
+			.left = 0,
+			.width = 1600,
+			.height = 1200,
+		},
+	},
+};
+
+/**
+ * struct gc2145_format - GC2145 pixel format description
+ * @code: media bus (MBUS) associated code
+ * @colorspace: V4L2 colospace
+ * @datatype: MIPI CSI2 data type
+ * @output_fmt: GC2145 output format
+ */
+struct gc2145_format {
+	unsigned int code;
+	unsigned int colorspace;
+	unsigned char datatype;
+	unsigned char output_fmt;
+};
+
+/* All supported formats */
+static const struct gc2145_format supported_formats[] = {
+	{
+		.code		= MEDIA_BUS_FMT_UYVY8_2X8,
+		.colorspace	= V4L2_COLORSPACE_SRGB,
+		.datatype	= MIPI_CSI2_DT_YUV422_8B,
+		.output_fmt	= 0x00,
+	},
+	{
+		.code		= MEDIA_BUS_FMT_VYUY8_2X8,
+		.colorspace	= V4L2_COLORSPACE_SRGB,
+		.datatype	= MIPI_CSI2_DT_YUV422_8B,
+		.output_fmt	= 0x01,
+	},
+	{
+		.code		= MEDIA_BUS_FMT_YUYV8_2X8,
+		.colorspace	= V4L2_COLORSPACE_SRGB,
+		.datatype	= MIPI_CSI2_DT_YUV422_8B,
+		.output_fmt	= 0x02,
+	},
+	{
+		.code		= MEDIA_BUS_FMT_YVYU8_2X8,
+		.colorspace	= V4L2_COLORSPACE_SRGB,
+		.datatype	= MIPI_CSI2_DT_YUV422_8B,
+		.output_fmt	= 0x03,
+	},
+	{
+		.code		= MEDIA_BUS_FMT_RGB565_2X8_BE,
+		.colorspace	= V4L2_COLORSPACE_SRGB,
+		.datatype	= MIPI_CSI2_DT_RGB565,
+		.output_fmt	= 0x06,
+	},
+};
+
+struct gc2145_ctrls {
+	struct v4l2_ctrl_handler handler;
+	struct v4l2_ctrl *pixel_rate;
+	struct v4l2_ctrl *test_pattern;
+	struct v4l2_ctrl *hflip;
+	struct v4l2_ctrl *vflip;
+};
+
+struct gc2145 {
+	struct v4l2_subdev sd;
+	struct media_pad pad;
+
+	struct regmap *regmap;
+	struct clk *xclk;
+
+	struct gpio_desc *reset_gpio;
+	struct gpio_desc *powerdown_gpio;
+	struct regulator_bulk_data supplies[GC2145_NUM_SUPPLIES];
+
+	/* V4L2 controls */
+	struct gc2145_ctrls ctrls;
+
+	/* Current mode */
+	const struct gc2145_mode *mode;
+};
+
+static inline struct gc2145 *to_gc2145(struct v4l2_subdev *_sd)
+{
+	return container_of(_sd, struct gc2145, sd);
+}
+
+static inline struct v4l2_subdev *ctrl_to_sd(struct v4l2_ctrl *ctrl)
+{
+	return &container_of(ctrl->handler, struct gc2145,
+			     ctrls.handler)->sd;
+}
+
+static const struct gc2145_format *
+gc2145_get_format_code(struct gc2145 *gc2145, u32 code)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(supported_formats); i++)
+		if (supported_formats[i].code == code)
+			break;
+
+	if (i >= ARRAY_SIZE(supported_formats))
+		i = 0;
+
+	return &supported_formats[i];
+}
+
+static void gc2145_update_pad_format(struct gc2145 *gc2145,
+				     const struct gc2145_mode *mode,
+				     struct v4l2_mbus_framefmt *fmt, u32 code)
+{
+	fmt->code = code;
+	fmt->width = mode->width;
+	fmt->height = mode->height;
+	fmt->field = V4L2_FIELD_NONE;
+	fmt->colorspace = V4L2_COLORSPACE_SRGB;
+	fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(fmt->colorspace);
+	fmt->quantization = V4L2_MAP_QUANTIZATION_DEFAULT(true, fmt->colorspace,
+							  fmt->ycbcr_enc);
+	fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(fmt->colorspace);
+}
+
+static int gc2145_init_cfg(struct v4l2_subdev *sd,
+			   struct v4l2_subdev_state *state)
+{
+	struct gc2145 *gc2145 = to_gc2145(sd);
+	struct v4l2_mbus_framefmt *format;
+	struct v4l2_rect *crop;
+
+	/* Initialize try_fmt */
+	format = v4l2_subdev_get_pad_format(sd, state, 0);
+	gc2145_update_pad_format(gc2145,
+				 &supported_modes[0], format,
+				 MEDIA_BUS_FMT_RGB565_2X8_BE);
+
+	/* Initialize crop rectangle. */
+	crop = v4l2_subdev_get_pad_crop(sd, state, 0);
+	*crop = supported_modes[0].crop;
+
+	return 0;
+}
+
+static int gc2145_get_selection(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *sd_state,
+				struct v4l2_subdev_selection *sel)
+{
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP:
+		sel->r = *v4l2_subdev_get_pad_crop(sd, sd_state, 0);
+		return 0;
+
+	case V4L2_SEL_TGT_NATIVE_SIZE:
+		sel->r.top = 0;
+		sel->r.left = 0;
+		sel->r.width = GC2145_NATIVE_WIDTH;
+		sel->r.height = GC2145_NATIVE_HEIGHT;
+
+		return 0;
+
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		sel->r.top = 0;
+		sel->r.left = 0;
+		sel->r.width = 1600;
+		sel->r.height = 1200;
+
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static int gc2145_enum_mbus_code(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *sd_state,
+				 struct v4l2_subdev_mbus_code_enum *code)
+{
+	if (code->index >= ARRAY_SIZE(supported_formats))
+		return -EINVAL;
+
+	code->code = supported_formats[code->index].code;
+	return 0;
+}
+
+static int gc2145_enum_frame_size(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *sd_state,
+				  struct v4l2_subdev_frame_size_enum *fse)
+{
+	struct gc2145 *gc2145 = to_gc2145(sd);
+	const struct gc2145_format *gc2145_format;
+	u32 code;
+
+	if (fse->index >= ARRAY_SIZE(supported_modes))
+		return -EINVAL;
+
+	gc2145_format = gc2145_get_format_code(gc2145, fse->code);
+	code = gc2145_format->code;
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
+static int
+gc2145_enum_frame_interval(struct v4l2_subdev *sd,
+			   struct v4l2_subdev_state *sd_state,
+			   struct v4l2_subdev_frame_interval_enum *fie)
+{
+	struct gc2145 *gc2145 = to_gc2145(sd);
+	const struct gc2145_format *gc2145_format;
+	u32 code, i;
+
+	/* Only supporting a unique framerate per resolution currently */
+	if (fie->index > 0)
+		return -EINVAL;
+
+	gc2145_format = gc2145_get_format_code(gc2145, fie->code);
+	code = gc2145_format->code;
+	if (fie->code != code)
+		return -EINVAL;
+
+	for (i = 0; i < ARRAY_SIZE(supported_modes); i++)
+		if (supported_modes[i].width == fie->width &&
+		    supported_modes[i].height == fie->height)
+			break;
+
+	if (i >= ARRAY_SIZE(supported_modes))
+		return -EINVAL;
+
+	fie->interval.numerator = supported_modes[i].frame_interval.numerator;
+	fie->interval.denominator =
+		supported_modes[i].frame_interval.denominator;
+
+	return 0;
+}
+
+static int gc2145_set_pad_format(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *sd_state,
+				 struct v4l2_subdev_format *fmt)
+{
+	struct gc2145 *gc2145 = to_gc2145(sd);
+	const struct gc2145_mode *mode;
+	const struct gc2145_format *gc2145_fmt;
+	struct v4l2_mbus_framefmt *framefmt;
+	struct gc2145_ctrls *ctrls = &gc2145->ctrls;
+	struct v4l2_rect *crop;
+
+	gc2145_fmt = gc2145_get_format_code(gc2145, fmt->format.code);
+	mode = v4l2_find_nearest_size(supported_modes,
+				      ARRAY_SIZE(supported_modes),
+				      width, height,
+				      fmt->format.width, fmt->format.height);
+
+	gc2145_update_pad_format(gc2145, mode, &fmt->format, gc2145_fmt->code);
+	framefmt = v4l2_subdev_get_pad_format(sd, sd_state, fmt->pad);
+	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
+		gc2145->mode = mode;
+		/* Update pixel_rate based on the mode */
+		__v4l2_ctrl_s_ctrl_int64(ctrls->pixel_rate, mode->pixel_rate);
+	}
+	*framefmt = fmt->format;
+	crop = v4l2_subdev_get_pad_crop(sd, sd_state, fmt->pad);
+	*crop = mode->crop;
+
+	return 0;
+}
+
+static const struct cci_reg_sequence common_mipi_regs[] = {
+	{GC2145_REG_PAGE_SELECT, 0x03},
+	{GC2145_REG_DPHY_ANALOG_MODE1, GC2145_DPHY_MODE_PHY_CLK_EN |
+				       GC2145_DPHY_MODE_PHY_LANE0_EN |
+				       GC2145_DPHY_MODE_PHY_LANE1_EN |
+				       GC2145_DPHY_MODE_PHY_CLK_LANE_P2S_SEL},
+	{GC2145_REG_DPHY_ANALOG_MODE2, GC2145_DPHY_CLK_DIFF(2) |
+				       GC2145_DPHY_LANE0_DIFF(2)},
+	{GC2145_REG_DPHY_ANALOG_MODE3, GC2145_DPHY_LANE1_DIFF(0) |
+				       GC2145_DPHY_CLK_DELAY},
+	{GC2145_REG_FIFO_MODE, GC2145_FIFO_MODE_READ_GATE |
+			       GC2145_FIFO_MODE_MIPI_CLK_MODULE},
+	{GC2145_REG_BUF_CSI2_MODE, GC2145_CSI2_MODE_EN |
+				   GC2145_CSI2_MODE_MIPI_EN |
+				   GC2145_CSI2_MODE_RAW8 |
+				   GC2145_CSI2_MODE_DOUBLE},
+	{GC2145_REG_DPHY_MODE, GC2145_DPHY_MODE_TRIGGER_PROG},
+	/* Clock & Data lanes timing */
+	{GC2145_REG_T_LPX, 0x10},
+	{GC2145_REG_T_CLK_HS_PREPARE, 0x04}, {GC2145_REG_T_CLK_ZERO, 0x10},
+	{GC2145_REG_T_CLK_PRE, 0x10}, {GC2145_REG_T_CLK_POST, 0x10},
+	{GC2145_REG_T_CLK_TRAIL, 0x05},
+	{GC2145_REG_T_HS_PREPARE, 0x03}, {GC2145_REG_T_HS_ZERO, 0x0a},
+	{GC2145_REG_T_HS_TRAIL, 0x06},
+};
+
+static int gc2145_config_mipi_mode(struct gc2145 *gc2145,
+				   const struct gc2145_format *gc2145_format)
+{
+	u16 lwc, fifo_full_lvl;
+	int ret = 0;
+
+	/* Common MIPI settings */
+	cci_multi_reg_write(gc2145->regmap, common_mipi_regs,
+			    ARRAY_SIZE(common_mipi_regs), &ret);
+
+	/*
+	 * Adjust the MIPI buffer settings.
+	 * For YUV/RGB, LWC = image width * 2
+	 * For RAW8, LWC = image width
+	 * For RAW10, LWC = image width * 1.25
+	 */
+	lwc = gc2145->mode->width * 2;
+	cci_write(gc2145->regmap, GC2145_REG_LWC_HIGH, lwc >> 8, &ret);
+	cci_write(gc2145->regmap, GC2145_REG_LWC_LOW, lwc & 0xff, &ret);
+
+	/*
+	 * Adjust the MIPI Fifo Full Level
+	 * 640x480 RGB: 0x0190
+	 * 1280x720 / 1600x1200 (aka no scaler) non RAW: 0x0001
+	 * 1600x1200 RAW: 0x0190
+	 */
+	if (gc2145->mode->width == 1280 || gc2145->mode->width == 1600)
+		fifo_full_lvl = 0x0001;
+	else
+		fifo_full_lvl = 0x0190;
+
+	cci_write(gc2145->regmap, GC2145_REG_FIFO_FULL_LVL_HIGH,
+		  fifo_full_lvl >> 8, &ret);
+	cci_write(gc2145->regmap, GC2145_REG_FIFO_FULL_LVL_LOW,
+		  fifo_full_lvl & 0xff, &ret);
+
+	/*
+	 * Set the fifo gate mode / MIPI wdiv set:
+	 * 0xf1 in case of RAW mode and 0xf0 otherwise
+	 */
+	cci_write(gc2145->regmap, GC2145_REG_FIFO_GATE_MODE, 0xf0, &ret);
+
+	/* Set the MIPI data type */
+	cci_write(gc2145->regmap, GC2145_REG_MIPI_DT,
+		  gc2145_format->datatype, &ret);
+
+	return ret;
+}
+
+static int gc2145_start_streaming(struct gc2145 *gc2145,
+				  struct v4l2_subdev_state *state)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&gc2145->sd);
+	const struct gc2145_format *gc2145_format;
+	struct v4l2_mbus_framefmt *fmt;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(&client->dev);
+	if (ret < 0)
+		return ret;
+
+	/* Apply default values of current mode */
+	cci_multi_reg_write(gc2145->regmap, gc2145->mode->reg_seq,
+			    gc2145->mode->reg_seq_size, &ret);
+	cci_multi_reg_write(gc2145->regmap, common_regs,
+			    ARRAY_SIZE(common_regs), &ret);
+	if (ret) {
+		dev_err(&client->dev, "%s failed to write regs\n", __func__);
+		goto err_rpm_put;
+	}
+
+	fmt = v4l2_subdev_get_pad_format(&gc2145->sd, state, 0);
+	gc2145_format = gc2145_get_format_code(gc2145, fmt->code);
+
+	/* Set the output format */
+	cci_write(gc2145->regmap, GC2145_REG_PAGE_SELECT, 0x00, &ret);
+
+	cci_write(gc2145->regmap, GC2145_REG_OUTPUT_FMT,
+		  gc2145_format->output_fmt, &ret);
+	if (ret) {
+		dev_err(&client->dev, "%s failed to write regs\n", __func__);
+		goto err_rpm_put;
+	}
+
+	/* Perform MIPI specific configuration */
+	ret = gc2145_config_mipi_mode(gc2145, gc2145_format);
+	if (ret) {
+		dev_err(&client->dev, "%s failed to write mipi conf\n",
+			__func__);
+		goto err_rpm_put;
+	}
+
+	/* Come back on page 0 by default */
+	cci_write(gc2145->regmap, GC2145_REG_PAGE_SELECT, 0x00, &ret);
+	if (ret) {
+		dev_err(&client->dev, "%s failed to write regs\n", __func__);
+		goto err_rpm_put;
+	}
+
+	/* Apply customized values from user */
+	ret =  __v4l2_ctrl_handler_setup(&gc2145->ctrls.handler);
+
+	return 0;
+
+err_rpm_put:
+	pm_runtime_put(&client->dev);
+	return ret;
+}
+
+static void gc2145_stop_streaming(struct gc2145 *gc2145)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&gc2145->sd);
+	int ret = 0;
+
+	/* Disable lanes & mipi streaming */
+	cci_write(gc2145->regmap, GC2145_REG_PAGE_SELECT, 0x03, &ret);
+	cci_update_bits(gc2145->regmap, GC2145_REG_BUF_CSI2_MODE,
+			GC2145_CSI2_MODE_EN | GC2145_CSI2_MODE_MIPI_EN, 0,
+			&ret);
+	cci_write(gc2145->regmap, GC2145_REG_PAGE_SELECT, 0x00, &ret);
+	if (ret)
+		dev_err(&client->dev, "%s failed to write regs\n", __func__);
+
+	pm_runtime_put(&client->dev);
+}
+
+static int gc2145_g_frame_interval(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_frame_interval *fi)
+{
+	struct gc2145 *gc2145 = to_gc2145(sd);
+
+	fi->interval = gc2145->mode->frame_interval;
+
+	return 0;
+}
+
+static int gc2145_set_stream(struct v4l2_subdev *sd, int enable)
+{
+	struct gc2145 *gc2145 = to_gc2145(sd);
+	struct v4l2_subdev_state *state;
+	int ret = 0;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+
+	if (enable)
+		ret = gc2145_start_streaming(gc2145, state);
+	else
+		gc2145_stop_streaming(gc2145);
+
+	v4l2_subdev_unlock_state(state);
+
+	return ret;
+}
+
+/* Power/clock management functions */
+static int gc2145_power_on(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct gc2145 *gc2145 = to_gc2145(sd);
+	int ret;
+
+	ret = regulator_bulk_enable(GC2145_NUM_SUPPLIES, gc2145->supplies);
+	if (ret) {
+		dev_err(dev, "failed to enable regulators\n");
+		return ret;
+	}
+
+	ret = clk_prepare_enable(gc2145->xclk);
+	if (ret) {
+		dev_err(dev, "failed to enable clock\n");
+		goto reg_off;
+	}
+
+	gpiod_set_value_cansleep(gc2145->powerdown_gpio, 0);
+	gpiod_set_value_cansleep(gc2145->reset_gpio, 0);
+
+	/*
+	 * Datasheet doesn't mention timing between PWDN/RESETB control and
+	 * i2c access however experimentation shows that a rather big delay is
+	 * needed
+	 */
+	usleep_range(40000, 41000);
+
+	return 0;
+
+reg_off:
+	regulator_bulk_disable(GC2145_NUM_SUPPLIES, gc2145->supplies);
+
+	return ret;
+}
+
+static int gc2145_power_off(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct gc2145 *gc2145 = to_gc2145(sd);
+
+	gpiod_set_value_cansleep(gc2145->powerdown_gpio, 1);
+	gpiod_set_value_cansleep(gc2145->reset_gpio, 1);
+	clk_disable_unprepare(gc2145->xclk);
+	regulator_bulk_disable(GC2145_NUM_SUPPLIES, gc2145->supplies);
+
+	return 0;
+}
+
+static int gc2145_get_regulators(struct gc2145 *gc2145)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&gc2145->sd);
+	unsigned int i;
+
+	for (i = 0; i < GC2145_NUM_SUPPLIES; i++)
+		gc2145->supplies[i].supply = gc2145_supply_name[i];
+
+	return devm_regulator_bulk_get(&client->dev, GC2145_NUM_SUPPLIES,
+				       gc2145->supplies);
+}
+
+/* Verify chip ID */
+static int gc2145_identify_module(struct gc2145 *gc2145)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&gc2145->sd);
+	int ret;
+	u64 chip_id;
+
+	ret = cci_read(gc2145->regmap, GC2145_REG_CHIP_ID, &chip_id, NULL);
+	if (ret) {
+		dev_err(&client->dev, "failed to read chip id (%d)\n", ret);
+		return ret;
+	}
+
+	if (chip_id != GC2145_CHIP_ID) {
+		dev_err(&client->dev, "chip id mismatch: %x!=%llx\n",
+			GC2145_CHIP_ID, chip_id);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static const char * const test_pattern_menu[] = {
+	"Disabled",
+	"Colored patterns",
+	"Uniform white",
+	"Uniform yellow",
+	"Uniform cyan",
+	"Uniform green",
+	"Uniform magenta",
+	"Uniform red",
+	"Uniform black",
+};
+
+#define GC2145_TEST_PATTERN_ENABLE	BIT(0)
+#define GC2145_TEST_PATTERN_UXGA	BIT(3)
+
+#define GC2145_TEST_UNIFORM		BIT(3)
+#define GC2145_TEST_WHITE		(4 << 4)
+#define GC2145_TEST_YELLOW		(8 << 4)
+#define GC2145_TEST_CYAN		(9 << 4)
+#define GC2145_TEST_GREEN		(6 << 4)
+#define GC2145_TEST_MAGENTA		(10 << 4)
+#define GC2145_TEST_RED			(5 << 4)
+#define GC2145_TEST_BLACK		(0)
+
+static const u8 test_pattern_val[] = {
+	0,
+	GC2145_TEST_PATTERN_ENABLE,
+	GC2145_TEST_UNIFORM | GC2145_TEST_WHITE,
+	GC2145_TEST_UNIFORM | GC2145_TEST_YELLOW,
+	GC2145_TEST_UNIFORM | GC2145_TEST_CYAN,
+	GC2145_TEST_UNIFORM | GC2145_TEST_GREEN,
+	GC2145_TEST_UNIFORM | GC2145_TEST_MAGENTA,
+	GC2145_TEST_UNIFORM | GC2145_TEST_RED,
+	GC2145_TEST_UNIFORM | GC2145_TEST_BLACK,
+};
+
+static const struct v4l2_subdev_core_ops gc2145_core_ops = {
+	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
+	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
+};
+
+static const struct v4l2_subdev_video_ops gc2145_video_ops = {
+	.g_frame_interval = gc2145_g_frame_interval,
+	/*
+	 * Currently frame_interval can't be changed hence s_frame_interval
+	 * does same as g_frame_interval
+	 */
+	.s_frame_interval = gc2145_g_frame_interval,
+	.s_stream = gc2145_set_stream,
+};
+
+static const struct v4l2_subdev_pad_ops gc2145_pad_ops = {
+	.init_cfg = gc2145_init_cfg,
+	.enum_mbus_code = gc2145_enum_mbus_code,
+	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = gc2145_set_pad_format,
+	.get_selection = gc2145_get_selection,
+	.enum_frame_size = gc2145_enum_frame_size,
+	.enum_frame_interval = gc2145_enum_frame_interval,
+};
+
+static const struct v4l2_subdev_ops gc2145_subdev_ops = {
+	.core = &gc2145_core_ops,
+	.video = &gc2145_video_ops,
+	.pad = &gc2145_pad_ops,
+};
+
+static int gc2145_set_ctrl_test_pattern(struct gc2145 *gc2145, int value)
+{
+	int ret = 0;
+
+	if (!value) {
+		/* Disable test pattern */
+		cci_write(gc2145->regmap, GC2145_REG_DEBUG_MODE2, 0, &ret);
+		return cci_write(gc2145->regmap, GC2145_REG_DEBUG_MODE3, 0,
+				 &ret);
+	}
+
+	/* Enable test pattern, colored or uniform */
+	cci_write(gc2145->regmap, GC2145_REG_DEBUG_MODE2,
+		  GC2145_TEST_PATTERN_ENABLE | GC2145_TEST_PATTERN_UXGA, &ret);
+
+	if (!(test_pattern_val[value] & GC2145_TEST_UNIFORM))
+		return cci_write(gc2145->regmap, GC2145_REG_DEBUG_MODE3, 0,
+				 &ret);
+
+	/* Uniform */
+	return cci_write(gc2145->regmap, GC2145_REG_DEBUG_MODE3,
+			 test_pattern_val[value], &ret);
+}
+
+static int gc2145_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	struct gc2145 *gc2145 = to_gc2145(sd);
+	int ret;
+
+	if (pm_runtime_get_if_in_use(&client->dev) == 0)
+		return 0;
+
+	switch (ctrl->id) {
+	case V4L2_CID_TEST_PATTERN:
+		ret = gc2145_set_ctrl_test_pattern(gc2145, ctrl->val);
+		break;
+	case V4L2_CID_HFLIP:
+		ret = cci_update_bits(gc2145->regmap, GC2145_REG_ANALOG_MODE1,
+				      BIT(0), (ctrl->val ? BIT(0) : 0), NULL);
+		break;
+	case V4L2_CID_VFLIP:
+		ret = cci_update_bits(gc2145->regmap, GC2145_REG_ANALOG_MODE1,
+				      BIT(1), (ctrl->val ? BIT(1) : 0), NULL);
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
+static const struct v4l2_ctrl_ops gc2145_ctrl_ops = {
+	.s_ctrl = gc2145_s_ctrl,
+};
+
+/* Initialize control handlers */
+static int gc2145_init_controls(struct gc2145 *gc2145)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&gc2145->sd);
+	const struct v4l2_ctrl_ops *ops = &gc2145_ctrl_ops;
+	struct gc2145_ctrls *ctrls = &gc2145->ctrls;
+	struct v4l2_ctrl_handler *hdl = &ctrls->handler;
+	struct v4l2_fwnode_device_properties props;
+	int ret;
+
+	ret = v4l2_ctrl_handler_init(hdl, 12);
+	if (ret)
+		return ret;
+
+	ctrls->pixel_rate = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_PIXEL_RATE,
+					      GC2145_640_480_PIXELRATE,
+					      GC2145_1280_720_PIXELRATE, 1,
+					      supported_modes[0].pixel_rate);
+
+	ctrls->test_pattern =
+		v4l2_ctrl_new_std_menu_items(hdl, ops, V4L2_CID_TEST_PATTERN,
+					     ARRAY_SIZE(test_pattern_menu) - 1,
+					     0, 0, test_pattern_menu);
+	ctrls->hflip = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HFLIP,
+					 0, 1, 1, 0);
+	ctrls->vflip = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VFLIP,
+					 0, 1, 1, 0);
+
+	if (hdl->error) {
+		ret = hdl->error;
+		dev_err(&client->dev, "control init failed (%d)\n", ret);
+		goto error;
+	}
+
+	ret = v4l2_fwnode_device_parse(&client->dev, &props);
+	if (ret)
+		goto error;
+
+	ret = v4l2_ctrl_new_fwnode_properties(hdl, &gc2145_ctrl_ops,
+					      &props);
+	if (ret)
+		goto error;
+
+	gc2145->sd.ctrl_handler = hdl;
+
+	return 0;
+
+error:
+	v4l2_ctrl_handler_free(hdl);
+
+	return ret;
+}
+
+static int gc2145_check_hwcfg(struct device *dev)
+{
+	struct fwnode_handle *endpoint;
+	struct v4l2_fwnode_endpoint ep_cfg = {
+		.bus_type = V4L2_MBUS_CSI2_DPHY
+	};
+	int ret = -EINVAL;
+
+	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
+	if (!endpoint) {
+		dev_err(dev, "endpoint node not found\n");
+		return -EINVAL;
+	}
+
+	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &ep_cfg);
+	fwnode_handle_put(endpoint);
+	if (ret)
+		return ret;
+
+	/* Check the number of MIPI CSI2 data lanes */
+	if (ep_cfg.bus.mipi_csi2.num_data_lanes != 2) {
+		dev_err(dev, "only 2 data lanes are currently supported\n");
+		ret = -EINVAL;
+	}
+
+	v4l2_fwnode_endpoint_free(&ep_cfg);
+
+	return ret;
+}
+
+static int gc2145_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	unsigned int xclk_freq;
+	struct gc2145 *gc2145;
+	int ret;
+
+	gc2145 = devm_kzalloc(&client->dev, sizeof(*gc2145), GFP_KERNEL);
+	if (!gc2145)
+		return -ENOMEM;
+
+	v4l2_i2c_subdev_init(&gc2145->sd, client, &gc2145_subdev_ops);
+
+	/* Check the hardware configuration in device tree */
+	if (gc2145_check_hwcfg(dev))
+		return -EINVAL;
+
+	/* Get system clock (xclk) */
+	gc2145->xclk = devm_clk_get(dev, NULL);
+	if (IS_ERR(gc2145->xclk))
+		return dev_err_probe(dev, PTR_ERR(gc2145->xclk),
+				     "failed to get xclk\n");
+
+	xclk_freq = clk_get_rate(gc2145->xclk);
+	if (xclk_freq != GC2145_XCLK_FREQ) {
+		dev_err(dev, "xclk frequency not supported: %d Hz\n",
+			xclk_freq);
+		return -EINVAL;
+	}
+
+	ret = gc2145_get_regulators(gc2145);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to get regulators\n");
+
+	/* Request optional enable pin */
+	gc2145->reset_gpio = devm_gpiod_get_optional(dev, "reset",
+						     GPIOD_OUT_HIGH);
+	if (IS_ERR(gc2145->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(gc2145->reset_gpio),
+				     "failed to get reset_gpio\n");
+
+	/* Request optional enable pin */
+	gc2145->powerdown_gpio = devm_gpiod_get_optional(dev, "powerdown",
+							 GPIOD_OUT_HIGH);
+	if (IS_ERR(gc2145->powerdown_gpio))
+		return dev_err_probe(dev, PTR_ERR(gc2145->powerdown_gpio),
+				     "failed to get powerdown_gpio\n");
+
+	/* Initialise the regmap for further cci access */
+	gc2145->regmap = devm_cci_regmap_init_i2c(client, 8);
+	if (IS_ERR(gc2145->regmap))
+		return dev_err_probe(dev, PTR_ERR(gc2145->regmap),
+				     "failed to get cci regmap\n");
+
+	/*
+	 * The sensor must be powered for gc2145_identify_module()
+	 * to be able to read the CHIP_ID register
+	 */
+	ret = gc2145_power_on(dev);
+	if (ret)
+		return ret;
+
+	ret = gc2145_identify_module(gc2145);
+	if (ret)
+		goto error_power_off;
+
+	/* Set default mode */
+	gc2145->mode = &supported_modes[0];
+
+	ret = gc2145_init_controls(gc2145);
+	if (ret)
+		goto error_power_off;
+
+	/* Initialize subdev */
+	gc2145->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
+			    V4L2_SUBDEV_FL_HAS_EVENTS;
+	gc2145->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
+
+	/* Initialize source pad */
+	gc2145->pad.flags = MEDIA_PAD_FL_SOURCE;
+
+	ret = media_entity_pads_init(&gc2145->sd.entity, 1, &gc2145->pad);
+	if (ret) {
+		dev_err(dev, "failed to init entity pads: %d\n", ret);
+		goto error_handler_free;
+	}
+
+	gc2145->sd.state_lock = gc2145->ctrls.handler.lock;
+	ret = v4l2_subdev_init_finalize(&gc2145->sd);
+	if (ret < 0) {
+		dev_err(dev, "subdev init error: %d\n", ret);
+		goto error_media_entity;
+	}
+
+	ret = v4l2_async_register_subdev_sensor(&gc2145->sd);
+	if (ret < 0) {
+		dev_err(dev, "failed to register sensor sub-device: %d\n", ret);
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
+	v4l2_subdev_cleanup(&gc2145->sd);
+
+error_media_entity:
+	media_entity_cleanup(&gc2145->sd.entity);
+
+error_handler_free:
+	v4l2_ctrl_handler_free(&gc2145->ctrls.handler);
+
+error_power_off:
+	gc2145_power_off(dev);
+
+	return ret;
+}
+
+static void gc2145_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct gc2145 *gc2145 = to_gc2145(sd);
+
+	v4l2_subdev_cleanup(sd);
+	v4l2_async_unregister_subdev(sd);
+	media_entity_cleanup(&sd->entity);
+	v4l2_ctrl_handler_free(&gc2145->ctrls.handler);
+
+	pm_runtime_disable(&client->dev);
+	if (!pm_runtime_status_suspended(&client->dev))
+		gc2145_power_off(&client->dev);
+	pm_runtime_set_suspended(&client->dev);
+}
+
+static const struct of_device_id gc2145_dt_ids[] = {
+	{ .compatible = "galaxycore,gc2145" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, gc2145_dt_ids);
+
+static const struct dev_pm_ops gc2145_pm_ops = {
+	RUNTIME_PM_OPS(gc2145_power_off, gc2145_power_on, NULL)
+};
+
+static struct i2c_driver gc2145_i2c_driver = {
+	.driver = {
+		.name = "gc2145",
+		.of_match_table	= gc2145_dt_ids,
+		.pm = pm_ptr(&gc2145_pm_ops),
+	},
+	.probe = gc2145_probe,
+	.remove = gc2145_remove,
+};
+
+module_i2c_driver(gc2145_i2c_driver);
+
+MODULE_AUTHOR("Alain Volmat <alain.volmat@foss.st.com");
+MODULE_DESCRIPTION("GalaxyCore GC2145 sensor driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1

