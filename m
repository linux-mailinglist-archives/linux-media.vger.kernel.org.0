Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50A6F7DDEA2
	for <lists+linux-media@lfdr.de>; Wed,  1 Nov 2023 10:42:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232235AbjKAJmu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Nov 2023 05:42:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232209AbjKAJms (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Nov 2023 05:42:48 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D13B310C
        for <linux-media@vger.kernel.org>; Wed,  1 Nov 2023 02:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698831765; x=1730367765;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yR9gN0EVIGUzb8o2gxd10R4+RWlnyDrs4Ww0/4zLLwc=;
  b=iVdbqBrgAuBa4Q3y0xI0VYCn5Ud8rQLzkualMQZyx6A9vJeVN48TE5Li
   4IKRshqvOKaUACJFpv42d/pWKfAiwBkltOO8CdjjM1L/ep/DrEbIGNG56
   f2eoMHqw+uouWWzNM9Jp061aBI4qUbPztgOymoxpw7Iwf8biIPL9ngazh
   SjphDU3Idgc5e0NyaCyP0C3lF5StCaaNABi16E9Egg6l5gRT2f9/8a9dB
   POK+/OxTQlRDy+VsVEJIaRzE1W8c4Z4K+9CacCfgi+UT7Ck9CwwMSvqbQ
   tFfTSoRspLdoY/ouZRVXHv/j2e6D0TAVx3+an6KhkywrXqhZTL/Cy3Zmy
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="368676331"
X-IronPort-AV: E=Sophos;i="6.03,267,1694761200"; 
   d="scan'208";a="368676331"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2023 02:42:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="764522928"
X-IronPort-AV: E=Sophos;i="6.03,267,1694761200"; 
   d="scan'208";a="764522928"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2023 02:42:44 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id ACBF0120797;
        Wed,  1 Nov 2023 11:42:41 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     "Cao, Bingbu" <bingbu.cao@linux.intel.com>
Subject: [PATCH 1/1] media: imx319: Enable runtime PM before registering async sub-device
Date:   Wed,  1 Nov 2023 11:42:41 +0200
Message-Id: <20231101094241.1149656-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As the sensor may be accessible right after its async sub-device is
registered, enable runtime PM before doing so.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/imx319.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/imx319.c b/drivers/media/i2c/imx319.c
index 5378f607f340..f8bce161318d 100644
--- a/drivers/media/i2c/imx319.c
+++ b/drivers/media/i2c/imx319.c
@@ -2464,19 +2464,21 @@ static int imx319_probe(struct i2c_client *client)
 		goto error_handler_free;
 	}
 
-	ret = v4l2_async_register_subdev_sensor(&imx319->sd);
-	if (ret < 0)
-		goto error_media_entity;
-
 	/* Set the device's state to active if it's in D0 state. */
 	if (full_power)
 		pm_runtime_set_active(&client->dev);
 	pm_runtime_enable(&client->dev);
 	pm_runtime_idle(&client->dev);
 
+	ret = v4l2_async_register_subdev_sensor(&imx319->sd);
+	if (ret < 0)
+		goto error_media_entity_pm;
+
 	return 0;
 
-error_media_entity:
+error_media_entity_pm:
+	pm_runtime_disable(&client->dev);
+	pm_runtime_set_suspended(&client->dev);
 	media_entity_cleanup(&imx319->sd.entity);
 
 error_handler_free:
-- 
2.39.2

