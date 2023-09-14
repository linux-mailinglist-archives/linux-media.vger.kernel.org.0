Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 883AE7A0C64
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 20:17:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240912AbjINSRK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 14:17:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240991AbjINSRJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 14:17:09 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F4FD1FD5
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 11:17:05 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3EECA2C95;
        Thu, 14 Sep 2023 20:15:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694715331;
        bh=7IU+o0Dnbpv+7pK3N0ajsopedYKfp73v+h83q7ld5pI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TSIcfGkoWPyEWw+71HHVpSSE+pL0IzmFn3MkAVQC+Dag89n1Drdc5HM8p0fw/lD89
         LfIi0gWhXLI9Tp25PVni7AB3VtsFy/pgWdo4Q128ymaJ4EJU8lnjic8anL/CCAnYTH
         eq56pQrEMNmK2Aa5rVDA2pymfyTVq1TAq2BQCPN8=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        "Paul J. Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>
Subject: [PATCH 09/57] media: i2c: imx334: Drop check for reentrant .s_stream()
Date:   Thu, 14 Sep 2023 21:16:16 +0300
Message-ID: <20230914181704.4811-10-laurent.pinchart@ideasonboard.com>
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
 drivers/media/i2c/imx334.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
index d722c9b7cd31..d8f91a492d14 100644
--- a/drivers/media/i2c/imx334.c
+++ b/drivers/media/i2c/imx334.c
@@ -120,7 +120,6 @@ struct imx334_mode {
  * @mutex: Mutex for serializing sensor controls
  * @menu_skip_mask: Menu skip mask for link_freq_ctrl
  * @cur_code: current selected format code
- * @streaming: Flag indicating streaming state
  */
 struct imx334 {
 	struct device *dev;
@@ -143,7 +142,6 @@ struct imx334 {
 	struct mutex mutex;
 	unsigned long menu_skip_mask;
 	u32 cur_code;
-	bool streaming;
 };
 
 static const s64 link_freq[] = {
@@ -1001,11 +999,6 @@ static int imx334_set_stream(struct v4l2_subdev *sd, int enable)
 
 	mutex_lock(&imx334->mutex);
 
-	if (imx334->streaming == enable) {
-		mutex_unlock(&imx334->mutex);
-		return 0;
-	}
-
 	if (enable) {
 		ret = pm_runtime_resume_and_get(imx334->dev);
 		if (ret < 0)
@@ -1019,8 +1012,6 @@ static int imx334_set_stream(struct v4l2_subdev *sd, int enable)
 		pm_runtime_put(imx334->dev);
 	}
 
-	imx334->streaming = enable;
-
 	mutex_unlock(&imx334->mutex);
 
 	return 0;
-- 
Regards,

Laurent Pinchart

