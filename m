Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5DF9F2052
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2019 22:06:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732266AbfKFVGI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Nov 2019 16:06:08 -0500
Received: from mailoutvs11.siol.net ([185.57.226.202]:38600 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727794AbfKFVGG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Nov 2019 16:06:06 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 9B324524D62;
        Wed,  6 Nov 2019 22:06:04 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta10.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta10.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id DSO8c53uem2K; Wed,  6 Nov 2019 22:06:04 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 140F75255FC;
        Wed,  6 Nov 2019 22:06:04 +0100 (CET)
Received: from localhost.localdomain (cpe-86-58-102-7.static.triera.net [86.58.102.7])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id 93D6C524D62;
        Wed,  6 Nov 2019 22:06:01 +0100 (CET)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mripard@kernel.org, paul.kocialkowski@bootlin.com,
        hverkuil-cisco@xs4all.nl
Cc:     mchehab@kernel.org, gregkh@linuxfoundation.org, wens@csie.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: [PATCH v2 1/3] media: cedrus: Properly signal size in mode register
Date:   Wed,  6 Nov 2019 22:05:36 +0100
Message-Id: <20191106210538.3474-2-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191106210538.3474-1-jernej.skrabec@siol.net>
References: <20191106210538.3474-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Mode register also holds information if video width is bigger than 2048
and if it is equal to 4096.

Rework cedrus_engine_enable() to properly signal this properties.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
Acked-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_h264.c  | 2 +-
 drivers/staging/media/sunxi/cedrus/cedrus_h265.c  | 2 +-
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c    | 9 +++++++--
 drivers/staging/media/sunxi/cedrus/cedrus_hw.h    | 2 +-
 drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c | 2 +-
 drivers/staging/media/sunxi/cedrus/cedrus_regs.h  | 2 ++
 6 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/s=
taging/media/sunxi/cedrus/cedrus_h264.c
index 7487f6ab7576..d2c854ecdf15 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
@@ -485,7 +485,7 @@ static void cedrus_h264_setup(struct cedrus_ctx *ctx,
 {
 	struct cedrus_dev *dev =3D ctx->dev;
=20
-	cedrus_engine_enable(dev, CEDRUS_CODEC_H264);
+	cedrus_engine_enable(ctx, CEDRUS_CODEC_H264);
=20
 	cedrus_write(dev, VE_H264_SDROT_CTRL, 0);
 	cedrus_write(dev, VE_H264_EXTRA_BUFFER1,
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/s=
taging/media/sunxi/cedrus/cedrus_h265.c
index 9bc921866f70..6945dc74e1d7 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
@@ -276,7 +276,7 @@ static void cedrus_h265_setup(struct cedrus_ctx *ctx,
 	}
=20
 	/* Activate H265 engine. */
-	cedrus_engine_enable(dev, CEDRUS_CODEC_H265);
+	cedrus_engine_enable(ctx, CEDRUS_CODEC_H265);
=20
 	/* Source offset and length in bits. */
=20
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/sta=
ging/media/sunxi/cedrus/cedrus_hw.c
index 570a9165dd5d..3acfa21bc124 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
@@ -30,7 +30,7 @@
 #include "cedrus_hw.h"
 #include "cedrus_regs.h"
=20
-int cedrus_engine_enable(struct cedrus_dev *dev, enum cedrus_codec codec=
)
+int cedrus_engine_enable(struct cedrus_ctx *ctx, enum cedrus_codec codec=
)
 {
 	u32 reg =3D 0;
=20
@@ -58,7 +58,12 @@ int cedrus_engine_enable(struct cedrus_dev *dev, enum =
cedrus_codec codec)
 		return -EINVAL;
 	}
=20
-	cedrus_write(dev, VE_MODE, reg);
+	if (ctx->src_fmt.width =3D=3D 4096)
+		reg |=3D VE_MODE_PIC_WIDTH_IS_4096;
+	if (ctx->src_fmt.width > 2048)
+		reg |=3D VE_MODE_PIC_WIDTH_MORE_2048;
+
+	cedrus_write(ctx->dev, VE_MODE, reg);
=20
 	return 0;
 }
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.h b/drivers/sta=
ging/media/sunxi/cedrus/cedrus_hw.h
index 27d0882397aa..604ff932fbf5 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.h
@@ -16,7 +16,7 @@
 #ifndef _CEDRUS_HW_H_
 #define _CEDRUS_HW_H_
=20
-int cedrus_engine_enable(struct cedrus_dev *dev, enum cedrus_codec codec=
);
+int cedrus_engine_enable(struct cedrus_ctx *ctx, enum cedrus_codec codec=
);
 void cedrus_engine_disable(struct cedrus_dev *dev);
=20
 void cedrus_dst_format_set(struct cedrus_dev *dev,
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c b/drivers/=
staging/media/sunxi/cedrus/cedrus_mpeg2.c
index 13c34927bad5..8bcd6b8f9e2d 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
@@ -96,7 +96,7 @@ static void cedrus_mpeg2_setup(struct cedrus_ctx *ctx, =
struct cedrus_run *run)
 	quantization =3D run->mpeg2.quantization;
=20
 	/* Activate MPEG engine. */
-	cedrus_engine_enable(dev, CEDRUS_CODEC_MPEG2);
+	cedrus_engine_enable(ctx, CEDRUS_CODEC_MPEG2);
=20
 	/* Set intra quantization matrix. */
=20
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h b/drivers/s=
taging/media/sunxi/cedrus/cedrus_regs.h
index 4275a307d282..ace3d49fcd82 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
@@ -35,6 +35,8 @@
=20
 #define VE_MODE					0x00
=20
+#define VE_MODE_PIC_WIDTH_IS_4096		BIT(22)
+#define VE_MODE_PIC_WIDTH_MORE_2048		BIT(21)
 #define VE_MODE_REC_WR_MODE_2MB			(0x01 << 20)
 #define VE_MODE_REC_WR_MODE_1MB			(0x00 << 20)
 #define VE_MODE_DDR_MODE_BW_128			(0x03 << 16)
--=20
2.24.0

