Return-Path: <linux-media+bounces-10286-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4078B509D
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 07:14:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B00351F22C2D
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 05:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41E58D520;
	Mon, 29 Apr 2024 05:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lQsJExsR"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41B7D515
	for <linux-media@vger.kernel.org>; Mon, 29 Apr 2024 05:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714367643; cv=none; b=mH4XflwAussS1J1Muj/Jc6ihI5Aut+27vH4AFFLF5UpIIb1yp6+NGGXWpF9eS88AFPLxv8dsb7njhOYwWPP6qB2gOaOBHk5nnpBkD1QwQUoDWqBkfZduod5skxY19qChdlnjKmL7jJe6hBJ/D2GS8p2Wn+0CqvuVDBmG8OTGwXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714367643; c=relaxed/simple;
	bh=49Ed2p8Ofr97WdLTVbsFXpusb+GqmByW9rwtRT+K6d8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aNHd+H2zKflFvPG3LpmgyF5kyzZv0MIFLO9Lr1yrevAfbAfkVtYLTlpaTNx6BOTvr7FKDTiWbLUElHt1nz63jOVXONSF9mxX9qqGG6KO9y1AHXWsAfWNqwBjvZGuVRuiCWdSg758Shskfe8uGWmRpab2buFKW8YDsrgTm2BvCGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lQsJExsR; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714367641; x=1745903641;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=49Ed2p8Ofr97WdLTVbsFXpusb+GqmByW9rwtRT+K6d8=;
  b=lQsJExsR1nmETVCmfn2AqoWP5CXz88ndo9AR6kO+EKcQX0ZfJJZQ1Vja
   TcIOI/ItTyq4j1FYPmhrFIb3Xg267EcVqDyDJmhrFIGUcC/JlNv3vZ5OH
   Apglp4AL8slhtR1oZ+6AmM+z4pIXQBIwKIEqI5ggwR6r3ym6EHP+awmSw
   sN7ED02odYAoBa3JuYyY7Ndz0WKnycM06BWpGN7TmC6suH0wkkFeTVWQD
   kmRQ2zn5Wk/zHdcsVXs8RH1hUvmHbDSDU88YDXA41MdXHNTfFmU3YQak8
   tcYwkVYq6WEmaFJcNROzto6kBbiTS9j7HVZLaPs5FcEUIcm8f8BTkdqWb
   w==;
X-CSE-ConnectionGUID: jZQgTGdhSeGFf2BXSt33ZA==
X-CSE-MsgGUID: I9qdBq2DSYqqfQlXoT6ERQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="13789085"
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; 
   d="scan'208";a="13789085"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 22:14:00 -0700
X-CSE-ConnectionGUID: A8K5OXGLS6yQpF5qcs4H3Q==
X-CSE-MsgGUID: G94LMuKsQAqvjNkShRn5EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; 
   d="scan'208";a="30798789"
Received: from bjledic266.bj.intel.com ([172.16.127.175])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 22:13:58 -0700
From: Dongcheng Yan <dongcheng.yan@intel.com>
To: sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org
Cc: tomi.valkeinen@ideasonboard.com,
	jacopo.mondi@ideasonboard.com,
	bingbu.cao@linux.intel.com,
	daxing.li@intel.com
Subject: [PATCH v2] media: i2c: Add ar0234 camera sensor driver
Date: Mon, 29 Apr 2024 13:13:33 +0800
Message-Id: <20240429051333.1306453-1-dongcheng.yan@intel.com>
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
- runtime PM support
- 1280x960 at 30FPS

Signed-off-by: Dongcheng Yan <dongcheng.yan@intel.com>
---
 drivers/media/i2c/Kconfig  |   11 +
 drivers/media/i2c/Makefile |    1 +
 drivers/media/i2c/ar0234.c | 1053 ++++++++++++++++++++++++++++++++++++
 3 files changed, 1065 insertions(+)
 create mode 100644 drivers/media/i2c/ar0234.c

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 56f276b920ab..4f50a489cfcc 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -51,6 +51,17 @@ config VIDEO_ALVIUM_CSI2
 	  To compile this driver as a module, choose M here: the
 	  module will be called alvium-csi2.
 
+config VIDEO_AR0234
+	tristate "ON Semiconductor AR0234 sensor support"
+	depends on ACPI || COMPILE_TEST
+	select V4L2_CCI_I2C
+	help
+	  This is a Video4Linux2 sensor driver for the ON Semiconductor
+	  AR0234 camera.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called ar0234.
+
 config VIDEO_AR0521
 	tristate "ON Semiconductor AR0521 sensor support"
 	help
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index dfbe6448b549..57b4f62106d9 100644
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
index 000000000000..cdddd29d6469
--- /dev/null
+++ b/drivers/media/i2c/ar0234.c
@@ -0,0 +1,1053 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2019 - 2024 Intel Corporation.
+
+#include <asm/unaligned.h>
+#include <linux/acpi.h>
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+
+#include <media/v4l2-cci.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
+
+#define PIXEL_RATE			180000000ULL
+
+/* Chip ID */
+#define AR0234_REG_CHIP_ID		CCI_REG16(0x3000)
+#define AR0234_CHIP_ID			0x0a56
+
+#define AR0234_REG_MODE_SELECT		CCI_REG16(0x301a)
+#define AR0234_MODE_RESET		0x00d9
+#define AR0234_MODE_STANDBY		0x2058
+#define AR0234_MODE_STREAMING		0x205c
+
+/* V_TIMING internal */
+#define AR0234_REG_VTS			CCI_REG16(0x300a)
+#define AR0234_VTS_MAX			0xffff
+
+/* Exposure control */
+#define AR0234_REG_EXPOSURE		CCI_REG16(0x3012)
+#define AR0234_EXPOSURE_MIN		0
+#define AR0234_EXPOSURE_MAX_MARGIN	80
+#define AR0234_EXPOSURE_STEP		1
+
+/* Analog gain control */
+#define AR0234_REG_ANALOG_GAIN		CCI_REG16(0x3060)
+#define AR0234_ANAL_GAIN_MIN		0
+#define AR0234_ANAL_GAIN_MAX		0x7f
+#define AR0234_ANAL_GAIN_STEP		1
+#define AR0234_ANAL_GAIN_DEFAULT	0xe
+
+/* Digital gain control */
+#define AR0234_REG_GLOBAL_GAIN		CCI_REG16(0x305e)
+#define AR0234_DGTL_GAIN_MIN		0
+#define AR0234_DGTL_GAIN_MAX		0x7ff
+#define AR0234_DGTL_GAIN_STEP		1
+#define AR0234_DGTL_GAIN_DEFAULT	0x80
+
+#define AR0234_NATIVE_WIDTH		1280
+#define AR0234_NATIVE_HEIGHT		960
+
+#define to_ar0234(_sd)	container_of(_sd, struct ar0234, sd)
+
+struct ar0234_reg_list {
+	u32 num_of_regs;
+	const struct cci_reg_sequence *regs;
+};
+
+struct ar0234_link_freq_config {
+	const struct ar0234_reg_list reg_list;
+};
+
+struct ar0234_mode {
+	u32 width;
+	u32 height;
+
+	u32 vts_def;
+	u32 vts_min;
+
+	u32 link_freq_index;
+	u32 code;
+
+	u32 hblank;
+	u32 vblank;
+
+	/* Sensor register settings for this mode */
+	const struct ar0234_reg_list reg_list;
+};
+
+static const struct cci_reg_sequence link_freq_360M_1280x960_10bit_2lane[] = {
+	{ CCI_REG16(0x302a), 0x0005 },
+	{ CCI_REG16(0x302c), 0x0004 },
+	{ CCI_REG16(0x302e), 0x0003 },
+	{ CCI_REG16(0x3030), 0x0050 },
+	{ CCI_REG16(0x3036), 0x000a },
+	{ CCI_REG16(0x3038), 0x0002 },
+	{ CCI_REG16(0x31b0), 0x006e },
+	{ CCI_REG16(0x31b2), 0x0050 },
+	{ CCI_REG16(0x31b4), 0x4207 },
+	{ CCI_REG16(0x31b6), 0x2213 },
+	{ CCI_REG16(0x31b8), 0x704a },
+	{ CCI_REG16(0x31ba), 0x0289 },
+	{ CCI_REG16(0x31bc), 0x8c08 },
+	{ CCI_REG16(0x31ae), 0x0202 },
+	{ CCI_REG16(0x3002), 0x0080 },
+	{ CCI_REG16(0x3004), 0x0148 },
+	{ CCI_REG16(0x3006), 0x043f },
+	{ CCI_REG16(0x3008), 0x0647 },
+	{ CCI_REG16(0x300a), 0x05b5 },
+	{ CCI_REG16(0x300c), 0x0268 },
+	{ CCI_REG16(0x3012), 0x058c },
+	{ CCI_REG16(0x31ac), 0x0a0a },
+	{ CCI_REG16(0x306e), 0x9010 },
+	{ CCI_REG16(0x30a2), 0x0001 },
+	{ CCI_REG16(0x30a6), 0x0001 },
+	{ CCI_REG16(0x3082), 0x0003 },
+	{ CCI_REG16(0x3040), 0x0000 },
+	{ CCI_REG16(0x31d0), 0x0000 },
+};
+
+static const struct cci_reg_sequence mode_1280x960_10bit_2lane[] = {
+	{ CCI_REG16(0x3f4c), 0x121f },
+	{ CCI_REG16(0x3f4e), 0x121f },
+	{ CCI_REG16(0x3f50), 0x0b81 },
+	{ CCI_REG16(0x31e0), 0x0003 },
+	{ CCI_REG16(0x30b0), 0x0028 },
+	/* R0X3088 specify the sequencer RAM access address. */
+	{ CCI_REG16(0x3088), 0x8000 },
+	/* R0X3086 write the sequencer RAM. */
+	{ CCI_REG16(0x3086), 0xc1ae },
+	{ CCI_REG16(0x3086), 0x327f },
+	{ CCI_REG16(0x3086), 0x5780 },
+	{ CCI_REG16(0x3086), 0x272f },
+	{ CCI_REG16(0x3086), 0x7416 },
+	{ CCI_REG16(0x3086), 0x7e13 },
+	{ CCI_REG16(0x3086), 0x8000 },
+	{ CCI_REG16(0x3086), 0x307e },
+	{ CCI_REG16(0x3086), 0xff80 },
+	{ CCI_REG16(0x3086), 0x20c3 },
+	{ CCI_REG16(0x3086), 0xb00e },
+	{ CCI_REG16(0x3086), 0x8190 },
+	{ CCI_REG16(0x3086), 0x1643 },
+	{ CCI_REG16(0x3086), 0x1651 },
+	{ CCI_REG16(0x3086), 0x9d3e },
+	{ CCI_REG16(0x3086), 0x9545 },
+	{ CCI_REG16(0x3086), 0x2209 },
+	{ CCI_REG16(0x3086), 0x3781 },
+	{ CCI_REG16(0x3086), 0x9016 },
+	{ CCI_REG16(0x3086), 0x4316 },
+	{ CCI_REG16(0x3086), 0x7f90 },
+	{ CCI_REG16(0x3086), 0x8000 },
+	{ CCI_REG16(0x3086), 0x387f },
+	{ CCI_REG16(0x3086), 0x1380 },
+	{ CCI_REG16(0x3086), 0x233b },
+	{ CCI_REG16(0x3086), 0x7f93 },
+	{ CCI_REG16(0x3086), 0x4502 },
+	{ CCI_REG16(0x3086), 0x8000 },
+	{ CCI_REG16(0x3086), 0x7fb0 },
+	{ CCI_REG16(0x3086), 0x8d66 },
+	{ CCI_REG16(0x3086), 0x7f90 },
+	{ CCI_REG16(0x3086), 0x8192 },
+	{ CCI_REG16(0x3086), 0x3c16 },
+	{ CCI_REG16(0x3086), 0x357f },
+	{ CCI_REG16(0x3086), 0x9345 },
+	{ CCI_REG16(0x3086), 0x0280 },
+	{ CCI_REG16(0x3086), 0x007f },
+	{ CCI_REG16(0x3086), 0xb08d },
+	{ CCI_REG16(0x3086), 0x667f },
+	{ CCI_REG16(0x3086), 0x9081 },
+	{ CCI_REG16(0x3086), 0x8237 },
+	{ CCI_REG16(0x3086), 0x4502 },
+	{ CCI_REG16(0x3086), 0x3681 },
+	{ CCI_REG16(0x3086), 0x8044 },
+	{ CCI_REG16(0x3086), 0x1631 },
+	{ CCI_REG16(0x3086), 0x4374 },
+	{ CCI_REG16(0x3086), 0x1678 },
+	{ CCI_REG16(0x3086), 0x7b7d },
+	{ CCI_REG16(0x3086), 0x4502 },
+	{ CCI_REG16(0x3086), 0x450a },
+	{ CCI_REG16(0x3086), 0x7e12 },
+	{ CCI_REG16(0x3086), 0x8180 },
+	{ CCI_REG16(0x3086), 0x377f },
+	{ CCI_REG16(0x3086), 0x1045 },
+	{ CCI_REG16(0x3086), 0x0a0e },
+	{ CCI_REG16(0x3086), 0x7fd4 },
+	{ CCI_REG16(0x3086), 0x8024 },
+	{ CCI_REG16(0x3086), 0x0e82 },
+	{ CCI_REG16(0x3086), 0x9cc2 },
+	{ CCI_REG16(0x3086), 0xafa8 },
+	{ CCI_REG16(0x3086), 0xaa03 },
+	{ CCI_REG16(0x3086), 0x430d },
+	{ CCI_REG16(0x3086), 0x2d46 },
+	{ CCI_REG16(0x3086), 0x4316 },
+	{ CCI_REG16(0x3086), 0x5f16 },
+	{ CCI_REG16(0x3086), 0x530d },
+	{ CCI_REG16(0x3086), 0x1660 },
+	{ CCI_REG16(0x3086), 0x401e },
+	{ CCI_REG16(0x3086), 0x2904 },
+	{ CCI_REG16(0x3086), 0x2984 },
+	{ CCI_REG16(0x3086), 0x81e7 },
+	{ CCI_REG16(0x3086), 0x816f },
+	{ CCI_REG16(0x3086), 0x1706 },
+	{ CCI_REG16(0x3086), 0x81e7 },
+	{ CCI_REG16(0x3086), 0x7f81 },
+	{ CCI_REG16(0x3086), 0x5c0d },
+	{ CCI_REG16(0x3086), 0x5754 },
+	{ CCI_REG16(0x3086), 0x495f },
+	{ CCI_REG16(0x3086), 0x5305 },
+	{ CCI_REG16(0x3086), 0x5307 },
+	{ CCI_REG16(0x3086), 0x4d2b },
+	{ CCI_REG16(0x3086), 0xf810 },
+	{ CCI_REG16(0x3086), 0x164c },
+	{ CCI_REG16(0x3086), 0x0755 },
+	{ CCI_REG16(0x3086), 0x562b },
+	{ CCI_REG16(0x3086), 0xb82b },
+	{ CCI_REG16(0x3086), 0x984e },
+	{ CCI_REG16(0x3086), 0x1129 },
+	{ CCI_REG16(0x3086), 0x9460 },
+	{ CCI_REG16(0x3086), 0x5c09 },
+	{ CCI_REG16(0x3086), 0x5c1b },
+	{ CCI_REG16(0x3086), 0x4002 },
+	{ CCI_REG16(0x3086), 0x4500 },
+	{ CCI_REG16(0x3086), 0x4580 },
+	{ CCI_REG16(0x3086), 0x29b6 },
+	{ CCI_REG16(0x3086), 0x7f80 },
+	{ CCI_REG16(0x3086), 0x4004 },
+	{ CCI_REG16(0x3086), 0x7f88 },
+	{ CCI_REG16(0x3086), 0x4109 },
+	{ CCI_REG16(0x3086), 0x5c0b },
+	{ CCI_REG16(0x3086), 0x29b2 },
+	{ CCI_REG16(0x3086), 0x4115 },
+	{ CCI_REG16(0x3086), 0x5c03 },
+	{ CCI_REG16(0x3086), 0x4105 },
+	{ CCI_REG16(0x3086), 0x5f2b },
+	{ CCI_REG16(0x3086), 0x902b },
+	{ CCI_REG16(0x3086), 0x8081 },
+	{ CCI_REG16(0x3086), 0x6f40 },
+	{ CCI_REG16(0x3086), 0x1041 },
+	{ CCI_REG16(0x3086), 0x0160 },
+	{ CCI_REG16(0x3086), 0x29a2 },
+	{ CCI_REG16(0x3086), 0x29a3 },
+	{ CCI_REG16(0x3086), 0x5f4d },
+	{ CCI_REG16(0x3086), 0x1c17 },
+	{ CCI_REG16(0x3086), 0x0281 },
+	{ CCI_REG16(0x3086), 0xe729 },
+	{ CCI_REG16(0x3086), 0x8345 },
+	{ CCI_REG16(0x3086), 0x8840 },
+	{ CCI_REG16(0x3086), 0x0f7f },
+	{ CCI_REG16(0x3086), 0x8a40 },
+	{ CCI_REG16(0x3086), 0x2345 },
+	{ CCI_REG16(0x3086), 0x8024 },
+	{ CCI_REG16(0x3086), 0x4008 },
+	{ CCI_REG16(0x3086), 0x7f88 },
+	{ CCI_REG16(0x3086), 0x5d29 },
+	{ CCI_REG16(0x3086), 0x9288 },
+	{ CCI_REG16(0x3086), 0x102b },
+	{ CCI_REG16(0x3086), 0x0489 },
+	{ CCI_REG16(0x3086), 0x165c },
+	{ CCI_REG16(0x3086), 0x4386 },
+	{ CCI_REG16(0x3086), 0x170b },
+	{ CCI_REG16(0x3086), 0x5c03 },
+	{ CCI_REG16(0x3086), 0x8a48 },
+	{ CCI_REG16(0x3086), 0x4d4e },
+	{ CCI_REG16(0x3086), 0x2b80 },
+	{ CCI_REG16(0x3086), 0x4c09 },
+	{ CCI_REG16(0x3086), 0x4119 },
+	{ CCI_REG16(0x3086), 0x816f },
+	{ CCI_REG16(0x3086), 0x4110 },
+	{ CCI_REG16(0x3086), 0x4001 },
+	{ CCI_REG16(0x3086), 0x6029 },
+	{ CCI_REG16(0x3086), 0x8229 },
+	{ CCI_REG16(0x3086), 0x8329 },
+	{ CCI_REG16(0x3086), 0x435c },
+	{ CCI_REG16(0x3086), 0x055f },
+	{ CCI_REG16(0x3086), 0x4d1c },
+	{ CCI_REG16(0x3086), 0x81e7 },
+	{ CCI_REG16(0x3086), 0x4502 },
+	{ CCI_REG16(0x3086), 0x8180 },
+	{ CCI_REG16(0x3086), 0x7f80 },
+	{ CCI_REG16(0x3086), 0x410a },
+	{ CCI_REG16(0x3086), 0x9144 },
+	{ CCI_REG16(0x3086), 0x1609 },
+	{ CCI_REG16(0x3086), 0x2fc3 },
+	{ CCI_REG16(0x3086), 0xb130 },
+	{ CCI_REG16(0x3086), 0xc3b1 },
+	{ CCI_REG16(0x3086), 0x0343 },
+	{ CCI_REG16(0x3086), 0x164a },
+	{ CCI_REG16(0x3086), 0x0a43 },
+	{ CCI_REG16(0x3086), 0x160b },
+	{ CCI_REG16(0x3086), 0x4316 },
+	{ CCI_REG16(0x3086), 0x8f43 },
+	{ CCI_REG16(0x3086), 0x1690 },
+	{ CCI_REG16(0x3086), 0x4316 },
+	{ CCI_REG16(0x3086), 0x7f81 },
+	{ CCI_REG16(0x3086), 0x450a },
+	{ CCI_REG16(0x3086), 0x410f },
+	{ CCI_REG16(0x3086), 0x7f83 },
+	{ CCI_REG16(0x3086), 0x5d29 },
+	{ CCI_REG16(0x3086), 0x4488 },
+	{ CCI_REG16(0x3086), 0x102b },
+	{ CCI_REG16(0x3086), 0x0453 },
+	{ CCI_REG16(0x3086), 0x0d40 },
+	{ CCI_REG16(0x3086), 0x2345 },
+	{ CCI_REG16(0x3086), 0x0240 },
+	{ CCI_REG16(0x3086), 0x087f },
+	{ CCI_REG16(0x3086), 0x8053 },
+	{ CCI_REG16(0x3086), 0x0d89 },
+	{ CCI_REG16(0x3086), 0x165c },
+	{ CCI_REG16(0x3086), 0x4586 },
+	{ CCI_REG16(0x3086), 0x170b },
+	{ CCI_REG16(0x3086), 0x5c05 },
+	{ CCI_REG16(0x3086), 0x8a60 },
+	{ CCI_REG16(0x3086), 0x4b91 },
+	{ CCI_REG16(0x3086), 0x4416 },
+	{ CCI_REG16(0x3086), 0x09c1 },
+	{ CCI_REG16(0x3086), 0x2ca9 },
+	{ CCI_REG16(0x3086), 0xab30 },
+	{ CCI_REG16(0x3086), 0x51b3 },
+	{ CCI_REG16(0x3086), 0x3d5a },
+	{ CCI_REG16(0x3086), 0x7e3d },
+	{ CCI_REG16(0x3086), 0x7e19 },
+	{ CCI_REG16(0x3086), 0x8000 },
+	{ CCI_REG16(0x3086), 0x8b1f },
+	{ CCI_REG16(0x3086), 0x2a1f },
+	{ CCI_REG16(0x3086), 0x83a2 },
+	{ CCI_REG16(0x3086), 0x7516 },
+	{ CCI_REG16(0x3086), 0xad33 },
+	{ CCI_REG16(0x3086), 0x450a },
+	{ CCI_REG16(0x3086), 0x7f53 },
+	{ CCI_REG16(0x3086), 0x8023 },
+	{ CCI_REG16(0x3086), 0x8c66 },
+	{ CCI_REG16(0x3086), 0x7f13 },
+	{ CCI_REG16(0x3086), 0x8184 },
+	{ CCI_REG16(0x3086), 0x1481 },
+	{ CCI_REG16(0x3086), 0x8031 },
+	{ CCI_REG16(0x3086), 0x3d64 },
+	{ CCI_REG16(0x3086), 0x452a },
+	{ CCI_REG16(0x3086), 0x9451 },
+	{ CCI_REG16(0x3086), 0x9e96 },
+	{ CCI_REG16(0x3086), 0x3d2b },
+	{ CCI_REG16(0x3086), 0x3d1b },
+	{ CCI_REG16(0x3086), 0x529f },
+	{ CCI_REG16(0x3086), 0x0e3d },
+	{ CCI_REG16(0x3086), 0x083d },
+	{ CCI_REG16(0x3086), 0x167e },
+	{ CCI_REG16(0x3086), 0x307e },
+	{ CCI_REG16(0x3086), 0x1175 },
+	{ CCI_REG16(0x3086), 0x163e },
+	{ CCI_REG16(0x3086), 0x970e },
+	{ CCI_REG16(0x3086), 0x82b2 },
+	{ CCI_REG16(0x3086), 0x3d7f },
+	{ CCI_REG16(0x3086), 0xac3e },
+	{ CCI_REG16(0x3086), 0x4502 },
+	{ CCI_REG16(0x3086), 0x7e11 },
+	{ CCI_REG16(0x3086), 0x7fd0 },
+	{ CCI_REG16(0x3086), 0x8000 },
+	{ CCI_REG16(0x3086), 0x8c66 },
+	{ CCI_REG16(0x3086), 0x7f90 },
+	{ CCI_REG16(0x3086), 0x8194 },
+	{ CCI_REG16(0x3086), 0x3f44 },
+	{ CCI_REG16(0x3086), 0x1681 },
+	{ CCI_REG16(0x3086), 0x8416 },
+	{ CCI_REG16(0x3086), 0x2c2c },
+	{ CCI_REG16(0x3086), 0x2c2c },
+	{ CCI_REG16(0x302a), 0x0005 },
+	{ CCI_REG16(0x302c), 0x0001 },
+	{ CCI_REG16(0x302e), 0x0003 },
+	{ CCI_REG16(0x3030), 0x0032 },
+	{ CCI_REG16(0x3036), 0x000a },
+	{ CCI_REG16(0x3038), 0x0001 },
+	{ CCI_REG16(0x30b0), 0x0028 },
+	{ CCI_REG16(0x31b0), 0x0082 },
+	{ CCI_REG16(0x31b2), 0x005c },
+	{ CCI_REG16(0x31b4), 0x5248 },
+	{ CCI_REG16(0x31b6), 0x3257 },
+	{ CCI_REG16(0x31b8), 0x904b },
+	{ CCI_REG16(0x31ba), 0x030b },
+	{ CCI_REG16(0x31bc), 0x8e09 },
+	{ CCI_REG16(0x3354), 0x002b },
+	{ CCI_REG16(0x31d0), 0x0000 },
+	{ CCI_REG16(0x31ae), 0x0204 },
+	{ CCI_REG16(0x3002), 0x00d0 },
+	{ CCI_REG16(0x3004), 0x0148 },
+	{ CCI_REG16(0x3006), 0x048f },
+	{ CCI_REG16(0x3008), 0x0647 },
+	{ CCI_REG16(0x3064), 0x1802 },
+	{ CCI_REG16(0x300a), 0x04c4 },
+	{ CCI_REG16(0x300c), 0x04c4 },
+	{ CCI_REG16(0x30a2), 0x0001 },
+	{ CCI_REG16(0x30a6), 0x0001 },
+	{ CCI_REG16(0x3012), 0x010c },
+	{ CCI_REG16(0x3786), 0x0006 },
+	{ CCI_REG16(0x31ae), 0x0202 },
+	{ CCI_REG16(0x3088), 0x8050 },
+	{ CCI_REG16(0x3086), 0x9237 },
+	{ CCI_REG16(0x3044), 0x0410 },
+	{ CCI_REG16(0x3094), 0x03d4 },
+	{ CCI_REG16(0x3096), 0x0280 },
+	{ CCI_REG16(0x30ba), 0x7606 },
+	{ CCI_REG16(0x30b0), 0x0028 },
+	{ CCI_REG16(0x30ba), 0x7600 },
+	{ CCI_REG16(0x30fe), 0x002a },
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
+	{ CCI_REG16(0x3088), 0x81ba },
+	{ CCI_REG16(0x3086), 0x3d02 },
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
+	{ CCI_REG16(0x3180), 0xc24f },
+	{ CCI_REG16(0x3102), 0x5000 },
+	{ CCI_REG16(0x3060), 0x000d },
+	{ CCI_REG16(0x3ed0), 0xff44 },
+	{ CCI_REG16(0x3ed2), 0xaa86 },
+	{ CCI_REG16(0x3ed4), 0x031f },
+	{ CCI_REG16(0x3eee), 0xa4aa },
+};
+
+static const s64 link_freq_menu_items[] = {
+	360000000ULL,
+};
+
+static const struct ar0234_link_freq_config link_freq_configs[] = {
+	{
+		.reg_list = {
+			.num_of_regs =
+				ARRAY_SIZE(link_freq_360M_1280x960_10bit_2lane),
+			.regs = link_freq_360M_1280x960_10bit_2lane,
+		}
+	},
+};
+
+static const struct ar0234_mode supported_modes[] = {
+	{
+		.width = AR0234_NATIVE_WIDTH,
+		.height = AR0234_NATIVE_HEIGHT,
+		.vts_def = 2435,
+		.vts_min = 2435,
+		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mode_1280x960_10bit_2lane),
+			.regs = mode_1280x960_10bit_2lane,
+		},
+		.link_freq_index = 0,
+		.hblank = 3600,
+		.vblank = 1475,
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
+	struct v4l2_ctrl *exposure;
+	struct v4l2_ctrl *analogue_gain;
+	struct v4l2_ctrl *digital_gain;
+	struct v4l2_ctrl *pixel_rate;
+	struct v4l2_ctrl *hblank;
+	struct v4l2_ctrl *vblank;
+
+	struct regmap *regmap;
+	unsigned long link_freq_bitmap;
+	const struct ar0234_mode *cur_mode;
+};
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
+		ret = cci_write(ar0234->regmap, AR0234_REG_VTS,
+				ar0234->cur_mode->height + ctrl->val, NULL);
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
+	s64 exposure_max, vblank, hblank;
+	u32 link_freq_size;
+	int ret;
+
+	ctrl_hdlr = &ar0234->ctrl_handler;
+	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 8);
+	if (ret)
+		return ret;
+
+	link_freq_size = ARRAY_SIZE(link_freq_menu_items) - 1;
+	ar0234->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr,
+						   &ar0234_ctrl_ops,
+						   V4L2_CID_LINK_FREQ,
+						   link_freq_size, 0,
+						   link_freq_menu_items);
+	if (ar0234->link_freq)
+		ar0234->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	v4l2_ctrl_new_std(ctrl_hdlr, &ar0234_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
+			  AR0234_ANAL_GAIN_MIN, AR0234_ANAL_GAIN_MAX,
+			  AR0234_ANAL_GAIN_STEP, AR0234_ANAL_GAIN_DEFAULT);
+	v4l2_ctrl_new_std(ctrl_hdlr, &ar0234_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
+			  AR0234_DGTL_GAIN_MIN, AR0234_DGTL_GAIN_MAX,
+			  AR0234_DGTL_GAIN_STEP, AR0234_DGTL_GAIN_DEFAULT);
+
+	exposure_max = ar0234->cur_mode->vts_def - AR0234_EXPOSURE_MAX_MARGIN;
+	ar0234->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &ar0234_ctrl_ops,
+					     V4L2_CID_EXPOSURE,
+					     AR0234_EXPOSURE_MIN, exposure_max,
+					     AR0234_EXPOSURE_STEP,
+					     exposure_max);
+
+	ar0234->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &ar0234_ctrl_ops,
+					       V4L2_CID_PIXEL_RATE,
+					       PIXEL_RATE,
+					       PIXEL_RATE, 1,
+					       PIXEL_RATE);
+	if (ar0234->pixel_rate)
+		ar0234->pixel_rate->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	vblank = AR0234_VTS_MAX - ar0234->cur_mode->height;
+	ar0234->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &ar0234_ctrl_ops,
+					   V4L2_CID_VBLANK, 0, vblank, 1,
+					   ar0234->cur_mode->vblank);
+	hblank = ar0234->cur_mode->hblank;
+	ar0234->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &ar0234_ctrl_ops,
+					   V4L2_CID_HBLANK, hblank, hblank, 1,
+					   hblank);
+	if (ar0234->hblank)
+		ar0234->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	if (ctrl_hdlr->error)
+		return ctrl_hdlr->error;
+
+	ret = v4l2_fwnode_device_parse(&client->dev, &props);
+	if (ret)
+		return ret;
+
+	ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &ar0234_ctrl_ops,
+					      &props);
+	if (ret)
+		return ret;
+
+	ar0234->sd.ctrl_handler = ctrl_hdlr;
+
+	return 0;
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
+static int ar0234_start_streaming(struct ar0234 *ar0234)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&ar0234->sd);
+	const struct ar0234_reg_list *reg_list;
+	int link_freq_index, ret;
+
+	ret = pm_runtime_resume_and_get(&client->dev);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * Setting 0X301A.bit[0] will initiate a reset sequence:
+	 * the frame being generated will be truncated.
+	 */
+	ret = cci_write(ar0234->regmap, AR0234_REG_MODE_SELECT,
+			AR0234_MODE_RESET, NULL);
+	if (ret) {
+		dev_err(&client->dev, "failed to reset");
+		goto err_rpm_put;
+	}
+
+	usleep_range(1000, 1500);
+
+	reg_list = &ar0234->cur_mode->reg_list;
+	ret = cci_multi_reg_write(ar0234->regmap, reg_list->regs,
+				  reg_list->num_of_regs, NULL);
+	if (ret) {
+		dev_err(&client->dev, "failed to set mode");
+		goto err_rpm_put;
+	}
+
+	link_freq_index = ar0234->cur_mode->link_freq_index;
+	if (link_freq_index > 0) {
+		reg_list = &link_freq_configs[link_freq_index].reg_list;
+		ret = cci_multi_reg_write(ar0234->regmap, reg_list->regs,
+					  reg_list->num_of_regs, NULL);
+		if (ret) {
+			dev_err(&client->dev, "failed to set plls");
+			goto err_rpm_put;
+		}
+	}
+
+	ret = __v4l2_ctrl_handler_setup(ar0234->sd.ctrl_handler);
+	if (ret)
+		goto err_rpm_put;
+
+	ret = cci_write(ar0234->regmap, AR0234_REG_MODE_SELECT,
+			AR0234_MODE_STREAMING, NULL);
+	if (ret) {
+		dev_err(&client->dev, "failed to start stream");
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
+static int ar0234_stop_streaming(struct ar0234 *ar0234)
+{
+	int ret;
+	struct i2c_client *client = v4l2_get_subdevdata(&ar0234->sd);
+
+	ret = cci_write(ar0234->regmap, AR0234_REG_MODE_SELECT,
+			AR0234_MODE_STANDBY, NULL);
+	if (ret < 0)
+		dev_err(&client->dev, "failed to stop stream");
+
+	pm_runtime_put(&client->dev);
+	return ret;
+}
+
+static int ar0234_set_stream(struct v4l2_subdev *sd, int enable)
+{
+	struct ar0234 *ar0234 = to_ar0234(sd);
+	struct v4l2_subdev_state *state;
+	int ret = 0;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+
+	if (enable)
+		ret = ar0234_start_streaming(ar0234);
+	else
+		ret = ar0234_stop_streaming(ar0234);
+
+	v4l2_subdev_unlock_state(state);
+
+	return ret;
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
+	ret = __v4l2_ctrl_s_ctrl(ar0234->link_freq, mode->link_freq_index);
+	if (ret) {
+		dev_err(&client->dev, "Link Freq ctrl set failed\n");
+		return ret;
+	}
+
+	hblank = ar0234->cur_mode->hblank;
+	ret = __v4l2_ctrl_modify_range(ar0234->hblank, hblank, hblank,
+				       1, hblank);
+	if (ret) {
+		dev_err(&client->dev, "HB ctrl range update failed\n");
+		return ret;
+	}
+
+	/* Update limits and set FPS to default */
+	ret = __v4l2_ctrl_modify_range(ar0234->vblank, 0,
+				       AR0234_VTS_MAX - mode->height, 1,
+				       ar0234->cur_mode->vblank);
+	if (ret) {
+		dev_err(&client->dev, "VB ctrl range update failed\n");
+		return ret;
+	}
+
+	ret = __v4l2_ctrl_s_ctrl(ar0234->vblank, ar0234->cur_mode->vblank);
+	if (ret) {
+		dev_err(&client->dev, "VB ctrl set failed\n");
+		return ret;
+	}
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
+	case V4L2_SEL_TGT_CROP:
+		sel->r = *v4l2_subdev_state_get_crop(state, 0);
+		break;
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		sel->r.top = 0;
+		sel->r.left = 0;
+		sel->r.width = AR0234_NATIVE_WIDTH;
+		sel->r.height = AR0234_NATIVE_HEIGHT;
+		break;
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
+			.width = AR0234_NATIVE_WIDTH,
+			.height = AR0234_NATIVE_HEIGHT,
+		},
+	};
+
+	ar0234_set_format(sd, sd_state, &fmt);
+
+	return 0;
+}
+
+static const struct v4l2_subdev_video_ops ar0234_video_ops = {
+	.s_stream = ar0234_set_stream,
+};
+
+static const struct v4l2_subdev_pad_ops ar0234_pad_ops = {
+	.set_fmt = ar0234_set_format,
+	.get_fmt = v4l2_subdev_get_fmt,
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
+	struct v4l2_fwnode_endpoint bus_cfg = {
+		.bus_type = V4L2_MBUS_CSI2_DPHY,
+	};
+	int ret;
+
+	endpoint =
+		fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0,
+						FWNODE_GRAPH_ENDPOINT_NEXT);
+	if (!endpoint) {
+		dev_err(dev, "endpoint node not found\n");
+		return -EPROBE_DEFER;
+	}
+
+	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &bus_cfg);
+	if (ret) {
+		dev_err(dev, "parsing endpoint node failed\n");
+		goto out_err;
+	}
+
+	ret = v4l2_link_freq_to_bitmap(dev, bus_cfg.link_frequencies,
+				       bus_cfg.nr_of_link_frequencies,
+				       link_freq_menu_items,
+				       ARRAY_SIZE(link_freq_menu_items),
+				       &ar0234->link_freq_bitmap);
+	if (ret)
+		goto out_err;
+
+out_err:
+	v4l2_fwnode_endpoint_free(&bus_cfg);
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
+	ret = ar0234_parse_fwnode(ar0234, dev);
+	if (ret)
+		return ret;
+
+	ar0234->regmap = devm_cci_regmap_init_i2c(client, 16);
+	if (IS_ERR(ar0234->regmap))
+		return dev_err_probe(dev, PTR_ERR(ar0234->regmap),
+				     "failed to init CCI\n");
+
+	v4l2_i2c_subdev_init(&ar0234->sd, client, &ar0234_subdev_ops);
+
+	ret = ar0234_identify_module(ar0234);
+	if (ret) {
+		dev_err(&client->dev, "failed to find sensor: %d", ret);
+		return ret;
+	}
+
+	/* Set default mode to max resolution */
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
+		dev_err(dev, "v4l2 subdev init error: %d\n", ret);
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
+static const struct acpi_device_id ar0234_acpi_ids[] = {
+	{ "INTC10C0" },
+	{}
+};
+
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
-- 
2.34.1


