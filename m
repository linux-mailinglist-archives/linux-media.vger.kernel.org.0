Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF9137D7E2C
	for <lists+linux-media@lfdr.de>; Thu, 26 Oct 2023 10:14:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344511AbjJZIOB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Oct 2023 04:14:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344479AbjJZIN5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Oct 2023 04:13:57 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8253CE
        for <linux-media@vger.kernel.org>; Thu, 26 Oct 2023 01:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698308035; x=1729844035;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=czV4o5JPVxUr5fT18s7d8RG407lZTaD0tG5xfIjAMfI=;
  b=cIM7ZaJNoQtfAVLB3NVG5yzJ/GfN1odzeQAoo6jL3YOjBpVpPeeLWI+3
   eaca2X0fysjPNjIrV5nBES8PQmOyocsn5t8/vLthdxdfHcdYzwkmm1ddl
   0lQZSj7xmXsdBtg04nHI59KO3wRXHIxubagtyYpnJ8SCd/7zWBI3Ym6V+
   8jaS5z4+5fhSoQKT3ae/7iku1viDduY4TS8VeZSPK6mTanA7MjrhGCE1R
   Uvhtn8lSJKSSCq1BVsE17LNSO6CXXi1Ts8WGsba4AIrKsfIEupurnJvSa
   jibCIB+9nzQymsmJky2VFJnR0TOWqF34lFOet9vFTEibHe3cyHkSOECPx
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="372530624"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="372530624"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 01:13:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="829539095"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="829539095"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 01:13:53 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 7DC1F120F14;
        Thu, 26 Oct 2023 11:13:50 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     wentong.wu@intel.com, bingbu.cao@intel.com
Subject: [PATCH 6/6] media: ivsc: csi: Check number of lanes on source, too
Date:   Thu, 26 Oct 2023 11:13:46 +0300
Message-Id: <20231026081346.958238-7-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231026081346.958238-1-sakari.ailus@linux.intel.com>
References: <20231026081346.958238-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The IVSC has two CSI-2 ports, one receiver and one transmitter, for
passing through the CSI-2 image data. Both have the same number of lanes
and this information should be also present in firmware. Check this.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Tested-by: Wentong Wu <wentong.wu@intel.com>
---
 drivers/media/pci/intel/ivsc/mei_csi.c | 38 ++++++++++++++++++++------
 1 file changed, 29 insertions(+), 9 deletions(-)

diff --git a/drivers/media/pci/intel/ivsc/mei_csi.c b/drivers/media/pci/intel/ivsc/mei_csi.c
index 07d8c7f82306..99f2e312a1df 100644
--- a/drivers/media/pci/intel/ivsc/mei_csi.c
+++ b/drivers/media/pci/intel/ivsc/mei_csi.c
@@ -645,27 +645,47 @@ static int mei_csi_parse_firmware(struct mei_csi *csi)
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
+		dev_err(dev, "can't obtain source endpoint\n");
+		return -EINVAL;
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
@@ -676,13 +696,13 @@ static int mei_csi_parse_firmware(struct mei_csi *csi)
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

