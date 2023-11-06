Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE0A17E1C02
	for <lists+linux-media@lfdr.de>; Mon,  6 Nov 2023 09:26:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231293AbjKFI0T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Nov 2023 03:26:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231271AbjKFI0Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Nov 2023 03:26:16 -0500
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EEEB1BF
        for <linux-media@vger.kernel.org>; Mon,  6 Nov 2023 00:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699259173; x=1730795173;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tUaMI7bzPoX1+UZAMe+yEwp5z7rs380tUkx3FkHrpyE=;
  b=XMzgJCHToovegH927wYAJYC3oM07UBrMko4+TVQeJb7MeQCfvr0a7CHU
   2EyYp5CYIjQ8EVpsZwiavNGwZAeu4ZW1Op/tx2QGsOAc0/b8f9n5U+CiF
   EkucLTnza1ia0WWgrMB9+h3Z4mDkLVi6tvVI9zkHDdrT+8p0dRNUAyHY7
   8Fwj9DOq2C/YsUgLiJ1pqkPU7MIOdF2qUNeSfKNeDvCwanBFCeD5pFaak
   rPbnK57yIbi2dOOrwmTWPW4owo5x6d+hpdB9virIUBAZnL1eq46V1sla4
   GDEwx6Vs2/dB+LbjnqZ4PA8s/hBGdMBTOqCFtkeS2acKzGE/osBEp4Xy0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="2213875"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="2213875"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 00:26:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="762254761"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="762254761"
Received: from icg-kernel3.bj.intel.com ([172.16.126.174])
  by orsmga002.jf.intel.com with ESMTP; 06 Nov 2023 00:26:11 -0800
From:   bingbu.cao@intel.com
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com
Cc:     hdegoede@redhat.com, bingbu.cao@intel.com,
        bingbu.cao@linux.intel.com
Subject: [PATCH 1/4] media: imx355: Enable runtime PM before registering async sub-device
Date:   Mon,  6 Nov 2023 16:35:13 +0800
Message-ID: <20231106083516.763184-2-bingbu.cao@intel.com>
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
 drivers/media/i2c/imx355.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 9c79ae8dc842..fe528bb72409 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -1788,21 +1788,24 @@ static int imx355_probe(struct i2c_client *client)
 		goto error_handler_free;
 	}
 
-	ret = v4l2_async_register_subdev_sensor(&imx355->sd);
-	if (ret < 0)
-		goto error_media_entity;
-
 	/*
 	 * Device is already turned on by i2c-core with ACPI domain PM.
 	 * Enable runtime PM and turn off the device.
 	 */
 	pm_runtime_set_active(&client->dev);
 	pm_runtime_enable(&client->dev);
+
+	ret = v4l2_async_register_subdev_sensor(&imx355->sd);
+	if (ret < 0)
+		goto error_media_entity_runtime_pm;
+
 	pm_runtime_idle(&client->dev);
 
 	return 0;
 
-error_media_entity:
+error_media_entity_runtime_pm:
+	pm_runtime_disable(&client->dev);
+	pm_runtime_set_suspended(&client->dev);
 	media_entity_cleanup(&imx355->sd.entity);
 
 error_handler_free:
-- 
2.42.0

