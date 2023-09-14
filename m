Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EF6B7A0C93
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 20:18:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241561AbjINSSK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 14:18:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241580AbjINSSJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 14:18:09 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FB001FFD
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 11:18:05 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 84156881C;
        Thu, 14 Sep 2023 20:16:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694715391;
        bh=6tNY/T7NAh0z25fsMwzMoAKabTTFOVhsMK3J2+JmLnc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IVjSl2w2sp4dmD+DE/qWke2/nZ11NEsz+asTvw14poc979VDHZX91X2adbULH/p1g
         DsQ0mn4oGN18RDNHWUTWmKpjsDSw4cxb2zjlB8H8VuhMlWdb0M+Y5uHPKSx2bKYzU7
         mVRTNgRtb+NRWgvhj0iLUeOvOQum408k11v5RpeA=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH 52/57] media: i2c: ov2740: Drop system suspend and resume handlers
Date:   Thu, 14 Sep 2023 21:16:59 +0300
Message-ID: <20230914181704.4811-53-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230914181704.4811-1-laurent.pinchart@ideasonboard.com>
References: <20230914181704.4811-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Stopping streaming on a camera pipeline at system suspend time, and
restarting it at system resume time, requires coordinated action between
the bridge driver and the camera sensor driver. This is handled by the
bridge driver calling the sensor's .s_stream() handler at system suspend
and resume time. There is thus no need for the sensor to independently
implement system sleep PM operations. Drop them.

The streaming field of the driver's private structure is now unused,
drop it as well.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ov2740.c | 42 --------------------------------------
 1 file changed, 42 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 59356dd9afd8..3a9700fbbe8c 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -339,9 +339,6 @@ struct ov2740 {
 	/* To serialize asynchronus callbacks */
 	struct mutex mutex;
 
-	/* Streaming on/off */
-	bool streaming;
-
 	/* NVM data inforamtion */
 	struct nvm_data *nvm;
 
@@ -813,47 +810,11 @@ static int ov2740_set_stream(struct v4l2_subdev *sd, int enable)
 		pm_runtime_put(&client->dev);
 	}
 
-	ov2740->streaming = enable;
 	mutex_unlock(&ov2740->mutex);
 
 	return ret;
 }
 
-static int ov2740_suspend(struct device *dev)
-{
-	struct v4l2_subdev *sd = dev_get_drvdata(dev);
-	struct ov2740 *ov2740 = to_ov2740(sd);
-
-	mutex_lock(&ov2740->mutex);
-	if (ov2740->streaming)
-		ov2740_stop_streaming(ov2740);
-
-	mutex_unlock(&ov2740->mutex);
-
-	return 0;
-}
-
-static int ov2740_resume(struct device *dev)
-{
-	struct v4l2_subdev *sd = dev_get_drvdata(dev);
-	struct ov2740 *ov2740 = to_ov2740(sd);
-	int ret = 0;
-
-	mutex_lock(&ov2740->mutex);
-	if (!ov2740->streaming)
-		goto exit;
-
-	ret = ov2740_start_streaming(ov2740);
-	if (ret) {
-		ov2740->streaming = false;
-		ov2740_stop_streaming(ov2740);
-	}
-
-exit:
-	mutex_unlock(&ov2740->mutex);
-	return ret;
-}
-
 static int ov2740_set_format(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_state *sd_state,
 			     struct v4l2_subdev_format *fmt)
@@ -1197,8 +1158,6 @@ static int ov2740_probe(struct i2c_client *client)
 	return ret;
 }
 
-static DEFINE_SIMPLE_DEV_PM_OPS(ov2740_pm_ops, ov2740_suspend, ov2740_resume);
-
 static const struct acpi_device_id ov2740_acpi_ids[] = {
 	{"INT3474"},
 	{}
@@ -1209,7 +1168,6 @@ MODULE_DEVICE_TABLE(acpi, ov2740_acpi_ids);
 static struct i2c_driver ov2740_i2c_driver = {
 	.driver = {
 		.name = "ov2740",
-		.pm = pm_sleep_ptr(&ov2740_pm_ops),
 		.acpi_match_table = ov2740_acpi_ids,
 	},
 	.probe = ov2740_probe,
-- 
Regards,

Laurent Pinchart

