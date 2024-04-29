Return-Path: <linux-media+bounces-10292-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B61AE8B512F
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 08:19:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EDA00B21E27
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 06:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D84A010A3F;
	Mon, 29 Apr 2024 06:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TIZARA/e"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1EF10A25
	for <linux-media@vger.kernel.org>; Mon, 29 Apr 2024 06:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714371547; cv=none; b=ZkOcjy+ymDxBeErzxEPPGlBDEZw0MaSVyynQ3/nm9N+y9OLFIWMfQulVVxfa7kHAi7ERmIllGg7wrtu6tfF5t4xloXI3Y/XT4FDQWndKR1pGV9p1FSOHLO6CxgOnoR6AaFmOj5S+E9PAIxPy6Zil35KV2aFfzTubsMOknjbXBMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714371547; c=relaxed/simple;
	bh=4uwE+YahhI32AP6XO39lorr49C4/BuQLRgHT1FBG2FE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=q0HLmYrFDGL65J+YM4Cjxviyp8+SOfq8SI4kwzBf41Oy/SyMbsNKL8rrcXyjKuBFQaIYC658kw34yiM8EEMXxucNxYkGEOOAJ4+pakNVc+0amBgzXO1/Gf/P1gKnXa0N7/yM4h+FtvLIlvTazMdyxmPofUq0gATeJM0vKYqtUOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TIZARA/e; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714371546; x=1745907546;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4uwE+YahhI32AP6XO39lorr49C4/BuQLRgHT1FBG2FE=;
  b=TIZARA/ect2FuRME9qdUQpLuFXB40LEPupCvn7PFtkLKLYGPi9REcCJE
   JMTk2fuefc4gRbNqM1PLYPI0m4SJw2+hdjhjb0URVrEc0ex7gM3qgNPcG
   1t1A8mMY+mV5/NlKZiRfai6noh/VwOmpQH5XsWKVJM9ZToIz5zqD7vpje
   hjsDpCyWij7KDr850uCsReFUsud5Sk3ZD96jvD7+ckOURqrSqFcgMz/kf
   dYxBBCLPJhTXpe1aAh51o6em1OyCiZyKLGkf/X/UJQkuqJSVddmgW2QzW
   DZ64y5gKTs1XiQ8oQCvX13RO9cWbm564Swyx7BpdW5RndDeBnxbCvjAa1
   A==;
X-CSE-ConnectionGUID: NeIcrEoYSYGnfVnu2qBlyA==
X-CSE-MsgGUID: veTQSKa7S8+mWhMTTeHmfA==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="10187333"
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; 
   d="scan'208";a="10187333"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 23:19:06 -0700
X-CSE-ConnectionGUID: D8lRMu91SOiyuGIlBovOSg==
X-CSE-MsgGUID: eTxlVxGARbGXOSF3XI4/Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; 
   d="scan'208";a="26527287"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 23:19:01 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id C7172120234;
	Mon, 29 Apr 2024 09:18:57 +0300 (EEST)
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
Subject: [PATCH v7 02/18] media: ivsc: csi: Use IPU bridge
Date: Mon, 29 Apr 2024 09:18:37 +0300
Message-Id: <20240429061853.983538-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240429061853.983538-1-sakari.ailus@linux.intel.com>
References: <20240429061853.983538-1-sakari.ailus@linux.intel.com>
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


