Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5FD0764822
	for <lists+linux-media@lfdr.de>; Thu, 27 Jul 2023 09:12:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233114AbjG0HM0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jul 2023 03:12:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233136AbjG0HLy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jul 2023 03:11:54 -0400
Received: from mgamail.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89C9959E8
        for <linux-media@vger.kernel.org>; Thu, 27 Jul 2023 00:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690441599; x=1721977599;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1PSbTrTGJBMu1vGPurH1DXXDbW8VvbamKvURkfO2EeU=;
  b=Nq14KTIarfO4MFJ/cp+JTmwX9XeohSVMEPvrAZOiqUoEKhXagHHkWfi2
   fUQIGyn/LLfUrBocytNQGAEpKoI+JmXsHBCG6SgE/e5woc1zMAXzElnrD
   AmAqR8a0WGOy+Ef0+vhllaiDMRP2ZRoJpscP9g3xeZKXLonf6a0oMHVi2
   Bo76b6LjWIKNfwfpRfvIwvRxwCSO06nFq9oPc/sDdvKIC3onq29/WdlVI
   NF8qStMx7IcDGv3Hu8TgFYZHGfe5uWgmwOxrwDYZnhjmFiskE74UREm95
   WaL7nGrUHJrvrcPdn46LHI/5baoHnFglUtCZDgkzIi4xKPrndo3Jw8u7z
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="370900986"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="370900986"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 00:04:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="704073199"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="704073199"
Received: from icg-kernel3.bj.intel.com ([172.16.126.100])
  by orsmga006.jf.intel.com with ESMTP; 27 Jul 2023 00:04:54 -0700
From:   bingbu.cao@intel.com
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com
Cc:     ilpo.jarvinen@linux.intel.com, tfiga@chromium.org,
        senozhatsky@chromium.org, andriy.shevchenko@linux.intel.com,
        hdegoede@redhat.com, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@intel.com, bingbu.cao@linux.intel.com,
        tian.shu.qiu@intel.com, hongju.wang@intel.com
Subject: [PATCH 12/15] media: add Kconfig and Makefile for IPU6
Date:   Thu, 27 Jul 2023 15:15:55 +0800
Message-Id: <20230727071558.1148653-13-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230727071558.1148653-1-bingbu.cao@intel.com>
References: <20230727071558.1148653-1-bingbu.cao@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Bingbu Cao <bingbu.cao@intel.com>

Add IPU6 support in Kconfig and Makefile, with this patch you can
build the Intel IPU6 and input system modules by select the
CONFIG_VIDEO_INTEL_IPU6 in config.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/media/pci/intel/Kconfig       |  3 ++-
 drivers/media/pci/intel/Makefile      |  1 +
 drivers/media/pci/intel/ipu6/Kconfig  | 15 +++++++++++++++
 drivers/media/pci/intel/ipu6/Makefile | 23 +++++++++++++++++++++++
 4 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/pci/intel/ipu6/Kconfig
 create mode 100644 drivers/media/pci/intel/ipu6/Makefile

diff --git a/drivers/media/pci/intel/Kconfig b/drivers/media/pci/intel/Kconfig
index 64a29b0b7033..adcdddb5fb09 100644
--- a/drivers/media/pci/intel/Kconfig
+++ b/drivers/media/pci/intel/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config IPU_BRIDGE
 	bool "Intel IPU Sensors Bridge"
-	depends on VIDEO_IPU3_CIO2 && ACPI
+	depends on (VIDEO_IPU3_CIO2 || VIDEO_INTEL_IPU6) && ACPI
 	depends on I2C
 	help
 	  This extension provides an API for the Intel IPU driver to create
@@ -19,3 +19,4 @@ config IPU_BRIDGE
 	  If in doubt, say N here.
 
 source "drivers/media/pci/intel/ipu3/Kconfig"
+source "drivers/media/pci/intel/ipu6/Kconfig"
diff --git a/drivers/media/pci/intel/Makefile b/drivers/media/pci/intel/Makefile
index 951191a7e401..1eb772f1866d 100644
--- a/drivers/media/pci/intel/Makefile
+++ b/drivers/media/pci/intel/Makefile
@@ -4,3 +4,4 @@
 #
 obj-$(CONFIG_IPU_BRIDGE) += ipu-bridge.o
 obj-y	+= ipu3/
+obj-$(CONFIG_VIDEO_INTEL_IPU6)	+= ipu6/
diff --git a/drivers/media/pci/intel/ipu6/Kconfig b/drivers/media/pci/intel/ipu6/Kconfig
new file mode 100644
index 000000000000..1fa44b9d8828
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/Kconfig
@@ -0,0 +1,15 @@
+config VIDEO_INTEL_IPU6
+	tristate "Intel IPU6 driver"
+	depends on ACPI || COMPILE_TEST
+	depends on MEDIA_SUPPORT
+	depends on MEDIA_PCI_SUPPORT
+	depends on X86 && X86_64
+	select IOMMU_IOVA
+	select VIDEOBUF2_DMA_CONTIG
+	select V4L2_FWNODE
+	help
+	  This is the 6th Gen Intel Image Processing Unit, found in Intel SoCs
+	  and used for capturing images and video from camera sensors.
+
+	  To compile this driver, say Y here! It contains 2 modules -
+	  intel_ipu6 and intel_ipu6_isys.
diff --git a/drivers/media/pci/intel/ipu6/Makefile b/drivers/media/pci/intel/ipu6/Makefile
new file mode 100644
index 000000000000..6a6339c84ef4
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/Makefile
@@ -0,0 +1,23 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+intel-ipu6-objs				+= ipu6.o \
+					ipu6-bus.o \
+					ipu6-dma.o \
+					ipu6-mmu.o \
+					ipu6-buttress.o \
+					ipu6-cpd.o \
+					ipu6-fw-com.o
+
+obj-$(CONFIG_VIDEO_INTEL_IPU6)		+= intel-ipu6.o
+
+intel-ipu6-isys-objs			+= ipu6-isys.o \
+					ipu6-isys-csi2.o \
+					ipu6-fw-isys.o \
+					ipu6-isys-video.o \
+					ipu6-isys-queue.o \
+					ipu6-isys-subdev.o \
+					ipu6-isys-mcd-phy.o \
+					ipu6-isys-jsl-phy.o \
+					ipu6-isys-dwc-phy.o
+
+obj-$(CONFIG_VIDEO_INTEL_IPU6)		+= intel-ipu6-isys.o
-- 
2.40.1

