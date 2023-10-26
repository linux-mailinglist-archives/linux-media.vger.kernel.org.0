Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 225037D7E2A
	for <lists+linux-media@lfdr.de>; Thu, 26 Oct 2023 10:13:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344502AbjJZIN7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Oct 2023 04:13:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344532AbjJZINz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Oct 2023 04:13:55 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07461198
        for <linux-media@vger.kernel.org>; Thu, 26 Oct 2023 01:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698308034; x=1729844034;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fnbEorG/+xU/61eDBv7EgvddkE/K7koZv2WwGYZWPDo=;
  b=VZbRMK3GxNINhl7405bzVROAJ3MYj/eWl67HrwtO5k5MzQsr8vQfO/mn
   EEwM5JSlVRAD53u9lD3l3FLfuKOfCjNxo7b9Cm5/QdbzgeMfyxUgXw4xe
   0Hy/nDhirzEO9nl+UCyQDJl8mjNhaidEyu9WEHlSh1WkgfZJ2Hq4qO/0x
   mkn/rKRj8jppaRLad1Sxn4g3tD8akheVT6qG/Gjgt2JpM/nAHs43ubyhH
   rW2XlG3O6QXbLrRq+vaiQE+uPbim1+77O7kCjxs7RHSDwnCpEpxCf0VXm
   2wrIELOX8lpnM9YUFFvK/gkOOp2blb5qTq7Wwp9pCK8AxT2kEU3O7JjHa
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="372530604"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="372530604"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 01:13:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="829539044"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="829539044"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 01:13:51 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 7EED11202BB;
        Thu, 26 Oct 2023 11:13:48 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     wentong.wu@intel.com, bingbu.cao@intel.com
Subject: [PATCH 3/6] media: ivsc: csi: Clean up notifier set-up
Date:   Thu, 26 Oct 2023 11:13:43 +0300
Message-Id: <20231026081346.958238-4-sakari.ailus@linux.intel.com>
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

Use v4l2_async_nf_add_fwnode_remote() to add an async fwnode remote
sub-device sub-device to the notifier. This avoids dealing with remote
endpoints.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Tested-by: Wentong Wu <wentong.wu@intel.com>
---
 drivers/media/pci/intel/ivsc/mei_csi.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/media/pci/intel/ivsc/mei_csi.c b/drivers/media/pci/intel/ivsc/mei_csi.c
index 281d7f5e18f9..cd0dcbbb35df 100644
--- a/drivers/media/pci/intel/ivsc/mei_csi.c
+++ b/drivers/media/pci/intel/ivsc/mei_csi.c
@@ -645,7 +645,6 @@ static int mei_csi_parse_firmware(struct mei_csi *csi)
 	};
 	struct device *dev = &csi->cldev->dev;
 	struct v4l2_async_connection *asd;
-	struct fwnode_handle *fwnode;
 	struct fwnode_handle *ep;
 	int ret;
 
@@ -664,15 +663,12 @@ static int mei_csi_parse_firmware(struct mei_csi *csi)
 
 	csi->nr_of_lanes = v4l2_ep.bus.mipi_csi2.num_data_lanes;
 
-	fwnode = fwnode_graph_get_remote_endpoint(ep);
-	fwnode_handle_put(ep);
-
 	v4l2_async_subdev_nf_init(&csi->notifier, &csi->subdev);
 	csi->notifier.ops = &mei_csi_notify_ops;
 
-	asd = v4l2_async_nf_add_fwnode(&csi->notifier, fwnode,
-				       struct v4l2_async_connection);
-	fwnode_handle_put(fwnode);
+	asd = v4l2_async_nf_add_fwnode_remote(&csi->notifier, ep,
+					      struct v4l2_async_connection);
+	fwnode_handle_put(ep);
 	if (IS_ERR(asd)) {
 		ret = PTR_ERR(asd);
 		goto out_nf_cleanup;
-- 
2.39.2

