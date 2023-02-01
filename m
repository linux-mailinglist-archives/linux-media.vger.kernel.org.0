Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D26A1686755
	for <lists+linux-media@lfdr.de>; Wed,  1 Feb 2023 14:46:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231895AbjBANqX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Feb 2023 08:46:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231665AbjBANqX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Feb 2023 08:46:23 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E71A4F344
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 05:46:17 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A2EA8B82188
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 13:46:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E325DC4339B
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 13:46:13 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: [PATCH 2/2] Revert "media: saa7146: deprecate hexium_gemini/orion, mxb and ttpci"
Date:   Wed,  1 Feb 2023 14:46:10 +0100
Message-Id: <20230201134610.873393-3-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230201134610.873393-1-hverkuil-cisco@xs4all.nl>
References: <20230201134610.873393-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This reverts commit e33fdb5a02490059e2f48ced2c038c8a46c6476d.

The saa7146-based devices are still in use, esp. for DVB. So move
these drivers back to mainline.
---
 MAINTAINERS                                     |  4 +++-
 drivers/media/common/Kconfig                    |  1 +
 drivers/media/common/Makefile                   |  2 +-
 .../common => media/common/saa7146}/Kconfig     |  0
 .../common => media/common/saa7146}/Makefile    |  0
 .../common/saa7146}/saa7146_core.c              |  2 +-
 .../common/saa7146}/saa7146_fops.c              |  2 +-
 .../common/saa7146}/saa7146_hlp.c               |  2 +-
 .../common/saa7146}/saa7146_i2c.c               |  2 +-
 .../common/saa7146}/saa7146_vbi.c               |  2 +-
 .../common/saa7146}/saa7146_video.c             |  2 +-
 drivers/media/pci/Kconfig                       |  2 ++
 drivers/media/pci/Makefile                      |  4 +++-
 .../saa7146 => media/pci}/saa7146/Kconfig       | 15 +++------------
 .../saa7146 => media/pci}/saa7146/Makefile      |  0
 .../pci}/saa7146/hexium_gemini.c                |  2 +-
 .../pci}/saa7146/hexium_orion.c                 |  2 +-
 .../saa7146 => media/pci}/saa7146/mxb.c         |  2 +-
 .../saa7146 => media/pci}/ttpci/Kconfig         | 17 ++++-------------
 .../saa7146 => media/pci}/ttpci/Makefile        |  0
 .../saa7146 => media/pci}/ttpci/budget-av.c     |  2 +-
 .../saa7146 => media/pci}/ttpci/budget-ci.c     |  0
 .../saa7146 => media/pci}/ttpci/budget-core.c   |  0
 .../saa7146 => media/pci}/ttpci/budget.c        |  0
 .../saa7146 => media/pci}/ttpci/budget.h        |  2 +-
 drivers/staging/media/Kconfig                   |  1 -
 drivers/staging/media/Makefile                  |  1 -
 drivers/staging/media/av7110/Makefile           |  3 +--
 drivers/staging/media/av7110/av7110.h           |  2 +-
 .../staging/media/deprecated/saa7146/Kconfig    |  4 ----
 .../staging/media/deprecated/saa7146/Makefile   |  2 --
 .../media/deprecated/saa7146/saa7146/TODO       |  7 -------
 .../staging/media/deprecated/saa7146/ttpci/TODO |  7 -------
 .../common => include/media/drv-intf}/saa7146.h |  0
 .../media/drv-intf}/saa7146_vv.h                |  2 +-
 35 files changed, 31 insertions(+), 65 deletions(-)
 rename drivers/{staging/media/deprecated/saa7146/common => media/common/saa7146}/Kconfig (100%)
 rename drivers/{staging/media/deprecated/saa7146/common => media/common/saa7146}/Makefile (100%)
 rename drivers/{staging/media/deprecated/saa7146/common => media/common/saa7146}/saa7146_core.c (99%)
 rename drivers/{staging/media/deprecated/saa7146/common => media/common/saa7146}/saa7146_fops.c (99%)
 rename drivers/{staging/media/deprecated/saa7146/common => media/common/saa7146}/saa7146_hlp.c (99%)
 rename drivers/{staging/media/deprecated/saa7146/common => media/common/saa7146}/saa7146_i2c.c (99%)
 rename drivers/{staging/media/deprecated/saa7146/common => media/common/saa7146}/saa7146_vbi.c (99%)
 rename drivers/{staging/media/deprecated/saa7146/common => media/common/saa7146}/saa7146_video.c (99%)
 rename drivers/{staging/media/deprecated/saa7146 => media/pci}/saa7146/Kconfig (67%)
 rename drivers/{staging/media/deprecated/saa7146 => media/pci}/saa7146/Makefile (100%)
 rename drivers/{staging/media/deprecated/saa7146 => media/pci}/saa7146/hexium_gemini.c (99%)
 rename drivers/{staging/media/deprecated/saa7146 => media/pci}/saa7146/hexium_orion.c (99%)
 rename drivers/{staging/media/deprecated/saa7146 => media/pci}/saa7146/mxb.c (99%)
 rename drivers/{staging/media/deprecated/saa7146 => media/pci}/ttpci/Kconfig (83%)
 rename drivers/{staging/media/deprecated/saa7146 => media/pci}/ttpci/Makefile (100%)
 rename drivers/{staging/media/deprecated/saa7146 => media/pci}/ttpci/budget-av.c (99%)
 rename drivers/{staging/media/deprecated/saa7146 => media/pci}/ttpci/budget-ci.c (100%)
 rename drivers/{staging/media/deprecated/saa7146 => media/pci}/ttpci/budget-core.c (100%)
 rename drivers/{staging/media/deprecated/saa7146 => media/pci}/ttpci/budget.c (100%)
 rename drivers/{staging/media/deprecated/saa7146 => media/pci}/ttpci/budget.h (98%)
 delete mode 100644 drivers/staging/media/deprecated/saa7146/Kconfig
 delete mode 100644 drivers/staging/media/deprecated/saa7146/Makefile
 delete mode 100644 drivers/staging/media/deprecated/saa7146/saa7146/TODO
 delete mode 100644 drivers/staging/media/deprecated/saa7146/ttpci/TODO
 rename {drivers/staging/media/deprecated/saa7146/common => include/media/drv-intf}/saa7146.h (100%)
 rename {drivers/staging/media/deprecated/saa7146/common => include/media/drv-intf}/saa7146_vv.h (99%)

diff --git a/MAINTAINERS b/MAINTAINERS
index ba5254cd1002..f991670f8926 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18382,7 +18382,9 @@ M:	Hans Verkuil <hverkuil@xs4all.nl>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
-F:	drivers/staging/media/deprecated/saa7146/
+F:	drivers/media/common/saa7146/
+F:	drivers/media/pci/saa7146/
+F:	include/media/drv-intf/saa7146*
 
 SAFESETID SECURITY MODULE
 M:	Micah Morton <mortonm@chromium.org>
diff --git a/drivers/media/common/Kconfig b/drivers/media/common/Kconfig
index 852b7d92fbdd..a2ae71270054 100644
--- a/drivers/media/common/Kconfig
+++ b/drivers/media/common/Kconfig
@@ -22,6 +22,7 @@ config VIDEO_TVEEPROM
 	depends on I2C
 
 source "drivers/media/common/b2c2/Kconfig"
+source "drivers/media/common/saa7146/Kconfig"
 source "drivers/media/common/siano/Kconfig"
 source "drivers/media/common/v4l2-tpg/Kconfig"
 source "drivers/media/common/videobuf2/Kconfig"
diff --git a/drivers/media/common/Makefile b/drivers/media/common/Makefile
index d78a0df15478..ad0b1e95fb12 100644
--- a/drivers/media/common/Makefile
+++ b/drivers/media/common/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-y += b2c2/ siano/ v4l2-tpg/ videobuf2/
+obj-y += b2c2/ saa7146/ siano/ v4l2-tpg/ videobuf2/
 
 # Please keep it alphabetically sorted by Kconfig name
 # (e. g. LC_ALL=C sort Makefile)
diff --git a/drivers/staging/media/deprecated/saa7146/common/Kconfig b/drivers/media/common/saa7146/Kconfig
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/common/Kconfig
rename to drivers/media/common/saa7146/Kconfig
diff --git a/drivers/staging/media/deprecated/saa7146/common/Makefile b/drivers/media/common/saa7146/Makefile
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/common/Makefile
rename to drivers/media/common/saa7146/Makefile
diff --git a/drivers/staging/media/deprecated/saa7146/common/saa7146_core.c b/drivers/media/common/saa7146/saa7146_core.c
similarity index 99%
rename from drivers/staging/media/deprecated/saa7146/common/saa7146_core.c
rename to drivers/media/common/saa7146/saa7146_core.c
index da21d346b870..e50fa0ff7c5d 100644
--- a/drivers/staging/media/deprecated/saa7146/common/saa7146_core.c
+++ b/drivers/media/common/saa7146/saa7146_core.c
@@ -8,8 +8,8 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <media/drv-intf/saa7146.h>
 #include <linux/module.h>
-#include "saa7146.h"
 
 static int saa7146_num;
 
diff --git a/drivers/staging/media/deprecated/saa7146/common/saa7146_fops.c b/drivers/media/common/saa7146/saa7146_fops.c
similarity index 99%
rename from drivers/staging/media/deprecated/saa7146/common/saa7146_fops.c
rename to drivers/media/common/saa7146/saa7146_fops.c
index aa14698a9c54..e9a15de6126e 100644
--- a/drivers/staging/media/deprecated/saa7146/common/saa7146_fops.c
+++ b/drivers/media/common/saa7146/saa7146_fops.c
@@ -1,8 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0-only
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <media/drv-intf/saa7146_vv.h>
 #include <linux/module.h>
-#include "saa7146_vv.h"
 
 /****************************************************************************/
 /* resource management functions, shamelessly stolen from saa7134 driver */
diff --git a/drivers/staging/media/deprecated/saa7146/common/saa7146_hlp.c b/drivers/media/common/saa7146/saa7146_hlp.c
similarity index 99%
rename from drivers/staging/media/deprecated/saa7146/common/saa7146_hlp.c
rename to drivers/media/common/saa7146/saa7146_hlp.c
index b1222a4cfa4a..6c9946a402ee 100644
--- a/drivers/staging/media/deprecated/saa7146/common/saa7146_hlp.c
+++ b/drivers/media/common/saa7146/saa7146_hlp.c
@@ -3,7 +3,7 @@
 
 #include <linux/kernel.h>
 #include <linux/export.h>
-#include "saa7146_vv.h"
+#include <media/drv-intf/saa7146_vv.h>
 
 static void calculate_output_format_register(struct saa7146_dev* saa, u32 palette, u32* clip_format)
 {
diff --git a/drivers/staging/media/deprecated/saa7146/common/saa7146_i2c.c b/drivers/media/common/saa7146/saa7146_i2c.c
similarity index 99%
rename from drivers/staging/media/deprecated/saa7146/common/saa7146_i2c.c
rename to drivers/media/common/saa7146/saa7146_i2c.c
index 7a33fe51775a..df9ebe2a168c 100644
--- a/drivers/staging/media/deprecated/saa7146/common/saa7146_i2c.c
+++ b/drivers/media/common/saa7146/saa7146_i2c.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
-#include "saa7146_vv.h"
+#include <media/drv-intf/saa7146_vv.h>
 
 static u32 saa7146_i2c_func(struct i2c_adapter *adapter)
 {
diff --git a/drivers/staging/media/deprecated/saa7146/common/saa7146_vbi.c b/drivers/media/common/saa7146/saa7146_vbi.c
similarity index 99%
rename from drivers/staging/media/deprecated/saa7146/common/saa7146_vbi.c
rename to drivers/media/common/saa7146/saa7146_vbi.c
index 2d4a05d7bc5b..bd442b984423 100644
--- a/drivers/staging/media/deprecated/saa7146/common/saa7146_vbi.c
+++ b/drivers/media/common/saa7146/saa7146_vbi.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
-#include "saa7146_vv.h"
+#include <media/drv-intf/saa7146_vv.h>
 
 static int vbi_pixel_to_capture = 720 * 2;
 
diff --git a/drivers/staging/media/deprecated/saa7146/common/saa7146_video.c b/drivers/media/common/saa7146/saa7146_video.c
similarity index 99%
rename from drivers/staging/media/deprecated/saa7146/common/saa7146_video.c
rename to drivers/media/common/saa7146/saa7146_video.c
index 4598a44231fa..2296765079a4 100644
--- a/drivers/staging/media/deprecated/saa7146/common/saa7146_video.c
+++ b/drivers/media/common/saa7146/saa7146_video.c
@@ -1,10 +1,10 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <media/drv-intf/saa7146_vv.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-ctrls.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
-#include "saa7146_vv.h"
 
 static int max_memory = 32;
 
diff --git a/drivers/media/pci/Kconfig b/drivers/media/pci/Kconfig
index dff0b450f387..480194543d05 100644
--- a/drivers/media/pci/Kconfig
+++ b/drivers/media/pci/Kconfig
@@ -27,6 +27,7 @@ if MEDIA_ANALOG_TV_SUPPORT
 
 source "drivers/media/pci/dt3155/Kconfig"
 source "drivers/media/pci/ivtv/Kconfig"
+source "drivers/media/pci/saa7146/Kconfig"
 
 endif
 
@@ -57,6 +58,7 @@ source "drivers/media/pci/pluto2/Kconfig"
 source "drivers/media/pci/pt1/Kconfig"
 source "drivers/media/pci/pt3/Kconfig"
 source "drivers/media/pci/smipcie/Kconfig"
+source "drivers/media/pci/ttpci/Kconfig"
 
 endif
 
diff --git a/drivers/media/pci/Makefile b/drivers/media/pci/Makefile
index 8f887a8a7f17..8bed619b7130 100644
--- a/drivers/media/pci/Makefile
+++ b/drivers/media/pci/Makefile
@@ -5,7 +5,8 @@
 
 # Please keep it alphabetically sorted by directory
 # (e. g. LC_ALL=C sort Makefile)
-obj-y        +=	b2c2/		\
+obj-y        +=	ttpci/		\
+		b2c2/		\
 		pluto2/		\
 		dm1105/		\
 		pt1/		\
@@ -13,6 +14,7 @@ obj-y        +=	b2c2/		\
 		mantis/		\
 		ngene/		\
 		ddbridge/	\
+		saa7146/	\
 		smipcie/	\
 		netup_unidvb/	\
 		intel/
diff --git a/drivers/staging/media/deprecated/saa7146/saa7146/Kconfig b/drivers/media/pci/saa7146/Kconfig
similarity index 67%
rename from drivers/staging/media/deprecated/saa7146/saa7146/Kconfig
rename to drivers/media/pci/saa7146/Kconfig
index 228e8d3f8d2b..3bbb68a0ed7b 100644
--- a/drivers/staging/media/deprecated/saa7146/saa7146/Kconfig
+++ b/drivers/media/pci/saa7146/Kconfig
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config VIDEO_HEXIUM_GEMINI
-	tristate "Hexium Gemini frame grabber (DEPRECATED)"
+	tristate "Hexium Gemini frame grabber"
 	depends on PCI && VIDEO_DEV && I2C
 	select VIDEO_SAA7146_VV
 	help
@@ -8,28 +8,22 @@ config VIDEO_HEXIUM_GEMINI
 	  grabber card by Hexium. Please note that the Gemini Dual
 	  card is *not* fully supported.
 
-	  This driver is deprecated and is scheduled for removal by
-	  the beginning of 2023. See the TODO file for more information.
-
 	  To compile this driver as a module, choose M here: the
 	  module will be called hexium_gemini.
 
 config VIDEO_HEXIUM_ORION
-	tristate "Hexium HV-PCI6 and Orion frame grabber (DEPRECATED)"
+	tristate "Hexium HV-PCI6 and Orion frame grabber"
 	depends on PCI && VIDEO_DEV && I2C
 	select VIDEO_SAA7146_VV
 	help
 	  This is a video4linux driver for the Hexium HV-PCI6 and
 	  Orion frame grabber cards by Hexium.
 
-	  This driver is deprecated and is scheduled for removal by
-	  the beginning of 2023. See the TODO file for more information.
-
 	  To compile this driver as a module, choose M here: the
 	  module will be called hexium_orion.
 
 config VIDEO_MXB
-	tristate "Siemens-Nixdorf 'Multimedia eXtension Board' (DEPRECATED)"
+	tristate "Siemens-Nixdorf 'Multimedia eXtension Board'"
 	depends on PCI && VIDEO_DEV && I2C
 	select VIDEO_SAA7146_VV
 	select VIDEO_TUNER
@@ -41,8 +35,5 @@ config VIDEO_MXB
 	  This is a video4linux driver for the 'Multimedia eXtension Board'
 	  TV card by Siemens-Nixdorf.
 
-	  This driver is deprecated and is scheduled for removal by
-	  the beginning of 2023. See the TODO file for more information.
-
 	  To compile this driver as a module, choose M here: the
 	  module will be called mxb.
diff --git a/drivers/staging/media/deprecated/saa7146/saa7146/Makefile b/drivers/media/pci/saa7146/Makefile
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/saa7146/Makefile
rename to drivers/media/pci/saa7146/Makefile
diff --git a/drivers/staging/media/deprecated/saa7146/saa7146/hexium_gemini.c b/drivers/media/pci/saa7146/hexium_gemini.c
similarity index 99%
rename from drivers/staging/media/deprecated/saa7146/saa7146/hexium_gemini.c
rename to drivers/media/pci/saa7146/hexium_gemini.c
index 124e82bd4507..3947701cd6c7 100644
--- a/drivers/staging/media/deprecated/saa7146/saa7146/hexium_gemini.c
+++ b/drivers/media/pci/saa7146/hexium_gemini.c
@@ -13,9 +13,9 @@
 
 #define DEBUG_VARIABLE debug
 
+#include <media/drv-intf/saa7146_vv.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
-#include "../common/saa7146_vv.h"
 
 static int debug;
 module_param(debug, int, 0);
diff --git a/drivers/staging/media/deprecated/saa7146/saa7146/hexium_orion.c b/drivers/media/pci/saa7146/hexium_orion.c
similarity index 99%
rename from drivers/staging/media/deprecated/saa7146/saa7146/hexium_orion.c
rename to drivers/media/pci/saa7146/hexium_orion.c
index ebd63998ac79..2eb4bee16b71 100644
--- a/drivers/staging/media/deprecated/saa7146/saa7146/hexium_orion.c
+++ b/drivers/media/pci/saa7146/hexium_orion.c
@@ -13,9 +13,9 @@
 
 #define DEBUG_VARIABLE debug
 
+#include <media/drv-intf/saa7146_vv.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
-#include "../common/saa7146_vv.h"
 
 static int debug;
 module_param(debug, int, 0);
diff --git a/drivers/staging/media/deprecated/saa7146/saa7146/mxb.c b/drivers/media/pci/saa7146/mxb.c
similarity index 99%
rename from drivers/staging/media/deprecated/saa7146/saa7146/mxb.c
rename to drivers/media/pci/saa7146/mxb.c
index 3e568f952dae..7ded8f5b05cb 100644
--- a/drivers/staging/media/deprecated/saa7146/saa7146/mxb.c
+++ b/drivers/media/pci/saa7146/mxb.c
@@ -13,13 +13,13 @@
 
 #define DEBUG_VARIABLE debug
 
+#include <media/drv-intf/saa7146_vv.h>
 #include <media/tuner.h>
 #include <media/v4l2-common.h>
 #include <media/i2c/saa7115.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 
-#include "../common/saa7146_vv.h"
 #include "tea6415c.h"
 #include "tea6420.h"
 
diff --git a/drivers/staging/media/deprecated/saa7146/ttpci/Kconfig b/drivers/media/pci/ttpci/Kconfig
similarity index 83%
rename from drivers/staging/media/deprecated/saa7146/ttpci/Kconfig
rename to drivers/media/pci/ttpci/Kconfig
index 8c85ed58e938..65a6832a6b96 100644
--- a/drivers/staging/media/deprecated/saa7146/ttpci/Kconfig
+++ b/drivers/media/pci/ttpci/Kconfig
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DVB_BUDGET_CORE
-	tristate "SAA7146 DVB cards (aka Budget, Nova-PCI) (DEPRECATED)"
+	tristate "SAA7146 DVB cards (aka Budget, Nova-PCI)"
 	depends on DVB_CORE && PCI && I2C
 	select VIDEO_SAA7146
 	select TTPCI_EEPROM
@@ -10,7 +10,7 @@ config DVB_BUDGET_CORE
 	  MPEG2 decoder.
 
 config DVB_BUDGET
-	tristate "Budget cards (DEPRECATED)"
+	tristate "Budget cards"
 	depends on DVB_BUDGET_CORE && I2C
 	select DVB_STV0299 if MEDIA_SUBDRV_AUTOSELECT
 	select DVB_VES1X93 if MEDIA_SUBDRV_AUTOSELECT
@@ -30,16 +30,13 @@ config DVB_BUDGET
 	  or Nova-PCI cards) without onboard MPEG2 decoder, and without
 	  analog inputs or an onboard Common Interface connector.
 
-	  This driver is deprecated and is scheduled for removal by
-	  the beginning of 2023. See the TODO file for more information.
-
 	  Say Y if you own such a card and want to use it.
 
 	  To compile this driver as a module, choose M here: the
 	  module will be called budget.
 
 config DVB_BUDGET_CI
-	tristate "Budget cards with onboard CI connector (DEPRECATED)"
+	tristate "Budget cards with onboard CI connector"
 	depends on DVB_BUDGET_CORE && I2C
 	select DVB_STV0297 if MEDIA_SUBDRV_AUTOSELECT
 	select DVB_STV0299 if MEDIA_SUBDRV_AUTOSELECT
@@ -60,16 +57,13 @@ config DVB_BUDGET_CI
 	  Note: The Common Interface is not yet supported by this driver
 	  due to lack of information from the vendor.
 
-	  This driver is deprecated and is scheduled for removal by
-	  the beginning of 2023. See the TODO file for more information.
-
 	  Say Y if you own such a card and want to use it.
 
 	  To compile this driver as a module, choose M here: the
 	  module will be called budget-ci.
 
 config DVB_BUDGET_AV
-	tristate "Budget cards with analog video inputs (DEPRECATED)"
+	tristate "Budget cards with analog video inputs"
 	depends on DVB_BUDGET_CORE && I2C
 	select VIDEO_SAA7146_VV
 	depends on VIDEO_DEV	# dependencies of VIDEO_SAA7146_VV
@@ -86,9 +80,6 @@ config DVB_BUDGET_AV
 	  (so called Budget- or Nova-PCI cards) without onboard
 	  MPEG2 decoder, but with one or more analog video inputs.
 
-	  This driver is deprecated and is scheduled for removal by
-	  the beginning of 2023. See the TODO file for more information.
-
 	  Say Y if you own such a card and want to use it.
 
 	  To compile this driver as a module, choose M here: the
diff --git a/drivers/staging/media/deprecated/saa7146/ttpci/Makefile b/drivers/media/pci/ttpci/Makefile
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/ttpci/Makefile
rename to drivers/media/pci/ttpci/Makefile
diff --git a/drivers/staging/media/deprecated/saa7146/ttpci/budget-av.c b/drivers/media/pci/ttpci/budget-av.c
similarity index 99%
rename from drivers/staging/media/deprecated/saa7146/ttpci/budget-av.c
rename to drivers/media/pci/ttpci/budget-av.c
index 0c61a2dec221..3cb83005cf09 100644
--- a/drivers/staging/media/deprecated/saa7146/ttpci/budget-av.c
+++ b/drivers/media/pci/ttpci/budget-av.c
@@ -29,7 +29,7 @@
 #include "tda1004x.h"
 #include "tua6100.h"
 #include "dvb-pll.h"
-#include "../common/saa7146_vv.h"
+#include <media/drv-intf/saa7146_vv.h>
 #include <linux/module.h>
 #include <linux/errno.h>
 #include <linux/slab.h>
diff --git a/drivers/staging/media/deprecated/saa7146/ttpci/budget-ci.c b/drivers/media/pci/ttpci/budget-ci.c
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/ttpci/budget-ci.c
rename to drivers/media/pci/ttpci/budget-ci.c
diff --git a/drivers/staging/media/deprecated/saa7146/ttpci/budget-core.c b/drivers/media/pci/ttpci/budget-core.c
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/ttpci/budget-core.c
rename to drivers/media/pci/ttpci/budget-core.c
diff --git a/drivers/staging/media/deprecated/saa7146/ttpci/budget.c b/drivers/media/pci/ttpci/budget.c
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/ttpci/budget.c
rename to drivers/media/pci/ttpci/budget.c
diff --git a/drivers/staging/media/deprecated/saa7146/ttpci/budget.h b/drivers/media/pci/ttpci/budget.h
similarity index 98%
rename from drivers/staging/media/deprecated/saa7146/ttpci/budget.h
rename to drivers/media/pci/ttpci/budget.h
index 82cc0df492b3..bd87432e6cde 100644
--- a/drivers/staging/media/deprecated/saa7146/ttpci/budget.h
+++ b/drivers/media/pci/ttpci/budget.h
@@ -13,7 +13,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 
-#include "../common/saa7146.h"
+#include <media/drv-intf/saa7146.h>
 
 extern int budget_debug;
 
diff --git a/drivers/staging/media/Kconfig b/drivers/staging/media/Kconfig
index 9a43d8872324..bc6c7b248f86 100644
--- a/drivers/staging/media/Kconfig
+++ b/drivers/staging/media/Kconfig
@@ -54,7 +54,6 @@ menuconfig STAGING_MEDIA_DEPRECATED
 
 if STAGING_MEDIA_DEPRECATED
 source "drivers/staging/media/deprecated/atmel/Kconfig"
-source "drivers/staging/media/deprecated/saa7146/Kconfig"
 endif
 
 endif
diff --git a/drivers/staging/media/Makefile b/drivers/staging/media/Makefile
index 2efdbf78d5ef..1a4c3a062e3d 100644
--- a/drivers/staging/media/Makefile
+++ b/drivers/staging/media/Makefile
@@ -10,4 +10,3 @@ obj-$(CONFIG_VIDEO_SUNXI)	+= sunxi/
 obj-$(CONFIG_VIDEO_TEGRA)	+= tegra-video/
 obj-$(CONFIG_VIDEO_IPU3_IMGU)	+= ipu3/
 obj-$(CONFIG_DVB_AV7110)	+= av7110/
-obj-y += deprecated/saa7146/
diff --git a/drivers/staging/media/av7110/Makefile b/drivers/staging/media/av7110/Makefile
index c04cd0a59109..307b267598ea 100644
--- a/drivers/staging/media/av7110/Makefile
+++ b/drivers/staging/media/av7110/Makefile
@@ -18,6 +18,5 @@ obj-$(CONFIG_DVB_SP8870) += sp8870.o
 
 ccflags-y += -I $(srctree)/drivers/media/dvb-frontends
 ccflags-y += -I $(srctree)/drivers/media/tuners
+ccflags-y += -I $(srctree)/drivers/media/pci/ttpci
 ccflags-y += -I $(srctree)/drivers/media/common
-ccflags-y += -I $(srctree)/drivers/staging/media/deprecated/saa7146/ttpci
-ccflags-y += -I $(srctree)/drivers/staging/media/deprecated/saa7146/common
diff --git a/drivers/staging/media/av7110/av7110.h b/drivers/staging/media/av7110/av7110.h
index 9fde69b38f1c..809d938ae166 100644
--- a/drivers/staging/media/av7110/av7110.h
+++ b/drivers/staging/media/av7110/av7110.h
@@ -33,7 +33,7 @@
 #include "stv0297.h"
 #include "l64781.h"
 
-#include "saa7146_vv.h"
+#include <media/drv-intf/saa7146_vv.h>
 
 
 #define ANALOG_TUNER_VES1820 1
diff --git a/drivers/staging/media/deprecated/saa7146/Kconfig b/drivers/staging/media/deprecated/saa7146/Kconfig
deleted file mode 100644
index d0cb52164ff8..000000000000
--- a/drivers/staging/media/deprecated/saa7146/Kconfig
+++ /dev/null
@@ -1,4 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-source "drivers/staging/media/deprecated/saa7146/common/Kconfig"
-source "drivers/staging/media/deprecated/saa7146/saa7146/Kconfig"
-source "drivers/staging/media/deprecated/saa7146/ttpci/Kconfig"
diff --git a/drivers/staging/media/deprecated/saa7146/Makefile b/drivers/staging/media/deprecated/saa7146/Makefile
deleted file mode 100644
index 9d99fdedf813..000000000000
--- a/drivers/staging/media/deprecated/saa7146/Makefile
+++ /dev/null
@@ -1,2 +0,0 @@
- # SPDX-License-Identifier: GPL-2.0-only
-obj-y += common/ saa7146/ ttpci/
diff --git a/drivers/staging/media/deprecated/saa7146/saa7146/TODO b/drivers/staging/media/deprecated/saa7146/saa7146/TODO
deleted file mode 100644
index c9ae2ec79cea..000000000000
--- a/drivers/staging/media/deprecated/saa7146/saa7146/TODO
+++ /dev/null
@@ -1,7 +0,0 @@
-The saa7146-based drivers are one of the few drivers still not using
-the vb2 framework, so these drivers are now deprecated with the intent of
-removing them altogether by the beginning of 2023.
-
-In order to keep these drivers they have to be converted to vb2.
-If someone is interested in doing this work, then contact the
-linux-media mailinglist (https://linuxtv.org/lists.php).
diff --git a/drivers/staging/media/deprecated/saa7146/ttpci/TODO b/drivers/staging/media/deprecated/saa7146/ttpci/TODO
deleted file mode 100644
index c9ae2ec79cea..000000000000
--- a/drivers/staging/media/deprecated/saa7146/ttpci/TODO
+++ /dev/null
@@ -1,7 +0,0 @@
-The saa7146-based drivers are one of the few drivers still not using
-the vb2 framework, so these drivers are now deprecated with the intent of
-removing them altogether by the beginning of 2023.
-
-In order to keep these drivers they have to be converted to vb2.
-If someone is interested in doing this work, then contact the
-linux-media mailinglist (https://linuxtv.org/lists.php).
diff --git a/drivers/staging/media/deprecated/saa7146/common/saa7146.h b/include/media/drv-intf/saa7146.h
similarity index 100%
rename from drivers/staging/media/deprecated/saa7146/common/saa7146.h
rename to include/media/drv-intf/saa7146.h
diff --git a/drivers/staging/media/deprecated/saa7146/common/saa7146_vv.h b/include/media/drv-intf/saa7146_vv.h
similarity index 99%
rename from drivers/staging/media/deprecated/saa7146/common/saa7146_vv.h
rename to include/media/drv-intf/saa7146_vv.h
index d7bd916fe3ad..635805fb35e8 100644
--- a/drivers/staging/media/deprecated/saa7146/common/saa7146_vv.h
+++ b/include/media/drv-intf/saa7146_vv.h
@@ -5,8 +5,8 @@
 #include <media/v4l2-common.h>
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-fh.h>
+#include <media/drv-intf/saa7146.h>
 #include <media/videobuf-dma-sg.h>
-#include "saa7146.h"
 
 #define MAX_SAA7146_CAPTURE_BUFFERS	32	/* arbitrary */
 #define BUFFER_TIMEOUT     (HZ/2)  /* 0.5 seconds */
-- 
2.39.0

