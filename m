Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9AA274CBF93
	for <lists+linux-media@lfdr.de>; Thu,  3 Mar 2022 15:10:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233856AbiCCOLU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Mar 2022 09:11:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233884AbiCCOLT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Mar 2022 09:11:19 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5560418CC0E
        for <linux-media@vger.kernel.org>; Thu,  3 Mar 2022 06:10:33 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id c192so3214330wma.4
        for <linux-media@vger.kernel.org>; Thu, 03 Mar 2022 06:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=10/BW769IKERdqqtrhTGD3vXngz+v3aiZ40HiXRcKVk=;
        b=zgSy3UhrY9kTliukEjxf6hqGXf5K4ssuK8ErQlg2hdhDWkpsVxO40UhjT0OKfIe+CL
         /SKnL7iWsr4ekWlSCWQmrwlhS8TNwpNJ86v/quQb9vOaCXrStqsvn4vb5arO1cdMkv6F
         7rx7T2Y9PtdSBXrxCRNnnqzXs2BA+Ru4rs1Mxz3pHjkEwEzBI7TAHBcL1LmNJKMkTc7K
         Z1k5Vdr0b3cyqcva+ffDM7wWwX/bXe4Ht4h899iTLbumx9ExGy/4XwMKDZYegxl6zABc
         oBIBVar9dEpkFoGVpblw557NiKQCQ5w3wrLIxLNR+2IovVHV83kMFHWrCHl7+HKB+9Q/
         a+ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=10/BW769IKERdqqtrhTGD3vXngz+v3aiZ40HiXRcKVk=;
        b=F+GlP4n+0Gjo0l0xMQPRdOtR+86DeFDJ+TWrSLn1cpdjuA6iQq++xt42u/i0Pn4M17
         cqxwCeZf+OaAoCJUa+VkEHzaeZEr1luJDUcJAhv8FJ5qKeaKIof3FJJp5WKNQ9yTrU9e
         mZLbGT1k0XTM+H9m70uKMxDcVqKWSefH0wxWV1VToXe9pJab2mmGo0xZR3Py0zUCYPSg
         ytS6ZZkD6dUG6O6j04kbCWKuO4sX6vGM6TJx8htmFFbirrJaECusXyfUq+Sdhl1jpaeg
         31/0HEoSrea1WfyoxSlNEoZxTZpMPXc80YK6cBaNAnM9Kh9XC+wY4z8ATUCoKGz+ad6Z
         tpbg==
X-Gm-Message-State: AOAM532d4+ZmkVEHe6SLSdtCnszrq6B1N9bMU50cXtHtyfpwv1BP/ftb
        nUaM0OzBf9MpDplLGrxG6IyQXs1wfC6ZVPHP
X-Google-Smtp-Source: ABdhPJx+fKccJbOMSAL/GbENWYjfCct8WD8RPWPnGw++An4gMUpYy9mP+QLaNlX2tSSwJQT5o+KXkw==
X-Received: by 2002:a1c:7410:0:b0:381:22f8:fa81 with SMTP id p16-20020a1c7410000000b0038122f8fa81mr4012544wmc.165.1646316631592;
        Thu, 03 Mar 2022 06:10:31 -0800 (PST)
Received: from localhost.localdomain (hst-221-13.medicom.bg. [84.238.221.13])
        by smtp.gmail.com with ESMTPSA id ba2-20020a0560001c0200b001f0653f1097sm194312wrb.69.2022.03.03.06.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 06:10:31 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [RFC/WIP v2 1/6] media: Add HEIF HEVC compressed pixel format
Date:   Thu,  3 Mar 2022 16:10:05 +0200
Message-Id: <20220303141010.573408-2-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303141010.573408-1-stanimir.varbanov@linaro.org>
References: <20220303141010.573408-1-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add HEIF (High Efficiency Image File Format ) HEVC pixel format. This an
image container which use HEVC as a codec.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 .../userspace-api/media/v4l/pixfmt-compressed.rst    | 12 ++++++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c                 |  1 +
 include/uapi/linux/videodev2.h                       |  1 +
 3 files changed, 14 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
index 967fc803ef94..df1ada1d45c7 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
@@ -197,6 +197,18 @@ Compressed Formats
 	If :ref:`VIDIOC_ENUM_FMT` reports ``V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM``
 	then the decoder has no	requirements since it can parse all the
 	information from the raw bytestream.
+    * .. _V4L2-PIX-FMT-HEIF-HEVC:
+
+      - ``V4L2_PIX_FMT_HEIF_HEVC``
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
index 642cb90f457c..f00e463e456f 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1439,6 +1439,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 		case V4L2_PIX_FMT_SE401:	descr = "GSPCA SE401"; break;
 		case V4L2_PIX_FMT_S5C_UYVY_JPG:	descr = "S5C73MX interleaved UYVY/JPEG"; break;
 		case V4L2_PIX_FMT_MT21C:	descr = "Mediatek Compressed Format"; break;
+		case V4L2_PIX_FMT_HEIF_HEVC:	descr = "HEIF HEVC Image Format"; break;
 		default:
 			if (fmt->description[0])
 				return;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index df8b9c486ba1..ed4c916d3075 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -708,6 +708,7 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_FWHT     v4l2_fourcc('F', 'W', 'H', 'T') /* Fast Walsh Hadamard Transform (vicodec) */
 #define V4L2_PIX_FMT_FWHT_STATELESS     v4l2_fourcc('S', 'F', 'W', 'H') /* Stateless FWHT (vicodec) */
 #define V4L2_PIX_FMT_H264_SLICE v4l2_fourcc('S', '2', '6', '4') /* H264 parsed slices */
+#define V4L2_PIX_FMT_HEIF_HEVC	v4l2_fourcc('H', 'E', 'I', 'C') /* HEIF HEVC image format */
 
 /*  Vendor-specific formats   */
 #define V4L2_PIX_FMT_CPIA1    v4l2_fourcc('C', 'P', 'I', 'A') /* cpia1 YUV */
-- 
2.25.1

