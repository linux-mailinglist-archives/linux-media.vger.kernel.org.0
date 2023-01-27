Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7DAA67DC43
	for <lists+linux-media@lfdr.de>; Fri, 27 Jan 2023 03:27:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233433AbjA0C1b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 21:27:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233367AbjA0C1a (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 21:27:30 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04C60410B9
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 18:27:29 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7F06715FE;
        Fri, 27 Jan 2023 03:27:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674786447;
        bh=YEq+Cou4tYjnRLgJ6gt57ipAthXfhkySym/JKA0ErmE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PrcYbMkHXBUerDBSMaHuWG2CXWGSWd59rLaZlVo/ESvQroJ5qADODPTwEaPRsBWyP
         0D1jkdlfe/+SfT1/gnk9Jtsw3U7+8u0oLxsfVoLWsMtRbLgaua1E0aYT0nvW4Vk2U6
         LR8M0RR3XM41i9I1xe/ZoMC95LTQuVKdeX8+orvU=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Adam Ford <aford173@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com
Subject: [PATCH v1 6/6] media: imx: imx7-media-csi: Use V4L2 subdev active state
Date:   Fri, 27 Jan 2023 04:27:15 +0200
Message-Id: <20230127022715.27234-7-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230127022715.27234-1-laurent.pinchart@ideasonboard.com>
References: <20230127022715.27234-1-laurent.pinchart@ideasonboard.com>
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

Use the V4L2 subdev active state API to store the active format. This
simplifies the driver not only by dropping the state stored in the
imx7_csi structure, but also by replacing the manual lock with the state
lock.

The is_streaming field is now protected by the active state lock, either
explicitly in .s_stream(), where the active state is locked manually, or
implicitly in .set_fmt(), which is called with the state locked.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/nxp/imx7-media-csi.c | 164 ++++++--------------
 1 file changed, 49 insertions(+), 115 deletions(-)

diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
index 052acbd683a8..9275447987d1 100644
--- a/drivers/media/platform/nxp/imx7-media-csi.c
+++ b/drivers/media/platform/nxp/imx7-media-csi.c
@@ -211,7 +211,6 @@ struct imx7_csi {
 	int irq;
 	struct clk *mclk;
 
-	struct mutex lock; /* Protects is_streaming, format_mbus, cc */
 	spinlock_t irqlock; /* Protects last_eof */
 
 	/* Media and V4L2 device */
@@ -227,8 +226,6 @@ struct imx7_csi {
 	struct v4l2_subdev sd;
 	struct media_pad pad[IMX7_CSI_PADS_NUM];
 
-	struct v4l2_mbus_framefmt format_mbus[IMX7_CSI_PADS_NUM];
-
 	/* Video device */
 	struct video_device *vdev;		/* Video device */
 	struct media_pad vdev_pad;		/* Video device pad */
@@ -509,7 +506,8 @@ static void imx7_csi_dma_stop(struct imx7_csi *csi)
 	imx7_csi_hw_disable_irq(csi);
 }
 
-static void imx7_csi_configure(struct imx7_csi *csi)
+static void imx7_csi_configure(struct imx7_csi *csi,
+			       struct v4l2_subdev_state *sd_state)
 {
 	struct v4l2_pix_format *out_pix = &csi->vdev_fmt;
 	int width = out_pix->width;
@@ -540,12 +538,17 @@ static void imx7_csi_configure(struct imx7_csi *csi)
 		    out_pix->pixelformat == V4L2_PIX_FMT_YUYV)
 			width *= 2;
 	} else {
+		const struct v4l2_mbus_framefmt *sink_fmt;
+
+		sink_fmt = v4l2_subdev_get_pad_format(&csi->sd, sd_state,
+						      IMX7_CSI_PAD_SINK);
+
 		cr1 = BIT_SOF_POL | BIT_REDGE | BIT_HSYNC_POL | BIT_FCC
 		    | BIT_MCLKDIV(1) | BIT_MCLKEN;
 
 		cr18 |= BIT_DATA_FROM_MIPI;
 
-		switch (csi->format_mbus[IMX7_CSI_PAD_SINK].code) {
+		switch (sink_fmt->code) {
 		case MEDIA_BUS_FMT_Y8_1X8:
 		case MEDIA_BUS_FMT_SBGGR8_1X8:
 		case MEDIA_BUS_FMT_SGBRG8_1X8:
@@ -626,7 +629,8 @@ static void imx7_csi_configure(struct imx7_csi *csi)
 	imx7_csi_reg_write(csi, stride, CSI_CSIFBUF_PARA);
 }
 
-static int imx7_csi_init(struct imx7_csi *csi)
+static int imx7_csi_init(struct imx7_csi *csi,
+			 struct v4l2_subdev_state *sd_state)
 {
 	int ret;
 
@@ -634,7 +638,7 @@ static int imx7_csi_init(struct imx7_csi *csi)
 	if (ret < 0)
 		return ret;
 
-	imx7_csi_configure(csi);
+	imx7_csi_configure(csi, sd_state);
 
 	ret = imx7_csi_dma_setup(csi);
 	if (ret < 0)
@@ -1417,7 +1421,7 @@ static int imx7_csi_video_validate_fmt(struct imx7_csi *csi)
 	/* Retrieve the media bus format on the source subdev. */
 	fmt_src.pad = IMX7_CSI_PAD_SRC;
 	fmt_src.which = V4L2_SUBDEV_FORMAT_ACTIVE;
-	ret = v4l2_subdev_call(&csi->sd, pad, get_fmt, NULL, &fmt_src);
+	ret = v4l2_subdev_call_state_active(&csi->sd, pad, get_fmt, &fmt_src);
 	if (ret)
 		return ret;
 
@@ -1725,12 +1729,13 @@ static int imx7_csi_video_init(struct imx7_csi *csi)
 static int imx7_csi_s_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct imx7_csi *csi = v4l2_get_subdevdata(sd);
+	struct v4l2_subdev_state *sd_state;
 	int ret = 0;
 
-	mutex_lock(&csi->lock);
+	sd_state = v4l2_subdev_lock_and_get_active_state(sd);
 
 	if (enable) {
-		ret = imx7_csi_init(csi);
+		ret = imx7_csi_init(csi, sd_state);
 		if (ret < 0)
 			goto out_unlock;
 
@@ -1752,29 +1757,14 @@ static int imx7_csi_s_stream(struct v4l2_subdev *sd, int enable)
 	csi->is_streaming = !!enable;
 
 out_unlock:
-	mutex_unlock(&csi->lock);
+	v4l2_subdev_unlock_state(sd_state);
 
 	return ret;
 }
 
-static struct v4l2_mbus_framefmt *
-imx7_csi_get_format(struct imx7_csi *csi,
-		    struct v4l2_subdev_state *sd_state,
-		    unsigned int pad,
-		    enum v4l2_subdev_format_whence which)
-{
-	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_format(&csi->sd, sd_state, pad);
-
-	return &csi->format_mbus[pad];
-}
-
 static int imx7_csi_init_cfg(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_state *sd_state)
 {
-	const enum v4l2_subdev_format_whence which =
-		sd_state ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
-	struct imx7_csi *csi = v4l2_get_subdevdata(sd);
 	const struct imx7_csi_pixfmt *cc;
 	int i;
 
@@ -1782,7 +1772,7 @@ static int imx7_csi_init_cfg(struct v4l2_subdev *sd,
 
 	for (i = 0; i < IMX7_CSI_PADS_NUM; i++) {
 		struct v4l2_mbus_framefmt *mf =
-			imx7_csi_get_format(csi, sd_state, i, which);
+			v4l2_subdev_get_pad_format(sd, sd_state, i);
 
 		mf->code = IMX7_CSI_DEF_MBUS_CODE;
 		mf->width = IMX7_CSI_DEF_PIX_WIDTH;
@@ -1803,59 +1793,30 @@ static int imx7_csi_enum_mbus_code(struct v4l2_subdev *sd,
 				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_mbus_code_enum *code)
 {
-	struct imx7_csi *csi = v4l2_get_subdevdata(sd);
 	struct v4l2_mbus_framefmt *in_fmt;
 	int ret = 0;
 
-	mutex_lock(&csi->lock);
-
-	in_fmt = imx7_csi_get_format(csi, sd_state, IMX7_CSI_PAD_SINK,
-				     code->which);
+	in_fmt = v4l2_subdev_get_pad_format(sd, sd_state, IMX7_CSI_PAD_SINK);
 
 	switch (code->pad) {
 	case IMX7_CSI_PAD_SINK:
 		ret = imx7_csi_enum_mbus_formats(&code->code, code->index);
 		break;
+
 	case IMX7_CSI_PAD_SRC:
 		if (code->index != 0) {
 			ret = -EINVAL;
-			goto out_unlock;
+			break;
 		}
 
 		code->code = in_fmt->code;
 		break;
+
 	default:
 		ret = -EINVAL;
+		break;
 	}
 
-out_unlock:
-	mutex_unlock(&csi->lock);
-
-	return ret;
-}
-
-static int imx7_csi_get_fmt(struct v4l2_subdev *sd,
-			    struct v4l2_subdev_state *sd_state,
-			    struct v4l2_subdev_format *sdformat)
-{
-	struct imx7_csi *csi = v4l2_get_subdevdata(sd);
-	struct v4l2_mbus_framefmt *fmt;
-	int ret = 0;
-
-	mutex_lock(&csi->lock);
-
-	fmt = imx7_csi_get_format(csi, sd_state, sdformat->pad,
-				  sdformat->which);
-	if (!fmt) {
-		ret = -EINVAL;
-		goto out_unlock;
-	}
-
-	sdformat->format = *fmt;
-
-out_unlock:
-	mutex_unlock(&csi->lock);
-
 	return ret;
 }
 
@@ -1905,19 +1866,16 @@ static void imx7_csi_try_colorimetry(struct v4l2_mbus_framefmt *tryfmt)
 						      tryfmt->ycbcr_enc);
 }
 
-static int imx7_csi_try_fmt(struct imx7_csi *csi,
-			    struct v4l2_subdev_state *sd_state,
-			    struct v4l2_subdev_format *sdformat,
-			    const struct imx7_csi_pixfmt **cc)
+static void imx7_csi_try_fmt(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *sd_state,
+			     struct v4l2_subdev_format *sdformat,
+			     const struct imx7_csi_pixfmt **cc)
 {
 	const struct imx7_csi_pixfmt *in_cc;
 	struct v4l2_mbus_framefmt *in_fmt;
 	u32 code;
 
-	in_fmt = imx7_csi_get_format(csi, sd_state, IMX7_CSI_PAD_SINK,
-				     sdformat->which);
-	if (!in_fmt)
-		return -EINVAL;
+	in_fmt = v4l2_subdev_get_pad_format(sd, sd_state, IMX7_CSI_PAD_SINK);
 
 	switch (sdformat->pad) {
 	case IMX7_CSI_PAD_SRC:
@@ -1949,8 +1907,6 @@ static int imx7_csi_try_fmt(struct imx7_csi *csi,
 	}
 
 	imx7_csi_try_colorimetry(&sdformat->format);
-
-	return 0;
 }
 
 static int imx7_csi_set_fmt(struct v4l2_subdev *sd,
@@ -1963,25 +1919,13 @@ static int imx7_csi_set_fmt(struct v4l2_subdev *sd,
 	const struct imx7_csi_pixfmt *cc;
 	struct v4l2_mbus_framefmt *fmt;
 	struct v4l2_subdev_format format;
-	int ret = 0;
 
-	mutex_lock(&csi->lock);
+	if (csi->is_streaming)
+		return -EBUSY;
 
-	if (csi->is_streaming) {
-		ret = -EBUSY;
-		goto out_unlock;
-	}
+	imx7_csi_try_fmt(sd, sd_state, sdformat, &cc);
 
-	ret = imx7_csi_try_fmt(csi, sd_state, sdformat, &cc);
-	if (ret < 0)
-		goto out_unlock;
-
-	fmt = imx7_csi_get_format(csi, sd_state, sdformat->pad,
-				  sdformat->which);
-	if (!fmt) {
-		ret = -EINVAL;
-		goto out_unlock;
-	}
+	fmt = v4l2_subdev_get_pad_format(sd, sd_state, sdformat->pad);
 
 	*fmt = sdformat->format;
 
@@ -1990,19 +1934,14 @@ static int imx7_csi_set_fmt(struct v4l2_subdev *sd,
 		format.pad = IMX7_CSI_PAD_SRC;
 		format.which = sdformat->which;
 		format.format = sdformat->format;
-		if (imx7_csi_try_fmt(csi, sd_state, &format, &outcc)) {
-			ret = -EINVAL;
-			goto out_unlock;
-		}
-		outfmt = imx7_csi_get_format(csi, sd_state, IMX7_CSI_PAD_SRC,
-					     sdformat->which);
+		imx7_csi_try_fmt(sd, sd_state, &format, &outcc);
+
+		outfmt = v4l2_subdev_get_pad_format(sd, sd_state,
+						    IMX7_CSI_PAD_SRC);
 		*outfmt = format.format;
 	}
 
-out_unlock:
-	mutex_unlock(&csi->lock);
-
-	return ret;
+	return 0;
 }
 
 static int imx7_csi_pad_link_validate(struct v4l2_subdev *sd,
@@ -2102,7 +2041,7 @@ static const struct v4l2_subdev_video_ops imx7_csi_video_ops = {
 static const struct v4l2_subdev_pad_ops imx7_csi_pad_ops = {
 	.init_cfg	= imx7_csi_init_cfg,
 	.enum_mbus_code	= imx7_csi_enum_mbus_code,
-	.get_fmt	= imx7_csi_get_fmt,
+	.get_fmt	= v4l2_subdev_get_fmt,
 	.set_fmt	= imx7_csi_set_fmt,
 	.link_validate	= imx7_csi_pad_link_validate,
 };
@@ -2192,6 +2131,7 @@ static void imx7_csi_media_cleanup(struct imx7_csi *csi)
 {
 	v4l2_device_unregister(&csi->v4l2_dev);
 	media_device_unregister(&csi->mdev);
+	v4l2_subdev_cleanup(&csi->sd);
 	media_device_cleanup(&csi->mdev);
 }
 
@@ -2259,6 +2199,10 @@ static int imx7_csi_media_init(struct imx7_csi *csi)
 	if (ret)
 		goto error;
 
+	ret = v4l2_subdev_init_finalize(&csi->sd);
+	if (ret)
+		goto error;
+
 	ret = v4l2_device_register_subdev(&csi->v4l2_dev, &csi->sd);
 	if (ret)
 		goto error;
@@ -2284,27 +2228,22 @@ static int imx7_csi_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, csi);
 
 	spin_lock_init(&csi->irqlock);
-	mutex_init(&csi->lock);
 
 	/* Acquire resources and install interrupt handler. */
 	csi->mclk = devm_clk_get(&pdev->dev, "mclk");
 	if (IS_ERR(csi->mclk)) {
 		ret = PTR_ERR(csi->mclk);
 		dev_err(dev, "Failed to get mclk: %d", ret);
-		goto destroy_mutex;
+		return ret;
 	}
 
 	csi->irq = platform_get_irq(pdev, 0);
-	if (csi->irq < 0) {
-		ret = csi->irq;
-		goto destroy_mutex;
-	}
+	if (csi->irq < 0)
+		return csi->irq;
 
 	csi->regbase = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(csi->regbase)) {
-		ret = PTR_ERR(csi->regbase);
-		goto destroy_mutex;
-	}
+	if (IS_ERR(csi->regbase))
+		return PTR_ERR(csi->regbase);
 
 	csi->model = (enum imx_csi_model)(uintptr_t)of_device_get_match_data(&pdev->dev);
 
@@ -2312,13 +2251,13 @@ static int imx7_csi_probe(struct platform_device *pdev)
 			       (void *)csi);
 	if (ret < 0) {
 		dev_err(dev, "Request CSI IRQ failed.\n");
-		goto destroy_mutex;
+		return ret;
 	}
 
 	/* Initialize all the media device infrastructure. */
 	ret = imx7_csi_media_init(csi);
 	if (ret)
-		goto destroy_mutex;
+		return ret;
 
 	/* Set the default mbus formats. */
 	ret = imx7_csi_init_cfg(&csi->sd, NULL);
@@ -2337,9 +2276,6 @@ static int imx7_csi_probe(struct platform_device *pdev)
 media_cleanup:
 	imx7_csi_media_cleanup(csi);
 
-destroy_mutex:
-	mutex_destroy(&csi->lock);
-
 	return ret;
 }
 
@@ -2353,8 +2289,6 @@ static int imx7_csi_remove(struct platform_device *pdev)
 	v4l2_async_nf_cleanup(&csi->notifier);
 	v4l2_async_unregister_subdev(&csi->sd);
 
-	mutex_destroy(&csi->lock);
-
 	return 0;
 }
 
-- 
Regards,

Laurent Pinchart

