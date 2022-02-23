Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D6314C1608
	for <lists+linux-media@lfdr.de>; Wed, 23 Feb 2022 16:00:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241862AbiBWPAt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Feb 2022 10:00:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236093AbiBWPAt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Feb 2022 10:00:49 -0500
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B89EB717B
        for <linux-media@vger.kernel.org>; Wed, 23 Feb 2022 07:00:21 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id EE76A200014;
        Wed, 23 Feb 2022 15:00:16 +0000 (UTC)
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
Subject: [PATCH v4 15/27] media: ov5640: Add HBLANK control
Date:   Wed, 23 Feb 2022 15:55:51 +0100
Message-Id: <20220223145603.121603-16-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220223145603.121603-1-jacopo@jmondi.org>
References: <20220223145603.121603-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the HBLANK control as read-only.

The hblank value is fixed in the mode definition and is updated
everytime a new format is applied.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ov5640.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 593e702e9658..bf84f32436b1 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -320,6 +320,7 @@ struct ov5640_ctrls {
 	struct v4l2_ctrl_handler handler;
 	struct v4l2_ctrl *pixel_rate;
 	struct v4l2_ctrl *link_freq;
+	struct v4l2_ctrl *hblank;
 	struct {
 		struct v4l2_ctrl *auto_exp;
 		struct v4l2_ctrl *exposure;
@@ -2691,6 +2692,8 @@ static int ov5640_update_pixel_rate(struct ov5640_dev *sensor)
 	const struct ov5640_mode_info *mode = sensor->current_mode;
 	struct v4l2_mbus_framefmt *fmt = &sensor->fmt;
 	enum ov5640_pixel_rate_id pixel_rate_id = mode->pixel_rate;
+	const struct ov5640_timings *timings;
+	unsigned int hblank;
 	unsigned int i = 0;
 	u32 pixel_rate;
 	s64 link_freq;
@@ -2743,6 +2746,11 @@ static int ov5640_update_pixel_rate(struct ov5640_dev *sensor)
 	__v4l2_ctrl_s_ctrl_int64(sensor->ctrls.pixel_rate, pixel_rate);
 	__v4l2_ctrl_s_ctrl(sensor->ctrls.link_freq, i);
 
+	timings = ov5640_timings(sensor, mode);
+	hblank = timings->htot - mode->width;
+	__v4l2_ctrl_modify_range(sensor->ctrls.hblank,
+				 hblank, hblank, 1, hblank);
+
 	return 0;
 }
 
@@ -3207,6 +3215,8 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
 	const struct v4l2_ctrl_ops *ops = &ov5640_ctrl_ops;
 	struct ov5640_ctrls *ctrls = &sensor->ctrls;
 	struct v4l2_ctrl_handler *hdl = &ctrls->handler;
+	const struct ov5640_timings *timings;
+	unsigned int hblank;
 	int ret;
 
 	v4l2_ctrl_handler_init(hdl, 32);
@@ -3226,6 +3236,11 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
 					OV5640_DEFAULT_LINK_FREQ,
 					ov5640_csi2_link_freqs);
 
+	timings = ov5640_timings(sensor, mode);
+	hblank = timings->htot - mode->width;
+	ctrls->hblank = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HBLANK, hblank,
+					  hblank, 1, hblank);
+
 	/* Auto/manual white balance */
 	ctrls->auto_wb = v4l2_ctrl_new_std(hdl, ops,
 					   V4L2_CID_AUTO_WHITE_BALANCE,
@@ -3275,6 +3290,7 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
 
 	ctrls->pixel_rate->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 	ctrls->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	ctrls->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 	ctrls->gain->flags |= V4L2_CTRL_FLAG_VOLATILE;
 	ctrls->exposure->flags |= V4L2_CTRL_FLAG_VOLATILE;
 
-- 
2.35.0

