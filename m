Return-Path: <linux-media+bounces-5121-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF708544E0
	for <lists+linux-media@lfdr.de>; Wed, 14 Feb 2024 10:18:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F16D91C21597
	for <lists+linux-media@lfdr.de>; Wed, 14 Feb 2024 09:18:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67C5112B98;
	Wed, 14 Feb 2024 09:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UCXkKkE6"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A9710A35
	for <linux-media@vger.kernel.org>; Wed, 14 Feb 2024 09:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707902294; cv=none; b=tAnszx6++d4stN6sCVOXi6DdUwV9cV5DD8q2aclINDnLagrvDQuEDYdMUjHQl8Evc36ti0JVfsQxSlbSAKOF2SyS1sHlLs6MzaNQnhtnXWY4tTSenvwNSN18fWo2FlEdwKwrCkJuQgeCKvFENpIEOyPp8OxdFTcNb2ukAKGY7aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707902294; c=relaxed/simple;
	bh=GhQ4v9FKklhnme+bSakScBV6O1udJH7XQ5qP4SPESvE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ApSC6gt3GkyBUioHpchzDDJO5ZfSBU68mM2gAUxKWV+VmME1Qtdh3gG/bnkYWAhypPh4E22zxpq1DkNIw8ZZ6auVCpDFRmyu0AlAdEpWPy39PbW4AcN/xvms5IYfts18rjSsYhSC+02ZTh2E+LDK+WbYFTi0axz5ZhQ+gGhaVYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UCXkKkE6; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707902292; x=1739438292;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GhQ4v9FKklhnme+bSakScBV6O1udJH7XQ5qP4SPESvE=;
  b=UCXkKkE6hKlT/74EBDnlza+LAIcfKu9HA9u9fRAixpO8AfEYS1rKi/0A
   4GvlCdxC2feTjO4jGW36Nhh2CyMd1hEoB/zK/ggBsOGhlklHUtIH4vdng
   NAUDYVNI002p1VFrsb2wtOV0zYZRG8XPg3fa7b8IDqCYUlUsuQaLMOj1k
   cV27M/GNdXOSfeNo9MgSfkRsbHL+yxovZA3GC2lzNEp2oVnOvVEMomZad
   sehMUhSNsgu4K0ecLaoxc1e/75GQN0zq2q9MMHiZAkVGu+Nzkg6B7eufZ
   K3fCuqdTAYrceM7/QKUxjDeepP4q6Ur8xeqxB9fvGQvVaKQGF8s4WNYyk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="2301724"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="2301724"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2024 01:18:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="935605021"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="935605021"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2024 01:18:07 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B45F212055E;
	Wed, 14 Feb 2024 11:17:57 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH v3 5/5] media: ivsc: csi: Use IPU bridge
Date: Wed, 14 Feb 2024 11:17:54 +0200
Message-Id: <20240214091754.399340-6-sakari.ailus@linux.intel.com>
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
index 15b905f66ab7..b3f39c9a60d2 100644
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
@@ -716,11 +719,23 @@ static int mei_csi_probe(struct mei_cl_device *cldev,
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
@@ -841,6 +856,7 @@ static struct mei_cl_driver mei_csi_driver = {
 
 module_mei_cl_driver(mei_csi_driver);
 
+MODULE_IMPORT_NS(INTEL_IPU_BRIDGE);
 MODULE_AUTHOR("Wentong Wu <wentong.wu@intel.com>");
 MODULE_AUTHOR("Zhifeng Wang <zhifeng.wang@intel.com>");
 MODULE_DESCRIPTION("Device driver for IVSC CSI");
-- 
2.39.2


