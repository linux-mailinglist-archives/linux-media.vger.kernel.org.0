Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC3FCE7DE9
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2019 02:25:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728385AbfJ2BYv convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 28 Oct 2019 21:24:51 -0400
Received: from mail-oln040092064064.outbound.protection.outlook.com ([40.92.64.64]:44830
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728270AbfJ2BYv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Oct 2019 21:24:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SuS8V1KYsyhLh8sS5G8Qatj+AEx8YtA+/yzI2w9J+fFDFdFszAweDwAdplc1W3oTSl/nI4Mcvh3bQOWfIAw2eHBIrFMuOfR13DDtMzotKvFrt8iucZ6YUUhbz0E5fTX5PG89nyjq0MfHC+clxcuq0exwBlNRX67dUVfWDx36ZCK7JKO+q0GHA1lquZ2Q2O1NmtsEBjC34RKQnGYkuyDuHnaHSFuRwYNp3MRyFmjNocyGjfvWHl20SRWQHdPVSK/JlXzLPr7PAQ7QPudzZzJQo3jIOZvXll+m24kKEYTiUX2sfwZ3tP9ZK5FjeRoBc6tzG8YNAg9a91jakhj86o6K4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rwh4CRZQwbmAdm+lLifQ88BcRQm8NVhKwvxbdI4BOOE=;
 b=ZAF0v+eY6qbl9J60uF4TKB5bs6uqpJsLKjZ1fWUsUYsGPqTJbeOgAD/rKPIm6EvNVn9yyWE/dIevqECOZMssUwawfzt2rlCYwlPrJ7nDwjPq+8yGazrAgdZQVnACwY3qX4CnA1DdpYh799Ydo7roGWzbMM/YIdGXYioIG5PNSY4UM/8ncTFDr/6+xRQGgOJrc4tZIl8qG+/K+sEcqIiFDhmfiXHxVUWgpSRSZ2hRUvu+bMefNXEE+Hz+C4LvvmHKCbX3oX4eriX8jnszGmy2vd2vsdCHeHI2EYigC8PiJRlbFeY1qDw53SQwMpKq8euEdJyvIFHV5WoeU3e/7uvqAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from VE1EUR01FT039.eop-EUR01.prod.protection.outlook.com
 (10.152.2.60) by VE1EUR01HT115.eop-EUR01.prod.protection.outlook.com
 (10.152.3.44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2387.20; Tue, 29 Oct
 2019 01:24:48 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.2.56) by
 VE1EUR01FT039.mail.protection.outlook.com (10.152.3.35) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20 via Frontend Transport; Tue, 29 Oct 2019 01:24:48 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::b1cf:db6f:95fc:84cc]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::b1cf:db6f:95fc:84cc%7]) with mapi id 15.20.2387.025; Tue, 29 Oct 2019
 01:24:48 +0000
From:   Jonas Karlman <jonas@kwiboo.se>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>
CC:     Francois Buergisser <fbuergisser@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v2 02/10] media: hantro: Fix motion vectors usage condition
Thread-Topic: [PATCH v2 02/10] media: hantro: Fix motion vectors usage
 condition
Thread-Index: AQHVjfenYArJWRB04EKt4B7/YEWLRg==
Date:   Tue, 29 Oct 2019 01:24:47 +0000
Message-ID: <HE1PR06MB40116FEF3EBE4706E426A5FFAC610@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <HE1PR06MB401108289F09802C261374F8AC610@HE1PR06MB4011.eurprd06.prod.outlook.com>
 <20191029012430.24566-1-jonas@kwiboo.se>
In-Reply-To: <20191029012430.24566-1-jonas@kwiboo.se>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR09CA0090.eurprd09.prod.outlook.com
 (2603:10a6:7:3d::34) To HE1PR06MB4011.eurprd06.prod.outlook.com
 (2603:10a6:7:9c::32)
x-incomingtopheadermarker: OriginalChecksum:1FCD5D1FA0C4F46DDFBFEB802614D9D63122D073A1E60D0DDAA55BF056F30D8B;UpperCasedChecksum:AC4DFCD5E325C1F32B85A129D572CA7703466C528772D9430732451E5B6E5646;SizeAsReceived:7658;Count:49
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-tmn:  [BKgQaOLoZRyT1jc/Y1m5HBfPhDaDByDz]
x-microsoft-original-message-id: <20191029012430.24566-2-jonas@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 49
x-eopattributedmessage: 0
x-ms-traffictypediagnostic: VE1EUR01HT115:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CW98DEbIlwkCgLXIgefj9hwwWf5vpKKATt2PYonj4cJVHxHlaxqv0k5hzmkhjsP4XmOE+FczBtMRYe3J69UjJnWA0N0yPJ4lOuNI6I/1eQNrQUXtBvIfG0lhhacUG4BVe3CC6pxs/oRpkjbsZDGAwy2Kho9VL8EqVKv+bdPdGwG3xQ1POyFRiq7wqRzv9/K0
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 9545aa21-f7b9-4d5d-49fb-08d75c0ec961
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2019 01:24:47.8116
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1EUR01HT115
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Francois Buergisser <fbuergisser@chromium.org>

The setting of the motion vectors usage and the setting of motion
vectors address are currently done under different conditions.

When decoding pre-recorded videos, this results of leaving the motion
vectors address unset, resulting in faulty memory accesses. Fix it
by using the same condition everywhere, which matches the profiles
that support motion vectors.

Fixes: dea0a82f3d22 ("media: hantro: Add support for H264 decoding on G1")
Signed-off-by: Francois Buergisser <fbuergisser@chromium.org>
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/staging/media/hantro/hantro_g1_h264_dec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_g1_h264_dec.c b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
index 29130946dea4..a1cb18680200 100644
--- a/drivers/staging/media/hantro/hantro_g1_h264_dec.c
+++ b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
@@ -35,7 +35,7 @@ static void set_params(struct hantro_ctx *ctx)
 	if (sps->flags & V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD)
 		reg |= G1_REG_DEC_CTRL0_SEQ_MBAFF_E;
 	reg |= G1_REG_DEC_CTRL0_PICORD_COUNT_E;
-	if (dec_param->nal_ref_idc)
+	if (sps->profile_idc > 66 && dec_param->nal_ref_idc)
 		reg |= G1_REG_DEC_CTRL0_WRITE_MVS_E;
 
 	if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY) &&
@@ -245,7 +245,7 @@ static void set_buffers(struct hantro_ctx *ctx)
 	vdpu_write_relaxed(vpu, dst_dma, G1_REG_ADDR_DST);
 
 	/* Higher profiles require DMV buffer appended to reference frames. */
-	if (ctrls->sps->profile_idc > 66) {
+	if (ctrls->sps->profile_idc > 66 && ctrls->decode->nal_ref_idc) {
 		size_t pic_size = ctx->h264_dec.pic_size;
 		size_t mv_offset = round_up(pic_size, 8);
 
-- 
2.17.1

