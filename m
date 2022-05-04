Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78FAA51A505
	for <lists+linux-media@lfdr.de>; Wed,  4 May 2022 18:12:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350816AbiEDQQB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 May 2022 12:16:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353075AbiEDQQA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 May 2022 12:16:00 -0400
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 667F827B39
        for <linux-media@vger.kernel.org>; Wed,  4 May 2022 09:12:24 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 9D9C61BF203;
        Wed,  4 May 2022 16:12:19 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     slongerbeam@gmail.com
Cc:     laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, tomi.valkeinen@ideasonboard.com,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com,
        Eugen.Hristev@microchip.com, jbrunet@baylibre.com,
        paul.elder@ideasonboard.com, eddy.khan@vergesense.com,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v6 15/28] media: ov5640: Add HBLANK control
Date:   Wed,  4 May 2022 18:11:49 +0200
Message-Id: <20220504161153.185169-6-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220504155157.184047-1-jacopo@jmondi.org>
References: <20220504155157.184047-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
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
index 6edd38d6fb63..86a489d8963b 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -321,6 +321,7 @@ struct ov5640_ctrls {
 	struct v4l2_ctrl_handler handler;
 	struct v4l2_ctrl *pixel_rate;
 	struct v4l2_ctrl *link_freq;
+	struct v4l2_ctrl *hblank;
 	struct {
 		struct v4l2_ctrl *auto_exp;
 		struct v4l2_ctrl *exposure;
@@ -2699,6 +2700,8 @@ static int ov5640_update_pixel_rate(struct ov5640_dev *sensor)
 	const struct ov5640_mode_info *mode = sensor->current_mode;
 	enum ov5640_pixel_rate_id pixel_rate_id = mode->pixel_rate;
 	struct v4l2_mbus_framefmt *fmt = &sensor->fmt;
+	const struct ov5640_timings *timings;
+	unsigned int hblank;
 	unsigned int i = 0;
 	u32 pixel_rate;
 	s64 link_freq;
@@ -2756,6 +2759,11 @@ static int ov5640_update_pixel_rate(struct ov5640_dev *sensor)
 	__v4l2_ctrl_s_ctrl_int64(sensor->ctrls.pixel_rate, pixel_rate);
 	__v4l2_ctrl_s_ctrl(sensor->ctrls.link_freq, i);
 
+	timings = ov5640_timings(sensor, mode);
+	hblank = timings->htot - mode->width;
+	__v4l2_ctrl_modify_range(sensor->ctrls.hblank,
+				 hblank, hblank, 1, hblank);
+
 	return 0;
 }
 
@@ -3220,6 +3228,8 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
 	const struct v4l2_ctrl_ops *ops = &ov5640_ctrl_ops;
 	struct ov5640_ctrls *ctrls = &sensor->ctrls;
 	struct v4l2_ctrl_handler *hdl = &ctrls->handler;
+	const struct ov5640_timings *timings;
+	unsigned int hblank;
 	int ret;
 
 	v4l2_ctrl_handler_init(hdl, 32);
@@ -3239,6 +3249,11 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
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
@@ -3288,6 +3303,7 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
 
 	ctrls->pixel_rate->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 	ctrls->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	ctrls->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 	ctrls->gain->flags |= V4L2_CTRL_FLAG_VOLATILE;
 	ctrls->exposure->flags |= V4L2_CTRL_FLAG_VOLATILE;
 
-- 
2.35.1

