Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C4787049D1
	for <lists+linux-media@lfdr.de>; Tue, 16 May 2023 11:56:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232245AbjEPJ41 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 May 2023 05:56:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232238AbjEPJ4Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 May 2023 05:56:24 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89CAC4215
        for <linux-media@vger.kernel.org>; Tue, 16 May 2023 02:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684230975; x=1715766975;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5rW8DK32Hyv8FwdY9xWNQn2lY3oKeRhHTHoKPj3mXUI=;
  b=gcEOeSUp/if8iLjkbk0Zasj5K8+tLXpZKH0ZmXF+aN4u3DGhL9hrxDXb
   2Q8636bHEw7FjKo6T3VPUTPFeebMT60XL6FIjx68C1SDNtg3DNYijMT/A
   /Vp4OyEH/5G5/mADLKHYkobriKs8RWgONdQ+vMA46esy74VG4bPAS/wCL
   0YyKkh9SJ8S5QpNlfZkozRQyjQfP3Rp0eWO7xKe5DlH0iASDY/AD1Z+F4
   VQfynBYcyjqw1VR1M13X8xQQMd7HPVvY6Lp6DCGol5UAyPy1d/KusPYvP
   dQQ+zTqoqPbbH5FVDqvc++m1mWLCOuuCa5G2xUW1MugRexoV3obQ7sU9d
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="354601491"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; 
   d="scan'208";a="354601491"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2023 02:55:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="731931853"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; 
   d="scan'208";a="731931853"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2023 02:55:48 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 624AA122FA3;
        Tue, 16 May 2023 12:55:36 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1pyrOy-002ZAr-Cz; Tue, 16 May 2023 12:55:28 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, bingbu.cao@intel.com
Subject: [PATCH v2 22/31] media: pxa_camera: Fix probe error handling
Date:   Tue, 16 May 2023 12:55:08 +0300
Message-Id: <20230516095517.611711-23-sakari.ailus@linux.intel.com>
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

Fix and simplify error handling in pxa_camera probe, by moving devm_*()
functions early in the probe function and then tearing down what was set
up on error patch.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/platform/intel/pxa_camera.c | 48 ++++++++++++-----------
 1 file changed, 25 insertions(+), 23 deletions(-)

diff --git a/drivers/media/platform/intel/pxa_camera.c b/drivers/media/platform/intel/pxa_camera.c
index f0d316d5fe27c..dad5e8d97683e 100644
--- a/drivers/media/platform/intel/pxa_camera.c
+++ b/drivers/media/platform/intel/pxa_camera.c
@@ -2289,6 +2289,24 @@ static int pxa_camera_probe(struct platform_device *pdev)
 	if (IS_ERR(pcdev->clk))
 		return PTR_ERR(pcdev->clk);
 
+	/*
+	 * Request the regions.
+	 */
+	base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	pcdev->irq = irq;
+	pcdev->base = base;
+
+	/* request irq */
+	err = devm_request_irq(&pdev->dev, pcdev->irq, pxa_camera_irq, 0,
+			       PXA_CAM_DRV_NAME, pcdev);
+	if (err) {
+		dev_err(&pdev->dev, "Camera interrupt register failed\n");
+		return err;
+	}
+
 	v4l2_async_nf_init(&pcdev->notifier);
 	pcdev->res = res;
 	pcdev->pdata = pdev->dev.platform_data;
@@ -2338,21 +2356,12 @@ static int pxa_camera_probe(struct platform_device *pdev)
 	spin_lock_init(&pcdev->lock);
 	mutex_init(&pcdev->mlock);
 
-	/*
-	 * Request the regions.
-	 */
-	base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
-	pcdev->irq = irq;
-	pcdev->base = base;
-
 	/* request dma */
 	pcdev->dma_chans[0] = dma_request_chan(&pdev->dev, "CI_Y");
 	if (IS_ERR(pcdev->dma_chans[0])) {
 		dev_err(&pdev->dev, "Can't request DMA for Y\n");
-		return PTR_ERR(pcdev->dma_chans[0]);
+		err = PTR_ERR(pcdev->dma_chans[0]);
+		goto exit_notifier_cleanup;
 	}
 
 	pcdev->dma_chans[1] = dma_request_chan(&pdev->dev, "CI_U");
@@ -2379,14 +2388,6 @@ static int pxa_camera_probe(struct platform_device *pdev)
 		}
 	}
 
-	/* request irq */
-	err = devm_request_irq(&pdev->dev, pcdev->irq, pxa_camera_irq, 0,
-			       PXA_CAM_DRV_NAME, pcdev);
-	if (err) {
-		dev_err(&pdev->dev, "Camera interrupt register failed\n");
-		goto exit_free_dma;
-	}
-
 	tasklet_setup(&pcdev->task_eof, pxa_camera_eof);
 
 	pxa_camera_activate(pcdev);
@@ -2398,16 +2399,15 @@ static int pxa_camera_probe(struct platform_device *pdev)
 
 	err = pxa_camera_init_videobuf2(pcdev);
 	if (err)
-		goto exit_notifier_cleanup;
+		goto exit_v4l2_device_unregister;
 
 	pcdev->notifier.ops = &pxa_camera_sensor_ops;
 	err = v4l2_async_nf_register(&pcdev->v4l2_dev, &pcdev->notifier);
 	if (err)
-		goto exit_notifier_cleanup;
+		goto exit_v4l2_device_unregister;
 
 	return 0;
-exit_notifier_cleanup:
-	v4l2_async_nf_cleanup(&pcdev->notifier);
+exit_v4l2_device_unregister:
 	v4l2_device_unregister(&pcdev->v4l2_dev);
 exit_deactivate:
 	pxa_camera_deactivate(pcdev);
@@ -2418,6 +2418,8 @@ static int pxa_camera_probe(struct platform_device *pdev)
 	dma_release_channel(pcdev->dma_chans[1]);
 exit_free_dma_y:
 	dma_release_channel(pcdev->dma_chans[0]);
+exit_notifier_cleanup:
+	v4l2_async_nf_cleanup(&pcdev->notifier);
 	return err;
 }
 
-- 
2.30.2

