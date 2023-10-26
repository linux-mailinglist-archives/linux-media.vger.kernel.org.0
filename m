Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1907D7D7E28
	for <lists+linux-media@lfdr.de>; Thu, 26 Oct 2023 10:13:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344494AbjJZIN6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Oct 2023 04:13:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344496AbjJZINy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Oct 2023 04:13:54 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 215F6189
        for <linux-media@vger.kernel.org>; Thu, 26 Oct 2023 01:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698308033; x=1729844033;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PEqccq7BOtbAP23kZNHwqnowmLlBiTnqM4Wvl3JwW8g=;
  b=dj7nwOeb8DR1hh1XWWMJp2vzMVtYL5J4n07Ak+M/W+0wzGgQVcY2MS+u
   90ONrr23lSyBbBSokBQayR7yQal/nz7Z6h18r6QJixcE+5R4rzyStvVpJ
   mBFCFHWcA9jgA6AbDHUcNkdGg9TUaBRPG3y6Fy57VPJbGtFqA84uQs00h
   ozWcuEEYhcoB9wwKLbQuPmXCoyH7w93XzlQtTFKYOJoQQBZb784IA8mYY
   c7b6PTzyFlHA5hdQAAj75Rj5Z/m2V7FHhbdqFAqU+yyQGzpRu9mdt2aJu
   kiNMBR0ohgHkFSKqXNPZYz9vg+crzGrZiTG4MHAuTj+5i32xdF5G718si
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="372530597"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="372530597"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 01:13:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="829539009"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="829539009"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 01:13:49 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 1FC9111FB81;
        Thu, 26 Oct 2023 11:13:47 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     wentong.wu@intel.com, bingbu.cao@intel.com
Subject: [PATCH 1/6] media: ivsc: csi: Don't parse remote endpoints
Date:   Thu, 26 Oct 2023 11:13:41 +0300
Message-Id: <20231026081346.958238-2-sakari.ailus@linux.intel.com>
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

The driver parsed, besides its own endpoint on the sink, the remote
upstream endpoint that most likely is a sensor, and took the number of
lanes from that. Instead obtain the number of lanes from the local
endpoint.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Tested-by: Wentong Wu <wentong.wu@intel.com>
---
 drivers/media/pci/intel/ivsc/mei_csi.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/pci/intel/ivsc/mei_csi.c b/drivers/media/pci/intel/ivsc/mei_csi.c
index b2b9d1669a82..b04847e30213 100644
--- a/drivers/media/pci/intel/ivsc/mei_csi.c
+++ b/drivers/media/pci/intel/ivsc/mei_csi.c
@@ -662,6 +662,8 @@ static int mei_csi_parse_firmware(struct mei_csi *csi)
 		return -EINVAL;
 	}
 
+	csi->nr_of_lanes = v4l2_ep.bus.mipi_csi2.num_data_lanes;
+
 	fwnode = fwnode_graph_get_remote_endpoint(ep);
 	fwnode_handle_put(ep);
 
@@ -675,18 +677,12 @@ static int mei_csi_parse_firmware(struct mei_csi *csi)
 		return PTR_ERR(asd);
 	}
 
-	ret = v4l2_fwnode_endpoint_alloc_parse(fwnode, &v4l2_ep);
 	fwnode_handle_put(fwnode);
-	if (ret)
-		return ret;
-	csi->nr_of_lanes = v4l2_ep.bus.mipi_csi2.num_data_lanes;
 
 	ret = v4l2_async_nf_register(&csi->notifier);
 	if (ret)
 		v4l2_async_nf_cleanup(&csi->notifier);
 
-	v4l2_fwnode_endpoint_free(&v4l2_ep);
-
 	return ret;
 }
 
-- 
2.39.2

