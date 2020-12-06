Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38AE82D0846
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 00:56:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728585AbgLFXz7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 6 Dec 2020 18:55:59 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:60444 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728356AbgLFXz7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 6 Dec 2020 18:55:59 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6720014D9;
        Mon,  7 Dec 2020 00:54:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1607298842;
        bh=8pIzBpMAxtzX6PctP1pNAPHiWD9eEHBwXpil6Khcf50=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CSIiRuRkTV9lpw8BcxyOTRLIzxfRVhnNEa2Q4rQd5Gh+QziqI0aTiX49rkzlOA9Fu
         SCXBDmwQlJrj5cu7+kIVvU6hyDujDCfTNVUHNder865/97k3X70YVHExOBuxnO0a9H
         IYrblQtXd+K4lZ7rSAwO+G9XaGsJFWe378ca2JF8=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v3 07/24] media: ti-vpe: cal: Implement subdev ops for CAMERARX
Date:   Mon,  7 Dec 2020 01:53:36 +0200
Message-Id: <20201206235353.26968-8-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201206235353.26968-1-laurent.pinchart@ideasonboard.com>
References: <20201206235353.26968-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implement subdev operations for the CAMERARX. They will be used to
replace calls to custom CAMERARX functions in the V4L2 video device
code, and will be exposed to userspace.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal-camerarx.c | 205 +++++++++++++++++++
 drivers/media/platform/ti-vpe/cal.h          |   2 +
 2 files changed, 207 insertions(+)

diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
index 6af09d4c0049..ca941e3e72e9 100644
--- a/drivers/media/platform/ti-vpe/cal-camerarx.c
+++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
@@ -604,7 +604,209 @@ static int cal_camerarx_parse_dt(struct cal_camerarx *phy)
  * ------------------------------------------------------------------
  */
 
+static inline struct cal_camerarx *to_cal_camerarx(struct v4l2_subdev *sd)
+{
+	return container_of(sd, struct cal_camerarx, subdev);
+}
+
+static struct v4l2_mbus_framefmt *
+cal_camerarx_get_pad_format(struct cal_camerarx *phy,
+			    struct v4l2_subdev_pad_config *cfg,
+			    unsigned int pad, u32 which)
+{
+	switch (which) {
+	case V4L2_SUBDEV_FORMAT_TRY:
+		return v4l2_subdev_get_try_format(&phy->subdev, cfg, pad);
+	case V4L2_SUBDEV_FORMAT_ACTIVE:
+		return &phy->formats[pad];
+	default:
+		return NULL;
+	}
+}
+
+static int cal_camerarx_sd_s_stream(struct v4l2_subdev *sd, int enable)
+{
+	struct cal_camerarx *phy = to_cal_camerarx(sd);
+
+	if (enable)
+		return cal_camerarx_start(phy, NULL);
+
+	cal_camerarx_stop(phy);
+	return 0;
+}
+
+static int cal_camerarx_sd_enum_mbus_code(struct v4l2_subdev *sd,
+					  struct v4l2_subdev_pad_config *cfg,
+					  struct v4l2_subdev_mbus_code_enum *code)
+{
+	struct cal_camerarx *phy = to_cal_camerarx(sd);
+
+	/* No transcoding, source and sink codes must match. */
+	if (code->pad == CAL_CAMERARX_PAD_SOURCE) {
+		struct v4l2_mbus_framefmt *fmt;
+
+		if (code->index > 0)
+			return -EINVAL;
+
+		fmt = cal_camerarx_get_pad_format(phy, cfg,
+						  CAL_CAMERARX_PAD_SINK,
+						  code->which);
+		code->code = fmt->code;
+		return 0;
+	}
+
+	if (code->index >= cal_num_formats)
+		return -EINVAL;
+
+	code->code = cal_formats[code->index].code;
+
+	return 0;
+}
+
+static int cal_camerarx_sd_enum_frame_size(struct v4l2_subdev *sd,
+					   struct v4l2_subdev_pad_config *cfg,
+					   struct v4l2_subdev_frame_size_enum *fse)
+{
+	struct cal_camerarx *phy = to_cal_camerarx(sd);
+	const struct cal_fmt *fmtinfo;
+
+	if (fse->index > 0)
+		return -EINVAL;
+
+	/* No transcoding, source and sink formats must match. */
+	if (fse->pad == CAL_CAMERARX_PAD_SOURCE) {
+		struct v4l2_mbus_framefmt *fmt;
+
+		fmt = cal_camerarx_get_pad_format(phy, cfg,
+						  CAL_CAMERARX_PAD_SINK,
+						  fse->which);
+		if (fse->code != fmt->code)
+			return -EINVAL;
+
+		fse->min_width = fmt->width;
+		fse->max_width = fmt->width;
+		fse->min_height = fmt->height;
+		fse->max_height = fmt->height;
+
+		return 0;
+	}
+
+	fmtinfo = cal_format_by_code(fse->code);
+	if (!fmtinfo)
+		return -EINVAL;
+
+	fse->min_width = CAL_MIN_WIDTH_BYTES * 8 / ALIGN(fmtinfo->bpp, 8);
+	fse->max_width = CAL_MAX_WIDTH_BYTES * 8 / ALIGN(fmtinfo->bpp, 8);
+	fse->min_height = CAL_MIN_HEIGHT_LINES;
+	fse->max_height = CAL_MAX_HEIGHT_LINES;
+
+	return 0;
+}
+
+static int cal_camerarx_sd_get_fmt(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_pad_config *cfg,
+				   struct v4l2_subdev_format *format)
+{
+	struct cal_camerarx *phy = to_cal_camerarx(sd);
+	struct v4l2_mbus_framefmt *fmt;
+
+	fmt = cal_camerarx_get_pad_format(phy, cfg, format->pad, format->which);
+	format->format = *fmt;
+
+	return 0;
+}
+
+static int cal_camerarx_sd_set_fmt(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_pad_config *cfg,
+				   struct v4l2_subdev_format *format)
+{
+	struct cal_camerarx *phy = to_cal_camerarx(sd);
+	const struct cal_fmt *fmtinfo;
+	struct v4l2_mbus_framefmt *fmt;
+	unsigned int bpp;
+
+	/* No transcoding, source and sink formats must match. */
+	if (format->pad == CAL_CAMERARX_PAD_SOURCE)
+		return cal_camerarx_sd_get_fmt(sd, cfg, format);
+
+	/*
+	 * Default to the first format is the requested media bus code isn't
+	 * supported.
+	 */
+	fmtinfo = cal_format_by_code(format->format.code);
+	if (!fmtinfo)
+		fmtinfo = &cal_formats[0];
+
+	/*
+	 * Clamp the size, update the code. The field and colorspace are
+	 * accepted as-is.
+	 */
+	bpp = ALIGN(fmtinfo->bpp, 8);
+
+	format->format.width = clamp_t(unsigned int, format->format.width,
+				       CAL_MIN_WIDTH_BYTES * 8 / bpp,
+				       CAL_MAX_WIDTH_BYTES * 8 / bpp);
+	format->format.height = clamp_t(unsigned int, format->format.height,
+					CAL_MIN_HEIGHT_LINES,
+					CAL_MAX_HEIGHT_LINES);
+	format->format.code = fmtinfo->code;
+
+	/* Store the format and propagate it to the source pad. */
+	fmt = cal_camerarx_get_pad_format(phy, cfg, CAL_CAMERARX_PAD_SINK,
+					  format->which);
+	*fmt = format->format;
+
+	fmt = cal_camerarx_get_pad_format(phy, cfg, CAL_CAMERARX_PAD_SOURCE,
+					  format->which);
+	*fmt = format->format;
+
+	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
+		phy->fmtinfo = fmtinfo;
+
+	return 0;
+}
+
+static int cal_camerarx_sd_init_cfg(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_pad_config *cfg)
+{
+	struct v4l2_subdev_format format = {
+		.which = cfg ? V4L2_SUBDEV_FORMAT_TRY
+		       : V4L2_SUBDEV_FORMAT_ACTIVE,
+		.pad = CAL_CAMERARX_PAD_SINK,
+		.format = {
+			.width = 640,
+			.height = 480,
+			.code = MEDIA_BUS_FMT_UYVY8_2X8,
+			.field = V4L2_FIELD_NONE,
+			.colorspace = V4L2_COLORSPACE_SRGB,
+			.ycbcr_enc = V4L2_YCBCR_ENC_601,
+			.quantization = V4L2_QUANTIZATION_LIM_RANGE,
+			.xfer_func = V4L2_XFER_FUNC_SRGB,
+		},
+	};
+
+	return cal_camerarx_sd_set_fmt(sd, cfg, &format);
+}
+
+static const struct v4l2_subdev_video_ops cal_camerarx_video_ops = {
+	.s_stream = cal_camerarx_sd_s_stream,
+};
+
+static const struct v4l2_subdev_pad_ops cal_camerarx_pad_ops = {
+	.init_cfg = cal_camerarx_sd_init_cfg,
+	.enum_mbus_code = cal_camerarx_sd_enum_mbus_code,
+	.enum_frame_size = cal_camerarx_sd_enum_frame_size,
+	.get_fmt = cal_camerarx_sd_get_fmt,
+	.set_fmt = cal_camerarx_sd_set_fmt,
+};
+
 static const struct v4l2_subdev_ops cal_camerarx_subdev_ops = {
+	.video = &cal_camerarx_video_ops,
+	.pad = &cal_camerarx_pad_ops,
+};
+
+struct media_entity_operations cal_camerarx_media_ops = {
+	.link_validate = v4l2_subdev_link_validate,
 };
 
 /* ------------------------------------------------------------------
@@ -658,11 +860,14 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
 
 	phy->pads[CAL_CAMERARX_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
 	phy->pads[CAL_CAMERARX_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
+	sd->entity.ops = &cal_camerarx_media_ops;
 	ret = media_entity_pads_init(&sd->entity, ARRAY_SIZE(phy->pads),
 				     phy->pads);
 	if (ret)
 		goto error;
 
+	cal_camerarx_sd_init_cfg(sd, NULL);
+
 	ret = v4l2_device_register_subdev(&cal->v4l2_dev, sd);
 	if (ret)
 		goto error;
diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
index d42d381d928f..241edd8b7536 100644
--- a/drivers/media/platform/ti-vpe/cal.h
+++ b/drivers/media/platform/ti-vpe/cal.h
@@ -125,6 +125,8 @@ struct cal_camerarx {
 
 	struct v4l2_subdev	subdev;
 	struct media_pad	pads[2];
+	struct v4l2_mbus_framefmt	formats[2];
+	const struct cal_fmt	*fmtinfo;
 };
 
 struct cal_dev {
-- 
Regards,

Laurent Pinchart

