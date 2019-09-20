Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1F23B9631
	for <lists+linux-media@lfdr.de>; Fri, 20 Sep 2019 19:04:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406020AbfITREO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Sep 2019 13:04:14 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:57796 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405970AbfITREI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Sep 2019 13:04:08 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8KH47hj012353;
        Fri, 20 Sep 2019 12:04:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568999047;
        bh=gyIsxxx4ZBo8ek35yKhb/ta0vNTwS1riHVKZyO1uT68=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=vJZe3oU7LSYeHNANgXfpCgtmmdZKj9UPyA0fL0w5uwrb0xLHb4K8mgUlHBlmZbRLG
         rHsK5YQhf+K2ZuUItWA1tEStoPSIkd4vYZsSmrgKVuMjxIPabqX8Crik+rqM68e84Y
         Xca7lFNVrT9YNAJo9oDYVU+SeP7E6qWyIfojjVuk=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8KH47P5102749
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 20 Sep 2019 12:04:07 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 20
 Sep 2019 12:04:02 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 20 Sep 2019 12:04:01 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8KH3r77054719;
        Fri, 20 Sep 2019 12:04:06 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     Prabhakar Lad <prabhakar.csengg@gmail.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch v3 13/13] media: am437x-vpfe: Remove print_fourcc helper
Date:   Fri, 20 Sep 2019 12:05:54 -0500
Message-ID: <20190920170554.29666-14-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190920170554.29666-1-bparrot@ti.com>
References: <20190920170554.29666-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

print_fourcc helper function was used for debug log to convert a pixel
format code into its readable form for display purposes. But since it
used a single static buffer to perform the conversion this might lead to
display format issue when more than one instance was invoked
simultaneously.

Instead we make use of the new standard macros to log the fourcc value
in a human readable format.

This patch is dependent on the following series:

Link: https://patchwork.kernel.org/project/linux-media/list/?series=174497

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/am437x/am437x-vpfe.c | 40 ++++++++-------------
 1 file changed, 14 insertions(+), 26 deletions(-)

diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
index 447610b67db4..fea30d701af5 100644
--- a/drivers/media/platform/am437x/am437x-vpfe.c
+++ b/drivers/media/platform/am437x/am437x-vpfe.c
@@ -151,20 +151,6 @@ static unsigned int __get_bytesperpixel(struct vpfe_device *vpfe,
 	return bpp;
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
 static inline u32 vpfe_reg_read(struct vpfe_ccdc *ccdc, u32 offset)
 {
 	return ioread32(ccdc->ccdc_cfg.base_addr + offset);
@@ -612,8 +598,8 @@ static int vpfe_ccdc_set_pixel_format(struct vpfe_ccdc *ccdc, u32 pixfmt)
 {
 	struct vpfe_device *vpfe = container_of(ccdc, struct vpfe_device, ccdc);
 
-	vpfe_dbg(1, vpfe, "%s: if_type: %d, pixfmt:%s\n",
-		 __func__, ccdc->ccdc_cfg.if_type, print_fourcc(pixfmt));
+	vpfe_dbg(1, vpfe, "%s: if_type: %d, pixfmt:" v4l2_fourcc_conv "\n",
+		 __func__, ccdc->ccdc_cfg.if_type, v4l2_fourcc_args(pixfmt));
 
 	if (ccdc->ccdc_cfg.if_type == VPFE_RAW_BAYER) {
 		ccdc->ccdc_cfg.bayer.pix_fmt = CCDC_PIXFMT_RAW;
@@ -900,8 +886,8 @@ static int vpfe_config_ccdc_image_format(struct vpfe_device *vpfe)
 	u32 bpp;
 	int ret = 0;
 
-	vpfe_dbg(1, vpfe, "pixelformat: %s\n",
-		print_fourcc(vpfe->fmt.fmt.pix.pixelformat));
+	vpfe_dbg(1, vpfe, "pixelformat: " v4l2_fourcc_conv "\n",
+		 v4l2_fourcc_args(vpfe->fmt.fmt.pix.pixelformat));
 
 	if (vpfe_ccdc_set_pixel_format(&vpfe->ccdc,
 			vpfe->fmt.fmt.pix.pixelformat) < 0) {
@@ -1342,8 +1328,9 @@ static int vpfe_calc_format_size(struct vpfe_device *vpfe,
 	f->fmt.pix.sizeimage = f->fmt.pix.bytesperline *
 			       f->fmt.pix.height;
 
-	vpfe_dbg(3, vpfe, "%s: fourcc: %s size: %dx%d bpl:%d img_size:%d\n",
-		 __func__, print_fourcc(f->fmt.pix.pixelformat),
+	vpfe_dbg(3, vpfe,
+		 "%s: fourcc: " v4l2_fourcc_conv " size: %dx%d bpl:%d img_size:%d\n",
+		 __func__,  v4l2_fourcc_args(f->fmt.pix.pixelformat),
 		 f->fmt.pix.width, f->fmt.pix.height,
 		 f->fmt.pix.bytesperline, f->fmt.pix.sizeimage);
 
@@ -1378,8 +1365,8 @@ static int vpfe_enum_fmt(struct file *file, void  *priv,
 
 	f->pixelformat = fmt->fourcc;
 
-	vpfe_dbg(1, vpfe, "%s: mbus index: %d code: %x pixelformat: %s\n",
-		 __func__, f->index, fmt->code, print_fourcc(fmt->fourcc));
+	vpfe_dbg(1, vpfe, "%s: mbus index: %d code: %x pixelformat: " v4l2_fourcc_conv "\n",
+		 __func__, f->index, fmt->code, v4l2_fourcc_args(fmt->fourcc));
 
 	return 0;
 }
@@ -1528,8 +1515,8 @@ static int vpfe_enum_size(struct file *file, void  *priv,
 	fsize->discrete.width = fse.max_width;
 	fsize->discrete.height = fse.max_height;
 
-	vpfe_dbg(1, vpfe, "%s: index: %d pixformat: %s size: %dx%d\n",
-		 __func__, fsize->index, print_fourcc(fsize->pixel_format),
+	vpfe_dbg(1, vpfe, "%s: index: %d pixformat: " v4l2_fourcc_conv " size: %dx%d\n",
+		 __func__, fsize->index, v4l2_fourcc_args(fsize->pixel_format),
 		 fsize->discrete.width, fsize->discrete.height);
 
 	return 0;
@@ -2202,8 +2189,9 @@ vpfe_async_bound(struct v4l2_async_notifier *notifier,
 				continue;
 			vpfe->active_fmt[i] = fmt;
 			vpfe_dbg(3, vpfe,
-				 "matched fourcc: %s code: %04x idx: %d\n",
-				 print_fourcc(fmt->fourcc), mbus_code.code, i);
+				 "matched fourcc: " v4l2_fourcc_conv " code: %04x idx: %d\n",
+				 v4l2_fourcc_args(fmt->fourcc),
+				 mbus_code.code, i);
 			vpfe->num_active_fmt = ++i;
 		}
 	}
-- 
2.17.1

