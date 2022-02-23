Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DACF4C1611
	for <lists+linux-media@lfdr.de>; Wed, 23 Feb 2022 16:03:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241876AbiBWPDx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Feb 2022 10:03:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241878AbiBWPDw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Feb 2022 10:03:52 -0500
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EC3A90CC4
        for <linux-media@vger.kernel.org>; Wed, 23 Feb 2022 07:03:24 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 2E7B8E0007;
        Wed, 23 Feb 2022 15:03:18 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, tomi.valkeinen@ideasonboard.com,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com,
        Eugen.Hristev@microchip.com, jbrunet@baylibre.com,
        paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH v4 20/27] media: ov5640: Limit frame_interval to DVP mode only
Date:   Wed, 23 Feb 2022 15:55:56 +0100
Message-Id: <20220223145603.121603-21-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220223145603.121603-1-jacopo@jmondi.org>
References: <20220223145603.121603-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
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
index 88662972abb0..178e203bfcca 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -2002,8 +2002,13 @@ ov5640_find_mode(struct ov5640_dev *sensor, enum ov5640_frame_rate fr,
 	     (mode->width != width || mode->height != height)))
 		return NULL;
 
-	/* Check to see if the current mode exceeds the max frame rate */
-	if (ov5640_framerates[fr] > ov5640_framerates[mode->dvp_timings.max_fps])
+	/*
+	 * Check to see if the current mode exceeds the max frame rate.
+	 * Only DVP mode uses the frame rate set by s_frame_interval, MIPI
+	 * mode controls framerate by setting blankings.
+	 */
+	if (!ov5640_is_csi2(sensor) &&
+	    ov5640_framerates[fr] > ov5640_framerates[mode->dvp_timings.max_fps])
 		return NULL;
 
 	return mode;
@@ -3431,15 +3436,17 @@ static int ov5640_enum_frame_size(struct v4l2_subdev *sd,
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
@@ -3462,6 +3469,9 @@ static int ov5640_g_frame_interval(struct v4l2_subdev *sd,
 {
 	struct ov5640_dev *sensor = to_ov5640_dev(sd);
 
+	if (ov5640_is_csi2(sensor))
+		return -EINVAL;
+
 	mutex_lock(&sensor->lock);
 	fi->interval = sensor->frame_interval;
 	mutex_unlock(&sensor->lock);
@@ -3476,6 +3486,9 @@ static int ov5640_s_frame_interval(struct v4l2_subdev *sd,
 	const struct ov5640_mode_info *mode;
 	int frame_rate, ret = 0;
 
+	if (ov5640_is_csi2(sensor))
+		return -EINVAL;
+
 	if (fi->pad != 0)
 		return -EINVAL;
 
-- 
2.35.0

