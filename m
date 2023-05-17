Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15065706501
	for <lists+linux-media@lfdr.de>; Wed, 17 May 2023 12:19:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230270AbjEQKTX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 May 2023 06:19:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230269AbjEQKTV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 May 2023 06:19:21 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEC1C4209
        for <linux-media@vger.kernel.org>; Wed, 17 May 2023 03:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684318759; x=1715854759;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=HbbjNO/esOoBzuUeH1yMm8e9ugoKfqIlJgQg8bLkums=;
  b=GM/jwbO1gcEkIAqG31zbakVLPdXoZFoPSayQpLXXupX15BdDHeIziWVP
   J63odtZ2HMtwiFnCF0gMsoHbBuQPymo6UC1q2Safx/lpb3ds2VEPtgPMF
   ZsPUzoHnQxW53AQe1jdzsuJgdULyIxAsszqVBBhnkjLPYOPYy7dvTNnAH
   PNGlaXk52jhKjgiVLq+UzDu8KZ69M6EMAuxMiN43lO9LMa83j6iAPR+PM
   NRuO63QOI2kUaFAn5BYhVyBvuZtKcwvI+wavBJiW7IXXmYoGVKpWoIwGB
   YE4vWLooU/KbvSaOL0cgPlmMnpJyxfRAegHliPvdFpb4WjutXcLNFpRKd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="354888970"
X-IronPort-AV: E=Sophos;i="5.99,281,1677571200"; 
   d="scan'208";a="354888970"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2023 03:19:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="948215939"
X-IronPort-AV: E=Sophos;i="5.99,281,1677571200"; 
   d="scan'208";a="948215939"
Received: from icg-kernel3.bj.intel.com ([172.16.126.100])
  by fmsmga006.fm.intel.com with ESMTP; 17 May 2023 03:19:16 -0700
From:   bingbu.cao@intel.com
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        dan.scally@ideasonboard.com
Cc:     wentong.wu@intel.com, bingbu.cao@intel.com,
        bingbu.cao@linux.intel.com
Subject: [PATCH] media: intel: rename and move cio2-bridge out of ipu3
Date:   Wed, 17 May 2023 18:30:04 +0800
Message-Id: <20230517103004.724264-1-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Bingbu Cao <bingbu.cao@intel.com>

cio2 bridge was involved along with IPU3. However, in fact all Intel
IPUs besides IPU3 CIO2 need this bridge driver. This patch move
bridge driver out of ipu3 directory and rename as ipu-bridge. Then
it can be worked with IPU3 and other Intel IPUs.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/media/pci/Kconfig                     |  1 +
 drivers/media/pci/intel/Kconfig               | 19 +++++++++++++++++++
 drivers/media/pci/intel/Makefile              |  4 ++--
 .../{ipu3/cio2-bridge.c => ipu-bridge.c}      |  5 +++--
 .../{ipu3/cio2-bridge.h => ipu-bridge.h}      |  8 +++++++-
 drivers/media/pci/intel/ipu3/Kconfig          | 19 -------------------
 drivers/media/pci/intel/ipu3/Makefile         |  1 -
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |  4 +++-
 drivers/media/pci/intel/ipu3/ipu3-cio2.h      |  6 ------
 9 files changed, 35 insertions(+), 32 deletions(-)
 create mode 100644 drivers/media/pci/intel/Kconfig
 rename drivers/media/pci/intel/{ipu3/cio2-bridge.c => ipu-bridge.c} (99%)
 rename drivers/media/pci/intel/{ipu3/cio2-bridge.h => ipu-bridge.h} (94%)

diff --git a/drivers/media/pci/Kconfig b/drivers/media/pci/Kconfig
index 480194543d05..06bcd9c1ca99 100644
--- a/drivers/media/pci/Kconfig
+++ b/drivers/media/pci/Kconfig
@@ -73,6 +73,7 @@ config VIDEO_PCI_SKELETON
 	  Enable build of the skeleton PCI driver, used as a reference
 	  when developing new drivers.
 
+source "drivers/media/pci/intel/Kconfig"
 source "drivers/media/pci/intel/ipu3/Kconfig"
 
 endif #MEDIA_PCI_SUPPORT
diff --git a/drivers/media/pci/intel/Kconfig b/drivers/media/pci/intel/Kconfig
new file mode 100644
index 000000000000..47bd69c6c9f9
--- /dev/null
+++ b/drivers/media/pci/intel/Kconfig
@@ -0,0 +1,19 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config IPU_BRIDGE
+	bool "Intel IPU Sensors Bridge"
+	depends on VIDEO_IPU3_CIO2 && ACPI
+	depends on I2C
+	help
+	  This extension provides an API for the Intel IPU driver to create
+	  connections to cameras that are hidden in the SSDB buffer in ACPI.
+	  It can be used to enable support for cameras in detachable / hybrid
+	  devices that ship with Windows.
+
+	  Say Y here if your device is a detachable / hybrid laptop that comes
+	  with Windows installed by the OEM, for example:
+
+		- Microsoft Surface models (except Surface Pro 3)
+		- The Lenovo Miix line (for example the 510, 520, 710 and 720)
+		- Dell 7285
+
+	  If in doubt, say N here.
diff --git a/drivers/media/pci/intel/Makefile b/drivers/media/pci/intel/Makefile
index 0b4236c4db49..951191a7e401 100644
--- a/drivers/media/pci/intel/Makefile
+++ b/drivers/media/pci/intel/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
-# Makefile for the IPU3 cio2 and ImGU drivers
+# Makefile for the IPU drivers
 #
-
+obj-$(CONFIG_IPU_BRIDGE) += ipu-bridge.o
 obj-y	+= ipu3/
diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
similarity index 99%
rename from drivers/media/pci/intel/ipu3/cio2-bridge.c
rename to drivers/media/pci/intel/ipu-bridge.c
index 3c2accfe5455..6fdc79e1f970 100644
--- a/drivers/media/pci/intel/ipu3/cio2-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -8,7 +8,7 @@
 #include <linux/property.h>
 #include <media/v4l2-fwnode.h>
 
-#include "cio2-bridge.h"
+#include "ipu-bridge.h"
 
 /*
  * Extend this array with ACPI Hardware IDs of devices known to be working
@@ -431,7 +431,7 @@ static int cio2_bridge_sensors_are_ready(void)
 	return ready;
 }
 
-int cio2_bridge_init(struct pci_dev *cio2)
+int ipu_bridge_init(struct pci_dev *cio2)
 {
 	struct device *dev = &cio2->dev;
 	struct fwnode_handle *fwnode;
@@ -492,3 +492,4 @@ int cio2_bridge_init(struct pci_dev *cio2)
 
 	return ret;
 }
+EXPORT_SYMBOL_NS_GPL(ipu_bridge_init, INTEL_IPU_BRIDGE);
diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.h b/drivers/media/pci/intel/ipu-bridge.h
similarity index 94%
rename from drivers/media/pci/intel/ipu3/cio2-bridge.h
rename to drivers/media/pci/intel/ipu-bridge.h
index b76ed8a641e2..a86e80c0bbbe 100644
--- a/drivers/media/pci/intel/ipu3/cio2-bridge.h
+++ b/drivers/media/pci/intel/ipu-bridge.h
@@ -6,7 +6,7 @@
 #include <linux/property.h>
 #include <linux/types.h>
 
-#include "ipu3-cio2.h"
+#include "ipu3/ipu3-cio2.h"
 
 struct i2c_client;
 
@@ -143,4 +143,10 @@ struct cio2_bridge {
 	struct cio2_sensor sensors[CIO2_NUM_PORTS];
 };
 
+#if IS_ENABLED(CONFIG_IPU_BRIDGE)
+int ipu_bridge_init(struct pci_dev *cio2);
+#else
+static inline int ipu_bridge_init(struct pci_dev *cio2) { return 0; }
+#endif
+
 #endif
diff --git a/drivers/media/pci/intel/ipu3/Kconfig b/drivers/media/pci/intel/ipu3/Kconfig
index 65b0c1598fbf..9be06ee81ff0 100644
--- a/drivers/media/pci/intel/ipu3/Kconfig
+++ b/drivers/media/pci/intel/ipu3/Kconfig
@@ -17,22 +17,3 @@ config VIDEO_IPU3_CIO2
 	  Say Y or M here if you have a Skylake/Kaby Lake SoC with MIPI CSI-2
 	  connected camera.
 	  The module will be called ipu3-cio2.
-
-config CIO2_BRIDGE
-	bool "IPU3 CIO2 Sensors Bridge"
-	depends on VIDEO_IPU3_CIO2 && ACPI
-	depends on I2C
-	help
-	  This extension provides an API for the ipu3-cio2 driver to create
-	  connections to cameras that are hidden in the SSDB buffer in ACPI.
-	  It can be used to enable support for cameras in detachable / hybrid
-	  devices that ship with Windows.
-
-	  Say Y here if your device is a detachable / hybrid laptop that comes
-	  with Windows installed by the OEM, for example:
-
-		- Microsoft Surface models (except Surface Pro 3)
-		- The Lenovo Miix line (for example the 510, 520, 710 and 720)
-		- Dell 7285
-
-	  If in doubt, say N here.
diff --git a/drivers/media/pci/intel/ipu3/Makefile b/drivers/media/pci/intel/ipu3/Makefile
index 933777e6ea8a..429d516452e4 100644
--- a/drivers/media/pci/intel/ipu3/Makefile
+++ b/drivers/media/pci/intel/ipu3/Makefile
@@ -2,4 +2,3 @@
 obj-$(CONFIG_VIDEO_IPU3_CIO2) += ipu3-cio2.o
 
 ipu3-cio2-y += ipu3-cio2-main.o
-ipu3-cio2-$(CONFIG_CIO2_BRIDGE) += cio2-bridge.o
diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
index 3c84cb121632..03a7ab4d2e69 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
@@ -29,6 +29,7 @@
 #include <media/v4l2-ioctl.h>
 #include <media/videobuf2-dma-sg.h>
 
+#include "../ipu-bridge.h"
 #include "ipu3-cio2.h"
 
 struct ipu3_cio2_fmt {
@@ -1727,7 +1728,7 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
 			return -EINVAL;
 		}
 
-		r = cio2_bridge_init(pci_dev);
+		r = ipu_bridge_init(pci_dev);
 		if (r)
 			return r;
 	}
@@ -2060,3 +2061,4 @@ MODULE_AUTHOR("Yuning Pu <yuning.pu@intel.com>");
 MODULE_AUTHOR("Yong Zhi <yong.zhi@intel.com>");
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("IPU3 CIO2 driver");
+MODULE_IMPORT_NS(INTEL_IPU_BRIDGE);
diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.h b/drivers/media/pci/intel/ipu3/ipu3-cio2.h
index 3a1f394e05aa..d731ce8adbe3 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.h
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.h
@@ -459,10 +459,4 @@ static inline struct cio2_queue *vb2q_to_cio2_queue(struct vb2_queue *vq)
 	return container_of(vq, struct cio2_queue, vbq);
 }
 
-#if IS_ENABLED(CONFIG_CIO2_BRIDGE)
-int cio2_bridge_init(struct pci_dev *cio2);
-#else
-static inline int cio2_bridge_init(struct pci_dev *cio2) { return 0; }
-#endif
-
 #endif
-- 
2.40.1

