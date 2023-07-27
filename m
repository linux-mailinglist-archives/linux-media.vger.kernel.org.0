Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4E6E764626
	for <lists+linux-media@lfdr.de>; Thu, 27 Jul 2023 07:49:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232461AbjG0Fs7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jul 2023 01:48:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231295AbjG0Fsc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jul 2023 01:48:32 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 649D63595
        for <linux-media@vger.kernel.org>; Wed, 26 Jul 2023 22:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690436868; x=1721972868;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Vi00qBs2AZ/5mTwrQ8zQiLsoBSSb/pF4uZM9o+7u3hs=;
  b=Zv1L9R6PXQSAHpmOUxjjjvrQ61gjVgU7baVe+i2psNX9IxB0zKJh09nV
   Uemmkod6fJhiy4RmygN90xpCeisE18S6UlZMGO9Gdg+4DH1Cgng8xlwGA
   AuPXM5ffhSuRKm2pU72GvwTAm5J5SmK+1IoIM7S9eC6UnRs/sqUIidD2O
   edM5tuunync9h2IPcZDPtmyUgRfeJ5epLqZT0ycIKTTxKIX0Axo4KLXHo
   95loNKiJhOwoftcDnZytHUKRmTA9j5caeIWZCbPZVqULoUuDBCNFmIn6P
   i9PZDYTJBBVFEK5kkCjl+/SkcvFmPOak58XJ+l1msp783jFl9PiWGy9EU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="399151075"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="399151075"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 22:44:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="840584157"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="840584157"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 22:44:47 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 3467C12219A;
        Thu, 27 Jul 2023 08:44:19 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qOtmE-004xsz-1N;
        Thu, 27 Jul 2023 08:43:06 +0300
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
Subject: [PATCH v6 35/38] media: davinci: Init async notifier after registering V4L2 device
Date:   Thu, 27 Jul 2023 08:42:52 +0300
Message-Id: <20230727054255.1183255-36-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727054255.1183255-1-sakari.ailus@linux.intel.com>
References: <20230727054255.1183255-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Initialise the V4L2 async notifier after registering the V4L2 device, just
before parsing DT for async sub-devices. This way the device can be made
available to the V4L2 async framework from the notifier init time onwards.
A subsequent patch will add struct v4l2_device as an argument to
v4l2_async_nf_init().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Tested-by: Philipp Zabel <p.zabel@pengutronix.de> # imx6qp
Tested-by: Niklas Söderlund <niklas.soderlund@ragnatech.se> # rcar + adv746x
Tested-by: Aishwarya Kothari <aishwarya.kothari@toradex.com> # Apalis i.MX6Q with TC358743
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> # Renesas RZ/G2L SMARC
---
 .../media/platform/ti/davinci/vpif_capture.c  | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/ti/davinci/vpif_capture.c b/drivers/media/platform/ti/davinci/vpif_capture.c
index a63c9e51dac4..10b13d8e76e5 100644
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
@@ -1646,13 +1640,19 @@ static __init int vpif_probe(struct platform_device *pdev)
 			goto vpif_unregister;
 	} while (++res_idx);
 
+	pdev->dev.platform_data = vpif_capture_get_pdata(pdev);
+	if (!pdev->dev.platform_data) {
+		dev_warn(&pdev->dev, "Missing platform data. Giving up.\n");
+		goto vpif_unregister;
+	}
+
 	vpif_obj.config = pdev->dev.platform_data;
 
 	subdev_count = vpif_obj.config->subdev_count;
 	vpif_obj.sd = kcalloc(subdev_count, sizeof(*vpif_obj.sd), GFP_KERNEL);
 	if (!vpif_obj.sd) {
 		err = -ENOMEM;
-		goto vpif_unregister;
+		goto probe_subdev_out;
 	}
 
 	if (!vpif_obj.config->asd_sizes[0]) {
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
2.39.2

