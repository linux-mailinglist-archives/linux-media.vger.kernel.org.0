Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23D837ACD2E
	for <lists+linux-media@lfdr.de>; Mon, 25 Sep 2023 02:41:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231241AbjIYAle (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Sep 2023 20:41:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231461AbjIYAl2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Sep 2023 20:41:28 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAAE410D
        for <linux-media@vger.kernel.org>; Sun, 24 Sep 2023 17:41:11 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 87398DD9;
        Mon, 25 Sep 2023 02:39:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1695602366;
        bh=voSC35cPVY7DvPSMXKOAOx+pZ7IjRrgWYmCDQMkilN4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gGk+e75HVCPc4bkg1YNmdLv4p/5BJ3C5LPDHo2VmNwaHsIT8ZNZYfNOVcM9VXmbeh
         NlMn1vT23xrEYvCNAY0Y+d7pKwSKZnEJvB46H7iP3b1DN3lB1Tr7KpEW/WzZuTXqXH
         zjviAwiTDD9h55JswWjE7Cehbf+zTxrhsyzXq6zA=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>,
        Paul Elder <paul.elder@ideasonboard.com>,
        linux-rockchip@lists.infradead.org
Subject: [PATCH v2 03/14] media: rkisp1: isp: Use V4L2 subdev active state
Date:   Mon, 25 Sep 2023 03:41:01 +0300
Message-ID: <20230925004112.22797-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230925004112.22797-1-laurent.pinchart@ideasonboard.com>
References: <20230925004112.22797-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PDS_OTHER_BAD_TLD,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the V4L2 subdev active state API to store the active format and crop
rectangle. This simplifies the driver not only by dropping the state
stored in the rkisp1_isp structure, but also by replacing the ops_lock
with the state lock.

The rkisp1_isp.sink_fmt field needs to be kept, as it is accessed from
the stats interrupt handler. To simplify the rkisp1_isp_set_sink_fmt()
implementation, the field is now set when starting the ISP, instead of
when setting the format.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
---
 .../platform/rockchip/rkisp1/rkisp1-common.h  |   6 -
 .../platform/rockchip/rkisp1/rkisp1-isp.c     | 263 +++++++-----------
 2 files changed, 103 insertions(+), 166 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
index 5a03e460e08d..053ce04066b6 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
@@ -190,20 +190,14 @@ struct rkisp1_csi {
  * @sd:				v4l2_subdev variable
  * @rkisp1:			pointer to rkisp1_device
  * @pads:			media pads
- * @pad_cfg:			pads configurations
  * @sink_fmt:			input format
- * @src_fmt:			output format
- * @ops_lock:			ops serialization
  * @frame_sequence:		used to synchronize frame_id between video devices.
  */
 struct rkisp1_isp {
 	struct v4l2_subdev sd;
 	struct rkisp1_device *rkisp1;
 	struct media_pad pads[RKISP1_ISP_PAD_MAX];
-	struct v4l2_subdev_pad_config pad_cfg[RKISP1_ISP_PAD_MAX];
 	const struct rkisp1_mbus_info *sink_fmt;
-	const struct rkisp1_mbus_info *src_fmt;
-	struct mutex ops_lock; /* serialize the subdevice ops */
 	__u32 frame_sequence;
 };
 
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index 07fbb77ce234..88ca8b2283b7 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -53,40 +53,6 @@
  * +---------------------------------------------------------+
  */
 
-/* ----------------------------------------------------------------------------
- * Helpers
- */
-
-static struct v4l2_mbus_framefmt *
-rkisp1_isp_get_pad_fmt(struct rkisp1_isp *isp,
-		       struct v4l2_subdev_state *sd_state,
-		       unsigned int pad, u32 which)
-{
-	struct v4l2_subdev_state state = {
-		.pads = isp->pad_cfg
-	};
-
-	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_format(&isp->sd, sd_state, pad);
-	else
-		return v4l2_subdev_get_try_format(&isp->sd, &state, pad);
-}
-
-static struct v4l2_rect *
-rkisp1_isp_get_pad_crop(struct rkisp1_isp *isp,
-			struct v4l2_subdev_state *sd_state,
-			unsigned int pad, u32 which)
-{
-	struct v4l2_subdev_state state = {
-		.pads = isp->pad_cfg
-	};
-
-	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_crop(&isp->sd, sd_state, pad);
-	else
-		return v4l2_subdev_get_try_crop(&isp->sd, &state, pad);
-}
-
 /* ----------------------------------------------------------------------------
  * Camera Interface registers configurations
  */
@@ -96,12 +62,12 @@ rkisp1_isp_get_pad_crop(struct rkisp1_isp *isp,
  * This should only be called when configuring CIF
  * or at the frame end interrupt
  */
-static void rkisp1_config_ism(struct rkisp1_isp *isp)
+static void rkisp1_config_ism(struct rkisp1_isp *isp,
+			      struct v4l2_subdev_state *sd_state)
 {
 	const struct v4l2_rect *src_crop =
-		rkisp1_isp_get_pad_crop(isp, NULL,
-					RKISP1_ISP_PAD_SOURCE_VIDEO,
-					V4L2_SUBDEV_FORMAT_ACTIVE);
+		v4l2_subdev_get_pad_crop(&isp->sd, sd_state,
+					 RKISP1_ISP_PAD_SOURCE_VIDEO);
 	struct rkisp1_device *rkisp1 = isp->rkisp1;
 	u32 val;
 
@@ -125,21 +91,26 @@ static void rkisp1_config_ism(struct rkisp1_isp *isp)
  * configure ISP blocks with input format, size......
  */
 static int rkisp1_config_isp(struct rkisp1_isp *isp,
+			     struct v4l2_subdev_state *sd_state,
 			     enum v4l2_mbus_type mbus_type, u32 mbus_flags)
 {
 	struct rkisp1_device *rkisp1 = isp->rkisp1;
 	u32 isp_ctrl = 0, irq_mask = 0, acq_mult = 0, acq_prop = 0;
-	const struct rkisp1_mbus_info *sink_fmt = isp->sink_fmt;
-	const struct rkisp1_mbus_info *src_fmt = isp->src_fmt;
+	const struct rkisp1_mbus_info *sink_fmt;
+	const struct rkisp1_mbus_info *src_fmt;
+	const struct v4l2_mbus_framefmt *src_frm;
 	const struct v4l2_mbus_framefmt *sink_frm;
 	const struct v4l2_rect *sink_crop;
 
-	sink_frm = rkisp1_isp_get_pad_fmt(isp, NULL,
-					  RKISP1_ISP_PAD_SINK_VIDEO,
-					  V4L2_SUBDEV_FORMAT_ACTIVE);
-	sink_crop = rkisp1_isp_get_pad_crop(isp, NULL,
-					    RKISP1_ISP_PAD_SINK_VIDEO,
-					    V4L2_SUBDEV_FORMAT_ACTIVE);
+	sink_frm = v4l2_subdev_get_pad_format(&isp->sd, sd_state,
+					      RKISP1_ISP_PAD_SINK_VIDEO);
+	sink_crop = v4l2_subdev_get_pad_crop(&isp->sd, sd_state,
+					     RKISP1_ISP_PAD_SINK_VIDEO);
+	src_frm = v4l2_subdev_get_pad_format(&isp->sd, sd_state,
+					     RKISP1_ISP_PAD_SOURCE_VIDEO);
+
+	sink_fmt = rkisp1_mbus_info_get_by_code(sink_frm->code);
+	src_fmt = rkisp1_mbus_info_get_by_code(src_frm->code);
 
 	if (sink_fmt->pixel_enc == V4L2_PIXEL_ENC_BAYER) {
 		acq_mult = 1;
@@ -230,14 +201,15 @@ static int rkisp1_config_isp(struct rkisp1_isp *isp,
 	} else {
 		struct v4l2_mbus_framefmt *src_frm;
 
-		src_frm = rkisp1_isp_get_pad_fmt(isp, NULL,
-						 RKISP1_ISP_PAD_SOURCE_VIDEO,
-						 V4L2_SUBDEV_FORMAT_ACTIVE);
+		src_frm = v4l2_subdev_get_pad_format(&isp->sd, sd_state,
+						     RKISP1_ISP_PAD_SOURCE_VIDEO);
 		rkisp1_params_pre_configure(&rkisp1->params, sink_fmt->bayer_pat,
 					    src_frm->quantization,
 					    src_frm->ycbcr_enc);
 	}
 
+	isp->sink_fmt = sink_fmt;
+
 	return 0;
 }
 
@@ -258,16 +230,17 @@ static void rkisp1_config_path(struct rkisp1_isp *isp,
 
 /* Hardware configure Entry */
 static int rkisp1_config_cif(struct rkisp1_isp *isp,
+			     struct v4l2_subdev_state *sd_state,
 			     enum v4l2_mbus_type mbus_type, u32 mbus_flags)
 {
 	int ret;
 
-	ret = rkisp1_config_isp(isp, mbus_type, mbus_flags);
+	ret = rkisp1_config_isp(isp, sd_state, mbus_type, mbus_flags);
 	if (ret)
 		return ret;
 
 	rkisp1_config_path(isp, mbus_type);
-	rkisp1_config_ism(isp);
+	rkisp1_config_ism(isp, sd_state);
 
 	return 0;
 }
@@ -328,9 +301,12 @@ static void rkisp1_config_clk(struct rkisp1_isp *isp)
 	}
 }
 
-static void rkisp1_isp_start(struct rkisp1_isp *isp)
+static void rkisp1_isp_start(struct rkisp1_isp *isp,
+			     struct v4l2_subdev_state *sd_state)
 {
 	struct rkisp1_device *rkisp1 = isp->rkisp1;
+	const struct v4l2_mbus_framefmt *src_fmt;
+	const struct rkisp1_mbus_info *src_info;
 	u32 val;
 
 	rkisp1_config_clk(isp);
@@ -342,7 +318,11 @@ static void rkisp1_isp_start(struct rkisp1_isp *isp)
 	       RKISP1_CIF_ISP_CTRL_ISP_INFORM_ENABLE;
 	rkisp1_write(rkisp1, RKISP1_CIF_ISP_CTRL, val);
 
-	if (isp->src_fmt->pixel_enc != V4L2_PIXEL_ENC_BAYER)
+	src_fmt = v4l2_subdev_get_pad_format(&isp->sd, sd_state,
+					     RKISP1_ISP_PAD_SOURCE_VIDEO);
+	src_info = rkisp1_mbus_info_get_by_code(src_fmt->code);
+
+	if (src_info->pixel_enc != V4L2_PIXEL_ENC_BAYER)
 		rkisp1_params_post_configure(&rkisp1->params);
 }
 
@@ -436,7 +416,7 @@ static int rkisp1_isp_init_config(struct v4l2_subdev *sd,
 	struct v4l2_rect *sink_crop, *src_crop;
 
 	/* Video. */
-	sink_fmt = v4l2_subdev_get_try_format(sd, sd_state,
+	sink_fmt = v4l2_subdev_get_pad_format(sd, sd_state,
 					      RKISP1_ISP_PAD_SINK_VIDEO);
 	sink_fmt->width = RKISP1_DEFAULT_WIDTH;
 	sink_fmt->height = RKISP1_DEFAULT_HEIGHT;
@@ -447,14 +427,14 @@ static int rkisp1_isp_init_config(struct v4l2_subdev *sd,
 	sink_fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
 	sink_fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
 
-	sink_crop = v4l2_subdev_get_try_crop(sd, sd_state,
+	sink_crop = v4l2_subdev_get_pad_crop(sd, sd_state,
 					     RKISP1_ISP_PAD_SINK_VIDEO);
 	sink_crop->width = RKISP1_DEFAULT_WIDTH;
 	sink_crop->height = RKISP1_DEFAULT_HEIGHT;
 	sink_crop->left = 0;
 	sink_crop->top = 0;
 
-	src_fmt = v4l2_subdev_get_try_format(sd, sd_state,
+	src_fmt = v4l2_subdev_get_pad_format(sd, sd_state,
 					     RKISP1_ISP_PAD_SOURCE_VIDEO);
 	*src_fmt = *sink_fmt;
 	src_fmt->code = RKISP1_DEF_SRC_PAD_FMT;
@@ -463,14 +443,14 @@ static int rkisp1_isp_init_config(struct v4l2_subdev *sd,
 	src_fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
 	src_fmt->quantization = V4L2_QUANTIZATION_LIM_RANGE;
 
-	src_crop = v4l2_subdev_get_try_crop(sd, sd_state,
+	src_crop = v4l2_subdev_get_pad_crop(sd, sd_state,
 					    RKISP1_ISP_PAD_SOURCE_VIDEO);
 	*src_crop = *sink_crop;
 
 	/* Parameters and statistics. */
-	sink_fmt = v4l2_subdev_get_try_format(sd, sd_state,
+	sink_fmt = v4l2_subdev_get_pad_format(sd, sd_state,
 					      RKISP1_ISP_PAD_SINK_PARAMS);
-	src_fmt = v4l2_subdev_get_try_format(sd, sd_state,
+	src_fmt = v4l2_subdev_get_pad_format(sd, sd_state,
 					     RKISP1_ISP_PAD_SOURCE_STATS);
 	sink_fmt->width = 0;
 	sink_fmt->height = 0;
@@ -483,8 +463,7 @@ static int rkisp1_isp_init_config(struct v4l2_subdev *sd,
 
 static void rkisp1_isp_set_src_fmt(struct rkisp1_isp *isp,
 				   struct v4l2_subdev_state *sd_state,
-				   struct v4l2_mbus_framefmt *format,
-				   unsigned int which)
+				   struct v4l2_mbus_framefmt *format)
 {
 	const struct rkisp1_mbus_info *sink_info;
 	const struct rkisp1_mbus_info *src_info;
@@ -493,12 +472,12 @@ static void rkisp1_isp_set_src_fmt(struct rkisp1_isp *isp,
 	const struct v4l2_rect *src_crop;
 	bool set_csc;
 
-	sink_fmt = rkisp1_isp_get_pad_fmt(isp, sd_state,
-					  RKISP1_ISP_PAD_SINK_VIDEO, which);
-	src_fmt = rkisp1_isp_get_pad_fmt(isp, sd_state,
-					 RKISP1_ISP_PAD_SOURCE_VIDEO, which);
-	src_crop = rkisp1_isp_get_pad_crop(isp, sd_state,
-					   RKISP1_ISP_PAD_SOURCE_VIDEO, which);
+	sink_fmt = v4l2_subdev_get_pad_format(&isp->sd, sd_state,
+					      RKISP1_ISP_PAD_SINK_VIDEO);
+	src_fmt = v4l2_subdev_get_pad_format(&isp->sd, sd_state,
+					     RKISP1_ISP_PAD_SOURCE_VIDEO);
+	src_crop = v4l2_subdev_get_pad_crop(&isp->sd, sd_state,
+					    RKISP1_ISP_PAD_SOURCE_VIDEO);
 
 	/*
 	 * Media bus code. The ISP can operate in pass-through mode (Bayer in,
@@ -581,26 +560,20 @@ static void rkisp1_isp_set_src_fmt(struct rkisp1_isp *isp,
 	 */
 	if (set_csc)
 		format->flags |= V4L2_MBUS_FRAMEFMT_SET_CSC;
-
-	/* Store the source format info when setting the active format. */
-	if (which == V4L2_SUBDEV_FORMAT_ACTIVE)
-		isp->src_fmt = src_info;
 }
 
 static void rkisp1_isp_set_src_crop(struct rkisp1_isp *isp,
 				    struct v4l2_subdev_state *sd_state,
-				    struct v4l2_rect *r, unsigned int which)
+				    struct v4l2_rect *r)
 {
 	struct v4l2_mbus_framefmt *src_fmt;
 	const struct v4l2_rect *sink_crop;
 	struct v4l2_rect *src_crop;
 
-	src_crop = rkisp1_isp_get_pad_crop(isp, sd_state,
-					   RKISP1_ISP_PAD_SOURCE_VIDEO,
-					   which);
-	sink_crop = rkisp1_isp_get_pad_crop(isp, sd_state,
-					    RKISP1_ISP_PAD_SINK_VIDEO,
-					    which);
+	src_crop = v4l2_subdev_get_pad_crop(&isp->sd, sd_state,
+					    RKISP1_ISP_PAD_SOURCE_VIDEO);
+	sink_crop = v4l2_subdev_get_pad_crop(&isp->sd, sd_state,
+					     RKISP1_ISP_PAD_SINK_VIDEO);
 
 	src_crop->left = ALIGN(r->left, 2);
 	src_crop->width = ALIGN(r->width, 2);
@@ -611,24 +584,22 @@ static void rkisp1_isp_set_src_crop(struct rkisp1_isp *isp,
 	*r = *src_crop;
 
 	/* Propagate to out format */
-	src_fmt = rkisp1_isp_get_pad_fmt(isp, sd_state,
-					 RKISP1_ISP_PAD_SOURCE_VIDEO, which);
-	rkisp1_isp_set_src_fmt(isp, sd_state, src_fmt, which);
+	src_fmt = v4l2_subdev_get_pad_format(&isp->sd, sd_state,
+					     RKISP1_ISP_PAD_SOURCE_VIDEO);
+	rkisp1_isp_set_src_fmt(isp, sd_state, src_fmt);
 }
 
 static void rkisp1_isp_set_sink_crop(struct rkisp1_isp *isp,
 				     struct v4l2_subdev_state *sd_state,
-				     struct v4l2_rect *r, unsigned int which)
+				     struct v4l2_rect *r)
 {
 	struct v4l2_rect *sink_crop, *src_crop;
 	const struct v4l2_mbus_framefmt *sink_fmt;
 
-	sink_crop = rkisp1_isp_get_pad_crop(isp, sd_state,
-					    RKISP1_ISP_PAD_SINK_VIDEO,
-					    which);
-	sink_fmt = rkisp1_isp_get_pad_fmt(isp, sd_state,
-					  RKISP1_ISP_PAD_SINK_VIDEO,
-					  which);
+	sink_crop = v4l2_subdev_get_pad_crop(&isp->sd, sd_state,
+					     RKISP1_ISP_PAD_SINK_VIDEO);
+	sink_fmt = v4l2_subdev_get_pad_format(&isp->sd, sd_state,
+					      RKISP1_ISP_PAD_SINK_VIDEO);
 
 	sink_crop->left = ALIGN(r->left, 2);
 	sink_crop->width = ALIGN(r->width, 2);
@@ -639,32 +610,28 @@ static void rkisp1_isp_set_sink_crop(struct rkisp1_isp *isp,
 	*r = *sink_crop;
 
 	/* Propagate to out crop */
-	src_crop = rkisp1_isp_get_pad_crop(isp, sd_state,
-					   RKISP1_ISP_PAD_SOURCE_VIDEO, which);
-	rkisp1_isp_set_src_crop(isp, sd_state, src_crop, which);
+	src_crop = v4l2_subdev_get_pad_crop(&isp->sd, sd_state,
+					    RKISP1_ISP_PAD_SOURCE_VIDEO);
+	rkisp1_isp_set_src_crop(isp, sd_state, src_crop);
 }
 
 static void rkisp1_isp_set_sink_fmt(struct rkisp1_isp *isp,
 				    struct v4l2_subdev_state *sd_state,
-				    struct v4l2_mbus_framefmt *format,
-				    unsigned int which)
+				    struct v4l2_mbus_framefmt *format)
 {
 	const struct rkisp1_mbus_info *mbus_info;
 	struct v4l2_mbus_framefmt *sink_fmt;
 	struct v4l2_rect *sink_crop;
 	bool is_yuv;
 
-	sink_fmt = rkisp1_isp_get_pad_fmt(isp, sd_state,
-					  RKISP1_ISP_PAD_SINK_VIDEO,
-					  which);
+	sink_fmt = v4l2_subdev_get_pad_format(&isp->sd, sd_state,
+					      RKISP1_ISP_PAD_SINK_VIDEO);
 	sink_fmt->code = format->code;
 	mbus_info = rkisp1_mbus_info_get_by_code(sink_fmt->code);
 	if (!mbus_info || !(mbus_info->direction & RKISP1_ISP_SD_SINK)) {
 		sink_fmt->code = RKISP1_DEF_SINK_PAD_FMT;
 		mbus_info = rkisp1_mbus_info_get_by_code(sink_fmt->code);
 	}
-	if (which == V4L2_SUBDEV_FORMAT_ACTIVE)
-		isp->sink_fmt = mbus_info;
 
 	sink_fmt->width = clamp_t(u32, format->width,
 				  RKISP1_ISP_MIN_WIDTH,
@@ -706,23 +673,9 @@ static void rkisp1_isp_set_sink_fmt(struct rkisp1_isp *isp,
 	*format = *sink_fmt;
 
 	/* Propagate to in crop */
-	sink_crop = rkisp1_isp_get_pad_crop(isp, sd_state,
-					    RKISP1_ISP_PAD_SINK_VIDEO,
-					    which);
-	rkisp1_isp_set_sink_crop(isp, sd_state, sink_crop, which);
-}
-
-static int rkisp1_isp_get_fmt(struct v4l2_subdev *sd,
-			      struct v4l2_subdev_state *sd_state,
-			      struct v4l2_subdev_format *fmt)
-{
-	struct rkisp1_isp *isp = to_rkisp1_isp(sd);
-
-	mutex_lock(&isp->ops_lock);
-	fmt->format = *rkisp1_isp_get_pad_fmt(isp, sd_state, fmt->pad,
-					      fmt->which);
-	mutex_unlock(&isp->ops_lock);
-	return 0;
+	sink_crop = v4l2_subdev_get_pad_crop(&isp->sd, sd_state,
+					     RKISP1_ISP_PAD_SINK_VIDEO);
+	rkisp1_isp_set_sink_crop(isp, sd_state, sink_crop);
 }
 
 static int rkisp1_isp_set_fmt(struct v4l2_subdev *sd,
@@ -731,18 +684,13 @@ static int rkisp1_isp_set_fmt(struct v4l2_subdev *sd,
 {
 	struct rkisp1_isp *isp = to_rkisp1_isp(sd);
 
-	mutex_lock(&isp->ops_lock);
 	if (fmt->pad == RKISP1_ISP_PAD_SINK_VIDEO)
-		rkisp1_isp_set_sink_fmt(isp, sd_state, &fmt->format,
-					fmt->which);
+		rkisp1_isp_set_sink_fmt(isp, sd_state, &fmt->format);
 	else if (fmt->pad == RKISP1_ISP_PAD_SOURCE_VIDEO)
-		rkisp1_isp_set_src_fmt(isp, sd_state, &fmt->format,
-				       fmt->which);
+		rkisp1_isp_set_src_fmt(isp, sd_state, &fmt->format);
 	else
-		fmt->format = *rkisp1_isp_get_pad_fmt(isp, sd_state, fmt->pad,
-						      fmt->which);
+		fmt->format = *v4l2_subdev_get_pad_format(sd, sd_state, fmt->pad);
 
-	mutex_unlock(&isp->ops_lock);
 	return 0;
 }
 
@@ -750,39 +698,37 @@ static int rkisp1_isp_get_selection(struct v4l2_subdev *sd,
 				    struct v4l2_subdev_state *sd_state,
 				    struct v4l2_subdev_selection *sel)
 {
-	struct rkisp1_isp *isp = to_rkisp1_isp(sd);
 	int ret = 0;
 
 	if (sel->pad != RKISP1_ISP_PAD_SOURCE_VIDEO &&
 	    sel->pad != RKISP1_ISP_PAD_SINK_VIDEO)
 		return -EINVAL;
 
-	mutex_lock(&isp->ops_lock);
 	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP_BOUNDS:
 		if (sel->pad == RKISP1_ISP_PAD_SINK_VIDEO) {
 			struct v4l2_mbus_framefmt *fmt;
 
-			fmt = rkisp1_isp_get_pad_fmt(isp, sd_state, sel->pad,
-						     sel->which);
+			fmt = v4l2_subdev_get_pad_format(sd, sd_state, sel->pad);
 			sel->r.height = fmt->height;
 			sel->r.width = fmt->width;
 			sel->r.left = 0;
 			sel->r.top = 0;
 		} else {
-			sel->r = *rkisp1_isp_get_pad_crop(isp, sd_state,
-							  RKISP1_ISP_PAD_SINK_VIDEO,
-							  sel->which);
+			sel->r = *v4l2_subdev_get_pad_crop(sd, sd_state,
+							   RKISP1_ISP_PAD_SINK_VIDEO);
 		}
 		break;
+
 	case V4L2_SEL_TGT_CROP:
-		sel->r = *rkisp1_isp_get_pad_crop(isp, sd_state, sel->pad,
-						  sel->which);
+		sel->r = *v4l2_subdev_get_pad_crop(sd, sd_state, sel->pad);
 		break;
+
 	default:
 		ret = -EINVAL;
+		break;
 	}
-	mutex_unlock(&isp->ops_lock);
+
 	return ret;
 }
 
@@ -798,15 +744,14 @@ static int rkisp1_isp_set_selection(struct v4l2_subdev *sd,
 
 	dev_dbg(isp->rkisp1->dev, "%s: pad: %d sel(%d,%d)/%dx%d\n", __func__,
 		sel->pad, sel->r.left, sel->r.top, sel->r.width, sel->r.height);
-	mutex_lock(&isp->ops_lock);
+
 	if (sel->pad == RKISP1_ISP_PAD_SINK_VIDEO)
-		rkisp1_isp_set_sink_crop(isp, sd_state, &sel->r, sel->which);
+		rkisp1_isp_set_sink_crop(isp, sd_state, &sel->r);
 	else if (sel->pad == RKISP1_ISP_PAD_SOURCE_VIDEO)
-		rkisp1_isp_set_src_crop(isp, sd_state, &sel->r, sel->which);
+		rkisp1_isp_set_src_crop(isp, sd_state, &sel->r);
 	else
 		ret = -EINVAL;
 
-	mutex_unlock(&isp->ops_lock);
 	return ret;
 }
 
@@ -824,7 +769,7 @@ static const struct v4l2_subdev_pad_ops rkisp1_isp_pad_ops = {
 	.get_selection = rkisp1_isp_get_selection,
 	.set_selection = rkisp1_isp_set_selection,
 	.init_cfg = rkisp1_isp_init_config,
-	.get_fmt = rkisp1_isp_get_fmt,
+	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = rkisp1_isp_set_fmt,
 	.link_validate = v4l2_subdev_link_validate_default,
 };
@@ -837,6 +782,7 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct rkisp1_isp *isp = to_rkisp1_isp(sd);
 	struct rkisp1_device *rkisp1 = isp->rkisp1;
+	struct v4l2_subdev_state *sd_state;
 	struct media_pad *source_pad;
 	struct media_pad *sink_pad;
 	enum v4l2_mbus_type mbus_type;
@@ -881,21 +827,23 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
 	}
 
 	isp->frame_sequence = -1;
-	mutex_lock(&isp->ops_lock);
-	ret = rkisp1_config_cif(isp, mbus_type, mbus_flags);
-	if (ret)
-		goto mutex_unlock;
 
-	rkisp1_isp_start(isp);
+	sd_state = v4l2_subdev_lock_and_get_active_state(sd);
+
+	ret = rkisp1_config_cif(isp, sd_state, mbus_type, mbus_flags);
+	if (ret)
+		goto out_unlock;
+
+	rkisp1_isp_start(isp, sd_state);
 
 	ret = v4l2_subdev_call(rkisp1->source, video, s_stream, true);
 	if (ret) {
 		rkisp1_isp_stop(isp);
-		goto mutex_unlock;
+		goto out_unlock;
 	}
 
-mutex_unlock:
-	mutex_unlock(&isp->ops_lock);
+out_unlock:
+	v4l2_subdev_unlock_state(sd_state);
 	return ret;
 }
 
@@ -933,9 +881,6 @@ static const struct v4l2_subdev_ops rkisp1_isp_ops = {
 
 int rkisp1_isp_register(struct rkisp1_device *rkisp1)
 {
-	struct v4l2_subdev_state state = {
-		.pads = rkisp1->isp.pad_cfg
-	};
 	struct rkisp1_isp *isp = &rkisp1->isp;
 	struct media_pad *pads = isp->pads;
 	struct v4l2_subdev *sd = &isp->sd;
@@ -956,27 +901,26 @@ int rkisp1_isp_register(struct rkisp1_device *rkisp1)
 	pads[RKISP1_ISP_PAD_SOURCE_VIDEO].flags = MEDIA_PAD_FL_SOURCE;
 	pads[RKISP1_ISP_PAD_SOURCE_STATS].flags = MEDIA_PAD_FL_SOURCE;
 
-	isp->sink_fmt = rkisp1_mbus_info_get_by_code(RKISP1_DEF_SINK_PAD_FMT);
-	isp->src_fmt = rkisp1_mbus_info_get_by_code(RKISP1_DEF_SRC_PAD_FMT);
-
-	mutex_init(&isp->ops_lock);
 	ret = media_entity_pads_init(&sd->entity, RKISP1_ISP_PAD_MAX, pads);
 	if (ret)
-		goto error;
+		goto err_entity_cleanup;
+
+	ret = v4l2_subdev_init_finalize(sd);
+	if (ret)
+		goto err_subdev_cleanup;
 
 	ret = v4l2_device_register_subdev(&rkisp1->v4l2_dev, sd);
 	if (ret) {
 		dev_err(rkisp1->dev, "Failed to register isp subdev\n");
-		goto error;
+		goto err_subdev_cleanup;
 	}
 
-	rkisp1_isp_init_config(sd, &state);
-
 	return 0;
 
-error:
+err_subdev_cleanup:
+	v4l2_subdev_cleanup(sd);
+err_entity_cleanup:
 	media_entity_cleanup(&sd->entity);
-	mutex_destroy(&isp->ops_lock);
 	isp->sd.v4l2_dev = NULL;
 	return ret;
 }
@@ -990,7 +934,6 @@ void rkisp1_isp_unregister(struct rkisp1_device *rkisp1)
 
 	v4l2_device_unregister_subdev(&isp->sd);
 	media_entity_cleanup(&isp->sd.entity);
-	mutex_destroy(&isp->ops_lock);
 }
 
 /* ----------------------------------------------------------------------------
-- 
Regards,

Laurent Pinchart

