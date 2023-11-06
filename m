Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81EEA7E1C1D
	for <lists+linux-media@lfdr.de>; Mon,  6 Nov 2023 09:26:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231373AbjKFI0t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Nov 2023 03:26:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231375AbjKFI01 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Nov 2023 03:26:27 -0500
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0D5510D1
        for <linux-media@vger.kernel.org>; Mon,  6 Nov 2023 00:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699259179; x=1730795179;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/ocIzLuNE5ctknnhv2NHU9tTv83wbIB9zX00gx60eUE=;
  b=j3tbj56rnKAi9bYoRAHuZLBvRZFNRV/KtIGsXgZUNApXmCey/mKQNGUW
   Ny0819DWIZArTVWAJW/bw6d6G+kKP4cz8h5yVsqqDBKWUtBRnhj8vOuN1
   l4bMWBLsDhEjbRtXVeCTd9Zw6JKby6kIIA+muKxi2n5K2hK/iw6kz5CMI
   TMKQXZtsBW4+5VBO0r7QB/Flglvhi92XS/T6aKDv9nSpcpPKzwQcbxH1p
   ZytqGgnIleFAZ1QvKg1c8g/6MlpU7uA+XHj0GaEfopa4IrM4t9Tx/VC0N
   xlHNdCR/42wexLz7YBhAWd3KHjTKNmDalw+JT4+/DttJ2UbRSIgEqz/aS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="2213889"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="2213889"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 00:26:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="762254788"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="762254788"
Received: from icg-kernel3.bj.intel.com ([172.16.126.174])
  by orsmga002.jf.intel.com with ESMTP; 06 Nov 2023 00:26:16 -0800
From:   bingbu.cao@intel.com
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com
Cc:     hdegoede@redhat.com, bingbu.cao@intel.com,
        bingbu.cao@linux.intel.com
Subject: [PATCH 4/4] media: ov9734: Enable runtime PM before registering async sub-device
Date:   Mon,  6 Nov 2023 16:35:16 +0800
Message-ID: <20231106083516.763184-5-bingbu.cao@intel.com>
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
 drivers/media/i2c/ov9734.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/ov9734.c b/drivers/media/i2c/ov9734.c
index b6244772bc59..1a241b2b6099 100644
--- a/drivers/media/i2c/ov9734.c
+++ b/drivers/media/i2c/ov9734.c
@@ -984,24 +984,27 @@ static int ov9734_probe(struct i2c_client *client)
 		goto probe_error_v4l2_ctrl_handler_free;
 	}
 
-	ret = v4l2_async_register_subdev_sensor(&ov9734->sd);
-	if (ret < 0) {
-		dev_err(&client->dev, "failed to register V4L2 subdev: %d",
-			ret);
-		goto probe_error_media_entity_cleanup;
-	}
-
 	/*
 	 * Device is already turned on by i2c-core with ACPI domain PM.
 	 * Enable runtime PM and turn off the device.
 	 */
 	pm_runtime_set_active(&client->dev);
 	pm_runtime_enable(&client->dev);
+
+	ret = v4l2_async_register_subdev_sensor(&ov9734->sd);
+	if (ret < 0) {
+		dev_err(&client->dev, "failed to register V4L2 subdev: %d",
+			ret);
+		goto probe_error_media_entity_cleanup_pm;
+	}
+
 	pm_runtime_idle(&client->dev);
 
 	return 0;
 
-probe_error_media_entity_cleanup:
+probe_error_media_entity_cleanup_pm:
+	pm_runtime_disable(&client->dev);
+	pm_runtime_set_suspended(&client->dev);
 	media_entity_cleanup(&ov9734->sd.entity);
 
 probe_error_v4l2_ctrl_handler_free:
-- 
2.42.0

