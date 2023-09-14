Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C35157A0C8A
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 20:17:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241503AbjINSSB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 14:18:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241500AbjINSR7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 14:17:59 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC1F91FFD
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 11:17:55 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DF8EB15EF;
        Thu, 14 Sep 2023 20:16:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694715382;
        bh=0Au3SryVgTwQ0w9jJztrtnVFU+8xED4XLlheAsV/7dk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZytMWyQ+CpW0c93Xh6t45R5D1JjFcuptOb36dOFJzfo7lmJMKsCbEveYZsmyNFGV9
         Nn/SQvdoJZM1TUNqsNoOY0nPqvw6AEbqJdPFmPxzGnP2uhBPAHlA6uFDSBzxMhZxw/
         /t/wY31NpZREmNpFs1FV2uzAO7h1iylLNz9Bf5Qg=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Tianshu Qiu <tian.shu.qiu@intel.com>
Subject: [PATCH 45/57] media: i2c: imx355: Drop system suspend and resume handlers
Date:   Thu, 14 Sep 2023 21:16:52 +0300
Message-ID: <20230914181704.4811-46-laurent.pinchart@ideasonboard.com>
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
 drivers/media/i2c/imx355.c | 41 --------------------------------------
 1 file changed, 41 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 43c09941704e..9c58c1a80cba 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -123,9 +123,6 @@ struct imx355 {
 	 * Protect access to sensor v4l2 controls.
 	 */
 	struct mutex mutex;
-
-	/* Streaming on/off */
-	bool streaming;
 };
 
 static const struct imx355_reg imx355_global_regs[] = {
@@ -1454,8 +1451,6 @@ static int imx355_set_stream(struct v4l2_subdev *sd, int enable)
 		pm_runtime_put(&client->dev);
 	}
 
-	imx355->streaming = enable;
-
 	/* vflip and hflip cannot change during streaming */
 	__v4l2_ctrl_grab(imx355->vflip, enable);
 	__v4l2_ctrl_grab(imx355->hflip, enable);
@@ -1472,37 +1467,6 @@ static int imx355_set_stream(struct v4l2_subdev *sd, int enable)
 	return ret;
 }
 
-static int __maybe_unused imx355_suspend(struct device *dev)
-{
-	struct v4l2_subdev *sd = dev_get_drvdata(dev);
-	struct imx355 *imx355 = to_imx355(sd);
-
-	if (imx355->streaming)
-		imx355_stop_streaming(imx355);
-
-	return 0;
-}
-
-static int __maybe_unused imx355_resume(struct device *dev)
-{
-	struct v4l2_subdev *sd = dev_get_drvdata(dev);
-	struct imx355 *imx355 = to_imx355(sd);
-	int ret;
-
-	if (imx355->streaming) {
-		ret = imx355_start_streaming(imx355);
-		if (ret)
-			goto error;
-	}
-
-	return 0;
-
-error:
-	imx355_stop_streaming(imx355);
-	imx355->streaming = 0;
-	return ret;
-}
-
 /* Verify chip ID */
 static int imx355_identify_module(struct imx355 *imx355)
 {
@@ -1825,10 +1789,6 @@ static void imx355_remove(struct i2c_client *client)
 	mutex_destroy(&imx355->mutex);
 }
 
-static const struct dev_pm_ops imx355_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(imx355_suspend, imx355_resume)
-};
-
 static const struct acpi_device_id imx355_acpi_ids[] __maybe_unused = {
 	{ "SONY355A" },
 	{ /* sentinel */ }
@@ -1838,7 +1798,6 @@ MODULE_DEVICE_TABLE(acpi, imx355_acpi_ids);
 static struct i2c_driver imx355_i2c_driver = {
 	.driver = {
 		.name = "imx355",
-		.pm = &imx355_pm_ops,
 		.acpi_match_table = ACPI_PTR(imx355_acpi_ids),
 	},
 	.probe = imx355_probe,
-- 
Regards,

Laurent Pinchart

