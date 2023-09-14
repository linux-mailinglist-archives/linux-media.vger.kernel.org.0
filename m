Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FF687A0B6E
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 19:20:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238571AbjINRUr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 13:20:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231695AbjINRUr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 13:20:47 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E74851BFE
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 10:20:42 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 17FC110FE;
        Thu, 14 Sep 2023 19:19:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694711948;
        bh=Fc8GQd7wu9vCpec/blbvpq56VEPqkFWAPbTUBOFkqc0=;
        h=From:To:Cc:Subject:Date:From;
        b=KS9/tdcC4zNCxVIGZkWW0ZeTA4CUE9SDYcaLEUnd7D3s89TWTpSgqpR/xfJSO1C+t
         YPOFtZH/HRfxUCxgmgzzr1iH7smob2G9x0GpaSLZhfE8MgcXB09S7gdAggxTkcJbsq
         6gUkkxtz5Sa+za1v9xmTVOc2e5sjt3o0t0rcOC8w=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Martin Kepplinger <martink@posteo.de>,
        Daniel Scally <djrscally@gmail.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Sylvain Petinot <sylvain.petinot@foss.st.com>
Subject: [PATCH] media: i2c: Use pm_runtime_resume_and_get()
Date:   Thu, 14 Sep 2023 20:20:54 +0300
Message-ID: <20230914172054.31825-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Simplify error handling by using pm_runtime_resume_and_get() instead of
pm_runtime_get_sync() with a put call in the error path.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ccs/ccs-core.c |  6 +++---
 drivers/media/i2c/hi846.c        |  6 ++----
 drivers/media/i2c/hi847.c        |  5 ++---
 drivers/media/i2c/imx208.c       | 14 +++++++-------
 drivers/media/i2c/og01a1b.c      |  5 ++---
 drivers/media/i2c/ov5693.c       |  6 +++---
 drivers/media/i2c/ov7251.c       |  8 +++++---
 drivers/media/i2c/st-vgxy61.c    |  9 ++-------
 8 files changed, 26 insertions(+), 33 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 49e0d9a09530..569bf9b67539 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -1893,9 +1893,9 @@ static int ccs_pm_get_init(struct ccs_sensor *sensor)
 	 * relies at the returned value to detect if the device was already
 	 * active or not.
 	 */
-	rval = pm_runtime_get_sync(&client->dev);
-	if (rval < 0)
-		goto error;
+	rval = pm_runtime_resume_and_get(&client->dev);
+	if (rval)
+		return rval;
 
 	/* Device was already active, so don't set controls */
 	if (rval == 1)
diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
index fa0038749a3b..8a8ae89a8453 100644
--- a/drivers/media/i2c/hi846.c
+++ b/drivers/media/i2c/hi846.c
@@ -1613,11 +1613,9 @@ static int hi846_set_stream(struct v4l2_subdev *sd, int enable)
 	mutex_lock(&hi846->mutex);
 
 	if (enable) {
-		ret = pm_runtime_get_sync(&client->dev);
-		if (ret < 0) {
-			pm_runtime_put_noidle(&client->dev);
+		ret = pm_runtime_resume_and_get(&client->dev);
+		if (ret)
 			goto out;
-		}
 
 		ret = hi846_start_streaming(hi846);
 	}
diff --git a/drivers/media/i2c/hi847.c b/drivers/media/i2c/hi847.c
index 32547d7a2659..47aa2cd06e32 100644
--- a/drivers/media/i2c/hi847.c
+++ b/drivers/media/i2c/hi847.c
@@ -2623,9 +2623,8 @@ static int hi847_set_stream(struct v4l2_subdev *sd, int enable)
 
 	mutex_lock(&hi847->mutex);
 	if (enable) {
-		ret = pm_runtime_get_sync(&client->dev);
-		if (ret < 0) {
-			pm_runtime_put_noidle(&client->dev);
+		ret = pm_runtime_resume_and_get(&client->dev);
+		if (ret) {
 			mutex_unlock(&hi847->mutex);
 			return ret;
 		}
diff --git a/drivers/media/i2c/imx208.c b/drivers/media/i2c/imx208.c
index ee5a28675388..a6edcae4ef47 100644
--- a/drivers/media/i2c/imx208.c
+++ b/drivers/media/i2c/imx208.c
@@ -720,9 +720,11 @@ static int imx208_set_stream(struct v4l2_subdev *sd, int enable)
 	}
 
 	if (enable) {
-		ret = pm_runtime_get_sync(&client->dev);
-		if (ret < 0)
-			goto err_rpm_put;
+		ret = pm_runtime_resume_and_get(&client->dev);
+		if (ret) {
+			mutex_unlock(&imx208->imx208_mx);
+			return ret;
+		}
 
 		/*
 		 * Apply default & customized values
@@ -819,11 +821,9 @@ static int imx208_read_otp(struct imx208 *imx208)
 	if (imx208->otp_read)
 		goto out_unlock;
 
-	ret = pm_runtime_get_sync(&client->dev);
-	if (ret < 0) {
-		pm_runtime_put_noidle(&client->dev);
+	ret = pm_runtime_resume_and_get(&client->dev);
+	if (ret)
 		goto out_unlock;
-	}
 
 	ret = imx208_identify_module(imx208);
 	if (ret)
diff --git a/drivers/media/i2c/og01a1b.c b/drivers/media/i2c/og01a1b.c
index 365ce5684583..ccf6731ea2e2 100644
--- a/drivers/media/i2c/og01a1b.c
+++ b/drivers/media/i2c/og01a1b.c
@@ -737,9 +737,8 @@ static int og01a1b_set_stream(struct v4l2_subdev *sd, int enable)
 
 	mutex_lock(&og01a1b->mutex);
 	if (enable) {
-		ret = pm_runtime_get_sync(&client->dev);
-		if (ret < 0) {
-			pm_runtime_put_noidle(&client->dev);
+		ret = pm_runtime_resume_and_get(&client->dev);
+		if (ret) {
 			mutex_unlock(&og01a1b->mutex);
 			return ret;
 		}
diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
index 488ee6d9d301..033cf7f14f19 100644
--- a/drivers/media/i2c/ov5693.c
+++ b/drivers/media/i2c/ov5693.c
@@ -975,9 +975,9 @@ static int ov5693_s_stream(struct v4l2_subdev *sd, int enable)
 	int ret;
 
 	if (enable) {
-		ret = pm_runtime_get_sync(ov5693->dev);
-		if (ret < 0)
-			goto err_power_down;
+		ret = pm_runtime_resume_and_get(ov5693->dev);
+		if (ret)
+			return ret;
 
 		mutex_lock(&ov5693->lock);
 		ret = __v4l2_ctrl_handler_setup(&ov5693->ctrls.handler);
diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index 675fb37a6fea..6582cc0e2384 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -1340,9 +1340,11 @@ static int ov7251_s_stream(struct v4l2_subdev *subdev, int enable)
 	mutex_lock(&ov7251->lock);
 
 	if (enable) {
-		ret = pm_runtime_get_sync(ov7251->dev);
-		if (ret < 0)
-			goto err_power_down;
+		ret = pm_runtime_resume_and_get(ov7251->dev);
+		if (ret) {
+			mutex_unlock(&ov7251->lock);
+			return ret;
+		}
 
 		ret = ov7251_pll_configure(ov7251);
 		if (ret) {
diff --git a/drivers/media/i2c/st-vgxy61.c b/drivers/media/i2c/st-vgxy61.c
index 30f82ca344c4..5dbfb04b3124 100644
--- a/drivers/media/i2c/st-vgxy61.c
+++ b/drivers/media/i2c/st-vgxy61.c
@@ -1170,14 +1170,9 @@ static int vgxy61_stream_enable(struct vgxy61_dev *sensor)
 	if (ret)
 		return ret;
 
-	ret = pm_runtime_get_sync(&client->dev);
-	if (ret < 0) {
-		pm_runtime_put_autosuspend(&client->dev);
+	ret = pm_runtime_resume_and_get(&client->dev);
+	if (ret)
 		return ret;
-	}
-
-	/* pm_runtime_get_sync() can return 1 as a valid return code */
-	ret = 0;
 
 	vgxy61_write_reg(sensor, VGXY61_REG_FORMAT_CTRL,
 			 get_bpp_by_code(sensor->fmt.code), &ret);

base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
-- 
Regards,

Laurent Pinchart

