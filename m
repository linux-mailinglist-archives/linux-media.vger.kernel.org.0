Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0334560028F
	for <lists+linux-media@lfdr.de>; Sun, 16 Oct 2022 19:57:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229747AbiJPR5t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Oct 2022 13:57:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229755AbiJPR5s (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Oct 2022 13:57:48 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7191127B32
        for <linux-media@vger.kernel.org>; Sun, 16 Oct 2022 10:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1665943066;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IEgD/0FzmuJFLFm6IjmCQ72R2L0S86C4niRmtB+En8Q=;
        b=jJlW7MTThFGtDv6UVVFB3DcVzcbfQwwa114LvR9UJkURMOQKOjY9J3u//4AZJPI0wKm4YA
        LiQHiPs5EXsYkNF2BRYXx8qkQpdiIFK7x8bW6xQ3srmLEDhhboLC697cz8c4YIB4DP0I4s
        P9TtQF7avJQ3OA9E2zyKWumrsv7p2a4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-Ry5lIAs_OGeubWQf9-83BA-1; Sun, 16 Oct 2022 13:57:44 -0400
X-MC-Unique: Ry5lIAs_OGeubWQf9-83BA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ECF7C833AEC;
        Sun, 16 Oct 2022 17:57:43 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.97])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 5F7F1414A815;
        Sun, 16 Oct 2022 17:57:43 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v4l-utils 4/4] libv4lconvert: Fix v4lconvert_nv16_to_yuyv() not taking stride into account
Date:   Sun, 16 Oct 2022 19:57:29 +0200
Message-Id: <20221016175729.187258-5-hdegoede@redhat.com>
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

The atomisp driver can generate V4L2_PIX_FMT_NV16 buffers where
stride != width. Where as v4lconvert_nv16_to_yuyv() assumed that
stride == width is always true.

Add a stride argument to v4lconvert_nv16_to_yuyv() to fix this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 lib/libv4lconvert/libv4lconvert-priv.h |  2 +-
 lib/libv4lconvert/libv4lconvert.c      |  8 ++++----
 lib/libv4lconvert/rgbyuv.c             | 16 ++++++++++------
 3 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/lib/libv4lconvert/libv4lconvert-priv.h b/lib/libv4lconvert/libv4lconvert-priv.h
index f361f2a0..00a03f9e 100644
--- a/lib/libv4lconvert/libv4lconvert-priv.h
+++ b/lib/libv4lconvert/libv4lconvert-priv.h
@@ -133,7 +133,7 @@ void v4lconvert_yuyv_to_yuv420(const unsigned char *src, unsigned char *dst,
 		int width, int height, int stride, int yvu);
 
 void v4lconvert_nv16_to_yuyv(const unsigned char *src, unsigned char *dest,
-		int width, int height);
+		int width, int height, int stride);
 
 void v4lconvert_yvyu_to_rgb24(const unsigned char *src, unsigned char *dst,
 		int width, int height, int stride);
diff --git a/lib/libv4lconvert/libv4lconvert.c b/lib/libv4lconvert/libv4lconvert.c
index d0d38286..b07bf3ba 100644
--- a/lib/libv4lconvert/libv4lconvert.c
+++ b/lib/libv4lconvert/libv4lconvert.c
@@ -1445,10 +1445,10 @@ static int v4lconvert_convert_pixfmt(struct v4lconvert_data *data,
 		if (!tmpbuf)
 			return v4lconvert_oom_error(data);
 
-		v4lconvert_nv16_to_yuyv(src, tmpbuf, width, height);
+		v4lconvert_nv16_to_yuyv(src, tmpbuf, width, height, bytesperline);
 		src_pix_fmt = V4L2_PIX_FMT_YUYV;
 		src = tmpbuf;
-		bytesperline = bytesperline * 2;
+		bytesperline = width * 2;
 		/* fall through */
 	}
 	case V4L2_PIX_FMT_YUYV:
@@ -1482,10 +1482,10 @@ static int v4lconvert_convert_pixfmt(struct v4lconvert_data *data,
 			return v4lconvert_oom_error(data);
 
 		/* Note NV61 is NV16 with U and V swapped so this becomes yvyu. */
-		v4lconvert_nv16_to_yuyv(src, tmpbuf, width, height);
+		v4lconvert_nv16_to_yuyv(src, tmpbuf, width, height, bytesperline);
 		src_pix_fmt = V4L2_PIX_FMT_YVYU;
 		src = tmpbuf;
-		bytesperline = bytesperline * 2;
+		bytesperline = width * 2;
 		/* fall through */
 	}
 	case V4L2_PIX_FMT_YVYU:
diff --git a/lib/libv4lconvert/rgbyuv.c b/lib/libv4lconvert/rgbyuv.c
index e9fe6df9..ce31a1ba 100644
--- a/lib/libv4lconvert/rgbyuv.c
+++ b/lib/libv4lconvert/rgbyuv.c
@@ -304,17 +304,21 @@ void v4lconvert_yuyv_to_yuv420(const unsigned char *src, unsigned char *dest,
 }
 
 void v4lconvert_nv16_to_yuyv(const unsigned char *src, unsigned char *dest,
-		int width, int height)
+		int width, int height, int stride)
 {
 	const unsigned char *y, *cbcr;
-	int count = 0;
+	int i, j;
 
 	y = src;
-	cbcr = src + width*height;
+	cbcr = src + stride * height;
 
-	while (count++ < width*height) {
-		*dest++ = *y++;
-		*dest++ = *cbcr++;
+	for (i = 0; i < height; i++) {
+		for (j = 0; j < width; j++) {
+			*dest++ = *y++;
+			*dest++ = *cbcr++;
+		}
+		y += stride - width;
+		cbcr += stride - width;
 	}
 }
 
-- 
2.37.3

