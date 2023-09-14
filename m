Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50EED7A0C81
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 20:17:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241493AbjINSRu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 14:17:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241430AbjINSRt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 14:17:49 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FCAE1FD5
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 11:17:45 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2EEDF87F3;
        Thu, 14 Sep 2023 20:16:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694715371;
        bh=C0ZRRQDS1YdWsph3HJTKLR6VusDDVzAvYZ+avHzOmtY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HGZ/Sj+kne6mLpDxb1wG6cayGS0rl87ffV17crxIC8bW9QsLaKdgMDsqKEd6FbU/j
         d33If8fQ9qYFCCwVILPTbDkemxk0wZ9MIGCW/LcCmLZ08/Z5dhdCCiKLH5+09rjERe
         Obv7XHhhqDCePNaNoq9uDxPuslcbXMY2AhD3wsfI=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH 37/57] media: i2c: hi556: Drop system suspend and resume handlers
Date:   Thu, 14 Sep 2023 21:16:44 +0300
Message-ID: <20230914181704.4811-38-laurent.pinchart@ideasonboard.com>
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
 drivers/media/i2c/hi556.c | 47 ---------------------------------------
 1 file changed, 47 deletions(-)

diff --git a/drivers/media/i2c/hi556.c b/drivers/media/i2c/hi556.c
index 2b00426c5826..e6e7049108e7 100644
--- a/drivers/media/i2c/hi556.c
+++ b/drivers/media/i2c/hi556.c
@@ -577,9 +577,6 @@ struct hi556 {
 	/* To serialize asynchronus callbacks */
 	struct mutex mutex;
 
-	/* Streaming on/off */
-	bool streaming;
-
 	/* True if the device has been identified */
 	bool identified;
 };
@@ -995,50 +992,11 @@ static int hi556_set_stream(struct v4l2_subdev *sd, int enable)
 		pm_runtime_put(&client->dev);
 	}
 
-	hi556->streaming = enable;
 	mutex_unlock(&hi556->mutex);
 
 	return ret;
 }
 
-static int __maybe_unused hi556_suspend(struct device *dev)
-{
-	struct v4l2_subdev *sd = dev_get_drvdata(dev);
-	struct hi556 *hi556 = to_hi556(sd);
-
-	mutex_lock(&hi556->mutex);
-	if (hi556->streaming)
-		hi556_stop_streaming(hi556);
-
-	mutex_unlock(&hi556->mutex);
-
-	return 0;
-}
-
-static int __maybe_unused hi556_resume(struct device *dev)
-{
-	struct v4l2_subdev *sd = dev_get_drvdata(dev);
-	struct hi556 *hi556 = to_hi556(sd);
-	int ret;
-
-	mutex_lock(&hi556->mutex);
-	if (hi556->streaming) {
-		ret = hi556_start_streaming(hi556);
-		if (ret)
-			goto error;
-	}
-
-	mutex_unlock(&hi556->mutex);
-
-	return 0;
-
-error:
-	hi556_stop_streaming(hi556);
-	hi556->streaming = 0;
-	mutex_unlock(&hi556->mutex);
-	return ret;
-}
-
 static int hi556_set_format(struct v4l2_subdev *sd,
 			    struct v4l2_subdev_state *sd_state,
 			    struct v4l2_subdev_format *fmt)
@@ -1328,10 +1286,6 @@ static int hi556_probe(struct i2c_client *client)
 	return ret;
 }
 
-static const struct dev_pm_ops hi556_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(hi556_suspend, hi556_resume)
-};
-
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id hi556_acpi_ids[] = {
 	{"INT3537"},
@@ -1344,7 +1298,6 @@ MODULE_DEVICE_TABLE(acpi, hi556_acpi_ids);
 static struct i2c_driver hi556_i2c_driver = {
 	.driver = {
 		.name = "hi556",
-		.pm = &hi556_pm_ops,
 		.acpi_match_table = ACPI_PTR(hi556_acpi_ids),
 	},
 	.probe = hi556_probe,
-- 
Regards,

Laurent Pinchart

