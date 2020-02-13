Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D2AF15BC0B
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2020 10:49:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729632AbgBMJti (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Feb 2020 04:49:38 -0500
Received: from retiisi.org.uk ([95.216.213.190]:59676 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729666AbgBMJti (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Feb 2020 04:49:38 -0500
Received: from lanttu.localdomain (unknown [IPv6:2a01:4f9:c010:4572::e1:1001])
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTP id 4BEB2634C92
        for <linux-media@vger.kernel.org>; Thu, 13 Feb 2020 11:49:19 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 7/7] smiapp: Move definitions under driver directory
Date:   Thu, 13 Feb 2020 11:49:34 +0200
Message-Id: <20200213094934.18595-8-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200213094934.18595-1-sakari.ailus@linux.intel.com>
References: <20200213094934.18595-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

include/media/i2c/smiapp.h was meant to serve systems where the sensor is
enumerated through platform data. That's no longer necessary, hopefully
not even in out-of-tree use cases. Move the definitions to the appropriate
headers.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/smiapp/smiapp-reg.h |  4 ++
 drivers/media/i2c/smiapp/smiapp.h     | 44 ++++++++++++++++++-
 include/media/i2c/smiapp.h            | 63 ---------------------------
 3 files changed, 47 insertions(+), 64 deletions(-)
 delete mode 100644 include/media/i2c/smiapp.h

diff --git a/drivers/media/i2c/smiapp/smiapp-reg.h b/drivers/media/i2c/smiapp/smiapp-reg.h
index 43505cd0616e..e6f96309786f 100644
--- a/drivers/media/i2c/smiapp/smiapp-reg.h
+++ b/drivers/media/i2c/smiapp/smiapp-reg.h
@@ -35,6 +35,10 @@
 #define SMIAPP_FLASH_MODE_CAPABILITY_SINGLE_STROBE	BIT(0)
 #define SMIAPP_FLASH_MODE_CAPABILITY_MULTIPLE_STROBE	BIT(1)
 
+#define SMIAPP_CSI_SIGNALLING_MODE_CCP2_DATA_CLOCK	0
+#define SMIAPP_CSI_SIGNALLING_MODE_CCP2_DATA_STROBE	1
+#define SMIAPP_CSI_SIGNALLING_MODE_CSI2			2
+
 #define SMIAPP_DPHY_CTRL_AUTOMATIC			0
 /* DPHY control based on REQUESTED_LINK_BIT_RATE_MBPS */
 #define SMIAPP_DPHY_CTRL_UI				1
diff --git a/drivers/media/i2c/smiapp/smiapp.h b/drivers/media/i2c/smiapp/smiapp.h
index 4837d80dc453..6f469934f9e3 100644
--- a/drivers/media/i2c/smiapp/smiapp.h
+++ b/drivers/media/i2c/smiapp/smiapp.h
@@ -14,7 +14,6 @@
 #include <linux/mutex.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-subdev.h>
-#include <media/i2c/smiapp.h>
 
 #include "smiapp-pll.h"
 #include "smiapp-reg.h"
@@ -42,6 +41,49 @@
 
 #define SMIAPP_COLOUR_COMPONENTS	4
 
+#define SMIAPP_NAME		"smiapp"
+
+#define SMIAPP_DFL_I2C_ADDR	(0x20 >> 1) /* Default I2C Address */
+#define SMIAPP_ALT_I2C_ADDR	(0x6e >> 1) /* Alternate I2C Address */
+
+/*
+ * Sometimes due to board layout considerations the camera module can be
+ * mounted rotated. The typical rotation used is 180 degrees which can be
+ * corrected by giving a default H-FLIP and V-FLIP in the sensor readout.
+ * FIXME: rotation also changes the bayer pattern.
+ */
+enum smiapp_module_board_orient {
+	SMIAPP_MODULE_BOARD_ORIENT_0 = 0,
+	SMIAPP_MODULE_BOARD_ORIENT_180,
+};
+
+struct smiapp_flash_strobe_parms {
+	u8 mode;
+	u32 strobe_width_high_us;
+	u16 strobe_delay;
+	u16 stobe_start_point;
+	u8 trigger;
+};
+
+struct smiapp_hwconfig {
+	/*
+	 * Change the cci address if i2c_addr_alt is set.
+	 * Both default and alternate cci addr need to be present
+	 */
+	unsigned short i2c_addr_dfl;	/* Default i2c addr */
+	unsigned short i2c_addr_alt;	/* Alternate i2c addr */
+
+	uint32_t ext_clk;		/* sensor external clk */
+
+	unsigned int lanes;		/* Number of CSI-2 lanes */
+	uint32_t csi_signalling_mode;	/* SMIAPP_CSI_SIGNALLING_MODE_* */
+	uint64_t *op_sys_clock;
+
+	enum smiapp_module_board_orient module_board_orient;
+
+	struct smiapp_flash_strobe_parms *strobe_setup;
+};
+
 #include "smiapp-limits.h"
 
 struct smiapp_quirk;
diff --git a/include/media/i2c/smiapp.h b/include/media/i2c/smiapp.h
deleted file mode 100644
index 80f8251d87a3..000000000000
--- a/include/media/i2c/smiapp.h
+++ /dev/null
@@ -1,63 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * include/media/i2c/smiapp.h
- *
- * Generic driver for SMIA/SMIA++ compliant camera modules
- *
- * Copyright (C) 2011--2012 Nokia Corporation
- * Contact: Sakari Ailus <sakari.ailus@iki.fi>
- */
-
-#ifndef __SMIAPP_H_
-#define __SMIAPP_H_
-
-#include <media/v4l2-subdev.h>
-
-#define SMIAPP_NAME		"smiapp"
-
-#define SMIAPP_DFL_I2C_ADDR	(0x20 >> 1) /* Default I2C Address */
-#define SMIAPP_ALT_I2C_ADDR	(0x6e >> 1) /* Alternate I2C Address */
-
-#define SMIAPP_CSI_SIGNALLING_MODE_CCP2_DATA_CLOCK	0
-#define SMIAPP_CSI_SIGNALLING_MODE_CCP2_DATA_STROBE	1
-#define SMIAPP_CSI_SIGNALLING_MODE_CSI2			2
-
-/*
- * Sometimes due to board layout considerations the camera module can be
- * mounted rotated. The typical rotation used is 180 degrees which can be
- * corrected by giving a default H-FLIP and V-FLIP in the sensor readout.
- * FIXME: rotation also changes the bayer pattern.
- */
-enum smiapp_module_board_orient {
-	SMIAPP_MODULE_BOARD_ORIENT_0 = 0,
-	SMIAPP_MODULE_BOARD_ORIENT_180,
-};
-
-struct smiapp_flash_strobe_parms {
-	u8 mode;
-	u32 strobe_width_high_us;
-	u16 strobe_delay;
-	u16 stobe_start_point;
-	u8 trigger;
-};
-
-struct smiapp_hwconfig {
-	/*
-	 * Change the cci address if i2c_addr_alt is set.
-	 * Both default and alternate cci addr need to be present
-	 */
-	unsigned short i2c_addr_dfl;	/* Default i2c addr */
-	unsigned short i2c_addr_alt;	/* Alternate i2c addr */
-
-	uint32_t ext_clk;		/* sensor external clk */
-
-	unsigned int lanes;		/* Number of CSI-2 lanes */
-	uint32_t csi_signalling_mode;	/* SMIAPP_CSI_SIGNALLING_MODE_* */
-	uint64_t *op_sys_clock;
-
-	enum smiapp_module_board_orient module_board_orient;
-
-	struct smiapp_flash_strobe_parms *strobe_setup;
-};
-
-#endif /* __SMIAPP_H_  */
-- 
2.20.1

