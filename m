Return-Path: <linux-media+bounces-26546-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E3FA3EDAB
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 08:53:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0C47B7A8330
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 07:52:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1737F1FFC4B;
	Fri, 21 Feb 2025 07:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P11EX27v"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B311FF601
	for <linux-media@vger.kernel.org>; Fri, 21 Feb 2025 07:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740124402; cv=none; b=lN7UWAU9/eNRSTtmRqRW+YAnyvhhiv9MOEIMCCTY1/IT+not+BQIOxB1R9f3smXSTAIlTkYYvPe4qXi63ck1zqhQztIj0l37G6SciKrJPqphHAXiVq9uqiPKaTRKv68gzE//l5Ns8nn9WoXjYeTwc3IOaqfdeN6KbBXDtqGSaF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740124402; c=relaxed/simple;
	bh=2avYamnoDbrXUCQrEUn2ffadQBfifvodEvjm4pM10oU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=t4otAC4KyGAo3jnLGhaXYMU1lg61enJb9LoU2hqJpvgUyQeRc4ci/jgcxAO+GyE4NTlH5pum/wiYHEHhLK1ImNXnsidZ31jVARFceQBkaj83jHP/EY6d7arE4YTtjtQAeASmgmR+3wqQQb6AUh+iH0UOl6cFsLQl7vUR44QYKiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P11EX27v; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740124401; x=1771660401;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2avYamnoDbrXUCQrEUn2ffadQBfifvodEvjm4pM10oU=;
  b=P11EX27vc9bG9O1BPR7ePcMm+oe/mrF2Y6rMKwO4hbDJah9mozsDowrC
   M71CQjzDLaR6MP6RI5vdBRBUASUvx7sZMEnEThFBKDmkulkjNu3odvNM1
   WdO24yF7Jx56MLFH+RglTarEdYHYwXNLpEsluoZ9gq+5ltyLkEBhb0QPk
   QCvT4AXdrwa1ZFB8w9Kfpv+o2YQiPxuVar2RAOxI4aGTjBJ0FiivJOkFX
   a0wR2wVNGqs6XszaT8/bsODyRBPRb/DAuVGTZIn7FQbB6MARrJeqxBzke
   W3hXky7eRBGN9CAuOG7/IMP2iUs6YuaKdBxTc+XSsYCxy0xCRAkt3sG4H
   g==;
X-CSE-ConnectionGUID: J6TduzdrRJ6QaGb3MFyJEQ==
X-CSE-MsgGUID: Ejek0jDARkWSd9ZBWGHTfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="51552561"
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; 
   d="scan'208";a="51552561"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 23:53:20 -0800
X-CSE-ConnectionGUID: AiUCx034RVKSPmOMKa4bbA==
X-CSE-MsgGUID: O5mn9V3HSd29IUtok625ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; 
   d="scan'208";a="115829657"
Received: from vtg-chrome.bj.intel.com ([172.16.127.120])
  by fmviesa010.fm.intel.com with ESMTP; 20 Feb 2025 23:53:17 -0800
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	hdegoede@redhat.com
Cc: hans@hansg.org,
	stanislaw.gruszka@linux.intel.com,
	jerry.w.hu@intel.com,
	tian.shu.qiu@intel.com,
	daxing.li@intel.com,
	hao.yao@intel.com,
	bingbu.cao@linux.intel.com,
	bingbu.cao@intel.com
Subject: [RFC PATCH 7/7] media: ipu7: add Makefile and Kconfig for IPU7
Date: Fri, 21 Feb 2025 15:52:52 +0800
Message-Id: <20250221075252.3347582-8-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250221075252.3347582-1-bingbu.cao@intel.com>
References: <20250221075252.3347582-1-bingbu.cao@intel.com>
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
 drivers/media/pci/intel/Kconfig       |  1 +
 drivers/media/pci/intel/Makefile      |  1 +
 drivers/media/pci/intel/ipu7/Kconfig  | 18 ++++++++++++++++++
 drivers/media/pci/intel/ipu7/Makefile | 23 +++++++++++++++++++++++
 4 files changed, 43 insertions(+)
 create mode 100644 drivers/media/pci/intel/ipu7/Kconfig
 create mode 100644 drivers/media/pci/intel/ipu7/Makefile

diff --git a/drivers/media/pci/intel/Kconfig b/drivers/media/pci/intel/Kconfig
index d9fcddce028b..948cda08fff5 100644
--- a/drivers/media/pci/intel/Kconfig
+++ b/drivers/media/pci/intel/Kconfig
@@ -2,6 +2,7 @@
 
 source "drivers/media/pci/intel/ipu3/Kconfig"
 source "drivers/media/pci/intel/ipu6/Kconfig"
+source "drivers/media/pci/intel/ipu7/Kconfig"
 source "drivers/media/pci/intel/ivsc/Kconfig"
 
 config IPU_BRIDGE
diff --git a/drivers/media/pci/intel/Makefile b/drivers/media/pci/intel/Makefile
index 3a2cc6567159..ff0fea13422d 100644
--- a/drivers/media/pci/intel/Makefile
+++ b/drivers/media/pci/intel/Makefile
@@ -6,3 +6,4 @@ obj-$(CONFIG_IPU_BRIDGE) += ipu-bridge.o
 obj-y	+= ipu3/
 obj-y	+= ivsc/
 obj-$(CONFIG_VIDEO_INTEL_IPU6)	+= ipu6/
+obj-$(CONFIG_VIDEO_INTEL_IPU7)	+= ipu7/
diff --git a/drivers/media/pci/intel/ipu7/Kconfig b/drivers/media/pci/intel/ipu7/Kconfig
new file mode 100644
index 000000000000..b759d5e6c3a9
--- /dev/null
+++ b/drivers/media/pci/intel/ipu7/Kconfig
@@ -0,0 +1,18 @@
+config VIDEO_INTEL_IPU7
+	tristate "Intel IPU7 driver"
+	depends on ACPI || COMPILE_TEST
+	depends on VIDEO_DEV
+	depends on X86 && X86_64 && HAS_DMA
+	depends on IPU_BRIDGE || !IPU_BRIDGE
+	select AUXILIARY_BUS
+	select IOMMU_IOVA
+	select VIDEO_V4L2_SUBDEV_API
+	select MEDIA_CONTROLLER
+	select VIDEOBUF2_DMA_CONTIG
+	select V4L2_FWNODE
+	help
+	  This is the 7th Gen Intel Image Processing Unit, found in Intel SoCs
+	  and used for capturing images and video from camera sensors.
+
+	  To compile this driver, say Y here! It contains 2 modules -
+	  intel_ipu7 and intel_ipu7_isys.
diff --git a/drivers/media/pci/intel/ipu7/Makefile b/drivers/media/pci/intel/ipu7/Makefile
new file mode 100644
index 000000000000..9a15d119026a
--- /dev/null
+++ b/drivers/media/pci/intel/ipu7/Makefile
@@ -0,0 +1,23 @@
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (c) 2017 - 2024 Intel Corporation.
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


