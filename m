Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E0AC756489
	for <lists+linux-media@lfdr.de>; Mon, 17 Jul 2023 15:22:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231592AbjGQNWX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jul 2023 09:22:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231648AbjGQNVl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jul 2023 09:21:41 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D243610E5
        for <linux-media@vger.kernel.org>; Mon, 17 Jul 2023 06:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689600066; x=1721136066;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dR6G6BqQPCZ/K8pRwlXXMJkoP9glL/Gy4Jn3azfCW9k=;
  b=lufWSLlhg/Vl1JTtz4+jKBtKY023NSalBh8z7n1IffDxA5JWk+eTi0Qm
   qdRasobdhNyoqO8hgrw6JIgX7YuSHNoQOQ3xaE7Nf6tQZo9Sk7AsXc1yp
   MJQN3sepaqu8xR+yDK32yfvWiwq3TwPzjpq36pEeGRkhXKe/uBI0gyYXm
   BwMXO5CtzCtoncQjN3dH/Gu60HA6tN69Bvi4J4MB1CKMZzvfAxFG/ztrB
   r/aTvcZldR/sx4lxwqj5I5k5G24QVnhmGR6tiWJZil7bRaBRNeCzWsRoj
   55uOuUAt6jBtLxVZuZHPbjFqIrT4bBTspPQ7t+0WDCxzNVQcdQgNSz/ZZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="432097868"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="432097868"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 06:20:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="726542103"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="726542103"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 06:20:36 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 6751A1210B5;
        Mon, 17 Jul 2023 16:20:16 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qLO8G-004s2L-1n;
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
Subject: [PATCH v5 32/38] media: am437x-vpfe: Register V4L2 device early
Date:   Mon, 17 Jul 2023 16:19:03 +0300
Message-Id: <20230717131909.1160787-33-sakari.ailus@linux.intel.com>
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

Register V4L2 device before the async notifier.This way the device can be
made available to the V4L2 async framework from the notifier init time
onwards. A subsequent patch will add struct v4l2_device as an argument to
v4l2_async_nf_init().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Tested-by: Philipp Zabel <p.zabel@pengutronix.de> # imx6qp
Tested-by: Niklas Söderlund <niklas.soderlund@ragnatech.se> # rcar + adv746x
Tested-by: Aishwarya Kothari <aishwarya.kothari@toradex.com> # Apalis i.MX6Q with TC358743
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> # Renesas RZ/G2L SMARC
---
 .../media/platform/ti/am437x/am437x-vpfe.c    | 27 +++++++++----------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/ti/am437x/am437x-vpfe.c b/drivers/media/platform/ti/am437x/am437x-vpfe.c
index a1e01ef5ebdd..1457a188fea1 100644
--- a/drivers/media/platform/ti/am437x/am437x-vpfe.c
+++ b/drivers/media/platform/ti/am437x/am437x-vpfe.c
@@ -2403,10 +2403,17 @@ static int vpfe_probe(struct platform_device *pdev)
 
 	vpfe->pdev = &pdev->dev;
 
+	ret = v4l2_device_register(&pdev->dev, &vpfe->v4l2_dev);
+	if (ret) {
+		vpfe_err(vpfe, "Unable to register v4l2 device.\n");
+		return ret;
+	}
+
 	vpfe_cfg = vpfe_get_pdata(vpfe);
 	if (!vpfe_cfg) {
 		dev_err(&pdev->dev, "No platform data\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto probe_out_cleanup;
 	}
 
 	vpfe->cfg = vpfe_cfg;
@@ -2433,13 +2440,6 @@ static int vpfe_probe(struct platform_device *pdev)
 		goto probe_out_cleanup;
 	}
 
-	ret = v4l2_device_register(&pdev->dev, &vpfe->v4l2_dev);
-	if (ret) {
-		vpfe_err(vpfe,
-			"Unable to register v4l2 device.\n");
-		goto probe_out_cleanup;
-	}
-
 	/* set the driver data in platform device */
 	platform_set_drvdata(pdev, vpfe);
 	/* Enabling module functional clock */
@@ -2449,7 +2449,7 @@ static int vpfe_probe(struct platform_device *pdev)
 	ret = pm_runtime_resume_and_get(&pdev->dev);
 	if (ret < 0) {
 		vpfe_err(vpfe, "Unable to resume device.\n");
-		goto probe_out_v4l2_unregister;
+		goto probe_out_cleanup;
 	}
 
 	vpfe_ccdc_config_defaults(ccdc);
@@ -2462,7 +2462,7 @@ static int vpfe_probe(struct platform_device *pdev)
 				GFP_KERNEL);
 	if (!vpfe->sd) {
 		ret = -ENOMEM;
-		goto probe_out_v4l2_unregister;
+		goto probe_out_cleanup;
 	}
 
 	vpfe->notifier.ops = &vpfe_async_ops;
@@ -2470,15 +2470,14 @@ static int vpfe_probe(struct platform_device *pdev)
 	if (ret) {
 		vpfe_err(vpfe, "Error registering async notifier\n");
 		ret = -EINVAL;
-		goto probe_out_v4l2_unregister;
+		goto probe_out_cleanup;
 	}
 
 	return 0;
 
-probe_out_v4l2_unregister:
-	v4l2_device_unregister(&vpfe->v4l2_dev);
 probe_out_cleanup:
 	v4l2_async_nf_cleanup(&vpfe->notifier);
+	v4l2_device_unregister(&vpfe->v4l2_dev);
 	return ret;
 }
 
@@ -2493,8 +2492,8 @@ static void vpfe_remove(struct platform_device *pdev)
 
 	v4l2_async_nf_unregister(&vpfe->notifier);
 	v4l2_async_nf_cleanup(&vpfe->notifier);
-	v4l2_device_unregister(&vpfe->v4l2_dev);
 	video_unregister_device(&vpfe->video_dev);
+	v4l2_device_unregister(&vpfe->v4l2_dev);
 }
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.39.2

