Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B36237A0C68
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 20:17:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240994AbjINSRQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 14:17:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241002AbjINSRP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 14:17:15 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1B441FD7
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 11:17:10 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E733A31B9;
        Thu, 14 Sep 2023 20:15:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694715337;
        bh=89e0RaWIDRnqvZUq7xeJ0I4XQ+a3mnyUPPwDLUmVmRs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ggi5FwMxkr2VupwUZEt76ySQYHRG/ZcSuE3swhkqtL8Pis/W8NdD2zx0h85jhkmlU
         FHfD5SfuCq7VO9SNqwlSxJ+g3vcrk1Sm0QAk5h1WtOwUsUhs2zMj+LnLwj5NS6JsyD
         C0i4lsPrc/5w5eXC8tUgQAd4d0lT1yZKL4Vlcwig=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH 13/57] media: i2c: mt9m001: Drop check for reentrant .s_stream()
Date:   Thu, 14 Sep 2023 21:16:20 +0300
Message-ID: <20230914181704.4811-14-laurent.pinchart@ideasonboard.com>
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
 drivers/media/i2c/mt9m001.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/media/i2c/mt9m001.c b/drivers/media/i2c/mt9m001.c
index ce9568e8391c..79192cf79d28 100644
--- a/drivers/media/i2c/mt9m001.c
+++ b/drivers/media/i2c/mt9m001.c
@@ -93,7 +93,6 @@ struct mt9m001 {
 		struct v4l2_ctrl *autoexposure;
 		struct v4l2_ctrl *exposure;
 	};
-	bool streaming;
 	struct mutex mutex;
 	struct v4l2_rect rect;	/* Sensor window */
 	struct clk *clk;
@@ -213,9 +212,6 @@ static int mt9m001_s_stream(struct v4l2_subdev *sd, int enable)
 
 	mutex_lock(&mt9m001->mutex);
 
-	if (mt9m001->streaming == enable)
-		goto done;
-
 	if (enable) {
 		ret = pm_runtime_resume_and_get(&client->dev);
 		if (ret < 0)
@@ -239,8 +235,6 @@ static int mt9m001_s_stream(struct v4l2_subdev *sd, int enable)
 		pm_runtime_put(&client->dev);
 	}
 
-	mt9m001->streaming = enable;
-done:
 	mutex_unlock(&mt9m001->mutex);
 
 	return 0;
-- 
Regards,

Laurent Pinchart

