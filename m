Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08606151AB1
	for <lists+linux-media@lfdr.de>; Tue,  4 Feb 2020 13:45:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727136AbgBDMpK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Feb 2020 07:45:10 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:57743 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727126AbgBDMpK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 4 Feb 2020 07:45:10 -0500
Received: from [IPv6:2001:420:44c1:2577:28db:bc36:e7fa:777f]
 ([IPv6:2001:420:44c1:2577:28db:bc36:e7fa:777f])
        by smtp-cloud8.xs4all.net with ESMTPA
        id yxZgiYd9Jn7E5yxZkiApGf; Tue, 04 Feb 2020 13:45:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1580820308; bh=gdwbR7jTJ5chSXlA57jdm66/kleBEBCrjCbhmUW6exk=;
        h=From:Subject:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=ji1W1eopuuu51X7ER7h0BtLIigmvhem85J/G5759BeGz7HjWZ/iXSq55Yxb5vWeSm
         ombgqMF6k3Mkq1G3aGfxv1+AWItcdQMWepXXNsfFsmROSaZS2QpotXvo0qeyRB+wgW
         lUXTcleJme5B04/nxaKJsGtvitGp10ex095RNJ7XCK8DjK9K8YD573AYK+FUqV90Hf
         RaiqEDKzFet2yDI4gKFmBeQGWRBQFjfUAYLC8RsDiZikWQ+bpnPeM3nN42ru6R7Xof
         JJkt3Ry83fpPSkSIAKVa6IO8nqmlCPu6/Vk+9DjqJDlhcH1qfxsgOabVeve+paTHvd
         fn5WlzRxO1b1Q==
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH for v5.6] vicodec: process all 4 components for RGB32 formats
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Message-ID: <c0d93221-7132-5782-2c56-cc14f8e969ac@xs4all.nl>
Date:   Tue, 4 Feb 2020 13:45:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfN8dHDZoLquOHTrmqtc1Yi1V/gQb4pzCkrOYSTwxCqnrSkxD5jZu26UrAZarBh1eGme2M+rfvElJCvj0t6qgHTEf6MGiqLF0f0O0YhlrHcFKUNv/ngJ+
 6aHUIKGTFXz4Cvg55f9FE3P5Akl71BdCa6yxvTUJA3LKb0+Eu1fweHAVhGcL1WVMgRZgMNV53KrydizlynnZQcM/gpEVWozc9TGa4KHP2xc+l1EgB8CNRffz
 0VfmYkOOg3Hez8GJB0b1zs6MtbxRW4uX7cJ89iSA5i3stziPUAo6YycjPHKTCsuE
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Only ARGB32-type pixelformat were assumed to have 4 components, which is
wrong since RGB32-type pixelformats may have an alpha channel, so they
should also assume 4 color components.

The XRGB32-type pixelformats really have only 3 color components, but this
complicated matters since that creates strides that are sometimes width * 3
and sometimes width * 4, and in fact this can result in buffer overflows.

Keep things simple by just always processing all 4 color components.

In the future we might want to optimize this again for the XRGB32-type
pixelformats, but for now keep it simple and robust.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: <stable@vger.kernel.org>      # for v5.4 and up
---
diff --git a/drivers/media/platform/vicodec/codec-v4l2-fwht.c b/drivers/media/platform/vicodec/codec-v4l2-fwht.c
index 3c93d9232c3c..b6e39fbd8ad5 100644
--- a/drivers/media/platform/vicodec/codec-v4l2-fwht.c
+++ b/drivers/media/platform/vicodec/codec-v4l2-fwht.c
@@ -27,17 +27,17 @@ static const struct v4l2_fwht_pixfmt_info v4l2_fwht_pixfmts[] = {
 	{ V4L2_PIX_FMT_BGR24,   3, 3, 1, 3, 3, 1, 1, 3, 1, FWHT_FL_PIXENC_RGB},
 	{ V4L2_PIX_FMT_RGB24,   3, 3, 1, 3, 3, 1, 1, 3, 1, FWHT_FL_PIXENC_RGB},
 	{ V4L2_PIX_FMT_HSV24,   3, 3, 1, 3, 3, 1, 1, 3, 1, FWHT_FL_PIXENC_HSV},
-	{ V4L2_PIX_FMT_BGR32,   4, 4, 1, 4, 4, 1, 1, 3, 1, FWHT_FL_PIXENC_RGB},
-	{ V4L2_PIX_FMT_XBGR32,  4, 4, 1, 4, 4, 1, 1, 3, 1, FWHT_FL_PIXENC_RGB},
+	{ V4L2_PIX_FMT_BGR32,   4, 4, 1, 4, 4, 1, 1, 4, 1, FWHT_FL_PIXENC_RGB},
+	{ V4L2_PIX_FMT_XBGR32,  4, 4, 1, 4, 4, 1, 1, 4, 1, FWHT_FL_PIXENC_RGB},
 	{ V4L2_PIX_FMT_ABGR32,  4, 4, 1, 4, 4, 1, 1, 4, 1, FWHT_FL_PIXENC_RGB},
-	{ V4L2_PIX_FMT_RGB32,   4, 4, 1, 4, 4, 1, 1, 3, 1, FWHT_FL_PIXENC_RGB},
-	{ V4L2_PIX_FMT_XRGB32,  4, 4, 1, 4, 4, 1, 1, 3, 1, FWHT_FL_PIXENC_RGB},
+	{ V4L2_PIX_FMT_RGB32,   4, 4, 1, 4, 4, 1, 1, 4, 1, FWHT_FL_PIXENC_RGB},
+	{ V4L2_PIX_FMT_XRGB32,  4, 4, 1, 4, 4, 1, 1, 4, 1, FWHT_FL_PIXENC_RGB},
 	{ V4L2_PIX_FMT_ARGB32,  4, 4, 1, 4, 4, 1, 1, 4, 1, FWHT_FL_PIXENC_RGB},
-	{ V4L2_PIX_FMT_BGRX32,  4, 4, 1, 4, 4, 1, 1, 3, 1, FWHT_FL_PIXENC_RGB},
+	{ V4L2_PIX_FMT_BGRX32,  4, 4, 1, 4, 4, 1, 1, 4, 1, FWHT_FL_PIXENC_RGB},
 	{ V4L2_PIX_FMT_BGRA32,  4, 4, 1, 4, 4, 1, 1, 4, 1, FWHT_FL_PIXENC_RGB},
-	{ V4L2_PIX_FMT_RGBX32,  4, 4, 1, 4, 4, 1, 1, 3, 1, FWHT_FL_PIXENC_RGB},
+	{ V4L2_PIX_FMT_RGBX32,  4, 4, 1, 4, 4, 1, 1, 4, 1, FWHT_FL_PIXENC_RGB},
 	{ V4L2_PIX_FMT_RGBA32,  4, 4, 1, 4, 4, 1, 1, 4, 1, FWHT_FL_PIXENC_RGB},
-	{ V4L2_PIX_FMT_HSV32,   4, 4, 1, 4, 4, 1, 1, 3, 1, FWHT_FL_PIXENC_HSV},
+	{ V4L2_PIX_FMT_HSV32,   4, 4, 1, 4, 4, 1, 1, 4, 1, FWHT_FL_PIXENC_HSV},
 	{ V4L2_PIX_FMT_GREY,    1, 1, 1, 1, 0, 1, 1, 1, 1, FWHT_FL_PIXENC_RGB},
 };

@@ -175,22 +175,14 @@ static int prepare_raw_frame(struct fwht_raw_frame *rf,
 	case V4L2_PIX_FMT_RGB32:
 	case V4L2_PIX_FMT_XRGB32:
 	case V4L2_PIX_FMT_HSV32:
-		rf->cr = rf->luma + 1;
-		rf->cb = rf->cr + 2;
-		rf->luma += 2;
-		break;
-	case V4L2_PIX_FMT_BGR32:
-	case V4L2_PIX_FMT_XBGR32:
-		rf->cb = rf->luma;
-		rf->cr = rf->cb + 2;
-		rf->luma++;
-		break;
 	case V4L2_PIX_FMT_ARGB32:
 		rf->alpha = rf->luma;
 		rf->cr = rf->luma + 1;
 		rf->cb = rf->cr + 2;
 		rf->luma += 2;
 		break;
+	case V4L2_PIX_FMT_BGR32:
+	case V4L2_PIX_FMT_XBGR32:
 	case V4L2_PIX_FMT_ABGR32:
 		rf->cb = rf->luma;
 		rf->cr = rf->cb + 2;
@@ -198,10 +190,6 @@ static int prepare_raw_frame(struct fwht_raw_frame *rf,
 		rf->alpha = rf->cr + 1;
 		break;
 	case V4L2_PIX_FMT_BGRX32:
-		rf->cb = rf->luma + 1;
-		rf->cr = rf->cb + 2;
-		rf->luma += 2;
-		break;
 	case V4L2_PIX_FMT_BGRA32:
 		rf->alpha = rf->luma;
 		rf->cb = rf->luma + 1;
@@ -209,10 +197,6 @@ static int prepare_raw_frame(struct fwht_raw_frame *rf,
 		rf->luma += 2;
 		break;
 	case V4L2_PIX_FMT_RGBX32:
-		rf->cr = rf->luma;
-		rf->cb = rf->cr + 2;
-		rf->luma++;
-		break;
 	case V4L2_PIX_FMT_RGBA32:
 		rf->alpha = rf->luma + 3;
 		rf->cr = rf->luma;
