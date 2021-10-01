Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 058C941EBCB
	for <lists+linux-media@lfdr.de>; Fri,  1 Oct 2021 13:25:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353845AbhJAL1N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Oct 2021 07:27:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353744AbhJAL1L (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Oct 2021 07:27:11 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36DF8C061775
        for <linux-media@vger.kernel.org>; Fri,  1 Oct 2021 04:25:27 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id s24so6964057wmh.4
        for <linux-media@vger.kernel.org>; Fri, 01 Oct 2021 04:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3POZSfd3i3rRjFBmejsX8EHhkanjDD2SzvXm5wj7xu0=;
        b=Lf4FLJqg3BajSlJoxu2QV1n7yHssEl/qRsfWd1c5h3WshXNw9lFtXjnRubG0B6Vzwr
         mKXy0eGlKZfRrAxmCq1mQ3Qz/XQauR0Tiv1o0Vt+DtbDPN9O+NudL2pEft+fC36oKO7r
         nU9v/QiYzjXg/QXm9AOX5pjBUOeCax2YsZaNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3POZSfd3i3rRjFBmejsX8EHhkanjDD2SzvXm5wj7xu0=;
        b=3gvbLbDCqn/DaKmRi204CNERdA4K4ZUoRcSWWmjTFbX1jLVZgUMpnLSMzFncgJfMKq
         Q3D7z9IMsLMMMXo48br5uAlAzqOq9CjEZEqCi/bkjwEGYzLwhVdW2WQzC5GZq4tNgn6N
         r+0SOolxvRxY94/00glvE6X3sH6VgnAwytb/FO8+9YV54WclMPWhq+/yULnPE+W1njuy
         WkpaYtyBoV/ejI75iTTelUyk/AXgCYR2HDFeZp7fnT9UEDBEoGJ5zbuyyeA2yg3FY7Oc
         EtjIBxCuvfl5rTlh4UX0o3mewgNIBTMSHie7y2Fz8Z85bFfwSYygIOYp4CVGv9jlWqrS
         JO0A==
X-Gm-Message-State: AOAM533kybRuf/VXlmDHENO5ExixpqKGD26lRjsQMqieU4KWdGIxHDOB
        Xp3Lw+LksTawj15grQmrgGZxrQ==
X-Google-Smtp-Source: ABdhPJwlXdz6nFYFhkX+oeIRplHv8yyqSEfQ/zRYkO7apAjHVQmVmzlEGMCweSQB1YOSqTkz1qWpVg==
X-Received: by 2002:a05:600c:1c93:: with SMTP id k19mr3955263wms.80.1633087525831;
        Fri, 01 Oct 2021 04:25:25 -0700 (PDT)
Received: from beni.c.googlers.com.com (216.131.76.34.bc.googleusercontent.com. [34.76.131.216])
        by smtp.gmail.com with ESMTPSA id x17sm5530958wrc.51.2021.10.01.04.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 04:25:25 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v3 2/8] media: ipu3-imgu: Refactor bytesperpixel calculation
Date:   Fri,  1 Oct 2021 11:25:16 +0000
Message-Id: <20211001112522.2839602-3-ribalda@chromium.org>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
In-Reply-To: <20211001112522.2839602-1-ribalda@chromium.org>
References: <20211001112522.2839602-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Move the calculation to an inline function, to it can be used by other
parts of the driver.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/ipu3/ipu3-css.c | 19 +++----------------
 drivers/staging/media/ipu3/ipu3-css.h |  1 -
 drivers/staging/media/ipu3/ipu3.h     | 12 ++++++++++++
 3 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-css.c b/drivers/staging/media/ipu3/ipu3-css.c
index 608dcacf12b2c..8c70497d744c9 100644
--- a/drivers/staging/media/ipu3/ipu3-css.c
+++ b/drivers/staging/media/ipu3/ipu3-css.c
@@ -5,6 +5,7 @@
 #include <linux/iopoll.h>
 #include <linux/slab.h>
 
+#include "ipu3.h"
 #include "ipu3-css.h"
 #include "ipu3-css-fw.h"
 #include "ipu3-css-params.h"
@@ -53,7 +54,6 @@ static const struct imgu_css_format imgu_css_formats[] = {
 		.frame_format = IMGU_ABI_FRAME_FORMAT_NV12,
 		.osys_format = IMGU_ABI_OSYS_FORMAT_NV12,
 		.osys_tiling = IMGU_ABI_OSYS_TILING_NONE,
-		.bytesperpixel_num = 1 * IPU3_CSS_FORMAT_BPP_DEN,
 		.chroma_decim = 4,
 		.width_align = IPU3_UAPI_ISP_VEC_ELEMS,
 		.flags = IPU3_CSS_FORMAT_FL_OUT | IPU3_CSS_FORMAT_FL_VF,
@@ -64,7 +64,6 @@ static const struct imgu_css_format imgu_css_formats[] = {
 		.frame_format = IMGU_ABI_FRAME_FORMAT_RAW_PACKED,
 		.bayer_order = IMGU_ABI_BAYER_ORDER_BGGR,
 		.bit_depth = 10,
-		.bytesperpixel_num = 64,
 		.width_align = 2 * IPU3_UAPI_ISP_VEC_ELEMS,
 		.flags = IPU3_CSS_FORMAT_FL_IN,
 	}, {
@@ -73,7 +72,6 @@ static const struct imgu_css_format imgu_css_formats[] = {
 		.frame_format = IMGU_ABI_FRAME_FORMAT_RAW_PACKED,
 		.bayer_order = IMGU_ABI_BAYER_ORDER_GBRG,
 		.bit_depth = 10,
-		.bytesperpixel_num = 64,
 		.width_align = 2 * IPU3_UAPI_ISP_VEC_ELEMS,
 		.flags = IPU3_CSS_FORMAT_FL_IN,
 	}, {
@@ -82,7 +80,6 @@ static const struct imgu_css_format imgu_css_formats[] = {
 		.frame_format = IMGU_ABI_FRAME_FORMAT_RAW_PACKED,
 		.bayer_order = IMGU_ABI_BAYER_ORDER_GRBG,
 		.bit_depth = 10,
-		.bytesperpixel_num = 64,
 		.width_align = 2 * IPU3_UAPI_ISP_VEC_ELEMS,
 		.flags = IPU3_CSS_FORMAT_FL_IN,
 	}, {
@@ -91,7 +88,6 @@ static const struct imgu_css_format imgu_css_formats[] = {
 		.frame_format = IMGU_ABI_FRAME_FORMAT_RAW_PACKED,
 		.bayer_order = IMGU_ABI_BAYER_ORDER_RGGB,
 		.bit_depth = 10,
-		.bytesperpixel_num = 64,
 		.width_align = 2 * IPU3_UAPI_ISP_VEC_ELEMS,
 		.flags = IPU3_CSS_FORMAT_FL_IN,
 	},
@@ -150,17 +146,8 @@ static int imgu_css_queue_init(struct imgu_css_queue *queue,
 	f->height = ALIGN(clamp_t(u32, f->height,
 				  IPU3_CSS_MIN_RES, IPU3_CSS_MAX_H), 2);
 	queue->width_pad = ALIGN(f->width, queue->css_fmt->width_align);
-	if (queue->css_fmt->frame_format != IMGU_ABI_FRAME_FORMAT_RAW_PACKED)
-		f->plane_fmt[0].bytesperline = DIV_ROUND_UP(queue->width_pad *
-					queue->css_fmt->bytesperpixel_num,
-					IPU3_CSS_FORMAT_BPP_DEN);
-	else
-		/* For packed raw, alignment for bpl is by 50 to the width */
-		f->plane_fmt[0].bytesperline =
-				DIV_ROUND_UP(f->width,
-					     IPU3_CSS_FORMAT_BPP_DEN) *
-					     queue->css_fmt->bytesperpixel_num;
-
+	f->plane_fmt[0].bytesperline =
+		imgu_bytesperline(f->width, queue->css_fmt->frame_format);
 	sizeimage = f->height * f->plane_fmt[0].bytesperline;
 	if (queue->css_fmt->chroma_decim)
 		sizeimage += 2 * sizeimage / queue->css_fmt->chroma_decim;
diff --git a/drivers/staging/media/ipu3/ipu3-css.h b/drivers/staging/media/ipu3/ipu3-css.h
index 6108a068b228f..ab64e95212032 100644
--- a/drivers/staging/media/ipu3/ipu3-css.h
+++ b/drivers/staging/media/ipu3/ipu3-css.h
@@ -82,7 +82,6 @@ struct imgu_css_format {
 	enum imgu_abi_bayer_order bayer_order;
 	enum imgu_abi_osys_format osys_format;
 	enum imgu_abi_osys_tiling osys_tiling;
-	u32 bytesperpixel_num;	/* Bytes per pixel in first plane * 50 */
 	u8 bit_depth;		/* Effective bits per pixel */
 	u8 chroma_decim;	/* Chroma plane decimation, 0=no chroma plane */
 	u8 width_align;		/* Alignment requirement for width_pad */
diff --git a/drivers/staging/media/ipu3/ipu3.h b/drivers/staging/media/ipu3/ipu3.h
index eb46b527dd233..d2ad0a95c5aab 100644
--- a/drivers/staging/media/ipu3/ipu3.h
+++ b/drivers/staging/media/ipu3/ipu3.h
@@ -164,4 +164,16 @@ void imgu_v4l2_buffer_done(struct vb2_buffer *vb, enum vb2_buffer_state state);
 
 int imgu_s_stream(struct imgu_device *imgu, int enable);
 
+static inline u32 imgu_bytesperline(const unsigned int width,
+				    enum imgu_abi_frame_format frame_format)
+{
+	if (frame_format == IMGU_ABI_FRAME_FORMAT_NV12)
+		return ALIGN(width, IPU3_UAPI_ISP_VEC_ELEMS);
+	/*
+	 * 64 bytes for every 50 pixels, the line length
+	 * in bytes is multiple of 64 (line end alignment).
+	 */
+	return DIV_ROUND_UP(width, 50) * 64;
+}
+
 #endif
-- 
2.33.0.800.g4c38ced690-goog

