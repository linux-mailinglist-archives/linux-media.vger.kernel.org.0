Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 322336E0AC8
	for <lists+linux-media@lfdr.de>; Thu, 13 Apr 2023 11:55:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230097AbjDMJzi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Apr 2023 05:55:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230095AbjDMJzg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Apr 2023 05:55:36 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F4028A64
        for <linux-media@vger.kernel.org>; Thu, 13 Apr 2023 02:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681379724; x=1712915724;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=atiALN3bP4RoJFTxBmhbHrRSYfbz9quUZu5k2iQBOGc=;
  b=WU/ZKyw1rFc5yqDwLsZbgz1aFgPfbDHOkZB9nl8Q1bx9tyZTLqIb6d5h
   KvZM33hRYcigiT6tLcWe7DWB4ylVZY8eVnfaioPJYTo24P0ZvRw00rRvl
   thmfBX7dH7nnDJ1DU0/C6UBs/GDuvHmD2II34Cex6d063l44WSCRsQWqU
   cfKhd/ib4HXT8hNhafnVrpeeu8hpdPMxC+v1DkRE+dmCPUDkz3zy9fHob
   QQT+5N3j12uTfxJb6Yx4CgsfuRuLAtHr6ANa7VsrEAFWohueFI/2XIDyz
   TDPlhoYlgZkHEi/BLjQAfJ2/d1bqVYmsmA7+dTZVBrWr5QqXVQ4SFQB6J
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="371993119"
X-IronPort-AV: E=Sophos;i="5.98,341,1673942400"; 
   d="scan'208";a="371993119"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 02:55:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="639600211"
X-IronPort-AV: E=Sophos;i="5.98,341,1673942400"; 
   d="scan'208";a="639600211"
Received: from icg-kernel3.bj.intel.com ([172.16.126.100])
  by orsmga003.jf.intel.com with ESMTP; 13 Apr 2023 02:55:14 -0700
From:   bingbu.cao@intel.com
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com, ilpo.jarvinen@linux.intel.com
Cc:     tfiga@chromium.org, senozhatsky@chromium.org, hdegoede@redhat.com,
        bingbu.cao@intel.com, bingbu.cao@linux.intel.com,
        tian.shu.qiu@intel.com, hongju.wang@intel.com,
        daniel.h.kang@intel.com
Subject: [RFC PATCH 12/14] media: add Kconfig and Makefile for IPU6
Date:   Thu, 13 Apr 2023 18:04:27 +0800
Message-Id: <20230413100429.919622-13-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230413100429.919622-1-bingbu.cao@intel.com>
References: <20230413100429.919622-1-bingbu.cao@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
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
 drivers/media/pci/Kconfig             |  1 +
 drivers/media/pci/intel/Makefile      |  3 ++-
 drivers/media/pci/intel/ipu6/Kconfig  | 15 +++++++++++++++
 drivers/media/pci/intel/ipu6/Makefile | 23 +++++++++++++++++++++++
 4 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/pci/intel/ipu6/Kconfig
 create mode 100644 drivers/media/pci/intel/ipu6/Makefile

diff --git a/drivers/media/pci/Kconfig b/drivers/media/pci/Kconfig
index 480194543d05..38fb484f5c8e 100644
--- a/drivers/media/pci/Kconfig
+++ b/drivers/media/pci/Kconfig
@@ -74,6 +74,7 @@ config VIDEO_PCI_SKELETON
 	  when developing new drivers.
 
 source "drivers/media/pci/intel/ipu3/Kconfig"
+source "drivers/media/pci/intel/ipu6/Kconfig"
 
 endif #MEDIA_PCI_SUPPORT
 endif #PCI
diff --git a/drivers/media/pci/intel/Makefile b/drivers/media/pci/intel/Makefile
index 0b4236c4db49..de2b73fef890 100644
--- a/drivers/media/pci/intel/Makefile
+++ b/drivers/media/pci/intel/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
-# Makefile for the IPU3 cio2 and ImGU drivers
+# Makefile for the Intel IPU drivers
 #
 
 obj-y	+= ipu3/
+obj-$(CONFIG_VIDEO_INTEL_IPU6)	+= ipu6/
diff --git a/drivers/media/pci/intel/ipu6/Kconfig b/drivers/media/pci/intel/ipu6/Kconfig
new file mode 100644
index 000000000000..c88ef2f40f6d
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/Kconfig
@@ -0,0 +1,15 @@
+config VIDEO_INTEL_IPU6
+	tristate "Intel IPU6 driver"
+	depends on ACPI || COMPILE_TEST
+	depends on MEDIA_SUPPORT
+	depends on MEDIA_PCI_SUPPORT
+	depends on X86_64
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
2.39.1

