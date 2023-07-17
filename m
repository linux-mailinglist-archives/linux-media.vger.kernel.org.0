Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 346F7756485
	for <lists+linux-media@lfdr.de>; Mon, 17 Jul 2023 15:22:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231755AbjGQNWM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jul 2023 09:22:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231640AbjGQNVl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jul 2023 09:21:41 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3656AD
        for <linux-media@vger.kernel.org>; Mon, 17 Jul 2023 06:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689600063; x=1721136063;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oyRyy8bPb6WDP/Do2pkNRh9X4JplRt6JH9goZHUOZwQ=;
  b=GixjjUAINkyp8Ty659LgxQx8ICGanUNDJBPuwJHdmFbkm6/By24/+4kq
   Q2V/BKMEVvgVJRcoPnSJh85tQFZ6hHd6xMk0P1QvtpTVYr3kWyUmsYMbp
   h0RmiM8no9Wq3j3TAVJc39ht7DnB8FakiALRaruzwBXHQ2Few7KoiclQR
   UGx6XzgGgcemcnNkNrIpTT+CJlKyR2DsIHhQOBSZ6VF1d2ImxzxyVYJjV
   39HlFMjyI+aYqDdmzqaI6Ow9xKQFDCWqhKTI1gdZoCyO5jdz9FzbI8e7N
   YM5G6IkVQ/hsdwj2t/bCR7vhpL5OFJij5j5VeXDtaEProgAA4B88bc0oX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="432097733"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="432097733"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 06:20:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="726542100"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="726542100"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 06:20:36 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 597C31210B2;
        Mon, 17 Jul 2023 16:20:16 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qLO8G-004s26-1c;
        Mon, 17 Jul 2023 16:19:20 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, bingbu.cao@intel.com,
        niklas.soderlund@ragnatech.se,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Sylvain Petinot <sylvain.petinot@foss.st.com>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Yong Deng <yong.deng@magewell.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Benoit Parrot <bparrot@ti.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH v5 29/38] media: pxa_camera: Fix probe error handling
Date:   Mon, 17 Jul 2023 16:19:00 +0300
Message-Id: <20230717131909.1160787-30-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230717131909.1160787-1-sakari.ailus@linux.intel.com>
References: <20230717131909.1160787-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix and simplify error handling in pxa_camera probe, by moving devm_*()
functions early in the probe function and then tearing down what was set
up on error patch.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Tested-by: Philipp Zabel <p.zabel@pengutronix.de> # imx6qp
Tested-by: Niklas Söderlund <niklas.soderlund@ragnatech.se> # rcar + adv746x
Tested-by: Aishwarya Kothari <aishwarya.kothari@toradex.com> # Apalis i.MX6Q with TC358743
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> # Renesas RZ/G2L SMARC
---
 drivers/media/platform/intel/pxa_camera.c | 48 ++++++++++++-----------
 1 file changed, 25 insertions(+), 23 deletions(-)

diff --git a/drivers/media/platform/intel/pxa_camera.c b/drivers/media/platform/intel/pxa_camera.c
index f0d316d5fe27..a583186a5140 100644
--- a/drivers/media/platform/intel/pxa_camera.c
+++ b/drivers/media/platform/intel/pxa_camera.c
@@ -2289,6 +2289,16 @@ static int pxa_camera_probe(struct platform_device *pdev)
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
 	v4l2_async_nf_init(&pcdev->notifier);
 	pcdev->res = res;
 	pcdev->pdata = pdev->dev.platform_data;
@@ -2338,21 +2348,12 @@ static int pxa_camera_probe(struct platform_device *pdev)
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
@@ -2379,14 +2380,6 @@ static int pxa_camera_probe(struct platform_device *pdev)
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
@@ -2398,16 +2391,23 @@ static int pxa_camera_probe(struct platform_device *pdev)
 
 	err = pxa_camera_init_videobuf2(pcdev);
 	if (err)
-		goto exit_notifier_cleanup;
+		goto exit_v4l2_device_unregister;
+
+	/* request irq */
+	err = devm_request_irq(&pdev->dev, pcdev->irq, pxa_camera_irq, 0,
+			       PXA_CAM_DRV_NAME, pcdev);
+	if (err) {
+		dev_err(&pdev->dev, "Camera interrupt register failed\n");
+		goto exit_v4l2_device_unregister;
+	}
 
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
2.39.2

