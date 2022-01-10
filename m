Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D99D48A327
	for <lists+linux-media@lfdr.de>; Mon, 10 Jan 2022 23:48:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242061AbiAJWsL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jan 2022 17:48:11 -0500
Received: from retiisi.eu ([95.216.213.190]:52446 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241522AbiAJWsL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jan 2022 17:48:11 -0500
Received: from lanttu.localdomain (unknown [192.168.2.193])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id A5ABD634C90;
        Tue, 11 Jan 2022 00:48:09 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Nick Desaulniers <ndesaulniers@google.com>, hverkuil@xs4all.nl
Subject: [PATCH 1/1] v4l: Avoid unaligned access warnings when printing 4cc modifiers
Date:   Tue, 11 Jan 2022 00:46:56 +0200
Message-Id: <20220110224656.266536-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Pointers V4L2 pixelformat and dataformat fields in a few packed structs
are directly passed to printk family of functions. This could result in an
unaligned access albeit no such possibility appears to exist at the
moment i.e. this clang warning appears to be a false positive.

Address the warning by copying the pixelformat or dataformat value to a
local variable first.

Reported-by: kernel test robot <lkp@intel.com>
Fixes: e927e1e0f0dd ("v4l: ioctl: Use %p4cc printk modifier to print FourCC codes")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
Hi Andy, Nick,

How about this one?

I believe it does address the clang warning although I haven't tested it.

Kind regards,
Sakari

 drivers/media/v4l2-core/v4l2-ioctl.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 9ac557b8e146..642cb90f457c 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -279,8 +279,8 @@ static void v4l_print_format(const void *arg, bool write_only)
 	const struct v4l2_vbi_format *vbi;
 	const struct v4l2_sliced_vbi_format *sliced;
 	const struct v4l2_window *win;
-	const struct v4l2_sdr_format *sdr;
 	const struct v4l2_meta_format *meta;
+	u32 pixelformat;
 	u32 planes;
 	unsigned i;
 
@@ -299,8 +299,9 @@ static void v4l_print_format(const void *arg, bool write_only)
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
 		mp = &p->fmt.pix_mp;
+		pixelformat = mp->pixelformat;
 		pr_cont(", width=%u, height=%u, format=%p4cc, field=%s, colorspace=%d, num_planes=%u, flags=0x%x, ycbcr_enc=%u, quantization=%u, xfer_func=%u\n",
-			mp->width, mp->height, &mp->pixelformat,
+			mp->width, mp->height, &pixelformat,
 			prt_names(mp->field, v4l2_field_names),
 			mp->colorspace, mp->num_planes, mp->flags,
 			mp->ycbcr_enc, mp->quantization, mp->xfer_func);
@@ -343,14 +344,15 @@ static void v4l_print_format(const void *arg, bool write_only)
 		break;
 	case V4L2_BUF_TYPE_SDR_CAPTURE:
 	case V4L2_BUF_TYPE_SDR_OUTPUT:
-		sdr = &p->fmt.sdr;
-		pr_cont(", pixelformat=%p4cc\n", &sdr->pixelformat);
+		pixelformat = p->fmt.sdr.pixelformat;
+		pr_cont(", pixelformat=%p4cc\n", &pixelformat);
 		break;
 	case V4L2_BUF_TYPE_META_CAPTURE:
 	case V4L2_BUF_TYPE_META_OUTPUT:
 		meta = &p->fmt.meta;
+		pixelformat = meta->dataformat;
 		pr_cont(", dataformat=%p4cc, buffersize=%u\n",
-			&meta->dataformat, meta->buffersize);
+			&pixelformat, meta->buffersize);
 		break;
 	}
 }
-- 
2.30.2

