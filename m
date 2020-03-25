Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F4131932D1
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 22:35:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727666AbgCYVfZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 17:35:25 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:39908 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727401AbgCYVfY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 17:35:24 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 6D0EC293F04
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Rob Herring <robh@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v3 5/7] hantro: Move H264 motion vector calculation to a helper
Date:   Wed, 25 Mar 2020 18:34:36 -0300
Message-Id: <20200325213439.16509-6-ezequiel@collabora.com>
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200325213439.16509-1-ezequiel@collabora.com>
References: <20200325213439.16509-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Move the extra bytes calculation that are needed for H264
motion vector to a helper. This is just a cosmetic cleanup.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/staging/media/hantro/hantro.h      |  4 ---
 drivers/staging/media/hantro/hantro_hw.h   | 31 ++++++++++++++++++++++
 drivers/staging/media/hantro/hantro_v4l2.c | 25 ++---------------
 3 files changed, 33 insertions(+), 27 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
index 327ddef45345..2089f88a44a2 100644
--- a/drivers/staging/media/hantro/hantro.h
+++ b/drivers/staging/media/hantro/hantro.h
@@ -26,10 +26,6 @@
 
 #include "hantro_hw.h"
 
-#define MB_DIM			16
-#define MB_WIDTH(w)		DIV_ROUND_UP(w, MB_DIM)
-#define MB_HEIGHT(h)		DIV_ROUND_UP(h, MB_DIM)
-
 struct hantro_ctx;
 struct hantro_codec_ops;
 
diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
index 7dfc9bad7297..4053d8710e04 100644
--- a/drivers/staging/media/hantro/hantro_hw.h
+++ b/drivers/staging/media/hantro/hantro_hw.h
@@ -18,6 +18,10 @@
 
 #define DEC_8190_ALIGN_MASK	0x07U
 
+#define MB_DIM			16
+#define MB_WIDTH(w)		DIV_ROUND_UP(w, MB_DIM)
+#define MB_HEIGHT(h)		DIV_ROUND_UP(h, MB_DIM)
+
 struct hantro_dev;
 struct hantro_ctx;
 struct hantro_buf;
@@ -176,6 +180,33 @@ void hantro_g1_h264_dec_run(struct hantro_ctx *ctx);
 int hantro_h264_dec_init(struct hantro_ctx *ctx);
 void hantro_h264_dec_exit(struct hantro_ctx *ctx);
 
+static inline size_t
+hantro_h264_mv_size(unsigned int width, unsigned int height)
+{
+	/*
+	 * A decoded 8-bit 4:2:0 NV12 frame may need memory for up to
+	 * 448 bytes per macroblock with additional 32 bytes on
+	 * multi-core variants.
+	 *
+	 * The H264 decoder needs extra space on the output buffers
+	 * to store motion vectors. This is needed for reference
+	 * frames and only if the format is non-post-processed NV12.
+	 *
+	 * Memory layout is as follow:
+	 *
+	 * +---------------------------+
+	 * | Y-plane   256 bytes x MBs |
+	 * +---------------------------+
+	 * | UV-plane  128 bytes x MBs |
+	 * +---------------------------+
+	 * | MV buffer  64 bytes x MBs |
+	 * +---------------------------+
+	 * | MC sync          32 bytes |
+	 * +---------------------------+
+	 */
+	return 64 * MB_WIDTH(width) * MB_WIDTH(height) + 32;
+}
+
 void hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx);
 void rk3399_vpu_mpeg2_dec_run(struct hantro_ctx *ctx);
 void hantro_mpeg2_dec_copy_qtable(u8 *qtable,
diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
index 3142ab6697d5..458b502ff01b 100644
--- a/drivers/staging/media/hantro/hantro_v4l2.c
+++ b/drivers/staging/media/hantro/hantro_v4l2.c
@@ -273,32 +273,11 @@ static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f,
 		/* Fill remaining fields */
 		v4l2_fill_pixfmt_mp(pix_mp, fmt->fourcc, pix_mp->width,
 				    pix_mp->height);
-		/*
-		 * A decoded 8-bit 4:2:0 NV12 frame may need memory for up to
-		 * 448 bytes per macroblock with additional 32 bytes on
-		 * multi-core variants.
-		 *
-		 * The H264 decoder needs extra space on the output buffers
-		 * to store motion vectors. This is needed for reference
-		 * frames and only if the format is non-post-processed NV12.
-		 *
-		 * Memory layout is as follow:
-		 *
-		 * +---------------------------+
-		 * | Y-plane   256 bytes x MBs |
-		 * +---------------------------+
-		 * | UV-plane  128 bytes x MBs |
-		 * +---------------------------+
-		 * | MV buffer  64 bytes x MBs |
-		 * +---------------------------+
-		 * | MC sync          32 bytes |
-		 * +---------------------------+
-		 */
 		if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_H264_SLICE &&
 		    !hantro_needs_postproc(ctx, fmt))
 			pix_mp->plane_fmt[0].sizeimage +=
-				64 * MB_WIDTH(pix_mp->width) *
-				     MB_WIDTH(pix_mp->height) + 32;
+				hantro_h264_mv_size(pix_mp->width,
+						    pix_mp->height);
 	} else if (!pix_mp->plane_fmt[0].sizeimage) {
 		/*
 		 * For coded formats the application can specify
-- 
2.26.0.rc2

