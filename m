Return-Path: <linux-media+bounces-33499-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FE7AC635C
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 09:52:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A11C87AC066
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 07:50:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCAAC2459CF;
	Wed, 28 May 2025 07:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ON6UoVbA"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979D324469C
	for <linux-media@vger.kernel.org>; Wed, 28 May 2025 07:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748418714; cv=none; b=cE/jwPiQ/5lScB06IU/Hx/l8Fxbyt5gSm59J1FR44V+JKurvXmJ8FdtppvXBnuRerHbW6xz8ULMWmu0ArTeoPMHziHMN+0U99dzXLL822Mbv8Xat2pdXe1HkchmTkzS4BCCthjmBzs3LVvdHwGlz9LUwskIjt6ARlqwRtrDRjEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748418714; c=relaxed/simple;
	bh=f29/uTJE+miJ+pg9JsdQXrs6jMbxhuasCTJS9C7oUtE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=X38s7bFiqRbmnjqOjpdAh6MdY6ebXfZ2ptOK1cEakVE79TkzJcUmGvQAmNbLws5QV68rhaqkIaJBIGhwofjvIKf05i92RvKhnMm90eQ6C8FBXc6n1oSxvE8CyWvS4fVcdR8Q5hPmfL3QvFLUNGUvo3enkPHpKGRZOjP/DtFOIpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ON6UoVbA; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748418713; x=1779954713;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=f29/uTJE+miJ+pg9JsdQXrs6jMbxhuasCTJS9C7oUtE=;
  b=ON6UoVbAqNkNI5AX/50hwbSzUThsgsOmfLfb427F+Ru6sNRhfYwbJ/lj
   Nr4Q1o6jAIq7cuYYXv4ciFRMUVzC5ub0GFfcmkXrN/J7h1R+TpfcEkmD8
   mt6I7GIBacUaG6UuU4XXi7Rih8CdfjxpTYwiGJYbf/WCJyiCtmfG8kfcC
   hR6BiU445p8TIbRR9Y+p924e/dLb2OroMTIv4TRQUqFZlFfaPGPx2K2Wl
   97m5bWvn+ZN5LszN9Z+PNX4kRTijI7YhMTpXfwSlZUh5y4ZTEsoBWTjq1
   JefdhXmFf+BkUxNXWr9t5cS0gfrK2PHZ3vtT/Jqf1t63TRnNtWkNqzESO
   w==;
X-CSE-ConnectionGUID: ijckBJV/S3qyj0kFx0ctDA==
X-CSE-MsgGUID: Nuu4kRS8R1SSBofy3Kyasg==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="61092583"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="61092583"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 00:51:52 -0700
X-CSE-ConnectionGUID: UkXcAizpRdW97o12nyh9tQ==
X-CSE-MsgGUID: TLl+E64YSE2Z0cp9xJsyOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="144132660"
Received: from vtg-chrome.bj.intel.com ([172.16.127.120])
  by fmviesa009.fm.intel.com with ESMTP; 28 May 2025 00:51:49 -0700
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
Subject: [PATCH v2 1/8] media: Rename the IPU PCI device table header and add IPU7 PCI IDs
Date: Wed, 28 May 2025 15:51:39 +0800
Message-Id: <20250528075146.1763079-2-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250528075146.1763079-1-bingbu.cao@intel.com>
References: <20250528075146.1763079-1-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bingbu Cao <bingbu.cao@intel.com>

Rename the IPU PCI device table header file and add the IPU7 PCI device
IDs.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6.c                |  2 +-
 drivers/media/pci/intel/ivsc/mei_csi.c             |  2 +-
 .../media/{ipu6-pci-table.h => ipu-pci-table.h}    | 14 +++++++++++---
 3 files changed, 13 insertions(+), 5 deletions(-)
 rename include/media/{ipu6-pci-table.h => ipu-pci-table.h} (68%)

diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
index 277af7cda8ee..aa859220ba94 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.c
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -21,7 +21,7 @@
 #include <linux/types.h>
 
 #include <media/ipu-bridge.h>
-#include <media/ipu6-pci-table.h>
+#include <media/ipu-pci-table.h>
 
 #include "ipu6.h"
 #include "ipu6-bus.h"
diff --git a/drivers/media/pci/intel/ivsc/mei_csi.c b/drivers/media/pci/intel/ivsc/mei_csi.c
index 92d871a378ba..47fc48c7619b 100644
--- a/drivers/media/pci/intel/ivsc/mei_csi.c
+++ b/drivers/media/pci/intel/ivsc/mei_csi.c
@@ -27,7 +27,7 @@
 #include <linux/workqueue.h>
 
 #include <media/ipu-bridge.h>
-#include <media/ipu6-pci-table.h>
+#include <media/ipu-pci-table.h>
 #include <media/v4l2-async.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-fwnode.h>
diff --git a/include/media/ipu6-pci-table.h b/include/media/ipu-pci-table.h
similarity index 68%
rename from include/media/ipu6-pci-table.h
rename to include/media/ipu-pci-table.h
index 0899d9d2f978..528080c6f742 100644
--- a/include/media/ipu6-pci-table.h
+++ b/include/media/ipu-pci-table.h
@@ -3,8 +3,8 @@
  * Copyright (C) 2024 Intel Corporation
  */
 
-#ifndef __IPU6_PCI_TBL_H__
-#define __IPU6_PCI_TBL_H__
+#ifndef __IPU_PCI_TBL_H__
+#define __IPU_PCI_TBL_H__
 
 #include <linux/pci.h>
 
@@ -15,6 +15,9 @@
 #define PCI_DEVICE_ID_INTEL_IPU6EP_RPLP		0xa75d
 #define PCI_DEVICE_ID_INTEL_IPU6EP_MTL		0x7d19
 
+#define PCI_DEVICE_ID_INTEL_IPU7_PCI_ID		0x645d
+#define PCI_DEVICE_ID_INTEL_IPU7P5_PCI_ID	0xb05d
+
 static const struct pci_device_id ipu6_pci_tbl[] = {
 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU6) },
 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU6SE) },
@@ -25,4 +28,9 @@ static const struct pci_device_id ipu6_pci_tbl[] = {
 	{ }
 };
 
-#endif /* __IPU6_PCI_TBL_H__ */
+static const struct pci_device_id ipu7_pci_tbl[] = {
+	{PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU7_PCI_ID)},
+	{PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU7P5_PCI_ID)},
+	{ }
+};
+#endif /* __IPU_PCI_TBL_H__ */
-- 
2.34.1


