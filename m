Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67D6C7A0C6F
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 20:17:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241233AbjINSR0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 14:17:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241247AbjINSRZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 14:17:25 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 419691FFB
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 11:17:21 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3D2E62C95;
        Thu, 14 Sep 2023 20:15:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694715347;
        bh=T0e7dyweWfonPyibm7KPzwrOQBa50PUkqfjP/nI5bfM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tZMKeCY1qXXwsfuobTJWHCBWuU+MUyNaO1xXo9utV+qDeq+BjABx8//2/wLEdblfk
         +niV3k+rb1Wc1XlLvMP9EX43NqyBeBp85mKZWEG1DHjoJbAHSYyBSaEybOF5mpEG0S
         lZ6AKqEnDiXDRQRxZ+UxY/oSsxPAXi2oVoxN48Lc=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Shunqian Zheng <zhengsq@rock-chips.com>
Subject: [PATCH 20/57] media: i2c: ov2685: Drop check for reentrant .s_stream()
Date:   Thu, 14 Sep 2023 21:16:27 +0300
Message-ID: <20230914181704.4811-21-laurent.pinchart@ideasonboard.com>
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
 drivers/media/i2c/ov2685.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/media/i2c/ov2685.c b/drivers/media/i2c/ov2685.c
index 303793e1f97d..2cde2d767874 100644
--- a/drivers/media/i2c/ov2685.c
+++ b/drivers/media/i2c/ov2685.c
@@ -91,7 +91,6 @@ struct ov2685 {
 	struct gpio_desc	*reset_gpio;
 	struct regulator_bulk_data supplies[OV2685_NUM_SUPPLIES];
 
-	bool			streaming;
 	struct mutex		mutex;
 	struct v4l2_subdev	subdev;
 	struct media_pad	pad;
@@ -513,10 +512,6 @@ static int ov2685_s_stream(struct v4l2_subdev *sd, int on)
 
 	mutex_lock(&ov2685->mutex);
 
-	on = !!on;
-	if (on == ov2685->streaming)
-		goto unlock_and_return;
-
 	if (on) {
 		ret = pm_runtime_resume_and_get(&ov2685->client->dev);
 		if (ret < 0)
@@ -539,8 +534,6 @@ static int ov2685_s_stream(struct v4l2_subdev *sd, int on)
 		pm_runtime_put(&ov2685->client->dev);
 	}
 
-	ov2685->streaming = on;
-
 unlock_and_return:
 	mutex_unlock(&ov2685->mutex);
 
-- 
Regards,

Laurent Pinchart

