Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FB4E764624
	for <lists+linux-media@lfdr.de>; Thu, 27 Jul 2023 07:48:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232250AbjG0Fs5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jul 2023 01:48:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232850AbjG0FsU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jul 2023 01:48:20 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE59B30DC
        for <linux-media@vger.kernel.org>; Wed, 26 Jul 2023 22:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690436858; x=1721972858;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vW+FY5Svw3aiq+83LXB9xN87ySvPLAbsmeTJz5TFfmE=;
  b=Mey+FyXPe6R9xYN1qDPjG+TfThGmZ0VKqvvJRrf1nSciAzHekhWZayob
   BMpNUVhwPSmu41Ix2V81UMlL0ttCabZSaZDEK9ZRpyydp7OjARafDxS7V
   Hx1EfMNQxPtbjE+1gOzqd+inF56xc3EX77czpYvYDu+3qslNsNe/JmJ04
   YHdk8sGn8bg+qao8hbKeiPpfUO/4ALW6iN+COLRsmC1MyDw7I0WHqVE/E
   y6VPbvxLM0aari0PE1MRIAyJ97x11DXDKOhqLLRrtEJWFIZxdzj7UffNG
   Vo4ivEislb7GyLjvmIGLG60qHOOpi/LdkCprtHvT531fw85tsw2jmhkO7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="399151013"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="399151013"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 22:44:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="840584130"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="840584130"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 22:44:40 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 2F819122199;
        Thu, 27 Jul 2023 08:44:19 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qOtmE-004xsu-1J;
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
Subject: [PATCH v6 34/38] media: xilinx-vipp: Init async notifier after registering V4L2 device
Date:   Thu, 27 Jul 2023 08:42:51 +0300
Message-Id: <20230727054255.1183255-35-sakari.ailus@linux.intel.com>
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
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Tested-by: Philipp Zabel <p.zabel@pengutronix.de> # imx6qp
Tested-by: Niklas Söderlund <niklas.soderlund@ragnatech.se> # rcar + adv746x
Tested-by: Aishwarya Kothari <aishwarya.kothari@toradex.com> # Apalis i.MX6Q with TC358743
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> # Renesas RZ/G2L SMARC
---
 drivers/media/platform/xilinx/xilinx-vipp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/xilinx/xilinx-vipp.c b/drivers/media/platform/xilinx/xilinx-vipp.c
index a535a7584da0..6bb426a25fe9 100644
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

