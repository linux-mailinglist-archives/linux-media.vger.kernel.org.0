Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07DE77A0C92
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 20:18:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241594AbjINSSJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 14:18:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241580AbjINSSI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 14:18:08 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F192B1FFF
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 11:18:03 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1660D87E3;
        Thu, 14 Sep 2023 20:16:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694715390;
        bh=O902bjCwtHM6V8caEVi13JONVMHxP2kqA85j5l+Ji8w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZIrvEvJfnr8hQVrDtLPRTQDZox0yi2Ui+wjo9IVmsu/sAEugmEfjeTqf06WWzTLZU
         KWrvXARllJLPVyI8a+IylELCoMy92x4zKDMc2ycEnkQZuZXg7JVWcK857ruhLCTMhD
         Lfe/P9PWWEqllzheP9086Lsbchx4Rv2kNhjeMbrY=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH 51/57] media: i2c: ov13858: Drop system suspend and resume handlers
Date:   Thu, 14 Sep 2023 21:16:58 +0300
Message-ID: <20230914181704.4811-52-laurent.pinchart@ideasonboard.com>
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
 drivers/media/i2c/ov13858.c | 40 -------------------------------------
 1 file changed, 40 deletions(-)

diff --git a/drivers/media/i2c/ov13858.c b/drivers/media/i2c/ov13858.c
index b90ce338a47a..4c419014dd7b 100644
--- a/drivers/media/i2c/ov13858.c
+++ b/drivers/media/i2c/ov13858.c
@@ -1044,9 +1044,6 @@ struct ov13858 {
 
 	/* Mutex for serialized access */
 	struct mutex mutex;
-
-	/* Streaming on/off */
-	bool streaming;
 };
 
 #define to_ov13858(_sd)	container_of(_sd, struct ov13858, sd)
@@ -1485,7 +1482,6 @@ static int ov13858_set_stream(struct v4l2_subdev *sd, int enable)
 		pm_runtime_put(&client->dev);
 	}
 
-	ov13858->streaming = enable;
 	mutex_unlock(&ov13858->mutex);
 
 	return ret;
@@ -1498,37 +1494,6 @@ static int ov13858_set_stream(struct v4l2_subdev *sd, int enable)
 	return ret;
 }
 
-static int __maybe_unused ov13858_suspend(struct device *dev)
-{
-	struct v4l2_subdev *sd = dev_get_drvdata(dev);
-	struct ov13858 *ov13858 = to_ov13858(sd);
-
-	if (ov13858->streaming)
-		ov13858_stop_streaming(ov13858);
-
-	return 0;
-}
-
-static int __maybe_unused ov13858_resume(struct device *dev)
-{
-	struct v4l2_subdev *sd = dev_get_drvdata(dev);
-	struct ov13858 *ov13858 = to_ov13858(sd);
-	int ret;
-
-	if (ov13858->streaming) {
-		ret = ov13858_start_streaming(ov13858);
-		if (ret)
-			goto error;
-	}
-
-	return 0;
-
-error:
-	ov13858_stop_streaming(ov13858);
-	ov13858->streaming = false;
-	return ret;
-}
-
 /* Verify chip ID */
 static int ov13858_identify_module(struct ov13858 *ov13858)
 {
@@ -1783,10 +1748,6 @@ static const struct i2c_device_id ov13858_id_table[] = {
 
 MODULE_DEVICE_TABLE(i2c, ov13858_id_table);
 
-static const struct dev_pm_ops ov13858_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(ov13858_suspend, ov13858_resume)
-};
-
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id ov13858_acpi_ids[] = {
 	{"OVTID858"},
@@ -1799,7 +1760,6 @@ MODULE_DEVICE_TABLE(acpi, ov13858_acpi_ids);
 static struct i2c_driver ov13858_i2c_driver = {
 	.driver = {
 		.name = "ov13858",
-		.pm = &ov13858_pm_ops,
 		.acpi_match_table = ACPI_PTR(ov13858_acpi_ids),
 	},
 	.probe = ov13858_probe,
-- 
Regards,

Laurent Pinchart

