Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C14344A765
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2019 18:46:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730077AbfFRQqB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jun 2019 12:46:01 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:48633 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729968AbfFRQpp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jun 2019 12:45:45 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hdHEt-0003WX-N6; Tue, 18 Jun 2019 18:45:43 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@pengutronix.de
Subject: [PATCH 12/28] media: coda: pad first buffer with repeated MPEG headers to fix sequence init
Date:   Tue, 18 Jun 2019 18:45:19 +0200
Message-Id: <20190618164535.20162-13-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190618164535.20162-1-p.zabel@pengutronix.de>
References: <20190618164535.20162-1-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If the first buffer contains only headers, the sequence initialization
command fails. On CodaHx4 the buffer must be padded to at least 512
bytes, on CODA960 it seems to be enough to just repeat the sequence and
extension headers (MPEG-2) or the VOS and VO headers (MPEG-4) once for
for sequence initialization to succeed without further bitstream data.
On CodaHx4 the headers can be repeated multiple times until the 512 byte
mark is reached.

A similar issue was solved for h.264 by padding with a filler NAL in
commit 0eef89403ece ("[media] coda: pad first h.264 buffer to 512
bytes").

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/media/platform/coda/coda-bit.c   | 59 ++++++++++++++++++++++--
 drivers/media/platform/coda/coda-mpeg2.c | 43 +++++++++++++++++
 drivers/media/platform/coda/coda-mpeg4.c | 38 +++++++++++++++
 drivers/media/platform/coda/coda.h       |  2 +
 4 files changed, 139 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/coda/coda-bit.c b/drivers/media/platform/coda/coda-bit.c
index 4f96f808b4dd..5a1016243032 100644
--- a/drivers/media/platform/coda/coda-bit.c
+++ b/drivers/media/platform/coda/coda-bit.c
@@ -180,7 +180,7 @@ static void coda_kfifo_sync_to_device_write(struct coda_ctx *ctx)
 	coda_write(dev, wr_ptr, CODA_REG_BIT_WR_PTR(ctx->reg_idx));
 }
 
-static int coda_bitstream_pad(struct coda_ctx *ctx, u32 size)
+static int coda_h264_bitstream_pad(struct coda_ctx *ctx, u32 size)
 {
 	unsigned char *buf;
 	u32 n;
@@ -206,12 +206,34 @@ static int coda_bitstream_queue(struct coda_ctx *ctx, const u8 *buf, u32 size)
 	return (n < size) ? -ENOSPC : 0;
 }
 
+static u32 coda_buffer_parse_headers(struct coda_ctx *ctx,
+				     struct vb2_v4l2_buffer *src_buf,
+				     u32 payload)
+{
+	u8 *vaddr = vb2_plane_vaddr(&src_buf->vb2_buf, 0);
+	u32 size = 0;
+
+	switch (ctx->codec->src_fourcc) {
+	case V4L2_PIX_FMT_MPEG2:
+		size = coda_mpeg2_parse_headers(ctx, vaddr, payload);
+		break;
+	case V4L2_PIX_FMT_MPEG4:
+		size = coda_mpeg4_parse_headers(ctx, vaddr, payload);
+		break;
+	default:
+		break;
+	}
+
+	return size;
+}
+
 static bool coda_bitstream_try_queue(struct coda_ctx *ctx,
 				     struct vb2_v4l2_buffer *src_buf)
 {
 	unsigned long payload = vb2_get_plane_payload(&src_buf->vb2_buf, 0);
 	u8 *vaddr = vb2_plane_vaddr(&src_buf->vb2_buf, 0);
 	int ret;
+	int i;
 
 	if (coda_get_bitstream_payload(ctx) + payload + 512 >=
 	    ctx->bitstream.size)
@@ -222,10 +244,41 @@ static bool coda_bitstream_try_queue(struct coda_ctx *ctx,
 		return true;
 	}
 
-	/* Add zero padding before the first H.264 buffer, if it is too small */
+	if (ctx->qsequence == 0 && payload < 512) {
+		/*
+		 * Add padding after the first buffer, if it is too small to be
+		 * fetched by the CODA, by repeating the headers. Without
+		 * repeated headers, or the first frame already queued, decoder
+		 * sequence initialization fails with error code 0x2000 on i.MX6
+		 * or error code 0x1 on i.MX51.
+		 */
+		u32 header_size = coda_buffer_parse_headers(ctx, src_buf,
+							    payload);
+
+		if (header_size) {
+			coda_dbg(1, ctx, "pad with %u-byte header\n",
+				 header_size);
+			for (i = payload; i < 512; i += header_size) {
+				ret = coda_bitstream_queue(ctx, vaddr,
+							   header_size);
+				if (ret < 0) {
+					v4l2_err(&ctx->dev->v4l2_dev,
+						 "bitstream buffer overflow\n");
+					return false;
+				}
+				if (ctx->dev->devtype->product == CODA_960)
+					break;
+			}
+		} else {
+			coda_dbg(1, ctx,
+				 "could not parse header, sequence initialization might fail\n");
+		}
+	}
+
+	/* Add padding before the first buffer, if it is too small */
 	if (ctx->qsequence == 0 && payload < 512 &&
 	    ctx->codec->src_fourcc == V4L2_PIX_FMT_H264)
-		coda_bitstream_pad(ctx, 512 - payload);
+		coda_h264_bitstream_pad(ctx, 512 - payload);
 
 	ret = coda_bitstream_queue(ctx, vaddr, payload);
 	if (ret < 0) {
diff --git a/drivers/media/platform/coda/coda-mpeg2.c b/drivers/media/platform/coda/coda-mpeg2.c
index 73e50dabce19..6f3f6721d286 100644
--- a/drivers/media/platform/coda/coda-mpeg2.c
+++ b/drivers/media/platform/coda/coda-mpeg2.c
@@ -42,3 +42,46 @@ int coda_mpeg2_level(int level_idc)
 		return -EINVAL;
 	}
 }
+
+/*
+ * Check if the buffer starts with the MPEG-2 sequence header (with or without
+ * quantization matrix) and extension header, for example:
+ *
+ *   00 00 01 b3 2d 01 e0 34 08 8b a3 81
+ *               10 11 11 12 12 12 13 13 13 13 14 14 14 14 14 15
+ *               15 15 15 15 15 16 16 16 16 16 16 16 17 17 17 17
+ *               17 17 17 17 18 18 18 19 18 18 18 19 1a 1a 1a 1a
+ *               19 1b 1b 1b 1b 1b 1c 1c 1c 1c 1e 1e 1e 1f 1f 21
+ *   00 00 01 b5 14 8a 00 01 00 00
+ *
+ * or:
+ *
+ *   00 00 01 b3 08 00 40 15 ff ff e0 28
+ *   00 00 01 b5 14 8a 00 01 00 00
+ *
+ * Returns the detected header size in bytes or 0.
+ */
+u32 coda_mpeg2_parse_headers(struct coda_ctx *ctx, u8 *buf, u32 size)
+{
+	static const u8 sequence_header_start[4] = { 0x00, 0x00, 0x01, 0xb3 };
+	static const union {
+		u8 extension_start[4];
+		u8 start_code_prefix[3];
+	} u = { { 0x00, 0x00, 0x01, 0xb5 } };
+
+	if (size < 22 ||
+	    memcmp(buf, sequence_header_start, 4) != 0)
+		return 0;
+
+	if ((size == 22 ||
+	     (size >= 25 && memcmp(buf + 22, u.start_code_prefix, 3) == 0)) &&
+	    memcmp(buf + 12, u.extension_start, 4) == 0)
+		return 22;
+
+	if ((size == 86 ||
+	     (size > 89 && memcmp(buf + 86, u.start_code_prefix, 3) == 0)) &&
+	    memcmp(buf + 76, u.extension_start, 4) == 0)
+		return 86;
+
+	return 0;
+}
diff --git a/drivers/media/platform/coda/coda-mpeg4.c b/drivers/media/platform/coda/coda-mpeg4.c
index c3aca763c320..483a4fba1b4f 100644
--- a/drivers/media/platform/coda/coda-mpeg4.c
+++ b/drivers/media/platform/coda/coda-mpeg4.c
@@ -47,3 +47,41 @@ int coda_mpeg4_level(int level_idc)
 		return -EINVAL;
 	}
 }
+
+/*
+ * Check if the buffer starts with the MPEG-4 visual object sequence and visual
+ * object headers, for example:
+ *
+ *   00 00 01 b0 f1
+ *   00 00 01 b5 a9 13 00 00 01 00 00 00 01 20 08
+ *               d4 8d 88 00 f5 04 04 08 14 30 3f
+ *
+ * Returns the detected header size in bytes or 0.
+ */
+u32 coda_mpeg4_parse_headers(struct coda_ctx *ctx, u8 *buf, u32 size)
+{
+	static const u8 vos_start[4] = { 0x00, 0x00, 0x01, 0xb0 };
+	static const union {
+		u8 vo_start[4];
+		u8 start_code_prefix[3];
+	} u = { { 0x00, 0x00, 0x01, 0xb5 } };
+
+	if (size < 30 ||
+	    memcmp(buf, vos_start, 4) != 0 ||
+	    memcmp(buf + 5, u.vo_start, 4) != 0)
+		return 0;
+
+	if (size == 30 ||
+	    (size >= 33 && memcmp(buf + 30, u.start_code_prefix, 3) == 0))
+		return 30;
+
+	if (size == 31 ||
+	    (size >= 34 && memcmp(buf + 31, u.start_code_prefix, 3) == 0))
+		return 31;
+
+	if (size == 32 ||
+	    (size >= 35 && memcmp(buf + 32, u.start_code_prefix, 3) == 0))
+		return 32;
+
+	return 0;
+}
diff --git a/drivers/media/platform/coda/coda.h b/drivers/media/platform/coda/coda.h
index 10207e9534c2..12bbd3129269 100644
--- a/drivers/media/platform/coda/coda.h
+++ b/drivers/media/platform/coda/coda.h
@@ -338,8 +338,10 @@ int coda_h264_sps_fixup(struct coda_ctx *ctx, int width, int height, char *buf,
 
 int coda_mpeg2_profile(int profile_idc);
 int coda_mpeg2_level(int level_idc);
+u32 coda_mpeg2_parse_headers(struct coda_ctx *ctx, u8 *buf, u32 size);
 int coda_mpeg4_profile(int profile_idc);
 int coda_mpeg4_level(int level_idc);
+u32 coda_mpeg4_parse_headers(struct coda_ctx *ctx, u8 *buf, u32 size);
 
 void coda_update_profile_level_ctrls(struct coda_ctx *ctx, u8 profile_idc,
 				     u8 level_idc);
-- 
2.20.1

