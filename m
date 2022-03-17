Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40ACA4DC8D8
	for <lists+linux-media@lfdr.de>; Thu, 17 Mar 2022 15:37:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234868AbiCQOij (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Mar 2022 10:38:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233923AbiCQOij (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Mar 2022 10:38:39 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08ACC1D66D4
        for <linux-media@vger.kernel.org>; Thu, 17 Mar 2022 07:37:22 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 098833E4;
        Thu, 17 Mar 2022 15:37:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647527841;
        bh=j3Nn2jFyN+n7Jn3695cNBs7/ucBKz3iWSkEqMps+wj8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=S3dCBQGPB1DCpGlJBVhN7Y2RRb0SBlnTA0OtKCm3xjQChmnGyilrKv85343HyHxaQ
         b1yJrx5ALL4I6ERMTfg9bAtXMOk0c2cXfb71/6ZjIrM2hEd3W25eXymUV+dDFux88G
         GyecjpGa+GirN+5IsHhbDeUXPNlr0t3XqCn2DmvQ=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH 1/2] media: v4l2: Make colorspace validity checks more future-proof
Date:   Thu, 17 Mar 2022 16:36:59 +0200
Message-Id: <20220317143700.12769-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220317143700.12769-1-laurent.pinchart@ideasonboard.com>
References: <20220317143700.12769-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The helper functions that test validity of colorspace-related fields
use the last value of the corresponding enums. This isn't very
future-proof, as there's a high chance someone adding a new value may
forget to update the helpers. Add new "LAST" entries to the enumerations
to improve this, and keep them private to the kernel.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 include/media/v4l2-common.h    | 10 +++++-----
 include/uapi/linux/videodev2.h | 29 +++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+), 5 deletions(-)

diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
index 3eb202259e8c..b686124e2ccf 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -563,19 +563,19 @@ static inline void v4l2_buffer_set_timestamp(struct v4l2_buffer *buf,
 static inline bool v4l2_is_colorspace_valid(__u32 colorspace)
 {
 	return colorspace > V4L2_COLORSPACE_DEFAULT &&
-	       colorspace <= V4L2_COLORSPACE_DCI_P3;
+	       colorspace <= V4L2_COLORSPACE_LAST;
 }
 
 static inline bool v4l2_is_xfer_func_valid(__u32 xfer_func)
 {
 	return xfer_func > V4L2_XFER_FUNC_DEFAULT &&
-	       xfer_func <= V4L2_XFER_FUNC_SMPTE2084;
+	       xfer_func <= V4L2_XFER_FUNC_LAST;
 }
 
 static inline bool v4l2_is_ycbcr_enc_valid(__u8 ycbcr_enc)
 {
 	return ycbcr_enc > V4L2_YCBCR_ENC_DEFAULT &&
-	       ycbcr_enc <= V4L2_YCBCR_ENC_SMPTE240M;
+	       ycbcr_enc <= V4L2_YCBCR_ENC_LAST;
 }
 
 static inline bool v4l2_is_hsv_enc_valid(__u8 hsv_enc)
@@ -585,8 +585,8 @@ static inline bool v4l2_is_hsv_enc_valid(__u8 hsv_enc)
 
 static inline bool v4l2_is_quant_valid(__u8 quantization)
 {
-	return quantization == V4L2_QUANTIZATION_FULL_RANGE ||
-	       quantization == V4L2_QUANTIZATION_LIM_RANGE;
+	return quantization > V4L2_QUANTIZATION_DEFAULT &&
+	       quantization <= V4L2_QUANTIZATION_LAST;
 }
 
 #endif /* V4L2_COMMON_H_ */
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 16dcd9dd1a50..099da1576db6 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -245,6 +245,14 @@ enum v4l2_colorspace {
 
 	/* DCI-P3 colorspace, used by cinema projectors */
 	V4L2_COLORSPACE_DCI_P3        = 12,
+
+#ifdef __KERNEL__
+	/*
+	 * Largest supported colorspace value, used by the framework to check
+	 * for invalid values.
+	 */
+	V4L2_COLORSPACE_LAST          = 12,
+#endif
 };
 
 /*
@@ -283,6 +291,13 @@ enum v4l2_xfer_func {
 	V4L2_XFER_FUNC_NONE        = 5,
 	V4L2_XFER_FUNC_DCI_P3      = 6,
 	V4L2_XFER_FUNC_SMPTE2084   = 7,
+#ifdef __KERNEL__
+	/*
+	 * Largest supported transfer function value, used by the framework to
+	 * check for invalid values.
+	 */
+	V4L2_XFER_FUNC_LAST        = 7,
+#endif
 };
 
 /*
@@ -343,6 +358,13 @@ enum v4l2_ycbcr_encoding {
 
 	/* SMPTE 240M -- Obsolete HDTV */
 	V4L2_YCBCR_ENC_SMPTE240M      = 8,
+#ifdef __KERNEL__
+	/*
+	 * Largest supported encoding value, used by the framework to check for
+	 * invalid values.
+	 */
+	V4L2_YCBCR_ENC_LAST           = 8,
+#endif
 };
 
 /*
@@ -378,6 +400,13 @@ enum v4l2_quantization {
 	V4L2_QUANTIZATION_DEFAULT     = 0,
 	V4L2_QUANTIZATION_FULL_RANGE  = 1,
 	V4L2_QUANTIZATION_LIM_RANGE   = 2,
+#ifdef __KERNEL__
+	/*
+	 * Largest supported quantization value, used by the framework to check
+	 * for invalid values.
+	 */
+	V4L2_QUANTIZATION_LAST        = 2,
+#endif
 };
 
 /*
-- 
Regards,

Laurent Pinchart

