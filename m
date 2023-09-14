Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 868C57A0C78
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 20:17:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241331AbjINSRj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 14:17:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241334AbjINSRi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 14:17:38 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F6371FFD
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 11:17:34 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4438E31B9;
        Thu, 14 Sep 2023 20:16:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694715360;
        bh=gWC0aV0UYmJ9KfVJ0zjnSdHlepXy8kimFMCXE67KNK4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=k1x/R+X+h0o+inUJk7RT7V8egru4y+TBhebaJ92kkLpDa2qQA1v2jW7ocXFrCd8zb
         wGZZ7izpgJtmyZwLvRXeiyHpZl+3de9alidjrHGyeMTOFWn8jMAMIpJ8WOsVJWCEov
         ySoS694VXDLliUtLyQEosBN4ryai/egnbhY/hAcU=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        "Paul J. Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>
Subject: [PATCH 29/57] media: i2c: ov9282: Drop check for reentrant .s_stream()
Date:   Thu, 14 Sep 2023 21:16:36 +0300
Message-ID: <20230914181704.4811-30-laurent.pinchart@ideasonboard.com>
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
 drivers/media/i2c/ov9282.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 068c7449f50e..bf6dfce1b5dd 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -165,7 +165,6 @@ struct ov9282_mode {
  * @cur_mode: Pointer to current selected sensor mode
  * @code: Mbus code currently selected
  * @mutex: Mutex for serializing sensor controls
- * @streaming: Flag indicating streaming state
  */
 struct ov9282 {
 	struct device *dev;
@@ -188,7 +187,6 @@ struct ov9282 {
 	const struct ov9282_mode *cur_mode;
 	u32 code;
 	struct mutex mutex;
-	bool streaming;
 };
 
 static const s64 link_freq[] = {
@@ -1037,11 +1035,6 @@ static int ov9282_set_stream(struct v4l2_subdev *sd, int enable)
 
 	mutex_lock(&ov9282->mutex);
 
-	if (ov9282->streaming == enable) {
-		mutex_unlock(&ov9282->mutex);
-		return 0;
-	}
-
 	if (enable) {
 		ret = pm_runtime_resume_and_get(ov9282->dev);
 		if (ret)
@@ -1055,8 +1048,6 @@ static int ov9282_set_stream(struct v4l2_subdev *sd, int enable)
 		pm_runtime_put(ov9282->dev);
 	}
 
-	ov9282->streaming = enable;
-
 	mutex_unlock(&ov9282->mutex);
 
 	return 0;
-- 
Regards,

Laurent Pinchart

