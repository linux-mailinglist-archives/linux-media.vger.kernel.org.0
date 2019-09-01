Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 404D5A4961
	for <lists+linux-media@lfdr.de>; Sun,  1 Sep 2019 14:46:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728984AbfIAMpz convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Sun, 1 Sep 2019 08:45:55 -0400
Received: from mail-oln040092066063.outbound.protection.outlook.com ([40.92.66.63]:31138
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728966AbfIAMpx (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 1 Sep 2019 08:45:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aa6SgPDw3JxYw63s98gxvWA87VXpc1kCsSjsR5opeWB1tqEvvaw7/7tiCmPBLTduPkZz8z+YMc4+muP4PGvXdCmFB8q+479TdP467Qj/wNKaBhoTFml7GeP5Ne4Zg4/tfHFUMci3SJxlXXf2mdKJa3tcpsW43gQHZCm8WFWCpqxo2hIHvp4BKXCfP1L+kPkUSZKsyjaDoVpwazB87ojquj3KHMWbFUJSv984j4yhVTd8h6leiTWD8t4x0ULBjK51HVMf1vTFhKqlpbqTqM8C3FuVeI6ik52gZLRsc7EFlcSmBvpIPo80Pc97MkIspzALsq+bkdCmOMvW9/gGgY+stw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o8OdwLZClbhokNrThfabP4V76IDMHBx3M+1/BTxEekA=;
 b=DpudoiwkDj8417PTy+bbOQQMXOr4lWAnBCBJGeAySXwrELWTxwtGdwons2oUVb6tzB7409gW3Ua0nGxGMkeYgv+MiZbnZhA2tdMC0OnyP73Z5YUelTJ/lcQbhtMl+qxjl5ZJB/jSh44N2hbKM1rxPL5P9WyyJXAMXdKHfGHXjrDm6uCBtlyhw37Eo5qUG+XQVBElbnc5rWY3R7ag48ILbjLSekMEckQboYIWSI685Scr8N06Q9iWouOI0sjtdZFXghRfFkqMEZWXPr1yXGj0B5cMR1DXz3NUH10V+Cg0fpB+cDCk5y3V1yrJXPXzW66ffU2qU4abPQ3YhqwWSQf1Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from HE1EUR01FT057.eop-EUR01.prod.protection.outlook.com
 (10.152.0.51) by HE1EUR01HT012.eop-EUR01.prod.protection.outlook.com
 (10.152.0.79) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2220.16; Sun, 1 Sep
 2019 12:45:49 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.0.52) by
 HE1EUR01FT057.mail.protection.outlook.com (10.152.0.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.16 via Frontend Transport; Sun, 1 Sep 2019 12:45:49 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::a0ba:e766:2a23:2088]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::a0ba:e766:2a23:2088%3]) with mapi id 15.20.2199.021; Sun, 1 Sep 2019
 12:45:49 +0000
From:   Jonas Karlman <jonas@kwiboo.se>
To:     Ezequiel Garcia <ezequiel@collabora.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-rockchip@lists.infradead.org" 
        <linux-rockchip@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jonas Karlman <jonas@kwiboo.se>
Subject: [RFC 11/12] media: hantro: Enable H264 decoding on RK3399
Thread-Topic: [RFC 11/12] media: hantro: Enable H264 decoding on RK3399
Thread-Index: AQHVYMMuDWI6fDhY3EmqNKbABGOY+w==
Date:   Sun, 1 Sep 2019 12:45:48 +0000
Message-ID: <HE1PR06MB4011DF6F06FEACAACFC164ADACBF0@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <HE1PR06MB40117D0EE96E6FA638A04B78ACBF0@HE1PR06MB4011.eurprd06.prod.outlook.com>
 <20190901124531.23645-1-jonas@kwiboo.se>
In-Reply-To: <20190901124531.23645-1-jonas@kwiboo.se>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR05CA0343.eurprd05.prod.outlook.com
 (2603:10a6:7:92::38) To HE1PR06MB4011.eurprd06.prod.outlook.com
 (2603:10a6:7:9c::32)
x-incomingtopheadermarker: OriginalChecksum:58F41166596F3235D42F35F244D9FADAB9DFBCD681998D37F5038BFB7FAB7343;UpperCasedChecksum:78D786937ABD3FE721B438A70BBDB1E29F071D4732E5CF2F2516808C47EBBB22;SizeAsReceived:7869;Count:50
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-tmn:  [Npb4J8fwhDbhb3THSmEmVeB5RCLOHBzp]
x-microsoft-original-message-id: <20190901124531.23645-11-jonas@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 50
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031322404)(2017031323274)(2017031324274)(1601125500)(1603101475)(1701031045);SRVR:HE1EUR01HT012;
x-ms-traffictypediagnostic: HE1EUR01HT012:
x-microsoft-antispam-message-info: E+7qlAlWBj3QHNnWiqiHGGeolCvQW93cyqiOUAje7uyy7robQiFQ/sazoZAKzSdVUWN91A1o650/J2c0ybsythqLp3rHlVGPf7sjEShXumXiUqS/b7oOtedNktaBbVaFpDmPJ8zanZ219XDfepcukkNXSrj8PsY7UyqKtTKIHC2hq51/nhTu3OzXQkdaFECP
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: bea6cdcd-96a9-48ec-af10-08d72eda509b
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2019 12:45:48.9836
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1EUR01HT012
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The RK3399 SoC has two VPU blocks capable of H264 decoding, VPU2 and RKVDEC,
this enables support for H264 decoding using the VPU2 block.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/staging/media/hantro/rk3399_vpu_hw.c | 21 +++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/hantro/rk3399_vpu_hw.c b/drivers/staging/media/hantro/rk3399_vpu_hw.c
index 14d14bc6b12b..47ca51b75a0d 100644
--- a/drivers/staging/media/hantro/rk3399_vpu_hw.c
+++ b/drivers/staging/media/hantro/rk3399_vpu_hw.c
@@ -60,6 +60,19 @@ static const struct hantro_fmt rk3399_vpu_dec_fmts[] = {
 		.fourcc = V4L2_PIX_FMT_NV12,
 		.codec_mode = HANTRO_MODE_NONE,
 	},
+	{
+		.fourcc = V4L2_PIX_FMT_H264_SLICE,
+		.codec_mode = HANTRO_MODE_H264_DEC,
+		.max_depth = 2,
+		.frmsize = {
+			.min_width = 48,
+			.max_width = 4096,
+			.step_width = H264_MB_DIM,
+			.min_height = 48,
+			.max_height = 2304,
+			.step_height = H264_MB_DIM,
+		},
+	},
 	{
 		.fourcc = V4L2_PIX_FMT_MPEG2_SLICE,
 		.codec_mode = HANTRO_MODE_MPEG2_DEC,
@@ -161,6 +174,12 @@ static const struct hantro_codec_ops rk3399_vpu_codec_ops[] = {
 		.init = hantro_jpeg_enc_init,
 		.exit = hantro_jpeg_enc_exit,
 	},
+	[HANTRO_MODE_H264_DEC] = {
+		.run = rk3399_vpu_h264_dec_run,
+		.reset = rk3399_vpu_dec_reset,
+		.init = hantro_h264_dec_init,
+		.exit = hantro_h264_dec_exit,
+	},
 	[HANTRO_MODE_MPEG2_DEC] = {
 		.run = rk3399_vpu_mpeg2_dec_run,
 		.reset = rk3399_vpu_dec_reset,
@@ -196,7 +215,7 @@ const struct hantro_variant rk3399_vpu_variant = {
 	.dec_fmts = rk3399_vpu_dec_fmts,
 	.num_dec_fmts = ARRAY_SIZE(rk3399_vpu_dec_fmts),
 	.codec = HANTRO_JPEG_ENCODER | HANTRO_MPEG2_DECODER |
-		 HANTRO_VP8_DECODER,
+		 HANTRO_VP8_DECODER | HANTRO_H264_DECODER,
 	.codec_ops = rk3399_vpu_codec_ops,
 	.irqs = rk3399_irqs,
 	.num_irqs = ARRAY_SIZE(rk3399_irqs),
-- 
2.17.1

