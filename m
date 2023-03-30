Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D9FE6D0428
	for <lists+linux-media@lfdr.de>; Thu, 30 Mar 2023 13:59:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231624AbjC3L7Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Mar 2023 07:59:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231151AbjC3L7V (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Mar 2023 07:59:21 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73063A24F
        for <linux-media@vger.kernel.org>; Thu, 30 Mar 2023 04:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680177559; x=1711713559;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sRrWpVrRIZfVl/lO/WlUIj/nSKV6aMDfiMPVw4F0CBU=;
  b=kPjor05ZR/B6pH2DmZa0Nqsuv6YIJP6DZS1o9+22IKvmIsv9lx62Fuze
   GxaU8O4+TQ0AZw6L/qJRdUiZu1T8WSVvlQGOpPNZ6lNwm9VgZGdUZ5wXA
   7Nn9+po7u/QWPS6D8O2q5ydZs6PguGEXf9U8fpVnJMjKpwoMBLYoRaTL4
   eCp2m3yUiNSjjoRUdwmI78DQQyFtkmAMNjrns5yF0/YfPEz9ha4YhsjKT
   My6s/eX3ovGCsxq3Jlpz4qhP5PNqBkGLq+x1kPjk5XI7r41Mspv9n64gj
   eCsUKXZyKE7CWbhIHWFSzwq+tZg9Uqb1w1bYMasoHqIy7fwDUe8rBwyoo
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="406111472"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="406111472"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 04:59:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="714952931"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="714952931"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 04:59:14 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 8A0211224DD;
        Thu, 30 Mar 2023 14:59:12 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        hverkuil@xs4all.nl, Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>
Subject: [PATCH 13/18] media: omap3isp: Initialise V4L2 async notifier later
Date:   Thu, 30 Mar 2023 14:58:48 +0300
Message-Id: <20230330115853.1628216-14-sakari.ailus@linux.intel.com>
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

Initialise V4L2 async notifier and parse DT for async sub-devices later,
just before registering the notifier. This way the V4L2 device has been
registered before initialising the notifier.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/platform/ti/omap3isp/isp.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/ti/omap3isp/isp.c b/drivers/media/platform/ti/omap3isp/isp.c
index e7327e38482d..7ccc18acb429 100644
--- a/drivers/media/platform/ti/omap3isp/isp.c
+++ b/drivers/media/platform/ti/omap3isp/isp.c
@@ -2002,6 +2002,7 @@ static int isp_remove(struct platform_device *pdev)
 	struct isp_device *isp = platform_get_drvdata(pdev);
 
 	v4l2_async_nf_unregister(&isp->notifier);
+	v4l2_async_nf_cleanup(&isp->notifier);
 	isp_unregister_entities(isp);
 	isp_cleanup_modules(isp);
 	isp_xclk_cleanup(isp);
@@ -2011,7 +2012,6 @@ static int isp_remove(struct platform_device *pdev)
 	__omap3isp_put(isp, false);
 
 	media_entity_enum_cleanup(&isp->crashed);
-	v4l2_async_nf_cleanup(&isp->notifier);
 
 	kfree(isp);
 
@@ -2290,13 +2290,8 @@ static int isp_probe(struct platform_device *pdev)
 
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
@@ -2428,6 +2423,12 @@ static int isp_probe(struct platform_device *pdev)
 
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
@@ -2438,6 +2439,7 @@ static int isp_probe(struct platform_device *pdev)
 	return 0;
 
 error_register_entities:
+	v4l2_async_nf_cleanup(&isp->notifier);
 	isp_unregister_entities(isp);
 error_modules:
 	isp_cleanup_modules(isp);
@@ -2447,7 +2449,6 @@ static int isp_probe(struct platform_device *pdev)
 	isp_xclk_cleanup(isp);
 	__omap3isp_put(isp, false);
 error:
-	v4l2_async_nf_cleanup(&isp->notifier);
 	mutex_destroy(&isp->isp_mutex);
 error_release_isp:
 	kfree(isp);
-- 
2.30.2

