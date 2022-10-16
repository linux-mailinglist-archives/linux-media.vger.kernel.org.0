Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAAA060028E
	for <lists+linux-media@lfdr.de>; Sun, 16 Oct 2022 19:57:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229683AbiJPR5t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Oct 2022 13:57:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229747AbiJPR5r (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Oct 2022 13:57:47 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F197B2A25B
        for <linux-media@vger.kernel.org>; Sun, 16 Oct 2022 10:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1665943065;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=c0pDNIoMwucOc74WiAOiC0DMsLVoxDkWz0MmjdoLFSA=;
        b=VPCWHQYwdQ/NRGQzi30cm/YCjK+b2mqo83ZxPPh0KZeLDHDHG/MB5VHQhg8vW/8GmfTdzq
        i0DoqVdynMH+0FjEmMUPUcdyELjWUapyfiSXE5oBl6c/06npo75GZ8RmquPL4bWzvoKtVg
        uNVmHpg/0ctEY982/C/b6ZXPXyu1ewg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-32-H9IAv7KDOfaclKd_wN1p0A-1; Sun, 16 Oct 2022 13:57:43 -0400
X-MC-Unique: H9IAv7KDOfaclKd_wN1p0A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2AF7729AA2E3;
        Sun, 16 Oct 2022 17:57:43 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.97])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8FAB2414A815;
        Sun, 16 Oct 2022 17:57:42 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v4l-utils 3/4] libv4lconvert: Fix v4lconvert_nv12_*() not taking stride into account
Date:   Sun, 16 Oct 2022 19:57:28 +0200
Message-Id: <20221016175729.187258-4-hdegoede@redhat.com>
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

The atomisp driver can generate V4L2_PIX_FMT_NV12 buffers where
stride != width. Where as v4lconvert_nv12_*() assumed that
stride == width is always true.

Add a stride argument to v4lconvert_nv12_*() to fix this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 lib/libv4lconvert/libv4lconvert-priv.h |  4 ++--
 lib/libv4lconvert/libv4lconvert.c      |  8 ++++----
 lib/libv4lconvert/rgbyuv.c             | 18 +++++++++++++-----
 3 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/lib/libv4lconvert/libv4lconvert-priv.h b/lib/libv4lconvert/libv4lconvert-priv.h
index f87a43a4..f361f2a0 100644
--- a/lib/libv4lconvert/libv4lconvert-priv.h
+++ b/lib/libv4lconvert/libv4lconvert-priv.h
@@ -287,10 +287,10 @@ void v4lconvert_hsv_to_rgb24(const unsigned char *src, unsigned char *dest,
 		int width, int height, int bgr, int Xin, unsigned char hsv_enc);
 
 void v4lconvert_nv12_to_rgb24(const unsigned char *src, unsigned char *dest,
-		int width, int height, int bgr);
+		int width, int height, int stride, int bgr);
 
 void v4lconvert_nv12_to_yuv420(const unsigned char *src, unsigned char *dest,
-		int width, int height, int yvu);
+		int width, int height, int stride, int yvu);
 
 void v4lconvert_rotate90(unsigned char *src, unsigned char *dest,
 		struct v4l2_format *fmt);
diff --git a/lib/libv4lconvert/libv4lconvert.c b/lib/libv4lconvert/libv4lconvert.c
index 77f9eca5..d0d38286 100644
--- a/lib/libv4lconvert/libv4lconvert.c
+++ b/lib/libv4lconvert/libv4lconvert.c
@@ -937,16 +937,16 @@ static int v4lconvert_convert_pixfmt(struct v4lconvert_data *data,
 	case V4L2_PIX_FMT_NV12:
 		switch (dest_pix_fmt) {
 		case V4L2_PIX_FMT_RGB24:
-			v4lconvert_nv12_to_rgb24(src, dest, width, height, 0);
+			v4lconvert_nv12_to_rgb24(src, dest, width, height, bytesperline, 0);
 			break;
 		case V4L2_PIX_FMT_BGR24:
-			v4lconvert_nv12_to_rgb24(src, dest, width, height, 1);
+			v4lconvert_nv12_to_rgb24(src, dest, width, height, bytesperline, 1);
 			break;
 		case V4L2_PIX_FMT_YUV420:
-			v4lconvert_nv12_to_yuv420(src, dest, width, height, 0);
+			v4lconvert_nv12_to_yuv420(src, dest, width, height, bytesperline, 0);
 			break;
 		case V4L2_PIX_FMT_YVU420:
-			v4lconvert_nv12_to_yuv420(src, dest, width, height, 1);
+			v4lconvert_nv12_to_yuv420(src, dest, width, height, bytesperline, 1);
 			break;
 		}
 		break;
diff --git a/lib/libv4lconvert/rgbyuv.c b/lib/libv4lconvert/rgbyuv.c
index f9017016..e9fe6df9 100644
--- a/lib/libv4lconvert/rgbyuv.c
+++ b/lib/libv4lconvert/rgbyuv.c
@@ -857,11 +857,11 @@ void v4lconvert_hsv_to_rgb24(const unsigned char *src, unsigned char *dest,
 }
 
 void v4lconvert_nv12_to_rgb24(const unsigned char *src, unsigned char *dest,
-		int width, int height, int bgr)
+		int width, int height, int stride, int bgr)
 {
 	int i, j;
 	const unsigned char *ysrc = src;
-	const unsigned char *uvsrc = src + width * height;
+	const unsigned char *uvsrc = src + stride * height;
 
 	for (i = 0; i < height; i++) {
 		for (j = 0; j < width; j ++) {
@@ -879,18 +879,21 @@ void v4lconvert_nv12_to_rgb24(const unsigned char *src, unsigned char *dest,
 				uvsrc += 2;
 		}
 
+		ysrc += stride - width;
 		/* Rewind u and v for next line */
 		if (!(i&1))
 			uvsrc -= width;
+		else
+			uvsrc += stride - width;
 	}
 }
 
 void v4lconvert_nv12_to_yuv420(const unsigned char *src, unsigned char *dest,
-		int width, int height, int yvu)
+		int width, int height, int stride, int yvu)
 {
 	int i, j;
 	const unsigned char *ysrc = src;
-	const unsigned char *uvsrc = src + width * height;
+	const unsigned char *uvsrc = src + stride * height;
 	unsigned char *ydst = dest;
 	unsigned char *udst, *vdst;
 
@@ -902,7 +905,7 @@ void v4lconvert_nv12_to_yuv420(const unsigned char *src, unsigned char *dest,
 		vdst = udst + ((width / 2) * (height / 2));
 	}
 
-	for (i = 0; i < height; i++)
+	for (i = 0; i < height; i++) {
 		for (j = 0; j < width; j++) {
 			*ydst++ = *ysrc++;
 			if (((i % 2) == 0) && ((j % 2) == 0)) {
@@ -910,4 +913,9 @@ void v4lconvert_nv12_to_yuv420(const unsigned char *src, unsigned char *dest,
 				*vdst++ = *uvsrc++;
 			}
 		}
+
+		ysrc += stride - width;
+		if ((i % 2) == 0)
+			uvsrc += stride - width;
+	}
 }
-- 
2.37.3

