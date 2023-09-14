Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 293387A0C91
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 20:18:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241581AbjINSSI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 14:18:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241578AbjINSSG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 14:18:06 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A96641FFC
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 11:18:02 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B31B71ABC;
        Thu, 14 Sep 2023 20:16:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694715388;
        bh=QICxH0WfWrFBYxziGkS9/UJYcgIfAhGBjZY8e5wtIhQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rFrSS7es2DHQ1YJqnWgzCDxY5Gf/a9G88FKcpzX8pYOEHFm3NUvTHltxIXojEuPmR
         KCPhPK7+fZTc/VlNH8CJbASDNE7Vcqe7Bn6YSWIMWopijhhc2OkWkfxxsUYkZQaqOo
         8JWD0HbSGzlVxlzxyVLF/5Ptdvz3puBKsqN6Kd4w=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Jason Chen <jason.z.chen@intel.com>
Subject: [PATCH 50/57] media: i2c: ov08x40: Drop system suspend and resume handlers
Date:   Thu, 14 Sep 2023 21:16:57 +0300
Message-ID: <20230914181704.4811-51-laurent.pinchart@ideasonboard.com>
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
 drivers/media/i2c/ov08x40.c | 40 -------------------------------------
 1 file changed, 40 deletions(-)

diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index 1ea402550837..b41b6866a0ab 100644
--- a/drivers/media/i2c/ov08x40.c
+++ b/drivers/media/i2c/ov08x40.c
@@ -2432,9 +2432,6 @@ struct ov08x40 {
 
 	/* Mutex for serialized access */
 	struct mutex mutex;
-
-	/* Streaming on/off */
-	bool streaming;
 };
 
 #define to_ov08x40(_sd)	container_of(_sd, struct ov08x40, sd)
@@ -2933,7 +2930,6 @@ static int ov08x40_set_stream(struct v4l2_subdev *sd, int enable)
 		pm_runtime_put(&client->dev);
 	}
 
-	ov08x->streaming = enable;
 	mutex_unlock(&ov08x->mutex);
 
 	return ret;
@@ -2946,37 +2942,6 @@ static int ov08x40_set_stream(struct v4l2_subdev *sd, int enable)
 	return ret;
 }
 
-static int __maybe_unused ov08x40_suspend(struct device *dev)
-{
-	struct v4l2_subdev *sd = dev_get_drvdata(dev);
-	struct ov08x40 *ov08x = to_ov08x40(sd);
-
-	if (ov08x->streaming)
-		ov08x40_stop_streaming(ov08x);
-
-	return 0;
-}
-
-static int __maybe_unused ov08x40_resume(struct device *dev)
-{
-	struct v4l2_subdev *sd = dev_get_drvdata(dev);
-	struct ov08x40 *ov08x = to_ov08x40(sd);
-	int ret;
-
-	if (ov08x->streaming) {
-		ret = ov08x40_start_streaming(ov08x);
-		if (ret)
-			goto error;
-	}
-
-	return 0;
-
-error:
-	ov08x40_stop_streaming(ov08x);
-	ov08x->streaming = false;
-	return ret;
-}
-
 /* Verify chip ID */
 static int ov08x40_identify_module(struct ov08x40 *ov08x)
 {
@@ -3290,10 +3255,6 @@ static void ov08x40_remove(struct i2c_client *client)
 	pm_runtime_set_suspended(&client->dev);
 }
 
-static const struct dev_pm_ops ov08x40_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(ov08x40_suspend, ov08x40_resume)
-};
-
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id ov08x40_acpi_ids[] = {
 	{"OVTI08F4"},
@@ -3306,7 +3267,6 @@ MODULE_DEVICE_TABLE(acpi, ov08x40_acpi_ids);
 static struct i2c_driver ov08x40_i2c_driver = {
 	.driver = {
 		.name = "ov08x40",
-		.pm = &ov08x40_pm_ops,
 		.acpi_match_table = ACPI_PTR(ov08x40_acpi_ids),
 	},
 	.probe = ov08x40_probe,
-- 
Regards,

Laurent Pinchart

