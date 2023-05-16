Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B3677049D3
	for <lists+linux-media@lfdr.de>; Tue, 16 May 2023 11:56:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232233AbjEPJ43 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 May 2023 05:56:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232244AbjEPJ41 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 May 2023 05:56:27 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D971B199C
        for <linux-media@vger.kernel.org>; Tue, 16 May 2023 02:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684230981; x=1715766981;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5PTeweLPTRd1sCvqIsPZ3AJXQB1XQ71FsPOHa6uUk6Y=;
  b=aFEOuTWktZKvIzb4Jb4I8RJ2WGhylOHgXWuzUezcdzNQCmaYITZ7B0Na
   ZUfKHvN0oYFkXkHEK98d5J+wkWKxkaRkaNLc85xXpfpAwPsOd8zZF/INQ
   JA+zybvfQpjizujIfniPW0FUcH5bTlAk9iso45NTW1uMIflUJmapAw/E/
   uGdSh3FzxFJfYUq/0k6jMiGWUFXtOcwopaLGebIIqJNpc6FzbcIYm1/0/
   oER7lmc0BlmTkEMFiEIKmMaSWGhsAZttQ3rvXHan0V6kNqGsCuiPqVbII
   pa1HpI8I7kZaFeIVarWcoqBMt0NLZegvCA1AtG+G3OSWsnuZYNUu9vxXm
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="354601495"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; 
   d="scan'208";a="354601495"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2023 02:55:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="731931855"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; 
   d="scan'208";a="731931855"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2023 02:55:48 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 725B5122FB2;
        Tue, 16 May 2023 12:55:36 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1pyrOy-002ZB1-F7; Tue, 16 May 2023 12:55:28 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, bingbu.cao@intel.com
Subject: [PATCH v2 25/31] media: am437x-vpfe: Register V4L2 device early
Date:   Tue, 16 May 2023 12:55:11 +0300
Message-Id: <20230516095517.611711-26-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230516095517.611711-1-sakari.ailus@linux.intel.com>
References: <20230516095517.611711-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Register V4L2 device before the async notifier so the struct device will
be available for the notifier which makes it possible to use it for debug
prints.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../media/platform/ti/am437x/am437x-vpfe.c    | 27 +++++++++----------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/ti/am437x/am437x-vpfe.c b/drivers/media/platform/ti/am437x/am437x-vpfe.c
index a1e01ef5ebddb..1457a188fea12 100644
--- a/drivers/media/platform/ti/am437x/am437x-vpfe.c
+++ b/drivers/media/platform/ti/am437x/am437x-vpfe.c
@@ -2403,10 +2403,17 @@ static int vpfe_probe(struct platform_device *pdev)
 
 	vpfe->pdev = &pdev->dev;
 
+	ret = v4l2_device_register(&pdev->dev, &vpfe->v4l2_dev);
+	if (ret) {
+		vpfe_err(vpfe, "Unable to register v4l2 device.\n");
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
@@ -2433,13 +2440,6 @@ static int vpfe_probe(struct platform_device *pdev)
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
@@ -2449,7 +2449,7 @@ static int vpfe_probe(struct platform_device *pdev)
 	ret = pm_runtime_resume_and_get(&pdev->dev);
 	if (ret < 0) {
 		vpfe_err(vpfe, "Unable to resume device.\n");
-		goto probe_out_v4l2_unregister;
+		goto probe_out_cleanup;
 	}
 
 	vpfe_ccdc_config_defaults(ccdc);
@@ -2462,7 +2462,7 @@ static int vpfe_probe(struct platform_device *pdev)
 				GFP_KERNEL);
 	if (!vpfe->sd) {
 		ret = -ENOMEM;
-		goto probe_out_v4l2_unregister;
+		goto probe_out_cleanup;
 	}
 
 	vpfe->notifier.ops = &vpfe_async_ops;
@@ -2470,15 +2470,14 @@ static int vpfe_probe(struct platform_device *pdev)
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
 
@@ -2493,8 +2492,8 @@ static void vpfe_remove(struct platform_device *pdev)
 
 	v4l2_async_nf_unregister(&vpfe->notifier);
 	v4l2_async_nf_cleanup(&vpfe->notifier);
-	v4l2_device_unregister(&vpfe->v4l2_dev);
 	video_unregister_device(&vpfe->video_dev);
+	v4l2_device_unregister(&vpfe->v4l2_dev);
 }
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.30.2

