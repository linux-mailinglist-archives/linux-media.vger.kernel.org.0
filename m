Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE50D70F526
	for <lists+linux-media@lfdr.de>; Wed, 24 May 2023 13:25:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232405AbjEXLZe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 May 2023 07:25:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231952AbjEXLZe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 May 2023 07:25:34 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0B589B
        for <linux-media@vger.kernel.org>; Wed, 24 May 2023 04:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684927525; x=1716463525;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mfH8JM6GmsDikhgOq+dswwN7kCZ1rdwKGOycxJG3JWc=;
  b=Vvh3Cn7v/TN+XAE21HUuEifpsua4DUcMWgEyFfyPyfCj/ax0lBzguoxP
   2RpiSUgbSGZVWAR4cJ81dU9fbmkS2PtTZd2ef22S2r6Ph7Sd5aCqYR1TV
   4+ZKVJFUPcdQNVMHJfwm+fbZdq6AQiVZVww7cAIHbcloJWEiJBuKfUq07
   VW8GggFv7LDz5G1rLvN3GUP7lLBO0DVT+R0ATzork9CNBXn9xacizfCeH
   x/tC4F++KecZm4lkPw3yQLXJifTOnznRuvzgxs+5WOH7daDQfdTTgiZ2O
   Tmm8R8YqkF4gL/CvHyAu/w0jTHG8UbVwWFxp+bqN8xExZrA8cm5y4E1sg
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="356758421"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; 
   d="scan'208";a="356758421"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2023 04:24:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="816540633"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; 
   d="scan'208";a="816540633"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2023 04:24:33 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id DFE85123023;
        Wed, 24 May 2023 14:24:21 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1q1mb2-008z7j-A1; Wed, 24 May 2023 14:24:00 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, bingbu.cao@intel.com,
        niklas.soderlund@ragnatech.se
Subject: [PATCH v3 30/32] media: qcom: Initialise V4L2 async notifier later
Date:   Wed, 24 May 2023 14:23:47 +0300
Message-Id: <20230524112349.2141396-31-sakari.ailus@linux.intel.com>
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

Initialise V4L2 async notifier and parse DT for async sub-devices later,
just before registering the notifier. This way the V4L2 device has been
registered before initialising the notifier which makes it possible to
use it for debug prints.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/platform/qcom/camss/camss.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 006855bf076b7..b89e2bb5b505e 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1615,14 +1615,6 @@ static int camss_probe(struct platform_device *pdev)
 	if (!camss->vfe)
 		return -ENOMEM;
 
-	v4l2_async_nf_init(&camss->notifier);
-
-	num_subdevs = camss_of_parse_ports(camss);
-	if (num_subdevs < 0) {
-		ret = num_subdevs;
-		goto err_cleanup;
-	}
-
 	ret = camss_icc_get(camss);
 	if (ret < 0)
 		goto err_cleanup;
@@ -1648,9 +1640,17 @@ static int camss_probe(struct platform_device *pdev)
 		goto err_cleanup;
 	}
 
+	v4l2_async_nf_init(&camss->notifier);
+
+	num_subdevs = camss_of_parse_ports(camss);
+	if (num_subdevs < 0) {
+		ret = num_subdevs;
+		goto err_cleanup;
+	}
+
 	ret = camss_register_entities(camss);
 	if (ret < 0)
-		goto err_register_entities;
+		goto err_cleanup;
 
 	if (num_subdevs) {
 		camss->notifier.ops = &camss_subdev_notifier_ops;
@@ -1691,9 +1691,8 @@ static int camss_probe(struct platform_device *pdev)
 
 err_register_subdevs:
 	camss_unregister_entities(camss);
-err_register_entities:
-	v4l2_device_unregister(&camss->v4l2_dev);
 err_cleanup:
+	v4l2_device_unregister(&camss->v4l2_dev);
 	v4l2_async_nf_cleanup(&camss->notifier);
 
 	return ret;
-- 
2.30.2

