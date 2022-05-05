Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCB3D51CC69
	for <lists+linux-media@lfdr.de>; Fri,  6 May 2022 01:04:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386539AbiEEXH4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 May 2022 19:07:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376753AbiEEXHz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 May 2022 19:07:55 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 392685EDC5
        for <linux-media@vger.kernel.org>; Thu,  5 May 2022 16:04:14 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id c11so7862281wrn.8
        for <linux-media@vger.kernel.org>; Thu, 05 May 2022 16:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3yRBimETvMKoEZ9GRMhY+DUHxkl2xKneFEksDYjOGEs=;
        b=luVxLs/m6lasuWakg4kbOVdqxYVR5rasM0ggCAvNg5hqGpPO1fQvjP6d+wRQ/9b+ap
         oASlbcTxxmLlfiHCWjqzRT3VoDn9WJ1XSaAuUmlKlrzWUMIPElky9UR6GxT1gGo/yYoH
         Ub8238Jk5Ees50FNDU+ysSs9KKCn/rhZpnnHkwd0sjjd9toSqU9ean6Ir+Q7w1362o1F
         ATxUbLKAcxldTBcRVH+xCCm85yR8PcFS2xi35bEzh5BcD9YK8fL50oV57MX2TL/iSPFf
         znBhtdpxplh94wierwSvvuw4/4AFwBgJ7GiQRWX9qNFBiOm451rhdz1f7zWdg/vSwn/0
         4/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3yRBimETvMKoEZ9GRMhY+DUHxkl2xKneFEksDYjOGEs=;
        b=FhkTJaJwpeX36GzWZ4K6T3SypVAYrVI7jLQKF44b7gV+cnrQZ+hPDStlTiSS279YQA
         Za7qSl7Oll/fz8M3AzV9VKyy+jVUQC+4RTMKQEaryPHSQcuCnFVQYtM5JT/a92JkTbbt
         rJJT/6vjVcwT9SYaAV7vNMjFjUlAF4S0+dVtsMciiLEF27Ef0KwoFeivaJXhoncvaBB5
         n+YAxc7l8Xe4M58HXY5axMbjcp+ozxgciHkcz2Zw8Mr6A/ND9aauzf9E+gr9iFp3pwbM
         wg/cDUXp0X9hh/ujU8ZzFK6fs2BETKJXIuQeSaZkhwyLlWxS55h1Rpb2R9grtV9BzfYw
         qnAQ==
X-Gm-Message-State: AOAM531DqM+auQ/h5PeYLJDSUwIf6v8ujX0VrTPxF/D5fOaHm+oVi1Yn
        STX5857I3rVHrtbMKXXK/qP98w8k0Uw=
X-Google-Smtp-Source: ABdhPJxAmVNgxQnnIGSM7P7JO8VCP3BtgPgJJDwDUM5dX1WEDA1NUlhjkzv2bnng9frXlk453M+VGA==
X-Received: by 2002:adf:f6d1:0:b0:20a:d5ca:6dc0 with SMTP id y17-20020adff6d1000000b0020ad5ca6dc0mr311135wrp.292.1651791852726;
        Thu, 05 May 2022 16:04:12 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id o20-20020a05600c339400b003942a244f33sm6782130wmp.12.2022.05.05.16.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 16:04:12 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        andriy.shevchenko@linux.intel.com, hverkuil-cisco@xs4all.nl
Subject: [PATCH v4 01/15] media: uapi: Add IPU3 packed Y10 format
Date:   Fri,  6 May 2022 00:03:48 +0100
Message-Id: <20220505230402.449643-2-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220505230402.449643-1-djrscally@gmail.com>
References: <20220505230402.449643-1-djrscally@gmail.com>
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

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v4:

	- None

Changes in v3:

     - None

Changes in v2:

	- Switched away from using the fourcc in the explanatory note for
	pixfmt-yuv-luma.rst (Nicolas)

 .../userspace-api/media/v4l/pixfmt-yuv-luma.rst    | 14 +++++++++++++-
 drivers/media/v4l2-core/v4l2-ioctl.c               |  1 +
 include/uapi/linux/videodev2.h                     |  3 ++-
 3 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
index 8ebd58c3588f..6a387f9df3ba 100644
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
index 642cb90f457c..89691bbb372d 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1265,6 +1265,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_Y16_BE:	descr = "16-bit Greyscale BE"; break;
 	case V4L2_PIX_FMT_Y10BPACK:	descr = "10-bit Greyscale (Packed)"; break;
 	case V4L2_PIX_FMT_Y10P:		descr = "10-bit Greyscale (MIPI Packed)"; break;
+	case V4L2_PIX_FMT_IPU3_Y10:	descr = "10-bit greyscale (IPU3 Packed)"; break;
 	case V4L2_PIX_FMT_Y8I:		descr = "Interleaved 8-bit Greyscale"; break;
 	case V4L2_PIX_FMT_Y12I:		descr = "Interleaved 12-bit Greyscale"; break;
 	case V4L2_PIX_FMT_Z16:		descr = "16-bit Depth"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index df8b9c486ba1..34329f4655e0 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -569,6 +569,7 @@ struct v4l2_pix_format {
 /* Grey bit-packed formats */
 #define V4L2_PIX_FMT_Y10BPACK    v4l2_fourcc('Y', '1', '0', 'B') /* 10  Greyscale bit-packed */
 #define V4L2_PIX_FMT_Y10P    v4l2_fourcc('Y', '1', '0', 'P') /* 10  Greyscale, MIPI RAW10 packed */
+#define V4L2_PIX_FMT_IPU3_Y10		v4l2_fourcc('i', 'p', '3', 'y') /* IPU3 packed 10-bit greyscale */
 
 /* Palette formats */
 #define V4L2_PIX_FMT_PAL8    v4l2_fourcc('P', 'A', 'L', '8') /*  8  8-bit palette */
@@ -745,7 +746,7 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_CNF4     v4l2_fourcc('C', 'N', 'F', '4') /* Intel 4-bit packed depth confidence information */
 #define V4L2_PIX_FMT_HI240    v4l2_fourcc('H', 'I', '2', '4') /* BTTV 8-bit dithered RGB */
 
-/* 10bit raw bayer packed, 32 bytes for every 25 pixels, last LSB 6 bits unused */
+/* 10bit raw packed, 32 bytes for every 25 pixels, last LSB 6 bits unused */
 #define V4L2_PIX_FMT_IPU3_SBGGR10	v4l2_fourcc('i', 'p', '3', 'b') /* IPU3 packed 10-bit BGGR bayer */
 #define V4L2_PIX_FMT_IPU3_SGBRG10	v4l2_fourcc('i', 'p', '3', 'g') /* IPU3 packed 10-bit GBRG bayer */
 #define V4L2_PIX_FMT_IPU3_SGRBG10	v4l2_fourcc('i', 'p', '3', 'G') /* IPU3 packed 10-bit GRBG bayer */
-- 
2.25.1

