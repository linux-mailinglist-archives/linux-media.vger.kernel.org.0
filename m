Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2566D718C8
	for <lists+linux-media@lfdr.de>; Tue, 23 Jul 2019 14:58:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389970AbfGWM6H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jul 2019 08:58:07 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:34731 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731866AbfGWM6H (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jul 2019 08:58:07 -0400
Received: from [IPv6:2001:420:44c1:2579:b924:5c77:4556:9fd2] ([IPv6:2001:420:44c1:2579:b924:5c77:4556:9fd2])
        by smtp-cloud7.xs4all.net with ESMTPA
        id puMjhvSIqLqASpuMmhJ0qo; Tue, 23 Jul 2019 14:58:04 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Prabhakar Lad <prabhakar.csengg@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] davinci/vpfe_capture.c: drop unused format descriptions
Message-ID: <050788b0-d4a6-2c05-333a-edfb95b90a4b@xs4all.nl>
Date:   Tue, 23 Jul 2019 14:58:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfEMHQRgKggSoLHew5+66i/+P9E3bl0a03YJUyvJN+38jbpm0FDF0UleTwOfuOD1kfK+Nc6W75wbl76F2cavSSFMMrH3OpcYN15aLSp/aqlS2Q0NSQ+pV
 VNt7Pq8UjXvyic8S8fLZNP250rccNnlOydFPTNVMFdKvHuQOm5S+jgHLkW3z+ySzTLzmX2gpvlKOZEBWBxBVPcV6NbABubmZtZ746XfAfxvwqFk689Fbpki/
 wPY8+2vU77tPJNSSA7KqMhQ0gAKHKC9rx1hoMWSgBvUwpksfn7BPg56YevvqowFbl39ArPKuAe/zSIkiQoKl82R06BSvfCZePnAzi/r+VVY=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Simplify vpfe_pixel_format to just contain the pixelformat and bpp fields.
All others are unused.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/platform/davinci/vpfe_capture.c b/drivers/media/platform/davinci/vpfe_capture.c
index 852fc357e19d..916ed743d716 100644
--- a/drivers/media/platform/davinci/vpfe_capture.c
+++ b/drivers/media/platform/davinci/vpfe_capture.c
@@ -119,57 +119,27 @@ static const struct vpfe_standard vpfe_standards[] = {
 /* Used when raw Bayer image from ccdc is directly captured to SDRAM */
 static const struct vpfe_pixel_format vpfe_pix_fmts[] = {
 	{
-		.fmtdesc = {
-			.index = 0,
-			.type = V4L2_BUF_TYPE_VIDEO_CAPTURE,
-			.description = "Bayer GrRBGb 8bit A-Law compr.",
-			.pixelformat = V4L2_PIX_FMT_SBGGR8,
-		},
+		.pixelformat = V4L2_PIX_FMT_SBGGR8,
 		.bpp = 1,
 	},
 	{
-		.fmtdesc = {
-			.index = 1,
-			.type = V4L2_BUF_TYPE_VIDEO_CAPTURE,
-			.description = "Bayer GrRBGb - 16bit",
-			.pixelformat = V4L2_PIX_FMT_SBGGR16,
-		},
+		.pixelformat = V4L2_PIX_FMT_SBGGR16,
 		.bpp = 2,
 	},
 	{
-		.fmtdesc = {
-			.index = 2,
-			.type = V4L2_BUF_TYPE_VIDEO_CAPTURE,
-			.description = "Bayer GrRBGb 8bit DPCM compr.",
-			.pixelformat = V4L2_PIX_FMT_SGRBG10DPCM8,
-		},
+		.pixelformat = V4L2_PIX_FMT_SGRBG10DPCM8,
 		.bpp = 1,
 	},
 	{
-		.fmtdesc = {
-			.index = 3,
-			.type = V4L2_BUF_TYPE_VIDEO_CAPTURE,
-			.description = "YCbCr 4:2:2 Interleaved UYVY",
-			.pixelformat = V4L2_PIX_FMT_UYVY,
-		},
+		.pixelformat = V4L2_PIX_FMT_UYVY,
 		.bpp = 2,
 	},
 	{
-		.fmtdesc = {
-			.index = 4,
-			.type = V4L2_BUF_TYPE_VIDEO_CAPTURE,
-			.description = "YCbCr 4:2:2 Interleaved YUYV",
-			.pixelformat = V4L2_PIX_FMT_YUYV,
-		},
+		.pixelformat = V4L2_PIX_FMT_YUYV,
 		.bpp = 2,
 	},
 	{
-		.fmtdesc = {
-			.index = 5,
-			.type = V4L2_BUF_TYPE_VIDEO_CAPTURE,
-			.description = "Y/CbCr 4:2:0 - Semi planar",
-			.pixelformat = V4L2_PIX_FMT_NV12,
-		},
+		.pixelformat = V4L2_PIX_FMT_NV12,
 		.bpp = 1,
 	},
 };
@@ -183,7 +153,7 @@ static const struct vpfe_pixel_format *vpfe_lookup_pix_format(u32 pix_format)
 	int i;

 	for (i = 0; i < ARRAY_SIZE(vpfe_pix_fmts); i++) {
-		if (pix_format == vpfe_pix_fmts[i].fmtdesc.pixelformat)
+		if (pix_format == vpfe_pix_fmts[i].pixelformat)
 			return &vpfe_pix_fmts[i];
 	}
 	return NULL;
@@ -782,7 +752,7 @@ static const struct vpfe_pixel_format *
 	temp = 0;
 	found = 0;
 	while (ccdc_dev->hw_ops.enum_pix(&pix, temp) >= 0) {
-		if (vpfe_pix_fmt->fmtdesc.pixelformat == pix) {
+		if (vpfe_pix_fmt->pixelformat == pix) {
 			found = 1;
 			break;
 		}
@@ -899,7 +869,6 @@ static int vpfe_enum_fmt_vid_cap(struct file *file, void  *priv,
 {
 	struct vpfe_device *vpfe_dev = video_drvdata(file);
 	const struct vpfe_pixel_format *pix_fmt;
-	int temp_index;
 	u32 pix;

 	v4l2_dbg(1, debug, &vpfe_dev->v4l2_dev, "vpfe_enum_fmt_vid_cap\n");
@@ -910,9 +879,7 @@ static int vpfe_enum_fmt_vid_cap(struct file *file, void  *priv,
 	/* Fill in the information about format */
 	pix_fmt = vpfe_lookup_pix_format(pix);
 	if (pix_fmt) {
-		temp_index = fmt->index;
-		*fmt = pix_fmt->fmtdesc;
-		fmt->index = temp_index;
+		fmt->pixelformat = fmt->pixelformat;
 		return 0;
 	}
 	return -EINVAL;
diff --git a/include/media/davinci/vpfe_capture.h b/include/media/davinci/vpfe_capture.h
index 2c5b3eacf527..4ad53031e2f7 100644
--- a/include/media/davinci/vpfe_capture.h
+++ b/include/media/davinci/vpfe_capture.h
@@ -32,7 +32,7 @@
 #define CAPTURE_DRV_NAME		"vpfe-capture"

 struct vpfe_pixel_format {
-	struct v4l2_fmtdesc fmtdesc;
+	u32 pixelformat;
 	/* bytes per pixel */
 	int bpp;
 };

