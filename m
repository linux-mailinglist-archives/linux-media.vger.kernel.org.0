Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B0651DBB13
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2020 19:20:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726804AbgETRUJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 May 2020 13:20:09 -0400
Received: from mailoutvs8.siol.net ([185.57.226.199]:37794 "EHLO mail.siol.net"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726436AbgETRUI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 May 2020 13:20:08 -0400
X-Greylist: delayed 462 seconds by postgrey-1.27 at vger.kernel.org; Wed, 20 May 2020 13:20:07 EDT
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Zimbra) with ESMTP id 7177252262E;
        Wed, 20 May 2020 19:12:23 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta12.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta12.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id Zb2kWSo0VfZD; Wed, 20 May 2020 19:12:23 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Zimbra) with ESMTPS id 0DB3E5227F4;
        Wed, 20 May 2020 19:12:23 +0200 (CEST)
Received: from kista.localdomain (cpe-194-152-20-232.static.triera.net [194.152.20.232])
        (Authenticated sender: 031275009)
        by mail.siol.net (Zimbra) with ESMTPSA id 1D040522746;
        Wed, 20 May 2020 19:12:17 +0200 (CEST)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mripard@kernel.org, paul.kocialkowski@bootlin.com
Cc:     mchehab@kernel.org, gregkh@linuxfoundation.org, wens@csie.org,
        hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: cedrus: Add support for additional output formats
Date:   Wed, 20 May 2020 19:14:57 +0200
Message-Id: <20200520171457.11937-1-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If VPU supports untiled output, it actually supports several different
YUV 4:2:0 layouts, namely NV12, NV21, YUV420 and YVU420.

Add support for all of them.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c | 18 +++++++++++++++++-
 .../staging/media/sunxi/cedrus/cedrus_video.c  | 18 ++++++++++++++++++
 2 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/sta=
ging/media/sunxi/cedrus/cedrus_hw.c
index daf5f244f93b..c119fd8c4b92 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
@@ -83,9 +83,25 @@ void cedrus_dst_format_set(struct cedrus_dev *dev,
=20
 	switch (fmt->pixelformat) {
 	case V4L2_PIX_FMT_NV12:
+	case V4L2_PIX_FMT_NV21:
+	case V4L2_PIX_FMT_YUV420:
+	case V4L2_PIX_FMT_YVU420:
 		chroma_size =3D ALIGN(width, 16) * ALIGN(height, 16) / 2;
=20
-		reg =3D VE_PRIMARY_OUT_FMT_NV12;
+		switch (fmt->pixelformat) {
+		case V4L2_PIX_FMT_NV12:
+			reg =3D VE_PRIMARY_OUT_FMT_NV12;
+			break;
+		case V4L2_PIX_FMT_NV21:
+			reg =3D VE_PRIMARY_OUT_FMT_NV21;
+			break;
+		case V4L2_PIX_FMT_YUV420:
+			reg =3D VE_PRIMARY_OUT_FMT_YU12;
+			break;
+		case V4L2_PIX_FMT_YVU420:
+			reg =3D VE_PRIMARY_OUT_FMT_YV12;
+			break;
+		}
 		cedrus_write(dev, VE_PRIMARY_OUT_FMT, reg);
=20
 		reg =3D chroma_size / 2;
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/=
staging/media/sunxi/cedrus/cedrus_video.c
index 15cf1f10221b..016021d71df2 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
@@ -55,6 +55,21 @@ static struct cedrus_format cedrus_formats[] =3D {
 		.directions	=3D CEDRUS_DECODE_DST,
 		.capabilities	=3D CEDRUS_CAPABILITY_UNTILED,
 	},
+	{
+		.pixelformat	=3D V4L2_PIX_FMT_NV21,
+		.directions	=3D CEDRUS_DECODE_DST,
+		.capabilities	=3D CEDRUS_CAPABILITY_UNTILED,
+	},
+	{
+		.pixelformat	=3D V4L2_PIX_FMT_YUV420,
+		.directions	=3D CEDRUS_DECODE_DST,
+		.capabilities	=3D CEDRUS_CAPABILITY_UNTILED,
+	},
+	{
+		.pixelformat	=3D V4L2_PIX_FMT_YVU420,
+		.directions	=3D CEDRUS_DECODE_DST,
+		.capabilities	=3D CEDRUS_CAPABILITY_UNTILED,
+	},
 };
=20
 #define CEDRUS_FORMATS_COUNT	ARRAY_SIZE(cedrus_formats)
@@ -130,6 +145,9 @@ void cedrus_prepare_format(struct v4l2_pix_format *pi=
x_fmt)
 		break;
=20
 	case V4L2_PIX_FMT_NV12:
+	case V4L2_PIX_FMT_NV21:
+	case V4L2_PIX_FMT_YUV420:
+	case V4L2_PIX_FMT_YVU420:
 		/* 16-aligned stride. */
 		bytesperline =3D ALIGN(width, 16);
=20
--=20
2.26.2

