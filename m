Return-Path: <linux-media+bounces-5069-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C4185315F
	for <lists+linux-media@lfdr.de>; Tue, 13 Feb 2024 14:08:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 754D21F24874
	for <lists+linux-media@lfdr.de>; Tue, 13 Feb 2024 13:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D640E51C35;
	Tue, 13 Feb 2024 13:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y5KlwIg4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A392D50A83
	for <linux-media@vger.kernel.org>; Tue, 13 Feb 2024 13:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707829715; cv=none; b=T2wYYTr+OOpzVlcGwBB8Fdftft7i1pwlkUIWHl9WNrojZo8/3TAMrNsFX0RuYXYH2HaFs4Iz23pQrz/UJiVMnuxybol1TYSgHywkJ5vrxw0uFF18Qw5PmxLdkAbKY6pcADnj4ptu1RRjFBe39Byxl7IFHxtIRmLpWwR/Ll6fXnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707829715; c=relaxed/simple;
	bh=IFKGi5sIDa/R7CytUtDFXXP4bC8QD9mJHKMZFwnaFUQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IP4XYJYjz1lbA/dwWpxkBdxNvoVdNcOu0Uql67Y1nL8DeFDDlRWLriI/XI3Dx4ne6rPntWWNNRo3/Ff9AWCWtzre3gb6wQW3OHJW3604QUe7I6ppPIhbCREqS0/x/dqNe1uitoZxHvVa1Xcm634Q88a/VD6FgDmGKqUtClDYzsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y5KlwIg4; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707829713; x=1739365713;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IFKGi5sIDa/R7CytUtDFXXP4bC8QD9mJHKMZFwnaFUQ=;
  b=Y5KlwIg4atks5oWCl1btCBuE2hm6BFtN1NeU2ZZrYHtx/u1LMv8QcHcr
   fuNeD9pJ2uwcWOqTaVo1THTEZ7m05unk4ffTAHPQ8p+yHx5FAepLsZnSu
   0HlMu7J8QB/bVcou/rv88YDEChmcPvPQEUQlwNxZICLaKJ/ChoW1Jh69/
   QixhjmWkW9ZSuyvB91sD4nYYAs2QPCm8WoggMtVqMLxdmJdBYZLeZiPlx
   MZXfNrcyvanBMGSg90OOS4o4JC37hanfCDJixwCCqrX1gU9SPz64bwZ0u
   KAmqxsLmWOrQPewKzQ5wZNDqu5JLfD9EYmiNmximrZjTdIhiqHYn8t2C7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1739945"
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="1739945"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 05:08:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="26061691"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 05:08:20 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id C05DE11F871;
	Tue, 13 Feb 2024 15:08:17 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH v2 2/4] media: ipu-bridge: Move graph checking to IPU bridge
Date: Tue, 13 Feb 2024 15:08:13 +0200
Message-Id: <20240213130815.382792-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240213130815.382792-1-sakari.ailus@linux.intel.com>
References: <20240213130815.382792-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move checking the graph to the IPU bridge. This way the caller won't need
to do it.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu-bridge.c     | 20 ++++++++++++++++
 drivers/media/pci/intel/ipu3/ipu3-cio2.c | 30 +++---------------------
 2 files changed, 23 insertions(+), 27 deletions(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index b2cf80d62ba2..735c62c37c22 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -2,6 +2,7 @@
 /* Author: Dan Scally <djrscally@gmail.com> */
 
 #include <linux/acpi.h>
+#include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/i2c.h>
 #include <linux/mei_cl_bus.h>
@@ -749,6 +750,22 @@ static int ipu_bridge_ivsc_is_ready(void)
 	return ready;
 }
 
+static int ipu_bridge_check_fwnode_graph(struct fwnode_handle *fwnode)
+{
+	struct fwnode_handle *endpoint;
+
+	if (IS_ERR_OR_NULL(fwnode))
+		return -EINVAL;
+
+	endpoint = fwnode_graph_get_next_endpoint(fwnode, NULL);
+	if (endpoint) {
+		fwnode_handle_put(endpoint);
+		return 0;
+	}
+
+	return ipu_bridge_check_fwnode_graph(fwnode->secondary);
+}
+
 int ipu_bridge_init(struct device *dev,
 		    ipu_parse_sensor_fwnode_t parse_sensor_fwnode)
 {
@@ -757,6 +774,9 @@ int ipu_bridge_init(struct device *dev,
 	unsigned int i;
 	int ret;
 
+	if (!ipu_bridge_check_fwnode_graph(dev_fwnode(dev)))
+		return 0;
+
 	if (!ipu_bridge_ivsc_is_ready())
 		return -EPROBE_DEFER;
 
diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
index 83e29c56fe33..df6a9308559a 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
@@ -1667,22 +1667,6 @@ static void cio2_queues_exit(struct cio2_device *cio2)
 		cio2_queue_exit(cio2, &cio2->queue[i]);
 }
 
-static int cio2_check_fwnode_graph(struct fwnode_handle *fwnode)
-{
-	struct fwnode_handle *endpoint;
-
-	if (IS_ERR_OR_NULL(fwnode))
-		return -EINVAL;
-
-	endpoint = fwnode_graph_get_next_endpoint(fwnode, NULL);
-	if (endpoint) {
-		fwnode_handle_put(endpoint);
-		return 0;
-	}
-
-	return cio2_check_fwnode_graph(fwnode->secondary);
-}
-
 /**************** PCI interface ****************/
 
 static int cio2_pci_probe(struct pci_dev *pci_dev,
@@ -1698,17 +1682,9 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
 	 * if the device has no endpoints then we can try to build those as
 	 * software_nodes parsed from SSDB.
 	 */
-	r = cio2_check_fwnode_graph(fwnode);
-	if (r) {
-		if (fwnode && !IS_ERR_OR_NULL(fwnode->secondary)) {
-			dev_err(dev, "fwnode graph has no endpoints connected\n");
-			return -EINVAL;
-		}
-
-		r = ipu_bridge_init(dev, ipu_bridge_parse_ssdb);
-		if (r)
-			return r;
-	}
+	r = ipu_bridge_init(dev, ipu_bridge_parse_ssdb);
+	if (r)
+		return r;
 
 	cio2 = devm_kzalloc(dev, sizeof(*cio2), GFP_KERNEL);
 	if (!cio2)
-- 
2.39.2


