Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E121D27ECEF
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 17:31:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729434AbgI3PaV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 11:30:21 -0400
Received: from retiisi.org.uk ([95.216.213.190]:44636 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730833AbgI3P3E (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 11:29:04 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id D2D2A634CA3
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 18:28:47 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 017/100] smiapp: Rename as "ccs"
Date:   Wed, 30 Sep 2020 18:27:35 +0300
Message-Id: <20200930152858.8471-18-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
References: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rename the "smiapp" driver as "ccs". MIPI CCS is the contemporary standard
for raw Bayer camera sensors. The driver retains support for the SMIA++
and SMIA compliant camera sensors. A module alias is added for old user
space using "smiapp" module name.

Add Intel copyright while at it.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 MAINTAINERS                                   | 20 +++++++++----------
 drivers/media/i2c/Kconfig                     |  2 +-
 drivers/media/i2c/Makefile                    |  2 +-
 drivers/media/i2c/{smiapp => ccs}/Kconfig     |  7 ++++---
 drivers/media/i2c/{smiapp => ccs}/Makefile    |  4 ++--
 drivers/media/i2c/{smiapp => ccs}/ccs-core.c  |  6 ++++--
 .../media/i2c/{smiapp => ccs}/ccs-limits.c    |  0
 .../media/i2c/{smiapp => ccs}/ccs-limits.h    |  0
 drivers/media/i2c/{smiapp => ccs}/ccs-os.h    |  0
 drivers/media/i2c/{smiapp => ccs}/ccs-quirk.c |  5 +++--
 drivers/media/i2c/{smiapp => ccs}/ccs-quirk.h |  5 +++--
 .../i2c/{smiapp => ccs}/ccs-reg-access.c      |  5 +++--
 .../i2c/{smiapp => ccs}/ccs-reg-access.h      |  5 +++--
 drivers/media/i2c/{smiapp => ccs}/ccs-regs.h  |  0
 drivers/media/i2c/{smiapp => ccs}/ccs.h       |  3 ++-
 .../i2c/{smiapp => ccs}/smiapp-reg-defs.h     |  3 ++-
 16 files changed, 38 insertions(+), 29 deletions(-)
 rename drivers/media/i2c/{smiapp => ccs}/Kconfig (55%)
 rename drivers/media/i2c/{smiapp => ccs}/Makefile (57%)
 rename drivers/media/i2c/{smiapp => ccs}/ccs-core.c (99%)
 rename drivers/media/i2c/{smiapp => ccs}/ccs-limits.c (100%)
 rename drivers/media/i2c/{smiapp => ccs}/ccs-limits.h (100%)
 rename drivers/media/i2c/{smiapp => ccs}/ccs-os.h (100%)
 rename drivers/media/i2c/{smiapp => ccs}/ccs-quirk.c (97%)
 rename drivers/media/i2c/{smiapp => ccs}/ccs-quirk.h (94%)
 rename drivers/media/i2c/{smiapp => ccs}/ccs-reg-access.c (97%)
 rename drivers/media/i2c/{smiapp => ccs}/ccs-reg-access.h (86%)
 rename drivers/media/i2c/{smiapp => ccs}/ccs-regs.h (100%)
 rename drivers/media/i2c/{smiapp => ccs}/ccs.h (98%)
 rename drivers/media/i2c/{smiapp => ccs}/smiapp-reg-defs.h (99%)

diff --git a/MAINTAINERS b/MAINTAINERS
index d3126fc2cca2..06cb2c865b04 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11560,6 +11560,16 @@ M:	Oliver Neukum <oliver@neukum.org>
 S:	Maintained
 F:	drivers/usb/image/microtek.*
 
+MIPI CCS, SMIA AND SMIA++ IMAGE SENSOR DRIVER
+M:	Sakari Ailus <sakari.ailus@linux.intel.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/nokia,smia.txt
+F:	drivers/media/i2c/ccs/
+F:	drivers/media/i2c/smiapp-pll.c
+F:	drivers/media/i2c/smiapp-pll.h
+F:	include/uapi/linux/smiapp.h
+
 MIPS
 M:	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
 L:	linux-mips@vger.kernel.org
@@ -15955,16 +15965,6 @@ S:	Maintained
 F:	drivers/firmware/smccc/
 F:	include/linux/arm-smccc.h
 
-SMIA AND SMIA++ IMAGE SENSOR DRIVER
-M:	Sakari Ailus <sakari.ailus@linux.intel.com>
-L:	linux-media@vger.kernel.org
-S:	Maintained
-F:	Documentation/devicetree/bindings/media/i2c/nokia,smia.txt
-F:	drivers/media/i2c/smiapp-pll.c
-F:	drivers/media/i2c/smiapp-pll.h
-F:	drivers/media/i2c/smiapp/
-F:	include/uapi/linux/smiapp.h
-
 SMM665 HARDWARE MONITOR DRIVER
 M:	Guenter Roeck <linux@roeck-us.net>
 L:	linux-hwmon@vger.kernel.org
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index c64326ca331c..41a8b6189259 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -1233,7 +1233,7 @@ config VIDEO_S5K5BAF
 	  This is a V4L2 sensor driver for Samsung S5K5BAF 2M
 	  camera sensor with an embedded SoC image signal processor.
 
-source "drivers/media/i2c/smiapp/Kconfig"
+source "drivers/media/i2c/ccs/Kconfig"
 source "drivers/media/i2c/et8ek8/Kconfig"
 
 config VIDEO_S5C73M3
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index f0a77473979d..cb0be09e38bd 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -2,7 +2,7 @@
 msp3400-objs	:=	msp3400-driver.o msp3400-kthreads.o
 obj-$(CONFIG_VIDEO_MSP3400) += msp3400.o
 
-obj-$(CONFIG_VIDEO_SMIAPP)	+= smiapp/
+obj-$(CONFIG_VIDEO_CCS)		+= ccs/
 obj-$(CONFIG_VIDEO_ET8EK8)	+= et8ek8/
 obj-$(CONFIG_VIDEO_CX25840) += cx25840/
 obj-$(CONFIG_VIDEO_M5MOLS)	+= m5mols/
diff --git a/drivers/media/i2c/smiapp/Kconfig b/drivers/media/i2c/ccs/Kconfig
similarity index 55%
rename from drivers/media/i2c/smiapp/Kconfig
rename to drivers/media/i2c/ccs/Kconfig
index 6893b532824f..b4f8b10da420 100644
--- a/drivers/media/i2c/smiapp/Kconfig
+++ b/drivers/media/i2c/ccs/Kconfig
@@ -1,10 +1,11 @@
 # SPDX-License-Identifier: GPL-2.0-only
-config VIDEO_SMIAPP
-	tristate "SMIA++/SMIA sensor support"
+config VIDEO_CCS
+	tristate "MIPI CCS/SMIA++/SMIA sensor support"
 	depends on I2C && VIDEO_V4L2 && HAVE_CLK
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select VIDEO_SMIAPP_PLL
 	select V4L2_FWNODE
 	help
-	  This is a generic driver for SMIA++/SMIA camera modules.
+	  This is a generic driver for MIPI CCS, SMIA++ and SMIA compliant
+	  camera sensors.
diff --git a/drivers/media/i2c/smiapp/Makefile b/drivers/media/i2c/ccs/Makefile
similarity index 57%
rename from drivers/media/i2c/smiapp/Makefile
rename to drivers/media/i2c/ccs/Makefile
index c9d300b5d2bc..08dd4e948fb0 100644
--- a/drivers/media/i2c/smiapp/Makefile
+++ b/drivers/media/i2c/ccs/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
-smiapp-objs			+= ccs-core.o ccs-reg-access.o \
+ccs-objs			+= ccs-core.o ccs-reg-access.o \
 				   ccs-quirk.o ccs-limits.o
-obj-$(CONFIG_VIDEO_SMIAPP)	+= smiapp.o
+obj-$(CONFIG_VIDEO_CCS)		+= ccs.o
 
 ccflags-y += -I $(srctree)/drivers/media/i2c
diff --git a/drivers/media/i2c/smiapp/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
similarity index 99%
rename from drivers/media/i2c/smiapp/ccs-core.c
rename to drivers/media/i2c/ccs/ccs-core.c
index c82e311d2661..6a47a5c16bb1 100644
--- a/drivers/media/i2c/smiapp/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -1,9 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * drivers/media/i2c/smiapp/ccs-core.c
+ * drivers/media/i2c/ccs/ccs-core.c
  *
- * Generic driver for SMIA/SMIA++ compliant camera modules
+ * Generic driver for MIPI CCS/SMIA/SMIA++ compliant camera sensors
  *
+ * Copyright (C) 2020 Intel Corporation
  * Copyright (C) 2010--2012 Nokia Corporation
  * Contact: Sakari Ailus <sakari.ailus@iki.fi>
  *
@@ -3298,3 +3299,4 @@ module_exit(ccs_module_cleanup);
 MODULE_AUTHOR("Sakari Ailus <sakari.ailus@iki.fi>");
 MODULE_DESCRIPTION("Generic MIPI CCS/SMIA/SMIA++ camera sensor driver");
 MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("smiapp");
diff --git a/drivers/media/i2c/smiapp/ccs-limits.c b/drivers/media/i2c/ccs/ccs-limits.c
similarity index 100%
rename from drivers/media/i2c/smiapp/ccs-limits.c
rename to drivers/media/i2c/ccs/ccs-limits.c
diff --git a/drivers/media/i2c/smiapp/ccs-limits.h b/drivers/media/i2c/ccs/ccs-limits.h
similarity index 100%
rename from drivers/media/i2c/smiapp/ccs-limits.h
rename to drivers/media/i2c/ccs/ccs-limits.h
diff --git a/drivers/media/i2c/smiapp/ccs-os.h b/drivers/media/i2c/ccs/ccs-os.h
similarity index 100%
rename from drivers/media/i2c/smiapp/ccs-os.h
rename to drivers/media/i2c/ccs/ccs-os.h
diff --git a/drivers/media/i2c/smiapp/ccs-quirk.c b/drivers/media/i2c/ccs/ccs-quirk.c
similarity index 97%
rename from drivers/media/i2c/smiapp/ccs-quirk.c
rename to drivers/media/i2c/ccs/ccs-quirk.c
index 6c48d0901952..5a24da1d7aa9 100644
--- a/drivers/media/i2c/smiapp/ccs-quirk.c
+++ b/drivers/media/i2c/ccs/ccs-quirk.c
@@ -1,9 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * drivers/media/i2c/smiapp/ccs-quirk.c
+ * drivers/media/i2c/ccs/ccs-quirk.c
  *
- * Generic driver for SMIA/SMIA++ compliant camera modules
+ * Generic driver for MIPI CCS/SMIA/SMIA++ compliant camera sensors
  *
+ * Copyright (C) 2020 Intel Corporation
  * Copyright (C) 2011--2012 Nokia Corporation
  * Contact: Sakari Ailus <sakari.ailus@iki.fi>
  */
diff --git a/drivers/media/i2c/smiapp/ccs-quirk.h b/drivers/media/i2c/ccs/ccs-quirk.h
similarity index 94%
rename from drivers/media/i2c/smiapp/ccs-quirk.h
rename to drivers/media/i2c/ccs/ccs-quirk.h
index d208379158f2..3e7779e2fc4b 100644
--- a/drivers/media/i2c/smiapp/ccs-quirk.h
+++ b/drivers/media/i2c/ccs/ccs-quirk.h
@@ -1,9 +1,10 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * drivers/media/i2c/smiapp/ccs-quirk.h
+ * drivers/media/i2c/ccs/ccs-quirk.h
  *
- * Generic driver for SMIA/SMIA++ compliant camera modules
+ * Generic driver for MIPI CCS/SMIA/SMIA++ compliant camera sensors
  *
+ * Copyright (C) 2020 Intel Corporation
  * Copyright (C) 2011--2012 Nokia Corporation
  * Contact: Sakari Ailus <sakari.ailus@iki.fi>
  */
diff --git a/drivers/media/i2c/smiapp/ccs-reg-access.c b/drivers/media/i2c/ccs/ccs-reg-access.c
similarity index 97%
rename from drivers/media/i2c/smiapp/ccs-reg-access.c
rename to drivers/media/i2c/ccs/ccs-reg-access.c
index 4e6d212473fc..a8e9a235bfb3 100644
--- a/drivers/media/i2c/smiapp/ccs-reg-access.c
+++ b/drivers/media/i2c/ccs/ccs-reg-access.c
@@ -1,9 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * drivers/media/i2c/smiapp/ccs-regs.c
+ * drivers/media/i2c/ccs/ccs-reg-access.c
  *
- * Generic driver for SMIA/SMIA++ compliant camera modules
+ * Generic driver for MIPI CCS/SMIA/SMIA++ compliant camera sensors
  *
+ * Copyright (C) 2020 Intel Corporation
  * Copyright (C) 2011--2012 Nokia Corporation
  * Contact: Sakari Ailus <sakari.ailus@iki.fi>
  */
diff --git a/drivers/media/i2c/smiapp/ccs-reg-access.h b/drivers/media/i2c/ccs/ccs-reg-access.h
similarity index 86%
rename from drivers/media/i2c/smiapp/ccs-reg-access.h
rename to drivers/media/i2c/ccs/ccs-reg-access.h
index 76ac036a9538..9fdf5659ed09 100644
--- a/drivers/media/i2c/smiapp/ccs-reg-access.h
+++ b/drivers/media/i2c/ccs/ccs-reg-access.h
@@ -1,9 +1,10 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * include/media/smiapp/ccs-regs.h
+ * include/media/ccs/ccs-reg-access.h
  *
- * Generic driver for SMIA/SMIA++ compliant camera modules
+ * Generic driver for MIPI CCS/SMIA/SMIA++ compliant camera sensors
  *
+ * Copyright (C) 2020 Intel Corporation
  * Copyright (C) 2011--2012 Nokia Corporation
  * Contact: Sakari Ailus <sakari.ailus@iki.fi>
  */
diff --git a/drivers/media/i2c/smiapp/ccs-regs.h b/drivers/media/i2c/ccs/ccs-regs.h
similarity index 100%
rename from drivers/media/i2c/smiapp/ccs-regs.h
rename to drivers/media/i2c/ccs/ccs-regs.h
diff --git a/drivers/media/i2c/smiapp/ccs.h b/drivers/media/i2c/ccs/ccs.h
similarity index 98%
rename from drivers/media/i2c/smiapp/ccs.h
rename to drivers/media/i2c/ccs/ccs.h
index 20b1125d87dc..7f6ed95b7b78 100644
--- a/drivers/media/i2c/smiapp/ccs.h
+++ b/drivers/media/i2c/ccs/ccs.h
@@ -2,8 +2,9 @@
 /*
  * drivers/media/i2c/smiapp/ccs.h
  *
- * Generic driver for SMIA/SMIA++ compliant camera modules
+ * Generic driver for MIPI CCS/SMIA/SMIA++ compliant camera sensors
  *
+ * Copyright (C) 2020 Intel Corporation
  * Copyright (C) 2010--2012 Nokia Corporation
  * Contact: Sakari Ailus <sakari.ailus@iki.fi>
  */
diff --git a/drivers/media/i2c/smiapp/smiapp-reg-defs.h b/drivers/media/i2c/ccs/smiapp-reg-defs.h
similarity index 99%
rename from drivers/media/i2c/smiapp/smiapp-reg-defs.h
rename to drivers/media/i2c/ccs/smiapp-reg-defs.h
index 06b69b1ab55f..e80c110ebf3a 100644
--- a/drivers/media/i2c/smiapp/smiapp-reg-defs.h
+++ b/drivers/media/i2c/ccs/smiapp-reg-defs.h
@@ -2,8 +2,9 @@
 /*
  * drivers/media/i2c/smiapp/smiapp-reg-defs.h
  *
- * Generic driver for SMIA/SMIA++ compliant camera modules
+ * Generic driver for MIPI CCS/SMIA/SMIA++ compliant camera sensors
  *
+ * Copyright (C) 2020 Intel Corporation
  * Copyright (C) 2011--2012 Nokia Corporation
  * Contact: Sakari Ailus <sakari.ailus@iki.fi>
  */
-- 
2.27.0

