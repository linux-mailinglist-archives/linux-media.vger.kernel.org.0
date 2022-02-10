Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C3294B0BE4
	for <lists+linux-media@lfdr.de>; Thu, 10 Feb 2022 12:09:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240582AbiBJLJZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Feb 2022 06:09:25 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:43390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240580AbiBJLJY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Feb 2022 06:09:24 -0500
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FD6A128
        for <linux-media@vger.kernel.org>; Thu, 10 Feb 2022 03:09:25 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 29D761C000E;
        Thu, 10 Feb 2022 11:09:21 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     slongerbeam@gmail.com
Cc:     laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, tomi.valkeinen@ideasonboard.com,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com,
        eugen.hristev@microchip.com, jbrunet@baylibre.com,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v2 18/23] media: ov5640: Limit frame_interval to DVP mode only
Date:   Thu, 10 Feb 2022 12:10:03 +0100
Message-Id: <20220210111004.152859-6-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220210110458.152494-1-jacopo@jmondi.org>
References: <20220210110458.152494-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In MIPI mode the frame rate control is performed by adjusting the
frame blankings and the s_frame_interval function is not used anymore.

Only check for the per-mode supported frame rate in DVP mode and do not
restrict MIPI mode.

Disallow enum/s/g_frame_interval if the chip is used in MIPI mode.

While at it re-indent one function which whose parameters were wrongly
aligned.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ov5640.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 4ebb76d95849..6695bb2b99b7 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -1872,8 +1872,13 @@ ov5640_find_mode(struct ov5640_dev *sensor, enum ov5640_frame_rate fr,
 	     (mode->crop.width != width || mode->crop.height != height)))
 		return NULL;
 
-	/* Check to see if the current mode exceeds the max frame rate */
-	if (ov5640_framerates[fr] > ov5640_framerates[mode->max_fps])
+	/*
+	 * Check to see if the current mode exceeds the max frame rate.
+	 * Only DVP mode uses the frame rate set by s_frame_interval, MIPI
+	 * mode controls framerate by setting blankings.
+	 */
+	if (!ov5640_is_csi2(sensor) &&
+	    ov5640_framerates[fr] > ov5640_framerates[mode->max_fps])
 		return NULL;
 
 	return mode;
@@ -3288,15 +3293,17 @@ static int ov5640_enum_frame_size(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int ov5640_enum_frame_interval(
-	struct v4l2_subdev *sd,
-	struct v4l2_subdev_state *sd_state,
-	struct v4l2_subdev_frame_interval_enum *fie)
+static int ov5640_enum_frame_interval(struct v4l2_subdev *sd,
+				      struct v4l2_subdev_state *sd_state,
+				      struct v4l2_subdev_frame_interval_enum *fie)
 {
 	struct ov5640_dev *sensor = to_ov5640_dev(sd);
 	struct v4l2_fract tpf;
 	int ret;
 
+	if (ov5640_is_csi2(sensor))
+		return -EINVAL;
+
 	if (fie->pad != 0)
 		return -EINVAL;
 	if (fie->index >= OV5640_NUM_FRAMERATES)
@@ -3319,6 +3326,9 @@ static int ov5640_g_frame_interval(struct v4l2_subdev *sd,
 {
 	struct ov5640_dev *sensor = to_ov5640_dev(sd);
 
+	if (ov5640_is_csi2(sensor))
+		return -EINVAL;
+
 	mutex_lock(&sensor->lock);
 	fi->interval = sensor->frame_interval;
 	mutex_unlock(&sensor->lock);
@@ -3333,6 +3343,9 @@ static int ov5640_s_frame_interval(struct v4l2_subdev *sd,
 	const struct ov5640_mode_info *mode;
 	int frame_rate, ret = 0;
 
+	if (ov5640_is_csi2(sensor))
+		return -EINVAL;
+
 	if (fi->pad != 0)
 		return -EINVAL;
 
-- 
2.35.0

