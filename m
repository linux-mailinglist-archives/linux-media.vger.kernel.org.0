Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58B3651B1EC
	for <lists+linux-media@lfdr.de>; Thu,  5 May 2022 00:31:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378997AbiEDWe2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 May 2022 18:34:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378995AbiEDWeU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 May 2022 18:34:20 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37DD42B257
        for <linux-media@vger.kernel.org>; Wed,  4 May 2022 15:30:43 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id b19so3785968wrh.11
        for <linux-media@vger.kernel.org>; Wed, 04 May 2022 15:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eoK5uuV8CaIjwIm2BeR5bISh0jgDlo6Je4xDmxLzJLE=;
        b=M3k2LVz+vEB3MxPkRSk/g+Kg6eqoDAYdi1u/botHo7/HWF4tbVACj4gUJMChN9RAOo
         DjddXlPil+3evskJPoBG6TN1IpMDgbd/I/poTxnBGTj0RURHoeJ1rZdjAYY+o3VSraLn
         0hZ5FaYoDzM4Sko3eBp8kcm8LldamzXPjGEodW212Bs3MsJRoaGO9YI+Hfzpwus7yyOV
         w+/vINMaRXfPj5TaboZQPFPmsgw0xsYb07qx6V6klB4yeRa8mdCruixQ0W4OVNNIVxlf
         lmu01/O4QM8L6EicjGCUAKzqXcXVUu0F0Rp2IW+EVm+mWRkzABfy4bV4FV47zwiBvP0W
         b3yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eoK5uuV8CaIjwIm2BeR5bISh0jgDlo6Je4xDmxLzJLE=;
        b=MDOMLETSrNiN806d8sVrXPyRLUk38bwSRfWTPxCnSZTcW2fsbuyjnDrXHhCgwsnZ4K
         9d3294RVHbz6f+Ccn63fgRaZ4Ui2qprbv++dySvW40JboYao4+hdvDrwlwEbfvB3sxjM
         yoM26agWZ4LMnqXq5Ur0l1pt709fuxErHpfQWeFxUwC74bShXxbA8BXCVy7r6qBuV8t+
         IQK4pYQsHvzXhPJEw8mQC9kl/KI6Sl4TeP72D1QP7kXi4HRH0Ws9ailvmzR/kMvoQzD1
         mQTfeLOkbeFImaQUSniqfyUlADlTr6Ku58xVTG95oB+3gVfP6VBo8BBp/s+lkZXC7yOY
         HQQw==
X-Gm-Message-State: AOAM533sbKB7W/2AnxU1vzSvB0JBE+ilQSH7/caVGWBuL/X9wPrtN4/D
        VyL5D0k6fY8hzL7TD0M+DCzsmz0Ms6E=
X-Google-Smtp-Source: ABdhPJyM5tbYRLJeNhW4em9RlG9A0nDtxEI8+OX04ZIR0MsVOT3wTBcDQwnIcj+TvxzA8C9mOWQeRw==
X-Received: by 2002:a5d:68c6:0:b0:20a:d654:6cae with SMTP id p6-20020a5d68c6000000b0020ad6546caemr17885279wrw.564.1651703441802;
        Wed, 04 May 2022 15:30:41 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id h29-20020adfaa9d000000b0020c5253d913sm12501442wrc.95.2022.05.04.15.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 15:30:41 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        andriy.shevchenko@linux.intel.com, hverkuil-cisco@xs4all.nl
Subject: [PATCH v3 01/15] media: uapi: Add IPU3 packed Y10 format
Date:   Wed,  4 May 2022 23:30:13 +0100
Message-Id: <20220504223027.3480287-2-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504223027.3480287-1-djrscally@gmail.com>
References: <20220504223027.3480287-1-djrscally@gmail.com>
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

