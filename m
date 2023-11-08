Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6CA87E525C
	for <lists+linux-media@lfdr.de>; Wed,  8 Nov 2023 10:06:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235423AbjKHJGE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Nov 2023 04:06:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235217AbjKHJGD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Nov 2023 04:06:03 -0500
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4141410A
        for <linux-media@vger.kernel.org>; Wed,  8 Nov 2023 01:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699434361; x=1730970361;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xgat2n4QB1naFJSiL+Wo0VWYXmHRZLnsLgITISbIyI4=;
  b=Ss2AkZeLa9D3XsNWH1a0+Nt2unugu68oITL6WZ2L/yFbdoQpkM/OqAZT
   agOMFd33aI+EHzkcRUzxBGyLFtRr8dYqMg59eoAeI9kBoJyxJP3yQKPVH
   feuGKRue68x19aiq6x7fjF8IZmbuEE0P+lQ8bw6kcs+ZIJ9k4xDLBeQyQ
   dpv3zUWj23SDmrn/zcMzFwl7/i/ur8HoEbNwJsuPEPKIkdIOnq+E5FIHW
   Rnv/T4xeNPuj6YZnB7kP9qAhgLqj9j+8o+v1hphpJr6+4Ypz2A30BMWy6
   FzAUikUsPtrqq11XwB2n50usMscyKG0I+HzLtIRXo03YLlcgMHSJxW60X
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="374766948"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="374766948"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2023 01:06:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="886611492"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="886611492"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2023 01:05:59 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 4054C11F82E;
        Wed,  8 Nov 2023 11:05:56 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1r0eVP-001oTR-1h;
        Wed, 08 Nov 2023 11:05:47 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     wentong.wu@intel.com, bingbu.cao@intel.com
Subject: [PATCH v2 6/6] media: ivsc: csi: Check number of lanes on source, too
Date:   Wed,  8 Nov 2023 11:05:37 +0200
Message-Id: <20231108090537.432341-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231026081346.958238-7-sakari.ailus@linux.intel.com>
References: <20231026081346.958238-7-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The IVSC has two CSI-2 ports, one receiver and one transmitter, for
passing through the CSI-2 image data. Both have the same number of lanes
and this information should be also present in firmware. Check this.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Tested-by: Wentong Wu <wentong.wu@intel.com>
---
since v1:

- Set returned error codes correctly.

- Put taken references in error handling (lane number check).

 drivers/media/pci/intel/ivsc/mei_csi.c | 40 ++++++++++++++++++++------
 1 file changed, 31 insertions(+), 9 deletions(-)

diff --git a/drivers/media/pci/intel/ivsc/mei_csi.c b/drivers/media/pci/intel/ivsc/mei_csi.c
index 3f507d0170f9..2ca52390541d 100644
--- a/drivers/media/pci/intel/ivsc/mei_csi.c
+++ b/drivers/media/pci/intel/ivsc/mei_csi.c
@@ -645,27 +645,49 @@ static int mei_csi_parse_firmware(struct mei_csi *csi)
 	};
 	struct device *dev = &csi->cldev->dev;
 	struct v4l2_async_connection *asd;
-	struct fwnode_handle *ep;
+	struct fwnode_handle *sink_ep, *source_ep;
 	int ret;
 
-	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0, 0);
-	if (!ep) {
-		dev_err(dev, "not connected to subdevice\n");
+	sink_ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0, 0);
+	if (!sink_ep) {
+		dev_err(dev, "can't obtain sink endpoint\n");
 		return -EINVAL;
 	}
 
 	v4l2_async_subdev_nf_init(&csi->notifier, &csi->subdev);
 	csi->notifier.ops = &mei_csi_notify_ops;
 
-	ret = v4l2_fwnode_endpoint_parse(ep, &v4l2_ep);
+	ret = v4l2_fwnode_endpoint_parse(sink_ep, &v4l2_ep);
 	if (ret) {
-		dev_err(dev, "could not parse v4l2 endpoint\n");
+		dev_err(dev, "could not parse v4l2 sink endpoint\n");
 		goto out_nf_cleanup;
 	}
 
 	csi->nr_of_lanes = v4l2_ep.bus.mipi_csi2.num_data_lanes;
 
-	asd = v4l2_async_nf_add_fwnode_remote(&csi->notifier, ep,
+	source_ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 1, 0, 0);
+	if (!source_ep) {
+		ret = -ENOTCONN;
+		dev_err(dev, "can't obtain source endpoint\n");
+		goto out_nf_cleanup;
+	}
+
+	ret = v4l2_fwnode_endpoint_parse(source_ep, &v4l2_ep);
+	fwnode_handle_put(source_ep);
+	if (ret) {
+		dev_err(dev, "could not parse v4l2 source endpoint\n");
+		goto out_nf_cleanup;
+	}
+
+	if (csi->nr_of_lanes != v4l2_ep.bus.mipi_csi2.num_data_lanes) {
+		ret = -EINVAL;
+		dev_err(dev,
+			"the number of lanes does not match (%u vs. %u)\n",
+			csi->nr_of_lanes, v4l2_ep.bus.mipi_csi2.num_data_lanes);
+		goto out_nf_cleanup;
+	}
+
+	asd = v4l2_async_nf_add_fwnode_remote(&csi->notifier, sink_ep,
 					      struct v4l2_async_connection);
 	if (IS_ERR(asd)) {
 		ret = PTR_ERR(asd);
@@ -676,13 +698,13 @@ static int mei_csi_parse_firmware(struct mei_csi *csi)
 	if (ret)
 		goto out_nf_cleanup;
 
-	fwnode_handle_put(ep);
+	fwnode_handle_put(sink_ep);
 
 	return 0;
 
 out_nf_cleanup:
 	v4l2_async_nf_cleanup(&csi->notifier);
-	fwnode_handle_put(ep);
+	fwnode_handle_put(sink_ep);
 
 	return ret;
 }
-- 
2.39.2

