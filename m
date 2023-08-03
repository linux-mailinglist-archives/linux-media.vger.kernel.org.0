Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D31EF76E080
	for <lists+linux-media@lfdr.de>; Thu,  3 Aug 2023 08:47:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232108AbjHCGro (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Aug 2023 02:47:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229848AbjHCGrn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Aug 2023 02:47:43 -0400
Received: from mgamail.intel.com (unknown [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4CEAAC
        for <linux-media@vger.kernel.org>; Wed,  2 Aug 2023 23:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691045262; x=1722581262;
  h=from:to:cc:subject:date:message-id;
  bh=FU1KLEu96IozZzCr4qokoi23RMWxxKTRIBx+qlu5Qsc=;
  b=TZs2LYyZci4udi1UoD+nv25QyFJD+185hzczG0hW1Ar/igENeS3Gouyv
   sWxpSN/qULu8CZ2TdiI8FnCoRb1hfPKLebvSK4QmItvuLlg1NV8fu1w3Q
   WfVZLAt/F+Wa4hPV7c25omG+K4INZ1XzElo1zNfbgH5i27Vt84qIuFoNH
   3k6eaV5hCtfrfQQNhDANBJBm+U+Ja5eLADClrr5Z7doMtsKVzNSXD4hMj
   ahHjOgfk0ZaxpOhY8Kb70MkywwnAP9+58FpTCoxWBu4/dG+MxLvJj9u2O
   ArONmKA+jmeHDpmUVrrzep4LlEBygavUWMHB2Ot8XgwBWk2Ln4Zrr5Rat
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="354699578"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="354699578"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 23:47:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="843456586"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="843456586"
Received: from shsensorbuild2.sh.intel.com ([10.239.134.197])
  by fmsmga002.fm.intel.com with ESMTP; 02 Aug 2023 23:47:40 -0700
From:   Wentong Wu <wentong.wu@intel.com>
To:     sakari.ailus@linux.intel.com, hdegoede@redhat.com,
        bingbu.cao@linux.intel.com, linux-media@vger.kernel.org
Cc:     zhifeng.wang@intel.com, tian.shu.qiu@intel.com,
        Wentong Wu <wentong.wu@intel.com>
Subject: [PATCH v1] media: pci: intel: ivsc: use new v4l2-async API for mei_csi subdev
Date:   Thu,  3 Aug 2023 14:47:37 +0800
Message-Id: <1691045257-22642-1-git-send-email-wentong.wu@intel.com>
X-Mailer: git-send-email 2.7.4
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Follow new v4l2-async API for mei_csi subdev.

Signed-off-by: Wentong Wu <wentong.wu@intel.com>

---
v1:
 - based on https://git.linuxtv.org/sailus/media_tree.git tree

---
 drivers/media/pci/intel/ivsc/mei_csi.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/media/pci/intel/ivsc/mei_csi.c b/drivers/media/pci/intel/ivsc/mei_csi.c
index 264b85b..f720326 100644
--- a/drivers/media/pci/intel/ivsc/mei_csi.c
+++ b/drivers/media/pci/intel/ivsc/mei_csi.c
@@ -571,12 +571,13 @@ static const struct media_entity_operations mei_csi_entity_ops = {
 
 static int mei_csi_notify_bound(struct v4l2_async_notifier *notifier,
 				struct v4l2_subdev *subdev,
-				struct v4l2_async_subdev *asd)
+				struct v4l2_async_connection *asd)
 {
 	struct mei_csi *csi = notifier_to_csi(notifier);
 	int pad;
 
-	pad = media_entity_get_fwnode_pad(&subdev->entity, asd->match.fwnode,
+	pad = media_entity_get_fwnode_pad(&subdev->entity,
+					  subdev->fwnode,
 					  MEDIA_PAD_FL_SOURCE);
 	if (pad < 0)
 		return pad;
@@ -592,7 +593,7 @@ static int mei_csi_notify_bound(struct v4l2_async_notifier *notifier,
 
 static void mei_csi_notify_unbind(struct v4l2_async_notifier *notifier,
 				  struct v4l2_subdev *subdev,
-				  struct v4l2_async_subdev *asd)
+				  struct v4l2_async_connection *asd)
 {
 	struct mei_csi *csi = notifier_to_csi(notifier);
 
@@ -645,7 +646,7 @@ static int mei_csi_parse_firmware(struct mei_csi *csi)
 		.bus_type = V4L2_MBUS_CSI2_DPHY,
 	};
 	struct device *dev = &csi->cldev->dev;
-	struct v4l2_async_subdev *asd;
+	struct v4l2_async_connection *asd;
 	struct fwnode_handle *fwnode;
 	struct fwnode_handle *ep;
 	int ret;
@@ -666,11 +667,11 @@ static int mei_csi_parse_firmware(struct mei_csi *csi)
 	fwnode = fwnode_graph_get_remote_endpoint(ep);
 	fwnode_handle_put(ep);
 
-	v4l2_async_nf_init(&csi->notifier);
+	v4l2_async_subdev_nf_init(&csi->notifier, &csi->subdev);
 	csi->notifier.ops = &mei_csi_notify_ops;
 
 	asd = v4l2_async_nf_add_fwnode(&csi->notifier, fwnode,
-				       struct v4l2_async_subdev);
+				       struct v4l2_async_connection);
 	if (IS_ERR(asd)) {
 		fwnode_handle_put(fwnode);
 		return PTR_ERR(asd);
@@ -682,7 +683,7 @@ static int mei_csi_parse_firmware(struct mei_csi *csi)
 		return ret;
 	csi->nr_of_lanes = v4l2_ep.bus.mipi_csi2.num_data_lanes;
 
-	ret = v4l2_async_subdev_nf_register(&csi->subdev, &csi->notifier);
+	ret = v4l2_async_nf_register(&csi->notifier);
 	if (ret)
 		v4l2_async_nf_cleanup(&csi->notifier);
 
-- 
2.7.4

