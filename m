Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B34931B48D
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 05:30:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229951AbhBOE3y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Feb 2021 23:29:54 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45318 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229934AbhBOE3w (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Feb 2021 23:29:52 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4B27918CE;
        Mon, 15 Feb 2021 05:28:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613363295;
        bh=/U9dv9TS8//2O4dJcpCxJSeHcv01q+QDhaaYwq9hy+g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FXDmg9F3+xOWe1/m1GVhhZycX53AFptGlzCqV83hOqCU+R4yasFVQWxR3Z9p8R7W4
         ee03chvSziT/S5vecjvNlGBpBc1LotHl4Ti+Usn3PpzhV3PkJ70t+i0LvJxigj4edP
         S3IR4i/8dO2mMwIZ68xIlh5gR91lp+ZmRAE4h7Fk=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 06/77] media: imx: utils: Add ability to filter pixel formats by mbus code
Date:   Mon, 15 Feb 2021 06:26:30 +0200
Message-Id: <20210215042741.28850-7-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a media bus code argument to the imx_media_enum_pixel_formats(). If
set to a non-zero value, the function will only consider pixel formats
that match the given media bus code.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
 drivers/staging/media/imx/imx-media-capture.c |  5 ++--
 .../staging/media/imx/imx-media-csc-scaler.c  |  2 +-
 drivers/staging/media/imx/imx-media-utils.c   | 23 ++++++++++++++++++-
 drivers/staging/media/imx/imx-media.h         |  2 +-
 4 files changed, 27 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index e10ce103a5b4..bea3467e017c 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -174,7 +174,8 @@ static int capture_enum_fmt_vid_cap(struct file *file, void *fh,
 			(cc_src->cs == IPUV3_COLORSPACE_YUV) ?
 			PIXFMT_SEL_YUV : PIXFMT_SEL_RGB;
 
-		ret = imx_media_enum_pixel_formats(&fourcc, f->index, fmt_sel);
+		ret = imx_media_enum_pixel_formats(&fourcc, f->index, fmt_sel,
+						   0);
 		if (ret)
 			return ret;
 	} else {
@@ -223,7 +224,7 @@ static int __capture_try_fmt_vid_cap(struct capture_priv *priv,
 
 		cc = imx_media_find_pixel_format(fourcc, fmt_sel);
 		if (!cc) {
-			imx_media_enum_pixel_formats(&fourcc, 0, fmt_sel);
+			imx_media_enum_pixel_formats(&fourcc, 0, fmt_sel, 0);
 			cc = imx_media_find_pixel_format(fourcc, fmt_sel);
 		}
 	} else {
diff --git a/drivers/staging/media/imx/imx-media-csc-scaler.c b/drivers/staging/media/imx/imx-media-csc-scaler.c
index 63a0204502a8..eb6da9b9d8ba 100644
--- a/drivers/staging/media/imx/imx-media-csc-scaler.c
+++ b/drivers/staging/media/imx/imx-media-csc-scaler.c
@@ -167,7 +167,7 @@ static int ipu_csc_scaler_enum_fmt(struct file *file, void *fh,
 	int ret;
 
 	ret = imx_media_enum_pixel_formats(&fourcc, f->index,
-					   PIXFMT_SEL_YUV_RGB);
+					   PIXFMT_SEL_YUV_RGB, 0);
 	if (ret)
 		return ret;
 
diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index c2088f7ceef5..5128915a5d6f 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -283,9 +283,11 @@ EXPORT_SYMBOL_GPL(imx_media_find_mbus_format);
  * @index: The requested match index.
  * @fmt_sel: Include in the enumeration entries with the given selection
  *           criteria.
+ * @code: If non-zero, only include in the enumeration entries matching this
+ *	media bus code.
  */
 int imx_media_enum_pixel_formats(u32 *fourcc, u32 index,
-				 enum imx_pixfmt_sel fmt_sel)
+				 enum imx_pixfmt_sel fmt_sel, u32 code)
 {
 	bool sel_ipu = fmt_sel & PIXFMT_SEL_IPU;
 	unsigned int i;
@@ -306,6 +308,25 @@ int imx_media_enum_pixel_formats(u32 *fourcc, u32 index,
 		if (!(fmt_sel & sel))
 			continue;
 
+		/*
+		 * If a media bus code is specified, only consider formats that
+		 * match it.
+		 */
+		if (code) {
+			unsigned int j;
+
+			if (!fmt->codes)
+				continue;
+
+			for (j = 0; fmt->codes[j]; j++) {
+				if (code == fmt->codes[j])
+					break;
+			}
+
+			if (!fmt->codes[j])
+				continue;
+		}
+
 		if (index == 0) {
 			*fourcc = fmt->fourcc;
 			return 0;
diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
index 1abb9bb88c12..085110eec87e 100644
--- a/drivers/staging/media/imx/imx-media.h
+++ b/drivers/staging/media/imx/imx-media.h
@@ -170,7 +170,7 @@ struct imx_media_dev {
 const struct imx_media_pixfmt *
 imx_media_find_pixel_format(u32 fourcc, enum imx_pixfmt_sel sel);
 int imx_media_enum_pixel_formats(u32 *fourcc, u32 index,
-				 enum imx_pixfmt_sel sel);
+				 enum imx_pixfmt_sel sel, u32 code);
 const struct imx_media_pixfmt *
 imx_media_find_mbus_format(u32 code, enum imx_pixfmt_sel sel);
 int imx_media_enum_mbus_formats(u32 *code, u32 index,
-- 
Regards,

Laurent Pinchart

