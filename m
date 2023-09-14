Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BE237A0C75
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 20:17:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241300AbjINSRe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 14:17:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241283AbjINSRe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 14:17:34 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 061591FFB
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 11:17:30 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 12D392F6C;
        Thu, 14 Sep 2023 20:15:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694715356;
        bh=5IKTIBnn1uVKRilkTivCxRNLjhYgDgCaZgCB00CbOCY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PJrCdlWf/sCYwwfuEEI7g2huOS5jONtX3mFYtFeQbOvqgHQWNYTaI2+XeL+rWf/f/
         nqryVRy469hefc3Mh96BQV5iA5x0AfQEddmSLhz3+edU1qAEvjzsjurN726dC+raeq
         EMk/a1tGCEiIAgi3MmAnXDzVoncgHWYgfCkYNexQ=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Shunqian Zheng <zhengsq@rock-chips.com>
Subject: [PATCH 26/57] media: i2c: ov5695: Drop check for reentrant .s_stream()
Date:   Thu, 14 Sep 2023 21:16:33 +0300
Message-ID: <20230914181704.4811-27-laurent.pinchart@ideasonboard.com>
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
 drivers/media/i2c/ov5695.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/media/i2c/ov5695.c b/drivers/media/i2c/ov5695.c
index 3023b7254167..13506a4f9500 100644
--- a/drivers/media/i2c/ov5695.c
+++ b/drivers/media/i2c/ov5695.c
@@ -108,7 +108,6 @@ struct ov5695 {
 	struct v4l2_ctrl	*vblank;
 	struct v4l2_ctrl	*test_pattern;
 	struct mutex		mutex;
-	bool			streaming;
 	const struct ov5695_mode *cur_mode;
 };
 
@@ -942,9 +941,6 @@ static int ov5695_s_stream(struct v4l2_subdev *sd, int on)
 	int ret = 0;
 
 	mutex_lock(&ov5695->mutex);
-	on = !!on;
-	if (on == ov5695->streaming)
-		goto unlock_and_return;
 
 	if (on) {
 		ret = pm_runtime_resume_and_get(&client->dev);
@@ -962,8 +958,6 @@ static int ov5695_s_stream(struct v4l2_subdev *sd, int on)
 		pm_runtime_put(&client->dev);
 	}
 
-	ov5695->streaming = on;
-
 unlock_and_return:
 	mutex_unlock(&ov5695->mutex);
 
-- 
Regards,

Laurent Pinchart

