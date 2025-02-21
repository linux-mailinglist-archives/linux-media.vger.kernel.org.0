Return-Path: <linux-media+bounces-26540-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 555C7A3EDA4
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 08:53:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9678B188A185
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 07:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CD4A1FF611;
	Fri, 21 Feb 2025 07:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DAKWmwih"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA231F94D
	for <linux-media@vger.kernel.org>; Fri, 21 Feb 2025 07:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740124385; cv=none; b=Rxccx/GxDL9z1h2MT+VRDWXpiO5eLGthzc2ZPqb+RPHMYCyI0DI2gSz1dYcocYfTxWyDaz/ai1Zl4NT+99a0DNrh0mhUAW7iPngUah9QZXydQWZpFuzo4qAMjH/JNLWBFBbq00DkrgQDJh4ZMhduer7YzbjnoHyMWOrNqpFjuLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740124385; c=relaxed/simple;
	bh=TkzLw+UNXMs8pOV0+WiNJnAt7Ht0meCkhO7ng2+Lpog=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NKYwDVnDPMJ5YblXxmcp6Rk5LXsBDLSva1Oz8wNKFt+WlrLhgNSuPcuT9xGCERctxctiv2EZ/LMA0HhURd90H5HwScbxxFhv1+7afKDippLMhusbgTCfu5rnRNxBw+5zK1YgsbRJACl+md1/34v8JjzThhaUnyY6gZv2LIJiByw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DAKWmwih; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740124384; x=1771660384;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TkzLw+UNXMs8pOV0+WiNJnAt7Ht0meCkhO7ng2+Lpog=;
  b=DAKWmwihewYwPkYhK88ET61W2AZBv9GxAtpkPWFi5tePEdywMOjSQ7WQ
   FLc1lvCFNnHvsdg6OSu/JPWroqzKUdjrJiTQC7RGx9GOXD8YbeHXwt3p6
   6RMBH1NvhydBL5RIQ0/zRXi7rlxKdauR/YkQIAtxf5ThDHMGkQl7IVons
   51F6Z4nTt6NGzahIXpwcE9E9xlK0uv0YacAcx7GcnHuPI12Agw28onYsW
   yZYHNx99bDy7U6Dq+udlqF3Rqfgt17PJ2w3QIpIiZcLL/eiKdWCohhH4A
   lNmJqClXK2zZgMsLC50ki7X3PW+itsi9v1Y2cmgKV1y77dnVwNHcfqX+c
   g==;
X-CSE-ConnectionGUID: xVsnMXA8TW+Frn32SAXu1A==
X-CSE-MsgGUID: Kw7v0EQ5Qai60ZaSlaDAVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="51552511"
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; 
   d="scan'208";a="51552511"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 23:52:59 -0800
X-CSE-ConnectionGUID: RkgLaTygTV6EHqieUpGO4A==
X-CSE-MsgGUID: s9RBlYNrRtKYMfT9jzWzgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; 
   d="scan'208";a="115829627"
Received: from vtg-chrome.bj.intel.com ([172.16.127.120])
  by fmviesa010.fm.intel.com with ESMTP; 20 Feb 2025 23:52:56 -0800
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
Subject: [RFC PATCH 1/7] media: Rename the IPU PCI device table header and add IPU7 PCI IDs
Date: Fri, 21 Feb 2025 15:52:46 +0800
Message-Id: <20250221075252.3347582-2-bingbu.cao@intel.com>
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
index 6a893c4547b2..b21b02e2d93c 100644
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


