Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C8167E1C0E
	for <lists+linux-media@lfdr.de>; Mon,  6 Nov 2023 09:26:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231386AbjKFI01 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Nov 2023 03:26:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231296AbjKFI0T (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Nov 2023 03:26:19 -0500
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65E88D77
        for <linux-media@vger.kernel.org>; Mon,  6 Nov 2023 00:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699259175; x=1730795175;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DfdCOkOYeurSOWTAfrPVfToJYHOkhnC0vNoby3RSlv8=;
  b=KGG3oOJWY4z7x4Z85kLpWPv4B9zu9LAK3dGKOp2pu7Zw2pCkLm4WWuVC
   tFj+blIafY8y1G+ORp/jc3k3Q7YfIfaxWh0pfD2dCpfxaLvaJQGCfjz/+
   43Kjx+aen/3qKSaSZv+zOslQf+nByo4vl1+o7JCGt61EZkYfyE4J2MkCD
   9lsJOefWB/Fp4UKGwZb601g3vJ7LZBiO9rSLDcokrB6FMacm04K9A8D4I
   e7+l/A9BboWLN7q11qkS3wmKNLr1EP6DHQui7dw8X+fDzWY5B8F1IYEDa
   dx1Z7uI+w9DI0xfr2dwBohbQkaLZOJ3ACBxJX9DJLSLpTXj2Ebn3NDi9Q
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="2213879"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="2213879"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 00:26:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="762254772"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="762254772"
Received: from icg-kernel3.bj.intel.com ([172.16.126.174])
  by orsmga002.jf.intel.com with ESMTP; 06 Nov 2023 00:26:13 -0800
From:   bingbu.cao@intel.com
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com
Cc:     hdegoede@redhat.com, bingbu.cao@intel.com,
        bingbu.cao@linux.intel.com
Subject: [PATCH 2/4] media: ov01a10: Enable runtime PM before registering async sub-device
Date:   Mon,  6 Nov 2023 16:35:14 +0800
Message-ID: <20231106083516.763184-3-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231106083516.763184-1-bingbu.cao@intel.com>
References: <20231106083516.763184-1-bingbu.cao@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Bingbu Cao <bingbu.cao@intel.com>

As the sensor device maybe accessible right after its async sub-device is
registered, such as ipu-bridge will try to power up sensor by sensor's client
device's runtime PM from the async notifier callback, if runtime PM is not
enabled, it will fail.

So runtime PM should be ready before its async sub-device is registered
and accessible by others.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/media/i2c/ov01a10.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index 2b9e1b3a3bf4..07691c8ac842 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -953,17 +953,20 @@ static int ov01a10_probe(struct i2c_client *client)
 		goto err_media_entity_cleanup;
 	}
 
+	pm_runtime_enable(dev);
 	ret = v4l2_async_register_subdev_sensor(&ov01a10->sd);
 	if (ret < 0) {
 		dev_err(dev, "Failed to register subdev: %d\n", ret);
-		goto err_media_entity_cleanup;
+		goto err_pm_disable;
 	}
 
-	pm_runtime_enable(dev);
 	pm_runtime_idle(dev);
 
 	return 0;
 
+err_pm_disable:
+	pm_runtime_disable(dev);
+
 err_media_entity_cleanup:
 	media_entity_cleanup(&ov01a10->sd.entity);
 
-- 
2.42.0

