Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 882C77A0C65
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 20:17:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241028AbjINSRL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 14:17:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240991AbjINSRK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 14:17:10 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 966531FF9
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 11:17:06 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9800A8201;
        Thu, 14 Sep 2023 20:15:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694715332;
        bh=KLGlxq/0AEri2PIKgx0ySWWPxkdqGHxA8PEpmJXQm+w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GHx6UPyEHv/EWOVgo/edceqAYbhV7GHRzFNE6JCLBEoMSA8Ud2FKBW4lHJOErs6OC
         xDCKmaVH6xtXUKJXtBWcAn9uHHEBgCL2+S7PY0xvlMAa5DMDGOqJSV9bYif8b2yBEK
         cZMCfZlKqhpVPfF2pYZnug+9P9cWpw2H+QUA8OIw=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        "Paul J. Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>
Subject: [PATCH 10/57] media: i2c: imx335: Drop check for reentrant .s_stream()
Date:   Thu, 14 Sep 2023 21:16:17 +0300
Message-ID: <20230914181704.4811-11-laurent.pinchart@ideasonboard.com>
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
 drivers/media/i2c/imx335.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
index 482a0b7f040a..ec729126274b 100644
--- a/drivers/media/i2c/imx335.c
+++ b/drivers/media/i2c/imx335.c
@@ -119,7 +119,6 @@ struct imx335_mode {
  * @vblank: Vertical blanking in lines
  * @cur_mode: Pointer to current selected sensor mode
  * @mutex: Mutex for serializing sensor controls
- * @streaming: Flag indicating streaming state
  */
 struct imx335 {
 	struct device *dev;
@@ -140,7 +139,6 @@ struct imx335 {
 	u32 vblank;
 	const struct imx335_mode *cur_mode;
 	struct mutex mutex;
-	bool streaming;
 };
 
 static const s64 link_freq[] = {
@@ -705,11 +703,6 @@ static int imx335_set_stream(struct v4l2_subdev *sd, int enable)
 
 	mutex_lock(&imx335->mutex);
 
-	if (imx335->streaming == enable) {
-		mutex_unlock(&imx335->mutex);
-		return 0;
-	}
-
 	if (enable) {
 		ret = pm_runtime_resume_and_get(imx335->dev);
 		if (ret)
@@ -723,8 +716,6 @@ static int imx335_set_stream(struct v4l2_subdev *sd, int enable)
 		pm_runtime_put(imx335->dev);
 	}
 
-	imx335->streaming = enable;
-
 	mutex_unlock(&imx335->mutex);
 
 	return 0;
-- 
Regards,

Laurent Pinchart

