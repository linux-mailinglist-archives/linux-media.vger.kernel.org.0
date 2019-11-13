Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5EFE2FB331
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2019 16:06:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727892AbfKMPGD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Nov 2019 10:06:03 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:46317 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727874AbfKMPGD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Nov 2019 10:06:03 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1iUuDZ-00064Z-0p; Wed, 13 Nov 2019 16:06:01 +0100
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
Subject: [PATCH 5/5] media: mtk-jpeg: use V4L2 JPEG helpers
Date:   Wed, 13 Nov 2019 16:05:38 +0100
Message-Id: <20191113150538.9807-6-p.zabel@pengutronix.de>
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
 drivers/media/platform/Kconfig                |   1 +
 .../media/platform/mtk-jpeg/mtk_jpeg_parse.c  | 138 +++---------------
 2 files changed, 21 insertions(+), 118 deletions(-)

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index 9e338bd26df2..8c0d890249f5 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -205,6 +205,7 @@ config VIDEO_MEDIATEK_JPEG
 	depends on VIDEO_DEV && VIDEO_V4L2
 	depends on ARCH_MEDIATEK || COMPILE_TEST
 	select VIDEOBUF2_DMA_CONTIG
+	select V4L2_JPEG_HELPER
 	select V4L2_MEM2MEM_DEV
 	help
 	  Mediatek jpeg codec driver provides HW capability to decode
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_parse.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_parse.c
index f862d38f3af7..47b27db14b97 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_parse.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_parse.c
@@ -7,137 +7,39 @@
 
 #include <linux/kernel.h>
 #include <linux/videodev2.h>
+#include <media/v4l2-jpeg.h>
 
 #include "mtk_jpeg_parse.h"
 
-#define TEM	0x01
-#define SOF0	0xc0
-#define RST	0xd0
-#define SOI	0xd8
-#define EOI	0xd9
-
-struct mtk_jpeg_stream {
-	u8 *addr;
-	u32 size;
-	u32 curr;
-};
-
-static int read_byte(struct mtk_jpeg_stream *stream)
-{
-	if (stream->curr >= stream->size)
-		return -1;
-	return stream->addr[stream->curr++];
-}
-
-static int read_word_be(struct mtk_jpeg_stream *stream, u32 *word)
-{
-	u32 temp;
-	int byte;
-
-	byte = read_byte(stream);
-	if (byte == -1)
-		return -1;
-	temp = byte << 8;
-	byte = read_byte(stream);
-	if (byte == -1)
-		return -1;
-	*word = (u32)byte | temp;
-
-	return 0;
-}
-
-static void read_skip(struct mtk_jpeg_stream *stream, long len)
-{
-	if (len <= 0)
-		return;
-	while (len--)
-		read_byte(stream);
-}
-
 static bool mtk_jpeg_do_parse(struct mtk_jpeg_dec_param *param, u8 *src_addr_va,
 			      u32 src_size)
 {
-	bool notfound = true;
-	struct mtk_jpeg_stream stream;
-
-	stream.addr = src_addr_va;
-	stream.size = src_size;
-	stream.curr = 0;
-
-	while (notfound) {
-		int i, length, byte;
-		u32 word;
-
-		byte = read_byte(&stream);
-		if (byte == -1)
-			return false;
-		if (byte != 0xff)
-			continue;
-		do
-			byte = read_byte(&stream);
-		while (byte == 0xff);
-		if (byte == -1)
-			return false;
-		if (byte == 0)
-			continue;
-
-		length = 0;
-		switch (byte) {
-		case SOF0:
-			/* length */
-			if (read_word_be(&stream, &word))
-				break;
-
-			/* precision */
-			if (read_byte(&stream) == -1)
-				break;
+	struct v4l2_jpeg_header header;
+	int i, ret;
 
-			if (read_word_be(&stream, &word))
-				break;
-			param->pic_h = word;
-
-			if (read_word_be(&stream, &word))
-				break;
-			param->pic_w = word;
-
-			param->comp_num = read_byte(&stream);
-			if (param->comp_num != 1 && param->comp_num != 3)
-				break;
+	memset(&header, 0, sizeof(header));
+	ret = v4l2_jpeg_parse_header(src_addr_va, src_size, &header);
+	if (ret < 0)
+		return false;
 
-			for (i = 0; i < param->comp_num; i++) {
-				param->comp_id[i] = read_byte(&stream);
-				if (param->comp_id[i] == -1)
-					break;
+	param->pic_h = header.frame.height;
+	param->pic_w = header.frame.width;
+	param->comp_num = header.frame.num_components;
 
-				/* sampling */
-				byte = read_byte(&stream);
-				if (byte == -1)
-					break;
-				param->sampling_w[i] = (byte >> 4) & 0x0F;
-				param->sampling_h[i] = byte & 0x0F;
+	if (param->comp_num != 1 && param->comp_num != 3)
+		return false;
 
-				param->qtbl_num[i] = read_byte(&stream);
-				if (param->qtbl_num[i] == -1)
-					break;
-			}
+	for (i = 0; i < param->comp_num; i++) {
+		struct v4l2_jpeg_frame_component_spec *component;
 
-			notfound = !(i == param->comp_num);
-			break;
-		case RST ... RST + 7:
-		case SOI:
-		case EOI:
-		case TEM:
-			break;
-		default:
-			if (read_word_be(&stream, &word))
-				break;
-			length = (long)word - 2;
-			read_skip(&stream, length);
-			break;
-		}
+		component = &header.frame.component[i];
+		param->comp_id[i] = component->component_identifier;
+		param->sampling_w[i] = component->horizontal_sampling_factor;
+		param->sampling_h[i] = component->vertical_sampling_factor;
+		param->qtbl_num[i] = component->quantization_table_selector;
 	}
 
-	return !notfound;
+	return true;
 }
 
 bool mtk_jpeg_parse(struct mtk_jpeg_dec_param *param, u8 *src_addr_va,
-- 
2.20.1

