Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7AEB6632F53
	for <lists+linux-media@lfdr.de>; Mon, 21 Nov 2022 22:50:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232058AbiKUVu2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Nov 2022 16:50:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231916AbiKUVuD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Nov 2022 16:50:03 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D304DD92D1;
        Mon, 21 Nov 2022 13:50:00 -0800 (PST)
Received: from umang.jainideasonboard.com (unknown [103.86.18.138])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A9B3A74C;
        Mon, 21 Nov 2022 22:49:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669067399;
        bh=I5RVD3m86y+uw9pSPfzqUfe3r8mMXWOmrFAqF8rDzgk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ghd3OeOuFHsFIV9MRq/3+sr9UfDyBkt0bz0MN7yC/srcYXTwv/qRLB2IOwnEfoTn5
         W4xSckqlVDh82UV1BQEwFhq5NWZYIHf1+OM7dOx1FZGRytYrLxNpGp057eeIkvTvb8
         k/FYttzE6c6Nc7tvzCJ1YTyxPMuMxtdluT7zWvDE=
From:   Umang Jain <umang.jain@ideasonboard.com>
To:     linux-media@vger.kernel.org, kernel-list@raspberrypi.com,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-staging@lists.linux.dev,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Naushir Patuck <naush@raspberrypi.com>,
        David Plowman <david.plowman@raspberrypi.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH 10/14] WIP: vc04_services: bcm2835-isp: Allow formats with different colour spaces
Date:   Tue, 22 Nov 2022 03:17:18 +0530
Message-Id: <20221121214722.22563-11-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221121214722.22563-1-umang.jain@ideasonboard.com>
References: <20221121214722.22563-1-umang.jain@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: David Plowman <david.plowman@raspberrypi.com>

Each supported format now includes a mask showing the allowed colour
spaces, as well as a default colour space for when one was not
specified.

Additionally we translate the colour space to mmal format and pass it
over to the VideoCore.

Signed-off-by: David Plowman <david.plowman@raspberrypi.com>
Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 .../bcm2835-isp/bcm2835-isp-fmts.h            | 180 ++++++++++++------
 .../bcm2835-isp/bcm2835-v4l2-isp.c            |  68 ++++++-
 2 files changed, 192 insertions(+), 56 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-isp/bcm2835-isp-fmts.h b/drivers/staging/vc04_services/bcm2835-isp/bcm2835-isp-fmts.h
index 65913a4ff203..a545dbf2b5dd 100644
--- a/drivers/staging/vc04_services/bcm2835-isp/bcm2835-isp-fmts.h
+++ b/drivers/staging/vc04_services/bcm2835-isp/bcm2835-isp-fmts.h
@@ -20,10 +20,29 @@ struct bcm2835_isp_fmt {
 	int bytesperline_align;
 	u32 mmal_fmt;
 	int size_multiplier_x2;
-	enum v4l2_colorspace colorspace;
+	u32 colorspace_mask;
+	enum v4l2_colorspace colorspace_default;
 	unsigned int step_size;
 };
 
+#define V4L2_COLORSPACE_MASK(colorspace) BIT(colorspace)
+
+#define V4L2_COLORSPACE_MASK_JPEG V4L2_COLORSPACE_MASK(V4L2_COLORSPACE_JPEG)
+#define V4L2_COLORSPACE_MASK_SMPTE170M V4L2_COLORSPACE_MASK(V4L2_COLORSPACE_SMPTE170M)
+#define V4L2_COLORSPACE_MASK_REC709 V4L2_COLORSPACE_MASK(V4L2_COLORSPACE_REC709)
+#define V4L2_COLORSPACE_MASK_SRGB V4L2_COLORSPACE_MASK(V4L2_COLORSPACE_SRGB)
+#define V4L2_COLORSPACE_MASK_RAW V4L2_COLORSPACE_MASK(V4L2_COLORSPACE_RAW)
+
+/*
+ * The colour spaces we support for YUV outputs. SRGB features here because,
+ * once you assign the default transfer func and so on, it and JPEG effectively
+ * mean the same.
+ */
+#define V4L2_COLORSPACE_MASK_YUV (V4L2_COLORSPACE_MASK_JPEG | \
+				  V4L2_COLORSPACE_MASK_SRGB | \
+				  V4L2_COLORSPACE_MASK_SMPTE170M | \
+				  V4L2_COLORSPACE_MASK_REC709)
+
 static const struct bcm2835_isp_fmt supported_formats[] = {
 	{
 		/* YUV formats */
@@ -32,7 +51,8 @@ static const struct bcm2835_isp_fmt supported_formats[] = {
 		.bytesperline_align = 64,
 		.mmal_fmt	    = MMAL_ENCODING_I420,
 		.size_multiplier_x2 = 3,
-		.colorspace	    = V4L2_COLORSPACE_SMPTE170M,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_YUV,
+		.colorspace_default = V4L2_COLORSPACE_JPEG,
 		.step_size	    = 2,
 	}, {
 		.fourcc		    = V4L2_PIX_FMT_YVU420,
@@ -40,7 +60,8 @@ static const struct bcm2835_isp_fmt supported_formats[] = {
 		.bytesperline_align = 64,
 		.mmal_fmt	    = MMAL_ENCODING_YV12,
 		.size_multiplier_x2 = 3,
-		.colorspace	    = V4L2_COLORSPACE_SMPTE170M,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_YUV,
+		.colorspace_default = V4L2_COLORSPACE_SMPTE170M,
 		.step_size	    = 2,
 	}, {
 		.fourcc		    = V4L2_PIX_FMT_NV12,
@@ -48,7 +69,8 @@ static const struct bcm2835_isp_fmt supported_formats[] = {
 		.bytesperline_align = 32,
 		.mmal_fmt	    = MMAL_ENCODING_NV12,
 		.size_multiplier_x2 = 3,
-		.colorspace	    = V4L2_COLORSPACE_SMPTE170M,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_YUV,
+		.colorspace_default = V4L2_COLORSPACE_SMPTE170M,
 		.step_size	    = 2,
 	}, {
 		.fourcc		    = V4L2_PIX_FMT_NV21,
@@ -56,7 +78,8 @@ static const struct bcm2835_isp_fmt supported_formats[] = {
 		.bytesperline_align = 32,
 		.mmal_fmt	    = MMAL_ENCODING_NV21,
 		.size_multiplier_x2 = 3,
-		.colorspace	    = V4L2_COLORSPACE_SMPTE170M,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_YUV,
+		.colorspace_default = V4L2_COLORSPACE_SMPTE170M,
 		.step_size	    = 2,
 	}, {
 		.fourcc		    = V4L2_PIX_FMT_YUYV,
@@ -64,7 +87,8 @@ static const struct bcm2835_isp_fmt supported_formats[] = {
 		.bytesperline_align = 64,
 		.mmal_fmt	    = MMAL_ENCODING_YUYV,
 		.size_multiplier_x2 = 2,
-		.colorspace	    = V4L2_COLORSPACE_SMPTE170M,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_YUV,
+		.colorspace_default = V4L2_COLORSPACE_SMPTE170M,
 		.step_size	    = 2,
 	}, {
 		.fourcc		    = V4L2_PIX_FMT_UYVY,
@@ -72,7 +96,8 @@ static const struct bcm2835_isp_fmt supported_formats[] = {
 		.bytesperline_align = 64,
 		.mmal_fmt	    = MMAL_ENCODING_UYVY,
 		.size_multiplier_x2 = 2,
-		.colorspace	    = V4L2_COLORSPACE_SMPTE170M,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_YUV,
+		.colorspace_default = V4L2_COLORSPACE_SMPTE170M,
 		.step_size	    = 2,
 	}, {
 		.fourcc		    = V4L2_PIX_FMT_YVYU,
@@ -80,7 +105,8 @@ static const struct bcm2835_isp_fmt supported_formats[] = {
 		.bytesperline_align = 64,
 		.mmal_fmt	    = MMAL_ENCODING_YVYU,
 		.size_multiplier_x2 = 2,
-		.colorspace	    = V4L2_COLORSPACE_SMPTE170M,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_YUV,
+		.colorspace_default = V4L2_COLORSPACE_SMPTE170M,
 		.step_size	    = 2,
 	}, {
 		.fourcc		    = V4L2_PIX_FMT_VYUY,
@@ -88,7 +114,8 @@ static const struct bcm2835_isp_fmt supported_formats[] = {
 		.bytesperline_align = 64,
 		.mmal_fmt	    = MMAL_ENCODING_VYUY,
 		.size_multiplier_x2 = 2,
-		.colorspace	    = V4L2_COLORSPACE_SMPTE170M,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_YUV,
+		.colorspace_default = V4L2_COLORSPACE_SMPTE170M,
 		.step_size	    = 2,
 	}, {
 		/* RGB formats */
@@ -97,7 +124,8 @@ static const struct bcm2835_isp_fmt supported_formats[] = {
 		.bytesperline_align = 32,
 		.mmal_fmt	    = MMAL_ENCODING_RGB24,
 		.size_multiplier_x2 = 2,
-		.colorspace	    = V4L2_COLORSPACE_SRGB,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_SRGB,
+		.colorspace_default = V4L2_COLORSPACE_SRGB,
 		.step_size	    = 1,
 	}, {
 		.fourcc		    = V4L2_PIX_FMT_RGB565,
@@ -105,7 +133,8 @@ static const struct bcm2835_isp_fmt supported_formats[] = {
 		.bytesperline_align = 32,
 		.mmal_fmt	    = MMAL_ENCODING_RGB16,
 		.size_multiplier_x2 = 2,
-		.colorspace	    = V4L2_COLORSPACE_SRGB,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_SRGB,
+		.colorspace_default = V4L2_COLORSPACE_SRGB,
 		.step_size	    = 1,
 	}, {
 		.fourcc		    = V4L2_PIX_FMT_BGR24,
@@ -113,7 +142,8 @@ static const struct bcm2835_isp_fmt supported_formats[] = {
 		.bytesperline_align = 32,
 		.mmal_fmt	    = MMAL_ENCODING_BGR24,
 		.size_multiplier_x2 = 2,
-		.colorspace	    = V4L2_COLORSPACE_SRGB,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_SRGB,
+		.colorspace_default = V4L2_COLORSPACE_SRGB,
 		.step_size	    = 1,
 	}, {
 		.fourcc		    = V4L2_PIX_FMT_XBGR32,
@@ -121,7 +151,8 @@ static const struct bcm2835_isp_fmt supported_formats[] = {
 		.bytesperline_align = 64,
 		.mmal_fmt	    = MMAL_ENCODING_BGRA,
 		.size_multiplier_x2 = 2,
-		.colorspace	    = V4L2_COLORSPACE_SRGB,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_SRGB,
+		.colorspace_default = V4L2_COLORSPACE_SRGB,
 		.step_size	    = 1,
 	}, {
 		.fourcc		    = V4L2_PIX_FMT_RGBX32,
@@ -129,7 +160,8 @@ static const struct bcm2835_isp_fmt supported_formats[] = {
 		.bytesperline_align = 64,
 		.mmal_fmt	    = MMAL_ENCODING_RGBA,
 		.size_multiplier_x2 = 2,
-		.colorspace	    = V4L2_COLORSPACE_SRGB,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_SRGB,
+		.colorspace_default = V4L2_COLORSPACE_SRGB,
 		.step_size	    = 1,
 	}, {
 		/* Bayer formats */
@@ -139,7 +171,8 @@ static const struct bcm2835_isp_fmt supported_formats[] = {
 		.bytesperline_align = 32,
 		.mmal_fmt	    = MMAL_ENCODING_BAYER_SRGGB8,
 		.size_multiplier_x2 = 2,
-		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
 		.step_size	    = 2,
 	}, {
 		.fourcc		    = V4L2_PIX_FMT_SBGGR8,
@@ -147,7 +180,8 @@ static const struct bcm2835_isp_fmt supported_formats[] = {
 		.bytesperline_align = 32,
 		.mmal_fmt	    = MMAL_ENCODING_BAYER_SBGGR8,
 		.size_multiplier_x2 = 2,
-		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
 		.step_size	    = 2,
 	}, {
 		.fourcc		    = V4L2_PIX_FMT_SGRBG8,
@@ -155,7 +189,8 @@ static const struct bcm2835_isp_fmt supported_formats[] = {
 		.bytesperline_align = 32,
 		.mmal_fmt	    = MMAL_ENCODING_BAYER_SGRBG8,
 		.size_multiplier_x2 = 2,
-		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
 		.step_size	    = 2,
 	}, {
 		.fourcc		    = V4L2_PIX_FMT_SGBRG8,
@@ -163,7 +198,8 @@ static const struct bcm2835_isp_fmt supported_formats[] = {
 		.bytesperline_align = 32,
 		.mmal_fmt	    = MMAL_ENCODING_BAYER_SGBRG8,
 		.size_multiplier_x2 = 2,
-		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
 		.step_size	    = 2,
 	}, {
 		/* 10 bit */
@@ -172,7 +208,8 @@ static const struct bcm2835_isp_fmt supported_formats[] = {
 		.bytesperline_align = 32,
 		.mmal_fmt	    = MMAL_ENCODING_BAYER_SRGGB10P,
 		.size_multiplier_x2 = 2,
-		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
 		.step_size	    = 2,
 	}, {
 		.fourcc		    = V4L2_PIX_FMT_SBGGR10P,
@@ -180,7 +217,8 @@ static const struct bcm2835_isp_fmt supported_formats[] = {
 		.bytesperline_align = 32,
 		.mmal_fmt	    = MMAL_ENCODING_BAYER_SBGGR10P,
 		.size_multiplier_x2 = 2,
-		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
 		.step_size	    = 2,
 	}, {
 		.fourcc		    = V4L2_PIX_FMT_SGRBG10P,
@@ -188,7 +226,8 @@ static const struct bcm2835_isp_fmt supported_formats[] = {
 		.bytesperline_align = 32,
 		.mmal_fmt	    = MMAL_ENCODING_BAYER_SGRBG10P,
 		.size_multiplier_x2 = 2,
-		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
 		.step_size	    = 2,
 	}, {
 		.fourcc		    = V4L2_PIX_FMT_SGBRG10P,
@@ -196,7 +235,8 @@ static const struct bcm2835_isp_fmt supported_formats[] = {
 		.bytesperline_align = 32,
 		.mmal_fmt	    = MMAL_ENCODING_BAYER_SGBRG10P,
 		.size_multiplier_x2 = 2,
-		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
 		.step_size	    = 2,
 	}, {
 		/* 12 bit */
@@ -205,7 +245,8 @@ static const struct bcm2835_isp_fmt supported_formats[] = {
 		.bytesperline_align = 32,
 		.mmal_fmt	    = MMAL_ENCODING_BAYER_SRGGB12P,
 		.size_multiplier_x2 = 2,
-		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
 		.step_size	    = 2,
 	}, {
 		.fourcc		    = V4L2_PIX_FMT_SBGGR12P,
@@ -213,7 +254,8 @@ static const struct bcm2835_isp_fmt supported_formats[] = {
 		.bytesperline_align = 32,
 		.mmal_fmt	    = MMAL_ENCODING_BAYER_SBGGR12P,
 		.size_multiplier_x2 = 2,
-		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
 		.step_size	    = 2,
 	}, {
 		.fourcc		    = V4L2_PIX_FMT_SGRBG12P,
@@ -221,7 +263,8 @@ static const struct bcm2835_isp_fmt supported_formats[] = {
 		.bytesperline_align = 32,
 		.mmal_fmt	    = MMAL_ENCODING_BAYER_SGRBG12P,
 		.size_multiplier_x2 = 2,
-		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
 		.step_size	    = 2,
 	}, {
 		.fourcc		    = V4L2_PIX_FMT_SGBRG12P,
@@ -229,7 +272,8 @@ static const struct bcm2835_isp_fmt supported_formats[] = {
 		.bytesperline_align = 32,
 		.mmal_fmt	    = MMAL_ENCODING_BAYER_SGBRG12P,
 		.size_multiplier_x2 = 2,
-		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
 		.step_size	    = 2,
 	}, {
 		/* 14 bit */
@@ -238,7 +282,8 @@ static const struct bcm2835_isp_fmt supported_formats[] = {
 		.bytesperline_align = 32,
 		.mmal_fmt	    = MMAL_ENCODING_BAYER_SRGGB14P,
 		.size_multiplier_x2 = 2,
-		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
 		.step_size	    = 2,
 	}, {
 		.fourcc		    = V4L2_PIX_FMT_SBGGR14P,
@@ -246,7 +291,8 @@ static const struct bcm2835_isp_fmt supported_formats[] = {
 		.bytesperline_align = 32,
 		.mmal_fmt	    = MMAL_ENCODING_BAYER_SBGGR14P,
 		.size_multiplier_x2 = 2,
-		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
 		.step_size	    = 2,
 	}, {
 		.fourcc		    = V4L2_PIX_FMT_SGRBG14P,
@@ -254,7 +300,8 @@ static const struct bcm2835_isp_fmt supported_formats[] = {
 		.bytesperline_align = 32,
 		.mmal_fmt	    = MMAL_ENCODING_BAYER_SGRBG14P,
 		.size_multiplier_x2 = 2,
-		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
 		.step_size	    = 2,
 	}, {
 		.fourcc		    = V4L2_PIX_FMT_SGBRG14P,
@@ -262,7 +309,8 @@ static const struct bcm2835_isp_fmt supported_formats[] = {
 		.bytesperline_align = 32,
 		.mmal_fmt	    = MMAL_ENCODING_BAYER_SGBRG14P,
 		.size_multiplier_x2 = 2,
-		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
 		.step_size	    = 2,
 	}, {
 		/* 16 bit */
@@ -271,7 +319,8 @@ static const struct bcm2835_isp_fmt supported_formats[] = {
 		.bytesperline_align = 32,
 		.mmal_fmt	    = MMAL_ENCODING_BAYER_SRGGB16,
 		.size_multiplier_x2 = 2,
-		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
 		.step_size	    = 2,
 	}, {
 		.fourcc		    = V4L2_PIX_FMT_SBGGR16,
@@ -279,7 +328,8 @@ static const struct bcm2835_isp_fmt supported_formats[] = {
 		.bytesperline_align = 32,
 		.mmal_fmt	    = MMAL_ENCODING_BAYER_SBGGR16,
 		.size_multiplier_x2 = 2,
-		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
 		.step_size	    = 2,
 	}, {
 		.fourcc		    = V4L2_PIX_FMT_SGRBG16,
@@ -287,7 +337,8 @@ static const struct bcm2835_isp_fmt supported_formats[] = {
 		.bytesperline_align = 32,
 		.mmal_fmt	    = MMAL_ENCODING_BAYER_SGRBG16,
 		.size_multiplier_x2 = 2,
-		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
 		.step_size	    = 2,
 	}, {
 		.fourcc		    = V4L2_PIX_FMT_SGBRG16,
@@ -295,7 +346,8 @@ static const struct bcm2835_isp_fmt supported_formats[] = {
 		.bytesperline_align = 32,
 		.mmal_fmt	    = MMAL_ENCODING_BAYER_SGBRG16,
 		.size_multiplier_x2 = 2,
-		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
 		.step_size	    = 2,
 	}, {
 		/* Bayer formats unpacked to 16bpp */
@@ -305,7 +357,8 @@ static const struct bcm2835_isp_fmt supported_formats[] = {
 		.bytesperline_align = 32,
 		.mmal_fmt	    = MMAL_ENCODING_BAYER_SRGGB10,
 		.size_multiplier_x2 = 2,
-		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
 		.step_size	    = 2,
 	}, {
 		.fourcc		    = V4L2_PIX_FMT_SBGGR10,
@@ -313,7 +366,8 @@ static const struct bcm2835_isp_fmt supported_formats[] = {
 		.bytesperline_align = 32,
 		.mmal_fmt	    = MMAL_ENCODING_BAYER_SBGGR10,
 		.size_multiplier_x2 = 2,
-		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
 		.step_size	    = 2,
 	}, {
 		.fourcc		    = V4L2_PIX_FMT_SGRBG10,
@@ -321,7 +375,8 @@ static const struct bcm2835_isp_fmt supported_formats[] = {
 		.bytesperline_align = 32,
 		.mmal_fmt	    = MMAL_ENCODING_BAYER_SGRBG10,
 		.size_multiplier_x2 = 2,
-		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
 		.step_size	    = 2,
 	}, {
 		.fourcc		    = V4L2_PIX_FMT_SGBRG10,
@@ -329,7 +384,8 @@ static const struct bcm2835_isp_fmt supported_formats[] = {
 		.bytesperline_align = 32,
 		.mmal_fmt	    = MMAL_ENCODING_BAYER_SGBRG10,
 		.size_multiplier_x2 = 2,
-		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
 		.step_size	    = 2,
 	}, {
 		/* 12 bit */
@@ -338,7 +394,8 @@ static const struct bcm2835_isp_fmt supported_formats[] = {
 		.bytesperline_align = 32,
 		.mmal_fmt	    = MMAL_ENCODING_BAYER_SRGGB12,
 		.size_multiplier_x2 = 2,
-		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
 		.step_size	    = 2,
 	}, {
 		.fourcc		    = V4L2_PIX_FMT_SBGGR12,
@@ -346,7 +403,8 @@ static const struct bcm2835_isp_fmt supported_formats[] = {
 		.bytesperline_align = 32,
 		.mmal_fmt	    = MMAL_ENCODING_BAYER_SBGGR12,
 		.size_multiplier_x2 = 2,
-		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
 		.step_size	    = 2,
 	}, {
 		.fourcc		    = V4L2_PIX_FMT_SGRBG12,
@@ -354,7 +412,8 @@ static const struct bcm2835_isp_fmt supported_formats[] = {
 		.bytesperline_align = 32,
 		.mmal_fmt	    = MMAL_ENCODING_BAYER_SGRBG12,
 		.size_multiplier_x2 = 2,
-		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
 		.step_size	    = 2,
 	}, {
 		.fourcc		    = V4L2_PIX_FMT_SGBRG12,
@@ -362,7 +421,8 @@ static const struct bcm2835_isp_fmt supported_formats[] = {
 		.bytesperline_align = 32,
 		.mmal_fmt	    = MMAL_ENCODING_BAYER_SGBRG12,
 		.size_multiplier_x2 = 2,
-		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
 		.step_size	    = 2,
 	}, {
 		/* 14 bit */
@@ -371,7 +431,8 @@ static const struct bcm2835_isp_fmt supported_formats[] = {
 		.bytesperline_align = 32,
 		.mmal_fmt	    = MMAL_ENCODING_BAYER_SRGGB14,
 		.size_multiplier_x2 = 2,
-		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
 		.step_size	    = 2,
 	}, {
 		.fourcc		    = V4L2_PIX_FMT_SBGGR14,
@@ -379,7 +440,8 @@ static const struct bcm2835_isp_fmt supported_formats[] = {
 		.bytesperline_align = 32,
 		.mmal_fmt	    = MMAL_ENCODING_BAYER_SBGGR14,
 		.size_multiplier_x2 = 2,
-		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
 		.step_size	    = 2,
 	}, {
 		.fourcc		    = V4L2_PIX_FMT_SGRBG14,
@@ -387,7 +449,8 @@ static const struct bcm2835_isp_fmt supported_formats[] = {
 		.bytesperline_align = 32,
 		.mmal_fmt	    = MMAL_ENCODING_BAYER_SGRBG14,
 		.size_multiplier_x2 = 2,
-		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
 		.step_size	    = 2,
 	}, {
 		.fourcc		    = V4L2_PIX_FMT_SGBRG14,
@@ -395,7 +458,8 @@ static const struct bcm2835_isp_fmt supported_formats[] = {
 		.bytesperline_align = 32,
 		.mmal_fmt	    = MMAL_ENCODING_BAYER_SGBRG14,
 		.size_multiplier_x2 = 2,
-		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
 		.step_size	    = 2,
 	}, {
 		/* Monochrome MIPI formats */
@@ -405,7 +469,8 @@ static const struct bcm2835_isp_fmt supported_formats[] = {
 		.bytesperline_align = 32,
 		.mmal_fmt	    = MMAL_ENCODING_GREY,
 		.size_multiplier_x2 = 2,
-		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
 		.step_size	    = 2,
 	}, {
 		/* 10 bit */
@@ -414,7 +479,8 @@ static const struct bcm2835_isp_fmt supported_formats[] = {
 		.bytesperline_align = 32,
 		.mmal_fmt	    = MMAL_ENCODING_Y10P,
 		.size_multiplier_x2 = 2,
-		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
 		.step_size	    = 2,
 	}, {
 		/* 12 bit */
@@ -423,7 +489,8 @@ static const struct bcm2835_isp_fmt supported_formats[] = {
 		.bytesperline_align = 32,
 		.mmal_fmt	    = MMAL_ENCODING_Y12P,
 		.size_multiplier_x2 = 2,
-		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
 		.step_size	    = 2,
 	}, {
 		/* 14 bit */
@@ -432,7 +499,8 @@ static const struct bcm2835_isp_fmt supported_formats[] = {
 		.bytesperline_align = 32,
 		.mmal_fmt	    = MMAL_ENCODING_Y14P,
 		.size_multiplier_x2 = 2,
-		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
 		.step_size	    = 2,
 	}, {
 		/* 16 bit */
@@ -441,7 +509,8 @@ static const struct bcm2835_isp_fmt supported_formats[] = {
 		.bytesperline_align = 32,
 		.mmal_fmt	    = MMAL_ENCODING_Y16,
 		.size_multiplier_x2 = 2,
-		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
 		.step_size	    = 2,
 	}, {
 		/* 10 bit as 16bpp */
@@ -450,7 +519,8 @@ static const struct bcm2835_isp_fmt supported_formats[] = {
 		.bytesperline_align = 32,
 		.mmal_fmt	    = MMAL_ENCODING_Y10,
 		.size_multiplier_x2 = 2,
-		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
 		.step_size	    = 2,
 	}, {
 		/* 12 bit as 16bpp */
@@ -459,7 +529,8 @@ static const struct bcm2835_isp_fmt supported_formats[] = {
 		.bytesperline_align = 32,
 		.mmal_fmt	    = MMAL_ENCODING_Y12,
 		.size_multiplier_x2 = 2,
-		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
 		.step_size	    = 2,
 	}, {
 		/* 14 bit as 16bpp */
@@ -468,7 +539,8 @@ static const struct bcm2835_isp_fmt supported_formats[] = {
 		.bytesperline_align = 32,
 		.mmal_fmt	    = MMAL_ENCODING_Y14,
 		.size_multiplier_x2 = 2,
-		.colorspace	    = V4L2_COLORSPACE_RAW,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
 		.step_size	    = 2,
 	}, {
 		.fourcc		    = V4L2_META_FMT_BCM2835_ISP_STATS,
diff --git a/drivers/staging/vc04_services/bcm2835-isp/bcm2835-v4l2-isp.c b/drivers/staging/vc04_services/bcm2835-isp/bcm2835-v4l2-isp.c
index eb5f076fc6dc..cb7cdba76682 100644
--- a/drivers/staging/vc04_services/bcm2835-isp/bcm2835-v4l2-isp.c
+++ b/drivers/staging/vc04_services/bcm2835-isp/bcm2835-v4l2-isp.c
@@ -74,6 +74,7 @@ struct bcm2835_isp_q_data {
 	unsigned int width;
 	unsigned int height;
 	unsigned int sizeimage;
+	enum v4l2_colorspace colorspace;
 	const struct bcm2835_isp_fmt *fmt;
 };
 
@@ -313,6 +314,43 @@ static void mmal_buffer_cb(struct vchiq_mmal_instance *instance,
 		complete(&dev->frame_cmplt);
 }
 
+struct colorspace_translation {
+	enum v4l2_colorspace v4l2_value;
+	u32 mmal_value;
+};
+
+static u32 translate_color_space(enum v4l2_colorspace color_space)
+{
+	static const struct colorspace_translation translations[] = {
+		{ V4L2_COLORSPACE_DEFAULT, MMAL_COLOR_SPACE_UNKNOWN },
+		{ V4L2_COLORSPACE_SMPTE170M, MMAL_COLOR_SPACE_ITUR_BT601 },
+		{ V4L2_COLORSPACE_SMPTE240M, MMAL_COLOR_SPACE_SMPTE240M },
+		{ V4L2_COLORSPACE_REC709, MMAL_COLOR_SPACE_ITUR_BT709 },
+		/* V4L2_COLORSPACE_BT878 unavailable */
+		{ V4L2_COLORSPACE_470_SYSTEM_M, MMAL_COLOR_SPACE_BT470_2_M },
+		{ V4L2_COLORSPACE_470_SYSTEM_BG, MMAL_COLOR_SPACE_BT470_2_BG },
+		{ V4L2_COLORSPACE_JPEG, MMAL_COLOR_SPACE_JPEG_JFIF },
+		/*
+		 * We don't have an encoding for SRGB as such, but VideoCore
+		 * will do the right thing if it gets "unknown".
+		 */
+		{ V4L2_COLORSPACE_SRGB, MMAL_COLOR_SPACE_UNKNOWN },
+		/* V4L2_COLORSPACE_OPRGB unavailable */
+		/* V4L2_COLORSPACE_BT2020 unavailable */
+		/* V4L2_COLORSPACE_RAW unavailable */
+		/* V4L2_COLORSPACE_DCI_P3 unavailable */
+	};
+
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(translations); i++) {
+		if (color_space == translations[i].v4l2_value)
+			return translations[i].mmal_value;
+	}
+
+	return MMAL_COLOR_SPACE_UNKNOWN;
+}
+
 static void setup_mmal_port_format(struct bcm2835_isp_node *node,
 				   struct vchiq_mmal_port *port)
 {
@@ -326,6 +364,7 @@ static void setup_mmal_port_format(struct bcm2835_isp_node *node,
 	port->es.video.crop.height = q_data->height;
 	port->es.video.crop.x = 0;
 	port->es.video.crop.y = 0;
+	port->es.video.color_space = translate_color_space(q_data->colorspace);
 };
 
 static int setup_mmal_port(struct bcm2835_isp_node *node)
@@ -834,6 +873,9 @@ static int populate_qdata_fmt(struct v4l2_format *f,
 		/* All parameters should have been set correctly by try_fmt */
 		q_data->bytesperline = f->fmt.pix.bytesperline;
 		q_data->sizeimage = f->fmt.pix.sizeimage;
+
+		/* We must indicate which of the allowed colour spaces we have. */
+		q_data->colorspace = f->fmt.pix.colorspace;
 	} else {
 		v4l2_dbg(1, debug, &dev->v4l2_dev,
 			 "%s: Setting meta format for fmt: %08x, size %u\n",
@@ -845,6 +887,9 @@ static int populate_qdata_fmt(struct v4l2_format *f,
 		q_data->height = 0;
 		q_data->bytesperline = 0;
 		q_data->sizeimage = f->fmt.meta.buffersize;
+
+		/* This won't mean anything for metadata, but may as well fill it in. */
+		q_data->colorspace = V4L2_COLORSPACE_DEFAULT;
 	}
 
 	v4l2_dbg(1, debug, &dev->v4l2_dev,
@@ -908,7 +953,7 @@ static int bcm2835_isp_node_g_fmt(struct file *file, void *priv,
 		f->fmt.pix.pixelformat = q_data->fmt->fourcc;
 		f->fmt.pix.bytesperline = q_data->bytesperline;
 		f->fmt.pix.sizeimage = q_data->sizeimage;
-		f->fmt.pix.colorspace = q_data->fmt->colorspace;
+		f->fmt.pix.colorspace = q_data->colorspace;
 	}
 
 	return 0;
@@ -975,13 +1020,31 @@ static int bcm2835_isp_node_try_fmt(struct file *file, void *priv,
 		fmt = get_default_format(node);
 
 	if (!node_is_stats(node)) {
+		int is_rgb;
+
 		f->fmt.pix.width = max(min(f->fmt.pix.width, MAX_DIM),
 				       MIN_DIM);
 		f->fmt.pix.height = max(min(f->fmt.pix.height, MAX_DIM),
 					MIN_DIM);
 
 		f->fmt.pix.pixelformat = fmt->fourcc;
-		f->fmt.pix.colorspace = fmt->colorspace;
+
+		/*
+		 * Fill in the actual colour space when the requested one was
+		 * not supported. This also catches the case when the "default"
+		 * colour space was requested (as that's never in the mask).
+		 */
+		if (!(V4L2_COLORSPACE_MASK(f->fmt.pix.colorspace) & fmt->colorspace_mask))
+			f->fmt.pix.colorspace = fmt->colorspace_default;
+		/* In all cases, we only support the defaults for these: */
+		f->fmt.pix.ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(f->fmt.pix.colorspace);
+		f->fmt.pix.xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(f->fmt.pix.colorspace);
+		/* RAW counts as sRGB here so that we get full range. */
+		is_rgb = f->fmt.pix.colorspace == V4L2_COLORSPACE_SRGB ||
+			f->fmt.pix.colorspace == V4L2_COLORSPACE_RAW;
+		f->fmt.pix.quantization = V4L2_MAP_QUANTIZATION_DEFAULT(is_rgb, f->fmt.pix.colorspace,
+									f->fmt.pix.ycbcr_enc);
+
 		f->fmt.pix.bytesperline = get_bytesperline(f->fmt.pix.width,
 							   fmt);
 		f->fmt.pix.field = V4L2_FIELD_NONE;
@@ -1307,6 +1370,7 @@ static int register_node(struct bcm2835_isp_dev *dev,
 					       node->q_data.width,
 					       node->q_data.height,
 					       node->q_data.fmt);
+	node->q_data.colorspace = node->q_data.fmt->colorspace_default;
 
 	queue->io_modes = VB2_MMAP | VB2_DMABUF;
 	queue->drv_priv = node;
-- 
2.37.3

