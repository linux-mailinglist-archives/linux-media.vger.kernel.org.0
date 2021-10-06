Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F5E342499B
	for <lists+linux-media@lfdr.de>; Thu,  7 Oct 2021 00:26:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239826AbhJFW2Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Oct 2021 18:28:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239810AbhJFW2X (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Oct 2021 18:28:23 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CAE7C061753
        for <linux-media@vger.kernel.org>; Wed,  6 Oct 2021 15:26:30 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id r18so15435714edv.12
        for <linux-media@vger.kernel.org>; Wed, 06 Oct 2021 15:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=G7H42KnrxxpmizTd/OCso9sdIlpLo0fqcw1vYqAX4xk=;
        b=nHXuCIKs8Xvu7FocqSLMiMlnpe11rpyDgRYNTZJDJg3jAUVaXEo7zLoKY1vB61llgR
         KoVYDIonosblBn0+nHpG9pFzY8cwms+AZWIs+1QtYRMfCuLiZkVOlNyJBFyoDB2MTlTa
         6CPGO6eh+x96bjpneKwrO1Fun0UyvlXfi6JQU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G7H42KnrxxpmizTd/OCso9sdIlpLo0fqcw1vYqAX4xk=;
        b=cZUB9RI2I5c3DvBo3tcjrcjMqKCQldNxDG9xyIWleK7Ud72tG9Qe8AYo20b/O3wceZ
         DIS/Dfr9UZBVIpNjviQpFwVmIkvXU2nb5Wn+x6OtvxaTcdMFqBjfZNVu0vM9bO5EAIKD
         9H3A2RDD4k1TDIDl2jD0FBXgOMoj77zH728G8P1nXlNRF469eigtNRLdZv3SprvvTJmG
         dArDzx4GUWyI7Xvc86ZEKYNA/WBmbFgH9PLdMwWSh2kUknzUNlhFFNS6RcsYospYlq8q
         Ys9I01gOYYYQ906q8po34AtHQVYQkl0lNugvx5saqI/O1wkMCCWrkyr+iYfDTT09TTzb
         /90g==
X-Gm-Message-State: AOAM5321gCL3BM+RM69F+IWjz26fvBttLd+y84cNUbxGIxO/CHqkvANG
        GHnPsvJm3ZJjcDZhmJeYCN69Lw==
X-Google-Smtp-Source: ABdhPJyAcXg/NmyJ0271BvRdXbAhFtTJroDLFlKgcqRPy6rShy9r6ukv2mV4+xaT4P8yU3pNF+OLug==
X-Received: by 2002:a17:906:6c83:: with SMTP id s3mr1085050ejr.13.1633559188663;
        Wed, 06 Oct 2021 15:26:28 -0700 (PDT)
Received: from alco.lan (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id h7sm10557906edt.37.2021.10.06.15.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 15:26:28 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v4 2/8] media: ipu3-imgu: Refactor bytesperpixel calculation
Date:   Thu,  7 Oct 2021 00:26:19 +0200
Message-Id: <20211006222625.401122-3-ribalda@chromium.org>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
In-Reply-To: <20211006222625.401122-1-ribalda@chromium.org>
References: <20211006222625.401122-1-ribalda@chromium.org>
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
index 608dcacf12b2..8c70497d744c 100644
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
index 6108a068b228..ab64e9521203 100644
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
index eb46b527dd23..d2ad0a95c5aa 100644
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

