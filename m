Return-Path: <linux-media+bounces-31250-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DC7AA008F
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 05:31:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D5EC175CB3
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 03:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 437792741CB;
	Tue, 29 Apr 2025 03:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HNhr1pAT"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6F026B081
	for <linux-media@vger.kernel.org>; Tue, 29 Apr 2025 03:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745897356; cv=none; b=aAf62CtE+h0GxwElga/BCf1+k3+4f5mfndgasfaEWD89xZk4lMbIPiaElosqQ/Vcdl19xAGiMpFu6TGxFuKzahfopOP5CYR3+6VyllbkwjPskm8r1JejKjhuZnPr+fo681NXojrXyIVBNfFcLgBd6VgxRyPTAuczpjVDKF8rTtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745897356; c=relaxed/simple;
	bh=jN9p4ghniaijj+Irp4dwPqlZ5TGM+Ef2AR/Ady12hds=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I5OjrH9wTRt+DdgBw7hF/r6TSupEsBlpZu/r/Vh5O7u90icVwGvoOZVVBJNgsI+nI3YvZIFBe8IHNhWs0f64CX39Z/K+veoo30sCvQUw7vs7VFd3V9mAKCaibcIvNYcngvUoVEA1yK4H7OHRlTrXlDl6zD2sWw0z3bnYNufupkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HNhr1pAT; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745897355; x=1777433355;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jN9p4ghniaijj+Irp4dwPqlZ5TGM+Ef2AR/Ady12hds=;
  b=HNhr1pAT4rJHIFWXJJur0EbyQzcrM8PoNQpsvorMeSt6eDL9+fqqNo2/
   K9PZ7hzNWwn8PiRqe/M/lfG+tZg475NGZpZj6B3yrTxW+VLe/kx3f/xjE
   CgA9IjEjf7QQdmWQu7rWSkyqlLCdQRHxusIstOrUL0rjDparuLU8M2SfW
   zOiMul5IAfmkocNP+dpj+SY5Uiytx306rsgmQpFtToUlX3v0JF9+GIUFz
   fy4yRxDsUAVO1lqkV6Mw3hTuu9IGJ0xTdS0kpj1sw3cwPmrPbs0qsln14
   GM5fk52HVSEa8vFAGWCPtd76x2aLiRhMpYZBlc9tw7Wlwe8+trXBOqosm
   g==;
X-CSE-ConnectionGUID: xtu+FL2tRCOF+UZwlD2umw==
X-CSE-MsgGUID: F2ETi/HXS5mjy+YXf5c7uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="58158640"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="58158640"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 20:29:14 -0700
X-CSE-ConnectionGUID: veBHPp+0ReuJTh0QlD7X4g==
X-CSE-MsgGUID: 4wizkV0gSfe03F+1IbWpng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="138791764"
Received: from vtg-chrome.bj.intel.com ([172.16.127.120])
  by fmviesa004.fm.intel.com with ESMTP; 28 Apr 2025 20:29:11 -0700
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	stanislaw.gruszka@linux.intel.com
Cc: laurent.pinchart@ideasonboard.com,
	phasta@mailbox.org,
	helgaas@kernel.org,
	jerry.w.hu@intel.com,
	hao.yao@intel.com,
	tian.shu.qiu@intel.com,
	bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com
Subject: [PATCH 7/8] media: staging/ipu7: add Makefile and Kconfig for IPU7
Date: Tue, 29 Apr 2025 11:28:40 +0800
Message-Id: <20250429032841.115107-8-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250429032841.115107-1-bingbu.cao@intel.com>
References: <20250429032841.115107-1-bingbu.cao@intel.com>
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

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/staging/media/Kconfig       |  2 ++
 drivers/staging/media/Makefile      |  1 +
 drivers/staging/media/ipu7/Kconfig  | 18 ++++++++++++++++++
 drivers/staging/media/ipu7/Makefile | 23 +++++++++++++++++++++++
 4 files changed, 44 insertions(+)
 create mode 100644 drivers/staging/media/ipu7/Kconfig
 create mode 100644 drivers/staging/media/ipu7/Makefile

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
-- 
2.34.1


