Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40F694B7AFD
	for <lists+linux-media@lfdr.de>; Wed, 16 Feb 2022 00:07:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240786AbiBOXID (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Feb 2022 18:08:03 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:43902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240552AbiBOXIC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Feb 2022 18:08:02 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 095C063A6
        for <linux-media@vger.kernel.org>; Tue, 15 Feb 2022 15:07:51 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id w11so522700wra.4
        for <linux-media@vger.kernel.org>; Tue, 15 Feb 2022 15:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SMY5mZRDZ5zSeVhczFX3GzI0HUddpNaRbL4SPzwPbzs=;
        b=P65b+cGa5QtW+XotpjFNzSYoINLupFXuF5daKH9OVJr29xdmItyabRxnPMAkQ1mK7/
         YqCFkMxmkp/bTjXvwY6fJbkb1Utz6tYMrCl/KeDIbmVq4iS5NqG1DggQtHDZbHI5Kk9j
         GUwTUicAbgCPFqDXLgysHZNWmrJAu7u22iEeRcsOilBCs1fo26ymNPfa0gtF2TNiNvM2
         MvasjZYR4/H1SrR49/WOBh6/A96lHLTYlkX6TMXQySRiC47XguV9fZsfoGD9iW7NcQAz
         dIboPE5QC2oPwRA/pTFxw9eRd3ZMkWWFkd6dTkTJvc1clHH3hUhh9nRZi2gOsKuHiQMg
         qlBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SMY5mZRDZ5zSeVhczFX3GzI0HUddpNaRbL4SPzwPbzs=;
        b=gRGq7N3ArBZDQjt2eV6G8minRml2B6szJGk/RkvFTLvXE68ZVU0ipvTQ6gNhAbF6MF
         nZBsBMtFOrRChksOq0m9t/t0dbL0t04oEe/Oc6iVhPEXp3cT/sbl7nM2OnJAZirvezhb
         CAg7FlCilb1IkwuFE6xY2qpJibfct7fynHmD0YmWwSfSxbw9HrcDTeAatuIW9IxPzNJ2
         mhLTm4IpGd2WJQxgGStcVERWlFxJDFDbnDz4Mb0OyU6HwetaEljPV/hO0iavHcNRdsQx
         SAD00sedH4HYn6JAthG/GJQ1wycm3l/DAAhcf/ZXFeVentSo+cY6vbakoqGhZikNig25
         VbbQ==
X-Gm-Message-State: AOAM530DSC6PM4eEgFQ/s6hfzq3xvlAwJCrDAB6WLjGtVKZyGpZLaA+s
        7KiPYYJ2mAbPiQ0VCKX3VeToVaa+qNY1bA==
X-Google-Smtp-Source: ABdhPJxf4SxJE4nJsLRuPwdOiUCfv+xQRh8N2igutokd9L0OUiToKzn6frlSWKDsNItIwiPcnzA4yQ==
X-Received: by 2002:a5d:6244:0:b0:1e7:686d:41e7 with SMTP id m4-20020a5d6244000000b001e7686d41e7mr103495wrv.491.1644966469669;
        Tue, 15 Feb 2022 15:07:49 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id w18sm16956590wrl.62.2022.02.15.15.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 15:07:49 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        andriy.shevchenko@linux.intel.com, hverkuil-cisco@xs4all.nl
Subject: [PATCH 01/10] media: uapi: Add IPU3 packed Y10 format
Date:   Tue, 15 Feb 2022 23:07:28 +0000
Message-Id: <20220215230737.1870630-2-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220215230737.1870630-1-djrscally@gmail.com>
References: <20220215230737.1870630-1-djrscally@gmail.com>
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
device - this packs the data into 32 bytes per 25 pixels. Detail that
format.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
 .../userspace-api/media/v4l/pixfmt-yuv-luma.rst    | 14 +++++++++++++-
 drivers/media/v4l2-core/v4l2-ioctl.c               |  1 +
 include/uapi/linux/videodev2.h                     |  1 +
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
index 8ebd58c3588f..5465ce3bb533 100644
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
+    1023. For the ip3y format 25 pixels are packed into 32 bytes, which leaves
+    the 6 most significant bits of the last byte padded with 0.
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
index df8b9c486ba1..b378c7e37eac 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -569,6 +569,7 @@ struct v4l2_pix_format {
 /* Grey bit-packed formats */
 #define V4L2_PIX_FMT_Y10BPACK    v4l2_fourcc('Y', '1', '0', 'B') /* 10  Greyscale bit-packed */
 #define V4L2_PIX_FMT_Y10P    v4l2_fourcc('Y', '1', '0', 'P') /* 10  Greyscale, MIPI RAW10 packed */
+#define V4L2_PIX_FMT_IPU3_Y10		v4l2_fourcc('i', 'p', '3', 'y') /* IPU3 packed 10-bit greyscale */
 
 /* Palette formats */
 #define V4L2_PIX_FMT_PAL8    v4l2_fourcc('P', 'A', 'L', '8') /*  8  8-bit palette */
-- 
2.25.1

