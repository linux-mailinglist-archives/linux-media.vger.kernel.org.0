Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDA1E4C3A1C
	for <lists+linux-media@lfdr.de>; Fri, 25 Feb 2022 01:08:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232641AbiBYAIu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Feb 2022 19:08:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231324AbiBYAIt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Feb 2022 19:08:49 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45A69145AE1
        for <linux-media@vger.kernel.org>; Thu, 24 Feb 2022 16:08:17 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id c192so756760wma.4
        for <linux-media@vger.kernel.org>; Thu, 24 Feb 2022 16:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tqBf7h+Gwzv+ebh5s+Kc+a57roM9u8c7DiABvHCuLsw=;
        b=b+3gfVogSzaoGlO+GSuW6EekrbTME9tPFEFOZeo3g1CUgUSIPJGBER9WE/wPZ0frL+
         FfKd5/9HAEmg7W69txCpHLLXNcU0QJsn0Q2GghOhcQ/MdUsXWrDZYOVYqDzOxryF0pGd
         HoTCfKDrsnxSsUzZA91wcIHuGYxVGXz3wOWS7eqjU76HQEFJAOSUBUSO9As81HYuZZZl
         KD+jnCP3CXjSc/BH1DEzjQMOP3a7/mq6T/Mc+SAhpnoRtNdTq447HWzDgi9y1cfZzuUz
         P5RYVh/RlsPnEJd87pJzwxatnb92hVUPHrMx4P8CEN0EgVW/hAh/ddnFkIihee7Q7U6N
         R+ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tqBf7h+Gwzv+ebh5s+Kc+a57roM9u8c7DiABvHCuLsw=;
        b=kFI5g9iGOYHjKPPb4bC35w4lhdm63xv+BJ+gICa3zrNobo18zxkSUguexmcEvZDS9L
         17tiJvPbRbEj6a1VdyFQLi5DpXBlL92dRQErJEtCVHoqDLcdqQxtE1/otT+ilvOvWu6e
         oAZiE3F3YIggEY3xzAodavytTfNVVw67mxin5H+4EDxCmm0lPbnfSDheWUWOKW2aPHEL
         sv6AT93WRfwSk5kqdeQtZMCAQQ9O3o5ec/TvAyH0QpGBQlBnRkBCiAQuSHbe1PXjmbFz
         pmkK9ac7dhTzLhA/AgvUzaIsZWY2GHjJiYNUknNx7wLya4t9PHqzCt964tVnGD7bwUdI
         uH/w==
X-Gm-Message-State: AOAM530/CWUs8buFInb5bsDPMbxqhD6YqZEi33wDdKZKBuod5ue4rUs8
        mudHKswSe8g2H/BgXDXmGx52SxhFgav+0g==
X-Google-Smtp-Source: ABdhPJxLgx+hft65LbspGNy8ZeAYAuT+AAjLaJSh+ZjR7PaBP++n2eFgp/QXLEwm3cR2S3EOr49mbQ==
X-Received: by 2002:a05:600c:601a:b0:380:d09a:ca7 with SMTP id az26-20020a05600c601a00b00380d09a0ca7mr385987wmb.128.1645747695803;
        Thu, 24 Feb 2022 16:08:15 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id a3-20020adfe5c3000000b001e68a5e1c20sm742668wrn.4.2022.02.24.16.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 16:08:15 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        andriy.shevchenko@linux.intel.com, hverkuil-cisco@xs4all.nl,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH v2 01/11] media: uapi: Add IPU3 packed Y10 format
Date:   Fri, 25 Feb 2022 00:07:43 +0000
Message-Id: <20220225000753.511996-2-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220225000753.511996-1-djrscally@gmail.com>
References: <20220225000753.511996-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some platforms with an Intel IPU3 have an IR sensor producing 10 bit
greyscale format data that is transmitted over a CSI-2 bus to a CIO2
device - this packs the data into 32 bytes per 25 pixels. Add an entry
to the uAPI header defining that format.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v2:

	- Switched away from using the fourcc in the explanatory note for
	pixfmt-yuv-luma.rst (Nicolas)

 .../userspace-api/media/v4l/pixfmt-yuv-luma.rst    | 14 +++++++++++++-
 drivers/media/v4l2-core/v4l2-ioctl.c               |  1 +
 include/uapi/linux/videodev2.h                     |  3 ++-
 3 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
index 91942c4f0967..945a0058506b 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
@@ -48,6 +48,17 @@ are often referred to as greyscale formats.
       - ...
       - ...
 
+    * .. _V4L2-PIX-FMT-IPU3-Y10:
+
+      - ``V4L2_PIX_FMT_IPU3_Y10``
+      - 'ip3y'
+
+      - Y'\ :sub:`0`\ [7:0]
+      - Y'\ :sub:`1`\ [5:0] Y'\ :sub:`0`\ [9:8]
+      - Y'\ :sub:`2`\ [3:0] Y'\ :sub:`1`\ [9:6]
+      - Y'\ :sub:`3`\ [1:0] Y'\ :sub:`2`\ [9:4]
+      - Y'\ :sub:`3`\ [9:2]
+
     * .. _V4L2-PIX-FMT-Y10:
 
       - ``V4L2_PIX_FMT_Y10``
@@ -133,4 +144,5 @@ are often referred to as greyscale formats.
 
     For the Y16 and Y16_BE formats, the actual sampling precision may be lower
     than 16 bits. For example, 10 bits per pixel uses values in the range 0 to
-    1023.
+    1023. For the IPU3_Y10 format 25 pixels are packed into 32 bytes, which
+    leaves the 6 most significant bits of the last byte padded with 0.
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 31d0109ce5a8..db46925003de 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1263,6 +1263,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_Y16_BE:	descr = "16-bit Greyscale BE"; break;
 	case V4L2_PIX_FMT_Y10BPACK:	descr = "10-bit Greyscale (Packed)"; break;
 	case V4L2_PIX_FMT_Y10P:		descr = "10-bit Greyscale (MIPI Packed)"; break;
+	case V4L2_PIX_FMT_IPU3_Y10:	descr = "10-bit greyscale (IPU3 Packed)"; break;
 	case V4L2_PIX_FMT_Y8I:		descr = "Interleaved 8-bit Greyscale"; break;
 	case V4L2_PIX_FMT_Y12I:		descr = "Interleaved 12-bit Greyscale"; break;
 	case V4L2_PIX_FMT_Z16:		descr = "16-bit Depth"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index f118fe7a9f58..d49bde41785b 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -569,6 +569,7 @@ struct v4l2_pix_format {
 /* Grey bit-packed formats */
 #define V4L2_PIX_FMT_Y10BPACK    v4l2_fourcc('Y', '1', '0', 'B') /* 10  Greyscale bit-packed */
 #define V4L2_PIX_FMT_Y10P    v4l2_fourcc('Y', '1', '0', 'P') /* 10  Greyscale, MIPI RAW10 packed */
+#define V4L2_PIX_FMT_IPU3_Y10		v4l2_fourcc('i', 'p', '3', 'y') /* IPU3 packed 10-bit greyscale */
 
 /* Palette formats */
 #define V4L2_PIX_FMT_PAL8    v4l2_fourcc('P', 'A', 'L', '8') /*  8  8-bit palette */
@@ -744,7 +745,7 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_CNF4     v4l2_fourcc('C', 'N', 'F', '4') /* Intel 4-bit packed depth confidence information */
 #define V4L2_PIX_FMT_HI240    v4l2_fourcc('H', 'I', '2', '4') /* BTTV 8-bit dithered RGB */
 
-/* 10bit raw bayer packed, 32 bytes for every 25 pixels, last LSB 6 bits unused */
+/* 10bit raw packed, 32 bytes for every 25 pixels, last LSB 6 bits unused */
 #define V4L2_PIX_FMT_IPU3_SBGGR10	v4l2_fourcc('i', 'p', '3', 'b') /* IPU3 packed 10-bit BGGR bayer */
 #define V4L2_PIX_FMT_IPU3_SGBRG10	v4l2_fourcc('i', 'p', '3', 'g') /* IPU3 packed 10-bit GBRG bayer */
 #define V4L2_PIX_FMT_IPU3_SGRBG10	v4l2_fourcc('i', 'p', '3', 'G') /* IPU3 packed 10-bit GRBG bayer */
-- 
2.25.1

