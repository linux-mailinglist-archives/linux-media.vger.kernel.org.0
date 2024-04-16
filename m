Return-Path: <linux-media+bounces-9613-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AD68A754C
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 22:12:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C26F7B215F6
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 20:12:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8660A13AA46;
	Tue, 16 Apr 2024 20:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mvwt1D0u"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5CD13A3EF
	for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 20:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713298307; cv=none; b=K2RJJtIdOtICMfuf1LIVDJlrVmETIYu/sA+47FHEMF0vdCX89opJJbXViTCX2c3wDVEgHp+el41fX3+inqDCXI1CHF00+LjETOI8K7Ha12hVxb9Myv6mkC+WtsJ5jfUNy2qYOOypEH78gqKnfMnt8hIMJh9pQPhksjr3X2vv0Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713298307; c=relaxed/simple;
	bh=N9QkzTXOaObLE7gqdCc/IhpVlpq5JGAbs9Dxu+PSmls=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KO1a+ngW6A0Pk7DjY2cvBptFA+Vv5VhTEGqjj1Ro+GiSpByWN7dvJuKpwogmRTact8xzewlCkT+tijpKkbST6SGHp8AcxrT5IortefA8YOAXc8BjTGD06h7Fp6n+qPk4fIrCZLLO8QHGXIKqKdycE8q+mp4h1prjakMAmlRhd5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mvwt1D0u; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713298305; x=1744834305;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=N9QkzTXOaObLE7gqdCc/IhpVlpq5JGAbs9Dxu+PSmls=;
  b=mvwt1D0uenUlmszlg+reRfYpTftZb/4H64rp3SMb2rqM43UvhBjZXwZ+
   MOx4iiCFec45BZ7PGIrOObXcQuAjxoFLliLbVNP0d4PjtqS8/Ie9IvL4P
   RNc3tfMO5xMuqrRUbsDf6Y5VpKwsZkDWr4KkG6TwSoewqN4lJ9FGZeRPw
   BoOYIdswRNXYXRXTtfagWPKF2vFcSai1xE30KXxAfL/TGTba8sJDABqfk
   texyME9Otod6OPko4CLB5XKenc6b2sp2oPr5SFWZj39fbdm/Ijm5i7ccx
   OHF7hZRmbmmphUddo9py61RHj+oSRzLSadOMfZezQ+QYlGfU/reHtM8IK
   Q==;
X-CSE-ConnectionGUID: VRGKNkSOTeGFuctDi5VuMw==
X-CSE-MsgGUID: iXKDix9JTBOcjVUkTmWYOw==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="12601131"
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; 
   d="scan'208";a="12601131"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 13:11:45 -0700
X-CSE-ConnectionGUID: QBmsY2nkRfKDlacqWmqHNQ==
X-CSE-MsgGUID: LDTK26gmTIWrWo5zFe2xwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; 
   d="scan'208";a="22778990"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 13:11:41 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 3EAE11204F6;
	Tue, 16 Apr 2024 23:11:37 +0300 (EEST)
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
Subject: [PATCH v4 14/19] media: intel/ipu6: add Kconfig and Makefile
Date: Tue, 16 Apr 2024 23:11:00 +0300
Message-Id: <20240416201105.781496-15-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240416201105.781496-1-sakari.ailus@linux.intel.com>
References: <20240416201105.781496-1-sakari.ailus@linux.intel.com>
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
index 000000000000..93c5012a74d2
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/Kconfig
@@ -0,0 +1,17 @@
+config VIDEO_INTEL_IPU6
+	tristate "Intel IPU6 driver"
+	depends on ACPI || COMPILE_TEST
+	depends on VIDEO_DEV
+	depends on X86 && X86_64 && HAS_DMA
+	select DMA_OPS
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
2.39.2


