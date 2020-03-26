Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06D8F194B47
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2020 23:09:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727620AbgCZWJE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Mar 2020 18:09:04 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:42062 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727606AbgCZWJD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Mar 2020 18:09:03 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2F258197C;
        Thu, 26 Mar 2020 23:08:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1585260537;
        bh=DtP8tun5EBHtcfcdHAeOMDNp8vig2EQyzDuBmYovyHw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HvS7EBnsqaJQ0e/xRM2DoqX2t93MzJ6UoF7VvAJnS48+alB2rJNtQGUwP3W1sfNPx
         +IA7R4LTTHnc5DC9gcTe37HRK7g4hmiKGfGAKdJsJI/jBvy08mCj7fFrB4+PsAwKpi
         ouJr1PyoFiGzbMxImom7oBz4zqck1IaOiKs4qfN4=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH v2 11/11] media: imx: utils: Add ability to filter pixel formats by mbus code
Date:   Fri, 27 Mar 2020 00:08:40 +0200
Message-Id: <20200326220840.18540-12-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200326220840.18540-1-laurent.pinchart@ideasonboard.com>
References: <20200326220840.18540-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a media bus code argument to the imx_media_enum_pixel_formats(). If
set to a non-zero value, the function will only consider pixel formats
that match the given media bus code.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx-media-capture.c |  5 +++--
 .../staging/media/imx/imx-media-csc-scaler.c  |  2 +-
 drivers/staging/media/imx/imx-media-utils.c   | 21 ++++++++++++++++++-
 drivers/staging/media/imx/imx-media.h         |  2 +-
 4 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index 1b3f783f3f72..9924840dd15e 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -174,7 +174,8 @@ static int capture_enum_fmt_vid_cap(struct file *file, void *fh,
 		u32 cs_sel = (cc_src->cs == IPUV3_COLORSPACE_YUV) ?
 			CS_SEL_YUV : CS_SEL_RGB;
 
-		ret = imx_media_enum_pixel_formats(&fourcc, f->index, cs_sel);
+		ret = imx_media_enum_pixel_formats(&fourcc, f->index, cs_sel,
+						   0);
 		if (ret)
 			return ret;
 	} else {
@@ -221,7 +222,7 @@ static int __capture_try_fmt_vid_cap(struct capture_priv *priv,
 
 		cc = imx_media_find_pixel_format(fourcc, cs_sel);
 		if (!cc) {
-			imx_media_enum_pixel_formats(&fourcc, 0, cs_sel);
+			imx_media_enum_pixel_formats(&fourcc, 0, cs_sel, 0);
 			cc = imx_media_find_pixel_format(fourcc, cs_sel);
 		}
 	} else {
diff --git a/drivers/staging/media/imx/imx-media-csc-scaler.c b/drivers/staging/media/imx/imx-media-csc-scaler.c
index d8904a78228d..426d1ff3b62c 100644
--- a/drivers/staging/media/imx/imx-media-csc-scaler.c
+++ b/drivers/staging/media/imx/imx-media-csc-scaler.c
@@ -164,7 +164,7 @@ static int ipu_csc_scaler_enum_fmt(struct file *file, void *fh,
 	u32 fourcc;
 	int ret;
 
-	ret = imx_media_enum_pixel_formats(&fourcc, f->index, CS_SEL_ANY);
+	ret = imx_media_enum_pixel_formats(&fourcc, f->index, CS_SEL_ANY, 0);
 	if (ret)
 		return ret;
 
diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index ff2202e95a48..1efdfa751523 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -220,7 +220,7 @@ imx_media_find_pixel_format(u32 fourcc, enum codespace_sel cs_sel)
 EXPORT_SYMBOL_GPL(imx_media_find_pixel_format);
 
 int imx_media_enum_pixel_formats(u32 *fourcc, u32 index,
-				 enum codespace_sel cs_sel)
+				 enum codespace_sel cs_sel, u32 code)
 {
 	bool allow_bayer = cs_sel & CS_SEL_BAYER;
 	unsigned int i;
@@ -237,6 +237,25 @@ int imx_media_enum_pixel_formats(u32 *fourcc, u32 index,
 		if (!(cs_sel & fmt_cs_sel) || (!allow_bayer && fmt->bayer))
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
index bb73a76eea84..bf4daaaf3165 100644
--- a/drivers/staging/media/imx/imx-media.h
+++ b/drivers/staging/media/imx/imx-media.h
@@ -160,7 +160,7 @@ enum codespace_sel {
 const struct imx_media_pixfmt *
 imx_media_find_pixel_format(u32 fourcc, enum codespace_sel cs_sel);
 int imx_media_enum_pixel_formats(u32 *fourcc, u32 index,
-				 enum codespace_sel cs_sel);
+				 enum codespace_sel cs_sel, u32 code);
 const struct imx_media_pixfmt *
 imx_media_find_mbus_format(u32 code, enum codespace_sel cs_sel);
 int imx_media_enum_mbus_formats(u32 *code, u32 index,
-- 
Regards,

Laurent Pinchart

