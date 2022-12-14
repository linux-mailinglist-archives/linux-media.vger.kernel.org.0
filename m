Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBAF264D392
	for <lists+linux-media@lfdr.de>; Thu, 15 Dec 2022 00:38:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229549AbiLNXir (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Dec 2022 18:38:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229560AbiLNXim (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Dec 2022 18:38:42 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5529A32B96;
        Wed, 14 Dec 2022 15:38:41 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CB8D251E;
        Thu, 15 Dec 2022 00:38:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671061120;
        bh=gcX8XTrk9dKkqVmEauq4sd5O/dSSqEO0xlW9qHHrTR8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=okiItvfkY1i6B+se7Qt/7FC3Hhk61/1nTa/cxKNdTFzm6MIJzk1c4zRlcjkrO+C8L
         qVqPCdJgOAiQ7zsIfl//lp/8LcB+h4SHAmtmwbiBnQQtzsz2GyN+Zw03jiUDu5tzBh
         qFQ/3OmHsR7vgTqSVfiXrhZUp3KbOqZZolWm7d1I=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Thomas Nizan <tnizan@witekio.com>
Subject: [PATCH v3 07/12] media: i2c: max9286: Support 12-bit raw bayer formats
Date:   Thu, 15 Dec 2022 01:38:20 +0200
Message-Id: <20221214233825.13050-8-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221214233825.13050-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20221214233825.13050-1-laurent.pinchart+renesas@ideasonboard.com>
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

Add support for 12-bit raw bayer formats to the driver, configuring the
GMSL format accordingly.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v1:

- Fix incorrect array index when media bus code isn't found
---
 drivers/media/i2c/max9286.c | 128 ++++++++++++++++++++++++++----------
 1 file changed, 95 insertions(+), 33 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 028fa3547282..3f1228c5053b 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -136,6 +136,11 @@
 #define MAX9286_N_PADS			5
 #define MAX9286_SRC_PAD			4
 
+struct max9286_format_info {
+	u32 code;
+	u8 datatype;
+};
+
 struct max9286_source {
 	struct v4l2_subdev *sd;
 	struct fwnode_handle *fwnode;
@@ -218,6 +223,34 @@ static inline struct max9286_priv *sd_to_max9286(struct v4l2_subdev *sd)
 	return container_of(sd, struct max9286_priv, sd);
 }
 
+static const struct max9286_format_info max9286_formats[] = {
+	{
+		.code = MEDIA_BUS_FMT_UYVY8_1X16,
+		.datatype = MAX9286_DATATYPE_YUV422_8BIT,
+	}, {
+		.code = MEDIA_BUS_FMT_VYUY8_1X16,
+		.datatype = MAX9286_DATATYPE_YUV422_8BIT,
+	}, {
+		.code = MEDIA_BUS_FMT_YUYV8_1X16,
+		.datatype = MAX9286_DATATYPE_YUV422_8BIT,
+	}, {
+		.code = MEDIA_BUS_FMT_YVYU8_1X16,
+		.datatype = MAX9286_DATATYPE_YUV422_8BIT,
+	}, {
+		.code = MEDIA_BUS_FMT_SBGGR12_1X12,
+		.datatype = MAX9286_DATATYPE_RAW12,
+	}, {
+		.code = MEDIA_BUS_FMT_SGBRG12_1X12,
+		.datatype = MAX9286_DATATYPE_RAW12,
+	}, {
+		.code = MEDIA_BUS_FMT_SGRBG12_1X12,
+		.datatype = MAX9286_DATATYPE_RAW12,
+	}, {
+		.code = MEDIA_BUS_FMT_SRGGB12_1X12,
+		.datatype = MAX9286_DATATYPE_RAW12,
+	},
+};
+
 /* -----------------------------------------------------------------------------
  * I2C IO
  */
@@ -479,6 +512,38 @@ static int max9286_check_config_link(struct max9286_priv *priv,
 	return 0;
 }
 
+static void max9286_set_video_format(struct max9286_priv *priv,
+				     const struct v4l2_mbus_framefmt *format)
+{
+	const struct max9286_format_info *info = NULL;
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(max9286_formats); ++i) {
+		if (max9286_formats[i].code == format->code) {
+			info = &max9286_formats[i];
+			break;
+		}
+	}
+
+	if (WARN_ON(!info))
+		return;
+
+	/*
+	 * Video format setup:
+	 * Disable CSI output, VC is set according to Link number.
+	 */
+	max9286_write(priv, 0x15, MAX9286_VCTYPE | MAX9286_0X15_RESV);
+
+	/* Enable CSI-2 Lane D0-D3 only, DBL mode. */
+	max9286_write(priv, 0x12, MAX9286_CSIDBL | MAX9286_DBL |
+		      MAX9286_CSILANECNT(priv->csi2_data_lanes) |
+		      info->datatype);
+
+	/* Enable HS/VS encoding, use D14/15 for HS/VS, invert VS. */
+	max9286_write(priv, 0x0c, MAX9286_HVEN | MAX9286_INVVS |
+		      MAX9286_HVSRC_D14);
+}
+
 static void max9286_set_fsync_period(struct max9286_priv *priv)
 {
 	u32 fsync;
@@ -697,6 +762,15 @@ static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
 	int ret;
 
 	if (enable) {
+		const struct v4l2_mbus_framefmt *format;
+
+		/*
+		 * Get the format from the first used sink pad, as all sink
+		 * formats must be identical.
+		 */
+		format = &priv->fmt[__ffs(priv->bound_sources)];
+
+		max9286_set_video_format(priv, format);
 		max9286_set_fsync_period(priv);
 
 		/*
@@ -817,22 +891,20 @@ static int max9286_set_fmt(struct v4l2_subdev *sd,
 {
 	struct max9286_priv *priv = sd_to_max9286(sd);
 	struct v4l2_mbus_framefmt *cfg_fmt;
+	unsigned int i;
 
 	if (format->pad == MAX9286_SRC_PAD)
 		return -EINVAL;
 
-	/* Refuse non YUV422 formats as we hardcode DT to 8 bit YUV422 */
-	switch (format->format.code) {
-	case MEDIA_BUS_FMT_UYVY8_1X16:
-	case MEDIA_BUS_FMT_VYUY8_1X16:
-	case MEDIA_BUS_FMT_YUYV8_1X16:
-	case MEDIA_BUS_FMT_YVYU8_1X16:
-		break;
-	default:
-		format->format.code = MEDIA_BUS_FMT_UYVY8_1X16;
-		break;
+	/* Validate the format. */
+	for (i = 0; i < ARRAY_SIZE(max9286_formats); ++i) {
+		if (max9286_formats[i].code == format->format.code)
+			break;
 	}
 
+	if (i == ARRAY_SIZE(max9286_formats))
+		format->format.code = max9286_formats[0].code;
+
 	cfg_fmt = max9286_get_pad_format(priv, sd_state, format->pad,
 					 format->which);
 	if (!cfg_fmt)
@@ -890,16 +962,20 @@ static const struct v4l2_subdev_ops max9286_subdev_ops = {
 	.pad		= &max9286_pad_ops,
 };
 
+static const struct v4l2_mbus_framefmt max9286_default_format = {
+	.width		= 1280,
+	.height		= 800,
+	.code		= MEDIA_BUS_FMT_UYVY8_1X16,
+	.colorspace	= V4L2_COLORSPACE_SRGB,
+	.field		= V4L2_FIELD_NONE,
+	.ycbcr_enc	= V4L2_YCBCR_ENC_DEFAULT,
+	.quantization	= V4L2_QUANTIZATION_DEFAULT,
+	.xfer_func	= V4L2_XFER_FUNC_DEFAULT,
+};
+
 static void max9286_init_format(struct v4l2_mbus_framefmt *fmt)
 {
-	fmt->width		= 1280;
-	fmt->height		= 800;
-	fmt->code		= MEDIA_BUS_FMT_UYVY8_1X16;
-	fmt->colorspace		= V4L2_COLORSPACE_SRGB;
-	fmt->field		= V4L2_FIELD_NONE;
-	fmt->ycbcr_enc		= V4L2_YCBCR_ENC_DEFAULT;
-	fmt->quantization	= V4L2_QUANTIZATION_DEFAULT;
-	fmt->xfer_func		= V4L2_XFER_FUNC_DEFAULT;
+	*fmt = max9286_default_format;
 }
 
 static int max9286_open(struct v4l2_subdev *subdev, struct v4l2_subdev_fh *fh)
@@ -1063,23 +1139,9 @@ static int max9286_setup(struct max9286_priv *priv)
 	max9286_write(priv, 0x0b, link_order[priv->route_mask]);
 	max9286_write(priv, 0x69, (0xf & ~priv->route_mask));
 
-	/*
-	 * Video format setup:
-	 * Disable CSI output, VC is set according to Link number.
-	 */
-	max9286_write(priv, 0x15, MAX9286_VCTYPE | MAX9286_0X15_RESV);
-
-	/* Enable CSI-2 Lane D0-D3 only, DBL mode, YUV422 8-bit. */
-	max9286_write(priv, 0x12, MAX9286_CSIDBL | MAX9286_DBL |
-		      MAX9286_CSILANECNT(priv->csi2_data_lanes) |
-		      MAX9286_DATATYPE_YUV422_8BIT);
-
+	max9286_set_video_format(priv, &max9286_default_format);
 	max9286_set_fsync_period(priv);
 
-	/* Enable HS/VS encoding, use D14/15 for HS/VS, invert VS. */
-	max9286_write(priv, 0x0c, MAX9286_HVEN | MAX9286_INVVS |
-		      MAX9286_HVSRC_D14);
-
 	/*
 	 * The overlap window seems to provide additional validation by tracking
 	 * the delay between vsync and frame sync, generating an error if the
-- 
Regards,

Laurent Pinchart

