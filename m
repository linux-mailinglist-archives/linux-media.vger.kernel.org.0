Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A61975647F
	for <lists+linux-media@lfdr.de>; Mon, 17 Jul 2023 15:22:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231733AbjGQNWH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jul 2023 09:22:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231625AbjGQNVk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jul 2023 09:21:40 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD57510E
        for <linux-media@vger.kernel.org>; Mon, 17 Jul 2023 06:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689600062; x=1721136062;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=h1QA7wiNGA7KyhieUs0/2qvt4MiLaqv8B4fDp9aq7X8=;
  b=Eqdw35C+8D2YsJbr7eRLEmVPEZXp9pO0Txot8G9KpfPYaOMW/9Fuh+wC
   0WJOA1pALERS+K2NTxXl7nPnuwCbQKDkSll4ptNAwI2Y6FgYQJDciMHEP
   THEkbX3dwauVG8u6fI8xJitEYi6AIUIWDRq79BcBD1Qtz5E+IL3y6PV+O
   nqAesQ8DU7nknuhyNbtKqBDd8itkHsQCZnqRQtVAQKYGDtbdPdZEqPLve
   wEjhvkbvfpD3q7aZ3+sVIF0n1T7vp7xO+kG7N5we4oe5vMiMNP/H1BClv
   a6kAwk5zJ6Pt4BluDqtjdrTVnt5vEMLq78tIgz9R0/2CZFIzmrn+xlzEu
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="432097662"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="432097662"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 06:20:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="726542024"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="726542024"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 06:20:36 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 5E0D81210B3;
        Mon, 17 Jul 2023 16:20:16 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qLO8G-004s2B-1f;
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
Subject: [PATCH v5 30/38] media: pxa_camera: Register V4L2 device early
Date:   Mon, 17 Jul 2023 16:19:01 +0300
Message-Id: <20230717131909.1160787-31-sakari.ailus@linux.intel.com>
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

Register V4L2 device before initialising the notifier. This way the device
can be made available to the V4L2 async framework from the notifier init
time onwards. A subsequent patch will add struct v4l2_device as an
argument to v4l2_async_nf_init().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Tested-by: Philipp Zabel <p.zabel@pengutronix.de> # imx6qp
Tested-by: Niklas Söderlund <niklas.soderlund@ragnatech.se> # rcar + adv746x
Tested-by: Aishwarya Kothari <aishwarya.kothari@toradex.com> # Apalis i.MX6Q with TC358743
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> # Renesas RZ/G2L SMARC
---
 drivers/media/platform/intel/pxa_camera.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/intel/pxa_camera.c b/drivers/media/platform/intel/pxa_camera.c
index a583186a5140..a71e26b60c27 100644
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

