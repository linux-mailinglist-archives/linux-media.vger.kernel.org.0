Return-Path: <linux-media+bounces-9601-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD48C8A753C
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 22:11:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CA9A1F22859
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 20:11:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5B02139D19;
	Tue, 16 Apr 2024 20:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tzh+e9Ti"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E40B139CF1
	for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 20:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713298280; cv=none; b=j2HN40sCstDt0HpIM1U9gCxhhlWRe0aah1nL4LmE46ZvvVz+aVe9s6ikzNRxbTLC52SbEFhXvFtUDGy1rg7BatHIFInEIzUnMIs6tRskdCBA4FFwTk/7QH8VbYR7MGX83uSY518Zw8GmeYisz17iQp3Gr7q77H9lhSdO02hSR0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713298280; c=relaxed/simple;
	bh=4uwE+YahhI32AP6XO39lorr49C4/BuQLRgHT1FBG2FE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gobgu1YPyxPmHYfU35Kl5xb7bGk1QIjYrO/79Qa0SlTrxG4KSm0GrX9nbZ2DAnlngEHpChk3DQxnkypGIUxDJF0Bjd50L3Mp5TlnW84zhXHlX5fim325/Nqrju5jXQqa27zBvXor5mVF3fruLKpusllR0LxbOnQZ7rQCOC/c9Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tzh+e9Ti; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713298280; x=1744834280;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4uwE+YahhI32AP6XO39lorr49C4/BuQLRgHT1FBG2FE=;
  b=Tzh+e9Tiyn9Ye8NHTCsv/CvB+7+lBwlGaskNnCMgSDb/qbWfmVPFV+wF
   u2fqCZ4yY4Vx9Nz8gOO6peIwCKB2SSb5YRrNYIjUNTpjLzU3w6WvBQ00j
   5JaaI/XwZOTj6YhE4K7ekREvvB6afndbU7HysyjAgFK1a4t5KMQAEBeLV
   PvnVEQ9OvPopqwuVt7e4vLQqDehNUiYGzhCVDZMU7KZ0LSg8bimMuPRb3
   Wf4l0B+A3Cz94wFIedJEOCDlXoEjlAekT1GksZaT6G1lY+jSn4zuFns0O
   xORaInIDjpUwqFfCt5k3vr5yEKE8UhZiaLz++RobGRYsFH0MpjfFSd509
   A==;
X-CSE-ConnectionGUID: t8ar8A4MTxq2qHxOdXxlIw==
X-CSE-MsgGUID: Q1GJNi+XQImjup9PNxL/oQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8626635"
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; 
   d="scan'208";a="8626635"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 13:11:19 -0700
X-CSE-ConnectionGUID: n0fOEPvURl29jYFbQWsPgQ==
X-CSE-MsgGUID: JkUv77RBSKCm6n51aTU2Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; 
   d="scan'208";a="27172263"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 13:11:14 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 9CF071204F9;
	Tue, 16 Apr 2024 23:11:10 +0300 (EEST)
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
Subject: [PATCH v4 02/19] media: ivsc: csi: Use IPU bridge
Date: Tue, 16 Apr 2024 23:10:48 +0300
Message-Id: <20240416201105.781496-3-sakari.ailus@linux.intel.com>
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

Use IPU bridge to instantiate software nodes for IPU6 related devices. If
the IPU6 device is probed before the MEI CSI device is created, neither
will probe unless there are further devices probed successfully which
triggers re-probe of both IPU6 and MEI CSI.

This patch ensures the necessary software nodes are in place when the MEI
CSI driver is probed.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ivsc/mei_csi.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/intel/ivsc/mei_csi.c b/drivers/media/pci/intel/ivsc/mei_csi.c
index 55e0c60c420c..89b582a221ab 100644
--- a/drivers/media/pci/intel/ivsc/mei_csi.c
+++ b/drivers/media/pci/intel/ivsc/mei_csi.c
@@ -19,12 +19,15 @@
 #include <linux/mei_cl_bus.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/pci.h>
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
 #include <linux/units.h>
 #include <linux/uuid.h>
 #include <linux/workqueue.h>
 
+#include <media/ipu-bridge.h>
+#include <media/ipu6-pci-table.h>
 #include <media/v4l2-async.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-fwnode.h>
@@ -661,11 +664,23 @@ static int mei_csi_probe(struct mei_cl_device *cldev,
 			 const struct mei_cl_device_id *id)
 {
 	struct device *dev = &cldev->dev;
+	struct pci_dev *ipu;
 	struct mei_csi *csi;
+	unsigned int i;
 	int ret;
 
-	if (!dev_fwnode(dev))
-		return -EPROBE_DEFER;
+	for (i = 0, ipu = NULL; !ipu && ipu6_pci_tbl[i].vendor; i++)
+		ipu = pci_get_device(ipu6_pci_tbl[i].vendor,
+				     ipu6_pci_tbl[i].device, NULL);
+
+	if (!ipu)
+		return -ENODEV;
+
+	ret = ipu_bridge_init(&ipu->dev, ipu_bridge_parse_ssdb);
+	if (ret < 0)
+		return ret;
+	if (WARN_ON(!dev_fwnode(dev)))
+		return -ENXIO;
 
 	csi = devm_kzalloc(dev, sizeof(struct mei_csi), GFP_KERNEL);
 	if (!csi)
@@ -784,6 +799,7 @@ static struct mei_cl_driver mei_csi_driver = {
 
 module_mei_cl_driver(mei_csi_driver);
 
+MODULE_IMPORT_NS(INTEL_IPU_BRIDGE);
 MODULE_AUTHOR("Wentong Wu <wentong.wu@intel.com>");
 MODULE_AUTHOR("Zhifeng Wang <zhifeng.wang@intel.com>");
 MODULE_DESCRIPTION("Device driver for IVSC CSI");
-- 
2.39.2


