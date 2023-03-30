Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 023C56D042A
	for <lists+linux-media@lfdr.de>; Thu, 30 Mar 2023 13:59:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231601AbjC3L70 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Mar 2023 07:59:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231602AbjC3L7W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Mar 2023 07:59:22 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9D0EA268
        for <linux-media@vger.kernel.org>; Thu, 30 Mar 2023 04:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680177561; x=1711713561;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7+tj6F5gYcmOTf3VG2sl3XwioJ0wPHoLADJpRhcgQTE=;
  b=PMnCmzcwza2mOZHb2t9i9sE3Uz87BrlETwo+LrQijoNL7x3KtXE35P0h
   ABmksojIJt3Jlzeq+jjZfAw/nY0DMp4vWnoW0mToQTY2ik/DQGw6+j9HD
   LuB5inqeERkAlyF8nc7zxnE6OJNlKIDq69Ph3ahsSSh/LrkjemUulsvM9
   DDnLplgbfGt5Y7vaM93OEL652eU75mQpwKVXa0S2PgJMDSjRxVUry1WrD
   WB43A8OI9bPHhcWFcX40Bvy6s0z36l9h45hctJmooOhJyKqnZOP2AeKaa
   0A7T4Zt3cK82aefFQGfNHKE1iwoHK7FvhNoaAqgHyKBEauzEn/FSmuCea
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="406111492"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="406111492"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 04:59:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="714952933"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="714952933"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 04:59:17 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 03D57122457;
        Thu, 30 Mar 2023 14:59:14 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        hverkuil@xs4all.nl, Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>
Subject: [PATCH 15/18] media: davinci: Init async notifier after registering V4L2 device
Date:   Thu, 30 Mar 2023 14:58:50 +0300
Message-Id: <20230330115853.1628216-16-sakari.ailus@linux.intel.com>
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

Initialise the V4L2 async notifier after registering the V4L2 device, just
before parsing DT for async sub-devices. This way struct device is
available to the notifier right from the beginning.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../media/platform/ti/davinci/vpif_capture.c    | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/ti/davinci/vpif_capture.c b/drivers/media/platform/ti/davinci/vpif_capture.c
index 2bbd7017f67c..728865ad44b7 100644
--- a/drivers/media/platform/ti/davinci/vpif_capture.c
+++ b/drivers/media/platform/ti/davinci/vpif_capture.c
@@ -1608,18 +1608,12 @@ static __init int vpif_probe(struct platform_device *pdev)
 	int res_idx = 0;
 	int i, err;
 
-	pdev->dev.platform_data = vpif_capture_get_pdata(pdev);
-	if (!pdev->dev.platform_data) {
-		dev_warn(&pdev->dev, "Missing platform data.  Giving up.\n");
-		return -EINVAL;
-	}
-
 	vpif_dev = &pdev->dev;
 
 	err = initialize_vpif();
 	if (err) {
 		v4l2_err(vpif_dev->driver, "Error initializing vpif\n");
-		goto cleanup;
+		return err;
 	}
 
 	err = v4l2_device_register(vpif_dev, &vpif_obj.v4l2_dev);
@@ -1655,6 +1649,12 @@ static __init int vpif_probe(struct platform_device *pdev)
 		goto vpif_unregister;
 	}
 
+	pdev->dev.platform_data = vpif_capture_get_pdata(pdev);
+	if (!pdev->dev.platform_data) {
+		dev_warn(&pdev->dev, "Missing platform data.  Giving up.\n");
+		goto probe_subdev_out;
+	}
+
 	if (!vpif_obj.config->asd_sizes[0]) {
 		int i2c_id = vpif_obj.config->i2c_adapter_id;
 
@@ -1695,14 +1695,13 @@ static __init int vpif_probe(struct platform_device *pdev)
 	return 0;
 
 probe_subdev_out:
+	v4l2_async_nf_cleanup(&vpif_obj.notifier);
 	/* free sub devices memory */
 	kfree(vpif_obj.sd);
 vpif_unregister:
 	v4l2_device_unregister(&vpif_obj.v4l2_dev);
 vpif_free:
 	free_vpif_objs();
-cleanup:
-	v4l2_async_nf_cleanup(&vpif_obj.notifier);
 
 	return err;
 }
-- 
2.30.2

