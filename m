Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 895176D0426
	for <lists+linux-media@lfdr.de>; Thu, 30 Mar 2023 13:59:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231596AbjC3L7V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Mar 2023 07:59:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231547AbjC3L7T (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Mar 2023 07:59:19 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D3EAA258
        for <linux-media@vger.kernel.org>; Thu, 30 Mar 2023 04:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680177558; x=1711713558;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=G035S5y3lkKRDxgvJzpUP4gRDNxvHYvpKPERm0Z3pMk=;
  b=ODYO4pamI7DjHfMJ+IF2CwAII1T1PyRSsA6uYB0mHkBuetVQPB80puhT
   V3VuFdM98amDyKuzv/kM2Z6E88cpl35aL+TDYhz8Roa/1sVwcHlDXKMEU
   5KQMaa+kzYo4lJpWSdji3CMbGTE3iDwXdrtwYrSfY+X15JRqfh78TR4Ip
   /w1zKAgVaSbStVfi1JniZ0ci/p8rqrhZGKc1PeyCMcipitT0UGV/PsMNa
   ipI+ssC4ny5c1lHz3Ee3QwAEBpdS5vUC9kL06MqukMwD8GTg9D7SMYm7d
   ZAZTdpqA7JcgkdVIQqB2TAlYrUuA9PMHsqhmAeGkEammT9cbTxVU5NikN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="406111462"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="406111462"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 04:59:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="714952930"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="714952930"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 04:59:13 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 51D951224D9;
        Thu, 30 Mar 2023 14:59:11 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        hverkuil@xs4all.nl, Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>
Subject: [PATCH 12/18] media: am437x-vpfe: Register V4L2 device early
Date:   Thu, 30 Mar 2023 14:58:47 +0300
Message-Id: <20230330115853.1628216-13-sakari.ailus@linux.intel.com>
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

Register V4L2 device before the async notifier so the struct device will
be available for the notifier.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../media/platform/ti/am437x/am437x-vpfe.c    | 28 +++++++++----------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/ti/am437x/am437x-vpfe.c b/drivers/media/platform/ti/am437x/am437x-vpfe.c
index a21f3b91cc06..d5ba9b9c7e5a 100644
--- a/drivers/media/platform/ti/am437x/am437x-vpfe.c
+++ b/drivers/media/platform/ti/am437x/am437x-vpfe.c
@@ -2400,10 +2400,18 @@ static int vpfe_probe(struct platform_device *pdev)
 
 	vpfe->pdev = &pdev->dev;
 
+	ret = v4l2_device_register(&pdev->dev, &vpfe->v4l2_dev);
+	if (ret) {
+		vpfe_err(vpfe,
+			"Unable to register v4l2 device.\n");
+		return ret;
+	}
+
 	vpfe_cfg = vpfe_get_pdata(vpfe);
 	if (!vpfe_cfg) {
 		dev_err(&pdev->dev, "No platform data\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto probe_out_cleanup;
 	}
 
 	vpfe->cfg = vpfe_cfg;
@@ -2430,13 +2438,6 @@ static int vpfe_probe(struct platform_device *pdev)
 		goto probe_out_cleanup;
 	}
 
-	ret = v4l2_device_register(&pdev->dev, &vpfe->v4l2_dev);
-	if (ret) {
-		vpfe_err(vpfe,
-			"Unable to register v4l2 device.\n");
-		goto probe_out_cleanup;
-	}
-
 	/* set the driver data in platform device */
 	platform_set_drvdata(pdev, vpfe);
 	/* Enabling module functional clock */
@@ -2446,7 +2447,7 @@ static int vpfe_probe(struct platform_device *pdev)
 	ret = pm_runtime_resume_and_get(&pdev->dev);
 	if (ret < 0) {
 		vpfe_err(vpfe, "Unable to resume device.\n");
-		goto probe_out_v4l2_unregister;
+		goto probe_out_cleanup;
 	}
 
 	vpfe_ccdc_config_defaults(ccdc);
@@ -2459,7 +2460,7 @@ static int vpfe_probe(struct platform_device *pdev)
 				GFP_KERNEL);
 	if (!vpfe->sd) {
 		ret = -ENOMEM;
-		goto probe_out_v4l2_unregister;
+		goto probe_out_cleanup;
 	}
 
 	vpfe->notifier.ops = &vpfe_async_ops;
@@ -2467,15 +2468,14 @@ static int vpfe_probe(struct platform_device *pdev)
 	if (ret) {
 		vpfe_err(vpfe, "Error registering async notifier\n");
 		ret = -EINVAL;
-		goto probe_out_v4l2_unregister;
+		goto probe_out_cleanup;
 	}
 
 	return 0;
 
-probe_out_v4l2_unregister:
-	v4l2_device_unregister(&vpfe->v4l2_dev);
 probe_out_cleanup:
 	v4l2_async_nf_cleanup(&vpfe->notifier);
+	v4l2_device_unregister(&vpfe->v4l2_dev);
 	return ret;
 }
 
@@ -2490,8 +2490,8 @@ static int vpfe_remove(struct platform_device *pdev)
 
 	v4l2_async_nf_unregister(&vpfe->notifier);
 	v4l2_async_nf_cleanup(&vpfe->notifier);
-	v4l2_device_unregister(&vpfe->v4l2_dev);
 	video_unregister_device(&vpfe->video_dev);
+	v4l2_device_unregister(&vpfe->v4l2_dev);
 
 	return 0;
 }
-- 
2.30.2

