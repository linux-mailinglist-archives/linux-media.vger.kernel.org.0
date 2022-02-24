Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99F804C287D
	for <lists+linux-media@lfdr.de>; Thu, 24 Feb 2022 10:48:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232174AbiBXJsE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Feb 2022 04:48:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233009AbiBXJrx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Feb 2022 04:47:53 -0500
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::222])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 729E92804C0
        for <linux-media@vger.kernel.org>; Thu, 24 Feb 2022 01:47:19 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 650ED40005;
        Thu, 24 Feb 2022 09:47:15 +0000 (UTC)
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
Subject: [PATCH v5 18/27] media: ov5640: Implement init_cfg
Date:   Thu, 24 Feb 2022 10:43:04 +0100
Message-Id: <20220224094313.233347-19-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220224094313.233347-1-jacopo@jmondi.org>
References: <20220224094313.233347-1-jacopo@jmondi.org>
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

Implement the init_cfg pad operation to initialize the subdev state
format to the default one.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ov5640.c | 35 +++++++++++++++++++++++++----------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 6f10514e3c11..c95c1f90353d 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -408,6 +408,18 @@ static inline bool ov5640_is_csi2(const struct ov5640_dev *sensor)
  * over i2c.
  */
 /* YUV422 UYVY VGA@30fps */
+
+static const struct v4l2_mbus_framefmt ov5640_default_fmt = {
+	.code = MEDIA_BUS_FMT_UYVY8_2X8,
+	.width = 640,
+	.height = 480,
+	.colorspace = V4L2_COLORSPACE_SRGB,
+	.ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(V4L2_COLORSPACE_SRGB),
+	.quantization = V4L2_QUANTIZATION_FULL_RANGE,
+	.xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(V4L2_COLORSPACE_SRGB),
+	.field = V4L2_FIELD_NONE,
+};
+
 static const struct reg_value ov5640_init_setting[] = {
 	{0x3103, 0x11, 0, 0}, {0x3008, 0x82, 0, 5}, {0x3008, 0x42, 0, 0},
 	{0x3103, 0x03, 0, 0}, {0x3630, 0x36, 0, 0},
@@ -3514,6 +3526,17 @@ static int ov5640_s_stream(struct v4l2_subdev *sd, int enable)
 	return ret;
 }
 
+static int ov5640_init_cfg(struct v4l2_subdev *sd,
+			   struct v4l2_subdev_state *state)
+{
+	struct v4l2_mbus_framefmt *fmt =
+				v4l2_subdev_get_try_format(sd, state, 0);
+
+	*fmt = ov5640_default_fmt;
+
+	return 0;
+}
+
 static const struct v4l2_subdev_core_ops ov5640_core_ops = {
 	.s_power = ov5640_s_power,
 	.log_status = v4l2_ctrl_subdev_log_status,
@@ -3528,6 +3551,7 @@ static const struct v4l2_subdev_video_ops ov5640_video_ops = {
 };
 
 static const struct v4l2_subdev_pad_ops ov5640_pad_ops = {
+	.init_cfg = ov5640_init_cfg,
 	.enum_mbus_code = ov5640_enum_mbus_code,
 	.get_fmt = ov5640_get_fmt,
 	.set_fmt = ov5640_set_fmt,
@@ -3586,7 +3610,6 @@ static int ov5640_probe(struct i2c_client *client)
 	struct device *dev = &client->dev;
 	struct fwnode_handle *endpoint;
 	struct ov5640_dev *sensor;
-	struct v4l2_mbus_framefmt *fmt;
 	u32 rotation;
 	int ret;
 
@@ -3600,15 +3623,7 @@ static int ov5640_probe(struct i2c_client *client)
 	 * default init sequence initialize sensor to
 	 * YUV422 UYVY VGA@30fps
 	 */
-	fmt = &sensor->fmt;
-	fmt->code = MEDIA_BUS_FMT_UYVY8_2X8;
-	fmt->colorspace = V4L2_COLORSPACE_SRGB;
-	fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(fmt->colorspace);
-	fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
-	fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(fmt->colorspace);
-	fmt->width = 640;
-	fmt->height = 480;
-	fmt->field = V4L2_FIELD_NONE;
+	sensor->fmt = ov5640_default_fmt;
 	sensor->frame_interval.numerator = 1;
 	sensor->frame_interval.denominator = ov5640_framerates[OV5640_30_FPS];
 	sensor->current_fr = OV5640_30_FPS;
-- 
2.35.0

