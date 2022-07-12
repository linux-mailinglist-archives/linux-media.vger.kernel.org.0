Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBBA7570E89
	for <lists+linux-media@lfdr.de>; Tue, 12 Jul 2022 02:03:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230447AbiGLADh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jul 2022 20:03:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231339AbiGLADf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jul 2022 20:03:35 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FAB1380
        for <linux-media@vger.kernel.org>; Mon, 11 Jul 2022 17:03:31 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C336E1334;
        Tue, 12 Jul 2022 02:03:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657584206;
        bh=/W9bUFIXeDGFa18/0b6Rs9Fey10n3Y5MwZ5zhUxyQmw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SWRYThB6s+PpmJsGI5aVPdjhn6jMccPlsHawkbbp87MWm3qYVK4rawLmNfL79k+iF
         J/IEExbB91lOwuOZbqNFFeQT77e694i4pSlZvOIdgsfbKm5fP7ChRPEucn0mwJ4zG+
         CSkTNFIofAgCgFXx/99E7gKwyGwYiY3pRiPcxic4=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-imx@nxp.com, kernel@pengutronix.de
Subject: [PATCH v2 4/7] media: v4l2: Make colorspace validity checks more future-proof
Date:   Tue, 12 Jul 2022 03:02:48 +0300
Message-Id: <20220712000251.13607-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220712000251.13607-1-laurent.pinchart@ideasonboard.com>
References: <20220712000251.13607-1-laurent.pinchart@ideasonboard.com>
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
Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
Changes since v1:

- Let the compiler assign a value to the *_LAST enum entries
- Drop changes for the quantization check
---
 include/media/v4l2-common.h    |  6 +++---
 include/uapi/linux/videodev2.h | 22 ++++++++++++++++++++++
 2 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
index 3eb202259e8c..b708d63995f4 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -563,19 +563,19 @@ static inline void v4l2_buffer_set_timestamp(struct v4l2_buffer *buf,
 static inline bool v4l2_is_colorspace_valid(__u32 colorspace)
 {
 	return colorspace > V4L2_COLORSPACE_DEFAULT &&
-	       colorspace <= V4L2_COLORSPACE_DCI_P3;
+	       colorspace < V4L2_COLORSPACE_LAST;
 }
 
 static inline bool v4l2_is_xfer_func_valid(__u32 xfer_func)
 {
 	return xfer_func > V4L2_XFER_FUNC_DEFAULT &&
-	       xfer_func <= V4L2_XFER_FUNC_SMPTE2084;
+	       xfer_func < V4L2_XFER_FUNC_LAST;
 }
 
 static inline bool v4l2_is_ycbcr_enc_valid(__u8 ycbcr_enc)
 {
 	return ycbcr_enc > V4L2_YCBCR_ENC_DEFAULT &&
-	       ycbcr_enc <= V4L2_YCBCR_ENC_SMPTE240M;
+	       ycbcr_enc < V4L2_YCBCR_ENC_LAST;
 }
 
 static inline bool v4l2_is_hsv_enc_valid(__u8 hsv_enc)
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index f6f9a690971e..cae1018bf084 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -245,6 +245,14 @@ enum v4l2_colorspace {
 
 	/* DCI-P3 colorspace, used by cinema projectors */
 	V4L2_COLORSPACE_DCI_P3        = 12,
+
+#ifdef __KERNEL__
+	/*
+	 * Largest supported colorspace value, assigned by the compiler, used
+	 * by the framework to check for invalid values.
+	 */
+	V4L2_COLORSPACE_LAST,
+#endif
 };
 
 /*
@@ -283,6 +291,13 @@ enum v4l2_xfer_func {
 	V4L2_XFER_FUNC_NONE        = 5,
 	V4L2_XFER_FUNC_DCI_P3      = 6,
 	V4L2_XFER_FUNC_SMPTE2084   = 7,
+#ifdef __KERNEL__
+	/*
+	 * Largest supported transfer function value, assigned by the compiler,
+	 * used by the framework to check for invalid values.
+	 */
+	V4L2_XFER_FUNC_LAST,
+#endif
 };
 
 /*
@@ -343,6 +358,13 @@ enum v4l2_ycbcr_encoding {
 
 	/* SMPTE 240M -- Obsolete HDTV */
 	V4L2_YCBCR_ENC_SMPTE240M      = 8,
+#ifdef __KERNEL__
+	/*
+	 * Largest supported encoding value, assigned by the compiler, used by
+	 * the framework to check for invalid values.
+	 */
+	V4L2_YCBCR_ENC_LAST,
+#endif
 };
 
 /*
-- 
Regards,

Laurent Pinchart

