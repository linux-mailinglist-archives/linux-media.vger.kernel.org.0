Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD80A739FD6
	for <lists+linux-media@lfdr.de>; Thu, 22 Jun 2023 13:41:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230334AbjFVLla (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Jun 2023 07:41:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229802AbjFVLl3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Jun 2023 07:41:29 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 780861FCB
        for <linux-media@vger.kernel.org>; Thu, 22 Jun 2023 04:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687434085; x=1718970085;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XuDpAQ4qJh5KmMY9rK4e4k4+jj9PrENFnK2Xb4bFQMU=;
  b=BDRZ/2eIlwsQiK0mw1EOLOMZ4dPUWfBSKrzsft1H4rZiW/ridR2mdCuC
   wtmgOGWHSL8UN4I8IAAYY8Lm9WrN+6il5dECaF3nXhz0z29vj5QlLWUoe
   CNdRS4czcCdepExjaYRI2MMMxkx120MrYDeDvN3NAe7WUvW23hxl5W4LN
   C5QNkhVzgOvCW0fJKxSuOjTd3sgZWR7/P2UOj+DMN9M8PzFHzitE7+jnH
   w6oa4qjRHB8iHHKMLsOcwXYCzU2P5WqyEJsxksayqCvvgPtDrBo1ol2fJ
   N1q3laY8XgDeJrUWar7U/LMjHr3d/if3oUT4vgx1s9Xow4qcKzgBq4y80
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="340800343"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; 
   d="scan'208";a="340800343"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 04:41:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="839013542"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; 
   d="scan'208";a="839013542"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 04:41:12 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 524BD120ED1;
        Thu, 22 Jun 2023 14:40:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qCIg3-003oUH-0n;
        Thu, 22 Jun 2023 14:40:39 +0300
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
Subject: [PATCH v4 30/38] media: pxa_camera: Register V4L2 device early
Date:   Thu, 22 Jun 2023 14:40:20 +0300
Message-Id: <20230622114028.908825-31-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230622114028.908825-1-sakari.ailus@linux.intel.com>
References: <20230622114028.908825-1-sakari.ailus@linux.intel.com>
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

Register V4L2 device before initialising the notifier. This way the device
can be made available to the V4L2 async framework from the notifier init
time onwards. A subsequent patch will add struct v4l2_device as an
argument to v4l2_async_nf_init().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Tested-by: Philipp Zabel <p.zabel@pengutronix.de> # imx6qp
Tested_by: Niklas Söderlund <niklas.soderlund@ragnatech.se> # rcar + adv746x
Tested-by: Aishwarya Kothari <aishwarya.kothari@toradex.com> # Apalis i.MX6Q with TC358743
---
 drivers/media/platform/intel/pxa_camera.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/intel/pxa_camera.c b/drivers/media/platform/intel/pxa_camera.c
index a583186a5140b..a71e26b60c27b 100644
--- a/drivers/media/platform/intel/pxa_camera.c
+++ b/drivers/media/platform/intel/pxa_camera.c
@@ -2299,6 +2299,10 @@ static int pxa_camera_probe(struct platform_device *pdev)
 	pcdev->irq = irq;
 	pcdev->base = base;
 
+	err = v4l2_device_register(&pdev->dev, &pcdev->v4l2_dev);
+	if (err)
+		return err;
+
 	v4l2_async_nf_init(&pcdev->notifier);
 	pcdev->res = res;
 	pcdev->pdata = pdev->dev.platform_data;
@@ -2316,10 +2320,10 @@ static int pxa_camera_probe(struct platform_device *pdev)
 	} else if (pdev->dev.of_node) {
 		err = pxa_camera_pdata_from_dt(&pdev->dev, pcdev);
 	} else {
-		return -ENODEV;
+		err = -ENODEV;
 	}
 	if (err < 0)
-		return err;
+		goto exit_v4l2_device_unregister;
 
 	if (!(pcdev->platform_flags & (PXA_CAMERA_DATAWIDTH_8 |
 			PXA_CAMERA_DATAWIDTH_9 | PXA_CAMERA_DATAWIDTH_10))) {
@@ -2385,13 +2389,10 @@ static int pxa_camera_probe(struct platform_device *pdev)
 	pxa_camera_activate(pcdev);
 
 	platform_set_drvdata(pdev, pcdev);
-	err = v4l2_device_register(&pdev->dev, &pcdev->v4l2_dev);
-	if (err)
-		goto exit_deactivate;
 
 	err = pxa_camera_init_videobuf2(pcdev);
 	if (err)
-		goto exit_v4l2_device_unregister;
+		goto exit_deactivate;
 
 	/* request irq */
 	err = devm_request_irq(&pdev->dev, pcdev->irq, pxa_camera_irq, 0,
@@ -2404,11 +2405,9 @@ static int pxa_camera_probe(struct platform_device *pdev)
 	pcdev->notifier.ops = &pxa_camera_sensor_ops;
 	err = v4l2_async_nf_register(&pcdev->v4l2_dev, &pcdev->notifier);
 	if (err)
-		goto exit_v4l2_device_unregister;
+		goto exit_deactivate;
 
 	return 0;
-exit_v4l2_device_unregister:
-	v4l2_device_unregister(&pcdev->v4l2_dev);
 exit_deactivate:
 	pxa_camera_deactivate(pcdev);
 	tasklet_kill(&pcdev->task_eof);
@@ -2420,6 +2419,8 @@ static int pxa_camera_probe(struct platform_device *pdev)
 	dma_release_channel(pcdev->dma_chans[0]);
 exit_notifier_cleanup:
 	v4l2_async_nf_cleanup(&pcdev->notifier);
+exit_v4l2_device_unregister:
+	v4l2_device_unregister(&pcdev->v4l2_dev);
 	return err;
 }
 
-- 
2.39.2

