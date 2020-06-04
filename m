Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60D4A1EE5FC
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2020 15:53:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728934AbgFDNxm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jun 2020 09:53:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728921AbgFDNxh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Jun 2020 09:53:37 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88969C08C5C1
        for <linux-media@vger.kernel.org>; Thu,  4 Jun 2020 06:53:37 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id x13so6206296wrv.4
        for <linux-media@vger.kernel.org>; Thu, 04 Jun 2020 06:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lGj2UMyH8lsz5cePu8qdjRLQp4Cv58ojSEdB01leLf4=;
        b=kUvM5lhA0X5A2xJgJf7Kx6ruICrlB1Lu2504upwpyDnwS32Swa5tp1GIls0pD9VZoo
         8bLhHT+Q0pojf5xrwFfO0+nESF089bvwl3TbvCNKxyg86ytL8urGhj3NTLKIbilWTTbY
         qb+iYcoIpGXUWad0EyS4IyE58Wgg3NB2qij5dVL/CWjgPJdfycgL5rOUqU2x/nhqGOZA
         cy7vkUybM5STb8o64YfRtWFvYWjMhUTJZpqs1BhdjYKiMZmMc+oa0qINif1NtiKtLmCr
         WSPCRxYJuVzURhrZVwrwIHQ64e7xDUfPHP2DxUeF3+QB04lYG42va4p1rGSugGdjv/WB
         tS6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lGj2UMyH8lsz5cePu8qdjRLQp4Cv58ojSEdB01leLf4=;
        b=eGrldYe94cdfNEZKy9LIAL9J/03ztVRVmLWKLn0b8lv0/TMjtYgg5sA8u/X2X46KcA
         0+MCw9GpiN7Iq+ppx2XONf2+3USTUFmDZLls3uWJmKzXn6Uo5aDP5Ezt8FDzj7c8wt1T
         XseGzXzJkY8FXdDShoX/drPU/F9QzMmR9c/JKvdQyv/gwWLkWjcOdx+SusHQA3kpzo+R
         ryjcWf/3H6kRe2J5LLHLi7XF3QZSrzzGa74+k2pn2JgEWrsOkKy2eU1Mu/bEzZ/9hByE
         D67ouX3NtiRWYRWooSqhZdIkTaoDHzummSn7BNHnFKeF4xZ8d3ZcljFDthc3RgK340jd
         2J9g==
X-Gm-Message-State: AOAM532LjdWuTgXU0U7gpIDnr2+vE8BAcrScozBRzNtXqThXDeC0kC7L
        utCAGPBYfAcG7bBeoJsK1Xi/CQ==
X-Google-Smtp-Source: ABdhPJyMzfHyb8pTAQmMxPrEsEYW71XUGUiF6xOTjuUJnnxbQaZcY7he/oHRn21BXafwxPrX8dtpRA==
X-Received: by 2002:adf:f6ce:: with SMTP id y14mr4801259wrp.90.1591278816084;
        Thu, 04 Jun 2020 06:53:36 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:22:5867:d2c6:75f4])
        by smtp.gmail.com with ESMTPSA id i74sm8185599wri.49.2020.06.04.06.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2020 06:53:35 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Maxime Jourdan <mjourdan@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 5/5] media: meson: vdec: handle compressed output pixel format negociation with consumer
Date:   Thu,  4 Jun 2020 15:53:17 +0200
Message-Id: <20200604135317.9235-6-narmstrong@baylibre.com>
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

Add the necessary to add support for negociating the compressed buffer
pixel format with the V4L2 M2M consumer, and allocating the right
buffers in this case.

Until a proper mechanism exists to pass a modifier along the pixel format,
only the generic V4L2_PIX_FMT_YUV420_8BIT and V4L2_PIX_FMT_YUV420_10BIT
format are passed in v4l2_pix_format_mplane struct for consumer.

Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../media/meson/vdec/codec_hevc_common.c      |  1 -
 drivers/staging/media/meson/vdec/vdec.c       | 46 +++++++++++++++++++
 drivers/staging/media/meson/vdec/vdec.h       |  3 ++
 .../staging/media/meson/vdec/vdec_helpers.c   | 23 ++++++++++
 .../staging/media/meson/vdec/vdec_platform.c  |  9 ++--
 5 files changed, 78 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/codec_hevc_common.c b/drivers/staging/media/meson/vdec/codec_hevc_common.c
index 73dae40b3319..78fada7b8fa9 100644
--- a/drivers/staging/media/meson/vdec/codec_hevc_common.c
+++ b/drivers/staging/media/meson/vdec/codec_hevc_common.c
@@ -10,7 +10,6 @@
 #include "vdec_helpers.h"
 #include "hevc_regs.h"
 
-#define MMU_COMPRESS_HEADER_SIZE 0x48000
 #define MMU_MAP_SIZE 0x4800
 
 const u16 vdec_hevc_parser_cmd[] = {
diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 3040136ceb77..9fb075f69cb9 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -192,6 +192,7 @@ static int vdec_queue_setup(struct vb2_queue *q, unsigned int *num_buffers,
 {
 	struct amvdec_session *sess = vb2_get_drv_priv(q);
 	u32 output_size = amvdec_get_output_size(sess);
+	u32 revision = sess->core->platform->revision;
 
 	if (*num_planes) {
 		switch (q->type) {
@@ -215,6 +216,12 @@ static int vdec_queue_setup(struct vb2_queue *q, unsigned int *num_buffers,
 				    sizes[2] < output_size / 4)
 					return -EINVAL;
 				break;
+			case V4L2_PIX_FMT_YUV420_8BIT:
+			case V4L2_PIX_FMT_YUV420_10BIT:
+				if (*num_planes != 1 ||
+				    sizes[0] < MMU_COMPRESS_HEADER_SIZE)
+					return -EINVAL;
+				break;
 			default:
 				return -EINVAL;
 			}
@@ -244,6 +251,24 @@ static int vdec_queue_setup(struct vb2_queue *q, unsigned int *num_buffers,
 			sizes[2] = output_size / 4;
 			*num_planes = 3;
 			break;
+		case V4L2_PIX_FMT_YUV420_8BIT:
+			if (revision >= VDEC_REVISION_G12A)
+				sizes[0] = MMU_COMPRESS_HEADER_SIZE;
+			else
+				sizes[0] = amvdec_amfbc_size(sess->width,
+							     sess->height,
+							     0, 0);
+			*num_planes = 1;
+			break;
+		case V4L2_PIX_FMT_YUV420_10BIT:
+			if (revision >= VDEC_REVISION_G12A)
+				sizes[0] = MMU_COMPRESS_HEADER_SIZE;
+			else
+				sizes[0] = amvdec_amfbc_size(sess->width,
+							     sess->height,
+							     1, 0);
+			*num_planes = 1;
+			break;
 		default:
 			return -EINVAL;
 		}
@@ -496,6 +521,7 @@ vdec_try_fmt_common(struct amvdec_session *sess, u32 size,
 	struct v4l2_plane_pix_format *pfmt = pixmp->plane_fmt;
 	const struct amvdec_format *fmts = sess->core->platform->formats;
 	const struct amvdec_format *fmt_out = NULL;
+	u32 revision = sess->core->platform->revision;
 	u32 output_size = 0;
 
 	memset(pfmt[0].reserved, 0, sizeof(pfmt[0].reserved));
@@ -548,6 +574,26 @@ vdec_try_fmt_common(struct amvdec_session *sess, u32 size,
 			pfmt[2].sizeimage = output_size / 2;
 			pfmt[2].bytesperline = ALIGN(pixmp->width, 32) / 2;
 			pixmp->num_planes = 3;
+		} else if (pixmp->pixelformat == V4L2_PIX_FMT_YUV420_8BIT) {
+			if (revision >= VDEC_REVISION_G12A) {
+				pfmt[0].sizeimage = MMU_COMPRESS_HEADER_SIZE;
+			} else {
+				pfmt[0].sizeimage =
+					amvdec_amfbc_size(pixmp->width,
+							  pixmp->height, 0, 0);
+				pfmt[0].bytesperline = pixmp->width;
+			}
+			pixmp->num_planes = 1;
+		} else if (pixmp->pixelformat == V4L2_PIX_FMT_YUV420_10BIT) {
+			if (revision >= VDEC_REVISION_G12A) {
+				pfmt[0].sizeimage = MMU_COMPRESS_HEADER_SIZE;
+			} else {
+				pfmt[0].sizeimage =
+					amvdec_amfbc_size(pixmp->width,
+							  pixmp->height, 1, 0);
+				pfmt[0].bytesperline = pixmp->width;
+			}
+			pixmp->num_planes = 1;
 		}
 	}
 
diff --git a/drivers/staging/media/meson/vdec/vdec.h b/drivers/staging/media/meson/vdec/vdec.h
index e3e4af73447a..1412054a70c4 100644
--- a/drivers/staging/media/meson/vdec/vdec.h
+++ b/drivers/staging/media/meson/vdec/vdec.h
@@ -17,6 +17,9 @@
 
 #include "vdec_platform.h"
 
+/* MMU header size for codecs using the IOMMU + FBC */
+#define MMU_COMPRESS_HEADER_SIZE 0x48000
+
 /* 32 buffers in 3-plane YUV420 */
 #define MAX_CANVAS (32 * 3)
 
diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.c b/drivers/staging/media/meson/vdec/vdec_helpers.c
index 320cac1ed03e..7166605b89ae 100644
--- a/drivers/staging/media/meson/vdec/vdec_helpers.c
+++ b/drivers/staging/media/meson/vdec/vdec_helpers.c
@@ -299,6 +299,22 @@ static void dst_buf_done(struct amvdec_session *sess,
 		vbuf->vb2_buf.planes[1].bytesused = output_size / 4;
 		vbuf->vb2_buf.planes[2].bytesused = output_size / 4;
 		break;
+	case V4L2_PIX_FMT_YUV420_8BIT:
+		if (sess->core->platform->revision >= VDEC_REVISION_G12A)
+			vbuf->vb2_buf.planes[0].bytesused =
+				MMU_COMPRESS_HEADER_SIZE;
+		else
+			vbuf->vb2_buf.planes[0].bytesused =
+			   amvdec_amfbc_size(sess->width, sess->height, 0, 0);
+		break;
+	case V4L2_PIX_FMT_YUV420_10BIT:
+		if (sess->core->platform->revision >= VDEC_REVISION_G12A)
+			vbuf->vb2_buf.planes[0].bytesused =
+				MMU_COMPRESS_HEADER_SIZE;
+		else
+			vbuf->vb2_buf.planes[0].bytesused =
+			   amvdec_amfbc_size(sess->width, sess->height, 1, 0);
+		break;
 	}
 
 	vbuf->vb2_buf.timestamp = timestamp;
@@ -478,6 +494,13 @@ void amvdec_src_change(struct amvdec_session *sess, u32 width,
 	sess->status = STATUS_NEEDS_RESUME;
 	sess->bitdepth = bitdepth;
 
+	if (sess->pixfmt_cap == V4L2_PIX_FMT_YUV420_8BIT &&
+	    bitdepth == 10)
+		sess->pixfmt_cap = V4L2_PIX_FMT_YUV420_10BIT;
+	else if (sess->pixfmt_cap == V4L2_PIX_FMT_YUV420_10BIT &&
+		 bitdepth == 8)
+		sess->pixfmt_cap = V4L2_PIX_FMT_YUV420_8BIT;
+
 	dev_dbg(sess->core->dev, "Res. changed (%ux%u), DPB %u, bitdepth %u\n",
 		width, height, dpb_size, bitdepth);
 	v4l2_event_queue_fh(&sess->fh, &ev);
diff --git a/drivers/staging/media/meson/vdec/vdec_platform.c b/drivers/staging/media/meson/vdec/vdec_platform.c
index eabbebab2da2..efc090d2a3bb 100644
--- a/drivers/staging/media/meson/vdec/vdec_platform.c
+++ b/drivers/staging/media/meson/vdec/vdec_platform.c
@@ -61,7 +61,8 @@ static const struct amvdec_format vdec_formats_gxl[] = {
 		.vdec_ops = &vdec_hevc_ops,
 		.codec_ops = &codec_vp9_ops,
 		.firmware_path = "meson/vdec/gxl_vp9.bin",
-		.pixfmts_cap = { V4L2_PIX_FMT_NV12M, 0 },
+		.pixfmts_cap = { V4L2_PIX_FMT_NV12M, V4L2_PIX_FMT_YUV420_8BIT,
+				 V4L2_PIX_FMT_YUV420_10BIT, 0 },
 		.flags = V4L2_FMT_FLAG_COMPRESSED |
 			 V4L2_FMT_FLAG_DYN_RESOLUTION,
 	}, {
@@ -149,7 +150,8 @@ static const struct amvdec_format vdec_formats_g12a[] = {
 		.vdec_ops = &vdec_hevc_ops,
 		.codec_ops = &codec_vp9_ops,
 		.firmware_path = "meson/vdec/g12a_vp9.bin",
-		.pixfmts_cap = { V4L2_PIX_FMT_NV12M, 0 },
+		.pixfmts_cap = { V4L2_PIX_FMT_NV12M, V4L2_PIX_FMT_YUV420_8BIT,
+				 V4L2_PIX_FMT_YUV420_10BIT, 0 },
 		.flags = V4L2_FMT_FLAG_COMPRESSED |
 			 V4L2_FMT_FLAG_DYN_RESOLUTION,
 	}, {
@@ -199,7 +201,8 @@ static const struct amvdec_format vdec_formats_sm1[] = {
 		.vdec_ops = &vdec_hevc_ops,
 		.codec_ops = &codec_vp9_ops,
 		.firmware_path = "meson/vdec/sm1_vp9_mmu.bin",
-		.pixfmts_cap = { V4L2_PIX_FMT_NV12M, 0 },
+		.pixfmts_cap = { V4L2_PIX_FMT_NV12M, V4L2_PIX_FMT_YUV420_8BIT,
+				 V4L2_PIX_FMT_YUV420_10BIT, 0 },
 		.flags = V4L2_FMT_FLAG_COMPRESSED |
 			 V4L2_FMT_FLAG_DYN_RESOLUTION,
 	}, {
-- 
2.22.0

