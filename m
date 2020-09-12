Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3A91267AEA
	for <lists+linux-media@lfdr.de>; Sat, 12 Sep 2020 16:32:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725887AbgILObm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Sep 2020 10:31:42 -0400
Received: from gw.c-home.cz ([89.24.150.100]:33035 "EHLO dmz.c-home.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725876AbgILObc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Sep 2020 10:31:32 -0400
Received: from ubuntu1804.c-home.cz (unifi.c-home.cz [192.168.1.239])
        by dmz.c-home.cz (8.14.4+Sun/8.14.4) with ESMTP id 08CEUtN0007223;
        Sat, 12 Sep 2020 16:31:01 +0200 (CEST)
From:   Martin Cerveny <m.cerveny@computer.org>
To:     Maxime Ripard <mripard@kernel.org>
Cc:     Martin Cerveny <m.cerveny@computer.org>,
        Chen-Yu Tsai <wens@csie.org>, devel@driverdev.osuosl.org,
        devicetree@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 1/6] media: cedrus: Register all codecs as capability
Date:   Sat, 12 Sep 2020 16:30:47 +0200
Message-Id: <20200912143052.30952-2-m.cerveny@computer.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200912143052.30952-1-m.cerveny@computer.org>
References: <20200912143052.30952-1-m.cerveny@computer.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

All codecs should have capabilities.
For example "Allwinner V3s" does not support "MPEG2".

Signed-off-by: Martin Cerveny <m.cerveny@computer.org>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c    | 18 +++++++++++++++++-
 drivers/staging/media/sunxi/cedrus/cedrus.h    |  2 ++
 .../staging/media/sunxi/cedrus/cedrus_video.c  |  2 ++
 3 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 7c6b91f0e780..ae7e154eca9f 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -479,42 +479,58 @@ static int cedrus_remove(struct platform_device *pdev)
 }
 
 static const struct cedrus_variant sun4i_a10_cedrus_variant = {
+	.capabilities	= CEDRUS_CAPABILITY_MPEG2_DEC |
+			  CEDRUS_CAPABILITY_H264_DEC,
 	.mod_rate	= 320000000,
 };
 
 static const struct cedrus_variant sun5i_a13_cedrus_variant = {
+	.capabilities	= CEDRUS_CAPABILITY_MPEG2_DEC |
+			  CEDRUS_CAPABILITY_H264_DEC,
 	.mod_rate	= 320000000,
 };
 
 static const struct cedrus_variant sun7i_a20_cedrus_variant = {
+	.capabilities	= CEDRUS_CAPABILITY_MPEG2_DEC |
+			  CEDRUS_CAPABILITY_H264_DEC,
 	.mod_rate	= 320000000,
 };
 
 static const struct cedrus_variant sun8i_a33_cedrus_variant = {
-	.capabilities	= CEDRUS_CAPABILITY_UNTILED,
+	.capabilities	= CEDRUS_CAPABILITY_UNTILED |
+			  CEDRUS_CAPABILITY_MPEG2_DEC |
+			  CEDRUS_CAPABILITY_H264_DEC,
 	.mod_rate	= 320000000,
 };
 
 static const struct cedrus_variant sun8i_h3_cedrus_variant = {
 	.capabilities	= CEDRUS_CAPABILITY_UNTILED |
+			  CEDRUS_CAPABILITY_MPEG2_DEC |
+			  CEDRUS_CAPABILITY_H264_DEC |
 			  CEDRUS_CAPABILITY_H265_DEC,
 	.mod_rate	= 402000000,
 };
 
 static const struct cedrus_variant sun50i_a64_cedrus_variant = {
 	.capabilities	= CEDRUS_CAPABILITY_UNTILED |
+			  CEDRUS_CAPABILITY_MPEG2_DEC |
+			  CEDRUS_CAPABILITY_H264_DEC |
 			  CEDRUS_CAPABILITY_H265_DEC,
 	.mod_rate	= 402000000,
 };
 
 static const struct cedrus_variant sun50i_h5_cedrus_variant = {
 	.capabilities	= CEDRUS_CAPABILITY_UNTILED |
+			  CEDRUS_CAPABILITY_MPEG2_DEC |
+			  CEDRUS_CAPABILITY_H264_DEC |
 			  CEDRUS_CAPABILITY_H265_DEC,
 	.mod_rate	= 402000000,
 };
 
 static const struct cedrus_variant sun50i_h6_cedrus_variant = {
 	.capabilities	= CEDRUS_CAPABILITY_UNTILED |
+			  CEDRUS_CAPABILITY_MPEG2_DEC |
+			  CEDRUS_CAPABILITY_H264_DEC |
 			  CEDRUS_CAPABILITY_H265_DEC,
 	.quirks		= CEDRUS_QUIRK_NO_DMA_OFFSET,
 	.mod_rate	= 600000000,
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
index 96765555ab8a..b6032f40cde8 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -28,6 +28,8 @@
 
 #define CEDRUS_CAPABILITY_UNTILED	BIT(0)
 #define CEDRUS_CAPABILITY_H265_DEC	BIT(1)
+#define CEDRUS_CAPABILITY_H264_DEC	BIT(2)
+#define CEDRUS_CAPABILITY_MPEG2_DEC	BIT(3)
 
 #define CEDRUS_QUIRK_NO_DMA_OFFSET	BIT(0)
 
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
index 16d82309e7b6..cb4aca5be415 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
@@ -38,10 +38,12 @@ static struct cedrus_format cedrus_formats[] = {
 	{
 		.pixelformat	= V4L2_PIX_FMT_MPEG2_SLICE,
 		.directions	= CEDRUS_DECODE_SRC,
+		.capabilities	= CEDRUS_CAPABILITY_MPEG2_DEC,
 	},
 	{
 		.pixelformat	= V4L2_PIX_FMT_H264_SLICE,
 		.directions	= CEDRUS_DECODE_SRC,
+		.capabilities	= CEDRUS_CAPABILITY_H264_DEC,
 	},
 	{
 		.pixelformat	= V4L2_PIX_FMT_HEVC_SLICE,
-- 
2.17.1

