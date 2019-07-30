Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED22F7A918
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2019 15:00:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727888AbfG3NAY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Jul 2019 09:00:24 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:57233 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726190AbfG3NAX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Jul 2019 09:00:23 -0400
Received: from [IPv6:2001:983:e9a7:1:a003:9a19:9f18:5372] ([IPv6:2001:983:e9a7:1:a003:9a19:9f18:5372])
        by smtp-cloud9.xs4all.net with ESMTPA
        id sRjohmsbXAffAsRjqhjmRG; Tue, 30 Jul 2019 15:00:22 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] vicodec: add support for 4 new RGB32 pixelformats
Message-ID: <36e088bb-9403-a118-97e5-10a1d3657824@xs4all.nl>
Date:   Tue, 30 Jul 2019 15:00:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJxAjytO9OSbysl6tAd5jTCLHA5U1xxsOJdAjIp2Z35J2Ntifzbh9KAH4cQCYjE+fLDOsgYVLGkQRLZlAA+8qfmeTltY34foN7EZ+fmLhKcNoFFJewka
 nbiAqypjOArpIaP0+pyw6MYKBGvzU4o1V46EYb61dBtGGd3+nhkcd7xVD8SQDFS5YOFlIuSvUvbyJcGpaBy3hgUhnarPH0sPSOffmPk/RNUUyR1FzlURPEGm
 xQHQT7x21EZYyfQzazdPbRzbCiCMszeD7HOA9k1ZD1Q=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for V4L2_PIX_FMT_BGRA/X32 and V4L2_PIX_FMT_RGBA/X32 formats.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/platform/vicodec/codec-v4l2-fwht.c b/drivers/media/platform/vicodec/codec-v4l2-fwht.c
index 01e7f09efc4e..3c93d9232c3c 100644
--- a/drivers/media/platform/vicodec/codec-v4l2-fwht.c
+++ b/drivers/media/platform/vicodec/codec-v4l2-fwht.c
@@ -29,11 +29,15 @@ static const struct v4l2_fwht_pixfmt_info v4l2_fwht_pixfmts[] = {
 	{ V4L2_PIX_FMT_HSV24,   3, 3, 1, 3, 3, 1, 1, 3, 1, FWHT_FL_PIXENC_HSV},
 	{ V4L2_PIX_FMT_BGR32,   4, 4, 1, 4, 4, 1, 1, 3, 1, FWHT_FL_PIXENC_RGB},
 	{ V4L2_PIX_FMT_XBGR32,  4, 4, 1, 4, 4, 1, 1, 3, 1, FWHT_FL_PIXENC_RGB},
+	{ V4L2_PIX_FMT_ABGR32,  4, 4, 1, 4, 4, 1, 1, 4, 1, FWHT_FL_PIXENC_RGB},
 	{ V4L2_PIX_FMT_RGB32,   4, 4, 1, 4, 4, 1, 1, 3, 1, FWHT_FL_PIXENC_RGB},
 	{ V4L2_PIX_FMT_XRGB32,  4, 4, 1, 4, 4, 1, 1, 3, 1, FWHT_FL_PIXENC_RGB},
-	{ V4L2_PIX_FMT_HSV32,   4, 4, 1, 4, 4, 1, 1, 3, 1, FWHT_FL_PIXENC_HSV},
 	{ V4L2_PIX_FMT_ARGB32,  4, 4, 1, 4, 4, 1, 1, 4, 1, FWHT_FL_PIXENC_RGB},
-	{ V4L2_PIX_FMT_ABGR32,  4, 4, 1, 4, 4, 1, 1, 4, 1, FWHT_FL_PIXENC_RGB},
+	{ V4L2_PIX_FMT_BGRX32,  4, 4, 1, 4, 4, 1, 1, 3, 1, FWHT_FL_PIXENC_RGB},
+	{ V4L2_PIX_FMT_BGRA32,  4, 4, 1, 4, 4, 1, 1, 4, 1, FWHT_FL_PIXENC_RGB},
+	{ V4L2_PIX_FMT_RGBX32,  4, 4, 1, 4, 4, 1, 1, 3, 1, FWHT_FL_PIXENC_RGB},
+	{ V4L2_PIX_FMT_RGBA32,  4, 4, 1, 4, 4, 1, 1, 4, 1, FWHT_FL_PIXENC_RGB},
+	{ V4L2_PIX_FMT_HSV32,   4, 4, 1, 4, 4, 1, 1, 3, 1, FWHT_FL_PIXENC_HSV},
 	{ V4L2_PIX_FMT_GREY,    1, 1, 1, 1, 0, 1, 1, 1, 1, FWHT_FL_PIXENC_RGB},
 };

@@ -193,6 +197,28 @@ static int prepare_raw_frame(struct fwht_raw_frame *rf,
 		rf->luma++;
 		rf->alpha = rf->cr + 1;
 		break;
+	case V4L2_PIX_FMT_BGRX32:
+		rf->cb = rf->luma + 1;
+		rf->cr = rf->cb + 2;
+		rf->luma += 2;
+		break;
+	case V4L2_PIX_FMT_BGRA32:
+		rf->alpha = rf->luma;
+		rf->cb = rf->luma + 1;
+		rf->cr = rf->cb + 2;
+		rf->luma += 2;
+		break;
+	case V4L2_PIX_FMT_RGBX32:
+		rf->cr = rf->luma;
+		rf->cb = rf->cr + 2;
+		rf->luma++;
+		break;
+	case V4L2_PIX_FMT_RGBA32:
+		rf->alpha = rf->luma + 3;
+		rf->cr = rf->luma;
+		rf->cb = rf->cr + 2;
+		rf->luma++;
+		break;
 	default:
 		return -EINVAL;
 	}
