Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CBD1ADD1E
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2019 18:26:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389967AbfIIQ0M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Sep 2019 12:26:12 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:49188 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389869AbfIIQ0M (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Sep 2019 12:26:12 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x89GQAii070556;
        Mon, 9 Sep 2019 11:26:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568046370;
        bh=447SD9PKVNS3K7K7R+XzVJnF5OEwRchxF4MCs1PW7EE=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=rRHdR2i4OFqH1RFKv3JiiryQjQK93yTOQKPyeEEXOlvuLF/wqKL01ya5OMAeLDt7x
         IK398QeAZUT4D1hCF64OcOEmfN9pDugweL1s+tiQsit0uztKEzB/XnEEpzpux9xlBh
         K/WHcMxhh59DrzbyolIEESvIs7o5mL4VskNvJGYk=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x89GQA4c119538;
        Mon, 9 Sep 2019 11:26:10 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 9 Sep
 2019 11:26:10 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 9 Sep 2019 11:26:10 -0500
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x89GPnoY056522;
        Mon, 9 Sep 2019 11:26:10 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     Prabhakar Lad <prabhakar.csengg@gmail.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>
Subject: [Patch 10/13] media: am437x-vpfe: Remove print_fourcc helper
Date:   Mon, 9 Sep 2019 11:27:40 -0500
Message-ID: <20190909162743.30114-11-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190909162743.30114-1-bparrot@ti.com>
References: <20190909162743.30114-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

print_fourcc helper function was used for debug log the
convert a pixel format code into its readable form for display
purposes. But since it used a single static buffer to perform
the conversion this might lead to display format issue when more
than one instance was invoked simultaneously.

It turns out that print_fourcc can be safely replace by using
"%4.4s" instead and casting the pointer to the fourcc code
into a (char *).

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/am437x/am437x-vpfe.c | 34 ++++++---------------
 1 file changed, 10 insertions(+), 24 deletions(-)

diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
index 93f92097602c..4fb9c8ed7e92 100644
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
@@ -700,8 +686,8 @@ static int vpfe_ccdc_set_pixel_format(struct vpfe_ccdc *ccdc, u32 pixfmt)
 {
 	struct vpfe_device *vpfe = container_of(ccdc, struct vpfe_device, ccdc);
 
-	vpfe_dbg(1, vpfe, "%s: if_type: %d, pixfmt:%s\n",
-		 __func__, ccdc->ccdc_cfg.if_type, print_fourcc(pixfmt));
+	vpfe_dbg(1, vpfe, "%s: if_type: %d, pixfmt:%4.4s\n",
+		 __func__, ccdc->ccdc_cfg.if_type, (char *)&pixfmt);
 
 	if (ccdc->ccdc_cfg.if_type == VPFE_RAW_BAYER) {
 		ccdc->ccdc_cfg.bayer.pix_fmt = CCDC_PIXFMT_RAW;
@@ -989,8 +975,8 @@ static int vpfe_config_ccdc_image_format(struct vpfe_device *vpfe)
 
 	vpfe_dbg(2, vpfe, "%s:\n", __func__);
 
-	vpfe_dbg(1, vpfe, "pixelformat: %s\n",
-		print_fourcc(vpfe->v_fmt.fmt.pix.pixelformat));
+	vpfe_dbg(1, vpfe, "pixelformat: %4.4s\n",
+		 (char *)&vpfe->v_fmt.fmt.pix.pixelformat);
 
 	if (vpfe_ccdc_set_pixel_format(&vpfe->ccdc,
 			vpfe->v_fmt.fmt.pix.pixelformat) < 0) {
@@ -1409,9 +1395,9 @@ static int __vpfe_get_format(struct vpfe_device *vpfe,
 	format->type = vpfe->v_fmt.type;
 
 	vpfe_dbg(1, vpfe,
-		 "%s: size %dx%d (%s) bytesperline = %d, size = %d, bpp = %d\n",
+		 "%s: size %dx%d (%4.4s) bytesperline = %d, size = %d, bpp = %d\n",
 		 __func__, format->fmt.pix.width, format->fmt.pix.height,
-		 print_fourcc(format->fmt.pix.pixelformat),
+		 (char *)&format->fmt.pix.pixelformat,
 		 format->fmt.pix.bytesperline, format->fmt.pix.sizeimage, *bpp);
 
 	return 0;
@@ -1446,9 +1432,9 @@ static int __vpfe_set_format(struct vpfe_device *vpfe,
 	format->type = vpfe->v_fmt.type;
 
 	vpfe_dbg(1, vpfe,
-		 "%s size %dx%d (%s) bytesperline = %d, size = %d, bpp = %d\n",
+		 "%s: size %dx%d (%4.4s) bytesperline = %d, size = %d, bpp = %d\n",
 		 __func__,  format->fmt.pix.width, format->fmt.pix.height,
-		 print_fourcc(format->fmt.pix.pixelformat),
+		 (char *)&format->fmt.pix.pixelformat,
 		 format->fmt.pix.bytesperline, format->fmt.pix.sizeimage, *bpp);
 
 	return 0;
@@ -1486,8 +1472,8 @@ static int vpfe_enum_fmt(struct file *file, void  *priv,
 
 	f->pixelformat = fmt->fourcc;
 
-	vpfe_dbg(1, vpfe, "%s: mbus index: %d code: %x pixelformat: %s\n",
-		 __func__, f->index, fmt->code, print_fourcc(fmt->fourcc));
+	vpfe_dbg(1, vpfe, "%s: mbus index: %d code: %x pixelformat: %4.4s\n",
+		 __func__, f->index, fmt->code, (char *)&fmt->fourcc);
 
 	return 0;
 }
-- 
2.17.1

