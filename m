Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27B7E6E5E2A
	for <lists+linux-media@lfdr.de>; Tue, 18 Apr 2023 12:04:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230138AbjDRKEL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Apr 2023 06:04:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbjDRKEK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Apr 2023 06:04:10 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E95546B8
        for <linux-media@vger.kernel.org>; Tue, 18 Apr 2023 03:04:08 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4895EF07;
        Tue, 18 Apr 2023 12:03:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1681812240;
        bh=10Ei9nqKwkA5fMOTYYArhMOWhmSN1lqc3pFQPXZlkdU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pFJbZUvpZT1D9OZph+BhxCv1j8C8xzR7iW7bdcPsrhBJbkoUt72tr+TZ6NFgUrMVF
         cuNNB/NlxF7I6pG45mvROm9upuCLH52sXp9hPWBU2EZe54HLdpin19lH/xSNz2Q2Jm
         c1QnR8Apdf2AvWeu7rkbAsuYPxbcnYGQJZpaUk1U=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] media: imx: imx7-media-csi: Init default format with __imx7_csi_video_try_fmt()
Date:   Tue, 18 Apr 2023 13:04:17 +0300
Message-Id: <20230418100417.20428-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230418071439.197735-1-alexander.stein@ew.tq-group.com>
References: <20230418071439.197735-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the __imx7_csi_video_try_fmt() helper function to initialize the
default format at probe time. This improves consistency by using the
same code path for both default initialization and validation at
runtime, and allows dropping the now unused imx7_csi_find_pixel_format()
function.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Hi Alexander,

This is an additional cleanup that applies on top of "[PATCH v2 0/3] Fix
imx7-media-csi format settings". I've only compile-tested it as I'm
currently lacking access to test hardware. Would you be able to test the
patch ? If so, could you please include it in the v2 of your series ?
---
 drivers/media/platform/nxp/imx7-media-csi.c | 55 +++------------------
 1 file changed, 6 insertions(+), 49 deletions(-)

diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
index 5240670476b2..e52d617eea59 100644
--- a/drivers/media/platform/nxp/imx7-media-csi.c
+++ b/drivers/media/platform/nxp/imx7-media-csi.c
@@ -1014,39 +1014,6 @@ static int imx7_csi_enum_mbus_formats(u32 *code, u32 index)
 	return -EINVAL;
 }
 
-static int imx7_csi_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
-					const struct v4l2_mbus_framefmt *mbus,
-					const struct imx7_csi_pixfmt *cc)
-{
-	u32 width;
-	u32 stride;
-
-	if (!cc) {
-		cc = imx7_csi_find_mbus_format(mbus->code);
-		if (!cc)
-			return -EINVAL;
-	}
-
-	/* Round up width for minimum burst size */
-	width = round_up(mbus->width, 8);
-
-	/* Round up stride for IDMAC line start address alignment */
-	stride = round_up((width * cc->bpp) >> 3, 8);
-
-	pix->width = width;
-	pix->height = mbus->height;
-	pix->pixelformat = cc->fourcc;
-	pix->colorspace = mbus->colorspace;
-	pix->xfer_func = mbus->xfer_func;
-	pix->ycbcr_enc = mbus->ycbcr_enc;
-	pix->quantization = mbus->quantization;
-	pix->field = mbus->field;
-	pix->bytesperline = stride;
-	pix->sizeimage = stride * pix->height;
-
-	return 0;
-}
-
 /* -----------------------------------------------------------------------------
  * Video Capture Device - IOCTLs
  */
@@ -1618,22 +1585,14 @@ static struct imx7_csi_vb2_buffer *imx7_csi_video_next_buf(struct imx7_csi *csi)
 	return buf;
 }
 
-static int imx7_csi_video_init_format(struct imx7_csi *csi)
+static void imx7_csi_video_init_format(struct imx7_csi *csi)
 {
-	struct v4l2_mbus_framefmt format = { };
+	struct v4l2_pix_format *pixfmt = &csi->vdev_fmt;
 
-	format.code = IMX7_CSI_DEF_MBUS_CODE;
-	format.width = IMX7_CSI_DEF_PIX_WIDTH;
-	format.height = IMX7_CSI_DEF_PIX_HEIGHT;
-	format.field = V4L2_FIELD_NONE;
+	pixfmt->width = IMX7_CSI_DEF_PIX_WIDTH;
+	pixfmt->height = IMX7_CSI_DEF_PIX_HEIGHT;
 
-	imx7_csi_mbus_fmt_to_pix_fmt(&csi->vdev_fmt, &format, NULL);
-	csi->vdev_compose.width = format.width;
-	csi->vdev_compose.height = format.height;
-
-	csi->vdev_cc = imx7_csi_find_pixel_format(csi->vdev_fmt.pixelformat);
-
-	return 0;
+	csi->vdev_cc = __imx7_csi_video_try_fmt(pixfmt, &csi->vdev_compose);
 }
 
 static int imx7_csi_video_register(struct imx7_csi *csi)
@@ -1646,9 +1605,7 @@ static int imx7_csi_video_register(struct imx7_csi *csi)
 	vdev->v4l2_dev = v4l2_dev;
 
 	/* Initialize the default format and compose rectangle. */
-	ret = imx7_csi_video_init_format(csi);
-	if (ret < 0)
-		return ret;
+	imx7_csi_video_init_format(csi);
 
 	/* Register the video device. */
 	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
-- 
Regards,

Laurent Pinchart

