Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29AABE7D66
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2019 01:01:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729995AbfJ2ABB convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 28 Oct 2019 20:01:01 -0400
Received: from mail-oln040092065065.outbound.protection.outlook.com ([40.92.65.65]:7758
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726834AbfJ2ABB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Oct 2019 20:01:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ju1Bz5JzX5mxicGnxLmWsFEiFzuU2IrMqDqXp1v29V6PSC2yIiWptLijh9w4iJaPr172XTMGb51WaWIZHSL6wkDq5sWxqgXQNS7APJA1d8Kvb4cOxodEMYdnxQ7LLcHGGZWamkyYQRLhykH26Me+2vdJ/b/TbJuiVPM+2Jp6GhA1jwpW0njyVSxoKt6G+3O5otYTo48VhyY9E0QKS8hqzYQVdzpNtOmyCgD2aPIgsloVVjR8zFpwFY3VeTpYbQ16oC+74eTcBnE/71DsWS4uQV/4MhJWWoDXvyvLm9zQiDP43ZbP+cY/jE1KyS+zC27QZqBKHa17d0m4omgGDDoj4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BMl2D0+OlthSlgFyvfZCK08LnPRn19RFu0oI3f0BSQo=;
 b=UfAovlTV7xnhgIhc3KRbngwL/evspBkiLjKv1Sbq233Vc9XfFHNUz8fYr9t2asGp2I9Cwn61oZ6Oo3fnvEDfQCTIQa7YYgQKI5peqBJZ4Y+WQgzx+tTTcM9LHh8cvnftQ4/m5zJpr3D6yVaNXycSjCf44Q7S5IbzgrMrXmUGdW2NnhuAxWOz9FcmnZcCTk87O4xzGiRA1xNSyj6tGvS9ulmPuTVJhLq2AM9HSERaEclgtfs5NGYLbGmq286jL1opSl/u9ero8QAUV6jcLHfQbhtWjFwtYKdlMocp6C69aT7IGRx1qEpSmYBj3t2eOusiUumIbjOwNPW86YQuwrKDdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from VE1EUR01FT033.eop-EUR01.prod.protection.outlook.com
 (10.152.2.57) by VE1EUR01HT219.eop-EUR01.prod.protection.outlook.com
 (10.152.3.237) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2387.20; Tue, 29 Oct
 2019 00:00:54 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.2.51) by
 VE1EUR01FT033.mail.protection.outlook.com (10.152.2.230) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20 via Frontend Transport; Tue, 29 Oct 2019 00:00:54 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::b1cf:db6f:95fc:84cc]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::b1cf:db6f:95fc:84cc%7]) with mapi id 15.20.2387.025; Tue, 29 Oct 2019
 00:00:53 +0000
From:   Jonas Karlman <jonas@kwiboo.se>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
CC:     Jonas Karlman <jonas@kwiboo.se>, Hans Verkuil <hverkuil@xs4all.nl>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 3/3] media: hantro: Do not reorder H264 scaling list
Thread-Topic: [PATCH v2 3/3] media: hantro: Do not reorder H264 scaling list
Thread-Index: AQHVjevu/7KXRpoZcUGJOmzIePYDDA==
Date:   Tue, 29 Oct 2019 00:00:53 +0000
Message-ID: <HE1PR06MB4011B2DED416807CD9C9B90EAC610@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <HE1PR06MB4011D3B8C200D13829648D86AC660@HE1PR06MB4011.eurprd06.prod.outlook.com>
 <20191029000033.13540-1-jonas@kwiboo.se>
In-Reply-To: <20191029000033.13540-1-jonas@kwiboo.se>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM3PR07CA0087.eurprd07.prod.outlook.com
 (2603:10a6:207:6::21) To HE1PR06MB4011.eurprd06.prod.outlook.com
 (2603:10a6:7:9c::32)
x-incomingtopheadermarker: OriginalChecksum:D4576FFCA123D6ACDC123D0D4F4AA908FB62F07E8F9E1E044ED8CE59DC327AC7;UpperCasedChecksum:9321E4B87097A97855E24D9EEAEF9A58004E6A509A6C46CAA57E76B84A880125;SizeAsReceived:7846;Count:49
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-tmn:  [lQPhitlyDiiwles6/EAoJAOFU+MEIIJI]
x-microsoft-original-message-id: <20191029000033.13540-3-jonas@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 49
x-eopattributedmessage: 0
x-ms-traffictypediagnostic: VE1EUR01HT219:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mkFKYekyxEJjdR23pdCsNs05hUHn/NVG8Cqy2WTenWai9poVgPpC2mxO80xXxmQPiVo/egFeIUpuclHlDpb1OgYRXLsBloB74NPwvfr2W8tBmr0KB8EyU7uTnvdDpfPa32FS9H2xBT1Os5aaMBxg8S/LA0RNv0TeqB93CT2XmvJGDSf7Ps1rhht62cHMaq2K
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: fb563c42-bbeb-450c-d0e2-08d75c0310f4
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2019 00:00:53.9259
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1EUR01HT219
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Scaling list supplied from userspace should be in matrix order
and can be used without applying the inverse scanning process.

The HW also only support 8x8 scaling list for the Y component, indices 0
and 1 in the scaling list supplied from userspace.

Remove reordering and write the scaling matrix in an order expected by
the VPU, also only allocate memory for the two 8x8 lists supported.

Fixes: a9471e25629b ("media: hantro: Add core bits to support H264 decoding")
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
Changes in v2:
  - use swab32() (Philipp)
---
 drivers/staging/media/hantro/hantro_h264.c | 51 +++++-----------------
 1 file changed, 12 insertions(+), 39 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_h264.c b/drivers/staging/media/hantro/hantro_h264.c
index 02cbe7761769..694a330f508e 100644
--- a/drivers/staging/media/hantro/hantro_h264.c
+++ b/drivers/staging/media/hantro/hantro_h264.c
@@ -20,7 +20,7 @@
 /* Size with u32 units. */
 #define CABAC_INIT_BUFFER_SIZE		(460 * 2)
 #define POC_BUFFER_SIZE			34
-#define SCALING_LIST_SIZE		(6 * 16 + 6 * 64)
+#define SCALING_LIST_SIZE		(6 * 16 + 2 * 64)
 
 #define HANTRO_CMP(a, b) ((a) < (b) ? -1 : 1)
 
@@ -194,23 +194,6 @@ static const u32 h264_cabac_table[] = {
 	0x1f0c2517, 0x1f261440
 };
 
-/*
- * NOTE: The scaling lists are in zig-zag order, apply inverse scanning process
- * to get the values in matrix order. In addition, the hardware requires bytes
- * swapped within each subsequent 4 bytes. Both arrays below include both
- * transformations.
- */
-static const u32 zig_zag_4x4[] = {
-	3, 2, 7, 11, 6, 1, 0, 5, 10, 15, 14, 9, 4, 8, 13, 12
-};
-
-static const u32 zig_zag_8x8[] = {
-	3, 2, 11, 19, 10, 1, 0, 9, 18, 27, 35, 26, 17, 8, 7, 6,
-	15, 16, 25, 34, 43, 51, 42, 33, 24, 23, 14, 5, 4, 13, 22, 31,
-	32, 41, 50, 59, 58, 49, 40, 39, 30, 21, 12, 20, 29, 38, 47, 48,
-	57, 56, 55, 46, 37, 28, 36, 45, 54, 63, 62, 53, 44, 52, 61, 60
-};
-
 static void
 reorder_scaling_list(struct hantro_ctx *ctx)
 {
@@ -218,33 +201,23 @@ reorder_scaling_list(struct hantro_ctx *ctx)
 	const struct v4l2_ctrl_h264_scaling_matrix *scaling = ctrls->scaling;
 	const size_t num_list_4x4 = ARRAY_SIZE(scaling->scaling_list_4x4);
 	const size_t list_len_4x4 = ARRAY_SIZE(scaling->scaling_list_4x4[0]);
-	const size_t num_list_8x8 = ARRAY_SIZE(scaling->scaling_list_8x8);
 	const size_t list_len_8x8 = ARRAY_SIZE(scaling->scaling_list_8x8[0]);
 	struct hantro_h264_dec_priv_tbl *tbl = ctx->h264_dec.priv.cpu;
-	u8 *dst = tbl->scaling_list;
-	const u8 *src;
+	u32 *dst = (u32 *)tbl->scaling_list;
+	const u32 *src;
 	int i, j;
 
-	BUILD_BUG_ON(ARRAY_SIZE(zig_zag_4x4) != list_len_4x4);
-	BUILD_BUG_ON(ARRAY_SIZE(zig_zag_8x8) != list_len_8x8);
-	BUILD_BUG_ON(ARRAY_SIZE(tbl->scaling_list) !=
-		     num_list_4x4 * list_len_4x4 +
-		     num_list_8x8 * list_len_8x8);
-
-	src = &scaling->scaling_list_4x4[0][0];
-	for (i = 0; i < num_list_4x4; ++i) {
-		for (j = 0; j < list_len_4x4; ++j)
-			dst[zig_zag_4x4[j]] = src[j];
-		src += list_len_4x4;
-		dst += list_len_4x4;
+	for (i = 0; i < num_list_4x4; i++) {
+		src = (u32 *)&scaling->scaling_list_4x4[i];
+		for (j = 0; j < list_len_4x4 / 4; j++)
+			*dst++ = swab32(src[j]);
 	}
 
-	src = &scaling->scaling_list_8x8[0][0];
-	for (i = 0; i < num_list_8x8; ++i) {
-		for (j = 0; j < list_len_8x8; ++j)
-			dst[zig_zag_8x8[j]] = src[j];
-		src += list_len_8x8;
-		dst += list_len_8x8;
+	/* Only Intra/Inter Y lists */
+	for (i = 0; i < 2; i++) {
+		src = (u32 *)&scaling->scaling_list_8x8[i];
+		for (j = 0; j < list_len_8x8 / 4; j++)
+			*dst++ = swab32(src[j]);
 	}
 }
 
-- 
2.17.1

