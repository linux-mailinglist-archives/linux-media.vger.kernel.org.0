Return-Path: <linux-media+bounces-5118-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B2B8544DD
	for <lists+linux-media@lfdr.de>; Wed, 14 Feb 2024 10:18:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 049EB1F29F4D
	for <lists+linux-media@lfdr.de>; Wed, 14 Feb 2024 09:18:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9542F125DD;
	Wed, 14 Feb 2024 09:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YO8iG1Lk"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7C611CB1
	for <linux-media@vger.kernel.org>; Wed, 14 Feb 2024 09:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707902293; cv=none; b=CHAmKWvzLD1pkrMlkeM53S1S0HdlKJW8W5CXrx8ZOUnjV0AhWDTTMe/su17ebYstu0limXi9JpifdB9l3wNTEcx8W7tWQcmp+HZrCwsTKI4NqgFD0ASF8hcOlLMRlSgzt0KKsbXygKJZUiwreO+ziChTfErXRadNjZtFWQH6k4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707902293; c=relaxed/simple;
	bh=KvMGG0kB9pqr2p4BYVbUwIPfJ1m/0Jfv3Pq8WhIcHuI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uqdjrNrF+m8mksEFhYBeSvT11c3mOXhUNACwvsObU4/h/vZSHROMccwKugZkono9CqGHDwYhAT3ImxmXgVzZ9Jkqy3tg7Av5OhreSD22BCVHV2NL3ZjEWXDBzhk+pIwO1CAWxNQacapds88cG0UyEtx99i3sqLbjuJKoQGP8GqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YO8iG1Lk; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707902290; x=1739438290;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KvMGG0kB9pqr2p4BYVbUwIPfJ1m/0Jfv3Pq8WhIcHuI=;
  b=YO8iG1LkBG/vcm8Av6iOaIaRgL19q21Ua2usXJzTQTeumH/tKgaw3BWW
   Ip8Z+9nyN36ZM6Zy6aU9cP0hn/z//oixIOmUfLouo3RZY3UIDFwoGgpzg
   CbDsGc0j0SEVfC1vUXuba9+iY362fUFpaJikRxdRUgMF2C5BCgx53gYef
   CCm69ay1bmMNV3yKQy9KR7uXp24ByYPQV0vw5cTn+HGuY36A+a+sWNKjj
   tcmVkOPp8cQ3OnY14GB+iHRDMOJmM5ZRrGD+xoiJ7+U9cURMe+WTy1QaN
   9zDndzuKGWV+R71sKKOCDH+waIyhYhWLsgHNziKWfm6W3fdq2wlluxZFJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="2301711"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="2301711"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2024 01:18:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="935605009"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="935605009"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2024 01:18:03 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E87A31202AA;
	Wed, 14 Feb 2024 11:17:55 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH v3 2/5] media: ipu-bridge: Move graph checking to IPU bridge
Date: Wed, 14 Feb 2024 11:17:51 +0200
Message-Id: <20240214091754.399340-3-sakari.ailus@linux.intel.com>
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

Move checking the graph to the IPU bridge. This way the caller won't need
to do it.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu-bridge.c     | 20 +++++++++++++++
 drivers/media/pci/intel/ipu3/ipu3-cio2.c | 31 +++---------------------
 2 files changed, 23 insertions(+), 28 deletions(-)

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
index 83e29c56fe33..c42adc5a408d 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
@@ -1667,29 +1667,12 @@ static void cio2_queues_exit(struct cio2_device *cio2)
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
 			  const struct pci_device_id *id)
 {
 	struct device *dev = &pci_dev->dev;
-	struct fwnode_handle *fwnode = dev_fwnode(dev);
 	struct cio2_device *cio2;
 	int r;
 
@@ -1698,17 +1681,9 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
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


