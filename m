Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6246458F9F2
	for <lists+linux-media@lfdr.de>; Thu, 11 Aug 2022 11:18:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234984AbiHKJSL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Aug 2022 05:18:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234903AbiHKJSE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Aug 2022 05:18:04 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 548F592F4C
        for <linux-media@vger.kernel.org>; Thu, 11 Aug 2022 02:18:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D6711615C4
        for <linux-media@vger.kernel.org>; Thu, 11 Aug 2022 09:18:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54324C433C1;
        Thu, 11 Aug 2022 09:18:00 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 8/9] saa7146: deprecate hexium_gemini/orion, mxb and ttpci
Date:   Thu, 11 Aug 2022 11:17:48 +0200
Message-Id: <20220811091749.3956641-9-hverkuil-cisco@xs4all.nl>
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

Deprecate the hexium_gemini, hexium_orion, mxb and ttpci saa7146-based
drivers: these drivers do not use the vb2 framework for video streaming,
instead it uses the old videobuf framework.

We want to get rid of these old drivers, so deprecated these for future
removal.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/common/Kconfig                    |  1 -
 drivers/media/common/Makefile                   |  2 +-
 drivers/media/pci/Kconfig                       |  2 --
 drivers/media/pci/Makefile                      |  4 +---
 drivers/staging/media/Kconfig                   |  1 +
 drivers/staging/media/Makefile                  |  1 +
 drivers/staging/media/av7110/Makefile           |  3 ++-
 drivers/staging/media/av7110/av7110.h           |  2 +-
 .../staging/media/deprecated/saa7146/Kconfig    |  4 ++++
 .../staging/media/deprecated/saa7146/Makefile   |  2 ++
 .../media/deprecated/saa7146/common}/Kconfig    |  0
 .../media/deprecated/saa7146/common}/Makefile   |  0
 .../media/deprecated/saa7146/common}/saa7146.h  |  0
 .../deprecated/saa7146/common}/saa7146_core.c   |  2 +-
 .../deprecated/saa7146/common}/saa7146_fops.c   |  2 +-
 .../deprecated/saa7146/common}/saa7146_hlp.c    |  2 +-
 .../deprecated/saa7146/common}/saa7146_i2c.c    |  2 +-
 .../deprecated/saa7146/common}/saa7146_vbi.c    |  2 +-
 .../deprecated/saa7146/common}/saa7146_video.c  |  2 +-
 .../deprecated/saa7146/common}/saa7146_vv.h     |  2 +-
 .../media/deprecated/saa7146}/saa7146/Kconfig   | 15 ++++++++++++---
 .../media/deprecated/saa7146}/saa7146/Makefile  |  0
 .../media/deprecated/saa7146/saa7146/TODO       |  7 +++++++
 .../deprecated/saa7146}/saa7146/hexium_gemini.c |  2 +-
 .../deprecated/saa7146}/saa7146/hexium_orion.c  |  2 +-
 .../media/deprecated/saa7146}/saa7146/mxb.c     |  2 +-
 .../media/deprecated/saa7146}/ttpci/Kconfig     | 17 +++++++++++++----
 .../media/deprecated/saa7146}/ttpci/Makefile    |  0
 .../staging/media/deprecated/saa7146/ttpci/TODO |  7 +++++++
 .../media/deprecated/saa7146}/ttpci/budget-av.c |  2 +-
 .../media/deprecated/saa7146}/ttpci/budget-ci.c |  0
 .../deprecated/saa7146}/ttpci/budget-core.c     |  0
 .../media/deprecated/saa7146}/ttpci/budget.c    |  0
 .../media/deprecated/saa7146}/ttpci/budget.h    |  2 +-
 34 files changed, 64 insertions(+), 28 deletions(-)
 create mode 100644 drivers/staging/media/deprecated/saa7146/Kconfig
 create mode 100644 drivers/staging/media/deprecated/saa7146/Makefile
 rename drivers/{media/common/saa7146 => staging/media/deprecated/saa7146/common}/Kconfig (100%)
 rename drivers/{media/common/saa7146 => staging/media/deprecated/saa7146/common}/Makefile (100%)
 rename {include/media/drv-intf => drivers/staging/media/deprecated/saa7146/common}/saa7146.h (100%)
 rename drivers/{media/common/saa7146 => staging/media/deprecated/saa7146/common}/saa7146_core.c (99%)
 rename drivers/{media/common/saa7146 => staging/media/deprecated/saa7146/common}/saa7146_fops.c (99%)
 rename drivers/{media/common/saa7146 => staging/media/deprecated/saa7146/common}/saa7146_hlp.c (99%)
 rename drivers/{media/common/saa7146 => staging/media/deprecated/saa7146/common}/saa7146_i2c.c (99%)
 rename drivers/{media/common/saa7146 => staging/media/deprecated/saa7146/common}/saa7146_vbi.c (99%)
 rename drivers/{media/common/saa7146 => staging/media/deprecated/saa7146/common}/saa7146_video.c (99%)
 rename {include/media/drv-intf => drivers/staging/media/deprecated/saa7146/common}/saa7146_vv.h (99%)
 rename drivers/{media/pci => staging/media/deprecated/saa7146}/saa7146/Kconfig (67%)
 rename drivers/{media/pci => staging/media/deprecated/saa7146}/saa7146/Makefile (100%)
 create mode 100644 drivers/staging/media/deprecated/saa7146/saa7146/TODO
 rename drivers/{media/pci => staging/media/deprecated/saa7146}/saa7146/hexium_gemini.c (99%)
 rename drivers/{media/pci => staging/media/deprecated/saa7146}/saa7146/hexium_orion.c (99%)
 rename drivers/{media/pci => staging/media/deprecated/saa7146}/saa7146/mxb.c (99%)
 rename drivers/{media/pci => staging/media/deprecated/saa7146}/ttpci/Kconfig (83%)
 rename drivers/{media/pci => staging/media/deprecated/saa7146}/ttpci/Makefile (100%)
 create mode 100644 drivers/staging/media/deprecated/saa7146/ttpci/TODO
 rename drivers/{media/pci => staging/media/deprecated/saa7146}/ttpci/budget-av.c (99%)
 rename drivers/{media/pci => staging/media/deprecated/saa7146}/ttpci/budget-ci.c (100%)
 rename drivers/{media/pci => staging/media/deprecated/saa7146}/ttpci/budget-core.c (100%)
 rename drivers/{media/pci => staging/media/deprecated/saa7146}/ttpci/budget.c (100%)
 rename drivers/{media/pci => staging/media/deprecated/saa7146}/ttpci/budget.h (98%)

diff --git a/drivers/media/common/Kconfig b/drivers/media/common/Kconfig
index a2ae71270054..852b7d92fbdd 100644
--- a/drivers/media/common/Kconfig
+++ b/drivers/media/common/Kconfig
@@ -22,7 +22,6 @@ config VIDEO_TVEEPROM
 	depends on I2C
 
 source "drivers/media/common/b2c2/Kconfig"
-source "drivers/media/common/saa7146/Kconfig"
 source "drivers/media/common/siano/Kconfig"
 source "drivers/media/common/v4l2-tpg/Kconfig"
 source "drivers/media/common/videobuf2/Kconfig"
diff --git a/drivers/media/common/Makefile b/drivers/media/common/Makefile
index ad0b1e95fb12..d78a0df15478 100644
--- a/drivers/media/common/Makefile
+++ b/drivers/media/common/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-y += b2c2/ saa7146/ siano/ v4l2-tpg/ videobuf2/
+obj-y += b2c2/ siano/ v4l2-tpg/ videobuf2/
 
 # Please keep it alphabetically sorted by Kconfig name
 # (e. g. LC_ALL=C sort Makefile)
diff --git a/drivers/media/pci/Kconfig b/drivers/media/pci/Kconfig
index 84c927516c11..8529b56b8f33 100644
--- a/drivers/media/pci/Kconfig
+++ b/drivers/media/pci/Kconfig
@@ -26,7 +26,6 @@ if MEDIA_ANALOG_TV_SUPPORT
 
 source "drivers/media/pci/dt3155/Kconfig"
 source "drivers/media/pci/ivtv/Kconfig"
-source "drivers/media/pci/saa7146/Kconfig"
 
 endif
 
@@ -57,7 +56,6 @@ source "drivers/media/pci/pluto2/Kconfig"
 source "drivers/media/pci/pt1/Kconfig"
 source "drivers/media/pci/pt3/Kconfig"
 source "drivers/media/pci/smipcie/Kconfig"
-source "drivers/media/pci/ttpci/Kconfig"
 
 endif
 
diff --git a/drivers/media/pci/Makefile b/drivers/media/pci/Makefile
index 6ad7c4dff021..e19c8d4ed7f3 100644
--- a/drivers/media/pci/Makefile
+++ b/drivers/media/pci/Makefile
@@ -5,8 +5,7 @@
 
 # Please keep it alphabetically sorted by directory
 # (e. g. LC_ALL=C sort Makefile)
-obj-y        +=	ttpci/		\
-		b2c2/		\
+obj-y        +=	b2c2/		\
 		pluto2/		\
 		dm1105/		\
 		pt1/		\
@@ -14,7 +13,6 @@ obj-y        +=	ttpci/		\
 		mantis/		\
 		ngene/		\
 		ddbridge/	\
-		saa7146/	\
 		smipcie/	\
 		netup_unidvb/	\
 		intel/
diff --git a/drivers/staging/media/Kconfig b/drivers/staging/media/Kconfig
index d69b7e799471..7fb9fc2fa923 100644
--- a/drivers/staging/media/Kconfig
+++ b/drivers/staging/media/Kconfig
@@ -60,6 +60,7 @@ if STAGING_MEDIA_DEPRECATED
 source "drivers/staging/media/deprecated/cpia2/Kconfig"
 source "drivers/staging/media/deprecated/fsl-viu/Kconfig"
 source "drivers/staging/media/deprecated/meye/Kconfig"
+source "drivers/staging/media/deprecated/saa7146/Kconfig"
 source "drivers/staging/media/deprecated/stkwebcam/Kconfig"
 source "drivers/staging/media/deprecated/tm6000/Kconfig"
 source "drivers/staging/media/deprecated/vpfe_capture/Kconfig"
diff --git a/drivers/staging/media/Makefile b/drivers/staging/media/Makefile
index 9ba5bd2ac621..399b3c48d4d2 100644
--- a/drivers/staging/media/Makefile
+++ b/drivers/staging/media/Makefile
@@ -18,3 +18,4 @@ obj-$(CONFIG_VIDEO_ZORAN)	+= zoran/
 obj-$(CONFIG_USB_ZR364XX)	+= deprecated/zr364xx/
 obj-$(CONFIG_DVB_AV7110)	+= av7110/
 obj-y += deprecated/vpfe_capture/
+obj-y += deprecated/saa7146/
diff --git a/drivers/staging/media/av7110/Makefile b/drivers/staging/media/av7110/Makefile
index 307b267598ea..c04cd0a59109 100644
--- a/drivers/staging/media/av7110/Makefile
+++ b/drivers/staging/media/av7110/Makefile
@@ -18,5 +18,6 @@ obj-$(CONFIG_DVB_SP8870) += sp8870.o
 
 ccflags-y += -I $(srctree)/drivers/media/dvb-frontends
 ccflags-y += -I $(srctree)/drivers/media/tuners
-ccflags-y += -I $(srctree)/drivers/media/pci/ttpci
 ccflags-y += -I $(srctree)/drivers/media/common
+ccflags-y += -I $(srctree)/drivers/staging/media/deprecated/saa7146/ttpci
+ccflags-y += -I $(srctree)/drivers/staging/media/deprecated/saa7146/common
diff --git a/drivers/staging/media/av7110/av7110.h b/drivers/staging/media/av7110/av7110.h
index 809d938ae166..9fde69b38f1c 100644
--- a/drivers/staging/media/av7110/av7110.h
+++ b/drivers/staging/media/av7110/av7110.h
@@ -33,7 +33,7 @@
 #include "stv0297.h"
 #include "l64781.h"
 
-#include <media/drv-intf/saa7146_vv.h>
+#include "saa7146_vv.h"
 
 
 #define ANALOG_TUNER_VES1820 1
diff --git a/drivers/staging/media/deprecated/saa7146/Kconfig b/drivers/staging/media/deprecated/saa7146/Kconfig
new file mode 100644
index 000000000000..d0cb52164ff8
--- /dev/null
+++ b/drivers/staging/media/deprecated/saa7146/Kconfig
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+source "drivers/staging/media/deprecated/saa7146/common/Kconfig"
+source "drivers/staging/media/deprecated/saa7146/saa7146/Kconfig"
+source "drivers/staging/media/deprecated/saa7146/ttpci/Kconfig"
diff --git a/drivers/staging/media/deprecated/saa7146/Makefile b/drivers/staging/media/deprecated/saa7146/Makefile
new file mode 100644
index 000000000000..9d99fdedf813
--- /dev/null
+++ b/drivers/staging/media/deprecated/saa7146/Makefile
@@ -0,0 +1,2 @@
+ # SPDX-License-Identifier: GPL-2.0-only
+obj-y += common/ saa7146/ ttpci/
diff --git a/drivers/media/common/saa7146/Kconfig b/drivers/staging/media/deprecated/saa7146/common/Kconfig
similarity index 100%
rename from drivers/media/common/saa7146/Kconfig
rename to drivers/staging/media/deprecated/saa7146/common/Kconfig
diff --git a/drivers/media/common/saa7146/Makefile b/drivers/staging/media/deprecated/saa7146/common/Makefile
similarity index 100%
rename from drivers/media/common/saa7146/Makefile
rename to drivers/staging/media/deprecated/saa7146/common/Makefile
diff --git a/include/media/drv-intf/saa7146.h b/drivers/staging/media/deprecated/saa7146/common/saa7146.h
similarity index 100%
rename from include/media/drv-intf/saa7146.h
rename to drivers/staging/media/deprecated/saa7146/common/saa7146.h
diff --git a/drivers/media/common/saa7146/saa7146_core.c b/drivers/staging/media/deprecated/saa7146/common/saa7146_core.c
similarity index 99%
rename from drivers/media/common/saa7146/saa7146_core.c
rename to drivers/staging/media/deprecated/saa7146/common/saa7146_core.c
index e50fa0ff7c5d..da21d346b870 100644
--- a/drivers/media/common/saa7146/saa7146_core.c
+++ b/drivers/staging/media/deprecated/saa7146/common/saa7146_core.c
@@ -8,8 +8,8 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
-#include <media/drv-intf/saa7146.h>
 #include <linux/module.h>
+#include "saa7146.h"
 
 static int saa7146_num;
 
diff --git a/drivers/media/common/saa7146/saa7146_fops.c b/drivers/staging/media/deprecated/saa7146/common/saa7146_fops.c
similarity index 99%
rename from drivers/media/common/saa7146/saa7146_fops.c
rename to drivers/staging/media/deprecated/saa7146/common/saa7146_fops.c
index e9a15de6126e..aa14698a9c54 100644
--- a/drivers/media/common/saa7146/saa7146_fops.c
+++ b/drivers/staging/media/deprecated/saa7146/common/saa7146_fops.c
@@ -1,8 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0-only
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
-#include <media/drv-intf/saa7146_vv.h>
 #include <linux/module.h>
+#include "saa7146_vv.h"
 
 /****************************************************************************/
 /* resource management functions, shamelessly stolen from saa7134 driver */
diff --git a/drivers/media/common/saa7146/saa7146_hlp.c b/drivers/staging/media/deprecated/saa7146/common/saa7146_hlp.c
similarity index 99%
rename from drivers/media/common/saa7146/saa7146_hlp.c
rename to drivers/staging/media/deprecated/saa7146/common/saa7146_hlp.c
index 6c9946a402ee..b1222a4cfa4a 100644
--- a/drivers/media/common/saa7146/saa7146_hlp.c
+++ b/drivers/staging/media/deprecated/saa7146/common/saa7146_hlp.c
@@ -3,7 +3,7 @@
 
 #include <linux/kernel.h>
 #include <linux/export.h>
-#include <media/drv-intf/saa7146_vv.h>
+#include "saa7146_vv.h"
 
 static void calculate_output_format_register(struct saa7146_dev* saa, u32 palette, u32* clip_format)
 {
diff --git a/drivers/media/common/saa7146/saa7146_i2c.c b/drivers/staging/media/deprecated/saa7146/common/saa7146_i2c.c
similarity index 99%
rename from drivers/media/common/saa7146/saa7146_i2c.c
rename to drivers/staging/media/deprecated/saa7146/common/saa7146_i2c.c
index df9ebe2a168c..7a33fe51775a 100644
--- a/drivers/media/common/saa7146/saa7146_i2c.c
+++ b/drivers/staging/media/deprecated/saa7146/common/saa7146_i2c.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
-#include <media/drv-intf/saa7146_vv.h>
+#include "saa7146_vv.h"
 
 static u32 saa7146_i2c_func(struct i2c_adapter *adapter)
 {
diff --git a/drivers/media/common/saa7146/saa7146_vbi.c b/drivers/staging/media/deprecated/saa7146/common/saa7146_vbi.c
similarity index 99%
rename from drivers/media/common/saa7146/saa7146_vbi.c
rename to drivers/staging/media/deprecated/saa7146/common/saa7146_vbi.c
index bd442b984423..2d4a05d7bc5b 100644
--- a/drivers/media/common/saa7146/saa7146_vbi.c
+++ b/drivers/staging/media/deprecated/saa7146/common/saa7146_vbi.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
-#include <media/drv-intf/saa7146_vv.h>
+#include "saa7146_vv.h"
 
 static int vbi_pixel_to_capture = 720 * 2;
 
diff --git a/drivers/media/common/saa7146/saa7146_video.c b/drivers/staging/media/deprecated/saa7146/common/saa7146_video.c
similarity index 99%
rename from drivers/media/common/saa7146/saa7146_video.c
rename to drivers/staging/media/deprecated/saa7146/common/saa7146_video.c
index 2296765079a4..4598a44231fa 100644
--- a/drivers/media/common/saa7146/saa7146_video.c
+++ b/drivers/staging/media/deprecated/saa7146/common/saa7146_video.c
@@ -1,10 +1,10 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
-#include <media/drv-intf/saa7146_vv.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-ctrls.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
+#include "saa7146_vv.h"
 
 static int max_memory = 32;
 
diff --git a/include/media/drv-intf/saa7146_vv.h b/drivers/staging/media/deprecated/saa7146/common/saa7146_vv.h
similarity index 99%
rename from include/media/drv-intf/saa7146_vv.h
rename to drivers/staging/media/deprecated/saa7146/common/saa7146_vv.h
index 635805fb35e8..d7bd916fe3ad 100644
--- a/include/media/drv-intf/saa7146_vv.h
+++ b/drivers/staging/media/deprecated/saa7146/common/saa7146_vv.h
@@ -5,8 +5,8 @@
 #include <media/v4l2-common.h>
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-fh.h>
-#include <media/drv-intf/saa7146.h>
 #include <media/videobuf-dma-sg.h>
+#include "saa7146.h"
 
 #define MAX_SAA7146_CAPTURE_BUFFERS	32	/* arbitrary */
 #define BUFFER_TIMEOUT     (HZ/2)  /* 0.5 seconds */
diff --git a/drivers/media/pci/saa7146/Kconfig b/drivers/staging/media/deprecated/saa7146/saa7146/Kconfig
similarity index 67%
rename from drivers/media/pci/saa7146/Kconfig
rename to drivers/staging/media/deprecated/saa7146/saa7146/Kconfig
index 3bbb68a0ed7b..228e8d3f8d2b 100644
--- a/drivers/media/pci/saa7146/Kconfig
+++ b/drivers/staging/media/deprecated/saa7146/saa7146/Kconfig
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config VIDEO_HEXIUM_GEMINI
-	tristate "Hexium Gemini frame grabber"
+	tristate "Hexium Gemini frame grabber (DEPRECATED)"
 	depends on PCI && VIDEO_DEV && I2C
 	select VIDEO_SAA7146_VV
 	help
@@ -8,22 +8,28 @@ config VIDEO_HEXIUM_GEMINI
 	  grabber card by Hexium. Please note that the Gemini Dual
 	  card is *not* fully supported.
 
+	  This driver is deprecated and is scheduled for removal by
+	  the beginning of 2023. See the TODO file for more information.
+
 	  To compile this driver as a module, choose M here: the
 	  module will be called hexium_gemini.
 
 config VIDEO_HEXIUM_ORION
-	tristate "Hexium HV-PCI6 and Orion frame grabber"
+	tristate "Hexium HV-PCI6 and Orion frame grabber (DEPRECATED)"
 	depends on PCI && VIDEO_DEV && I2C
 	select VIDEO_SAA7146_VV
 	help
 	  This is a video4linux driver for the Hexium HV-PCI6 and
 	  Orion frame grabber cards by Hexium.
 
+	  This driver is deprecated and is scheduled for removal by
+	  the beginning of 2023. See the TODO file for more information.
+
 	  To compile this driver as a module, choose M here: the
 	  module will be called hexium_orion.
 
 config VIDEO_MXB
-	tristate "Siemens-Nixdorf 'Multimedia eXtension Board'"
+	tristate "Siemens-Nixdorf 'Multimedia eXtension Board' (DEPRECATED)"
 	depends on PCI && VIDEO_DEV && I2C
 	select VIDEO_SAA7146_VV
 	select VIDEO_TUNER
@@ -35,5 +41,8 @@ config VIDEO_MXB
 	  This is a video4linux driver for the 'Multimedia eXtension Board'
 	  TV card by Siemens-Nixdorf.
 
+	  This driver is deprecated and is scheduled for removal by
+	  the beginning of 2023. See the TODO file for more information.
+
 	  To compile this driver as a module, choose M here: the
 	  module will be called mxb.
diff --git a/drivers/media/pci/saa7146/Makefile b/drivers/staging/media/deprecated/saa7146/saa7146/Makefile
similarity index 100%
rename from drivers/media/pci/saa7146/Makefile
rename to drivers/staging/media/deprecated/saa7146/saa7146/Makefile
diff --git a/drivers/staging/media/deprecated/saa7146/saa7146/TODO b/drivers/staging/media/deprecated/saa7146/saa7146/TODO
new file mode 100644
index 000000000000..c9ae2ec79cea
--- /dev/null
+++ b/drivers/staging/media/deprecated/saa7146/saa7146/TODO
@@ -0,0 +1,7 @@
+The saa7146-based drivers are one of the few drivers still not using
+the vb2 framework, so these drivers are now deprecated with the intent of
+removing them altogether by the beginning of 2023.
+
+In order to keep these drivers they have to be converted to vb2.
+If someone is interested in doing this work, then contact the
+linux-media mailinglist (https://linuxtv.org/lists.php).
diff --git a/drivers/media/pci/saa7146/hexium_gemini.c b/drivers/staging/media/deprecated/saa7146/saa7146/hexium_gemini.c
similarity index 99%
rename from drivers/media/pci/saa7146/hexium_gemini.c
rename to drivers/staging/media/deprecated/saa7146/saa7146/hexium_gemini.c
index 3947701cd6c7..124e82bd4507 100644
--- a/drivers/media/pci/saa7146/hexium_gemini.c
+++ b/drivers/staging/media/deprecated/saa7146/saa7146/hexium_gemini.c
@@ -13,9 +13,9 @@
 
 #define DEBUG_VARIABLE debug
 
-#include <media/drv-intf/saa7146_vv.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
+#include "../common/saa7146_vv.h"
 
 static int debug;
 module_param(debug, int, 0);
diff --git a/drivers/media/pci/saa7146/hexium_orion.c b/drivers/staging/media/deprecated/saa7146/saa7146/hexium_orion.c
similarity index 99%
rename from drivers/media/pci/saa7146/hexium_orion.c
rename to drivers/staging/media/deprecated/saa7146/saa7146/hexium_orion.c
index 2eb4bee16b71..ebd63998ac79 100644
--- a/drivers/media/pci/saa7146/hexium_orion.c
+++ b/drivers/staging/media/deprecated/saa7146/saa7146/hexium_orion.c
@@ -13,9 +13,9 @@
 
 #define DEBUG_VARIABLE debug
 
-#include <media/drv-intf/saa7146_vv.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
+#include "../common/saa7146_vv.h"
 
 static int debug;
 module_param(debug, int, 0);
diff --git a/drivers/media/pci/saa7146/mxb.c b/drivers/staging/media/deprecated/saa7146/saa7146/mxb.c
similarity index 99%
rename from drivers/media/pci/saa7146/mxb.c
rename to drivers/staging/media/deprecated/saa7146/saa7146/mxb.c
index 7ded8f5b05cb..3e568f952dae 100644
--- a/drivers/media/pci/saa7146/mxb.c
+++ b/drivers/staging/media/deprecated/saa7146/saa7146/mxb.c
@@ -13,13 +13,13 @@
 
 #define DEBUG_VARIABLE debug
 
-#include <media/drv-intf/saa7146_vv.h>
 #include <media/tuner.h>
 #include <media/v4l2-common.h>
 #include <media/i2c/saa7115.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 
+#include "../common/saa7146_vv.h"
 #include "tea6415c.h"
 #include "tea6420.h"
 
diff --git a/drivers/media/pci/ttpci/Kconfig b/drivers/staging/media/deprecated/saa7146/ttpci/Kconfig
similarity index 83%
rename from drivers/media/pci/ttpci/Kconfig
rename to drivers/staging/media/deprecated/saa7146/ttpci/Kconfig
index 65a6832a6b96..8c85ed58e938 100644
--- a/drivers/media/pci/ttpci/Kconfig
+++ b/drivers/staging/media/deprecated/saa7146/ttpci/Kconfig
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DVB_BUDGET_CORE
-	tristate "SAA7146 DVB cards (aka Budget, Nova-PCI)"
+	tristate "SAA7146 DVB cards (aka Budget, Nova-PCI) (DEPRECATED)"
 	depends on DVB_CORE && PCI && I2C
 	select VIDEO_SAA7146
 	select TTPCI_EEPROM
@@ -10,7 +10,7 @@ config DVB_BUDGET_CORE
 	  MPEG2 decoder.
 
 config DVB_BUDGET
-	tristate "Budget cards"
+	tristate "Budget cards (DEPRECATED)"
 	depends on DVB_BUDGET_CORE && I2C
 	select DVB_STV0299 if MEDIA_SUBDRV_AUTOSELECT
 	select DVB_VES1X93 if MEDIA_SUBDRV_AUTOSELECT
@@ -30,13 +30,16 @@ config DVB_BUDGET
 	  or Nova-PCI cards) without onboard MPEG2 decoder, and without
 	  analog inputs or an onboard Common Interface connector.
 
+	  This driver is deprecated and is scheduled for removal by
+	  the beginning of 2023. See the TODO file for more information.
+
 	  Say Y if you own such a card and want to use it.
 
 	  To compile this driver as a module, choose M here: the
 	  module will be called budget.
 
 config DVB_BUDGET_CI
-	tristate "Budget cards with onboard CI connector"
+	tristate "Budget cards with onboard CI connector (DEPRECATED)"
 	depends on DVB_BUDGET_CORE && I2C
 	select DVB_STV0297 if MEDIA_SUBDRV_AUTOSELECT
 	select DVB_STV0299 if MEDIA_SUBDRV_AUTOSELECT
@@ -57,13 +60,16 @@ config DVB_BUDGET_CI
 	  Note: The Common Interface is not yet supported by this driver
 	  due to lack of information from the vendor.
 
+	  This driver is deprecated and is scheduled for removal by
+	  the beginning of 2023. See the TODO file for more information.
+
 	  Say Y if you own such a card and want to use it.
 
 	  To compile this driver as a module, choose M here: the
 	  module will be called budget-ci.
 
 config DVB_BUDGET_AV
-	tristate "Budget cards with analog video inputs"
+	tristate "Budget cards with analog video inputs (DEPRECATED)"
 	depends on DVB_BUDGET_CORE && I2C
 	select VIDEO_SAA7146_VV
 	depends on VIDEO_DEV	# dependencies of VIDEO_SAA7146_VV
@@ -80,6 +86,9 @@ config DVB_BUDGET_AV
 	  (so called Budget- or Nova-PCI cards) without onboard
 	  MPEG2 decoder, but with one or more analog video inputs.
 
+	  This driver is deprecated and is scheduled for removal by
+	  the beginning of 2023. See the TODO file for more information.
+
 	  Say Y if you own such a card and want to use it.
 
 	  To compile this driver as a module, choose M here: the
diff --git a/drivers/media/pci/ttpci/Makefile b/drivers/staging/media/deprecated/saa7146/ttpci/Makefile
similarity index 100%
rename from drivers/media/pci/ttpci/Makefile
rename to drivers/staging/media/deprecated/saa7146/ttpci/Makefile
diff --git a/drivers/staging/media/deprecated/saa7146/ttpci/TODO b/drivers/staging/media/deprecated/saa7146/ttpci/TODO
new file mode 100644
index 000000000000..c9ae2ec79cea
--- /dev/null
+++ b/drivers/staging/media/deprecated/saa7146/ttpci/TODO
@@ -0,0 +1,7 @@
+The saa7146-based drivers are one of the few drivers still not using
+the vb2 framework, so these drivers are now deprecated with the intent of
+removing them altogether by the beginning of 2023.
+
+In order to keep these drivers they have to be converted to vb2.
+If someone is interested in doing this work, then contact the
+linux-media mailinglist (https://linuxtv.org/lists.php).
diff --git a/drivers/media/pci/ttpci/budget-av.c b/drivers/staging/media/deprecated/saa7146/ttpci/budget-av.c
similarity index 99%
rename from drivers/media/pci/ttpci/budget-av.c
rename to drivers/staging/media/deprecated/saa7146/ttpci/budget-av.c
index 3cb83005cf09..0c61a2dec221 100644
--- a/drivers/media/pci/ttpci/budget-av.c
+++ b/drivers/staging/media/deprecated/saa7146/ttpci/budget-av.c
@@ -29,7 +29,7 @@
 #include "tda1004x.h"
 #include "tua6100.h"
 #include "dvb-pll.h"
-#include <media/drv-intf/saa7146_vv.h>
+#include "../common/saa7146_vv.h"
 #include <linux/module.h>
 #include <linux/errno.h>
 #include <linux/slab.h>
diff --git a/drivers/media/pci/ttpci/budget-ci.c b/drivers/staging/media/deprecated/saa7146/ttpci/budget-ci.c
similarity index 100%
rename from drivers/media/pci/ttpci/budget-ci.c
rename to drivers/staging/media/deprecated/saa7146/ttpci/budget-ci.c
diff --git a/drivers/media/pci/ttpci/budget-core.c b/drivers/staging/media/deprecated/saa7146/ttpci/budget-core.c
similarity index 100%
rename from drivers/media/pci/ttpci/budget-core.c
rename to drivers/staging/media/deprecated/saa7146/ttpci/budget-core.c
diff --git a/drivers/media/pci/ttpci/budget.c b/drivers/staging/media/deprecated/saa7146/ttpci/budget.c
similarity index 100%
rename from drivers/media/pci/ttpci/budget.c
rename to drivers/staging/media/deprecated/saa7146/ttpci/budget.c
diff --git a/drivers/media/pci/ttpci/budget.h b/drivers/staging/media/deprecated/saa7146/ttpci/budget.h
similarity index 98%
rename from drivers/media/pci/ttpci/budget.h
rename to drivers/staging/media/deprecated/saa7146/ttpci/budget.h
index bd87432e6cde..82cc0df492b3 100644
--- a/drivers/media/pci/ttpci/budget.h
+++ b/drivers/staging/media/deprecated/saa7146/ttpci/budget.h
@@ -13,7 +13,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 
-#include <media/drv-intf/saa7146.h>
+#include "../common/saa7146.h"
 
 extern int budget_debug;
 
-- 
2.35.1

