Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AB0352149D
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 14:00:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241498AbiEJMEF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 08:04:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241500AbiEJMED (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 08:04:03 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4697146163
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 05:00:05 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BCE41B9A;
        Tue, 10 May 2022 13:59:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1652183985;
        bh=acBHI4Cc+IejSUvtpcxUVa16XO7kLHAsl0OGhtOqMnE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Sge6ZGDd8YVzTc3zpQDrh6SIMXZnB6OzXnUcNtYnol8kE0f039Mkyq3ZJlOu/37VU
         aWfvgF+BtLoYmHWJCI+yJK6Xm2SG7ULsszVIr2zsxzwpOs8rgWCm8l3Job2U2q9uR8
         +Rf61QkUt1NVJRzXgNbFWFzARz8P8A+v8dylrWZY=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>,
        kernel@pengutronix.de
Subject: [PATCH 41/50] staging: media: imx: imx7-media-csi: Drop YUV/RGB/BAYER format selectors
Date:   Tue, 10 May 2022 14:58:50 +0300
Message-Id: <20220510115859.19777-42-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220510115859.19777-1-laurent.pinchart@ideasonboard.com>
References: <20220510115859.19777-1-laurent.pinchart@ideasonboard.com>
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

All the format lookup functions are called with a ANY selector, drop
selector support.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 105 +++++----------------
 1 file changed, 22 insertions(+), 83 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index f3b9ce03318f..ab101d82c253 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -809,17 +809,6 @@ static irqreturn_t imx7_csi_irq_handler(int irq, void *data)
 
 #define IMX_BUS_FMTS(fmt...) (const u32[]) {fmt, 0}
 
-enum imx7_csi_pixfmt_sel {
-	IMX7_CSI_PIXFMT_SEL_YUV   = BIT(0), /* select YUV formats */
-	IMX7_CSI_PIXFMT_SEL_RGB   = BIT(1), /* select RGB formats */
-	IMX7_CSI_PIXFMT_SEL_BAYER = BIT(2), /* select BAYER formats */
-	IMX7_CSI_PIXFMT_SEL_YUV_RGB = IMX7_CSI_PIXFMT_SEL_YUV
-				    | IMX7_CSI_PIXFMT_SEL_RGB,
-	IMX7_CSI_PIXFMT_SEL_ANY = IMX7_CSI_PIXFMT_SEL_YUV
-				| IMX7_CSI_PIXFMT_SEL_RGB
-				| IMX7_CSI_PIXFMT_SEL_BAYER,
-};
-
 /*
  * List of supported pixel formats for the subdevs.
  */
@@ -927,25 +916,16 @@ static const struct imx7_csi_pixfmt pixel_formats[] = {
 
 /*
  * Search in the pixel_formats[] array for an entry with the given fourcc
- * that matches the requested selection criteria and return it.
- *
- * @fourcc: Search for an entry with the given fourcc pixel format.
- * @fmt_sel: Allow entries only with the given selection criteria.
+ * return it.
  */
-static const struct imx7_csi_pixfmt *
-imx7_csi_find_pixel_format(u32 fourcc, enum imx7_csi_pixfmt_sel fmt_sel)
+static const struct imx7_csi_pixfmt *imx7_csi_find_pixel_format(u32 fourcc)
 {
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(pixel_formats); i++) {
 		const struct imx7_csi_pixfmt *fmt = &pixel_formats[i];
-		enum imx7_csi_pixfmt_sel sel;
 
-		sel = fmt->bayer ? IMX7_CSI_PIXFMT_SEL_BAYER
-		    : (fmt->yuv ? IMX7_CSI_PIXFMT_SEL_YUV :
-		       IMX7_CSI_PIXFMT_SEL_RGB);
-
-		if ((fmt_sel & sel) && fmt->fourcc == fourcc)
+		if (fmt->fourcc == fourcc)
 			return fmt;
 	}
 
@@ -954,26 +934,17 @@ imx7_csi_find_pixel_format(u32 fourcc, enum imx7_csi_pixfmt_sel fmt_sel)
 
 /*
  * Search in the pixel_formats[] array for an entry with the given media
- * bus code that matches the requested selection criteria and return it.
- *
- * @code: Search for an entry with the given media-bus code.
- * @fmt_sel: Allow entries only with the given selection criteria.
+ * bus code and return it.
  */
-static const struct imx7_csi_pixfmt *
-imx7_csi_find_mbus_format(u32 code, enum imx7_csi_pixfmt_sel fmt_sel)
+static const struct imx7_csi_pixfmt *imx7_csi_find_mbus_format(u32 code)
 {
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(pixel_formats); i++) {
 		const struct imx7_csi_pixfmt *fmt = &pixel_formats[i];
-		enum imx7_csi_pixfmt_sel sel;
 		unsigned int j;
 
-		sel = fmt->bayer ? IMX7_CSI_PIXFMT_SEL_BAYER
-		    : (fmt->yuv ? IMX7_CSI_PIXFMT_SEL_YUV :
-		       IMX7_CSI_PIXFMT_SEL_RGB);
-
-		if (!(fmt_sel & sel) || !fmt->codes)
+		if (!fmt->codes)
 			continue;
 
 		for (j = 0; fmt->codes[j]; j++) {
@@ -993,27 +964,15 @@ imx7_csi_find_mbus_format(u32 code, enum imx7_csi_pixfmt_sel fmt_sel)
  * @fourcc: The returned fourcc that matches the search criteria at
  *          the requested match index.
  * @index: The requested match index.
- * @fmt_sel: Include in the enumeration entries with the given selection
- *           criteria.
  * @code: If non-zero, only include in the enumeration entries matching this
  *	media bus code.
  */
-static int imx7_csi_enum_pixel_formats(u32 *fourcc, u32 index,
-				       enum imx7_csi_pixfmt_sel fmt_sel,
-				       u32 code)
+static int imx7_csi_enum_pixel_formats(u32 *fourcc, u32 index, u32 code)
 {
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(pixel_formats); i++) {
 		const struct imx7_csi_pixfmt *fmt = &pixel_formats[i];
-		enum imx7_csi_pixfmt_sel sel;
-
-		sel = fmt->bayer ? IMX7_CSI_PIXFMT_SEL_BAYER
-		    : (fmt->yuv ? IMX7_CSI_PIXFMT_SEL_YUV :
-		       IMX7_CSI_PIXFMT_SEL_RGB);
-
-		if (!(fmt_sel & sel))
-			continue;
 
 		/*
 		 * If a media bus code is specified, only consider formats that
@@ -1053,24 +1012,16 @@ static int imx7_csi_enum_pixel_formats(u32 *fourcc, u32 index,
  * @code: The returned media-bus code that matches the search criteria at
  *        the requested match index.
  * @index: The requested match index.
- * @fmt_sel: Include in the enumeration entries with the given selection
- *           criteria.
  */
-static int imx7_csi_enum_mbus_formats(u32 *code, u32 index,
-				      enum imx7_csi_pixfmt_sel fmt_sel)
+static int imx7_csi_enum_mbus_formats(u32 *code, u32 index)
 {
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(pixel_formats); i++) {
 		const struct imx7_csi_pixfmt *fmt = &pixel_formats[i];
-		enum imx7_csi_pixfmt_sel sel;
 		unsigned int j;
 
-		sel = fmt->bayer ? IMX7_CSI_PIXFMT_SEL_BAYER
-		    : (fmt->yuv ? IMX7_CSI_PIXFMT_SEL_YUV :
-		       IMX7_CSI_PIXFMT_SEL_RGB);
-
-		if (!(fmt_sel & sel) || !fmt->codes)
+		if (!fmt->codes)
 			continue;
 
 		for (j = 0; fmt->codes[j]; j++) {
@@ -1099,7 +1050,7 @@ static int imx7_csi_init_mbus_fmt(struct v4l2_mbus_framefmt *mbus,
 	if (code == 0)
 		code = IMX7_CSI_DEF_MBUS_CODE;
 
-	lcc = imx7_csi_find_mbus_format(code, IMX7_CSI_PIXFMT_SEL_ANY);
+	lcc = imx7_csi_find_mbus_format(code);
 	if (!lcc)
 		return -EINVAL;
 
@@ -1127,8 +1078,7 @@ static int imx7_csi_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
 	u32 stride;
 
 	if (!cc) {
-		cc = imx7_csi_find_mbus_format(mbus->code,
-					       IMX7_CSI_PIXFMT_SEL_ANY);
+		cc = imx7_csi_find_mbus_format(mbus->code);
 		if (!cc)
 			return -EINVAL;
 	}
@@ -1178,7 +1128,6 @@ static int imx7_csi_video_enum_fmt_vid_cap(struct file *file, void *fh,
 					   struct v4l2_fmtdesc *f)
 {
 	return imx7_csi_enum_pixel_formats(&f->pixelformat, f->index,
-					   IMX7_CSI_PIXFMT_SEL_ANY,
 					   f->mbus_code);
 }
 
@@ -1190,8 +1139,7 @@ static int imx7_csi_video_enum_framesizes(struct file *file, void *fh,
 	if (fsize->index > 0)
 		return -EINVAL;
 
-	cc = imx7_csi_find_pixel_format(fsize->pixel_format,
-					IMX7_CSI_PIXFMT_SEL_ANY);
+	cc = imx7_csi_find_pixel_format(fsize->pixel_format);
 	if (!cc)
 		return -EINVAL;
 
@@ -1232,13 +1180,10 @@ __imx7_csi_video_try_fmt(struct v4l2_pix_format *pixfmt,
 	 * Find the pixel format, default to the first supported format if not
 	 * found.
 	 */
-	cc = imx7_csi_find_pixel_format(pixfmt->pixelformat,
-					IMX7_CSI_PIXFMT_SEL_ANY);
+	cc = imx7_csi_find_pixel_format(pixfmt->pixelformat);
 	if (!cc) {
-		imx7_csi_enum_pixel_formats(&pixfmt->pixelformat, 0,
-					    IMX7_CSI_PIXFMT_SEL_ANY, 0);
-		cc = imx7_csi_find_pixel_format(pixfmt->pixelformat,
-						IMX7_CSI_PIXFMT_SEL_ANY);
+		imx7_csi_enum_pixel_formats(&pixfmt->pixelformat, 0, 0);
+		cc = imx7_csi_find_pixel_format(pixfmt->pixelformat);
 	}
 
 	/* Allow IDMAC interweave but enforce field order from source. */
@@ -1463,8 +1408,7 @@ static int imx7_csi_video_validate_fmt(struct imx7_csi *csi)
 	 * Verify that the media bus code is compatible with the pixel format
 	 * set on the video node.
 	 */
-	cc = imx7_csi_find_mbus_format(fmt_src.format.code,
-				       IMX7_CSI_PIXFMT_SEL_ANY);
+	cc = imx7_csi_find_mbus_format(fmt_src.format.code);
 	if (!cc || csi->vdev_cc->yuv != cc->yuv)
 		return -EPIPE;
 
@@ -1638,8 +1582,7 @@ static int imx7_csi_video_init_format(struct imx7_csi *csi)
 	csi->vdev_compose.width = fmt_src.format.width;
 	csi->vdev_compose.height = fmt_src.format.height;
 
-	csi->vdev_cc = imx7_csi_find_pixel_format(csi->vdev_fmt.pixelformat,
-						  IMX7_CSI_PIXFMT_SEL_ANY);
+	csi->vdev_cc = imx7_csi_find_pixel_format(csi->vdev_fmt.pixelformat);
 
 	return 0;
 }
@@ -1846,8 +1789,7 @@ static int imx7_csi_enum_mbus_code(struct v4l2_subdev *sd,
 
 	switch (code->pad) {
 	case IMX7_CSI_PAD_SINK:
-		ret = imx7_csi_enum_mbus_formats(&code->code, code->index,
-						 IMX7_CSI_PIXFMT_SEL_ANY);
+		ret = imx7_csi_enum_mbus_formats(&code->code, code->index);
 		break;
 	case IMX7_CSI_PAD_SRC:
 		if (code->index != 0) {
@@ -1904,7 +1846,7 @@ static void imx7_csi_try_colorimetry(struct v4l2_mbus_framefmt *tryfmt)
 	const struct imx7_csi_pixfmt *cc;
 	bool is_rgb = false;
 
-	cc = imx7_csi_find_mbus_format(tryfmt->code, IMX7_CSI_PIXFMT_SEL_ANY);
+	cc = imx7_csi_find_mbus_format(tryfmt->code);
 	if (cc && !cc->yuv)
 		is_rgb = true;
 
@@ -1954,8 +1896,7 @@ static int imx7_csi_try_fmt(struct imx7_csi *csi,
 
 	switch (sdformat->pad) {
 	case IMX7_CSI_PAD_SRC:
-		in_cc = imx7_csi_find_mbus_format(in_fmt->code,
-						  IMX7_CSI_PIXFMT_SEL_ANY);
+		in_cc = imx7_csi_find_mbus_format(in_fmt->code);
 
 		sdformat->format.width = in_fmt->width;
 		sdformat->format.height = in_fmt->height;
@@ -1969,12 +1910,10 @@ static int imx7_csi_try_fmt(struct imx7_csi *csi,
 		sdformat->format.ycbcr_enc = in_fmt->ycbcr_enc;
 		break;
 	case IMX7_CSI_PAD_SINK:
-		*cc = imx7_csi_find_mbus_format(sdformat->format.code,
-						IMX7_CSI_PIXFMT_SEL_ANY);
+		*cc = imx7_csi_find_mbus_format(sdformat->format.code);
 		if (!*cc) {
 			code = IMX7_CSI_DEF_MBUS_CODE;
-			*cc = imx7_csi_find_mbus_format(code,
-							IMX7_CSI_PIXFMT_SEL_ANY);
+			*cc = imx7_csi_find_mbus_format(code);
 			sdformat->format.code = code;
 		}
 
-- 
Regards,

Laurent Pinchart

