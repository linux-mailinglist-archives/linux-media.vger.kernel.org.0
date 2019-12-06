Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3A9B1157EB
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2019 20:48:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726375AbfLFTsP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Dec 2019 14:48:15 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:36424 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726328AbfLFTsP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Dec 2019 14:48:15 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB6JmETd124305;
        Fri, 6 Dec 2019 13:48:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1575661694;
        bh=1LvDPvxelfaYR9ZfukstyYBPhz1WxGviRUoVT3QbgCk=;
        h=From:To:CC:Subject:Date;
        b=zRfUEREd7mDzvO1zZNCOhyTH5Z28n3bc++1GzoV0JelWEg+uZ9pCjza9JDnjrw0U3
         +FOtAVxdHJv04rWJNe9pa4kg8jctAdjBWapyySx+pW73bkNZy4Fc13QOcYqH5uIhdx
         HCFaijAAPrFAsXn/bjWuTGW16jQgBYKMOcyESSNc=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xB6JmETO048020
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 6 Dec 2019 13:48:14 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 6 Dec
 2019 13:48:12 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 6 Dec 2019 13:48:12 -0600
Received: from uda0869644b.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB6JmCKs008244;
        Fri, 6 Dec 2019 13:48:12 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Benoit Parrot <bparrot@ti.com>
Subject: [Patch] media: ti-vpe: csc: fix single vs multiplanar format handling
Date:   Fri, 6 Dec 2019 13:51:32 -0600
Message-ID: <20191206195132.21482-1-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In csc_set_coeff() we were previously checking if the format type was
V4L2_BUF_TYPE_VIDEO_OUTPUT or V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE as a
mean to figure out if the format was multiplanar or not. This was not
entirely accurate as the format type could also be a CAPTURE type
instead.

Fix this by removing the 'switch' construct and replacing them with
"if (V4L2_TYPE_IS_MULTIPLANAR(type))" instead.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/csc.c | 32 +++++++++++------------------
 1 file changed, 12 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/csc.c b/drivers/media/platform/ti-vpe/csc.c
index 834114a4eebe..f4e0cf72d1cf 100644
--- a/drivers/media/platform/ti-vpe/csc.c
+++ b/drivers/media/platform/ti-vpe/csc.c
@@ -149,36 +149,28 @@ void csc_set_coeff(struct csc_data *csc, u32 *csc_reg0,
 	enum v4l2_quantization src_quantization, dst_quantization;
 	u32 src_pixelformat, dst_pixelformat;
 
-	switch (src_fmt->type) {
-	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
-		pix = &src_fmt->fmt.pix;
-		src_pixelformat = pix->pixelformat;
-		src_ycbcr_enc = pix->ycbcr_enc;
-		src_quantization = pix->quantization;
-		break;
-	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
-	default:
+	if (V4L2_TYPE_IS_MULTIPLANAR(src_fmt->type)) {
 		mp = &src_fmt->fmt.pix_mp;
 		src_pixelformat = mp->pixelformat;
 		src_ycbcr_enc = mp->ycbcr_enc;
 		src_quantization = mp->quantization;
-		break;
+	} else {
+		pix = &src_fmt->fmt.pix;
+		src_pixelformat = pix->pixelformat;
+		src_ycbcr_enc = pix->ycbcr_enc;
+		src_quantization = pix->quantization;
 	}
 
-	switch (dst_fmt->type) {
-	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
-		pix = &dst_fmt->fmt.pix;
-		dst_pixelformat = pix->pixelformat;
-		dst_ycbcr_enc = pix->ycbcr_enc;
-		dst_quantization = pix->quantization;
-		break;
-	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
-	default:
+	if (V4L2_TYPE_IS_MULTIPLANAR(dst_fmt->type)) {
 		mp = &dst_fmt->fmt.pix_mp;
 		dst_pixelformat = mp->pixelformat;
 		dst_ycbcr_enc = mp->ycbcr_enc;
 		dst_quantization = mp->quantization;
-		break;
+	} else {
+		pix = &dst_fmt->fmt.pix;
+		dst_pixelformat = pix->pixelformat;
+		dst_ycbcr_enc = pix->ycbcr_enc;
+		dst_quantization = pix->quantization;
 	}
 
 	src_finfo = v4l2_format_info(src_pixelformat);
-- 
2.17.1

