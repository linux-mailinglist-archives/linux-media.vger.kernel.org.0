Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9513A75647B
	for <lists+linux-media@lfdr.de>; Mon, 17 Jul 2023 15:22:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231714AbjGQNWG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jul 2023 09:22:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231223AbjGQNVk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jul 2023 09:21:40 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09A31128
        for <linux-media@vger.kernel.org>; Mon, 17 Jul 2023 06:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689600062; x=1721136062;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=COOmKjsedM8vj1P34kA9AjZUDaHfFCYE0riRGdFRXHw=;
  b=EDgQV5IOTJDNpj4900ivMcUvHMAHhepjgYsx9Wa3nL9AZvUaamr/aLJy
   EbD/qEczoymZXWOjZdipMCvaDh3p/jUgsPhgKYPGkI2uakjmLB0Kr5uGU
   Hk7/YLezQj2bu7C+fedG4PQHQGizjO/97ho5/XtZR1926A2jNtfBbWWzx
   AQZeS10j+fPdJrozPwEnvCd7DKXsZaVJAU9hSxrkm5VVgCswpXgNuMxYK
   YeSkKRydVdLdi+UlrIMrCB8Y/A1UJLdWcCWIUsJSY13LwJvx7KBSvfMZk
   j/tEJb9w8mXr4rNCf92fk0JXlMGLwzyntICx3JZ550XSrqA7lXqBmjPUA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="432097641"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="432097641"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 06:20:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="726542021"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="726542021"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 06:20:36 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 6B59E1210BD;
        Mon, 17 Jul 2023 16:20:16 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qLO8G-004s2Q-1q;
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
Subject: [PATCH v5 33/38] media: omap3isp: Initialise V4L2 async notifier later
Date:   Mon, 17 Jul 2023 16:19:04 +0300
Message-Id: <20230717131909.1160787-34-sakari.ailus@linux.intel.com>
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

Initialise V4L2 async notifier and parse DT for async sub-devices later,
just before registering the notifier. This way the device can be made
available to the V4L2 async framework from the notifier init time onwards.
A subsequent patch will add struct v4l2_device as an argument to
v4l2_async_nf_init().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Tested-by: Philipp Zabel <p.zabel@pengutronix.de> # imx6qp
Tested-by: Niklas Söderlund <niklas.soderlund@ragnatech.se> # rcar + adv746x
Tested-by: Aishwarya Kothari <aishwarya.kothari@toradex.com> # Apalis i.MX6Q with TC358743
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> # Renesas RZ/G2L SMARC
---
 drivers/media/platform/ti/omap3isp/isp.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/ti/omap3isp/isp.c b/drivers/media/platform/ti/omap3isp/isp.c
index 0cc999598ff8..90b10dfa09b9 100644
--- a/drivers/media/platform/ti/omap3isp/isp.c
+++ b/drivers/media/platform/ti/omap3isp/isp.c
@@ -2002,6 +2002,7 @@ static void isp_remove(struct platform_device *pdev)
 	struct isp_device *isp = platform_get_drvdata(pdev);
 
 	v4l2_async_nf_unregister(&isp->notifier);
+	v4l2_async_nf_cleanup(&isp->notifier);
 	isp_unregister_entities(isp);
 	isp_cleanup_modules(isp);
 	isp_xclk_cleanup(isp);
@@ -2011,7 +2012,6 @@ static void isp_remove(struct platform_device *pdev)
 	__omap3isp_put(isp, false);
 
 	media_entity_enum_cleanup(&isp->crashed);
-	v4l2_async_nf_cleanup(&isp->notifier);
 
 	kfree(isp);
 }
@@ -2288,13 +2288,8 @@ static int isp_probe(struct platform_device *pdev)
 
 	mutex_init(&isp->isp_mutex);
 	spin_lock_init(&isp->stat_lock);
-	v4l2_async_nf_init(&isp->notifier);
 	isp->dev = &pdev->dev;
 
-	ret = isp_parse_of_endpoints(isp);
-	if (ret < 0)
-		goto error;
-
 	isp->ref_count = 0;
 
 	ret = dma_coerce_mask_and_coherent(isp->dev, DMA_BIT_MASK(32));
@@ -2426,6 +2421,12 @@ static int isp_probe(struct platform_device *pdev)
 
 	isp->notifier.ops = &isp_subdev_notifier_ops;
 
+	v4l2_async_nf_init(&isp->notifier);
+
+	ret = isp_parse_of_endpoints(isp);
+	if (ret < 0)
+		goto error_register_entities;
+
 	ret = v4l2_async_nf_register(&isp->v4l2_dev, &isp->notifier);
 	if (ret)
 		goto error_register_entities;
@@ -2436,6 +2437,7 @@ static int isp_probe(struct platform_device *pdev)
 	return 0;
 
 error_register_entities:
+	v4l2_async_nf_cleanup(&isp->notifier);
 	isp_unregister_entities(isp);
 error_modules:
 	isp_cleanup_modules(isp);
@@ -2445,7 +2447,6 @@ static int isp_probe(struct platform_device *pdev)
 	isp_xclk_cleanup(isp);
 	__omap3isp_put(isp, false);
 error:
-	v4l2_async_nf_cleanup(&isp->notifier);
 	mutex_destroy(&isp->isp_mutex);
 error_release_isp:
 	kfree(isp);
-- 
2.39.2

