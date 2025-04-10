Return-Path: <linux-media+bounces-29933-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4DEA844D9
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 15:33:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E23E7189B0A8
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 13:30:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36DD928A405;
	Thu, 10 Apr 2025 13:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zsa4PINV"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B11328A40E
	for <linux-media@vger.kernel.org>; Thu, 10 Apr 2025 13:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744291790; cv=none; b=EKgUnvUvlm7lz5JIOrsOunWjKwHv5ZeKrt3cv7fiBjf2enIzgsNLl1qjtsdvwtlmEviS8kMVVEQWTf9q/DiApFqZZb9L7K+o0W1CLQODNockwei+FED+z+BPlhtQe4lsyOlpmSkZD3tigYIHu0G/sRKdLo6wstgGOkXsO/o5OL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744291790; c=relaxed/simple;
	bh=iq3b7ddm60uWEO8eaAklpa7ZHuadNbKKpeehh+xBjfA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aRs4f3nX9A9cmLw/HixmEKBoFMUbIBCVIq5C+BmMEFBMYKxotTsitu1XP4kevgqxOqwqTI9G3+eEeSerFB/Fp37AEYkkqroI3N6jxyym0nJdl9jDY6lnycbTs5T1PetuXgxrJ8/Czws4Wsjwid1/IZ2+E5+g2usK1aY8Gcwafas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zsa4PINV; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744291788; x=1775827788;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iq3b7ddm60uWEO8eaAklpa7ZHuadNbKKpeehh+xBjfA=;
  b=Zsa4PINVwzj+woG+VaEb1ebXy+OEXZ/fFEWPu0tqL4uUg9Fq8d6I+wzY
   tochOoJZhIdxxV0crYCRo/ljqiq7Uhhto7mZgNqLe9x/qxbtGjMJQjTDC
   JvpafiildmUGSpTebDnWIfld9HJwffWlEXkgobKmmiXT+pFuyYSWfzNhq
   ShTR1wfkw6WoANq/FWu2YPPtWGytWfLhh1kzpDB0sRhAui4/Xj3CaGNQE
   9ecHoGxmahAov2WOmOjCfaO0hEaw29hJDpD0tXk+55DjSPbK97RF8+T8/
   7VAgpPgYD7HO2y7ucTW+k2kdXZBO3IJJwoigNEQ/t/+VLU0oNrTsUvtJx
   w==;
X-CSE-ConnectionGUID: E4xDNumqQd6oh76a6ISr5Q==
X-CSE-MsgGUID: 1b9fz2NASP2dWKUCyLDRyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="56789154"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="56789154"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 06:29:47 -0700
X-CSE-ConnectionGUID: 5SvEM75ySwGmlZkJ3ix1wQ==
X-CSE-MsgGUID: 08mwfvCrTGqhn6h/8uQOOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="166105590"
Received: from bjledic266.bj.intel.com ([172.16.127.175])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 06:29:42 -0700
From: Dongcheng Yan <dongcheng.yan@intel.com>
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	dave.stevenson@raspberrypi.com,
	hverkuil@xs4all.nl,
	ricardo.ribalda@gmail.com,
	bingbu.cao@linux.intel.com
Cc: tomi.valkeinen@ideasonboard.com,
	jacopo.mondi@ideasonboard.com,
	dongcheng.yan@linux.intel.com
Subject: [PATCH v5] media: i2c: Add ar0234 camera sensor driver
Date: Thu, 10 Apr 2025 21:29:32 +0800
Message-Id: <20250410132932.3299096-1-dongcheng.yan@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver is implemented with V4L2 framework,
and supports following features:

    - manual exposure and analog/digital gain control
    - vblank/hblank control
    - vflip/hflip control
    - runtime PM support
    - 1280x960@30fps and 1920x1200@60fps support
    - dynamical pll_params set

Signed-off-by: Dongcheng Yan <dongcheng.yan@intel.com>
---
v2 --> v3:
  - remove unused reg setting
  - add vflip/hflip control
  - add external clock check & lanes check
v3 --> v4:
  - used macro for all registers defined in spec
  - switch to {enable,disable}_streams
v4 --> v5:
  - set pll params dynamically by CCS PLL helper
  - remove fixed pixel rate and link freq list, filter valid link_freq
    through CCS PLL helper
  - remove fixed external freq check, limited by CCS PLL helper
  - add 1920x1200@60fps mode

The driver is tested with Intel IPU and refers to
drivers/media/pci/intel/ipu6.
---
 drivers/media/i2c/Kconfig  |   11 +
 drivers/media/i2c/Makefile |    1 +
 drivers/media/i2c/ar0234.c | 1056 ++++++++++++++++++++++++++++++++++++
 3 files changed, 1068 insertions(+)
 create mode 100644 drivers/media/i2c/ar0234.c

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 85ecb2aeefdb..99e9bac07416 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -51,6 +51,17 @@ config VIDEO_ALVIUM_CSI2
 	  To compile this driver as a module, choose M here: the
 	  module will be called alvium-csi2.
 
+config VIDEO_AR0234
+        tristate "ON Semiconductor AR0234 sensor support"
+        depends on ACPI || COMPILE_TEST
+        select V4L2_CCI_I2C
+        help
+          This is a Video4Linux2 sensor driver for the ON Semiconductor
+          AR0234 camera.
+
+          To compile this driver as a module, choose M here: the
+          module will be called ar0234.
+
 config VIDEO_AR0521
 	tristate "ON Semiconductor AR0521 sensor support"
 	help
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index fbb988bd067a..825d4b1bd742 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -19,6 +19,7 @@ obj-$(CONFIG_VIDEO_AK7375) += ak7375.o
 obj-$(CONFIG_VIDEO_AK881X) += ak881x.o
 obj-$(CONFIG_VIDEO_ALVIUM_CSI2) += alvium-csi2.o
 obj-$(CONFIG_VIDEO_APTINA_PLL) += aptina-pll.o
+obj-$(CONFIG_VIDEO_AR0234) += ar0234.o
 obj-$(CONFIG_VIDEO_AR0521) += ar0521.o
 obj-$(CONFIG_VIDEO_BT819) += bt819.o
 obj-$(CONFIG_VIDEO_BT856) += bt856.o
diff --git a/drivers/media/i2c/ar0234.c b/drivers/media/i2c/ar0234.c
new file mode 100644
index 000000000000..ce346d240879
--- /dev/null
+++ b/drivers/media/i2c/ar0234.c
@@ -0,0 +1,1056 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2019 - 2025 Intel Corporation.
+
+#include <linux/acpi.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+#include <media/v4l2-cci.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
+#include "ccs-pll.h"
+
+/* Chip ID */
+#define AR0234_REG_CHIP_ID		CCI_REG16(0x3000)
+#define AR0234_CHIP_ID			0x0a56
+
+#define AR0234_REG_MODE_SELECT		CCI_REG16(0x301a)
+#define AR0234_REG_FRAME_LENGTH_LINES	CCI_REG16(0x300a)
+#define AR0234_REG_LINE_LENGTH_PCK	CCI_REG16(0x300c)
+#define AR0234_REG_EXPOSURE		CCI_REG16(0x3012)
+#define AR0234_REG_ANALOG_GAIN		CCI_REG16(0x3060)
+#define AR0234_REG_GLOBAL_GAIN		CCI_REG16(0x305e)
+#define AR0234_REG_ORIENTATION		CCI_REG16(0x3040)
+#define AR0234_REG_TEST_PATTERN		CCI_REG16(0x3070)
+
+/* Timing Settings */
+#define AR0234_REG_Y_ADDR_START		CCI_REG16(0x3002)
+#define AR0234_REG_X_ADDR_START		CCI_REG16(0x3004)
+#define AR0234_REG_Y_ADDR_END		CCI_REG16(0x3006)
+#define AR0234_REG_X_ADDR_END		CCI_REG16(0x3008)
+#define AR0234_REG_SMIA_TEST		CCI_REG16(0x3064)
+#define AR0234_REG_DATAPATH_SELECT	CCI_REG16(0x306e)
+#define AR0234_REG_X_ODD_INC		CCI_REG16(0x30a2)
+#define AR0234_REG_Y_ODD_INC		CCI_REG16(0x30a6)
+#define AR0234_REG_DATA_FORMAT		CCI_REG16(0x31ac)
+#define AR0234_REG_SERIAL_FORMAT	CCI_REG16(0x31ae)
+#define AR0234_REG_COMPANDING		CCI_REG16(0x31d0)
+#define AR0234_REG_DIGITAL_CTRL		CCI_REG16(0x3786)
+
+/* PLL Settings */
+#define AR0234_REG_VT_PIX_CLK_DIV	CCI_REG16(0x302a)
+#define AR0234_REG_VT_SYS_CLK_DIV	CCI_REG16(0x302c)
+#define AR0234_REG_PRE_PLL_CLK_DIV	CCI_REG16(0x302e)
+#define AR0234_REG_PLL_MULTIPLIER	CCI_REG16(0x3030)
+#define AR0234_REG_OP_PIX_CLK_DIV	CCI_REG16(0x3036)
+#define AR0234_REG_OP_SYS_CLK_DIV	CCI_REG16(0x3038)
+#define AR0234_REG_DIGITAL_TEST		CCI_REG16(0x30b0)
+#define AR0234_REG_MIPI_CNTRL		CCI_REG16(0x3354)
+#define AR0234_REG_FRAME_PREAMBLE	CCI_REG16(0x31b0)
+#define AR0234_REG_LINE_PREAMBLE	CCI_REG16(0x31b2)
+#define AR0234_REG_MIPI_TIMING_0	CCI_REG16(0x31b4)
+#define AR0234_REG_MIPI_TIMING_1	CCI_REG16(0x31b6)
+#define AR0234_REG_MIPI_TIMING_2	CCI_REG16(0x31b8)
+#define AR0234_REG_MIPI_TIMING_3	CCI_REG16(0x31ba)
+#define AR0234_REG_MIPI_TIMING_4	CCI_REG16(0x31bc)
+
+#define AR0234_REG_OPERATION_MODE	CCI_REG16(0x3082)
+#define AR0234_REG_SEQ_CTRL_PORT	CCI_REG16(0x3088)
+#define AR0234_REG_SEQ_DATA_PORT	CCI_REG16(0x3086)
+#define AR0234_REG_NOISE_PEDESTAL	CCI_REG16(0x30fe)
+#define AR0234_REG_AE_LUMA_TARGET	CCI_REG16(0x3102)
+#define AR0234_REG_DELTA_DK_CONTROL	CCI_REG16(0x3180)
+#define AR0234_REG_PIX_DEF_ID		CCI_REG16(0x31e0)
+
+#define AR0234_EXPOSURE_MIN		0
+#define AR0234_EXPOSURE_MAX_MARGIN	80
+#define AR0234_EXPOSURE_STEP		1
+
+#define AR0234_ANALOG_GAIN_MIN		0
+#define AR0234_ANALOG_GAIN_MAX		0x7f
+#define AR0234_ANALOG_GAIN_STEP		1
+#define AR0234_ANALOG_GAIN_DEFAULT	0xe
+
+#define AR0234_GLOBAL_GAIN_MIN		0
+#define AR0234_GLOBAL_GAIN_MAX		0x7ff
+#define AR0234_GLOBAL_GAIN_STEP		1
+#define AR0234_GLOBAL_GAIN_DEFAULT	0x80
+
+#define AR0234_NATIVE_WIDTH		1920
+#define AR0234_NATIVE_HEIGHT		1200
+#define AR0234_COMMON_WIDTH		1280
+#define AR0234_COMMON_HEIGHT		960
+#define AR0234_PIXEL_ARRAY_LEFT		320
+#define AR0234_PIXEL_ARRAY_TOP		60
+#define AR0234_ORIENTATION_HFLIP	BIT(14)
+#define AR0234_ORIENTATION_VFLIP	BIT(15)
+#define AR0234_SGRBG10_1X10_BPP		10
+
+#define AR0234_VTS_DEFAULT		0x04c4
+#define AR0234_VTS_MAX			0xffff
+#define AR0234_PPL_DEFAULT		3498
+
+#define AR0234_MODE_RESET		0x00d9
+#define AR0234_MODE_STANDBY		0x2058
+#define AR0234_MODE_STREAMING		0x205c
+
+#define AR0234_TEST_PATTERN_DISABLE	0
+#define AR0234_TEST_PATTERN_SOLID_COLOR	1
+#define AR0234_TEST_PATTERN_COLOR_BARS	2
+#define AR0234_TEST_PATTERN_GREY_COLOR	3
+#define AR0234_TEST_PATTERN_WALKING	256
+
+#define to_ar0234(_sd)	container_of(_sd, struct ar0234, sd)
+
+struct ar0234_reg_list {
+	u32 num_of_regs;
+	const struct cci_reg_sequence *regs;
+};
+
+struct ar0234_mode {
+	u32 width;
+	u32 height;
+	u32 vts;
+	u32 code;
+	/* Sensor register settings for this mode */
+	const struct ar0234_reg_list reg_list;
+};
+
+static const struct cci_reg_sequence common_init[] = {
+	/* Defect Correction */
+	{ CCI_REG16(0x3f4c), 0x121f },
+	{ CCI_REG16(0x3f4e), 0x121f },
+	{ CCI_REG16(0x3f50), 0x0b81 },
+	{ AR0234_REG_PIX_DEF_ID, 0x0003 },
+	{ AR0234_REG_DIGITAL_TEST, 0x0028 },
+	/* Recommended Common 1 */
+	{ AR0234_REG_SEQ_CTRL_PORT, 0x8050 },
+	{ AR0234_REG_SEQ_DATA_PORT, 0x9237 },
+	{ CCI_REG16(0x3044), 0x0410 },
+	{ CCI_REG16(0x3094), 0x03d4 },
+	{ CCI_REG16(0x3096), 0x0280 },
+	/* [2:0] fixed to 6 as recommended setting */
+	{ CCI_REG16(0x30ba), 0x7606 },
+	{ AR0234_REG_DIGITAL_TEST, 0x0028 },
+	{ CCI_REG16(0x30ba), 0x7600 },
+	{ AR0234_REG_NOISE_PEDESTAL, 0x002a },
+	{ CCI_REG16(0x31de), 0x0410 },
+	{ CCI_REG16(0x3ed6), 0x1435 },
+	{ CCI_REG16(0x3ed8), 0x9865 },
+	{ CCI_REG16(0x3eda), 0x7698 },
+	{ CCI_REG16(0x3edc), 0x99ff },
+	{ CCI_REG16(0x3ee2), 0xbb88 },
+	{ CCI_REG16(0x3ee4), 0x8836 },
+	{ CCI_REG16(0x3ef0), 0x1cf0 },
+	{ CCI_REG16(0x3ef2), 0x0000 },
+	{ CCI_REG16(0x3ef8), 0x6166 },
+	{ CCI_REG16(0x3efa), 0x3333 },
+	{ CCI_REG16(0x3efc), 0x6634 },
+	/* Recommended Common 2 */
+	{ AR0234_REG_SEQ_CTRL_PORT, 0x81ba },
+	{ AR0234_REG_SEQ_DATA_PORT, 0x3d02 },
+	{ CCI_REG16(0x3276), 0x05dc },
+	{ CCI_REG16(0x3f00), 0x9d05 },
+	{ CCI_REG16(0x3ed2), 0xfa86 },
+	{ CCI_REG16(0x3eee), 0xa4fe },
+	{ CCI_REG16(0x3ecc), 0x6e42 },
+	{ CCI_REG16(0x3ecc), 0x0e42 },
+	{ CCI_REG16(0x3eec), 0x0c0c },
+	{ CCI_REG16(0x3ee8), 0xaae4 },
+	{ CCI_REG16(0x3ee6), 0x3363 },
+	{ CCI_REG16(0x3ee6), 0x3363 },
+	{ CCI_REG16(0x3ee8), 0xaae4 },
+	{ CCI_REG16(0x3ee8), 0xaae4 },
+	{ AR0234_REG_DELTA_DK_CONTROL, 0xc24f },
+	{ AR0234_REG_AE_LUMA_TARGET, 0x5000 },
+	{ AR0234_REG_ANALOG_GAIN, 0x000d },
+	/* Maximum Analog Coarse Gain 16x */
+	{ CCI_REG16(0x3ed0), 0xff44 },
+	{ CCI_REG16(0x3ed2), 0xaa86 },
+	{ CCI_REG16(0x3ed4), 0x031f },
+	{ CCI_REG16(0x3eee), 0xa4aa },
+};
+
+static const struct cci_reg_sequence mode_1280x960_10bit_2lane[] = {
+	/* PLL Settings */
+	{ AR0234_REG_FRAME_PREAMBLE, 0x0082 },
+	{ AR0234_REG_LINE_PREAMBLE, 0x005c },
+	{ AR0234_REG_MIPI_TIMING_0, 0x5248 },
+	{ AR0234_REG_MIPI_TIMING_1, 0x3257 },
+	{ AR0234_REG_MIPI_TIMING_2, 0x904b },
+	{ AR0234_REG_MIPI_TIMING_3, 0x030b },
+	{ AR0234_REG_MIPI_TIMING_4, 0x8e09 },	/* Continuous Clock Mode */
+	{ AR0234_REG_MIPI_CNTRL, 0x002b },
+	{ AR0234_REG_COMPANDING, 0x0000 },
+	{ AR0234_REG_SERIAL_FORMAT, 0x0202 },
+	/* Timing Settings */
+	{ AR0234_REG_Y_ADDR_START, 0x0080 },
+	{ AR0234_REG_X_ADDR_START, 0x0148 },
+	{ AR0234_REG_Y_ADDR_END, 0x043f },
+	{ AR0234_REG_X_ADDR_END, 0x0647 },
+	{ AR0234_REG_SMIA_TEST, 0x1802 },
+	{ AR0234_REG_FRAME_LENGTH_LINES, 0x04c4 },
+	{ AR0234_REG_LINE_LENGTH_PCK, 0x04c4 },
+	{ AR0234_REG_OPERATION_MODE, 0x0003 },
+	{ AR0234_REG_ORIENTATION, 0x0000 },
+	{ AR0234_REG_X_ODD_INC, 0x0001 },
+	{ AR0234_REG_Y_ODD_INC, 0x0001 },
+	{ AR0234_REG_EXPOSURE, 0x010c },
+	{ AR0234_REG_DIGITAL_CTRL, 0x0006 },
+	{ AR0234_REG_DATA_FORMAT, 0x0a0a },
+	{ AR0234_REG_DATAPATH_SELECT, 0x9010 },
+};
+
+static const struct cci_reg_sequence mode_1920x1200_10bit_2lane[] = {
+	/* PLL Settings */
+	{ AR0234_REG_FRAME_PREAMBLE, 0x004C },
+	{ AR0234_REG_LINE_PREAMBLE, 0x003C },
+	{ AR0234_REG_MIPI_TIMING_0, 0x31C5 },
+	{ AR0234_REG_MIPI_TIMING_1, 0x214C },
+	{ AR0234_REG_MIPI_TIMING_2, 0x5048 },
+	{ AR0234_REG_MIPI_TIMING_3, 0x0186 },
+	{ AR0234_REG_MIPI_TIMING_4, 0x0805 },	/* Non-Continuous Clock Mode */
+	{ AR0234_REG_MIPI_CNTRL, 0x002b },
+	{ AR0234_REG_COMPANDING, 0x0000 },
+	{ AR0234_REG_SERIAL_FORMAT, 0x0202 },
+	/* Timing Settings */
+	{ AR0234_REG_Y_ADDR_START, 0x0008 },
+	{ AR0234_REG_X_ADDR_START, 0x0008 },
+	{ AR0234_REG_Y_ADDR_END, 0x04B7 },
+	{ AR0234_REG_X_ADDR_END, 0x0787 },
+	{ AR0234_REG_SMIA_TEST, 0x1802 },
+	{ AR0234_REG_FRAME_LENGTH_LINES, 0x04c4 },
+	{ AR0234_REG_LINE_LENGTH_PCK, 0x0264 },
+	{ AR0234_REG_OPERATION_MODE, 0x0003 },
+	{ AR0234_REG_ORIENTATION, 0x0000 },
+	{ AR0234_REG_X_ODD_INC, 0x0001 },
+	{ AR0234_REG_Y_ODD_INC, 0x0001 },
+	{ AR0234_REG_EXPOSURE, 0x010c },
+	{ AR0234_REG_DIGITAL_CTRL, 0x0006 },
+	{ AR0234_REG_DATA_FORMAT, 0x0a0a },
+	{ AR0234_REG_DATAPATH_SELECT, 0x9010 },
+};
+
+static const char * const ar0234_test_pattern_menu[] = {
+	"Disabled",
+	"Color Bars",
+	"Solid Color",
+	"Grey Color Bars",
+	"Walking 1s",
+};
+
+static const int ar0234_test_pattern_val[] = {
+	AR0234_TEST_PATTERN_DISABLE,
+	AR0234_TEST_PATTERN_COLOR_BARS,
+	AR0234_TEST_PATTERN_SOLID_COLOR,
+	AR0234_TEST_PATTERN_GREY_COLOR,
+	AR0234_TEST_PATTERN_WALKING,
+};
+
+static const struct ar0234_mode supported_modes[] = {
+	{
+		.width = AR0234_NATIVE_WIDTH,
+		.height = AR0234_NATIVE_HEIGHT,
+		.vts = AR0234_VTS_DEFAULT,
+		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mode_1920x1200_10bit_2lane),
+			.regs = mode_1920x1200_10bit_2lane,
+		},
+	},
+	{
+		.width = AR0234_COMMON_WIDTH,
+		.height = AR0234_COMMON_HEIGHT,
+		.vts = AR0234_VTS_DEFAULT,
+		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mode_1280x960_10bit_2lane),
+			.regs = mode_1280x960_10bit_2lane,
+		},
+	},
+};
+
+struct ar0234 {
+	struct v4l2_subdev sd;
+	struct media_pad pad;
+	struct v4l2_ctrl_handler ctrl_handler;
+
+	/* V4L2 Controls */
+	struct v4l2_ctrl *link_freq;
+	struct v4l2_ctrl *pixel_rate;
+	struct v4l2_ctrl *exposure;
+	struct v4l2_ctrl *hblank;
+	struct v4l2_ctrl *vblank;
+	struct v4l2_ctrl *vflip;
+	struct v4l2_ctrl *hflip;
+
+	struct ccs_pll pll;
+	struct clk *clk;
+	struct regmap *regmap;
+	struct v4l2_fwnode_endpoint bus_cfg;
+	unsigned long link_freq_bitmap;
+	const struct ar0234_mode *cur_mode;
+};
+
+static int ar0234_pll_calculate(struct ar0234 *ar0234, struct ccs_pll *pll,
+				unsigned int link_freq, unsigned int bpp)
+{
+	struct ccs_pll_limits limits = {
+		.min_ext_clk_freq_hz = 6000000,
+		.max_ext_clk_freq_hz = 54000000,
+
+		.vt_fr = {
+			.min_pre_pll_clk_div = 1,
+			.max_pre_pll_clk_div = 3,
+			.min_pll_ip_clk_freq_hz = 6000000,
+			.max_pll_ip_clk_freq_hz = 54000000,
+			.min_pll_multiplier = 20,
+			.max_pll_multiplier = 75,
+			.min_pll_op_clk_freq_hz = 320000000,
+			.max_pll_op_clk_freq_hz = 900000000,
+		},
+		.vt_bk = {
+			.min_sys_clk_div = 1,
+			.max_sys_clk_div = 1,
+			.min_sys_clk_freq_hz = 320000000,
+			.max_sys_clk_freq_hz = 768000000,
+			.min_pix_clk_div = 5,
+			.max_pix_clk_div = 8,
+			.min_pix_clk_freq_hz = 1,
+			.max_pix_clk_freq_hz = 90000000,
+		},
+		.op_bk = {
+			.min_sys_clk_div = 1,
+			.max_sys_clk_div = 2,
+			.min_sys_clk_freq_hz = 320000000,
+			.max_sys_clk_freq_hz = 900000000,
+			.min_pix_clk_div = 8,
+			.max_pix_clk_div = 10,
+			.min_pix_clk_freq_hz = 1,
+			.max_pix_clk_freq_hz = 60000000,
+		},
+	};
+	struct i2c_client *client = v4l2_get_subdevdata(&ar0234->sd);
+	unsigned int num_lanes = ar0234->bus_cfg.bus.mipi_csi2.num_data_lanes;
+	int ret;
+
+	memset(pll, 0, sizeof(*pll));
+
+	pll->bus_type = CCS_PLL_BUS_TYPE_CSI2_DPHY;
+	pll->op_lanes = num_lanes;
+	pll->vt_lanes = num_lanes;
+	pll->csi2.lanes = num_lanes;
+	pll->binning_horizontal = 1;
+	pll->binning_vertical = 1;
+	pll->scale_m = 16;
+	pll->scale_n = 16;
+	pll->flags = CCS_PLL_FLAG_LANE_SPEED_MODEL |
+		     CCS_PLL_FLAG_EXT_IP_PLL_DIVIDER |
+		     CCS_PLL_FLAG_OP_SYS_DDR | CCS_PLL_FLAG_OP_PIX_DDR |
+		     CCS_PLL_FLAG_FIFO_DERATING | CCS_PLL_FLAG_FIFO_OVERRATING |
+		     CCS_PLL_FLAG_EVEN_PLL_MULTIPLIER;
+	pll->bits_per_pixel = bpp;
+	pll->link_freq = link_freq;
+	pll->ext_clk_freq_hz = clk_get_rate(ar0234->clk);
+
+	ret = ccs_pll_calculate(&client->dev, &limits, pll);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int ar0234_pll_update(struct ar0234 *ar0234)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&ar0234->sd);
+	u64 link_freq =
+		ar0234->bus_cfg.link_frequencies[ar0234->link_freq->val];
+	int ret;
+
+	/* hardcode bpp here, since ar0234 only support SGRBG10_1X10. */
+	ret = ar0234_pll_calculate(ar0234, &ar0234->pll, link_freq,
+				   AR0234_SGRBG10_1X10_BPP);
+	if (ret) {
+		dev_err(&client->dev, "PLL calculations failed: %d\n", ret);
+		return ret;
+	}
+	__v4l2_ctrl_s_ctrl_int64(ar0234->pixel_rate,
+				 ar0234->pll.pixel_rate_pixel_array);
+
+	return 0;
+}
+
+static int ar0234_set_pll(struct ar0234 *ar0234)
+{
+	int ret = 0;
+
+	cci_write(ar0234->regmap, AR0234_REG_PRE_PLL_CLK_DIV,
+		  ar0234->pll.vt_fr.pre_pll_clk_div, &ret);
+	cci_write(ar0234->regmap, AR0234_REG_PLL_MULTIPLIER,
+		  ar0234->pll.vt_fr.pll_multiplier, &ret);
+	cci_write(ar0234->regmap, AR0234_REG_VT_PIX_CLK_DIV,
+		  ar0234->pll.vt_bk.pix_clk_div, &ret);
+	cci_write(ar0234->regmap, AR0234_REG_VT_SYS_CLK_DIV,
+		  ar0234->pll.vt_bk.sys_clk_div, &ret);
+	cci_write(ar0234->regmap, AR0234_REG_OP_PIX_CLK_DIV,
+		  ar0234->pll.op_bk.pix_clk_div, &ret);
+	cci_write(ar0234->regmap, AR0234_REG_OP_SYS_CLK_DIV,
+		  ar0234->pll.op_bk.sys_clk_div, &ret);
+
+	/* Wait 1ms for the PLL to lock. */
+	usleep_range(1000, 1500);
+
+	return ret;
+}
+
+static int ar0234_set_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct ar0234 *ar0234 =
+		container_of(ctrl->handler, struct ar0234, ctrl_handler);
+	struct i2c_client *client = v4l2_get_subdevdata(&ar0234->sd);
+	s64 exposure_max, exposure_def;
+	struct v4l2_subdev_state *state;
+	const struct v4l2_mbus_framefmt *format;
+	int ret;
+
+	state = v4l2_subdev_get_locked_active_state(&ar0234->sd);
+	format = v4l2_subdev_state_get_format(state, 0);
+
+	/* Propagate change of current control to all related controls */
+	if (ctrl->id == V4L2_CID_VBLANK) {
+		/* Update max exposure while meeting expected vblanking */
+		exposure_max = format->height + ctrl->val -
+			       AR0234_EXPOSURE_MAX_MARGIN;
+		exposure_def = format->height - AR0234_EXPOSURE_MAX_MARGIN;
+		__v4l2_ctrl_modify_range(ar0234->exposure,
+					 ar0234->exposure->minimum,
+					 exposure_max, ar0234->exposure->step,
+					 exposure_def);
+	}
+
+	if (ctrl->id == V4L2_CID_LINK_FREQ) {
+		if (v4l2_subdev_is_streaming(&ar0234->sd))
+			return -EBUSY;
+
+		ret = __v4l2_ctrl_s_ctrl_int64(ar0234->link_freq, ctrl->val);
+		if (ret)
+			return ret;
+
+		ret = ar0234_pll_update(ar0234);
+		if (ret)
+			return ret;
+	}
+
+	/* V4L2 controls values will be applied only when power is already up */
+	if (!pm_runtime_get_if_in_use(&client->dev))
+		return 0;
+
+	switch (ctrl->id) {
+	case V4L2_CID_ANALOGUE_GAIN:
+		ret = cci_write(ar0234->regmap, AR0234_REG_ANALOG_GAIN,
+				ctrl->val, NULL);
+		break;
+
+	case V4L2_CID_DIGITAL_GAIN:
+		ret = cci_write(ar0234->regmap, AR0234_REG_GLOBAL_GAIN,
+				ctrl->val, NULL);
+		break;
+
+	case V4L2_CID_EXPOSURE:
+		ret = cci_write(ar0234->regmap, AR0234_REG_EXPOSURE,
+				ctrl->val, NULL);
+		break;
+
+	case V4L2_CID_VBLANK:
+		ret = cci_write(ar0234->regmap, AR0234_REG_FRAME_LENGTH_LINES,
+				ar0234->cur_mode->height + ctrl->val, NULL);
+		break;
+
+	case V4L2_CID_HFLIP:
+	case V4L2_CID_VFLIP:
+	{
+		u64 reg;
+
+		ret = cci_read(ar0234->regmap, AR0234_REG_ORIENTATION,
+			       &reg, NULL);
+		if (ret)
+			break;
+
+		reg &= ~(AR0234_ORIENTATION_HFLIP |
+			 AR0234_ORIENTATION_VFLIP);
+		if (ar0234->hflip->val)
+			reg |= AR0234_ORIENTATION_HFLIP;
+		if (ar0234->vflip->val)
+			reg |= AR0234_ORIENTATION_VFLIP;
+
+		ret = cci_write(ar0234->regmap, AR0234_REG_ORIENTATION,
+				reg, NULL);
+		break;
+	}
+	case V4L2_CID_TEST_PATTERN:
+		ret = cci_write(ar0234->regmap, AR0234_REG_TEST_PATTERN,
+				ar0234_test_pattern_val[ctrl->val], NULL);
+		break;
+
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
+static const struct v4l2_ctrl_ops ar0234_ctrl_ops = {
+	.s_ctrl = ar0234_set_ctrl,
+};
+
+static int ar0234_init_controls(struct ar0234 *ar0234)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&ar0234->sd);
+	struct v4l2_fwnode_device_properties props;
+	struct v4l2_ctrl_handler *ctrl_hdlr;
+	s64 exposure_max, vblank_max, vblank_def, hblank;
+	s64 *link_frequences;
+	u32 link_freq_max;
+	int ret;
+
+	ctrl_hdlr = &ar0234->ctrl_handler;
+	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 10);
+	if (ret)
+		return ret;
+
+	link_freq_max = ar0234->bus_cfg.nr_of_link_frequencies - 1;
+	link_frequences = ar0234->bus_cfg.link_frequencies;
+	link_freq_bitmap = ar0234->link_freq_bitmap;
+	ar0234->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr,
+						   &ar0234_ctrl_ops,
+						   V4L2_CID_LINK_FREQ,
+						   link_freq_max, 0,
+						   link_frequences);
+	if (ar0234->link_freq) {
+		ar0234->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+		__v4l2_ctrl_modify_range(ar0234->link_freq,
+					 __ffs(link_freq_bitmap),
+					 __fls(link_freq_bitmap),
+					 ~link_freq_bitmap,
+					 __ffs(link_freq_bitmap));
+	}
+
+	ar0234->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &ar0234_ctrl_ops,
+					       V4L2_CID_PIXEL_RATE, 1, INT_MAX,
+					       1, 1);
+
+	v4l2_ctrl_new_std(ctrl_hdlr, &ar0234_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
+			  AR0234_ANALOG_GAIN_MIN, AR0234_ANALOG_GAIN_MAX,
+			  AR0234_ANALOG_GAIN_STEP, AR0234_ANALOG_GAIN_DEFAULT);
+	v4l2_ctrl_new_std(ctrl_hdlr, &ar0234_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
+			  AR0234_GLOBAL_GAIN_MIN, AR0234_GLOBAL_GAIN_MAX,
+			  AR0234_GLOBAL_GAIN_STEP, AR0234_GLOBAL_GAIN_DEFAULT);
+
+	exposure_max = ar0234->cur_mode->vts - AR0234_EXPOSURE_MAX_MARGIN;
+	ar0234->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &ar0234_ctrl_ops,
+					     V4L2_CID_EXPOSURE,
+					     AR0234_EXPOSURE_MIN, exposure_max,
+					     AR0234_EXPOSURE_STEP,
+					     exposure_max);
+
+	vblank_max = AR0234_VTS_MAX - ar0234->cur_mode->height;
+	vblank_def = ar0234->cur_mode->vts - ar0234->cur_mode->height;
+	ar0234->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &ar0234_ctrl_ops,
+					   V4L2_CID_VBLANK, 0, vblank_max, 1,
+					   vblank_def);
+	hblank = AR0234_PPL_DEFAULT - ar0234->cur_mode->width;
+	ar0234->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &ar0234_ctrl_ops,
+					   V4L2_CID_HBLANK, hblank, hblank, 1,
+					   hblank);
+	if (ar0234->hblank)
+		ar0234->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	ar0234->hflip = v4l2_ctrl_new_std(ctrl_hdlr, &ar0234_ctrl_ops,
+					  V4L2_CID_HFLIP, 0, 1, 1, 0);
+	ar0234->vflip = v4l2_ctrl_new_std(ctrl_hdlr, &ar0234_ctrl_ops,
+					  V4L2_CID_VFLIP, 0, 1, 1, 0);
+
+	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &ar0234_ctrl_ops,
+				     V4L2_CID_TEST_PATTERN,
+				     ARRAY_SIZE(ar0234_test_pattern_menu) - 1,
+				     0, 0, ar0234_test_pattern_menu);
+
+	ret = v4l2_fwnode_device_parse(&client->dev, &props);
+	if (ret)
+		goto error;
+
+	ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &ar0234_ctrl_ops,
+					      &props);
+	if (ret)
+		goto error;
+
+	ar0234->sd.ctrl_handler = ctrl_hdlr;
+
+	return 0;
+
+error:
+	v4l2_ctrl_handler_free(ctrl_hdlr);
+
+	return ret;
+}
+
+static void ar0234_update_pad_format(const struct ar0234_mode *mode,
+				     struct v4l2_mbus_framefmt *fmt)
+{
+	fmt->width = mode->width;
+	fmt->height = mode->height;
+	fmt->code = mode->code;
+	fmt->field = V4L2_FIELD_NONE;
+}
+
+static int ar0234_enable_streams(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state, u32 pad,
+				 u64 streams_mask)
+{
+	struct ar0234 *ar0234 = to_ar0234(sd);
+	struct i2c_client *client = v4l2_get_subdevdata(&ar0234->sd);
+	const struct ar0234_reg_list *reg_list;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(&client->dev);
+	if (ret)
+		return ret;
+
+	/*
+	 * Setting 0x301A.bit[0] will initiate a reset sequence:
+	 * the frame being generated will be truncated.
+	 */
+	cci_write(ar0234->regmap, AR0234_REG_MODE_SELECT,
+		  AR0234_MODE_RESET, &ret);
+	if (ret) {
+		dev_err(&client->dev, "failed to reset: %d\n", ret);
+		goto err_rpm_put;
+	}
+
+	usleep_range(1000, 1500);
+	ret = ar0234_set_pll(ar0234);
+	if (ret)
+		dev_err(&client->dev, "failed to set pll: %d\n", ret);
+
+	cci_multi_reg_write(ar0234->regmap, common_init,
+			    ARRAY_SIZE(common_init), &ret);
+	if (ret) {
+		dev_err(&client->dev, "failed to set common setting: %d\n",
+			ret);
+		goto err_rpm_put;
+	}
+
+	reg_list = &ar0234->cur_mode->reg_list;
+	cci_multi_reg_write(ar0234->regmap, reg_list->regs,
+			    reg_list->num_of_regs, &ret);
+	if (ret) {
+		dev_err(&client->dev, "failed to set mode: %d\n", ret);
+		goto err_rpm_put;
+	}
+
+	ret = __v4l2_ctrl_handler_setup(&ar0234->ctrl_handler);
+	if (ret)
+		goto err_rpm_put;
+
+	cci_write(ar0234->regmap, AR0234_REG_MODE_SELECT,
+			AR0234_MODE_STREAMING, &ret);
+	if (ret) {
+		dev_err(&client->dev, "failed to start stream: %d\n", ret);
+		goto err_rpm_put;
+	}
+
+	return 0;
+
+err_rpm_put:
+	pm_runtime_put(&client->dev);
+	return ret;
+}
+
+static int ar0234_disable_streams(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state, u32 pad,
+				  u64 streams_mask)
+{
+	struct ar0234 *ar0234 = to_ar0234(sd);
+	struct i2c_client *client = v4l2_get_subdevdata(&ar0234->sd);
+	int ret;
+
+	ret = cci_write(ar0234->regmap, AR0234_REG_MODE_SELECT,
+			AR0234_MODE_STANDBY, NULL);
+	if (ret < 0)
+		dev_err(&client->dev, "failed to stop stream: %d\n", ret);
+
+	pm_runtime_put(&client->dev);
+
+	return 0;
+}
+
+static int ar0234_set_format(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *sd_state,
+			     struct v4l2_subdev_format *fmt)
+{
+	struct ar0234 *ar0234 = to_ar0234(sd);
+	struct i2c_client *client = v4l2_get_subdevdata(&ar0234->sd);
+	struct v4l2_rect *crop;
+	const struct ar0234_mode *mode;
+	s64 hblank;
+	int ret;
+
+	mode = v4l2_find_nearest_size(supported_modes,
+				      ARRAY_SIZE(supported_modes),
+				      width, height,
+				      fmt->format.width,
+				      fmt->format.height);
+
+	crop = v4l2_subdev_state_get_crop(sd_state, fmt->pad);
+	crop->width = mode->width;
+	crop->height = mode->height;
+
+	ar0234_update_pad_format(mode, &fmt->format);
+	*v4l2_subdev_state_get_format(sd_state, fmt->pad) = fmt->format;
+
+	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
+		return 0;
+
+	ar0234->cur_mode = mode;
+
+	hblank = AR0234_PPL_DEFAULT - mode->width;
+	ret = __v4l2_ctrl_modify_range(ar0234->hblank, hblank, hblank,
+				       1, hblank);
+	if (ret) {
+		dev_err(&client->dev, "HB ctrl range update failed");
+		return ret;
+	}
+
+	/* Update limits and set FPS to default */
+	ret = __v4l2_ctrl_modify_range(ar0234->vblank, 0,
+				       AR0234_VTS_MAX - mode->height, 1,
+				       mode->vts - mode->height);
+	if (ret)
+		return dev_err_probe(&client->dev, ret,
+				     "VB ctrl range update failed");
+
+	ret = __v4l2_ctrl_s_ctrl(ar0234->vblank, mode->vts - mode->height);
+	if (ret)
+		return dev_err_probe(&client->dev, ret, "VB ctrl set failed");
+
+	return 0;
+}
+
+static int ar0234_enum_mbus_code(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *sd_state,
+				 struct v4l2_subdev_mbus_code_enum *code)
+{
+	if (code->index > 0)
+		return -EINVAL;
+
+	code->code = MEDIA_BUS_FMT_SGRBG10_1X10;
+
+	return 0;
+}
+
+static int ar0234_enum_frame_size(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *sd_state,
+				  struct v4l2_subdev_frame_size_enum *fse)
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
+static int ar0234_get_selection(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *state,
+				struct v4l2_subdev_selection *sel)
+{
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		sel->r.top = AR0234_PIXEL_ARRAY_TOP;
+		sel->r.left = AR0234_PIXEL_ARRAY_LEFT;
+		sel->r.width = AR0234_COMMON_WIDTH;
+		sel->r.height = AR0234_COMMON_HEIGHT;
+		break;
+
+	case V4L2_SEL_TGT_CROP:
+		sel->r = *v4l2_subdev_state_get_crop(state, 0);
+		break;
+
+	case V4L2_SEL_TGT_NATIVE_SIZE:
+		sel->r.top = 0;
+		sel->r.left = 0;
+		sel->r.width = AR0234_NATIVE_WIDTH;
+		sel->r.height = AR0234_NATIVE_HEIGHT;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int ar0234_init_state(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *sd_state)
+{
+	struct v4l2_subdev_format fmt = {
+		.which = V4L2_SUBDEV_FORMAT_TRY,
+		.pad = 0,
+		.format = {
+			.code = MEDIA_BUS_FMT_SGRBG10_1X10,
+			.width = AR0234_COMMON_WIDTH,
+			.height = AR0234_COMMON_HEIGHT,
+		},
+	};
+
+	return ar0234_set_format(sd, sd_state, &fmt);
+}
+
+static const struct v4l2_subdev_video_ops ar0234_video_ops = {
+	.s_stream = v4l2_subdev_s_stream_helper,
+};
+
+static const struct v4l2_subdev_pad_ops ar0234_pad_ops = {
+	.set_fmt = ar0234_set_format,
+	.get_fmt = v4l2_subdev_get_fmt,
+	.enable_streams = ar0234_enable_streams,
+	.disable_streams = ar0234_disable_streams,
+	.enum_mbus_code = ar0234_enum_mbus_code,
+	.enum_frame_size = ar0234_enum_frame_size,
+	.get_selection = ar0234_get_selection,
+};
+
+static const struct v4l2_subdev_core_ops ar0234_core_ops = {
+	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
+	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
+};
+
+static const struct v4l2_subdev_ops ar0234_subdev_ops = {
+	.core = &ar0234_core_ops,
+	.video = &ar0234_video_ops,
+	.pad = &ar0234_pad_ops,
+};
+
+static const struct media_entity_operations ar0234_subdev_entity_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+};
+
+static const struct v4l2_subdev_internal_ops ar0234_internal_ops = {
+	.init_state = ar0234_init_state,
+};
+
+static int ar0234_parse_fwnode(struct ar0234 *ar0234, struct device *dev)
+{
+	struct fwnode_handle *endpoint;
+	struct v4l2_fwnode_endpoint *bus_cfg = &ar0234->bus_cfg;
+	int ret;
+
+	endpoint = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0,
+						   FWNODE_GRAPH_ENDPOINT_NEXT);
+	if (!endpoint) {
+		dev_err(dev, "endpoint node not found");
+		return -EPROBE_DEFER;
+	}
+
+	bus_cfg->bus_type = V4L2_MBUS_CSI2_DPHY;
+	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, bus_cfg);
+	if (ret) {
+		dev_err(dev, "parsing endpoint node failed");
+		goto out_err;
+	}
+
+	/* Check the number of MIPI CSI2 data lanes */
+	if (bus_cfg->bus.mipi_csi2.num_data_lanes != 2 &&
+	    bus_cfg->bus.mipi_csi2.num_data_lanes != 4) {
+		dev_err(dev, "only 2 or 4 data lanes are currently supported");
+		goto out_err;
+	}
+
+	for (int i = 0; i < ar0234->bus_cfg.nr_of_link_frequencies; ++i) {
+		u64 freq = ar0234->bus_cfg.link_frequencies[i];
+		struct ccs_pll pll;
+		int rval;
+
+		rval = ar0234_pll_calculate(ar0234, &pll, freq,
+					   AR0234_SGRBG10_1X10_BPP);
+		if (rval)
+			continue;
+
+		ar0234->link_freq_bitmap |= BIT(i);
+	}
+
+	if (!ar0234->link_freq_bitmap) {
+		ret = -ENOPARAM;
+		dev_err(dev, "No valid link frequency for ar0234");
+		goto out_err;
+	}
+
+out_err:
+	v4l2_fwnode_endpoint_free(bus_cfg);
+	fwnode_handle_put(endpoint);
+	return ret;
+}
+
+static int ar0234_identify_module(struct ar0234 *ar0234)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&ar0234->sd);
+	int ret;
+	u64 val;
+
+	ret = cci_read(ar0234->regmap, AR0234_REG_CHIP_ID, &val, NULL);
+	if (ret)
+		return ret;
+
+	if (val != AR0234_CHIP_ID) {
+		dev_err(&client->dev, "chip id mismatch: %x!=%llx",
+			AR0234_CHIP_ID, val);
+		return -ENXIO;
+	}
+
+	return 0;
+}
+
+static void ar0234_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct ar0234 *ar0234 = to_ar0234(sd);
+
+	v4l2_async_unregister_subdev(&ar0234->sd);
+	v4l2_subdev_cleanup(sd);
+	media_entity_cleanup(&ar0234->sd.entity);
+	v4l2_ctrl_handler_free(&ar0234->ctrl_handler);
+	pm_runtime_disable(&client->dev);
+	pm_runtime_set_suspended(&client->dev);
+}
+
+static int ar0234_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct ar0234 *ar0234;
+	int ret;
+
+	ar0234 = devm_kzalloc(&client->dev, sizeof(*ar0234), GFP_KERNEL);
+	if (!ar0234)
+		return -ENOMEM;
+
+	ar0234->regmap = devm_cci_regmap_init_i2c(client, 16);
+	if (IS_ERR(ar0234->regmap))
+		return dev_err_probe(dev, PTR_ERR(ar0234->regmap),
+				     "failed to init CCI");
+
+	ar0234->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(ar0234->clk)) {
+		if (PTR_ERR(ar0234->clk) != -EPROBE_DEFER)
+			dev_err(dev, "failed to get xclk %ld",
+				PTR_ERR(ar0234->clk));
+		return PTR_ERR(ar0234->clk);
+	}
+
+	ret = ar0234_parse_fwnode(ar0234, dev);
+	if (ret)
+		return ret;
+
+	/* Check module identity */
+	ret = ar0234_identify_module(ar0234);
+	if (ret) {
+		dev_err(dev, "failed to find sensor: %d", ret);
+		return ret;
+	}
+
+	v4l2_i2c_subdev_init(&ar0234->sd, client, &ar0234_subdev_ops);
+
+	ar0234->cur_mode = &supported_modes[0];
+	ret = ar0234_init_controls(ar0234);
+	if (ret) {
+		dev_err(&client->dev, "failed to init controls: %d", ret);
+		goto probe_error_v4l2_ctrl_handler_free;
+	}
+
+	ar0234->sd.internal_ops = &ar0234_internal_ops;
+	ar0234->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
+			    V4L2_SUBDEV_FL_HAS_EVENTS;
+	ar0234->sd.entity.ops = &ar0234_subdev_entity_ops;
+	ar0234->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
+
+	ar0234->pad.flags = MEDIA_PAD_FL_SOURCE;
+	ret = media_entity_pads_init(&ar0234->sd.entity, 1, &ar0234->pad);
+	if (ret) {
+		dev_err(&client->dev, "failed to init entity pads: %d", ret);
+		goto probe_error_v4l2_ctrl_handler_free;
+	}
+
+	ar0234->sd.state_lock = ar0234->ctrl_handler.lock;
+	ret = v4l2_subdev_init_finalize(&ar0234->sd);
+	if (ret < 0) {
+		dev_err(dev, "v4l2 subdev init error: %d", ret);
+		goto probe_error_media_entity_cleanup;
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
+	ret = v4l2_async_register_subdev_sensor(&ar0234->sd);
+	if (ret < 0) {
+		dev_err(&client->dev, "failed to register V4L2 subdev: %d",
+			ret);
+		goto probe_error_rpm;
+	}
+
+	ret = ar0234_pll_update(ar0234);
+	if (ret)
+		dev_info(&client->dev, "failed to update pll");
+
+	return 0;
+probe_error_rpm:
+	pm_runtime_disable(&client->dev);
+	v4l2_subdev_cleanup(&ar0234->sd);
+
+probe_error_media_entity_cleanup:
+	media_entity_cleanup(&ar0234->sd.entity);
+
+probe_error_v4l2_ctrl_handler_free:
+	v4l2_ctrl_handler_free(ar0234->sd.ctrl_handler);
+
+	return ret;
+}
+
+static const struct acpi_device_id __maybe_unused ar0234_acpi_ids[] = {
+	{ "INTC10C0" },
+	{}
+};
+MODULE_DEVICE_TABLE(acpi, ar0234_acpi_ids);
+
+static struct i2c_driver ar0234_i2c_driver = {
+	.driver = {
+		.name = "ar0234",
+		.acpi_match_table = ACPI_PTR(ar0234_acpi_ids),
+	},
+	.probe = ar0234_probe,
+	.remove = ar0234_remove,
+};
+
+module_i2c_driver(ar0234_i2c_driver);
+
+MODULE_DESCRIPTION("ON Semiconductor ar0234 sensor driver");
+MODULE_AUTHOR("Dongcheng Yan <dongcheng.yan@intel.com>");
+MODULE_AUTHOR("Hao Yao <hao.yao@intel.com>");
+MODULE_LICENSE("GPL");

base-commit: 3c93533c94aa4b609dab8ea16648ce0849a92d6c
-- 
2.34.1


