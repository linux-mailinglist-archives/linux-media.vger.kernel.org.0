Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B2D870F51E
	for <lists+linux-media@lfdr.de>; Wed, 24 May 2023 13:25:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231882AbjEXLZC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 May 2023 07:25:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234790AbjEXLZB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 May 2023 07:25:01 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 625F3195
        for <linux-media@vger.kernel.org>; Wed, 24 May 2023 04:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684927493; x=1716463493;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OTutRpmrnvsgBz74xZsS8El+m5YwHhPnVgYvJwqT64Y=;
  b=Ip1qSQDk1e085WIkToGAgRnyxiwowbF43huYfxA5AYNZZq1i+jb0s5u5
   N5uG9um9dDYOqwlGEKxCowO2z71wRldJoRS8ru9vb1XE3qIWr+esFGx5R
   lCWDX6cxPbwK6Sop76xICfbfk0J0OKZI82MRNkwUBEl9Yc09uZ+WRxk89
   JptGA2pUSoXP2446KBbeBBDsxRX9m8HJxPLX3aMPSA12c8tJZwmBWgrZF
   VdlSc+Ky+W+ExmE3+UDavgRovvvqXLzTkZWC+7JDAXfyaVmessJeGusoM
   pop3/USgczuL/guml53e6272+b9E+YxnJUU0Bq1rzXabRx5N+i30FPIXH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="356758334"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; 
   d="scan'208";a="356758334"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2023 04:24:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="816540626"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; 
   d="scan'208";a="816540626"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2023 04:24:33 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id D403612300F;
        Wed, 24 May 2023 14:24:21 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1q1mb2-008z7c-8v; Wed, 24 May 2023 14:24:00 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, bingbu.cao@intel.com,
        niklas.soderlund@ragnatech.se
Subject: [PATCH v3 28/32] media: xilinx-vipp: Init async notifier after registering V4L2 device
Date:   Wed, 24 May 2023 14:23:45 +0300
Message-Id: <20230524112349.2141396-29-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230524112349.2141396-1-sakari.ailus@linux.intel.com>
References: <20230524112349.2141396-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
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

