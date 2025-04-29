Return-Path: <linux-media+bounces-31245-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA40AA0092
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 05:31:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 710AA3A66BD
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 03:30:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F58F270ECD;
	Tue, 29 Apr 2025 03:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="goUomeYk"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8E7270EB8
	for <linux-media@vger.kernel.org>; Tue, 29 Apr 2025 03:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745897330; cv=none; b=nMnJFxJ4LppEJFc08TV5KsTo0RPdXIyBUeeL0aukIh2EA0bm4s4PjJMHbWzoA3Cwh7KL3XHFVZ1lkg5M4iOfOENVVAhSgaFUvKTP0CGPeTyBBDXEmk2oaQXstLVh6rcCJg1Y+mNfXN5kmB6+G5wyJrC3F6juzzVT9AjPvaoq7kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745897330; c=relaxed/simple;
	bh=HzlOskoIHJLwVjRm0TRpTXXhzuG7lZ3d5VI2ra3xmhI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MhpnZt5Jah2Xj+v64fTyjkRlLOsjkaCNBvUcF7xBOeSzDXj9ECPE/vDovFhPwN1l0qFEY88kmh5gYnu+84feByEuWsdbNxrMUKIeLmhv3PyDeGVi1q+eoqjMlSNk+CoJ5oW+fYqX0ab0R/3nszfxg7FSC0Y3GaEUA/hhNiPUOf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=goUomeYk; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745897328; x=1777433328;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HzlOskoIHJLwVjRm0TRpTXXhzuG7lZ3d5VI2ra3xmhI=;
  b=goUomeYk3y61HVxtQaeKTAXkaJC7j8tedRoFBnFL+2gk26Edf9vxq3qJ
   TNoiNQbmNRrXIdTAPH8FZASJMm0IlBdMXUfXHRddpoXsaxiCuhw3FIAZ3
   0oZduTiWSlQgBCe8LWz3duW14y7MzeOMg/hYid5O3Ur3lgTDICsUmenu0
   rany2BqFIqSjdkN7Ot6JSlLBfRRCjEu8D8xhsMvLFfhVvtE5frXC04A1V
   50SwPWazRXGMsLy9x4DD4AmGF2DXhTLACLcZOFSNUU3VGbUkRrf5w70VN
   Sh8sKeBLs13wFs/fUlVx4SB9UIgBK3ykQ7B/JthqQJc262zfhXrXEcfOx
   g==;
X-CSE-ConnectionGUID: D0ulnOiGTLSbPXo+ONFyRg==
X-CSE-MsgGUID: YLj6AQz2TfaDMicy5iJAmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="58158588"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="58158588"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 20:28:48 -0700
X-CSE-ConnectionGUID: kVe+8dI2Rp26CD+zbi/L9A==
X-CSE-MsgGUID: mxpxCzFDQbKkrieGi4ejyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="138791596"
Received: from vtg-chrome.bj.intel.com ([172.16.127.120])
  by fmviesa004.fm.intel.com with ESMTP; 28 Apr 2025 20:28:45 -0700
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
Subject: [PATCH 1/8] media: Rename the IPU PCI device table header and add IPU7 PCI IDs
Date: Tue, 29 Apr 2025 11:28:34 +0800
Message-Id: <20250429032841.115107-2-bingbu.cao@intel.com>
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

Rename the IPU PCI device table header file and add the IPU7 PCI device
IDs.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6.c                |  2 +-
 .../media/{ipu6-pci-table.h => ipu-pci-table.h}    | 14 +++++++++++---
 2 files changed, 12 insertions(+), 4 deletions(-)
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


