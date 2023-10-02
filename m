Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C2207B50B6
	for <lists+linux-media@lfdr.de>; Mon,  2 Oct 2023 12:56:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236584AbjJBK4d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Oct 2023 06:56:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236580AbjJBK4W (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Oct 2023 06:56:22 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEE70B4
        for <linux-media@vger.kernel.org>; Mon,  2 Oct 2023 03:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696244179; x=1727780179;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=d7jw3b0DNN63LkqKQzz764RJSTdovn7U9rpsVTqOjSY=;
  b=OVMRlKZRIE2xbLmnUsquj1ISGVJOfoHdKgEvnVe/19vuPdBAP8BTHuMe
   Bcr5aGfR96K7KBE3CUXIokFkTyZVFw24YAoYdQXwc1obmnb2xOmfEuinx
   O7yeXsyU4KZC2MsLzHyZSVmxa7AaXdmK88CSoCDI+WN6FfR+ujNhG54QV
   9lbfX++pvLo4L42DrReCU5JUrpHv+qfBxQmtBY2vwwBlUdNawJRSaIePI
   gczSwNcvXs9hp+QvkzaO+pasf8pWm916JFzRC5lgSZ1DBcDe0qeqb1VmF
   SuikHlIl8sq/7CdeSIpk7e/YMX6Cbo72eLs31vJ/xTZnB65FOgpjMe4Ta
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="379896388"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="379896388"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 03:56:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="816251192"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="816251192"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 03:56:17 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id DB33011F967;
        Mon,  2 Oct 2023 13:56:13 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Martin Kepplinger <martink@posteo.de>
Subject: [PATCH v7 12/19] media: ov2740: Enable runtime PM before registering the async subdev
Date:   Mon,  2 Oct 2023 13:55:50 +0300
Message-Id: <20231002105557.28972-13-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231002105557.28972-1-sakari.ailus@linux.intel.com>
References: <20231002105557.28972-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Enable runtime PM before registering the async subdev as the driver UAPI
may become accessible immediately after the registration. Runtime PM needs
to be enabled by that time.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ov2740.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 3a9700fbbe8c..6d5fb2789dc6 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1130,6 +1130,12 @@ static int ov2740_probe(struct i2c_client *client)
 		goto probe_error_v4l2_ctrl_handler_free;
 	}
 
+	/* Set the device's state to active if it's in D0 state. */
+	if (full_power)
+		pm_runtime_set_active(&client->dev);
+	pm_runtime_enable(&client->dev);
+	pm_runtime_idle(&client->dev);
+
 	ret = v4l2_async_register_subdev_sensor(&ov2740->sd);
 	if (ret < 0) {
 		dev_err_probe(dev, ret, "failed to register V4L2 subdev\n");
@@ -1140,16 +1146,12 @@ static int ov2740_probe(struct i2c_client *client)
 	if (ret)
 		dev_warn(&client->dev, "register nvmem failed, ret %d\n", ret);
 
-	/* Set the device's state to active if it's in D0 state. */
-	if (full_power)
-		pm_runtime_set_active(&client->dev);
-	pm_runtime_enable(&client->dev);
-	pm_runtime_idle(&client->dev);
-
 	return 0;
 
 probe_error_media_entity_cleanup:
 	media_entity_cleanup(&ov2740->sd.entity);
+	pm_runtime_disable(&client->dev);
+	pm_runtime_set_suspended(&client->dev);
 
 probe_error_v4l2_ctrl_handler_free:
 	v4l2_ctrl_handler_free(ov2740->sd.ctrl_handler);
-- 
2.39.2

