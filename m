Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E24032CC3F5
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 18:40:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726524AbgLBRit (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 12:38:49 -0500
Received: from mailoutvs33.siol.net ([185.57.226.224]:38953 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726061AbgLBRit (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Dec 2020 12:38:49 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id E2BA4520BC0;
        Wed,  2 Dec 2020 18:38:06 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta09.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta09.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id 9W8g8N5VEJ-i; Wed,  2 Dec 2020 18:38:06 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 6609D5208E4;
        Wed,  2 Dec 2020 18:38:06 +0100 (CET)
Received: from kista.localdomain (cpe1-5-97.cable.triera.net [213.161.5.97])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id D8F2C520BC0;
        Wed,  2 Dec 2020 18:38:05 +0100 (CET)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mripard@kernel.org, hverkuil@xs4all.nl
Cc:     paul.kocialkowski@bootlin.com, mchehab@kernel.org, wens@csie.org,
        jernej.skrabec@siol.net, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: cedrus: Make VP8 codec as capability
Date:   Wed,  2 Dec 2020 18:44:13 +0100
Message-Id: <20201202174413.303658-1-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Commit 31d9b9ef8564 ("media: cedrus: Register all codecs as capability")
makes separate capability flags for each codec. However, VP8 codec was
merged at the same time as mentioned patch, so there is no capability
flag for it.

This patch adds capability flag for VP8 and enables it for all variants
except for V3s.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
Note: this should be merged after both of these PRs:
https://patchwork.linuxtv.org/project/linux-media/patch/8cf5021f-559c-5ea=
8-f1f0-250c00bc119d@xs4all.nl/
https://patchwork.linuxtv.org/project/linux-media/patch/5dbd468d-1d10-e0c=
8-43f0-ebe8f17abef8@xs4all.nl/

 drivers/staging/media/sunxi/cedrus/cedrus.c   | 27 ++++++++++++-------
 drivers/staging/media/sunxi/cedrus/cedrus.h   |  1 +
 .../staging/media/sunxi/cedrus/cedrus_video.c |  1 +
 3 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/stagin=
g/media/sunxi/cedrus/cedrus.c
index dce7cbc95872..c0f226d75feb 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -495,26 +495,30 @@ static int cedrus_remove(struct platform_device *pd=
ev)
=20
 static const struct cedrus_variant sun4i_a10_cedrus_variant =3D {
 	.capabilities	=3D CEDRUS_CAPABILITY_MPEG2_DEC |
-			  CEDRUS_CAPABILITY_H264_DEC,
+			  CEDRUS_CAPABILITY_H264_DEC |
+			  CEDRUS_CAPABILITY_VP8_DEC,
 	.mod_rate	=3D 320000000,
 };
=20
 static const struct cedrus_variant sun5i_a13_cedrus_variant =3D {
 	.capabilities	=3D CEDRUS_CAPABILITY_MPEG2_DEC |
-			  CEDRUS_CAPABILITY_H264_DEC,
+			  CEDRUS_CAPABILITY_H264_DEC |
+			  CEDRUS_CAPABILITY_VP8_DEC,
 	.mod_rate	=3D 320000000,
 };
=20
 static const struct cedrus_variant sun7i_a20_cedrus_variant =3D {
 	.capabilities	=3D CEDRUS_CAPABILITY_MPEG2_DEC |
-			  CEDRUS_CAPABILITY_H264_DEC,
+			  CEDRUS_CAPABILITY_H264_DEC |
+			  CEDRUS_CAPABILITY_VP8_DEC,
 	.mod_rate	=3D 320000000,
 };
=20
 static const struct cedrus_variant sun8i_a33_cedrus_variant =3D {
 	.capabilities	=3D CEDRUS_CAPABILITY_UNTILED |
 			  CEDRUS_CAPABILITY_MPEG2_DEC |
-			  CEDRUS_CAPABILITY_H264_DEC,
+			  CEDRUS_CAPABILITY_H264_DEC |
+			  CEDRUS_CAPABILITY_VP8_DEC,
 	.mod_rate	=3D 320000000,
 };
=20
@@ -522,7 +526,8 @@ static const struct cedrus_variant sun8i_h3_cedrus_va=
riant =3D {
 	.capabilities	=3D CEDRUS_CAPABILITY_UNTILED |
 			  CEDRUS_CAPABILITY_MPEG2_DEC |
 			  CEDRUS_CAPABILITY_H264_DEC |
-			  CEDRUS_CAPABILITY_H265_DEC,
+			  CEDRUS_CAPABILITY_H265_DEC |
+			  CEDRUS_CAPABILITY_VP8_DEC,
 	.mod_rate	=3D 402000000,
 };
=20
@@ -535,7 +540,8 @@ static const struct cedrus_variant sun8i_v3s_cedrus_v=
ariant =3D {
 static const struct cedrus_variant sun8i_r40_cedrus_variant =3D {
 	.capabilities	=3D CEDRUS_CAPABILITY_UNTILED |
 			  CEDRUS_CAPABILITY_MPEG2_DEC |
-			  CEDRUS_CAPABILITY_H264_DEC,
+			  CEDRUS_CAPABILITY_H264_DEC |
+			  CEDRUS_CAPABILITY_VP8_DEC,
 	.mod_rate	=3D 297000000,
 };
=20
@@ -543,7 +549,8 @@ static const struct cedrus_variant sun50i_a64_cedrus_=
variant =3D {
 	.capabilities	=3D CEDRUS_CAPABILITY_UNTILED |
 			  CEDRUS_CAPABILITY_MPEG2_DEC |
 			  CEDRUS_CAPABILITY_H264_DEC |
-			  CEDRUS_CAPABILITY_H265_DEC,
+			  CEDRUS_CAPABILITY_H265_DEC |
+			  CEDRUS_CAPABILITY_VP8_DEC,
 	.mod_rate	=3D 402000000,
 };
=20
@@ -551,7 +558,8 @@ static const struct cedrus_variant sun50i_h5_cedrus_v=
ariant =3D {
 	.capabilities	=3D CEDRUS_CAPABILITY_UNTILED |
 			  CEDRUS_CAPABILITY_MPEG2_DEC |
 			  CEDRUS_CAPABILITY_H264_DEC |
-			  CEDRUS_CAPABILITY_H265_DEC,
+			  CEDRUS_CAPABILITY_H265_DEC |
+			  CEDRUS_CAPABILITY_VP8_DEC,
 	.mod_rate	=3D 402000000,
 };
=20
@@ -559,7 +567,8 @@ static const struct cedrus_variant sun50i_h6_cedrus_v=
ariant =3D {
 	.capabilities	=3D CEDRUS_CAPABILITY_UNTILED |
 			  CEDRUS_CAPABILITY_MPEG2_DEC |
 			  CEDRUS_CAPABILITY_H264_DEC |
-			  CEDRUS_CAPABILITY_H265_DEC,
+			  CEDRUS_CAPABILITY_H265_DEC |
+			  CEDRUS_CAPABILITY_VP8_DEC,
 	.quirks		=3D CEDRUS_QUIRK_NO_DMA_OFFSET,
 	.mod_rate	=3D 600000000,
 };
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/stagin=
g/media/sunxi/cedrus/cedrus.h
index 0bf1cbddac9c..e61c41853ba2 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -31,6 +31,7 @@
 #define CEDRUS_CAPABILITY_H265_DEC	BIT(1)
 #define CEDRUS_CAPABILITY_H264_DEC	BIT(2)
 #define CEDRUS_CAPABILITY_MPEG2_DEC	BIT(3)
+#define CEDRUS_CAPABILITY_VP8_DEC	BIT(4)
=20
 #define CEDRUS_QUIRK_NO_DMA_OFFSET	BIT(0)
=20
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/=
staging/media/sunxi/cedrus/cedrus_video.c
index 8a01e6b9bebb..b62eb8e84057 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
@@ -53,6 +53,7 @@ static struct cedrus_format cedrus_formats[] =3D {
 	{
 		.pixelformat	=3D V4L2_PIX_FMT_VP8_FRAME,
 		.directions	=3D CEDRUS_DECODE_SRC,
+		.capabilities	=3D CEDRUS_CAPABILITY_VP8_DEC,
 	},
 	{
 		.pixelformat	=3D V4L2_PIX_FMT_SUNXI_TILED_NV12,
--=20
2.29.2

