Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C0A65214B9
	for <lists+linux-media@lfdr.de>; Tue, 10 May 2022 14:00:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241014AbiEJMEP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 May 2022 08:04:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241514AbiEJMEL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 May 2022 08:04:11 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64F2D52E73
        for <linux-media@vger.kernel.org>; Tue, 10 May 2022 05:00:14 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 99A7E12B9;
        Tue, 10 May 2022 13:59:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1652183991;
        bh=7n8of1MXRoPvO3JeUjedG56zxX0gutOm/D21RqQZXt4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ENzGDGlY4MmHgWZSG0IsM7kwAMfyAy0f6pKWjtrS7tBcgx/4Sq6N6mx+1DNeSPIgS
         5KGw1AGgzmUZQUrBJtwP9jyK/00p31RIXjzhVfd5Gw5OtF4DjsNaA3PloStOj6aZGB
         pGKfMaK+sl0swgSnsNykPn9Oq6+ThjhC+77f5meQ=
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
Subject: [PATCH 48/50] staging: media: imx: imx7-media-csi: Inline imx7_csi_enum_pixel_formats()
Date:   Tue, 10 May 2022 14:58:57 +0300
Message-Id: <20220510115859.19777-49-laurent.pinchart@ideasonboard.com>
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

Inline the imx7_csi_enum_pixel_formats() function in its only caller.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 84 +++++++++-------------
 1 file changed, 34 insertions(+), 50 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 8be6f40588af..0bf69933f1bd 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -954,54 +954,6 @@ static const struct imx7_csi_pixfmt *imx7_csi_find_mbus_format(u32 code)
 	return NULL;
 }
 
-/*
- * Enumerate entries in the pixel_formats[] array that match the
- * requested selection criteria. Return the fourcc that matches the
- * selection criteria at the requested match index.
- *
- * @fourcc: The returned fourcc that matches the search criteria at
- *          the requested match index.
- * @index: The requested match index.
- * @code: If non-zero, only include in the enumeration entries matching this
- *	media bus code.
- */
-static int imx7_csi_enum_pixel_formats(u32 *fourcc, u32 index, u32 code)
-{
-	unsigned int i;
-
-	for (i = 0; i < ARRAY_SIZE(pixel_formats); i++) {
-		const struct imx7_csi_pixfmt *fmt = &pixel_formats[i];
-
-		/*
-		 * If a media bus code is specified, only consider formats that
-		 * match it.
-		 */
-		if (code) {
-			unsigned int j;
-
-			if (!fmt->codes)
-				continue;
-
-			for (j = 0; fmt->codes[j]; j++) {
-				if (code == fmt->codes[j])
-					break;
-			}
-
-			if (!fmt->codes[j])
-				continue;
-		}
-
-		if (index == 0) {
-			*fourcc = fmt->fourcc;
-			return 0;
-		}
-
-		index--;
-	}
-
-	return -EINVAL;
-}
-
 /*
  * Enumerate entries in the pixel_formats[] array that match the
  * requested search criteria. Return the media-bus code that matches
@@ -1088,8 +1040,40 @@ static int imx7_csi_video_querycap(struct file *file, void *fh,
 static int imx7_csi_video_enum_fmt_vid_cap(struct file *file, void *fh,
 					   struct v4l2_fmtdesc *f)
 {
-	return imx7_csi_enum_pixel_formats(&f->pixelformat, f->index,
-					   f->mbus_code);
+	unsigned int index = f->index;
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(pixel_formats); i++) {
+		const struct imx7_csi_pixfmt *fmt = &pixel_formats[i];
+
+		/*
+		 * If a media bus code is specified, only consider formats that
+		 * match it.
+		 */
+		if (f->mbus_code) {
+			unsigned int j;
+
+			if (!fmt->codes)
+				continue;
+
+			for (j = 0; fmt->codes[j]; j++) {
+				if (f->mbus_code == fmt->codes[j])
+					break;
+			}
+
+			if (!fmt->codes[j])
+				continue;
+		}
+
+		if (index == 0) {
+			f->pixelformat = fmt->fourcc;
+			return 0;
+		}
+
+		index--;
+	}
+
+	return -EINVAL;
 }
 
 static int imx7_csi_video_enum_framesizes(struct file *file, void *fh,
-- 
Regards,

Laurent Pinchart

