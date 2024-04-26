Return-Path: <linux-media+bounces-10208-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 029238B34B9
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 11:59:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 348021C21D4C
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 09:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73093140E25;
	Fri, 26 Apr 2024 09:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="idSWia/9"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99BEC1422AD
	for <linux-media@vger.kernel.org>; Fri, 26 Apr 2024 09:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714125545; cv=none; b=Amb497xfcgxLyX094oMF6Ey7SbExM3GPo4pEIYLFqOE5AtJ1t3OC1PBiIYZy9skhC7d41v+/FeKyzQ5njIES+hGAz1GB8qIsg/qhmBcN5wxc43yjXSidivroLoqsu1lUEf1YKwEGVV0/WFm26IUBNRFZk2/8umBhpa4kZpBmjG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714125545; c=relaxed/simple;
	bh=wBWiV4Nv/ctQAGojh4/9FVAaL3zVVbjkSo+vvkT9QSU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y0i8H9ui/tV7R9Tuv3zvdAiP/DOxDIzCnLvzarnUZClj5Wh15WnlP5KRMULMoHOdx4VSB/A4n4SHM+mBqdLGazJU0TgZaTjpXOPnv4EOctvAmEpB8uyq+LhAkW0WHATiWIw/z8NQUoRrPqH9ovctT3SniBo1Hrmi+T63FFl8nDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=idSWia/9; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714125545; x=1745661545;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wBWiV4Nv/ctQAGojh4/9FVAaL3zVVbjkSo+vvkT9QSU=;
  b=idSWia/99tuUHQolEvsMzC488m6RJDhAS7yK384BY6cQJHPdr7BNMRNQ
   hY089Cldmpqi5NYR6A1aTbsYPTFGPltcU2BwaPufr47OOfsPOALIkkngT
   /jBwtDd9RoYaPm/qNBJWEa1eosWzic9s+oj3i7QVFR/BefupDZ07dKD7U
   La37CIogLTQaDxYKNBI3mADn2bNE1I11ENnB2uaRFOzMhJM30I9uenIkM
   u9MfZqJ0e30xGnLDkvCLEtMPjV1GzHVdvtJCWBFsj0cEZz+ue5IL9jcDx
   lrJNdN+uBffUpytjEIWdUz9LAalZt4r9TYpFZ9PKhuy6TIOQRetoHIRJx
   A==;
X-CSE-ConnectionGUID: 20DE+VRLTCeBC7EgPFsfyA==
X-CSE-MsgGUID: jTXANk3+TA6NaWl61/WOVg==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="20409449"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="20409449"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 02:59:04 -0700
X-CSE-ConnectionGUID: irNAeKAZT8yC1E41LLoUqQ==
X-CSE-MsgGUID: IzrnUfw+ScCKAUg0kHd7Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="30173042"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 02:58:58 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 0717D11FA8A;
	Fri, 26 Apr 2024 12:58:54 +0300 (EEST)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@intel.com,
	laurent.pinchart@ideasonboard.com,
	andriy.shevchenko@linux.intel.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	claus.stovgaard@gmail.com,
	tomi.valkeinen@ideasonboard.com,
	tfiga@chromium.org,
	senozhatsky@chromium.org,
	andreaskleist@gmail.com,
	bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	hongju.wang@intel.com
Subject: [PATCH v6 14/18] media: intel/ipu6: add Kconfig and Makefile
Date: Fri, 26 Apr 2024 12:58:18 +0300
Message-Id: <20240426095822.946453-15-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240426095822.946453-1-sakari.ailus@linux.intel.com>
References: <20240426095822.946453-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bingbu Cao <bingbu.cao@intel.com>

Add Kconfig and Makefile for the IPU6 driver.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
Signed-off-by: Andreas Helbech Kleist <andreaskleist@gmail.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/Kconfig       |  1 +
 drivers/media/pci/intel/Makefile      |  1 +
 drivers/media/pci/intel/ipu6/Kconfig  | 18 ++++++++++++++++++
 drivers/media/pci/intel/ipu6/Makefile | 23 +++++++++++++++++++++++
 4 files changed, 43 insertions(+)
 create mode 100644 drivers/media/pci/intel/ipu6/Kconfig
 create mode 100644 drivers/media/pci/intel/ipu6/Makefile

diff --git a/drivers/media/pci/intel/Kconfig b/drivers/media/pci/intel/Kconfig
index ee4684159d3d..04cb3d253486 100644
--- a/drivers/media/pci/intel/Kconfig
+++ b/drivers/media/pci/intel/Kconfig
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 source "drivers/media/pci/intel/ipu3/Kconfig"
+source "drivers/media/pci/intel/ipu6/Kconfig"
 source "drivers/media/pci/intel/ivsc/Kconfig"
 
 config IPU_BRIDGE
diff --git a/drivers/media/pci/intel/Makefile b/drivers/media/pci/intel/Makefile
index f199a97e1d78..3a2cc6567159 100644
--- a/drivers/media/pci/intel/Makefile
+++ b/drivers/media/pci/intel/Makefile
@@ -5,3 +5,4 @@
 obj-$(CONFIG_IPU_BRIDGE) += ipu-bridge.o
 obj-y	+= ipu3/
 obj-y	+= ivsc/
+obj-$(CONFIG_VIDEO_INTEL_IPU6)	+= ipu6/
diff --git a/drivers/media/pci/intel/ipu6/Kconfig b/drivers/media/pci/intel/ipu6/Kconfig
new file mode 100644
index 000000000000..154343080c82
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/Kconfig
@@ -0,0 +1,18 @@
+config VIDEO_INTEL_IPU6
+	tristate "Intel IPU6 driver"
+	depends on ACPI || COMPILE_TEST
+	depends on VIDEO_DEV
+	depends on X86 && X86_64 && HAS_DMA
+	select DMA_OPS
+	select IOMMU_IOVA
+	select VIDEO_V4L2_SUBDEV_API
+	select MEDIA_CONTROLLER
+	select VIDEOBUF2_DMA_CONTIG
+	select V4L2_FWNODE
+	select IPU_BRIDGE
+	help
+	  This is the 6th Gen Intel Image Processing Unit, found in Intel SoCs
+	  and used for capturing images and video from camera sensors.
+
+	  To compile this driver, say Y here! It contains 2 modules -
+	  intel_ipu6 and intel_ipu6_isys.
diff --git a/drivers/media/pci/intel/ipu6/Makefile b/drivers/media/pci/intel/ipu6/Makefile
new file mode 100644
index 000000000000..a821b0a1567f
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/Makefile
@@ -0,0 +1,23 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+intel-ipu6-y			:= ipu6.o \
+				ipu6-bus.o \
+				ipu6-dma.o \
+				ipu6-mmu.o \
+				ipu6-buttress.o \
+				ipu6-cpd.o \
+				ipu6-fw-com.o
+
+obj-$(CONFIG_VIDEO_INTEL_IPU6)	+= intel-ipu6.o
+
+intel-ipu6-isys-y		:= ipu6-isys.o \
+				ipu6-isys-csi2.o \
+				ipu6-fw-isys.o \
+				ipu6-isys-video.o \
+				ipu6-isys-queue.o \
+				ipu6-isys-subdev.o \
+				ipu6-isys-mcd-phy.o \
+				ipu6-isys-jsl-phy.o \
+				ipu6-isys-dwc-phy.o
+
+obj-$(CONFIG_VIDEO_INTEL_IPU6)	+= intel-ipu6-isys.o
-- 
2.39.2


