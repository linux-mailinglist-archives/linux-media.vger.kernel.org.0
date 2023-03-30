Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CFE16D042B
	for <lists+linux-media@lfdr.de>; Thu, 30 Mar 2023 13:59:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231602AbjC3L71 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Mar 2023 07:59:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231590AbjC3L7Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Mar 2023 07:59:24 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 788EDA277
        for <linux-media@vger.kernel.org>; Thu, 30 Mar 2023 04:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680177562; x=1711713562;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BKwdsTNa7UQNhT1fh9DGI0GBPWmoZz31I9200IfkT64=;
  b=oIpPL5qGaIxc4+UQdtkMm/dkSEQODb6KG40QQN4b1QLPCNlqFIrDbMHX
   4aROquzFmqSCrmToOYTvtPPafVLX3K5w3UsbLSX8VmJY0TnkQimClKY2A
   JKE4yc0KVm0lj5qMmZeUJMAtLmFV4XDirtSEI/XClPz7TtepkPQMU70XW
   nYsFwYiUrP19Atkwev5jq4FW8EweWA8VNHhJVfLO+OIdgV2bFhH/aRwj8
   8nJfABALkloRpQWRVXzvMADSmpXFfukHGpArnd8TDfC4dD1ZWD1vWdu+n
   KDoQiX4D5cw+tZ9SVpBOtn7XSdynNA2/vNEuds+fa7k0+0F/5QXE82lnd
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="406111505"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="406111505"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 04:59:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="714952934"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="714952934"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 04:59:18 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 33FDA122636;
        Thu, 30 Mar 2023 14:59:16 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        hverkuil@xs4all.nl, Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>
Subject: [PATCH 16/18] media: qcom: Initialise V4L2 async notifier later
Date:   Thu, 30 Mar 2023 14:58:51 +0300
Message-Id: <20230330115853.1628216-17-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230330115853.1628216-1-sakari.ailus@linux.intel.com>
References: <20230330115853.1628216-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Initialise V4L2 async notifier and parse DT for async sub-devices later,
just before registering the notifier. This way the V4L2 device has been
registered before initialising the notifier.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/platform/qcom/camss/camss.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index ae13ae455b52..e33db37c3eb7 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1615,14 +1615,6 @@ static int camss_probe(struct platform_device *pdev)
 	if (!camss->vfe)
 		return -ENOMEM;
 
-	v4l2_async_nf_init(&camss->notifier);
-
-	num_subdevs = camss_of_parse_ports(camss);
-	if (num_subdevs < 0) {
-		ret = num_subdevs;
-		goto err_cleanup;
-	}
-
 	ret = camss_icc_get(camss);
 	if (ret < 0)
 		goto err_cleanup;
@@ -1648,9 +1640,17 @@ static int camss_probe(struct platform_device *pdev)
 		goto err_cleanup;
 	}
 
+	v4l2_async_nf_init(&camss->notifier);
+
+	num_subdevs = camss_of_parse_ports(camss);
+	if (num_subdevs < 0) {
+		ret = num_subdevs;
+		goto err_cleanup;
+	}
+
 	ret = camss_register_entities(camss);
 	if (ret < 0)
-		goto err_register_entities;
+		goto err_cleanup;
 
 	if (num_subdevs) {
 		camss->notifier.ops = &camss_subdev_notifier_ops;
@@ -1691,9 +1691,8 @@ static int camss_probe(struct platform_device *pdev)
 
 err_register_subdevs:
 	camss_unregister_entities(camss);
-err_register_entities:
-	v4l2_device_unregister(&camss->v4l2_dev);
 err_cleanup:
+	v4l2_device_unregister(&camss->v4l2_dev);
 	v4l2_async_nf_cleanup(&camss->notifier);
 
 	return ret;
-- 
2.30.2

