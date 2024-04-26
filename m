Return-Path: <linux-media+bounces-10196-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DEE8B34AD
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 11:58:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C460284373
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 09:58:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A9271422AE;
	Fri, 26 Apr 2024 09:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ApmUWjPI"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F8C14039A
	for <linux-media@vger.kernel.org>; Fri, 26 Apr 2024 09:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714125519; cv=none; b=ujdTwPCJ1aAoHTa+KZLUKFuoFWgVjUA8lxDpoTm6AoDihpe7Dc3nIE6fyTVyfTAQfw1aJ/RluCge1ktAD0qyafazesy3GwdEnLYbtG5H3D4cd22+aaVScEIqBUnkZvrdEmo9aJ76RIrFa4chnyxBq/VnViHbFUkdr/A91dG/Ico=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714125519; c=relaxed/simple;
	bh=4uwE+YahhI32AP6XO39lorr49C4/BuQLRgHT1FBG2FE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KPNkbMoRs9xY3kJh/DV3TBtebHN2oMh4hl+jBEii9y9of8saRZ0349uey5YIgBGnC9jfRIM9VkaOqpjpnwIMTyJkI61oCp8HVFV9fcOaA5RDmuOMS/67RvbUQg2uN7WrIgKBuyRkLjBGdajEVFyuYrTDIdRPyvIhqtiQ6DGdfSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ApmUWjPI; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714125518; x=1745661518;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4uwE+YahhI32AP6XO39lorr49C4/BuQLRgHT1FBG2FE=;
  b=ApmUWjPIJZvlDwRZrSdiEIrfU64mm6fj3H9MDksQFw8/dPjacfJkKAaW
   R8RqcqpalcgCYpwNsIvj4JparptHeu4CtwUAdsUNpBJHRFG9FirgqoA2w
   A1K1/N+Zqe9CP1mU3ppJOVDGQQj7k8CCndKWIkGMXBKXG7VRzCytL8OEr
   7dqom+YTcxYFV9XJPVWm0EyXsM87is3Eg9aDDrtjb7dN1t7kke2l3nEil
   b7/WY2oe9ji5gmi8j8q4V/e8piivo3sR3Hn6qD96sv5S5GCSP1oReC77d
   4QDmky3eF9ng0PWPt/rXUSHuUs+XO3bbFxNkzIdHgk+X7hL+4xb5+x8mE
   Q==;
X-CSE-ConnectionGUID: wIao6DtFSRm4AYR0nkly9A==
X-CSE-MsgGUID: EerNPk9fQYWAparzL0SC0Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9722803"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="9722803"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 02:58:34 -0700
X-CSE-ConnectionGUID: DumNw/dDTVyqSP+OtcIReA==
X-CSE-MsgGUID: H5C8qMi9QKOLy5UH39MGpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="56303341"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 02:58:31 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 71BA6120358;
	Fri, 26 Apr 2024 12:58:27 +0300 (EEST)
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
Subject: [PATCH v6 02/18] media: ivsc: csi: Use IPU bridge
Date: Fri, 26 Apr 2024 12:58:06 +0300
Message-Id: <20240426095822.946453-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240426095822.946453-1-sakari.ailus@linux.intel.com>
References: <20240426095822.946453-1-sakari.ailus@linux.intel.com>
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


