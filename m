Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78D21710898
	for <lists+linux-media@lfdr.de>; Thu, 25 May 2023 11:17:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240604AbjEYJRe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 May 2023 05:17:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240515AbjEYJRY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 May 2023 05:17:24 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79EAC19C
        for <linux-media@vger.kernel.org>; Thu, 25 May 2023 02:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685006243; x=1716542243;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zcYIUMsJ7Ujjnm0oLP1d23k7dbb9bSA0tMYSTLtn19o=;
  b=i7IGU6+3ktKvsrcgqx1Z0ClUL/KHxcfOcU1D7YpyWIqHue1RvRqugZz6
   PNg40Qi8AGKLqGw0lsucQWoPdvwu0s7O0KwbpTePjtS2VRYxwdERnJOd+
   bdCfRxfHlzwPWeSqH949hwWBJEvL1ElSZG0bVit/9FPfyWCowSY+X5iIT
   pCXu/Jhrp1yxnAH4jsLmedY/3n+8ISGpSDudXu92XfCnOtKkL+uQL9vmA
   0LICL2ItjOJh5sww/yUok99xRiWrRdgH4+Qyzj+hAXJ12p1dZisg4NzIq
   W+yK/ZKgjPfkP3dAvMHwpQcwwQ+pnsERYkCpBnlgsrLbBQUT8n1pg//B5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="333455999"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; 
   d="scan'208";a="333455999"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 02:17:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="879029147"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; 
   d="scan'208";a="879029147"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 02:17:10 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id B8206123023;
        Thu, 25 May 2023 12:16:49 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1q2758-009kq2-JZ; Thu, 25 May 2023 12:16:26 +0300
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
Subject: [RESEND PATCH v3 27/32] media: omap3isp: Initialise V4L2 async notifier later
Date:   Thu, 25 May 2023 12:16:10 +0300
Message-Id: <20230525091615.2324824-28-sakari.ailus@linux.intel.com>
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

Initialise V4L2 async notifier and parse DT for async sub-devices later,
just before registering the notifier. This way the V4L2 device has been
registered before initialising the notifier which makes it possible to
use it for debug prints.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/platform/ti/omap3isp/isp.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/ti/omap3isp/isp.c b/drivers/media/platform/ti/omap3isp/isp.c
index aa4ec1c8f637f..5b3266b214874 100644
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
@@ -2292,13 +2292,8 @@ static int isp_probe(struct platform_device *pdev)
 
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
@@ -2430,6 +2425,12 @@ static int isp_probe(struct platform_device *pdev)
 
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
@@ -2440,6 +2441,7 @@ static int isp_probe(struct platform_device *pdev)
 	return 0;
 
 error_register_entities:
+	v4l2_async_nf_cleanup(&isp->notifier);
 	isp_unregister_entities(isp);
 error_modules:
 	isp_cleanup_modules(isp);
@@ -2449,7 +2451,6 @@ static int isp_probe(struct platform_device *pdev)
 	isp_xclk_cleanup(isp);
 	__omap3isp_put(isp, false);
 error:
-	v4l2_async_nf_cleanup(&isp->notifier);
 	mutex_destroy(&isp->isp_mutex);
 error_release_isp:
 	kfree(isp);
-- 
2.30.2

