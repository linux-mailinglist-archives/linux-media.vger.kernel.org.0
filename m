Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A20A739FDB
	for <lists+linux-media@lfdr.de>; Thu, 22 Jun 2023 13:41:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230142AbjFVLlm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Jun 2023 07:41:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229832AbjFVLlk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Jun 2023 07:41:40 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E01A71FEF
        for <linux-media@vger.kernel.org>; Thu, 22 Jun 2023 04:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687434092; x=1718970092;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GvBb1F6wD9WVOvPsMBDy1Scg3V/bmre86k0ltHCF3rM=;
  b=Y34gAP+uNbPAgPNJyWTWBY08xnDrWECKkDTUo1ETePAqU3yVhwijQ9sf
   urT1Lbxh/aY8oEzjZg7ByUMGzAg6K4pnTFQfavEY8zU1fG8Vg+L6tYxRB
   246qODMoj5PKAoa2nr58xwUYNTh+JjePQu+SYrCnrs2hwfhnEVeeL81qB
   Hd8JHNVFX0HA8Vg5Kx4VosSMVeH/IAO2H9Fe0aEIZ2w19KhksVEgybSgj
   A2tsO3NqQ6Cz2zR46rUvLEHf4nGRwpH1gAPLBybAZ368G6JuELRFBGmZ5
   4C1lynaHI/yGfLv+gYvvLi8cphVdqwRVqM8MBBgZ5lXJNt1LVrPVdbaCv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="340800436"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; 
   d="scan'208";a="340800436"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 04:41:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="839013554"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; 
   d="scan'208";a="839013554"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 04:41:12 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 6832B120EF6;
        Thu, 22 Jun 2023 14:40:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qCIg3-003oUb-15;
        Thu, 22 Jun 2023 14:40:39 +0300
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
Subject: [PATCH v4 34/38] media: xilinx-vipp: Init async notifier after registering V4L2 device
Date:   Thu, 22 Jun 2023 14:40:24 +0300
Message-Id: <20230622114028.908825-35-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230622114028.908825-1-sakari.ailus@linux.intel.com>
References: <20230622114028.908825-1-sakari.ailus@linux.intel.com>
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

Initialise the V4L2 async notifier after registering the V4L2 device, just
before parsing DT for async sub-devices. This way the device can be made
available to the V4L2 async framework from the notifier init time onwards.
A subsequent patch will add struct v4l2_device as an argument to
v4l2_async_nf_init().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Tested-by: Philipp Zabel <p.zabel@pengutronix.de> # imx6qp
Tested_by: Niklas Söderlund <niklas.soderlund@ragnatech.se> # rcar + adv746x
Tested-by: Aishwarya Kothari <aishwarya.kothari@toradex.com> # Apalis i.MX6Q with TC358743
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
2.39.2

