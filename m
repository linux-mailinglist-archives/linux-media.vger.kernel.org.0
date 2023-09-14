Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0BC77A0C71
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 20:17:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241250AbjINSR3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 14:17:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241279AbjINSR2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 14:17:28 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E99C71FFF
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 11:17:23 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0BCD78201;
        Thu, 14 Sep 2023 20:15:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694715350;
        bh=iXzQAWIZPyd6rR1sDw7k9pITuRNEPaUp9zjWCAd1k4w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MzB8MuCsbDx2Xk6df5B3qknIbCNGkYyVK8RmWBgQHkqhS7TKT52miFEzQMAcyzu7s
         LobBIwG7Yy/mHzwE6vY8n0xwA3eL7CPJLHV7lnqvlINDgNrh1cDMbtui6dwYW2az7L
         mIWgLko/ebgoAZK5LB+aiFBVgRkRG3C36EUasfOE=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH 22/57] media: i2c: ov4689: Drop check for reentrant .s_stream()
Date:   Thu, 14 Sep 2023 21:16:29 +0300
Message-ID: <20230914181704.4811-23-laurent.pinchart@ideasonboard.com>
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
 drivers/media/i2c/ov4689.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/media/i2c/ov4689.c b/drivers/media/i2c/ov4689.c
index fda217d2cb10..cd8d7131e747 100644
--- a/drivers/media/i2c/ov4689.c
+++ b/drivers/media/i2c/ov4689.c
@@ -100,7 +100,6 @@ struct ov4689 {
 	u32 clock_rate;
 
 	struct mutex mutex; /* lock to protect streaming, ctrls and cur_mode */
-	bool streaming;
 	struct v4l2_ctrl_handler ctrl_handler;
 	struct v4l2_ctrl *exposure;
 
@@ -468,10 +467,6 @@ static int ov4689_s_stream(struct v4l2_subdev *sd, int on)
 
 	mutex_lock(&ov4689->mutex);
 
-	on = !!on;
-	if (on == ov4689->streaming)
-		goto unlock_and_return;
-
 	if (on) {
 		ret = pm_runtime_resume_and_get(&client->dev);
 		if (ret < 0)
@@ -504,8 +499,6 @@ static int ov4689_s_stream(struct v4l2_subdev *sd, int on)
 		pm_runtime_put(&client->dev);
 	}
 
-	ov4689->streaming = on;
-
 unlock_and_return:
 	mutex_unlock(&ov4689->mutex);
 
-- 
Regards,

Laurent Pinchart

