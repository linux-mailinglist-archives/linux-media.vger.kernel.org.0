Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F768710891
	for <lists+linux-media@lfdr.de>; Thu, 25 May 2023 11:17:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240564AbjEYJR0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 May 2023 05:17:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240155AbjEYJRU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 May 2023 05:17:20 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0C20197
        for <linux-media@vger.kernel.org>; Thu, 25 May 2023 02:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685006239; x=1716542239;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=z9c6nR/qh3lnsxsX4H+3unb1l3Ji7vf3jzsMz0a4rdg=;
  b=RHD8Z6Yg+mXzUtIRVmB91yrpdVyKTfXWN1K+TFtLtGji+102ZWj4OQYK
   YeyU+YoHO1YWdm7saKoKKiiTQwiRo3r1YX0RFtWShq0L/EzqJCSSleqXc
   s8jljR1Rljdq4JBlYFpCWs1NM8b/0c3Nst7Md1WtJ9kjhnBbeSLHKYDcH
   MgSPM3cXB3wH1lYp2ZUm6Kozi7kyn7m/FpYT0ApRmU/9nLozkrPCOvbsV
   5CdsCgwZ5xhgD8u6E6zoBGHyFiKvp5bq4lQ3XjKpAZcXjJZMQuoREP8WB
   /07yJkCJUL3RnGb7CT5hWnrxTSak3ZzqUp89DPw20613ptBCTuPK9S+xO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="333455891"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; 
   d="scan'208";a="333455891"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 02:17:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="879029132"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; 
   d="scan'208";a="879029132"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 02:17:10 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id C1C3812302B;
        Thu, 25 May 2023 12:16:49 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1q2758-009kqA-Kt; Thu, 25 May 2023 12:16:26 +0300
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
Subject: [RESEND PATCH v3 29/32] media: davinci: Init async notifier after registering V4L2 device
Date:   Thu, 25 May 2023 12:16:12 +0300
Message-Id: <20230525091615.2324824-30-sakari.ailus@linux.intel.com>
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

