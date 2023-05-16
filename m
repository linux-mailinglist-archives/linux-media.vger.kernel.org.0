Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27C627049D6
	for <lists+linux-media@lfdr.de>; Tue, 16 May 2023 11:56:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232257AbjEPJ4d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 May 2023 05:56:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232248AbjEPJ42 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 May 2023 05:56:28 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9627B11C
        for <linux-media@vger.kernel.org>; Tue, 16 May 2023 02:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684230984; x=1715766984;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pnTyCVnujiTaMc+e/XFxqX5bP6QNDE1sE+Dw3H98GH8=;
  b=namHnuwtg73Pb7Q15ua1BWOeUCKvLDE5W6v8kXUv8iiMjb3J9YVofk66
   s+Hx+aPAXhem4cmcpo6Cr2EJ6mtyuKNjVASx3oo27P0Hnv9vXSPprA0tH
   YdMIFLoWRgOmMpNkD8bNYkGjXReQ/aTwXiJb1RlAsMW47UoWtlTDcjsAS
   FvmXwTU5LBjWX/EHQShCvGNAfosV9NxYHPdRDCIxSnOPZsSr42SVp1qnM
   s6mUAYnG/wcJYCvMxkBQFJLfkQ+hLgOuOviNvePzToObkmlFdwYWa/EmA
   Mwqd4JRzRtNHOS/+FTmAwxWtvLvWX5LcX0lIHgp6IYxPv7MCe8wZiP5xY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="354601509"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; 
   d="scan'208";a="354601509"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2023 02:55:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="731931859"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; 
   d="scan'208";a="731931859"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2023 02:55:48 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 68840122FAF;
        Tue, 16 May 2023 12:55:36 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1pyrOy-002ZAv-Dd; Tue, 16 May 2023 12:55:28 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, bingbu.cao@intel.com
Subject: [PATCH v2 23/31] media: pxa_camera: Register V4L2 device early, fix probe error handling
Date:   Tue, 16 May 2023 12:55:09 +0300
Message-Id: <20230516095517.611711-24-sakari.ailus@linux.intel.com>
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

