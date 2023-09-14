Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D9E87A0C72
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 20:17:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241255AbjINSRa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 14:17:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241166AbjINSR3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 14:17:29 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73C091FD5
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 11:17:25 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6D8ED2D14;
        Thu, 14 Sep 2023 20:15:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694715351;
        bh=2Is+Kte5Nw86T+C7O35XDfvnrUBbOZJpd8p+HOnJOlk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=I8qvYO8Chi2ofbe2/LNQu8y+e611ijOAY1698swFNZijCYWXTz56ePPxXR8qlTFdJ
         qIoIv1LkJEF8zQmAfBVkKPSiVkZ7rqfVFmgVT+f/KwCYcOcb34LQUrHcwFik0JsMMM
         4+EgallE3ZOlnth5dbbBke3PyARcJg8bFqj7soCE=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Mikhail Rudenko <mike.rudenko@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH 23/57] media: i2c: ov5647: Drop check for reentrant .s_stream()
Date:   Thu, 14 Sep 2023 21:16:30 +0300
Message-ID: <20230914181704.4811-24-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230914181704.4811-1-laurent.pinchart@ideasonboard.com>
References: <20230914181704.4811-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The subdev .s_stream() operation shall not be called to start streaming
on an already started subdev, or stop streaming on a stopped subdev.
Remove the check that guards against that condition.

The streaming field of the driver's private structure is now unused,
drop it as well.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ov5647.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 8de398423b7c..dcfe3129c63a 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -109,7 +109,6 @@ struct ov5647 {
 	struct v4l2_ctrl		*hblank;
 	struct v4l2_ctrl		*vblank;
 	struct v4l2_ctrl		*exposure;
-	bool				streaming;
 };
 
 static inline struct ov5647 *to_sensor(struct v4l2_subdev *sd)
@@ -898,10 +897,6 @@ static int ov5647_s_stream(struct v4l2_subdev *sd, int enable)
 	int ret;
 
 	mutex_lock(&sensor->lock);
-	if (sensor->streaming == enable) {
-		mutex_unlock(&sensor->lock);
-		return 0;
-	}
 
 	if (enable) {
 		ret = pm_runtime_resume_and_get(&client->dev);
@@ -922,7 +917,6 @@ static int ov5647_s_stream(struct v4l2_subdev *sd, int enable)
 		pm_runtime_put(&client->dev);
 	}
 
-	sensor->streaming = enable;
 	mutex_unlock(&sensor->lock);
 
 	return 0;
-- 
Regards,

Laurent Pinchart

