Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9204C7A0C67
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 20:17:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241046AbjINSRP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 14:17:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241088AbjINSRN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 14:17:13 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CF781FF9
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 11:17:09 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7FDD22D14;
        Thu, 14 Sep 2023 20:15:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694715335;
        bh=BloF8fkn9BkC0OccqmGSu3hkykz4HE7jgldxbK/5I/U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ndKENEqwmdaR1quYY65uABHGupp5DkTSRHdvtJ26Jb7vKGHyyYW4NhLH9fC7QfxqR
         buKj+m0Zc0BpFp1fuGroEIkGYuTI0YnriHLZhBqOrQvhD2OIaskMkSDsAC4sx6W66Q
         55eCHZkeJIAWEo3TG8VamksLJi7nzdvpxft9wxds=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        "Paul J. Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>
Subject: [PATCH 12/57] media: i2c: imx412: Drop check for reentrant .s_stream()
Date:   Thu, 14 Sep 2023 21:16:19 +0300
Message-ID: <20230914181704.4811-13-laurent.pinchart@ideasonboard.com>
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
 drivers/media/i2c/imx412.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
index c7e862ae4040..962b3136c31e 100644
--- a/drivers/media/i2c/imx412.c
+++ b/drivers/media/i2c/imx412.c
@@ -127,7 +127,6 @@ static const char * const imx412_supply_names[] = {
  * @vblank: Vertical blanking in lines
  * @cur_mode: Pointer to current selected sensor mode
  * @mutex: Mutex for serializing sensor controls
- * @streaming: Flag indicating streaming state
  */
 struct imx412 {
 	struct device *dev;
@@ -149,7 +148,6 @@ struct imx412 {
 	u32 vblank;
 	const struct imx412_mode *cur_mode;
 	struct mutex mutex;
-	bool streaming;
 };
 
 static const s64 link_freq[] = {
@@ -857,11 +855,6 @@ static int imx412_set_stream(struct v4l2_subdev *sd, int enable)
 
 	mutex_lock(&imx412->mutex);
 
-	if (imx412->streaming == enable) {
-		mutex_unlock(&imx412->mutex);
-		return 0;
-	}
-
 	if (enable) {
 		ret = pm_runtime_resume_and_get(imx412->dev);
 		if (ret)
@@ -875,8 +868,6 @@ static int imx412_set_stream(struct v4l2_subdev *sd, int enable)
 		pm_runtime_put(imx412->dev);
 	}
 
-	imx412->streaming = enable;
-
 	mutex_unlock(&imx412->mutex);
 
 	return 0;
-- 
Regards,

Laurent Pinchart

