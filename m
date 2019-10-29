Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C13BE7DEF
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2019 02:26:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728845AbfJ2BZ1 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 28 Oct 2019 21:25:27 -0400
Received: from mail-oln040092066048.outbound.protection.outlook.com ([40.92.66.48]:1507
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728754AbfJ2BZ1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Oct 2019 21:25:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cfgWIjlvzt6bg+FSZq+/mUddgeOSEjIrDzTa3nSV1S5sghGEGoPJh5pqMuPBQbKfamG+fwIwDERUl0X1LXoNLZrxtFA81YIgc3WhMin0DIXHEDtThv/HLys7frjoOAN++GhtDOx8TM5Hej5e0+xQg3wpQE4fm8dWDCn6KzyayyVz+QYnvEjvvlnKpV5GZ35Fx7XeRlWjueyBfftpbnIzBQRhg7i37YFouXOFrnNKz6Wcz4eGQf+CyTtyIt952lKq2eAdzx+5uTsepTU+SdowgMpOOs2FrOyjhpNEuaCnGkd04y7mmZeFnToF/7mFaXw2hCEeGXDkDGGVdCpufjMFtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZWLA17RhTy/P12QWhXV/uUeryxHKqnl0eWMaGIQpmRo=;
 b=IqQHwSqd88prj5TGFubSeCFvNX5JBvKksTJUMpKhESrgLoFlyGFL+bKikiWEtux/ExrBO11IoH/fsYNny9YfBNA9eGdK7Zy5PwjEwVj8Fr5aFghFpJYahJgJ+qNUa/mCbrt307GOpnA0kyUgfVBgXS2Fk80J9g0Dpw0Syn/7czy+X+hZtviOSCEQtt6pTeBCbeE6mLufNHNAToX8obj3htMKoq6i5cbb9bd1YJdL7HgkPn1eqshyTRhrKbUmIlSd3b/1Xg9TNpj6AktRItA9B6tm2QQrpDMikjiVmAReIK6y5WLvSYyarmRQtVFUt/Xtk0A+KhLQvq+nd817m9BTGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from VE1EUR01FT039.eop-EUR01.prod.protection.outlook.com
 (10.152.2.55) by VE1EUR01HT182.eop-EUR01.prod.protection.outlook.com
 (10.152.3.169) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2387.20; Tue, 29 Oct
 2019 01:24:51 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.2.56) by
 VE1EUR01FT039.mail.protection.outlook.com (10.152.3.35) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20 via Frontend Transport; Tue, 29 Oct 2019 01:24:51 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::b1cf:db6f:95fc:84cc]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::b1cf:db6f:95fc:84cc%7]) with mapi id 15.20.2387.025; Tue, 29 Oct 2019
 01:24:51 +0000
From:   Jonas Karlman <jonas@kwiboo.se>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>
CC:     Jonas Karlman <jonas@kwiboo.se>, Hans Verkuil <hverkuil@xs4all.nl>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 07/10] media: hantro: Remove now unused H264 pic_size
Thread-Topic: [PATCH v2 07/10] media: hantro: Remove now unused H264 pic_size
Thread-Index: AQHVjfepVNzXvr4wxEChzENhNjxOww==
Date:   Tue, 29 Oct 2019 01:24:51 +0000
Message-ID: <HE1PR06MB4011F0A6FB7B474D16DD7957AC610@HE1PR06MB4011.eurprd06.prod.outlook.com>
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
x-incomingtopheadermarker: OriginalChecksum:DA2863AF379F9D4AC40C3B3D740CD38C289EA01DAAAA39200AD3BDE89C895BC5;UpperCasedChecksum:D54D73927F7BE65D119DCC12801521C0C0A62EB3F909A56BF22BDF47BDC7D2A9;SizeAsReceived:7620;Count:49
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-tmn:  [/1ht+c4wAinBGu7RZ8ipog7S040cACHf]
x-microsoft-original-message-id: <20191029012430.24566-7-jonas@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 49
x-eopattributedmessage: 0
x-ms-traffictypediagnostic: VE1EUR01HT182:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: N9Bb1jj9HaBi0RVe4ZeDxonXOSs6nopA58mr/CpG72pHR2a7mhlJAx2ROMs0b/jVoknUbMUOzCwrQyFKnVw/vXY22PT2mSIw6fnQM7IogPQMd04GxS1iWt68M7h6Jy1TO/a/Ucvhg8VXku0OovBSlkPmrQIZTN4prGp2a6D6orNUpsgsUSM1Yi/JciGJqIuW
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: bad8c7ea-194b-493c-77bc-08d75c0ecbad
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2019 01:24:51.7002
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1EUR01HT182
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

pic_size in hantro_h264_dec_hw_ctx struct is no longer used,
lets remove it.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/staging/media/hantro/hantro_h264.c | 5 -----
 drivers/staging/media/hantro/hantro_hw.h   | 3 ---
 2 files changed, 8 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_h264.c b/drivers/staging/media/hantro/hantro_h264.c
index 694a330f508e..568640eab3a6 100644
--- a/drivers/staging/media/hantro/hantro_h264.c
+++ b/drivers/staging/media/hantro/hantro_h264.c
@@ -618,7 +618,6 @@ int hantro_h264_dec_init(struct hantro_ctx *ctx)
 	struct hantro_h264_dec_hw_ctx *h264_dec = &ctx->h264_dec;
 	struct hantro_aux_buf *priv = &h264_dec->priv;
 	struct hantro_h264_dec_priv_tbl *tbl;
-	struct v4l2_pix_format_mplane pix_mp;
 
 	priv->cpu = dma_alloc_coherent(vpu->dev, sizeof(*tbl), &priv->dma,
 				       GFP_KERNEL);
@@ -629,9 +628,5 @@ int hantro_h264_dec_init(struct hantro_ctx *ctx)
 	tbl = priv->cpu;
 	memcpy(tbl->cabac_table, h264_cabac_table, sizeof(tbl->cabac_table));
 
-	v4l2_fill_pixfmt_mp(&pix_mp, ctx->dst_fmt.pixelformat,
-			    ctx->dst_fmt.width, ctx->dst_fmt.height);
-	h264_dec->pic_size = pix_mp.plane_fmt[0].sizeimage;
-
 	return 0;
 }
diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
index 69b88f4d3fb3..fa91dd1848b7 100644
--- a/drivers/staging/media/hantro/hantro_hw.h
+++ b/drivers/staging/media/hantro/hantro_hw.h
@@ -80,15 +80,12 @@ struct hantro_h264_dec_reflists {
  * @dpb:	DPB
  * @reflists:	P/B0/B1 reflists
  * @ctrls:	V4L2 controls attached to a run
- * @pic_size:	Size in bytes of decoded picture, this is needed
- *		to pass the location of motion vectors.
  */
 struct hantro_h264_dec_hw_ctx {
 	struct hantro_aux_buf priv;
 	struct v4l2_h264_dpb_entry dpb[HANTRO_H264_DPB_SIZE];
 	struct hantro_h264_dec_reflists reflists;
 	struct hantro_h264_dec_ctrls ctrls;
-	size_t pic_size;
 };
 
 /**
-- 
2.17.1

