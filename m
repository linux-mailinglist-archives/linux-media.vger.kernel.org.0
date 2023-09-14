Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BC317A0C94
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 20:18:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241580AbjINSSL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 14:18:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241560AbjINSSL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 14:18:11 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8AF21FD5
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 11:18:06 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E65A98813;
        Thu, 14 Sep 2023 20:16:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694715393;
        bh=KfMW4WuXqJANBGTuGVSEGoBSYdoijZOxs2evHkDLbGc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KDe3nlAHkHWQSg08CfVVrMA4AOV5KSxpvSBioFvtkky9KIg3j0Bi9VzNqgEfDDUTW
         m6g/17OO+ddZPcbkxCgH8bY8LaajD6g0//hvwoHY31M9ZG09DkGtbVfc4JW3FXt/jn
         O7oVUjJEWwGylLlgnG2y626xyoTBVQZhsOOc9Qvw=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>, Arec Kao <arec.kao@intel.com>
Subject: [PATCH 53/57] media: i2c: ov13b10: Drop stream handling in runtime PM handlers
Date:   Thu, 14 Sep 2023 21:17:00 +0300
Message-ID: <20230914181704.4811-54-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230914181704.4811-1-laurent.pinchart@ideasonboard.com>
References: <20230914181704.4811-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The sensor is guaranteed not to be streaming when the runtime PM resume
handler is called, as the resume handler is only called from the
.s_stream() operation when starting streaming. Similarly, the sensor has
been stopped when the runtime PM suspend handler is called. There is
thus no need for manual stream start/stop from the runtime PM handlers.
Drop them.

The streaming field of the driver's private structure is now unused,
drop it as well.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ov13b10.c | 34 +---------------------------------
 1 file changed, 1 insertion(+), 33 deletions(-)

diff --git a/drivers/media/i2c/ov13b10.c b/drivers/media/i2c/ov13b10.c
index d191683a0826..ce157c9aa8b7 100644
--- a/drivers/media/i2c/ov13b10.c
+++ b/drivers/media/i2c/ov13b10.c
@@ -594,9 +594,6 @@ struct ov13b10 {
 	/* Mutex for serialized access */
 	struct mutex mutex;
 
-	/* Streaming on/off */
-	bool streaming;
-
 	/* True if the device has been identified */
 	bool identified;
 };
@@ -1179,7 +1176,6 @@ static int ov13b10_set_stream(struct v4l2_subdev *sd, int enable)
 		pm_runtime_put(&client->dev);
 	}
 
-	ov13b->streaming = enable;
 	mutex_unlock(&ov13b->mutex);
 
 	return ret;
@@ -1194,12 +1190,6 @@ static int ov13b10_set_stream(struct v4l2_subdev *sd, int enable)
 
 static int ov13b10_suspend(struct device *dev)
 {
-	struct v4l2_subdev *sd = dev_get_drvdata(dev);
-	struct ov13b10 *ov13b = to_ov13b10(sd);
-
-	if (ov13b->streaming)
-		ov13b10_stop_streaming(ov13b);
-
 	ov13b10_power_off(dev);
 
 	return 0;
@@ -1207,29 +1197,7 @@ static int ov13b10_suspend(struct device *dev)
 
 static int ov13b10_resume(struct device *dev)
 {
-	struct v4l2_subdev *sd = dev_get_drvdata(dev);
-	struct ov13b10 *ov13b = to_ov13b10(sd);
-	int ret;
-
-	ret = ov13b10_power_on(dev);
-	if (ret)
-		goto pm_fail;
-
-	if (ov13b->streaming) {
-		ret = ov13b10_start_streaming(ov13b);
-		if (ret)
-			goto stop_streaming;
-	}
-
-	return 0;
-
-stop_streaming:
-	ov13b10_stop_streaming(ov13b);
-	ov13b10_power_off(dev);
-pm_fail:
-	ov13b->streaming = false;
-
-	return ret;
+	return ov13b10_power_on(dev);
 }
 
 static const struct v4l2_subdev_video_ops ov13b10_video_ops = {
-- 
Regards,

Laurent Pinchart

