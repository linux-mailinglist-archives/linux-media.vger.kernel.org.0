Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 856AA7A0C73
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 20:17:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241302AbjINSRb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 14:17:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241276AbjINSRa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 14:17:30 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3B1E1FFB
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 11:17:26 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CEA7915EF;
        Thu, 14 Sep 2023 20:15:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694715353;
        bh=8lPhUl1NXadw6BhODFv2KUl2uzXffX+ZfChH2bxbqYg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Qp6i6oOzU9x8ocDJGEeyyJGlqd1udRBNqXH1c+tY6OBvr3KNjhFgnZBDtb1QHSfIs
         OyeLwmYhDNBY+XvBtABMyuqqr38oDYHx2VvoyaVo5YQ+ROLWHO4tSdx+/47o0DwB3W
         qqq9u6YKctQF3Q0dbH90ZKJ+QVwHl1KbN0ii2GAM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH 24/57] media: i2c: ov5670: Drop check for reentrant .s_stream()
Date:   Thu, 14 Sep 2023 21:16:31 +0300
Message-ID: <20230914181704.4811-25-laurent.pinchart@ideasonboard.com>
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

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ov5670.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index 29e773a997dd..afd84c8e5ee7 100644
--- a/drivers/media/i2c/ov5670.c
+++ b/drivers/media/i2c/ov5670.c
@@ -2471,8 +2471,6 @@ static int ov5670_set_stream(struct v4l2_subdev *sd, int enable)
 	int ret = 0;
 
 	mutex_lock(&ov5670->mutex);
-	if (ov5670->streaming == enable)
-		goto unlock_and_return;
 
 	if (enable) {
 		ret = pm_runtime_resume_and_get(&client->dev);
-- 
Regards,

Laurent Pinchart

