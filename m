Return-Path: <linux-media+bounces-10141-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 239DB8B2B45
	for <lists+linux-media@lfdr.de>; Thu, 25 Apr 2024 23:48:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 559581C20E61
	for <lists+linux-media@lfdr.de>; Thu, 25 Apr 2024 21:48:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD72D15573A;
	Thu, 25 Apr 2024 21:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MHDHNVC5"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A5D155A2A
	for <linux-media@vger.kernel.org>; Thu, 25 Apr 2024 21:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714081703; cv=none; b=QkDsCxXUway8Cx3cjSmv6C+GPzG6bt5QHMOKRh9WyzJ/heapVTYRx/KkLgwV0kOjoUC5jDDlFjTau/mGGT9tZ4nhnpooonxKK+WedRUsbFzCHURb4G7N80nJNpdWcaY3mydoYJuMvBm15lTYpTimaCDBpGqz/k6EcfpaLiQFPdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714081703; c=relaxed/simple;
	bh=4uwE+YahhI32AP6XO39lorr49C4/BuQLRgHT1FBG2FE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CeQAuHwr+UZQJEopOJi06/Ojq78vbZv2Uo+KV9UM3t9kHJzyYAzhSYhD8Bhn+I2BOeGq8EALqNOndzWu5bgHp9Ux6rXR5nHSgqakUyxx/m0TD/TwIwfJ0+LU5+P8nQJfPF4XvLBbT4a6YqRKKv+Tx7BDBfYnhrXoWjSRD9QzIR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MHDHNVC5; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714081702; x=1745617702;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4uwE+YahhI32AP6XO39lorr49C4/BuQLRgHT1FBG2FE=;
  b=MHDHNVC5pofs6odI807x/VEqt5k25y7SuiqpnANJa67nQJYtoKjlzvVT
   kLLybkq2phzcTuLh6keBVrVRs24iS2DbUdl5W1VYi1cQnfdPzwg3Qen2F
   owpT0/KObUQD1+SOBmM92M/iH6LAj865Rs7YIDT2t6BICU2cH8HkfpiO1
   JcmcHRGGg0vNKLBYJLQoLnLzZAZt0AuifbUUwCszzc1sswHR5YBVCxVLK
   bpK4rzbhTcePx9IPkh7gcpJmysI0btfDy2x59IQ2hLRwMXw2wgrmfxf87
   NXo8mtwaqxYEQA3o3T/ffbEcFB6320hOeWvEtIPG7X1un9DgUVGuS3+J7
   g==;
X-CSE-ConnectionGUID: ohwFRizkRPeL/oj54RqQ0g==
X-CSE-MsgGUID: Ssnmw0iZReW8dCNXDtRXfQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9655159"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="9655159"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 14:48:21 -0700
X-CSE-ConnectionGUID: yy+VnKt1Sfqo2MI+5eBdYA==
X-CSE-MsgGUID: VJ2FTIjwTZWQCW6TCkqXxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="25181800"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 14:48:18 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 5146A1203E8;
	Fri, 26 Apr 2024 00:48:14 +0300 (EEST)
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
Subject: [PATCH v5 02/18] media: ivsc: csi: Use IPU bridge
Date: Fri, 26 Apr 2024 00:47:53 +0300
Message-Id: <20240425214809.930227-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240425214809.930227-1-sakari.ailus@linux.intel.com>
References: <20240425214809.930227-1-sakari.ailus@linux.intel.com>
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


