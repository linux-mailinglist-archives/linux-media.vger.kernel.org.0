Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64B0E710894
	for <lists+linux-media@lfdr.de>; Thu, 25 May 2023 11:17:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240516AbjEYJR2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 May 2023 05:17:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240429AbjEYJRV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 May 2023 05:17:21 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BF0C195
        for <linux-media@vger.kernel.org>; Thu, 25 May 2023 02:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685006240; x=1716542240;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OTutRpmrnvsgBz74xZsS8El+m5YwHhPnVgYvJwqT64Y=;
  b=dbtLW2mUAfFOGuHzouKk+clZGWNgp3SxkhzHsU1eD6hjUSoraVAsTh04
   H/DylsbEdEYW/Am+pmp2/nNUZdBvM9hoB68GnvTTcZ7NH7GeNb972ro4v
   mS5qjodgaeFMhfvA0WNuOd8USFmDMPJuhAwZYQzGHs5a+oiUvqCHEw6le
   FIde9iyzULsjd4FzLrdcDhzs3MYSw2lDtMSmnvhrvDg7jGsk9CIVkkH4m
   V/Vzj3N6odJD2tCg6sWtq9YlI4hR2Ipehb8QUpFIzG4B1UWUZBqIt7PFY
   Ay3d+SDYk33PuFxlYS/deDonmmI/oTJ+eXq19KqijBZ/tt8vI9LcoHiFX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="333455911"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; 
   d="scan'208";a="333455911"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 02:17:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="879029136"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; 
   d="scan'208";a="879029136"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 02:17:10 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id BD1A0123025;
        Thu, 25 May 2023 12:16:49 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1q2758-009kq7-KG; Thu, 25 May 2023 12:16:26 +0300
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
Subject: [RESEND PATCH v3 28/32] media: xilinx-vipp: Init async notifier after registering V4L2 device
Date:   Thu, 25 May 2023 12:16:11 +0300
Message-Id: <20230525091615.2324824-29-sakari.ailus@linux.intel.com>
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
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/xilinx/xilinx-vipp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/xilinx/xilinx-vipp.c b/drivers/media/platform/xilinx/xilinx-vipp.c
index a535a7584da0f..6bb426a25fe90 100644
--- a/drivers/media/platform/xilinx/xilinx-vipp.c
+++ b/drivers/media/platform/xilinx/xilinx-vipp.c
@@ -494,6 +494,8 @@ static int xvip_graph_init(struct xvip_composite_device *xdev)
 		goto done;
 	}
 
+	v4l2_async_nf_init(&xdev->notifier);
+
 	/* Parse the graph to extract a list of subdevice DT nodes. */
 	ret = xvip_graph_parse(xdev);
 	if (ret < 0) {
@@ -574,7 +576,6 @@ static int xvip_composite_probe(struct platform_device *pdev)
 
 	xdev->dev = &pdev->dev;
 	INIT_LIST_HEAD(&xdev->dmas);
-	v4l2_async_nf_init(&xdev->notifier);
 
 	ret = xvip_composite_v4l2_init(xdev);
 	if (ret < 0)
-- 
2.30.2

