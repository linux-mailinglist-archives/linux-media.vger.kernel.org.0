Return-Path: <linux-media+bounces-5119-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0C68544DE
	for <lists+linux-media@lfdr.de>; Wed, 14 Feb 2024 10:18:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C9E81F2A079
	for <lists+linux-media@lfdr.de>; Wed, 14 Feb 2024 09:18:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 672BE12B6D;
	Wed, 14 Feb 2024 09:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bv4/JSM1"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF43125AD
	for <linux-media@vger.kernel.org>; Wed, 14 Feb 2024 09:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707902293; cv=none; b=M0MYONb/Rg2QrRkZRDrY5+Z1BG9xWBT/pA55fwH3mjBr7La2iW3Y3nNLqIxrnont5mEZzEHo0C21F29Y6COHYil5xs8bLJjERcf/l+ajvDSVuKicAA5GdeZDv4AMFhJamTyWYryNzPLKHQEKRU7rm3cUzOK2sT9zOUjxmKu83ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707902293; c=relaxed/simple;
	bh=BHyynvrMazyltXmlk9qK/qV+rORusvUP2HcyTkdl310=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nu95/rTRnEzFn/DJlStJqP94q3th9PBYGLjn35tRZJctjovvkbUtLfEOje1U6rEVDbkmycscz0QH5YaC81Tbvdu3PjataBspf9LfOog8l6XyYIuXI93xSWzu55GZ1+kuHbkuW3ckVfgke+O9FJEIK6VnS6RLmfj5xPicpmT7RyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bv4/JSM1; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707902291; x=1739438291;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BHyynvrMazyltXmlk9qK/qV+rORusvUP2HcyTkdl310=;
  b=Bv4/JSM1PeIX90dZAgbsz7i8+x4TCtqj563+t3m4nPqo9qdf5I05FmKZ
   p1nVj1EIE43FOVgw75g8JTp6X4PunrT/nQUs2kQ8ImHu0ox5dJT7bxoKF
   ShVTgsAmEF4ljLKAeSCCONSlUQ6jT9+NJ//EimPgtb5oxfdgPxMq6/M5/
   61BanYy/YgT7LwiK9TUSN+JgQlrFEHJmKhKjXLFcrwsGPhtMaNRlIC9N+
   q35SADlnO0CQ2vQ3eTK+H2diOTQzcZZXiuh/52aNtAM/4OmyZ+7MJBFs5
   kmdZArE6VWh7s6THs/F7KGAGNynNp/SFz87mRMW5IZDHR8n7nIWJpKamo
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="2301720"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="2301720"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2024 01:18:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="935605015"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="935605015"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2024 01:18:04 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 2A08B1204FB;
	Wed, 14 Feb 2024 11:17:57 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH v3 4/5] media: ipu6: Add PCI device table header
Date: Wed, 14 Feb 2024 11:17:53 +0200
Message-Id: <20240214091754.399340-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240214091754.399340-1-sakari.ailus@linux.intel.com>
References: <20240214091754.399340-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a header for the PCI device table of all IPU6 devices. This will be
used by the IPU bridge as well so place the table in a header.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 include/media/ipu6-pci-table.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 include/media/ipu6-pci-table.h

diff --git a/include/media/ipu6-pci-table.h b/include/media/ipu6-pci-table.h
new file mode 100644
index 000000000000..40208785398a
--- /dev/null
+++ b/include/media/ipu6-pci-table.h
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2024 Intel Corporation
+ */
+
+#ifndef __IPU6_PCI_TBL_H__
+#define __IPU6_PCI_TBL_H__
+
+#include <linux/pci.h>
+
+#define PCI_DEVICE_ID_INTEL_IPU6		0x9a19
+#define PCI_DEVICE_ID_INTEL_IPU6SE		0x4e19
+#define PCI_DEVICE_ID_INTEL_IPU6EP_ADLP		0x465d
+#define PCI_DEVICE_ID_INTEL_IPU6EP_ADLN		0x462e
+#define PCI_DEVICE_ID_INTEL_IPU6EP_RPLP		0xa75d
+#define PCI_DEVICE_ID_INTEL_IPU6EP_MTL		0x7d19
+
+static const struct pci_device_id ipu6_pci_tbl[] = {
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU6) },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU6SE) },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU6EP_ADLP) },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU6EP_ADLN) },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU6EP_RPLP) },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU6EP_MTL) },
+	{ }
+};
+
+#endif /* __IPU6_PCI_TBL_H__ */
-- 
2.39.2


