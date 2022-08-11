Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C5CA58F9F4
	for <lists+linux-media@lfdr.de>; Thu, 11 Aug 2022 11:18:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234991AbiHKJSM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Aug 2022 05:18:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234965AbiHKJSE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Aug 2022 05:18:04 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B572491D0A
        for <linux-media@vger.kernel.org>; Thu, 11 Aug 2022 02:18:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 375E5B81FBD
        for <linux-media@vger.kernel.org>; Thu, 11 Aug 2022 09:18:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2157EC433D7;
        Thu, 11 Aug 2022 09:17:58 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 7/9] davinci: deprecate dm644x_ccdc, dm355_cddc and dm365_isif
Date:   Thu, 11 Aug 2022 11:17:47 +0200
Message-Id: <20220811091749.3956641-8-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220811091749.3956641-1-hverkuil-cisco@xs4all.nl>
References: <20220811091749.3956641-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Deprecate the dm644x_ccdc, dm355_cddc and dm365_isif davinci drivers:
all three depend on the vpfe_capture driver, and that driver does not
use the vb2 framework for video streaming, instead it uses the old
videobuf framework.

We want to get rid of these old drivers, so deprecated these for future
removal.

Note that include/media/davinci/vpfe_capture.h can't be moved to staging
since it is used in arch/arm/mach-davinci/davinci.h.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/platform/ti/davinci/Kconfig     | 49 ----------------
 drivers/media/platform/ti/davinci/Makefile    |  4 --
 drivers/staging/media/Kconfig                 |  1 +
 drivers/staging/media/Makefile                |  1 +
 .../media/deprecated/vpfe_capture/Kconfig     | 58 +++++++++++++++++++
 .../media/deprecated/vpfe_capture/Makefile    |  4 ++
 .../media/deprecated/vpfe_capture/TODO        |  8 +++
 .../deprecated/vpfe_capture}/ccdc_hw_device.h |  0
 .../deprecated/vpfe_capture}/dm355_ccdc.c     |  2 +-
 .../deprecated/vpfe_capture}/dm355_ccdc.h     |  0
 .../vpfe_capture}/dm355_ccdc_regs.h           |  0
 .../deprecated/vpfe_capture}/dm644x_ccdc.c    |  2 +-
 .../deprecated/vpfe_capture}/dm644x_ccdc.h    |  0
 .../vpfe_capture}/dm644x_ccdc_regs.h          |  0
 .../media/deprecated/vpfe_capture}/isif.c     |  2 +-
 .../media/deprecated/vpfe_capture}/isif.h     |  0
 .../deprecated/vpfe_capture}/isif_regs.h      |  0
 .../deprecated/vpfe_capture}/vpfe_capture.c   |  0
 18 files changed, 75 insertions(+), 56 deletions(-)
 create mode 100644 drivers/staging/media/deprecated/vpfe_capture/Kconfig
 create mode 100644 drivers/staging/media/deprecated/vpfe_capture/Makefile
 create mode 100644 drivers/staging/media/deprecated/vpfe_capture/TODO
 rename drivers/{media/platform/ti/davinci => staging/media/deprecated/vpfe_capture}/ccdc_hw_device.h (100%)
 rename drivers/{media/platform/ti/davinci => staging/media/deprecated/vpfe_capture}/dm355_ccdc.c (99%)
 rename {include/media/davinci => drivers/staging/media/deprecated/vpfe_capture}/dm355_ccdc.h (100%)
 rename drivers/{media/platform/ti/davinci => staging/media/deprecated/vpfe_capture}/dm355_ccdc_regs.h (100%)
 rename drivers/{media/platform/ti/davinci => staging/media/deprecated/vpfe_capture}/dm644x_ccdc.c (99%)
 rename {include/media/davinci => drivers/staging/media/deprecated/vpfe_capture}/dm644x_ccdc.h (100%)
 rename drivers/{media/platform/ti/davinci => staging/media/deprecated/vpfe_capture}/dm644x_ccdc_regs.h (100%)
 rename drivers/{media/platform/ti/davinci => staging/media/deprecated/vpfe_capture}/isif.c (99%)
 rename {include/media/davinci => drivers/staging/media/deprecated/vpfe_capture}/isif.h (100%)
 rename drivers/{media/platform/ti/davinci => staging/media/deprecated/vpfe_capture}/isif_regs.h (100%)
 rename drivers/{media/platform/ti/davinci => staging/media/deprecated/vpfe_capture}/vpfe_capture.c (100%)

diff --git a/drivers/media/platform/ti/davinci/Kconfig b/drivers/media/platform/ti/davinci/Kconfig
index c61e697aeb12..96d4bed7fe9e 100644
--- a/drivers/media/platform/ti/davinci/Kconfig
+++ b/drivers/media/platform/ti/davinci/Kconfig
@@ -32,55 +32,6 @@ config VIDEO_DAVINCI_VPIF_CAPTURE
 	  To compile this driver as a module, choose M here. There will
 	  be two modules called vpif.ko and vpif_capture.ko
 
-config VIDEO_DM6446_CCDC
-	tristate "TI DM6446 CCDC video capture driver"
-	depends on V4L_PLATFORM_DRIVERS
-	depends on VIDEO_DEV
-	depends on ARCH_DAVINCI || COMPILE_TEST
-	depends on I2C
-	select VIDEOBUF_DMA_CONTIG
-	help
-	   Enables DaVinci CCD hw module. DaVinci CCDC hw interfaces
-	   with decoder modules such as TVP5146 over BT656 or
-	   sensor module such as MT9T001 over a raw interface. This
-	   module configures the interface and CCDC/ISIF to do
-	   video frame capture from slave decoders.
-
-	   To compile this driver as a module, choose M here. There will
-	   be three modules called vpfe_capture.ko, vpss.ko and dm644x_ccdc.ko
-
-config VIDEO_DM355_CCDC
-	tristate "TI DM355 CCDC video capture driver"
-	depends on V4L_PLATFORM_DRIVERS
-	depends on VIDEO_DEV
-	depends on ARCH_DAVINCI || COMPILE_TEST
-	depends on I2C
-	select VIDEOBUF_DMA_CONTIG
-	help
-	   Enables DM355 CCD hw module. DM355 CCDC hw interfaces
-	   with decoder modules such as TVP5146 over BT656 or
-	   sensor module such as MT9T001 over a raw interface. This
-	   module configures the interface and CCDC/ISIF to do
-	   video frame capture from a slave decoders
-
-	   To compile this driver as a module, choose M here. There will
-	   be three modules called vpfe_capture.ko, vpss.ko and dm355_ccdc.ko
-
-config VIDEO_DM365_ISIF
-	tristate "TI DM365 ISIF video capture driver"
-	depends on V4L_PLATFORM_DRIVERS
-	depends on VIDEO_DEV
-	depends on ARCH_DAVINCI || COMPILE_TEST
-	depends on I2C
-	select VIDEOBUF_DMA_CONTIG
-	help
-	   Enables ISIF hw module. This is the hardware module for
-	   configuring ISIF in VPFE to capture Raw Bayer RGB data from
-	   a image sensor or YUV data from a YUV source.
-
-	   To compile this driver as a module, choose M here. There will
-	   be three modules called vpfe_capture.ko, vpss.ko and isif.ko
-
 config VIDEO_DAVINCI_VPBE_DISPLAY
 	tristate "TI DaVinci VPBE V4L2-Display driver"
 	depends on V4L_PLATFORM_DRIVERS
diff --git a/drivers/media/platform/ti/davinci/Makefile b/drivers/media/platform/ti/davinci/Makefile
index 05c45bf371aa..b20a91653162 100644
--- a/drivers/media/platform/ti/davinci/Makefile
+++ b/drivers/media/platform/ti/davinci/Makefile
@@ -8,9 +8,5 @@ obj-$(CONFIG_VIDEO_DAVINCI_VPIF_DISPLAY) += vpif.o vpif_display.o
 #VPIF Capture driver
 obj-$(CONFIG_VIDEO_DAVINCI_VPIF_CAPTURE) += vpif.o vpif_capture.o
 
-# Capture: DM6446 and DM355
-obj-$(CONFIG_VIDEO_DM6446_CCDC) += vpfe_capture.o vpss.o dm644x_ccdc.o
-obj-$(CONFIG_VIDEO_DM355_CCDC) += vpfe_capture.o vpss.o dm355_ccdc.o
-obj-$(CONFIG_VIDEO_DM365_ISIF) += vpfe_capture.o vpss.o isif.o
 obj-$(CONFIG_VIDEO_DAVINCI_VPBE_DISPLAY) += vpss.o vpbe.o vpbe_osd.o \
 	vpbe_venc.o vpbe_display.o
diff --git a/drivers/staging/media/Kconfig b/drivers/staging/media/Kconfig
index 7d5922a60dd5..d69b7e799471 100644
--- a/drivers/staging/media/Kconfig
+++ b/drivers/staging/media/Kconfig
@@ -62,6 +62,7 @@ source "drivers/staging/media/deprecated/fsl-viu/Kconfig"
 source "drivers/staging/media/deprecated/meye/Kconfig"
 source "drivers/staging/media/deprecated/stkwebcam/Kconfig"
 source "drivers/staging/media/deprecated/tm6000/Kconfig"
+source "drivers/staging/media/deprecated/vpfe_capture/Kconfig"
 source "drivers/staging/media/deprecated/zr364xx/Kconfig"
 endif
 
diff --git a/drivers/staging/media/Makefile b/drivers/staging/media/Makefile
index 0bbfdc269630..9ba5bd2ac621 100644
--- a/drivers/staging/media/Makefile
+++ b/drivers/staging/media/Makefile
@@ -17,3 +17,4 @@ obj-$(CONFIG_VIDEO_VIU)		+= deprecated/fsl-viu/
 obj-$(CONFIG_VIDEO_ZORAN)	+= zoran/
 obj-$(CONFIG_USB_ZR364XX)	+= deprecated/zr364xx/
 obj-$(CONFIG_DVB_AV7110)	+= av7110/
+obj-y += deprecated/vpfe_capture/
diff --git a/drivers/staging/media/deprecated/vpfe_capture/Kconfig b/drivers/staging/media/deprecated/vpfe_capture/Kconfig
new file mode 100644
index 000000000000..10250e7e566b
--- /dev/null
+++ b/drivers/staging/media/deprecated/vpfe_capture/Kconfig
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config VIDEO_DM6446_CCDC
+	tristate "TI DM6446 CCDC video capture driver"
+	depends on V4L_PLATFORM_DRIVERS
+	depends on VIDEO_DEV
+	depends on ARCH_DAVINCI || COMPILE_TEST
+	depends on I2C
+	select VIDEOBUF_DMA_CONTIG
+	help
+	  Enables DaVinci CCD hw module. DaVinci CCDC hw interfaces
+	  with decoder modules such as TVP5146 over BT656 or
+	  sensor module such as MT9T001 over a raw interface. This
+	  module configures the interface and CCDC/ISIF to do
+	  video frame capture from slave decoders.
+
+	  This driver is deprecated and is scheduled for removal by
+	  the beginning of 2023. See the TODO file for more information.
+
+	  To compile this driver as a module, choose M here. There will
+	  be two modules called vpfe_capture.ko and dm644x_ccdc.ko
+
+config VIDEO_DM355_CCDC
+	tristate "TI DM355 CCDC video capture driver"
+	depends on V4L_PLATFORM_DRIVERS
+	depends on VIDEO_DEV
+	depends on ARCH_DAVINCI || COMPILE_TEST
+	depends on I2C
+	select VIDEOBUF_DMA_CONTIG
+	help
+	  Enables DM355 CCD hw module. DM355 CCDC hw interfaces
+	  with decoder modules such as TVP5146 over BT656 or
+	  sensor module such as MT9T001 over a raw interface. This
+	  module configures the interface and CCDC/ISIF to do
+	  video frame capture from a slave decoders
+
+	  This driver is deprecated and is scheduled for removal by
+	  the beginning of 2023. See the TODO file for more information.
+
+	  To compile this driver as a module, choose M here. There will
+	  be two modules called vpfe_capture.ko and dm355_ccdc.ko
+
+config VIDEO_DM365_ISIF
+	tristate "TI DM365 ISIF video capture driver"
+	depends on V4L_PLATFORM_DRIVERS
+	depends on VIDEO_DEV
+	depends on ARCH_DAVINCI || COMPILE_TEST
+	depends on I2C
+	select VIDEOBUF_DMA_CONTIG
+	help
+	  Enables ISIF hw module. This is the hardware module for
+	  configuring ISIF in VPFE to capture Raw Bayer RGB data from
+	  a image sensor or YUV data from a YUV source.
+
+	  This driver is deprecated and is scheduled for removal by
+	  the beginning of 2023. See the TODO file for more information.
+
+	  To compile this driver as a module, choose M here. There will
+	  be two modules called vpfe_capture.ko and isif.ko
diff --git a/drivers/staging/media/deprecated/vpfe_capture/Makefile b/drivers/staging/media/deprecated/vpfe_capture/Makefile
new file mode 100644
index 000000000000..609e8dc09ce7
--- /dev/null
+++ b/drivers/staging/media/deprecated/vpfe_capture/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_VIDEO_DM6446_CCDC) += vpfe_capture.o dm644x_ccdc.o
+obj-$(CONFIG_VIDEO_DM355_CCDC) += vpfe_capture.o dm355_ccdc.o
+obj-$(CONFIG_VIDEO_DM365_ISIF) += vpfe_capture.o isif.o
diff --git a/drivers/staging/media/deprecated/vpfe_capture/TODO b/drivers/staging/media/deprecated/vpfe_capture/TODO
new file mode 100644
index 000000000000..68a6c3f3957d
--- /dev/null
+++ b/drivers/staging/media/deprecated/vpfe_capture/TODO
@@ -0,0 +1,8 @@
+These are one of the few drivers still not using the vb2
+framework, so these drivers are now deprecated with the intent of
+removing them altogether by the beginning of 2023.
+
+In order to keep these drivers they have to be converted to vb2.
+If someone is interested in doing this work, then contact the
+linux-media mailinglist (https://linuxtv.org/lists.php).
+
diff --git a/drivers/media/platform/ti/davinci/ccdc_hw_device.h b/drivers/staging/media/deprecated/vpfe_capture/ccdc_hw_device.h
similarity index 100%
rename from drivers/media/platform/ti/davinci/ccdc_hw_device.h
rename to drivers/staging/media/deprecated/vpfe_capture/ccdc_hw_device.h
diff --git a/drivers/media/platform/ti/davinci/dm355_ccdc.c b/drivers/staging/media/deprecated/vpfe_capture/dm355_ccdc.c
similarity index 99%
rename from drivers/media/platform/ti/davinci/dm355_ccdc.c
rename to drivers/staging/media/deprecated/vpfe_capture/dm355_ccdc.c
index 8fe55d1b972c..da8db53e9498 100644
--- a/drivers/media/platform/ti/davinci/dm355_ccdc.c
+++ b/drivers/staging/media/deprecated/vpfe_capture/dm355_ccdc.c
@@ -22,7 +22,7 @@
 #include <linux/err.h>
 #include <linux/module.h>
 
-#include <media/davinci/dm355_ccdc.h>
+#include "dm355_ccdc.h"
 #include <media/davinci/vpss.h>
 
 #include "dm355_ccdc_regs.h"
diff --git a/include/media/davinci/dm355_ccdc.h b/drivers/staging/media/deprecated/vpfe_capture/dm355_ccdc.h
similarity index 100%
rename from include/media/davinci/dm355_ccdc.h
rename to drivers/staging/media/deprecated/vpfe_capture/dm355_ccdc.h
diff --git a/drivers/media/platform/ti/davinci/dm355_ccdc_regs.h b/drivers/staging/media/deprecated/vpfe_capture/dm355_ccdc_regs.h
similarity index 100%
rename from drivers/media/platform/ti/davinci/dm355_ccdc_regs.h
rename to drivers/staging/media/deprecated/vpfe_capture/dm355_ccdc_regs.h
diff --git a/drivers/media/platform/ti/davinci/dm644x_ccdc.c b/drivers/staging/media/deprecated/vpfe_capture/dm644x_ccdc.c
similarity index 99%
rename from drivers/media/platform/ti/davinci/dm644x_ccdc.c
rename to drivers/staging/media/deprecated/vpfe_capture/dm644x_ccdc.c
index e4073e99914c..4a93e5ad6415 100644
--- a/drivers/media/platform/ti/davinci/dm644x_ccdc.c
+++ b/drivers/staging/media/deprecated/vpfe_capture/dm644x_ccdc.c
@@ -24,7 +24,7 @@
 #include <linux/err.h>
 #include <linux/module.h>
 
-#include <media/davinci/dm644x_ccdc.h>
+#include "dm644x_ccdc.h"
 #include <media/davinci/vpss.h>
 
 #include "dm644x_ccdc_regs.h"
diff --git a/include/media/davinci/dm644x_ccdc.h b/drivers/staging/media/deprecated/vpfe_capture/dm644x_ccdc.h
similarity index 100%
rename from include/media/davinci/dm644x_ccdc.h
rename to drivers/staging/media/deprecated/vpfe_capture/dm644x_ccdc.h
diff --git a/drivers/media/platform/ti/davinci/dm644x_ccdc_regs.h b/drivers/staging/media/deprecated/vpfe_capture/dm644x_ccdc_regs.h
similarity index 100%
rename from drivers/media/platform/ti/davinci/dm644x_ccdc_regs.h
rename to drivers/staging/media/deprecated/vpfe_capture/dm644x_ccdc_regs.h
diff --git a/drivers/media/platform/ti/davinci/isif.c b/drivers/staging/media/deprecated/vpfe_capture/isif.c
similarity index 99%
rename from drivers/media/platform/ti/davinci/isif.c
rename to drivers/staging/media/deprecated/vpfe_capture/isif.c
index 69e862de014f..4059891c2824 100644
--- a/drivers/media/platform/ti/davinci/isif.c
+++ b/drivers/staging/media/deprecated/vpfe_capture/isif.c
@@ -22,7 +22,7 @@
 #include <linux/err.h>
 #include <linux/module.h>
 
-#include <media/davinci/isif.h>
+#include "isif.h"
 #include <media/davinci/vpss.h>
 
 #include "isif_regs.h"
diff --git a/include/media/davinci/isif.h b/drivers/staging/media/deprecated/vpfe_capture/isif.h
similarity index 100%
rename from include/media/davinci/isif.h
rename to drivers/staging/media/deprecated/vpfe_capture/isif.h
diff --git a/drivers/media/platform/ti/davinci/isif_regs.h b/drivers/staging/media/deprecated/vpfe_capture/isif_regs.h
similarity index 100%
rename from drivers/media/platform/ti/davinci/isif_regs.h
rename to drivers/staging/media/deprecated/vpfe_capture/isif_regs.h
diff --git a/drivers/media/platform/ti/davinci/vpfe_capture.c b/drivers/staging/media/deprecated/vpfe_capture/vpfe_capture.c
similarity index 100%
rename from drivers/media/platform/ti/davinci/vpfe_capture.c
rename to drivers/staging/media/deprecated/vpfe_capture/vpfe_capture.c
-- 
2.35.1

