Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13DBC267AEE
	for <lists+linux-media@lfdr.de>; Sat, 12 Sep 2020 16:33:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725933AbgILOcx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Sep 2020 10:32:53 -0400
Received: from gw.c-home.cz ([89.24.150.100]:33043 "EHLO dmz.c-home.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725880AbgILObe (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Sep 2020 10:31:34 -0400
Received: from ubuntu1804.c-home.cz (unifi.c-home.cz [192.168.1.239])
        by dmz.c-home.cz (8.14.4+Sun/8.14.4) with ESMTP id 08CEUtN3007223;
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
Subject: [PATCH v2 4/6] media: cedrus: Add support for V3s
Date:   Sat, 12 Sep 2020 16:30:50 +0200
Message-Id: <20200912143052.30952-5-m.cerveny@computer.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200912143052.30952-1-m.cerveny@computer.org>
References: <20200912143052.30952-1-m.cerveny@computer.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

V3s video engine runs at lower speed and support video decoder
for H.264 and JPEG/MJPEG only.

Signed-off-by: Martin Cerveny <m.cerveny@computer.org>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index ae7e154eca9f..79ec5e07b416 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -511,6 +511,12 @@ static const struct cedrus_variant sun8i_h3_cedrus_variant = {
 	.mod_rate	= 402000000,
 };
 
+static const struct cedrus_variant sun8i_v3s_cedrus_variant = {
+	.capabilities	= CEDRUS_CAPABILITY_UNTILED |
+			  CEDRUS_CAPABILITY_H264_DEC,
+	.mod_rate	= 297000000,
+};
+
 static const struct cedrus_variant sun50i_a64_cedrus_variant = {
 	.capabilities	= CEDRUS_CAPABILITY_UNTILED |
 			  CEDRUS_CAPABILITY_MPEG2_DEC |
@@ -557,6 +563,10 @@ static const struct of_device_id cedrus_dt_match[] = {
 		.compatible = "allwinner,sun8i-h3-video-engine",
 		.data = &sun8i_h3_cedrus_variant,
 	},
+	{
+		.compatible = "allwinner,sun8i-v3s-video-engine",
+		.data = &sun8i_v3s_cedrus_variant,
+	},
 	{
 		.compatible = "allwinner,sun50i-a64-video-engine",
 		.data = &sun50i_a64_cedrus_variant,
-- 
2.17.1

