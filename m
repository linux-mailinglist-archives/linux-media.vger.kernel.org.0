Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 337F47B0234
	for <lists+linux-media@lfdr.de>; Wed, 27 Sep 2023 12:51:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230432AbjI0Kvk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Sep 2023 06:51:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229648AbjI0Kvj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Sep 2023 06:51:39 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 838C4F3
        for <linux-media@vger.kernel.org>; Wed, 27 Sep 2023 03:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695811897; x=1727347897;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=RUF0Wm+0BWLlLxX8/UFqM61vKZggwDBH0MBc+UWZmFQ=;
  b=Qw/Ll9JFhrN2lioqgS+110hEj1b3e14t0AIft1aD/hYuQFf+Z5T55GT+
   Bqs6CalD7HzFbLksbFnlf03TES4t8t/KCcj6VYdbyfbMUYwx/rcRr4EvS
   WBgAKydgu4idxNGvH7pDAWLj8eBnoqzIq8NdaLXqpnnxJF1KFuOaRA3ri
   dOQrVTka3+kP5WVis0Nx3N6lHiupk75iVq1niZ7X65aj1LjxSTUfQq0Qu
   6uJiFnWG9RcZd9N1M1Pdjls/yfbaMH3/72VJKc9a9HtyhVpVvC6pXWKjC
   7LRgZlNbVvVeD3idvySuUGQGDZ2MLsz5UShTDZDwKxzBJ2eB4GPa12Qc5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="362046634"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="362046634"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 03:51:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="725760403"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="725760403"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 03:51:35 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 5538B1209F6;
        Wed, 27 Sep 2023 13:51:32 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qlS8Y-002xfG-0T;
        Wed, 27 Sep 2023 13:51:22 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Arnd Bergmann <arnd@kernel.org>, Bingbu Cao <bingbu.cao@intel.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 1/1] media: ipu-bridge: Fix Kconfig dependencies
Date:   Wed, 27 Sep 2023 13:51:12 +0300
Message-Id: <20230927105112.705998-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The current Kconfig symbol dependencies allow having the following Kconfig
symbol values

	CONFIG_IPU_BRIDGE=m
	CONFIG_VIDEO_IPU3_CIO2=y
	CONFIG_CIO2_BRIDGE=n

This does not work as the IPU bridge API is conditional to
IS_ENABLED(CONFIG_IPU_BRIDGE). Fix this by changing the dependencies so
that CONFIG_IPU_BRIDGE can be separately selected.

The CONFIG_CIO2_BRIDGE symbol becomes redundant as a result and is
removed.

Fixes: 2545a2c02ba1 ("media: ipu3-cio2: allow ipu_bridge to be a module again")
Suggested-by: Arnd Bergmann <arnd@kernel.org>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/Kconfig       | 20 ++++++++++++++------
 drivers/media/pci/intel/ipu3/Kconfig  | 21 +--------------------
 drivers/staging/media/atomisp/Kconfig |  2 +-
 3 files changed, 16 insertions(+), 27 deletions(-)

diff --git a/drivers/media/pci/intel/Kconfig b/drivers/media/pci/intel/Kconfig
index e113902fa806..ee4684159d3d 100644
--- a/drivers/media/pci/intel/Kconfig
+++ b/drivers/media/pci/intel/Kconfig
@@ -1,11 +1,19 @@
 # SPDX-License-Identifier: GPL-2.0-only
+
+source "drivers/media/pci/intel/ipu3/Kconfig"
+source "drivers/media/pci/intel/ivsc/Kconfig"
+
 config IPU_BRIDGE
-	tristate
+	tristate "Intel IPU Bridge"
 	depends on I2C && ACPI
 	help
-	  This is a helper module for the IPU bridge, which can be
-	  used by ipu3 and other drivers. In order to handle module
-	  dependencies, this is selected by each driver that needs it.
+	  The IPU bridge is a helper library for Intel IPU drivers to
+	  function on systems shipped with Windows.
 
-source "drivers/media/pci/intel/ipu3/Kconfig"
-source "drivers/media/pci/intel/ivsc/Kconfig"
+	  Currently used by the ipu3-cio2 and atomisp drivers.
+
+	  Supported systems include:
+
+	  - Microsoft Surface models (except Surface Pro 3)
+	  - The Lenovo Miix line (for example the 510, 520, 710 and 720)
+	  - Dell 7285
diff --git a/drivers/media/pci/intel/ipu3/Kconfig b/drivers/media/pci/intel/ipu3/Kconfig
index 0951545eab21..c0a250daa927 100644
--- a/drivers/media/pci/intel/ipu3/Kconfig
+++ b/drivers/media/pci/intel/ipu3/Kconfig
@@ -2,13 +2,13 @@
 config VIDEO_IPU3_CIO2
 	tristate "Intel ipu3-cio2 driver"
 	depends on VIDEO_DEV && PCI
+	depends on IPU_BRIDGE || !IPU_BRIDGE
 	depends on ACPI || COMPILE_TEST
 	depends on X86
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
 	select VIDEOBUF2_DMA_SG
-	select IPU_BRIDGE if CIO2_BRIDGE
 
 	help
 	  This is the Intel IPU3 CIO2 CSI-2 receiver unit, found in Intel
@@ -18,22 +18,3 @@ config VIDEO_IPU3_CIO2
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
diff --git a/drivers/staging/media/atomisp/Kconfig b/drivers/staging/media/atomisp/Kconfig
index 5d8917160d41..75c985da75b5 100644
--- a/drivers/staging/media/atomisp/Kconfig
+++ b/drivers/staging/media/atomisp/Kconfig
@@ -12,12 +12,12 @@ menuconfig INTEL_ATOMISP
 config VIDEO_ATOMISP
 	tristate "Intel Atom Image Signal Processor Driver"
 	depends on VIDEO_DEV && INTEL_ATOMISP
+	depends on IPU_BRIDGE
 	depends on MEDIA_PCI_SUPPORT
 	depends on PMIC_OPREGION
 	depends on I2C
 	select V4L2_FWNODE
 	select IOSF_MBI
-	select IPU_BRIDGE
 	select VIDEOBUF2_VMALLOC
 	select VIDEO_V4L2_SUBDEV_API
 	help
-- 
2.39.2

