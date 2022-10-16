Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71F2460028C
	for <lists+linux-media@lfdr.de>; Sun, 16 Oct 2022 19:57:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229748AbiJPR5r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Oct 2022 13:57:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229679AbiJPR5q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Oct 2022 13:57:46 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42C8929355
        for <linux-media@vger.kernel.org>; Sun, 16 Oct 2022 10:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1665943063;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9S6KHRZorxW9iRfuype592okm6l1ei31+q0809xnIlU=;
        b=Zq5buMDCyjC8q0xUBI4V2qm/UBtukuVcLpFQjzrM609VyTf2jXwU+x1L9sqIOGwEGHEqvt
        Slxmh5N8w+dDHgo25Gg1Gu7jqcioDn5ImtsXJTxRF33nTGXQYdPV2LFmSUnznZf01h9If2
        sc9LkWcVMOmO8e2idr81/m4Sag7v3Dk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-375-5FTx-dafMeuEYumGUAY1uA-1; Sun, 16 Oct 2022 13:57:41 -0400
X-MC-Unique: 5FTx-dafMeuEYumGUAY1uA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8AA553803904;
        Sun, 16 Oct 2022 17:57:41 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.97])
        by smtp.corp.redhat.com (Postfix) with ESMTP id F0296414A815;
        Sun, 16 Oct 2022 17:57:40 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v4l-utils 1/4] libv4lconvert: Fix v4lconvert_yuv420_to_rgb/bgr24() not taking stride into account
Date:   Sun, 16 Oct 2022 19:57:26 +0200
Message-Id: <20221016175729.187258-2-hdegoede@redhat.com>
In-Reply-To: <20221016175729.187258-1-hdegoede@redhat.com>
References: <20221016175729.187258-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The atomisp driver can generate V4L2_PIX_FMT_YUV420 buffers where
stride != width. Where as v4lconvert_yuv420_to_rgb/bgr24() assumed that
stride == width is always true.

Add a stride argument to v4lconvert_yuv420_to_rgb/bgr24() to fix this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 lib/libv4lconvert/libv4lconvert-priv.h |  4 ++--
 lib/libv4lconvert/libv4lconvert.c      | 12 +++++------
 lib/libv4lconvert/rgbyuv.c             | 30 ++++++++++++++++----------
 3 files changed, 27 insertions(+), 19 deletions(-)

diff --git a/lib/libv4lconvert/libv4lconvert-priv.h b/lib/libv4lconvert/libv4lconvert-priv.h
index 6b9128ce..495f726d 100644
--- a/lib/libv4lconvert/libv4lconvert-priv.h
+++ b/lib/libv4lconvert/libv4lconvert-priv.h
@@ -118,10 +118,10 @@ void v4lconvert_rgb24_to_yuv420(const unsigned char *src, unsigned char *dest,
 		const struct v4l2_format *src_fmt, int bgr, int yvu, int bpp);
 
 void v4lconvert_yuv420_to_rgb24(const unsigned char *src, unsigned char *dst,
-		int width, int height, int yvu);
+		int width, int height, int stride, int yvu);
 
 void v4lconvert_yuv420_to_bgr24(const unsigned char *src, unsigned char *dst,
-		int width, int height, int yvu);
+		int width, int height, int stride, int yvu);
 
 void v4lconvert_yuyv_to_rgb24(const unsigned char *src, unsigned char *dst,
 		int width, int height, int stride);
diff --git a/lib/libv4lconvert/libv4lconvert.c b/lib/libv4lconvert/libv4lconvert.c
index e794ec00..e5d5ddde 100644
--- a/lib/libv4lconvert/libv4lconvert.c
+++ b/lib/libv4lconvert/libv4lconvert.c
@@ -905,11 +905,11 @@ static int v4lconvert_convert_pixfmt(struct v4lconvert_data *data,
 		switch (dest_pix_fmt) {
 		case V4L2_PIX_FMT_RGB24:
 			v4lconvert_yuv420_to_rgb24(data->convert_pixfmt_buf, dest, width,
-					height, yvu);
+					height, bytesperline, yvu);
 			break;
 		case V4L2_PIX_FMT_BGR24:
 			v4lconvert_yuv420_to_bgr24(data->convert_pixfmt_buf, dest, width,
-					height, yvu);
+					height, bytesperline, yvu);
 			break;
 		}
 		break;
@@ -1398,11 +1398,11 @@ static int v4lconvert_convert_pixfmt(struct v4lconvert_data *data,
 		switch (dest_pix_fmt) {
 		case V4L2_PIX_FMT_RGB24:
 			v4lconvert_yuv420_to_rgb24(src, dest, width,
-					height, 0);
+					height, bytesperline, 0);
 			break;
 		case V4L2_PIX_FMT_BGR24:
 			v4lconvert_yuv420_to_bgr24(src, dest, width,
-					height, 0);
+					height, bytesperline, 0);
 			break;
 		case V4L2_PIX_FMT_YUV420:
 			memcpy(dest, src, width * height * 3 / 2);
@@ -1422,11 +1422,11 @@ static int v4lconvert_convert_pixfmt(struct v4lconvert_data *data,
 		switch (dest_pix_fmt) {
 		case V4L2_PIX_FMT_RGB24:
 			v4lconvert_yuv420_to_rgb24(src, dest, width,
-					height, 1);
+					height, bytesperline, 1);
 			break;
 		case V4L2_PIX_FMT_BGR24:
 			v4lconvert_yuv420_to_bgr24(src, dest, width,
-					height, 1);
+					height, bytesperline, 1);
 			break;
 		case V4L2_PIX_FMT_YUV420:
 			v4lconvert_swap_uv(src, dest, fmt);
diff --git a/lib/libv4lconvert/rgbyuv.c b/lib/libv4lconvert/rgbyuv.c
index b54b4577..1ca821ab 100644
--- a/lib/libv4lconvert/rgbyuv.c
+++ b/lib/libv4lconvert/rgbyuv.c
@@ -93,7 +93,7 @@ void v4lconvert_rgb24_to_yuv420(const unsigned char *src, unsigned char *dest,
 #define CLIP(color) (unsigned char)(((color) > 0xFF) ? 0xff : (((color) < 0) ? 0 : (color)))
 
 void v4lconvert_yuv420_to_bgr24(const unsigned char *src, unsigned char *dest,
-		int width, int height, int yvu)
+		int width, int height, int stride, int yvu)
 {
 	int i, j;
 
@@ -101,11 +101,11 @@ void v4lconvert_yuv420_to_bgr24(const unsigned char *src, unsigned char *dest,
 	const unsigned char *usrc, *vsrc;
 
 	if (yvu) {
-		vsrc = src + width * height;
-		usrc = vsrc + (width * height) / 4;
+		vsrc = src + stride * height;
+		usrc = vsrc + (stride * height) / 4;
 	} else {
-		usrc = src + width * height;
-		vsrc = usrc + (width * height) / 4;
+		usrc = src + stride * height;
+		vsrc = usrc + (stride * height) / 4;
 	}
 
 	for (i = 0; i < height; i++) {
@@ -138,16 +138,20 @@ void v4lconvert_yuv420_to_bgr24(const unsigned char *src, unsigned char *dest,
 			usrc++;
 			vsrc++;
 		}
+		ysrc += stride - width;
 		/* Rewind u and v for next line */
 		if (!(i & 1)) {
 			usrc -= width / 2;
 			vsrc -= width / 2;
+		} else {
+			usrc += (stride - width) / 2;
+			vsrc += (stride - width) / 2;
 		}
 	}
 }
 
 void v4lconvert_yuv420_to_rgb24(const unsigned char *src, unsigned char *dest,
-		int width, int height, int yvu)
+		int width, int height, int stride, int yvu)
 {
 	int i, j;
 
@@ -155,11 +159,11 @@ void v4lconvert_yuv420_to_rgb24(const unsigned char *src, unsigned char *dest,
 	const unsigned char *usrc, *vsrc;
 
 	if (yvu) {
-		vsrc = src + width * height;
-		usrc = vsrc + (width * height) / 4;
+		vsrc = src + stride * height;
+		usrc = vsrc + (stride * height) / 4;
 	} else {
-		usrc = src + width * height;
-		vsrc = usrc + (width * height) / 4;
+		usrc = src + stride * height;
+		vsrc = usrc + (stride * height) / 4;
 	}
 
 	for (i = 0; i < height; i++) {
@@ -192,10 +196,14 @@ void v4lconvert_yuv420_to_rgb24(const unsigned char *src, unsigned char *dest,
 			usrc++;
 			vsrc++;
 		}
+		ysrc += stride - width;
 		/* Rewind u and v for next line */
-		if (!(i&1)) {
+		if (!(i & 1)) {
 			usrc -= width / 2;
 			vsrc -= width / 2;
+		} else {
+			usrc += (stride - width) / 2;
+			vsrc += (stride - width) / 2;
 		}
 	}
 }
-- 
2.37.3

