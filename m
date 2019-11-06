Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91D6CF21C4
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2019 23:34:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732743AbfKFWea convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 6 Nov 2019 17:34:30 -0500
Received: from mail-oln040092065083.outbound.protection.outlook.com ([40.92.65.83]:64750
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727328AbfKFWe0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 Nov 2019 17:34:26 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XG5tsi1+AiVelHxMftl5sPWzSpFNkymAEXMr/3OwzOT4YEObsJpNNPfQDR/pBFGJTShNtZBaCDM+TqUU2r21z8+pFLY4al284+0i86JKWgNijJluSTxPKNKW4vNxVZtB3TwxRiU5vroW05WysU3IbinCbeU0YUQBInPBMxIQbwoxcwbd0IibcuzLtrdRAvfg2+1kKfvbvmwSaYf6H+da3MlhNNrYIXzqc79CE7XL8tsksiG8/RzjZl1qDHm1yoz1scOe6KT3qGLK5onyeCKMtqqv7lLtGEdgugNVyejQsJXvJgF6phU2RODExY8RxSY/SwX0MCRj5h1HeQ87iRUE0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bNk3WKd42Sb5gX2E/4nBiJcOd16+VmQYgqISr4csOVc=;
 b=Sbc16n6SQ8qAmnjKnNAbG5i1Kr6cZazSDNPiTiCHwG0lXenGpfW8d7ngtRBjxB5gVIngtJaKidhH2BRIsv8s3yGV7ZtpJPP8/IJXTFHkS+WhTSz7ej0j62Cx6TaxgH1DDYRjJyzJYICCccj35I29t4O45exul+AEQRF7SKOFvPxMXldnwehGPHtTDWNAc6Rw0pSfk0cTh3jH0bgwAGTMjN0Smx81+G5sGcaymDEMM9I/Mtv0YDtbbp5SGYkaK2VcQG5UVkAZadiB8AbfW8Lik1gk/WMER3chZo9vDum5Gg/Alq7KpRM3U6BNKSacIp7Inq097FU9i1afhxzpZh5jlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from HE1EUR01FT023.eop-EUR01.prod.protection.outlook.com
 (10.152.0.57) by HE1EUR01HT125.eop-EUR01.prod.protection.outlook.com
 (10.152.0.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2387.20; Wed, 6 Nov
 2019 22:34:22 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.0.53) by
 HE1EUR01FT023.mail.protection.outlook.com (10.152.0.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20 via Frontend Transport; Wed, 6 Nov 2019 22:34:22 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::b1cf:db6f:95fc:84cc]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::b1cf:db6f:95fc:84cc%7]) with mapi id 15.20.2408.028; Wed, 6 Nov 2019
 22:34:22 +0000
From:   Jonas Karlman <jonas@kwiboo.se>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>
CC:     Jonas Karlman <jonas@kwiboo.se>, Hans Verkuil <hverkuil@xs4all.nl>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 3/5] media: hantro: Use output buffer width and height for
 H264 decoding
Thread-Topic: [PATCH v3 3/5] media: hantro: Use output buffer width and height
 for H264 decoding
Thread-Index: AQHVlPJVagG3x/gBBEusb21b5/5jpg==
Date:   Wed, 6 Nov 2019 22:34:22 +0000
Message-ID: <HE1PR06MB4011E69C56DA82EAB9ECEAEEAC790@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <HE1PR06MB4011EDD5F2686A05BC35F61CAC790@HE1PR06MB4011.eurprd06.prod.outlook.com>
 <20191106223408.2176-1-jonas@kwiboo.se>
In-Reply-To: <20191106223408.2176-1-jonas@kwiboo.se>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0402CA0025.eurprd04.prod.outlook.com
 (2603:10a6:7:7c::14) To HE1PR06MB4011.eurprd06.prod.outlook.com
 (2603:10a6:7:9c::32)
x-incomingtopheadermarker: OriginalChecksum:FC86266FB41A1F49C46E1D9F9EEED5328166F2367B4FD3262DA403DD1064FA8B;UpperCasedChecksum:BFF902FCD1DAED98C6AEABF56F5ABD4745FF114983D392DD7F0B217E1C2C1A3D;SizeAsReceived:7659;Count:49
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-tmn:  [L5pv19f9XqodnBsgP5iFjhY2HUbUL0U7]
x-microsoft-original-message-id: <20191106223408.2176-3-jonas@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 49
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 846aed8c-0087-49a6-4a60-08d76309783e
x-ms-traffictypediagnostic: HE1EUR01HT125:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8wpzH42w9e5m09u4m9Eg5QWvNLgNAy+9nGfrTTullAfULhNbHMnBMk0reEsyJJU3K4QbaGZngIWTIWu8/3C4IYndgo5KILbE0FmwYZvHqTKK4DPGelCa8pLZbx/dX/51/zBSXEKaGdpXEBrtrP+nEkAoKV6YCoVhTs7gBrQYbW4t9YSIe63Jn0TpfZzTIDz5
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 846aed8c-0087-49a6-4a60-08d76309783e
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2019 22:34:22.3745
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1EUR01HT125
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Calculations for motion vector buffer offset is based on width and height
from the configured output format, lets use the same values for macroblock
width and height hw regs.

Fixes: dea0a82f3d22 ("media: hantro: Add support for H264 decoding on G1")
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
Changes in v3:
  - change to use src_fmt instead of dst_fmt (Boris)
Changes in v2:
  - new patch split from "media: hantro: Fix H264 motion vector buffer offset"
---
 drivers/staging/media/hantro/hantro_g1_h264_dec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_g1_h264_dec.c b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
index 30d977c3d529..27d40d8d3728 100644
--- a/drivers/staging/media/hantro/hantro_g1_h264_dec.c
+++ b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
@@ -51,8 +51,8 @@ static void set_params(struct hantro_ctx *ctx)
 	vdpu_write_relaxed(vpu, reg, G1_REG_DEC_CTRL0);
 
 	/* Decoder control register 1. */
-	reg = G1_REG_DEC_CTRL1_PIC_MB_WIDTH(sps->pic_width_in_mbs_minus1 + 1) |
-	      G1_REG_DEC_CTRL1_PIC_MB_HEIGHT_P(sps->pic_height_in_map_units_minus1 + 1) |
+	reg = G1_REG_DEC_CTRL1_PIC_MB_WIDTH(MB_WIDTH(ctx->src_fmt.width)) |
+	      G1_REG_DEC_CTRL1_PIC_MB_HEIGHT_P(MB_HEIGHT(ctx->src_fmt.height)) |
 	      G1_REG_DEC_CTRL1_REF_FRAMES(sps->max_num_ref_frames);
 	vdpu_write_relaxed(vpu, reg, G1_REG_DEC_CTRL1);
 
-- 
2.17.1

