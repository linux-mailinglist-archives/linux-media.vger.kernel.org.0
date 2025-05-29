Return-Path: <linux-media+bounces-33570-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC11AC770A
	for <lists+linux-media@lfdr.de>; Thu, 29 May 2025 06:13:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E7A34E4D10
	for <lists+linux-media@lfdr.de>; Thu, 29 May 2025 04:13:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE01E24EF6B;
	Thu, 29 May 2025 04:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PBjP1ggE"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5CE24E4C3
	for <linux-media@vger.kernel.org>; Thu, 29 May 2025 04:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748492031; cv=none; b=ZnIg+V50HwEC/fsfPa0Om1hRPoLrdljdG40lFRObp+UokO/kmoIxgB9NpnRT6hai2C3EfxI8rb9d6BhayT6scSgStmFYg4lFyYLio+1vGDcDC1H8Ngkgx4I5z+9+CGstA562q+4cKPs6TqLCMZQKfcaEZy+fBDRLDniz7o9OujQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748492031; c=relaxed/simple;
	bh=EBIXLSlKnhdLfilxK+ybGTsTMexpm63r/GH9hyYAXYY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=E37gfRp8yRdmJSCY43/Y4i3bcTAHWukMnmjMBVmRUmZEJktvLjj7GveBO1qUE+I+0htDEKMUkXek04501Wszulw0RkQwy5h4wcJJ6Y2ubiGQOFO9Q42GwTjIGAyPDDy2UQm+6vlSOM6jPaiQUZV6m9f9LF9DTqHCTg2ChiKhWxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PBjP1ggE; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748492030; x=1780028030;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EBIXLSlKnhdLfilxK+ybGTsTMexpm63r/GH9hyYAXYY=;
  b=PBjP1ggE1b/OyzEufDTvi9i9yheMhoEVB1FC0VHgcUhpG8uiAvcoGFz1
   cO+q4Vh1+ZNYr9VrXvqKE//ymaNEJWOibBlQ74EiC1rgdF1xAGWUXVbXn
   qjxqcknGYs+2wVpLGSs9vQjJ4BTNrbmSCfbm9uDrrcgNOTNP6izYWDK6Z
   mBFDaFSMrDdR5CpmgxU/5jBxAQRCPz3wgY+48HWsQdoE7jkaHw/uKpwLI
   mTzKmt39gGS1FvFLyo5yaKIp9mBKovyBNx/V0W7SWIEqrDbD4Dhl9SFVX
   GRR0j1J+BInid4PAWCfPRCrevahrtRdJ3MwOW39+K8CdFoxwUEWGO3NoS
   g==;
X-CSE-ConnectionGUID: CWgHEjAkSpau/caTY6r2ug==
X-CSE-MsgGUID: sTHJG9T4TFykjK7BJHFEUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="75928593"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
   d="scan'208";a="75928593"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 21:13:49 -0700
X-CSE-ConnectionGUID: ejuFbWkrRQ+M8SxegthXjA==
X-CSE-MsgGUID: Q9er7DqSSLOk2fossR0/+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
   d="scan'208";a="148211596"
Received: from vtg-chrome.bj.intel.com ([172.16.127.120])
  by orviesa003.jf.intel.com with ESMTP; 28 May 2025 21:13:47 -0700
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	stanislaw.gruszka@linux.intel.com
Cc: laurent.pinchart@ideasonboard.com,
	jerry.w.hu@intel.com,
	hao.yao@intel.com,
	tian.shu.qiu@intel.com,
	bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com
Subject: [PATCH v3 7/7] media: staging/ipu7: add Makefile, Kconfig and to-do file for IPU7
Date: Thu, 29 May 2025 12:13:23 +0800
Message-Id: <20250529041323.3026998-8-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250529041323.3026998-1-bingbu.cao@intel.com>
References: <20250529041323.3026998-1-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bingbu Cao <bingbu.cao@intel.com>

Add Kconfig and Makefile for IPU7 driver and also update
the Makefile to build the IPU7 driver.

Also add a to-do file to list the TODOs.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/staging/media/Kconfig       |  2 ++
 drivers/staging/media/Makefile      |  1 +
 drivers/staging/media/ipu7/Kconfig  | 18 ++++++++++++++++++
 drivers/staging/media/ipu7/Makefile | 23 +++++++++++++++++++++++
 drivers/staging/media/ipu7/TODO     | 19 +++++++++++++++++++
 5 files changed, 63 insertions(+)
 create mode 100644 drivers/staging/media/ipu7/Kconfig
 create mode 100644 drivers/staging/media/ipu7/Makefile
 create mode 100644 drivers/staging/media/ipu7/TODO

diff --git a/drivers/staging/media/Kconfig b/drivers/staging/media/Kconfig
index b44214854399..043ffbc472fb 100644
--- a/drivers/staging/media/Kconfig
+++ b/drivers/staging/media/Kconfig
@@ -28,6 +28,8 @@ source "drivers/staging/media/imx/Kconfig"
 
 source "drivers/staging/media/ipu3/Kconfig"
 
+source "drivers/staging/media/ipu7/Kconfig"
+
 source "drivers/staging/media/max96712/Kconfig"
 
 source "drivers/staging/media/meson/vdec/Kconfig"
diff --git a/drivers/staging/media/Makefile b/drivers/staging/media/Makefile
index ad4e9619a9e0..177dfe95289b 100644
--- a/drivers/staging/media/Makefile
+++ b/drivers/staging/media/Makefile
@@ -9,4 +9,5 @@ obj-$(CONFIG_VIDEO_STARFIVE_CAMSS)	+= starfive/
 obj-$(CONFIG_VIDEO_SUNXI)	+= sunxi/
 obj-$(CONFIG_VIDEO_TEGRA)	+= tegra-video/
 obj-$(CONFIG_VIDEO_IPU3_IMGU)	+= ipu3/
+obj-$(CONFIG_VIDEO_INTEL_IPU7)	+= ipu7/
 obj-$(CONFIG_DVB_AV7110)	+= av7110/
diff --git a/drivers/staging/media/ipu7/Kconfig b/drivers/staging/media/ipu7/Kconfig
new file mode 100644
index 000000000000..5b800e9b09c4
--- /dev/null
+++ b/drivers/staging/media/ipu7/Kconfig
@@ -0,0 +1,18 @@
+config VIDEO_INTEL_IPU7
+	tristate "Intel IPU7 driver"
+	depends on ACPI || COMPILE_TEST
+	depends on VIDEO_DEV
+	depends on X86 && HAS_DMA
+	depends on IPU_BRIDGE || !IPU_BRIDGE
+	select AUXILIARY_BUS
+	select IOMMU_IOVA
+	select VIDEO_V4L2_SUBDEV_API
+	select MEDIA_CONTROLLER
+	select VIDEOBUF2_DMA_SG
+	select V4L2_FWNODE
+	help
+	  This is the 7th Gen Intel Image Processing Unit, found in Intel SoCs
+	  and used for capturing images and video from camera sensors.
+
+	  To compile this driver, say Y here! It contains 2 modules -
+	  intel_ipu7 and intel_ipu7_isys.
diff --git a/drivers/staging/media/ipu7/Makefile b/drivers/staging/media/ipu7/Makefile
new file mode 100644
index 000000000000..6d2aec219e65
--- /dev/null
+++ b/drivers/staging/media/ipu7/Makefile
@@ -0,0 +1,23 @@
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (c) 2017 - 2025 Intel Corporation.
+
+intel-ipu7-objs				+= ipu7.o \
+					   ipu7-bus.o \
+					   ipu7-dma.o \
+					   ipu7-mmu.o \
+					   ipu7-buttress.o \
+					   ipu7-cpd.o \
+					   ipu7-syscom.o \
+					   ipu7-boot.o
+
+obj-$(CONFIG_VIDEO_INTEL_IPU7)		+= intel-ipu7.o
+
+intel-ipu7-isys-objs			+= ipu7-isys.o \
+					   ipu7-isys-csi2.o \
+					   ipu7-isys-csi-phy.o \
+					   ipu7-fw-isys.o \
+					   ipu7-isys-video.o \
+					   ipu7-isys-queue.o \
+					   ipu7-isys-subdev.o
+
+obj-$(CONFIG_VIDEO_INTEL_IPU7)		+= intel-ipu7-isys.o
diff --git a/drivers/staging/media/ipu7/TODO b/drivers/staging/media/ipu7/TODO
new file mode 100644
index 000000000000..7031d0179c7d
--- /dev/null
+++ b/drivers/staging/media/ipu7/TODO
@@ -0,0 +1,19 @@
+This is a list of things that need to be done to get this driver out of the
+staging directory.
+
+- ABI headers cleanup
+  Cleanup the firmware ABI headers
+
+- Add metadata capture support
+  The IPU7 hardware should support metadata capture, but it is not
+  fully verified with IPU7 firmware ABI so far, need to add the metadata
+  capture support.
+
+- Refine CSI2 PHY code
+  Refine the ipu7-isys-csi2-phy.c, move the hardware specific variant
+  into structure, clarify and explain the PHY registers to make it more
+  readable.
+
+- Work with the common IPU module
+  Sakari commented much of the driver code is the same than the IPU6 driver.
+  IPU7 driver is expected to work with the common IPU module in future.
-- 
2.34.1


