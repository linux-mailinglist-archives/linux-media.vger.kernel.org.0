Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E806FB32F
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2019 16:06:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727859AbfKMPGA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Nov 2019 10:06:00 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:34149 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727820AbfKMPGA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Nov 2019 10:06:00 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1iUuDX-00064Z-6y; Wed, 13 Nov 2019 16:05:59 +0100
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
        Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Rick Chang <rick.chang@mediatek.com>,
        Bin Liu <bin.liu@mediatek.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Mirela Rabulea <mirela.rabulea@nxp.com>, kernel@pengutronix.de
Subject: [PATCH 3/5] media: rcar_jpu: use V4L2 JPEG helpers
Date:   Wed, 13 Nov 2019 16:05:36 +0100
Message-Id: <20191113150538.9807-4-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191113150538.9807-1-p.zabel@pengutronix.de>
References: <20191113150538.9807-1-p.zabel@pengutronix.de>
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

Use the v4l2 JPEG helpers for header parsing.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/media/platform/Kconfig    |  1 +
 drivers/media/platform/rcar_jpu.c | 94 +++++--------------------------
 2 files changed, 16 insertions(+), 79 deletions(-)

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index c989a2a45c60..34b634c5fcd2 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -414,6 +414,7 @@ config VIDEO_RENESAS_JPU
 	depends on VIDEO_DEV && VIDEO_V4L2
 	depends on ARCH_RENESAS || COMPILE_TEST
 	select VIDEOBUF2_DMA_CONTIG
+	select V4L2_JPEG_HELPER
 	select V4L2_MEM2MEM_DEV
 	help
 	  This is a V4L2 driver for the Renesas JPEG Processing Unit.
diff --git a/drivers/media/platform/rcar_jpu.c b/drivers/media/platform/rcar_jpu.c
index 1c3f507acfc9..ccbe9acf7d01 100644
--- a/drivers/media/platform/rcar_jpu.c
+++ b/drivers/media/platform/rcar_jpu.c
@@ -32,6 +32,7 @@
 #include <media/v4l2-device.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-fh.h>
+#include <media/v4l2-jpeg.h>
 #include <media/v4l2-mem2mem.h>
 #include <media/v4l2-ioctl.h>
 #include <media/videobuf2-v4l2.h>
@@ -283,16 +284,6 @@ struct jpu_ctx {
 	struct v4l2_ctrl_handler ctrl_handler;
 };
 
- /**
- * jpeg_buffer - description of memory containing input JPEG data
- * @end: end position in the buffer
- * @curr: current position in the buffer
- */
-struct jpeg_buffer {
-	void *end;
-	void *curr;
-};
-
 static struct jpu_fmt jpu_formats[] = {
 	{ V4L2_PIX_FMT_JPEG, V4L2_COLORSPACE_JPEG,
 	  {0, 0}, 0, 0, 0, 1, JPU_ENC_CAPTURE | JPU_DEC_OUTPUT },
@@ -575,39 +566,11 @@ static void jpu_generate_hdr(unsigned short quality, unsigned char *p)
 		 JPU_JPEG_HACTBL_SIZE);
 }
 
-static int get_byte(struct jpeg_buffer *buf)
-{
-	if (buf->curr >= buf->end)
-		return -1;
-
-	return *(u8 *)buf->curr++;
-}
-
-static int get_word_be(struct jpeg_buffer *buf, unsigned int *word)
-{
-	if (buf->end - buf->curr < 2)
-		return -1;
-
-	*word = get_unaligned_be16(buf->curr);
-	buf->curr += 2;
-
-	return 0;
-}
-
-static void skip(struct jpeg_buffer *buf, unsigned long len)
-{
-	buf->curr += min((unsigned long)(buf->end - buf->curr), len);
-}
-
 static u8 jpu_parse_hdr(void *buffer, unsigned long size, unsigned int *width,
 			  unsigned int *height)
 {
-	struct jpeg_buffer jpeg_buffer;
-	unsigned int word;
-	bool soi = false;
-
-	jpeg_buffer.end = buffer + size;
-	jpeg_buffer.curr = buffer;
+	struct v4l2_jpeg_header header;
+	int ret;
 
 	/*
 	 * basic size check and EOI - we don't want to let JPU cross
@@ -616,46 +579,19 @@ static u8 jpu_parse_hdr(void *buffer, unsigned long size, unsigned int *width,
 	if (size < JPU_JPEG_MIN_SIZE || *(u8 *)(buffer + size - 1) != EOI)
 		return 0;
 
-	for (;;) {
-		int c;
-
-		/* skip preceding filler bytes */
-		do
-			c = get_byte(&jpeg_buffer);
-		while (c == 0xff || c == 0);
-
-		if (!soi && c == SOI) {
-			soi = true;
-			continue;
-		} else if (soi != (c != SOI))
-			return 0;
-
-		switch (c) {
-		case SOF0: /* SOF0: baseline JPEG */
-			skip(&jpeg_buffer, 3); /* segment length and bpp */
-			if (get_word_be(&jpeg_buffer, height) ||
-			    get_word_be(&jpeg_buffer, width) ||
-			    get_byte(&jpeg_buffer) != 3) /* YCbCr only */
-				return 0;
-
-			skip(&jpeg_buffer, 1);
-			return get_byte(&jpeg_buffer);
-		case DHT:
-		case DQT:
-		case COM:
-		case DRI:
-		case APP0 ... APP0 + 0x0f:
-			if (get_word_be(&jpeg_buffer, &word))
-				return 0;
-			skip(&jpeg_buffer, (long)word - 2);
-		case 0:
-			break;
-		default:
-			return 0;
-		}
-	}
+	memset(&header, 0, sizeof(header));
+	ret = v4l2_jpeg_parse_header(buffer, size, &header);
+	if (ret < 0)
+		return 0;
 
-	return 0;
+	if (header.frame.num_components != 3) /* YCbCr only */
+		return 0;
+
+	*width = header.frame.width;
+	*height = header.frame.height;
+
+	return (header.frame.component[0].horizontal_sampling_factor << 4) |
+		header.frame.component[0].vertical_sampling_factor;
 }
 
 static int jpu_querycap(struct file *file, void *priv,
-- 
2.20.1

