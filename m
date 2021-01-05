Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03A132EAEAF
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 16:36:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728105AbhAEPgO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 10:36:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726145AbhAEPgN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 10:36:13 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E6E6C061793
        for <linux-media@vger.kernel.org>; Tue,  5 Jan 2021 07:35:33 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6176A1A62;
        Tue,  5 Jan 2021 16:29:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609860599;
        bh=wHKIYPYfZgWKfKPI+uUEIwHHGTk8dqVvTXRHtpyhb0A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FGn7kRRD4TZPdYaxDrkcGWpOcbihq/tVi5lXDIa/lutcld2ZwrfyvR2vAIuyCbM7G
         1vKl+dGWwKcKTbh+sLXy0xo5RrKHtYZUn4GkK+fyKtSQ5XVeI1yMsPLA/rW8qqot8s
         /uhxplvsevxaPvzBRO4zg2DITf4UJIJv1iuRDNSw=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 38/75] media: imx: imx7-media-csi: Validate capture format in .link_validate()
Date:   Tue,  5 Jan 2021 17:28:15 +0200
Message-Id: <20210105152852.5733-39-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Move capture format validation from imx7_csi_configure() to
.link_validate(). This simplifies error handling at stream on time, as
imx7_csi_configure) now becomes a void function.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 45 +++++++++++++---------
 1 file changed, 26 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 26ac4bf95e85..bc45dc5d0275 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -489,7 +489,7 @@ static void imx7_csi_dma_stop(struct imx7_csi *csi)
 	imx_media_free_dma_buf(csi->dev, &csi->underrun_buf);
 }
 
-static int imx7_csi_configure(struct imx7_csi *csi)
+static void imx7_csi_configure(struct imx7_csi *csi)
 {
 	struct imx_media_video_dev *vdev = csi->vdev;
 	struct v4l2_pix_format *out_pix = &vdev->fmt;
@@ -518,7 +518,7 @@ static int imx7_csi_configure(struct imx7_csi *csi)
 			BIT_BASEADDR_CHG_ERR_EN);
 		imx7_csi_reg_write(csi, cr18, CSI_CSICR18);
 
-		return 0;
+		return;
 	}
 
 	imx7_csi_set_imagpara(csi, width, out_pix->height);
@@ -562,14 +562,10 @@ static int imx7_csi_configure(struct imx7_csi *csi)
 			cr18 |= BIT_MIPI_DATA_FORMAT_RAW14;
 		cr1 |= BIT_PIXEL_BIT;
 		break;
-	default:
-		return -EINVAL;
 	}
 
 	imx7_csi_reg_write(csi, cr1, CSI_CSICR1);
 	imx7_csi_reg_write(csi, cr18, CSI_CSICR18);
-
-	return 0;
 }
 
 static int imx7_csi_init(struct imx7_csi *csi)
@@ -622,18 +618,10 @@ static int imx7_csi_streaming_start(struct imx7_csi *csi)
 	if (ret < 0)
 		return ret;
 
-	ret = imx7_csi_configure(csi);
-	if (ret < 0)
-		goto dma_stop;
-
+	imx7_csi_configure(csi);
 	imx7_csi_enable(csi);
 
 	return 0;
-
-dma_stop:
-	imx7_csi_dma_stop(csi);
-
-	return ret;
 }
 
 static int imx7_csi_streaming_stop(struct imx7_csi *csi)
@@ -1010,9 +998,15 @@ static int imx7_csi_pad_link_validate(struct v4l2_subdev *sd,
 				      struct v4l2_subdev_format *sink_fmt)
 {
 	struct imx7_csi *csi = v4l2_get_subdevdata(sd);
+	struct imx_media_video_dev *vdev = csi->vdev;
+	const struct v4l2_pix_format *out_pix = &vdev->fmt;
 	struct media_pad *pad;
 	int ret;
 
+	/*
+	 * Validate the source link, and record whether the CSI mux selects the
+	 * parallel input or the CSI-2 receiver.
+	 */
 	ret = v4l2_subdev_link_validate_default(sd, link, source_fmt, sink_fmt);
 	if (ret)
 		return ret;
@@ -1020,10 +1014,6 @@ static int imx7_csi_pad_link_validate(struct v4l2_subdev *sd,
 	if (!csi->src_sd)
 		return -EPIPE;
 
-	/*
-	 * find the entity that is selected by the CSI mux. This is needed
-	 * to distinguish between a parallel or CSI-2 pipeline.
-	 */
 	pad = imx_media_pipeline_pad(&csi->src_sd->entity, 0, 0, true);
 	if (!pad)
 		return -ENODEV;
@@ -1034,6 +1024,23 @@ static int imx7_csi_pad_link_validate(struct v4l2_subdev *sd,
 
 	mutex_unlock(&csi->lock);
 
+	/* Validate the sink link, ensure the pixel format is supported. */
+	switch (out_pix->pixelformat) {
+	case V4L2_PIX_FMT_UYVY:
+	case V4L2_PIX_FMT_YUYV:
+	case V4L2_PIX_FMT_GREY:
+	case V4L2_PIX_FMT_Y10:
+	case V4L2_PIX_FMT_Y12:
+	case V4L2_PIX_FMT_SBGGR8:
+	case V4L2_PIX_FMT_SBGGR16:
+		break;
+
+	default:
+		dev_dbg(csi->dev, "Invalid capture pixel format 0x%08x\n",
+			out_pix->pixelformat);
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
-- 
Regards,

Laurent Pinchart

