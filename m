Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EE33B82C4
	for <lists+linux-media@lfdr.de>; Thu, 19 Sep 2019 22:41:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404699AbfISUjt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Sep 2019 16:39:49 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:42664 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392734AbfISUjc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Sep 2019 16:39:32 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8JKdVRb117044;
        Thu, 19 Sep 2019 15:39:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568925571;
        bh=Tva2WjU8DYBp+72RMbfv//hBo8xWJDGWc06CK0eXp+k=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=PtjU5GgX1YRo5Ya1ZUarkkzEBGukAdF8Ax05ygRvhuRQwfhlGLn/UPC56ZAjK/Rzy
         8NQfo2k4/RYMe1QSDyp44FdxyaXuZd1tMLcpwMGFYDTrcH12iA9evRPTpo/vSsei8l
         Nmfhi4T8ToSnzAYiA+9RkWQeMVzd0exfdVSnSnkk=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8JKdVtj002286
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 19 Sep 2019 15:39:31 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 19
 Sep 2019 15:39:30 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 19 Sep 2019 15:39:26 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8JKdKId014276;
        Thu, 19 Sep 2019 15:39:30 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     Prabhakar Lad <prabhakar.csengg@gmail.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch v2 10/13] media: am437x-vpfe: Remove print_fourcc helper
Date:   Thu, 19 Sep 2019 15:41:22 -0500
Message-ID: <20190919204125.15254-11-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190919204125.15254-1-bparrot@ti.com>
References: <20190919204125.15254-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

print_fourcc helper function was used for debug log to
convert a pixel format code into its readable form for display
purposes. But since it used a single static buffer to perform
the conversion this might lead to display format issue when more
than one instance was invoked simultaneously.

It turns out that print_fourcc can be safely replace by using
"%4pE" instead and passing the pointer to the fourcc code.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/am437x/am437x-vpfe.c | 42 +++++++--------------
 1 file changed, 14 insertions(+), 28 deletions(-)

diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
index 605a6bb7e6c2..ad46e037fe89 100644
--- a/drivers/media/platform/am437x/am437x-vpfe.c
+++ b/drivers/media/platform/am437x/am437x-vpfe.c
@@ -221,20 +221,6 @@ static void pix_to_mbus(struct vpfe_device *vpfe,
 	v4l2_fill_mbus_format(mbus_fmt, pix_fmt, fmt->code);
 }
 
-/*  Print Four-character-code (FOURCC) */
-static char *print_fourcc(u32 fmt)
-{
-	static char code[5];
-
-	code[0] = (unsigned char)(fmt & 0xff);
-	code[1] = (unsigned char)((fmt >> 8) & 0xff);
-	code[2] = (unsigned char)((fmt >> 16) & 0xff);
-	code[3] = (unsigned char)((fmt >> 24) & 0xff);
-	code[4] = '\0';
-
-	return code;
-}
-
 static int
 cmp_v4l2_format(const struct v4l2_format *lhs, const struct v4l2_format *rhs)
 {
@@ -696,8 +682,8 @@ static int vpfe_ccdc_set_pixel_format(struct vpfe_ccdc *ccdc, u32 pixfmt)
 {
 	struct vpfe_device *vpfe = container_of(ccdc, struct vpfe_device, ccdc);
 
-	vpfe_dbg(1, vpfe, "%s: if_type: %d, pixfmt:%s\n",
-		 __func__, ccdc->ccdc_cfg.if_type, print_fourcc(pixfmt));
+	vpfe_dbg(1, vpfe, "%s: if_type: %d, pixfmt:%4pE\n",
+		 __func__, ccdc->ccdc_cfg.if_type, &pixfmt);
 
 	if (ccdc->ccdc_cfg.if_type == VPFE_RAW_BAYER) {
 		ccdc->ccdc_cfg.bayer.pix_fmt = CCDC_PIXFMT_RAW;
@@ -983,8 +969,8 @@ static int vpfe_config_ccdc_image_format(struct vpfe_device *vpfe)
 	enum ccdc_frmfmt frm_fmt = CCDC_FRMFMT_INTERLACED;
 	int ret = 0;
 
-	vpfe_dbg(1, vpfe, "pixelformat: %s\n",
-		print_fourcc(vpfe->fmt.fmt.pix.pixelformat));
+	vpfe_dbg(1, vpfe, "pixelformat: %4pE\n",
+		 &vpfe->fmt.fmt.pix.pixelformat);
 
 	if (vpfe_ccdc_set_pixel_format(&vpfe->ccdc,
 			vpfe->fmt.fmt.pix.pixelformat) < 0) {
@@ -1392,9 +1378,9 @@ static int __vpfe_get_format(struct vpfe_device *vpfe,
 	format->type = vpfe->fmt.type;
 
 	vpfe_dbg(1, vpfe,
-		 "%s: size %dx%d (%s) bytesperline = %d, size = %d, bpp = %d\n",
+		 "%s: size %dx%d (%4pE) bytesperline = %d, size = %d, bpp = %d\n",
 		 __func__, format->fmt.pix.width, format->fmt.pix.height,
-		 print_fourcc(format->fmt.pix.pixelformat),
+		 &format->fmt.pix.pixelformat,
 		 format->fmt.pix.bytesperline, format->fmt.pix.sizeimage, *bpp);
 
 	return 0;
@@ -1427,9 +1413,9 @@ static int __vpfe_set_format(struct vpfe_device *vpfe,
 	format->type = vpfe->fmt.type;
 
 	vpfe_dbg(1, vpfe,
-		 "%s size %dx%d (%s) bytesperline = %d, size = %d, bpp = %d\n",
+		 "%s: size %dx%d (%4pE) bytesperline = %d, size = %d, bpp = %d\n",
 		 __func__,  format->fmt.pix.width, format->fmt.pix.height,
-		 print_fourcc(format->fmt.pix.pixelformat),
+		 &format->fmt.pix.pixelformat,
 		 format->fmt.pix.bytesperline, format->fmt.pix.sizeimage, *bpp);
 
 	return 0;
@@ -1463,8 +1449,8 @@ static int vpfe_enum_fmt(struct file *file, void  *priv,
 
 	f->pixelformat = fmt->fourcc;
 
-	vpfe_dbg(1, vpfe, "%s: mbus index: %d code: %x pixelformat: %s\n",
-		 __func__, f->index, fmt->code, print_fourcc(fmt->fourcc));
+	vpfe_dbg(1, vpfe, "%s: mbus index: %d code: %x pixelformat: %4pE\n",
+		 __func__, f->index, fmt->code, &fmt->fourcc);
 
 	return 0;
 }
@@ -1571,8 +1557,8 @@ static int vpfe_enum_size(struct file *file, void  *priv,
 	fsize->discrete.width = fse.max_width;
 	fsize->discrete.height = fse.max_height;
 
-	vpfe_dbg(1, vpfe, "%s: index: %d pixformat: %4.4s size: %dx%d\n",
-		 __func__, fsize->index, (char *)&fsize->pixel_format,
+	vpfe_dbg(1, vpfe, "%s: index: %d pixformat: %4pE size: %dx%d\n",
+		 __func__, fsize->index, &fsize->pixel_format,
 		 fsize->discrete.width, fsize->discrete.height);
 
 	return 0;
@@ -2242,8 +2228,8 @@ vpfe_async_bound(struct v4l2_async_notifier *notifier,
 				continue;
 			vpfe->active_fmt[i] = fmt;
 			vpfe_dbg(3, vpfe,
-				 "matched fourcc: %4.4s code: %04x idx: %d\n",
-				 (char *)&fmt->fourcc, mbus_code.code, i);
+				 "matched fourcc: %4pE code: %04x idx: %d\n",
+				 &fmt->fourcc, mbus_code.code, i);
 			vpfe->num_active_fmt = ++i;
 		}
 	}
-- 
2.17.1

