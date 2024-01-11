Return-Path: <linux-media+bounces-3506-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B724C82A7D4
	for <lists+linux-media@lfdr.de>; Thu, 11 Jan 2024 07:47:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54B671F222A0
	for <lists+linux-media@lfdr.de>; Thu, 11 Jan 2024 06:47:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 091E153BA;
	Thu, 11 Jan 2024 06:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X1alZuaK"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DB246B1
	for <linux-media@vger.kernel.org>; Thu, 11 Jan 2024 06:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704955617; x=1736491617;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=F2f3hj6aDddqT26y6BHT1FNdXCfzqnB6v5EFrU1rW6M=;
  b=X1alZuaKcyuEd0hDwo6JbcguuZoZvzjJ/tyCyBMFVv94QQxBta7HVy4r
   2eWrRwofPZ1g2la5vyT7yNAv2CUpiL8H/D3SIy1dY9kj9PuFJO8QwoJve
   N79NTlO9S364t9Vtr20UyecNNdQy+wuOER/6e46EQR+XmjOTOZRtg/AWS
   z9F/O9qjfI+fVffWjKbo/MnJlgN3pLP9Ko98hwncH6kkL1K2oRfEUdFs/
   zRYq/KZwSmulFDkyxfwe6CMWKGvQc2nQuf6IA4oNUbvJedkHrsc+poYiS
   bHMOok1ljDZWOTw3HWK783nKKv6dueaR6eO8E1lxYi9/Tctm5z5KUZnRU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="397629190"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; 
   d="scan'208";a="397629190"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2024 22:46:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="775515650"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; 
   d="scan'208";a="775515650"
Received: from icg-kernel3.bj.intel.com ([172.16.126.107])
  by orsmga007.jf.intel.com with ESMTP; 10 Jan 2024 22:46:52 -0800
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	andriy.shevchenko@linux.intel.com,
	hdegoede@redhat.com
Cc: ilpo.jarvinen@linux.intel.com,
	claus.stovgaard@gmail.com,
	tomi.valkeinen@ideasonboard.com,
	tfiga@chromium.org,
	senozhatsky@chromium.org,
	andreaskleist@gmail.com,
	bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	hongju.wang@intel.com
Subject: [PATCH v3 12/17] media: add Kconfig and Makefile for IPU6
Date: Thu, 11 Jan 2024 14:55:26 +0800
Message-ID: <20240111065531.2418836-13-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240111065531.2418836-1-bingbu.cao@intel.com>
References: <20240111065531.2418836-1-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bingbu Cao <bingbu.cao@intel.com>

Add IPU6 support in Kconfig and Makefile, with this patch you can
build the Intel IPU6 and input system modules by select the
CONFIG_VIDEO_INTEL_IPU6 in config.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
Signed-off-by: Andreas Helbech Kleist <andreaskleist@gmail.com>
---
 drivers/media/pci/intel/Kconfig       |  1 +
 drivers/media/pci/intel/Makefile      |  1 +
 drivers/media/pci/intel/ipu6/Kconfig  | 17 +++++++++++++++++
 drivers/media/pci/intel/ipu6/Makefile | 23 +++++++++++++++++++++++
 4 files changed, 42 insertions(+)
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
index 000000000000..5cb4f3c2d59f
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/Kconfig
@@ -0,0 +1,17 @@
+config VIDEO_INTEL_IPU6
+	tristate "Intel IPU6 driver"
+	depends on ACPI || COMPILE_TEST
+	depends on MEDIA_SUPPORT
+	depends on MEDIA_PCI_SUPPORT
+	depends on X86 && X86_64
+	select IOMMU_IOVA
+	select VIDEO_V4L2_SUBDEV_API
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
2.42.0


