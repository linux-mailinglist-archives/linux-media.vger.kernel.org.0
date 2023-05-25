Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51FC971089F
	for <lists+linux-media@lfdr.de>; Thu, 25 May 2023 11:17:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240635AbjEYJRn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 May 2023 05:17:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240627AbjEYJRe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 May 2023 05:17:34 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA2321A8
        for <linux-media@vger.kernel.org>; Thu, 25 May 2023 02:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685006250; x=1716542250;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pnTyCVnujiTaMc+e/XFxqX5bP6QNDE1sE+Dw3H98GH8=;
  b=PUSTH0/lQJTvTdwmrQEzuKJMrTZs0uRbuUYsq/7MNIvJYvMxzo9F6FCX
   5Oy/JglsEryXEDC2kx5FYd/t/izZrW5WcfcqwwWqhvpu+ZzOWyGlLV7/Y
   /Hr6QGIABJXpzeciYfgU+UJmdplnwolv/X/qdZX8RiyBUTNe0/Hfd+8x6
   OKg8CZsnDPZzlbWjBbukIBdPYSg1lnHhxbHi2NX1hM7WNJWBwK8ysLtVO
   Rj2T17QZHb6wD2DZgXqM1xY9XjNh/19xktJheq47TljAYqrRLoBldIs1A
   E5wJp0P72YKTp5HAZLE2qY1qhTt9sR9hGiDj8EzVz7oaMAq/f/60CpjZJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="333456132"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; 
   d="scan'208";a="333456132"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 02:17:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="879029158"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; 
   d="scan'208";a="879029158"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 02:17:11 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id A71BA123007;
        Thu, 25 May 2023 12:16:49 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1q2758-009kpq-H9; Thu, 25 May 2023 12:16:26 +0300
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
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
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
Subject: [RESEND PATCH v3 24/32] media: pxa_camera: Register V4L2 device early
Date:   Thu, 25 May 2023 12:16:07 +0300
Message-Id: <20230525091615.2324824-25-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230525091615.2324824-1-sakari.ailus@linux.intel.com>
References: <20230525091615.2324824-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Register V4L2 device before initialising the notifier. This way the device
is available to the notifier from the beginning which makes it possible to
use it for debug prints.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/platform/intel/pxa_camera.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/intel/pxa_camera.c b/drivers/media/platform/intel/pxa_camera.c
index dad5e8d97683e..5df93fd4ff04b 100644
--- a/drivers/media/platform/intel/pxa_camera.c
+++ b/drivers/media/platform/intel/pxa_camera.c
@@ -2307,6 +2307,10 @@ static int pxa_camera_probe(struct platform_device *pdev)
 		return err;
 	}
 
+	err = v4l2_device_register(&pdev->dev, &pcdev->v4l2_dev);
+	if (err)
+		return err;
+
 	v4l2_async_nf_init(&pcdev->notifier);
 	pcdev->res = res;
 	pcdev->pdata = pdev->dev.platform_data;
@@ -2324,10 +2328,10 @@ static int pxa_camera_probe(struct platform_device *pdev)
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
@@ -2393,22 +2397,17 @@ static int pxa_camera_probe(struct platform_device *pdev)
 	pxa_camera_activate(pcdev);
 
 	platform_set_drvdata(pdev, pcdev);
-	err = v4l2_device_register(&pdev->dev, &pcdev->v4l2_dev);
-	if (err)
-		goto exit_deactivate;
 
 	err = pxa_camera_init_videobuf2(pcdev);
 	if (err)
-		goto exit_v4l2_device_unregister;
+		goto exit_deactivate;
 
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
2.30.2

