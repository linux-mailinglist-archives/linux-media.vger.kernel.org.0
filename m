Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 478F87049D5
	for <lists+linux-media@lfdr.de>; Tue, 16 May 2023 11:56:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232250AbjEPJ4b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 May 2023 05:56:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232243AbjEPJ42 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 May 2023 05:56:28 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2C3F359D
        for <linux-media@vger.kernel.org>; Tue, 16 May 2023 02:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684230983; x=1715766983;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=z9c6nR/qh3lnsxsX4H+3unb1l3Ji7vf3jzsMz0a4rdg=;
  b=A0a6S/p77SSp2I18K+TQrOd3EpT6HFDVc8tlQtG8+R2SETdTz3Wd1jJa
   9S8Rj00NVDij1Ym+DWH/VeRvoiqeDBqdByfAc/mKU+ekUmWA5JuftQ5K0
   Ewe3kimA6xvBrngJXixUDozHI3xOxKlwihQkEbABnZAsrNK0m74H0Xjoy
   hn5yZkDDIA8Jl7IIOvvaLKrS00r+FkfegQefhpO3m9L0BUpHwuATUeO4J
   LzQhzphLG9j6Ls2vM3c/QCSdV5EDekCffIsQW8CVzeh4Y0getFjl8KIg/
   jsdTGwwTgji5hS198C7PcStyIdkOnd25fZLbZwoWfidajJn6KvVFGlG/J
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="354601552"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; 
   d="scan'208";a="354601552"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2023 02:55:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="731931875"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; 
   d="scan'208";a="731931875"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2023 02:55:48 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 81F1B122FB7;
        Tue, 16 May 2023 12:55:36 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1pyrOy-002ZBC-H3; Tue, 16 May 2023 12:55:28 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, bingbu.cao@intel.com
Subject: [PATCH v2 28/31] media: davinci: Init async notifier after registering V4L2 device
Date:   Tue, 16 May 2023 12:55:14 +0300
Message-Id: <20230516095517.611711-29-sakari.ailus@linux.intel.com>
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

Initialise the V4L2 async notifier after registering the V4L2 device, just
before parsing DT for async sub-devices. This way struct device is
available to the notifier right from the beginning which makes it possible
to use it for debug prints.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../media/platform/ti/davinci/vpif_capture.c    | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/ti/davinci/vpif_capture.c b/drivers/media/platform/ti/davinci/vpif_capture.c
index a63c9e51dac41..9b97e26be0892 100644
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

