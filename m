Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95E567A0C8D
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 20:18:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241500AbjINSSE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 14:18:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241578AbjINSSC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 14:18:02 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70C282100
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 11:17:58 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8DA30880F;
        Thu, 14 Sep 2023 20:16:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694715384;
        bh=HxkUTfaD35o4hYqQYJmfNgsNmL5c+Ilx4vZw+uwd7YQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jdsm6s0vttM2Kwkpqp3wIxtaNLFuIEhJBbRrm83lwmLz5x/qophbPAchdZAY55qow
         FGQ0wYZZ1lvtIno9Im2agTJlO63IGlOjHEIxh0g54XGEiKRK5ky3QTv6UMp61TRfoo
         r/sdg3qw5eZZuS/UMxcaEtMULdZaLHVjQEtFPBTc=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH 47/57] media: i2c: ov01a10: Drop system suspend and resume handlers
Date:   Thu, 14 Sep 2023 21:16:54 +0300
Message-ID: <20230914181704.4811-48-laurent.pinchart@ideasonboard.com>
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
 drivers/media/i2c/ov01a10.c | 57 ++-----------------------------------
 1 file changed, 3 insertions(+), 54 deletions(-)

diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index b43c1c96f47b..bbd5740d2280 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -287,9 +287,6 @@ struct ov01a10 {
 	struct v4l2_ctrl *exposure;
 
 	const struct ov01a10_mode *cur_mode;
-
-	/* streaming state */
-	bool streaming;
 };
 
 static inline struct ov01a10 *to_ov01a10(struct v4l2_subdev *subdev)
@@ -683,60 +680,17 @@ static int ov01a10_set_stream(struct v4l2_subdev *sd, int enable)
 			pm_runtime_put(&client->dev);
 			goto unlock;
 		}
-
-		goto done;
+	} else {
+		ov01a10_stop_streaming(ov01a10);
+		pm_runtime_put(&client->dev);
 	}
 
-	ov01a10_stop_streaming(ov01a10);
-	pm_runtime_put(&client->dev);
-done:
-	ov01a10->streaming = enable;
 unlock:
 	v4l2_subdev_unlock_state(state);
 
 	return ret;
 }
 
-static int __maybe_unused ov01a10_suspend(struct device *dev)
-{
-	struct i2c_client *client = to_i2c_client(dev);
-	struct v4l2_subdev *sd = i2c_get_clientdata(client);
-	struct ov01a10 *ov01a10 = to_ov01a10(sd);
-	struct v4l2_subdev_state *state;
-
-	state = v4l2_subdev_lock_and_get_active_state(sd);
-	if (ov01a10->streaming)
-		ov01a10_stop_streaming(ov01a10);
-
-	v4l2_subdev_unlock_state(state);
-
-	return 0;
-}
-
-static int __maybe_unused ov01a10_resume(struct device *dev)
-{
-	struct i2c_client *client = to_i2c_client(dev);
-	struct v4l2_subdev *sd = i2c_get_clientdata(client);
-	struct ov01a10 *ov01a10 = to_ov01a10(sd);
-	struct v4l2_subdev_state *state;
-	int ret = 0;
-
-	state = v4l2_subdev_lock_and_get_active_state(sd);
-	if (!ov01a10->streaming)
-		goto exit;
-
-	ret = ov01a10_start_streaming(ov01a10);
-	if (ret) {
-		ov01a10->streaming = false;
-		ov01a10_stop_streaming(ov01a10);
-	}
-
-exit:
-	v4l2_subdev_unlock_state(state);
-
-	return ret;
-}
-
 static int ov01a10_set_format(struct v4l2_subdev *sd,
 			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *fmt)
@@ -971,10 +925,6 @@ static int ov01a10_probe(struct i2c_client *client)
 	return ret;
 }
 
-static const struct dev_pm_ops ov01a10_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(ov01a10_suspend, ov01a10_resume)
-};
-
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id ov01a10_acpi_ids[] = {
 	{ "OVTI01A0" },
@@ -987,7 +937,6 @@ MODULE_DEVICE_TABLE(acpi, ov01a10_acpi_ids);
 static struct i2c_driver ov01a10_i2c_driver = {
 	.driver = {
 		.name = "ov01a10",
-		.pm = &ov01a10_pm_ops,
 		.acpi_match_table = ACPI_PTR(ov01a10_acpi_ids),
 	},
 	.probe = ov01a10_probe,
-- 
Regards,

Laurent Pinchart

