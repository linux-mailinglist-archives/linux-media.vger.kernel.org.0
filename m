Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28ABF303F7
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2019 23:15:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726736AbfE3VPl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 May 2019 17:15:41 -0400
Received: from mailoutvs15.siol.net ([185.57.226.206]:55376 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726100AbfE3VPl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 May 2019 17:15:41 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 315DB522886;
        Thu, 30 May 2019 23:15:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id PPEPfU0nYuBA; Thu, 30 May 2019 23:15:37 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id D4DE45228C1;
        Thu, 30 May 2019 23:15:37 +0200 (CEST)
Received: from localhost.localdomain (cpe-86-58-52-202.static.triera.net [86.58.52.202])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id 8FA5F522886;
        Thu, 30 May 2019 23:15:35 +0200 (CEST)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     paul.kocialkowski@bootlin.com, maxime.ripard@bootlin.com
Cc:     wens@csie.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] media: cedrus: Fix decoding for some H264 videos
Date:   Thu, 30 May 2019 23:15:12 +0200
Message-Id: <20190530211516.1891-4-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190530211516.1891-1-jernej.skrabec@siol.net>
References: <20190530211516.1891-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It seems that for some H264 videos at least one bitstream parsing
trigger must be called in order to be decoded correctly. There is no
explanation why this helps, but it was observed that two sample videos
with this fix are now decoded correctly and there is no regression with
others.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
I have two samples which are fixed by this:
http://jernej.libreelec.tv/videos/h264/test.mkv
http://jernej.libreelec.tv/videos/h264/Dredd%20%E2%80%93%20DTS%20Sound%20=
Check%20DTS-HD%20MA%207.1.m2ts

Although second one also needs support for multi-slice frames, which is n=
ot yet implemented here.

 .../staging/media/sunxi/cedrus/cedrus_h264.c  | 22 ++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/s=
taging/media/sunxi/cedrus/cedrus_h264.c
index cc8d17f211a1..d0ee3f90ff46 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
@@ -6,6 +6,7 @@
  * Copyright (c) 2018 Bootlin
  */
=20
+#include <linux/delay.h>
 #include <linux/types.h>
=20
 #include <media/videobuf2-dma-contig.h>
@@ -289,6 +290,20 @@ static void cedrus_write_pred_weight_table(struct ce=
drus_ctx *ctx,
 	}
 }
=20
+static void cedrus_skip_bits(struct cedrus_dev *dev, int num)
+{
+	for (; num > 32; num -=3D 32) {
+		cedrus_write(dev, VE_H264_TRIGGER_TYPE, 0x3 | (32 << 8));
+		while (cedrus_read(dev, VE_H264_STATUS) & (1 << 8))
+			udelay(1);
+	}
+	if (num > 0) {
+		cedrus_write(dev, VE_H264_TRIGGER_TYPE, 0x3 | (num << 8));
+		while (cedrus_read(dev, VE_H264_STATUS) & (1 << 8))
+			udelay(1);
+	}
+}
+
 static void cedrus_set_params(struct cedrus_ctx *ctx,
 			      struct cedrus_run *run)
 {
@@ -299,12 +314,11 @@ static void cedrus_set_params(struct cedrus_ctx *ct=
x,
 	struct vb2_buffer *src_buf =3D &run->src->vb2_buf;
 	struct cedrus_dev *dev =3D ctx->dev;
 	dma_addr_t src_buf_addr;
-	u32 offset =3D slice->header_bit_size;
-	u32 len =3D (slice->size * 8) - offset;
+	u32 len =3D slice->size * 8;
 	u32 reg;
=20
 	cedrus_write(dev, VE_H264_VLD_LEN, len);
-	cedrus_write(dev, VE_H264_VLD_OFFSET, offset);
+	cedrus_write(dev, VE_H264_VLD_OFFSET, 0);
=20
 	src_buf_addr =3D vb2_dma_contig_plane_dma_addr(src_buf, 0);
 	cedrus_write(dev, VE_H264_VLD_END,
@@ -323,6 +337,8 @@ static void cedrus_set_params(struct cedrus_ctx *ctx,
 	cedrus_write(dev, VE_H264_TRIGGER_TYPE,
 		     VE_H264_TRIGGER_TYPE_INIT_SWDEC);
=20
+	cedrus_skip_bits(dev, slice->header_bit_size);
+
 	if (((pps->flags & V4L2_H264_PPS_FLAG_WEIGHTED_PRED) &&
 	     (slice->slice_type =3D=3D V4L2_H264_SLICE_TYPE_P ||
 	      slice->slice_type =3D=3D V4L2_H264_SLICE_TYPE_SP)) ||
--=20
2.21.0

