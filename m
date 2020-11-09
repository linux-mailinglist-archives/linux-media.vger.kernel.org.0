Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A64672AC16E
	for <lists+linux-media@lfdr.de>; Mon,  9 Nov 2020 17:54:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730696AbgKIQw7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Nov 2020 11:52:59 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:42295 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730562AbgKIQw6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Nov 2020 11:52:58 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id DC0A92000C;
        Mon,  9 Nov 2020 16:52:54 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, dafna.hirschfeld@collabora.com,
        dave.stevenson@raspberrypi.org, naush@raspberrypi.com,
        erosca@de.adit-jv.com
Subject: [PATCH v3 26/29] media: ov5647: Apply controls only when powered
Date:   Mon,  9 Nov 2020 17:49:31 +0100
Message-Id: <20201109164934.134919-27-jacopo@jmondi.org>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201109164934.134919-1-jacopo@jmondi.org>
References: <20201109164934.134919-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use pm_runtime_get_if_in_use() in s_ctrl to apply controls
only when the device is powered on.

Rework the control set function to balance the
pm_runtime_get_if_in_use() call with
pm_runtime_put() at the end of the function.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5647.c | 44 +++++++++++++++++++++++---------------
 1 file changed, 27 insertions(+), 17 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index dc24afbb7cfd0..ef6c7b1e12490 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -104,7 +104,6 @@ struct ov5647 {
 	struct v4l2_subdev		sd;
 	struct media_pad		pad;
 	struct mutex			lock;
-	int				power_count;
 	struct clk			*xclk;
 	struct gpio_desc		*pwdn;
 	bool				clock_ncont;
@@ -1347,6 +1346,8 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
 					    struct ov5647, ctrls);
 	struct v4l2_subdev *sd = &sensor->sd;
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	int ret = 0;
+
 
 	/* v4l2_ctrl_lock() locks our own mutex */
 
@@ -1363,33 +1364,40 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
 	}
 
 	/*
-	 * If the device is not powered up by the host driver do
-	 * not apply any controls to H/W at this time. Instead
-	 * the controls will be restored at s_stream(1) time.
+	 * If the device is not powered up do not apply any controls
+	 * to H/W at this time. Instead the controls will be restored
+	 * at s_stream(1) time.
 	 */
-	if (!sensor->power_count)
+	if (pm_runtime_get_if_in_use(&client->dev) == 0)
 		return 0;
 
 	switch (ctrl->id) {
 	case V4L2_CID_AUTO_WHITE_BALANCE:
-		return ov5647_s_auto_white_balance(sd, ctrl->val);
+		ret = ov5647_s_auto_white_balance(sd, ctrl->val);
+		break;
 	case V4L2_CID_AUTOGAIN:
-		return ov5647_s_autogain(sd, ctrl->val);
+		ret = ov5647_s_autogain(sd, ctrl->val);
+		break;
 	case V4L2_CID_EXPOSURE_AUTO:
-		return ov5647_s_exposure_auto(sd, ctrl->val);
+		ret = ov5647_s_exposure_auto(sd, ctrl->val);
+		break;
 	case V4L2_CID_ANALOGUE_GAIN:
-		return  ov5647_s_analogue_gain(sd, ctrl->val);
+		ret =  ov5647_s_analogue_gain(sd, ctrl->val);
+		break;
 	case V4L2_CID_EXPOSURE:
-		return ov5647_s_exposure(sd, ctrl->val);
+		ret = ov5647_s_exposure(sd, ctrl->val);
+		break;
+	case V4L2_CID_VBLANK:
+		ret = ov5647_write16(sd, OV5647_REG_VTS_HI,
+				     sensor->mode->format.height + ctrl->val);
+		break;
+
+	/* Read-only, but we adjust it based on mode. */
 	case V4L2_CID_PIXEL_RATE:
-		/* Read-only, but we adjust it based on mode. */
-		return 0;
 	case V4L2_CID_HBLANK:
 		/* Read-only, but we adjust it based on mode. */
-		return 0;
-	case V4L2_CID_VBLANK:
-		return ov5647_write16(sd, OV5647_REG_VTS_HI,
-				      sensor->mode->format.height + ctrl->val);
+		break;
+
 	default:
 		dev_info(&client->dev,
 			 "Control (id:0x%x, val:0x%x) not supported\n",
@@ -1397,7 +1405,9 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
 		return -EINVAL;
 	}
 
-	return 0;
+	pm_runtime_put(&client->dev);
+
+	return ret;
 }
 
 static const struct v4l2_ctrl_ops ov5647_ctrl_ops = {
-- 
2.29.1

