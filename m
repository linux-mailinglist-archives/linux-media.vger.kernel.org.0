Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0627E6987DF
	for <lists+linux-media@lfdr.de>; Wed, 15 Feb 2023 23:30:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229611AbjBOWa2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Feb 2023 17:30:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229756AbjBOWa1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Feb 2023 17:30:27 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C48734C07
        for <linux-media@vger.kernel.org>; Wed, 15 Feb 2023 14:30:26 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8DB17501;
        Wed, 15 Feb 2023 23:30:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676500224;
        bh=c1BXmWdQI78HU7gwfc66Pcn1Uh1MSbmW1jDVBQXTWac=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TV3b2mDNbVRNsQCB91HWCPNiNUgEae49OP9daBKi4QnS5cW5ApP+qnSQj8zAmn4PG
         2vZTjlZ5fHxIiKbDlImqdQJmGhATaGLZrFhS/aWJhkMr2Z/+boFgXA++J7nwI76O/d
         uXSYi3NqfIq9QVsUN00gRPE9i3oGZ/s1sO/usAH0=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH v3 10/15] media: i2c: imx290: Convert V4L2_CID_VBLANK to read/write
Date:   Thu, 16 Feb 2023 00:29:58 +0200
Message-Id: <20230215223003.30170-11-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230215223003.30170-1-laurent.pinchart@ideasonboard.com>
References: <20230215223003.30170-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

The driver exposed V4L2_CID_VBLANK as a read only control to allow
for exposure calculations and determination of the frame rate.

Convert to a read/write control so that the frame rate can be
controlled.
V4L2_CID_VBLANK also sets the limits for the exposure control,
therefore exposure ranges have to be updated when vblank changes
(either via s_ctrl, or via changing mode).

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx290.c | 58 +++++++++++++++++++++++++++++++-------
 1 file changed, 48 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index f82fb05b6695..1ae01cd43efb 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -46,6 +46,7 @@
 #define IMX290_BLKLEVEL					IMX290_REG_16BIT(0x300a)
 #define IMX290_GAIN					IMX290_REG_8BIT(0x3014)
 #define IMX290_VMAX					IMX290_REG_24BIT(0x3018)
+#define IMX290_VMAX_MAX					0x3ffff
 #define IMX290_HMAX					IMX290_REG_16BIT(0x301c)
 #define IMX290_HMAX_MAX					0xffff
 #define IMX290_SHS1					IMX290_REG_24BIT(0x3020)
@@ -106,6 +107,9 @@
 #define IMX290_PGCTRL_THRU				BIT(1)
 #define IMX290_PGCTRL_MODE(n)				((n) << 4)
 
+/* Number of lines by which exposure must be less than VMAX) */
+#define IMX290_EXPOSURE_OFFSET				2
+
 #define IMX290_VMAX_DEFAULT				1125
 
 #define IMX290_PIXEL_RATE				148500000
@@ -222,6 +226,7 @@ struct imx290 {
 	struct v4l2_ctrl *link_freq;
 	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *vblank;
+	struct v4l2_ctrl *exposure;
 };
 
 static inline struct imx290 *to_imx290(struct v4l2_subdev *_sd)
@@ -235,7 +240,6 @@ static inline struct imx290 *to_imx290(struct v4l2_subdev *_sd)
 
 static const struct imx290_regval imx290_global_init_settings[] = {
 	{ IMX290_CTRL_07, IMX290_WINMODE_1080P },
-	{ IMX290_VMAX, IMX290_VMAX_DEFAULT },
 	{ IMX290_EXTCK_FREQ, 0x2520 },
 	{ IMX290_WINWV_OB, 12 },
 	{ IMX290_WINPH, 0 },
@@ -659,6 +663,16 @@ static int imx290_setup_format(struct imx290 *imx290,
 /* ----------------------------------------------------------------------------
  * Controls
  */
+static void imx290_exposure_update(struct imx290 *imx290,
+				   const struct imx290_mode *mode)
+{
+	unsigned int exposure_max;
+
+	exposure_max = imx290->vblank->val + mode->height -
+		       IMX290_EXPOSURE_OFFSET;
+	__v4l2_ctrl_modify_range(imx290->exposure, 1, exposure_max, 1,
+				 exposure_max);
+}
 
 static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
 {
@@ -666,7 +680,7 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
 					     struct imx290, ctrls);
 	const struct v4l2_mbus_framefmt *format;
 	struct v4l2_subdev_state *state;
-	int ret = 0;
+	int ret = 0, vmax;
 
 	/*
 	 * Return immediately for controls that don't need to be applied to the
@@ -675,6 +689,11 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
 	if (ctrl->flags & V4L2_CTRL_FLAG_READ_ONLY)
 		return 0;
 
+	if (ctrl->id == V4L2_CID_VBLANK) {
+		/* Changing vblank changes the allowed range for exposure. */
+		imx290_exposure_update(imx290, imx290->current_mode);
+	}
+
 	/* V4L2 controls values will be applied only when power is already up */
 	if (!pm_runtime_get_if_in_use(imx290->dev))
 		return 0;
@@ -687,9 +706,23 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
 		ret = imx290_write(imx290, IMX290_GAIN, ctrl->val, NULL);
 		break;
 
+	case V4L2_CID_VBLANK:
+		ret = imx290_write(imx290, IMX290_VMAX,
+				   ctrl->val + imx290->current_mode->height,
+				   NULL);
+		/*
+		 * Due to the way that exposure is programmed in this sensor in
+		 * relation to VMAX, we have to reprogramme it whenever VMAX is
+		 * changed.
+		 * Update ctrl so that the V4L2_CID_EXPOSURE case can refer to
+		 * it.
+		 */
+		ctrl = imx290->exposure;
+		fallthrough;
 	case V4L2_CID_EXPOSURE:
+		vmax = imx290->vblank->val + imx290->current_mode->height;
 		ret = imx290_write(imx290, IMX290_SHS1,
-				   IMX290_VMAX_DEFAULT - ctrl->val - 1, NULL);
+				   vmax - ctrl->val - 1, NULL);
 		break;
 
 	case V4L2_CID_TEST_PATTERN:
@@ -746,13 +779,15 @@ static void imx290_ctrl_update(struct imx290 *imx290,
 {
 	unsigned int hblank_min = mode->hmax_min - mode->width;
 	unsigned int hblank_max = IMX290_HMAX_MAX - mode->width;
-	unsigned int vblank = IMX290_VMAX_DEFAULT - mode->height;
+	unsigned int vblank_min = IMX290_VMAX_DEFAULT - mode->height;
+	unsigned int vblank_max = IMX290_VMAX_MAX - mode->height;
 
 	__v4l2_ctrl_s_ctrl(imx290->link_freq, mode->link_freq_index);
 
 	__v4l2_ctrl_modify_range(imx290->hblank, hblank_min, hblank_max, 1,
 				 hblank_min);
-	__v4l2_ctrl_modify_range(imx290->vblank, vblank, vblank, 1, vblank);
+	__v4l2_ctrl_modify_range(imx290->vblank, vblank_min, vblank_max, 1,
+				 vblank_min);
 }
 
 static int imx290_ctrl_init(struct imx290 *imx290)
@@ -782,9 +817,13 @@ static int imx290_ctrl_init(struct imx290 *imx290)
 	v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
 			  V4L2_CID_ANALOGUE_GAIN, 0, 100, 1, 0);
 
-	v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
-			  V4L2_CID_EXPOSURE, 1, IMX290_VMAX_DEFAULT - 2, 1,
-			  IMX290_VMAX_DEFAULT - 2);
+	/*
+	 * Correct range will be determined through imx290_ctrl_update setting
+	 * V4L2_CID_VBLANK.
+	 */
+	imx290->exposure = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
+					     V4L2_CID_EXPOSURE, 1, 65535, 1,
+					     65535);
 
 	/*
 	 * Set the link frequency, pixel rate, horizontal blanking and vertical
@@ -816,8 +855,6 @@ static int imx290_ctrl_init(struct imx290 *imx290)
 
 	imx290->vblank = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
 					   V4L2_CID_VBLANK, 1, 1, 1, 1);
-	if (imx290->vblank)
-		imx290->vblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
 	v4l2_ctrl_new_fwnode_properties(&imx290->ctrls, &imx290_ctrl_ops,
 					&props);
@@ -1003,6 +1040,7 @@ static int imx290_set_fmt(struct v4l2_subdev *sd,
 		imx290->current_mode = mode;
 
 		imx290_ctrl_update(imx290, &fmt->format, mode);
+		imx290_exposure_update(imx290, mode);
 	}
 
 	*format = fmt->format;
-- 
Regards,

Laurent Pinchart

