Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 274AA1EE600
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2020 15:54:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728950AbgFDNxw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jun 2020 09:53:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728854AbgFDNxc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Jun 2020 09:53:32 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCD43C08C5C1
        for <linux-media@vger.kernel.org>; Thu,  4 Jun 2020 06:53:30 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id j10so6188087wrw.8
        for <linux-media@vger.kernel.org>; Thu, 04 Jun 2020 06:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Fs26md6QbBGAquJwpk095GGSGBX/m/yeaPP+lwPf4x8=;
        b=bTpVL1yfwhHL564oV9oXTuVi5bwYohXzTpcKvqoytnCDbbMUIAeZsrdq92E0qwRRSg
         UfSDj3lzKt+diIWgtJqYc2UKsOBY/ArWO+KMdr64+3lR8Puu98hTn/h1lbs8pZD3z0a5
         6ShQ9QS2p4Zr3km9dLUyszhnICzksvQjbCrHKAfOpH8DBiP7RsMzrXzBw1bJT3KiwTm3
         9xZUp0uS871oMpIXbSrQ/0KnqXJ/ZEg8yRFTESmOv1jd2O4crFzKduVGLDXRc8vcZgCD
         uUtou4MeMzMCIRxtSYLva3dOgaRLMh0YBcvkdPYbchEEWfISZiUqH0diRmCqtZ42LoKm
         G+jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Fs26md6QbBGAquJwpk095GGSGBX/m/yeaPP+lwPf4x8=;
        b=QcZf1TFqSJsPZYTxWZgeGsWy4lFzHvu9jBHZQND6Kr759KGRm7fbXqnSDOApDH8Ary
         osQkwFBHpcXBWbZAfYUX1bIuBbGDv54gs6wKueBJUBGJTOXP1DAjwPdwha0cWSaOzREU
         j6tYYK4/xkNEEUYCnY/pD04dKK3+Bk5FgE+Vqd25CpD39otE8Ne8LMpEjihxeLJLH1XG
         KKoZWbOXS8UwPgsqnOGb33mXoycotzJxPPbQ7CI6GGYlyIFq3mn5+Uhk71vVa//O1QK8
         Os4XzCVdpV/FJAXRJhdWpmPNXfGi+FPA3FYPQgKy+cHkOTJjkaWt2SKGM0eEsWKK1uU1
         mPIA==
X-Gm-Message-State: AOAM530eXRv/AvlQQpKrN4VikVb69+tOdg1AhGTw8K5AqPohxwjKZbjq
        7bvTiErKDM+K3NF2XQRANkp1TxKsk15KAg==
X-Google-Smtp-Source: ABdhPJwqpOH22rRrTWj54Pu3JjP2wensOE1kRwQ6BI5hptsY6t27TXlnHJBKfdM8GJs/L3uqecz/Pw==
X-Received: by 2002:a5d:4dc9:: with SMTP id f9mr4441675wru.407.1591278809353;
        Thu, 04 Jun 2020 06:53:29 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:22:5867:d2c6:75f4])
        by smtp.gmail.com with ESMTPSA id i74sm8185599wri.49.2020.06.04.06.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2020 06:53:28 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Maxime Jourdan <mjourdan@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 1/5] media: videodev2: add Compressed Framebuffer pixel formats
Date:   Thu,  4 Jun 2020 15:53:13 +0200
Message-Id: <20200604135317.9235-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200604135317.9235-1-narmstrong@baylibre.com>
References: <20200604135317.9235-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Maxime Jourdan <mjourdan@baylibre.com>

Add two generic Compressed Framebuffer pixel formats to be used
with a modifier when imported back in another subsystem like DRM/KMS.

These pixel formats represents generic 8bits and 10bits compressed buffers
with a vendor specific layout.

These are aligned with the DRM_FORMAT_YUV420_8BIT and DRM_FORMAT_YUV420_10BIT
used to describe the underlying compressed buffers used for ARM Framebuffer
Compression. In the Amlogic case, the compression is different but the
underlying buffer components is the same.

Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 2 ++
 include/uapi/linux/videodev2.h       | 9 +++++++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 2322f08a98be..8f14adfd5bc5 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1447,6 +1447,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 		case V4L2_PIX_FMT_S5C_UYVY_JPG:	descr = "S5C73MX interleaved UYVY/JPEG"; break;
 		case V4L2_PIX_FMT_MT21C:	descr = "Mediatek Compressed Format"; break;
 		case V4L2_PIX_FMT_SUNXI_TILED_NV12: descr = "Sunxi Tiled NV12 Format"; break;
+		case V4L2_PIX_FMT_YUV420_8BIT:	descr = "Compressed YUV 4:2:0 8-bit Format"; break;
+		case V4L2_PIX_FMT_YUV420_10BIT:	descr = "Compressed YUV 4:2:0 10-bit Format"; break;
 		default:
 			if (fmt->description[0])
 				return;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index c3a1cf1c507f..90b9949acb8a 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -705,6 +705,15 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_FWHT     v4l2_fourcc('F', 'W', 'H', 'T') /* Fast Walsh Hadamard Transform (vicodec) */
 #define V4L2_PIX_FMT_FWHT_STATELESS     v4l2_fourcc('S', 'F', 'W', 'H') /* Stateless FWHT (vicodec) */
 
+/*
+ * Compressed Luminance+Chrominance meta-formats
+ * In these formats, the component ordering is specified (Y, followed by U
+ * then V), but the exact Linear layout is undefined.
+ * These formats can only be used with a non-Linear modifier.
+ */
+#define V4L2_PIX_FMT_YUV420_8BIT	v4l2_fourcc('Y', 'U', '0', '8') /* 1-plane YUV 4:2:0 8-bit */
+#define V4L2_PIX_FMT_YUV420_10BIT	v4l2_fourcc('Y', 'U', '1', '0') /* 1-plane YUV 4:2:0 10-bit */
+
 /*  Vendor-specific formats   */
 #define V4L2_PIX_FMT_CPIA1    v4l2_fourcc('C', 'P', 'I', 'A') /* cpia1 YUV */
 #define V4L2_PIX_FMT_WNVA     v4l2_fourcc('W', 'N', 'V', 'A') /* Winnov hw compress */
-- 
2.22.0

