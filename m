Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6F97A496E
	for <lists+linux-media@lfdr.de>; Sun,  1 Sep 2019 14:46:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728975AbfIAMpy convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Sun, 1 Sep 2019 08:45:54 -0400
Received: from mail-oln040092066020.outbound.protection.outlook.com ([40.92.66.20]:10208
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728853AbfIAMpx (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 1 Sep 2019 08:45:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IgPdZ65o9PUh0GU7XP0HjX1G0PPXSq7Onrq2HETUvptWXrknvl+Rh7CL9Hrc/tcWi/omJvY9SOaHXOBoY03toOob+DRaSjIBERmDHmcE5MtotbhtS3grEOHIV0rldREm6web9TtQdEByY3XmjWnCGRLUbgUIfeFvHspmj4yWPZTsvTuHUbg6ev7H61024f1CtemlNhttnVk/I3l80YrWstc6MBihauRt6IkGMFULabVjpW5BTmFV3QD9NzRNCfSM3vXPmBl3lu9upEwHfp0YmRdBHmmylpzilL6iaI1Cz3qbGfpu5lp8Jnx8kg5UwoB7Oh9XwFG34Y1EXmo8LCw8AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eeQvnvWDchEPDYP1XlV2FhNDP12tzl1tsCGA/GSddII=;
 b=ZJ64Eya7gRzKy30Ri10G/Fp2bj4L1iI5mMYZhop5RPRySa7+EOlueszaH0uDZpYn4ZxhfzIQBwNXlywLRhVRoWRHqtqhReUuNONP4W18irvjYbtC2mKLBqN0RwEeAJrTiovsChF1cmvW/63h/X+xfd6RPpjAjWoykpPGuu5tod367Q0cF2PqAZHAcD0OSy7kQfY5TQM4yUqR35L6emo/OE67kZus9wkbqqTX6QR+lGq6gmx9CsSGMe4ZH41MEHF4IgkQe9U0umkFF9ONmtbcj2y+XOf0Ir3gsYjKQ6mdEvb11aXtQ9ZI0VprmDq1DCFFVNCcgEudaFa9vi/Ee4tMlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from HE1EUR01FT057.eop-EUR01.prod.protection.outlook.com
 (10.152.0.55) by HE1EUR01HT092.eop-EUR01.prod.protection.outlook.com
 (10.152.0.224) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2220.16; Sun, 1 Sep
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
Subject: [RFC 12/12] media: hantro: Enable H264 decoding on RK3328
Thread-Topic: [RFC 12/12] media: hantro: Enable H264 decoding on RK3328
Thread-Index: AQHVYMMuvZQ1uHpGmUOTBIxTdNJunA==
Date:   Sun, 1 Sep 2019 12:45:49 +0000
Message-ID: <HE1PR06MB401121228D13FA596BE8ADDFACBF0@HE1PR06MB4011.eurprd06.prod.outlook.com>
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
x-incomingtopheadermarker: OriginalChecksum:DC266DF213D4E8D0C3D1E2D5093F387F19B067E3DACF8FC4F0FD73990B771076;UpperCasedChecksum:E97356B334C780799DD41F7BE53990FD24D9A7535924EA69093E283C4EFCFD1A;SizeAsReceived:7859;Count:50
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-tmn:  [Bw5RG+BkWMYsEZmrCEi5JTjBEQh81nv2]
x-microsoft-original-message-id: <20190901124531.23645-12-jonas@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 50
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031322404)(2017031323274)(2017031324274)(1601125500)(1603101475)(1701031045);SRVR:HE1EUR01HT092;
x-ms-traffictypediagnostic: HE1EUR01HT092:
x-microsoft-antispam-message-info: Y9PxsReJX/uTvNX1wro58uPrZhxU5sMjtjaMPhDuFUBUo3xD04L6Ad8i3MIDn8b59KnUe+P0wGM+5FxiYBlItIg05QFanmQJzXKF6L3n2p4lFS4+wsypv+2Sv8oaxd7i3ZdQdi6BaBBJe+bM6R8bJRzStM68F09wZAxFWlOqGlKiSOnjAQnfCWvIx7l4Pz42
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 87e5dc36-64a0-491d-f921-08d72eda5107
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2019 12:45:49.6349
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1EUR01HT092
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

RK3328 SoC has the same decoder IP block as RK3399,
lets enable H264 decoding on RK3328.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/staging/media/hantro/rk3399_vpu_hw.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/hantro/rk3399_vpu_hw.c b/drivers/staging/media/hantro/rk3399_vpu_hw.c
index 47ca51b75a0d..08b965129377 100644
--- a/drivers/staging/media/hantro/rk3399_vpu_hw.c
+++ b/drivers/staging/media/hantro/rk3399_vpu_hw.c
@@ -232,7 +232,8 @@ const struct hantro_variant rk3328_vpu_variant = {
 	.dec_offset = 0x400,
 	.dec_fmts = rk3399_vpu_dec_fmts,
 	.num_dec_fmts = ARRAY_SIZE(rk3399_vpu_dec_fmts),
-	.codec = HANTRO_MPEG2_DECODER | HANTRO_VP8_DECODER,
+	.codec = HANTRO_MPEG2_DECODER | HANTRO_VP8_DECODER |
+		 HANTRO_H264_DECODER,
 	.codec_ops = rk3399_vpu_codec_ops,
 	.irqs = rk3328_irqs,
 	.num_irqs = ARRAY_SIZE(rk3328_irqs),
-- 
2.17.1

