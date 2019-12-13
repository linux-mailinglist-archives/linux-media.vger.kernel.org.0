Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D14611E7DE
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2019 17:16:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728135AbfLMQP3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Dec 2019 11:15:29 -0500
Received: from mailoutvs49.siol.net ([185.57.226.240]:33435 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726404AbfLMQP3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Dec 2019 11:15:29 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 3BE81524590;
        Fri, 13 Dec 2019 17:15:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id u7aoalwzI-9y; Fri, 13 Dec 2019 17:15:24 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id CB25B524592;
        Fri, 13 Dec 2019 17:15:24 +0100 (CET)
Received: from localhost.localdomain (cpe-86-58-102-7.static.triera.net [86.58.102.7])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id 81DA85245AF;
        Fri, 13 Dec 2019 17:15:22 +0100 (CET)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mchehab@kernel.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, hverkuil@xs4all.nl
Cc:     gregkh@linuxfoundation.org, wens@csie.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] media: cedrus: Fix decoding for some HEVC videos
Date:   Fri, 13 Dec 2019 17:15:15 +0100
Message-Id: <20191213161516.54688-2-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191213161516.54688-1-jernej.skrabec@siol.net>
References: <20191213161516.54688-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It seems that for some HEVC videos at least one bitstream parsing
trigger must be called in order to be decoded correctly. There is no
explanation why this helps, but it was observed that several videos
with this fix are now decoded correctly and there is no regression with
others.

Without this fix, those same videos totally crash HEVC decoder (other
decoder engines are unaffected). After decoding those problematic
videos, HEVC decoder always returns only green image (all zeros).
Only complete HW reset helps.

This fix is similar to that for H264.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 .../staging/media/sunxi/cedrus/cedrus_h265.c  | 25 ++++++++++++++++---
 .../staging/media/sunxi/cedrus/cedrus_regs.h  |  1 +
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/s=
taging/media/sunxi/cedrus/cedrus_h265.c
index 109d3289418c..5a207f1e137c 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
@@ -7,6 +7,7 @@
  * Copyright (C) 2018 Bootlin
  */
=20
+#include <linux/delay.h>
 #include <linux/types.h>
=20
 #include <media/videobuf2-dma-contig.h>
@@ -283,6 +284,23 @@ static void cedrus_h265_write_scaling_list(struct ce=
drus_ctx *ctx,
 		}
 }
=20
+static void cedrus_h265_skip_bits(struct cedrus_dev *dev, int num)
+{
+	int count =3D 0;
+
+	while (count < num) {
+		int tmp =3D min(num - count, 32);
+
+		cedrus_write(dev, VE_DEC_H265_TRIGGER,
+			     VE_DEC_H265_TRIGGER_FLUSH_BITS |
+			     VE_DEC_H265_TRIGGER_TYPE_N_BITS(tmp));
+		while (cedrus_read(dev, VE_DEC_H265_STATUS) & VE_DEC_H265_STATUS_VLD_B=
USY)
+			udelay(1);
+
+		count +=3D tmp;
+	}
+}
+
 static void cedrus_h265_setup(struct cedrus_ctx *ctx,
 			      struct cedrus_run *run)
 {
@@ -347,10 +365,9 @@ static void cedrus_h265_setup(struct cedrus_ctx *ctx=
,
=20
 	/* Source offset and length in bits. */
=20
-	reg =3D slice_params->data_bit_offset;
-	cedrus_write(dev, VE_DEC_H265_BITS_OFFSET, reg);
+	cedrus_write(dev, VE_DEC_H265_BITS_OFFSET, 0);
=20
-	reg =3D slice_params->bit_size - slice_params->data_bit_offset;
+	reg =3D slice_params->bit_size;
 	cedrus_write(dev, VE_DEC_H265_BITS_LEN, reg);
=20
 	/* Source beginning and end addresses. */
@@ -385,6 +402,8 @@ static void cedrus_h265_setup(struct cedrus_ctx *ctx,
 	/* Initialize bitstream access. */
 	cedrus_write(dev, VE_DEC_H265_TRIGGER, VE_DEC_H265_TRIGGER_INIT_SWDEC);
=20
+	cedrus_h265_skip_bits(dev, slice_params->data_bit_offset);
+
 	/* Bitstream parameters. */
=20
 	reg =3D VE_DEC_H265_DEC_NAL_HDR_NAL_UNIT_TYPE(slice_params->nal_unit_ty=
pe) |
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h b/drivers/s=
taging/media/sunxi/cedrus/cedrus_regs.h
index 0d9449fe2b28..df1cceef8d93 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
@@ -424,6 +424,7 @@
=20
 #define VE_DEC_H265_TRIGGER			(VE_ENGINE_DEC_H265 + 0x34)
=20
+#define VE_DEC_H265_TRIGGER_TYPE_N_BITS(x)	(((x) & 0x3f) << 8)
 #define VE_DEC_H265_TRIGGER_STCD_VC1		(0x02 << 4)
 #define VE_DEC_H265_TRIGGER_STCD_AVS		(0x01 << 4)
 #define VE_DEC_H265_TRIGGER_STCD_HEVC		(0x00 << 4)
--=20
2.24.0

