Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 373EBA4976
	for <lists+linux-media@lfdr.de>; Sun,  1 Sep 2019 14:46:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728873AbfIAMpr convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Sun, 1 Sep 2019 08:45:47 -0400
Received: from mail-oln040092064063.outbound.protection.outlook.com ([40.92.64.63]:51590
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728765AbfIAMpq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 1 Sep 2019 08:45:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nvs6j13X5zUPsyaChF48HQKuY+bQcItwRUzBVxb1Ue3AWYKe4IfjgAIKd1ytdCBFWqzQ/H+6MPy/EJ2hVcFlQCTQyK3Ic+kOQ025bjqDTZ8fQgr6kWKIqSSpwhEUBE5RjlGDkI1SC1QGoaqeLpRIpI6FI796htEMfasnHDPfxG44A2BNx7bZCW/TQeC4eDLc1v0tHqH2kZd1aMYkqt/bBHUb5itiVljLGMushzP7i0+mhg5iEc0KWzgAKvl3INffl7oIWAuc+6189dcgZ84kLxAji/CfvOoWoo41tTg5YvRU3T4ncQPbcSOnouXkxO+wb4Rd9wQ91UMknb1ffKrt5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gvt7Mlb5D8IVCg2BWLfVVzF3ecQ5TGsgmavJKeMixhc=;
 b=fcnf8JfMD9Fh4GmrtjkAUwFkXvTWSxw2GJhcMGublX55GUYBVZTufwsJ7jxAViecTAiJBekXi19I2clevvlO7TCPhwndulACYfPOHl3DV0SkRDSGN3gf4X9o3BeVPR9rU0q/XFhGuJNOYcHg59wCI10EPv0B19dtWz2TextEdeU52CwYEpa8bYgFmTd5RERBN/bhQO3ZIha4xXwEn2QcgAfmYiSq5aT6q9I/mbcgBNohplldh38ZBu8++gs6XjTzHsC3nyD8Y3h+XDsXK/Ysk6avNTwxXjAOghGNOfEBg8mUIyQamEFFwV58NQIjVidIMszNj2VyAYnSh9OBXjb7ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from HE1EUR01FT057.eop-EUR01.prod.protection.outlook.com
 (10.152.0.59) by HE1EUR01HT089.eop-EUR01.prod.protection.outlook.com
 (10.152.1.47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2220.16; Sun, 1 Sep
 2019 12:45:42 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.0.52) by
 HE1EUR01FT057.mail.protection.outlook.com (10.152.0.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.16 via Frontend Transport; Sun, 1 Sep 2019 12:45:42 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::a0ba:e766:2a23:2088]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::a0ba:e766:2a23:2088%3]) with mapi id 15.20.2199.021; Sun, 1 Sep 2019
 12:45:42 +0000
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
Subject: [PATCH 02/12] media: hantro: Do not reorder H264 scaling list
Thread-Topic: [PATCH 02/12] media: hantro: Do not reorder H264 scaling list
Thread-Index: AQHVYMMq6YIWopjAr0aH2udYAseNuA==
Date:   Sun, 1 Sep 2019 12:45:42 +0000
Message-ID: <HE1PR06MB40116C92C3D52C5957EF48E9ACBF0@HE1PR06MB4011.eurprd06.prod.outlook.com>
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
x-incomingtopheadermarker: OriginalChecksum:94139BD92D4B6A7610A355ABD0C5C5D13E1EF91C454E923A5ECEE17C7364C21A;UpperCasedChecksum:488F5FE270DE9730CFE88A52E7ABFBFCEE65275B567FCF83F55AFA38CBF86A6B;SizeAsReceived:7875;Count:50
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-tmn:  [xVMPDGxxcE0gcL9LjvzwmuqdXtVrNOqp]
x-microsoft-original-message-id: <20190901124531.23645-2-jonas@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 50
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031322404)(2017031323274)(2017031324274)(1601125500)(1603101475)(1701031045);SRVR:HE1EUR01HT089;
x-ms-traffictypediagnostic: HE1EUR01HT089:
x-microsoft-antispam-message-info: mMZbw7baCsqdgD39z5O4GY095EPY8qRouHznlKaLJ422JyynAYvGfrNC802388CceEaSDI2ZnAfOqiJ3kTzQJGUerUHGoVaLQYrJiByJxqTVmRvaohYI7H68TMZSog8M11yvWOTub0M5mzTXU/MYro4iCsHfqOIEJ3+Rt0PbfR7mft00zrGCULBrYsBMRk/g
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 00281e24-a57d-4d0e-7d13-08d72eda4ce1
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2019 12:45:42.7087
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1EUR01HT089
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Scaling list supplied from userspace using ffmpeg and libva-v4l2-request
is already in matrix order and can be used without applying the inverse
scanning process.

The HW also only support 8x8 scaling list for the Y component, indices 0
and 3 in the scaling list supplied from userspace.

Remove reordering and write the scaling matrix in an order expected by
the VPU, also only allocate memory for the two 8x8 lists used.

Fixes: a9471e25629b ("media: hantro: Add core bits to support H264 decoding")
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/staging/media/hantro/hantro_h264.c | 64 +++++++---------------
 1 file changed, 20 insertions(+), 44 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_h264.c b/drivers/staging/media/hantro/hantro_h264.c
index 0d758e0c0f99..e2d01145ac4f 100644
--- a/drivers/staging/media/hantro/hantro_h264.c
+++ b/drivers/staging/media/hantro/hantro_h264.c
@@ -20,7 +20,7 @@
 /* Size with u32 units. */
 #define CABAC_INIT_BUFFER_SIZE		(460 * 2)
 #define POC_BUFFER_SIZE			34
-#define SCALING_LIST_SIZE		(6 * 16 + 6 * 64)
+#define SCALING_LIST_SIZE		(6 * 16 + 2 * 64)
 
 #define POC_CMP(p0, p1) ((p0) < (p1) ? -1 : 1)
 
@@ -194,57 +194,33 @@ static const u32 h264_cabac_table[] = {
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
 	const struct hantro_h264_dec_ctrls *ctrls = &ctx->h264_dec.ctrls;
 	const struct v4l2_ctrl_h264_scaling_matrix *scaling = ctrls->scaling;
-	const size_t num_list_4x4 = ARRAY_SIZE(scaling->scaling_list_4x4);
-	const size_t list_len_4x4 = ARRAY_SIZE(scaling->scaling_list_4x4[0]);
-	const size_t num_list_8x8 = ARRAY_SIZE(scaling->scaling_list_8x8);
-	const size_t list_len_8x8 = ARRAY_SIZE(scaling->scaling_list_8x8[0]);
 	struct hantro_h264_dec_priv_tbl *tbl = ctx->h264_dec.priv.cpu;
-	u8 *dst = tbl->scaling_list;
-	const u8 *src;
-	int i, j;
-
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
+	u32 *dst = (u32 *)tbl->scaling_list;
+	u32 i, j, tmp;
+
+	for (i = 0; i < ARRAY_SIZE(scaling->scaling_list_4x4); i++) {
+		for (j = 0; j < ARRAY_SIZE(scaling->scaling_list_4x4[0]) / 4; j++) {
+			tmp = (scaling->scaling_list_4x4[i][4 * j + 0] << 24) |
+			      (scaling->scaling_list_4x4[i][4 * j + 1] << 16) |
+			      (scaling->scaling_list_4x4[i][4 * j + 2] << 8) |
+			      (scaling->scaling_list_4x4[i][4 * j + 3]);
+			*dst++ = tmp;
+		}
 	}
 
-	src = &scaling->scaling_list_8x8[0][0];
-	for (i = 0; i < num_list_8x8; ++i) {
-		for (j = 0; j < list_len_8x8; ++j)
-			dst[zig_zag_8x8[j]] = src[j];
-		src += list_len_8x8;
-		dst += list_len_8x8;
+	for (i = 0; i < ARRAY_SIZE(scaling->scaling_list_8x8); i += 3) {
+		for (j = 0; j < ARRAY_SIZE(scaling->scaling_list_8x8[0]) / 4; j++) {
+			tmp = (scaling->scaling_list_8x8[i][4 * j + 0] << 24) |
+			      (scaling->scaling_list_8x8[i][4 * j + 1] << 16) |
+			      (scaling->scaling_list_8x8[i][4 * j + 2] << 8) |
+			      (scaling->scaling_list_8x8[i][4 * j + 3]);
+			*dst++ = tmp;
+		}
 	}
 }
 
-- 
2.17.1

