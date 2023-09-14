Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9AFA07A0C82
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 20:17:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241501AbjINSRv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 14:17:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241480AbjINSRu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 14:17:50 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71CC71FFD
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 11:17:46 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7870A8810;
        Thu, 14 Sep 2023 20:16:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694715372;
        bh=8FkK13b2pu0yPeLR+xAULELF87/yfYsQB8K8xFO6ypg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IGo3HOL5/JE5bjm8r9e2mdL/eYuhiOTK9bZvMv/5Ler+sSh5FhLHkj15fghQ85DqF
         9ciEZtxw1sQXr7ksyRalqFFsqibAJGQc8BOA2uCnNbfysGIag74bUfYD4AYs2F5Iet
         wAW0m4KaCsTl3/0+PZd+SIleDXRBPoMeXrMO4Y9I=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Martin Kepplinger <martink@posteo.de>
Subject: [PATCH 38/57] media: i2c: hi846: Drop system suspend and resume handlers
Date:   Thu, 14 Sep 2023 21:16:45 +0300
Message-ID: <20230914181704.4811-39-laurent.pinchart@ideasonboard.com>
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

Now that the runtime PM operations are not called from the system PM
handlers, the sensor is guaranteed not to be streaming when the runtime
PM resume handler is called, and to have been stopped already when the
runtime PM suspend handler is called. Drop the manual stream start/stop
from the runtime PM handlers.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/hi846.c | 25 +------------------------
 1 file changed, 1 insertion(+), 24 deletions(-)

diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
index 746e1f75f9d0..d643b0aab998 100644
--- a/drivers/media/i2c/hi846.c
+++ b/drivers/media/i2c/hi846.c
@@ -1677,9 +1677,6 @@ static int __maybe_unused hi846_suspend(struct device *dev)
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
 	struct hi846 *hi846 = to_hi846(sd);
 
-	if (hi846->streaming)
-		hi846_stop_streaming(hi846);
-
 	return hi846_power_off(hi846);
 }
 
@@ -1688,26 +1685,8 @@ static int __maybe_unused hi846_resume(struct device *dev)
 	struct i2c_client *client = to_i2c_client(dev);
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
 	struct hi846 *hi846 = to_hi846(sd);
-	int ret;
 
-	ret = hi846_power_on(hi846);
-	if (ret)
-		return ret;
-
-	if (hi846->streaming) {
-		ret = hi846_start_streaming(hi846);
-		if (ret) {
-			dev_err(dev, "%s: start streaming failed: %d\n",
-				__func__, ret);
-			goto error;
-		}
-	}
-
-	return 0;
-
-error:
-	hi846_power_off(hi846);
-	return ret;
+	return hi846_power_on(hi846);
 }
 
 static int hi846_set_format(struct v4l2_subdev *sd,
@@ -2170,8 +2149,6 @@ static void hi846_remove(struct i2c_client *client)
 }
 
 static const struct dev_pm_ops hi846_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
 	SET_RUNTIME_PM_OPS(hi846_suspend, hi846_resume, NULL)
 };
 
-- 
Regards,

Laurent Pinchart

