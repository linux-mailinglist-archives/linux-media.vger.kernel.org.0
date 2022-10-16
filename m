Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5031600290
	for <lists+linux-media@lfdr.de>; Sun, 16 Oct 2022 19:57:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbiJPR5u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Oct 2022 13:57:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbiJPR5t (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Oct 2022 13:57:49 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCAED29355
        for <linux-media@vger.kernel.org>; Sun, 16 Oct 2022 10:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1665943067;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bxHYaconQiDBKCZQGex41zM7Q2tL5c2N/0UkwfLa4Ak=;
        b=Y+ftMytlDJzyaGP/GH4y1EUfBJROIrgTlFqHNFYL5o8VZcdZI0XYKTjYHZOMrDMStFXOdW
        aUsrKBGmBqKTe/ZhFzNN9paSoZuuiuGGk4RnEelBpz9j1CcSrytao1p2a2QAgDVA969yUS
        6NtSblcJKmJ0Qvwpqp1Gwq0bi1ZrlPI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-177-7rPxGP4AOI6Y4UZZpXjD2Q-1; Sun, 16 Oct 2022 13:57:42 -0400
X-MC-Unique: 7rPxGP4AOI6Y4UZZpXjD2Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 58EA13C01D82;
        Sun, 16 Oct 2022 17:57:42 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.97])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C0D8A414A815;
        Sun, 16 Oct 2022 17:57:41 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v4l-utils 2/4] libv4lconvert: Fix v4lconvert_rgb565_to_rgb/bgr24() not taking stride into account
Date:   Sun, 16 Oct 2022 19:57:27 +0200
Message-Id: <20221016175729.187258-3-hdegoede@redhat.com>
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

The atomisp driver can generate V4L2_PIX_FMT_RGB565 buffers where
stride != width. Where as v4lconvert_rgb565_to_rgb/bgr24() assumed that
stride == width is always true.

Add a stride argument to v4lconvert_rgb565_to_rgb/bgr24() to fix this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 lib/libv4lconvert/libv4lconvert-priv.h | 4 ++--
 lib/libv4lconvert/libv4lconvert.c      | 4 ++--
 lib/libv4lconvert/rgbyuv.c             | 6 ++++--
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/lib/libv4lconvert/libv4lconvert-priv.h b/lib/libv4lconvert/libv4lconvert-priv.h
index 495f726d..f87a43a4 100644
--- a/lib/libv4lconvert/libv4lconvert-priv.h
+++ b/lib/libv4lconvert/libv4lconvert-priv.h
@@ -178,10 +178,10 @@ int v4lconvert_y10b_to_yuv420(struct v4lconvert_data *data,
 	const unsigned char *src, unsigned char *dest, int width, int height);
 
 void v4lconvert_rgb565_to_rgb24(const unsigned char *src, unsigned char *dest,
-		int width, int height);
+		int width, int height, int stride);
 
 void v4lconvert_rgb565_to_bgr24(const unsigned char *src, unsigned char *dest,
-		int width, int height);
+		int width, int height, int stride);
 
 void v4lconvert_rgb565_to_yuv420(const unsigned char *src, unsigned char *dest,
 		const struct v4l2_format *src_fmt, int yvu);
diff --git a/lib/libv4lconvert/libv4lconvert.c b/lib/libv4lconvert/libv4lconvert.c
index e5d5ddde..77f9eca5 100644
--- a/lib/libv4lconvert/libv4lconvert.c
+++ b/lib/libv4lconvert/libv4lconvert.c
@@ -1282,10 +1282,10 @@ static int v4lconvert_convert_pixfmt(struct v4lconvert_data *data,
 		}
 		switch (dest_pix_fmt) {
 		case V4L2_PIX_FMT_RGB24:
-			v4lconvert_rgb565_to_rgb24(src, dest, width, height);
+			v4lconvert_rgb565_to_rgb24(src, dest, width, height, bytesperline);
 			break;
 		case V4L2_PIX_FMT_BGR24:
-			v4lconvert_rgb565_to_bgr24(src, dest, width, height);
+			v4lconvert_rgb565_to_bgr24(src, dest, width, height, bytesperline);
 			break;
 		case V4L2_PIX_FMT_YUV420:
 			v4lconvert_rgb565_to_yuv420(src, dest, fmt, 0);
diff --git a/lib/libv4lconvert/rgbyuv.c b/lib/libv4lconvert/rgbyuv.c
index 1ca821ab..f9017016 100644
--- a/lib/libv4lconvert/rgbyuv.c
+++ b/lib/libv4lconvert/rgbyuv.c
@@ -511,7 +511,7 @@ void v4lconvert_swap_uv(const unsigned char *src, unsigned char *dest,
 }
 
 void v4lconvert_rgb565_to_rgb24(const unsigned char *src, unsigned char *dest,
-		int width, int height)
+		int width, int height, int stride)
 {
 	int j;
 	while (--height >= 0) {
@@ -525,11 +525,12 @@ void v4lconvert_rgb565_to_rgb24(const unsigned char *src, unsigned char *dest,
 
 			src += 2;
 		}
+		src += stride - 2 * width;
 	}
 }
 
 void v4lconvert_rgb565_to_bgr24(const unsigned char *src, unsigned char *dest,
-		int width, int height)
+		int width, int height, int stride)
 {
 	int j;
 	while (--height >= 0) {
@@ -543,6 +544,7 @@ void v4lconvert_rgb565_to_bgr24(const unsigned char *src, unsigned char *dest,
 
 			src += 2;
 		}
+		src += stride - 2 * width;
 	}
 }
 
-- 
2.37.3

