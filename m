Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1CF27D7E29
	for <lists+linux-media@lfdr.de>; Thu, 26 Oct 2023 10:13:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344475AbjJZIN7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Oct 2023 04:13:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344531AbjJZINz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Oct 2023 04:13:55 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2928C182
        for <linux-media@vger.kernel.org>; Thu, 26 Oct 2023 01:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698308034; x=1729844034;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/IlwYqokZg2+HeuK4aRjzzBMO2gmFSGlpgYwhbzzl4E=;
  b=PuiKBp4Jn5aXfncYTeup8TGqdmO8P3blp/kO1dGYX2uVpZS8y31ep56L
   ZfaRfbYVx5vv/ODnkq9e2UJkcioqwi35L4qlojTpP4t0sQvfSetLRJFIh
   MaZadAUxrzTqTXUmrfRo1sX7M0fPSq3Y7Lmi5FvdFKGUif2Pd07VUYucZ
   FT3u592hiHrX4PF95I77HnnJQHiYFR7MU7PearA4zVbiHCVILQ6b+ZUp1
   FU34rXxreZHh+C8n3XUACGNqmvQtaOXhG/8s/Wa0npdbVpNr3f6RuvF+3
   UyFZD9PF91+glu3aeiIF2BBm5JDDETH8IPZ1HsHJLDXB6kpOTO/TALspn
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="372530611"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="372530611"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 01:13:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="829539062"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="829539062"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 01:13:51 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 2043B120A90;
        Thu, 26 Oct 2023 11:13:49 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     wentong.wu@intel.com, bingbu.cao@intel.com
Subject: [PATCH 4/6] media: ivsc: csi: Clean up parsing firmware and setting up async notifier
Date:   Thu, 26 Oct 2023 11:13:44 +0300
Message-Id: <20231026081346.958238-5-sakari.ailus@linux.intel.com>
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

Set up async notifier right after obtaining the local endpoint. This makes
error handling straightforward.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Tested-by: Wentong Wu <wentong.wu@intel.com>
---
 drivers/media/pci/intel/ivsc/mei_csi.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/media/pci/intel/ivsc/mei_csi.c b/drivers/media/pci/intel/ivsc/mei_csi.c
index cd0dcbbb35df..c19c944f613b 100644
--- a/drivers/media/pci/intel/ivsc/mei_csi.c
+++ b/drivers/media/pci/intel/ivsc/mei_csi.c
@@ -654,21 +654,20 @@ static int mei_csi_parse_firmware(struct mei_csi *csi)
 		return -EINVAL;
 	}
 
+	v4l2_async_subdev_nf_init(&csi->notifier, &csi->subdev);
+	csi->notifier.ops = &mei_csi_notify_ops;
+
 	ret = v4l2_fwnode_endpoint_parse(ep, &v4l2_ep);
 	if (ret) {
 		dev_err(dev, "could not parse v4l2 endpoint\n");
-		fwnode_handle_put(ep);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto out_nf_cleanup;
 	}
 
 	csi->nr_of_lanes = v4l2_ep.bus.mipi_csi2.num_data_lanes;
 
-	v4l2_async_subdev_nf_init(&csi->notifier, &csi->subdev);
-	csi->notifier.ops = &mei_csi_notify_ops;
-
 	asd = v4l2_async_nf_add_fwnode_remote(&csi->notifier, ep,
 					      struct v4l2_async_connection);
-	fwnode_handle_put(ep);
 	if (IS_ERR(asd)) {
 		ret = PTR_ERR(asd);
 		goto out_nf_cleanup;
@@ -678,10 +677,13 @@ static int mei_csi_parse_firmware(struct mei_csi *csi)
 	if (ret)
 		goto out_nf_cleanup;
 
+	fwnode_handle_put(ep);
+
 	return 0;
 
 out_nf_cleanup:
 	v4l2_async_nf_cleanup(&csi->notifier);
+	fwnode_handle_put(ep);
 
 	return ret;
 }
-- 
2.39.2

