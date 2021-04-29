Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD4C836EB5A
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 15:29:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237302AbhD2N3e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Apr 2021 09:29:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236635AbhD2N3d (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Apr 2021 09:29:33 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4FE6C06138B
        for <linux-media@vger.kernel.org>; Thu, 29 Apr 2021 06:28:46 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id z6so5676510wrm.4
        for <linux-media@vger.kernel.org>; Thu, 29 Apr 2021 06:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ryhh0/XlJ3AbDBsHZICjqkSID/+spC7zQgSt9QUY5NE=;
        b=xX0MmYQ9zNKEXCV1CVjGtNmmzO7Yycr/LRdCnQecFgH3MSu50bUKiwZH1EReMzHQWw
         JCcy8B3GiSFLEADrZiE5F2UUi/EqWvkXrxu3vTBUq4c3iGp2IFo6N6eAshhUaHfa63T0
         kj3aZR3S9OPCXtvHDsuNb6lUJUmExfy/Mx8e4Uuy1V2sAjNeysUCzNLbZysmCuEGxy67
         H/sCdZxhGZ9caUzR9tRo2pYx13/DIXnnTYR+EYB0sR7WjF/Xj461R6U+pw7yFHAxzHTl
         AUxxRZSLW9iIimgO2/xgjlN7wz2kd5VZR2cBuZJBdK8c23czS1rtXdO9jHbVxA227c+W
         Xocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ryhh0/XlJ3AbDBsHZICjqkSID/+spC7zQgSt9QUY5NE=;
        b=bC2to0zIUa7qMyZyoidu6QXJp9HOtsp8mo3udkwFlmR5n8bPiH/tq65l/mtBSYRoGQ
         b/VncvLkkufWpieOrHvL9Px/yEgfZKl/wJlJVbPF5vnQ3S0irqfhH/du1u4d+aeGOZY2
         eqvnVGkG+Ay8mfC2ii3Kva3UCydXmsrwhIYDBFe3orXgW8tFBo0xVR9WldM3JGWi/tFg
         DQpwlPKVZdw80r6aukrx1C+OwfLTuvcs8zYVRuxd+ylz83ZLUeMRHOvFn5OmTh4Huns+
         7CTnAfaclhrKeorQfg7MfJvhqXeRdWHKlFpzQrGs+FpYVuYv7U4skmUwPGq8yRd7TXpz
         3dMw==
X-Gm-Message-State: AOAM531NLYl0imIOhkF5JSCllEkbZOBiHeiJ6Eaunxz+8PBhrezE3bKL
        hp55NrGgozQnDP5+94Oq1eiAEfAxvZxQ4L3p
X-Google-Smtp-Source: ABdhPJy4zCXHUmsp3h3N+ztTM7YTCe5GHukwtkZfKl5yQX62jrPVhzOJEF3lwxBCdyX938GGrDKS1A==
X-Received: by 2002:a5d:6787:: with SMTP id v7mr34870624wru.386.1619702925323;
        Thu, 29 Apr 2021 06:28:45 -0700 (PDT)
Received: from localhost.localdomain (hst-221-38.medicom.bg. [84.238.221.38])
        by smtp.gmail.com with ESMTPSA id n10sm4811462wrw.37.2021.04.29.06.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 06:28:45 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [RFC/WIP 1/4] media: Add HEIC compressed pixel format
Date:   Thu, 29 Apr 2021 16:28:30 +0300
Message-Id: <20210429132833.2802390-2-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210429132833.2802390-1-stanimir.varbanov@linaro.org>
References: <20210429132833.2802390-1-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add HEIC (High-Efficiency Image Container) pixel format. This an
image container which use HEVC codec to encoded images.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 .../userspace-api/media/v4l/pixfmt-compressed.rst    | 12 ++++++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c                 |  1 +
 include/uapi/linux/videodev2.h                       |  1 +
 3 files changed, 14 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
index ba6c0c961204..246bff90dcac 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
@@ -186,6 +186,18 @@ Compressed Formats
 	If :ref:`VIDIOC_ENUM_FMT` reports ``V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM``
 	then the decoder has no	requirements since it can parse all the
 	information from the raw bytestream.
+    * .. _V4L2-PIX-FMT-HEIC:
+
+      - ``V4L2_PIX_FMT_HEIC``
+      - 'HEIC'
+      - High Efficiency Image Container is an image container file format which
+        uses HEVC encoding and it is a variant of HEIF (High Efficiency Image File)
+        format.
+	The decoder expects one Access Unit per buffer.
+	The encoder generates one Access Unit per buffer.
+	If :ref:`VIDIOC_ENUM_FMT` reports ``V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM``
+	then the decoder has no	requirements since it can parse all the
+	information from the raw bytestream.
     * .. _V4L2-PIX-FMT-HEVC-SLICE:
 
       - ``V4L2_PIX_FMT_HEVC_SLICE``
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 31d1342e61e8..3a1b4c3a76c8 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1454,6 +1454,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 		case V4L2_PIX_FMT_S5C_UYVY_JPG:	descr = "S5C73MX interleaved UYVY/JPEG"; break;
 		case V4L2_PIX_FMT_MT21C:	descr = "Mediatek Compressed Format"; break;
 		case V4L2_PIX_FMT_SUNXI_TILED_NV12: descr = "Sunxi Tiled NV12 Format"; break;
+		case V4L2_PIX_FMT_HEIC:		descr = "HEIC Image Format"; break;
 		default:
 			if (fmt->description[0])
 				return;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 79dbde3bcf8d..2153b5c31d46 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -699,6 +699,7 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_FWHT     v4l2_fourcc('F', 'W', 'H', 'T') /* Fast Walsh Hadamard Transform (vicodec) */
 #define V4L2_PIX_FMT_FWHT_STATELESS     v4l2_fourcc('S', 'F', 'W', 'H') /* Stateless FWHT (vicodec) */
 #define V4L2_PIX_FMT_H264_SLICE v4l2_fourcc('S', '2', '6', '4') /* H264 parsed slices */
+#define V4L2_PIX_FMT_HEIC	v4l2_fourcc('H', 'E', 'I', 'C') /* HEIC HEVC image format */
 
 /*  Vendor-specific formats   */
 #define V4L2_PIX_FMT_CPIA1    v4l2_fourcc('C', 'P', 'I', 'A') /* cpia1 YUV */
-- 
2.25.1

