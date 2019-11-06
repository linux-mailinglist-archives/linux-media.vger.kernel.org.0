Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1122F21C5
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2019 23:35:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732704AbfKFWfO convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 6 Nov 2019 17:35:14 -0500
Received: from mail-oln040092066068.outbound.protection.outlook.com ([40.92.66.68]:25767
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726817AbfKFWfO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 Nov 2019 17:35:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bj/2W6dBnX9pmVSDMxEmH0wS2Myl7AllBkfYlIP3MCDzn0udqP8GCMeot189Gf+KLvz9PVDJRREW3VrNjgjSKSK2m6mCJZBGyv3Bqe4NLeg2Qy8UIsb4XuHzFFmCM/womD9upsrRnfR5yL7O77mS6xjapsWEbNMJzToDJ099hRw+GVpr/qgFreefyg05VhZ2YEhvGMuglBEJjWYaMArzdZgLuSHNlShQ9oR1Ny63Wy9ZM4sa0voxeC1k7pzrjJ08Sn1kFRIt5ZqFOWt29etk2kvsAgCdFEF2qgem33GyvlL0CVM4HJckp5zdQjF+PMbdeQTp3F3U+TDZ360ejmwPrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KsBpexsyKw6BXJAqCMkBPQhOWuqmNJ/8OoDhePT0nvg=;
 b=Hfo3aPVwuK9H8ogyXfB5L9l/bLjkEKb8dhsS04I3lZxSfDdHR3z0g8QF8rPdXwJ/TmLft8cMAyp7uyrQWIqqhtQFuYkQOZP+vJBpDgotKTAhWJRqbao5D6aMp73ChoimV92lxxdLDheyeLW3rM2h1ez42lqkaQ5YiHd94fv3Lc4TSGqL89uWGbttwELP8sqcwaB5r596PPkPRUozg68mGSGvWKb5p+fh1hASqnEUyL1mRlEaVtbdgOCqp5M+ckcIeBOcq+hXs1PIWf0fzayabQQ7E5yI2dIpVgt390lyKV9mHX4di+/ps3+BghIghbZoA5nLmNVm3KWsJGC5USUlEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from HE1EUR01FT023.eop-EUR01.prod.protection.outlook.com
 (10.152.0.54) by HE1EUR01HT107.eop-EUR01.prod.protection.outlook.com
 (10.152.0.246) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2387.20; Wed, 6 Nov
 2019 22:35:10 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.0.53) by
 HE1EUR01FT023.mail.protection.outlook.com (10.152.0.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20 via Frontend Transport; Wed, 6 Nov 2019 22:35:10 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::b1cf:db6f:95fc:84cc]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::b1cf:db6f:95fc:84cc%7]) with mapi id 15.20.2408.028; Wed, 6 Nov 2019
 22:35:10 +0000
From:   Jonas Karlman <jonas@kwiboo.se>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>
CC:     Jonas Karlman <jonas@kwiboo.se>, Hans Verkuil <hverkuil@xs4all.nl>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 4/5] media: hantro: Remove now unused H264 pic_size
Thread-Topic: [PATCH v3 4/5] media: hantro: Remove now unused H264 pic_size
Thread-Index: AQHVlPJy2NHdaG7jCEe3VRcs+EOxMw==
Date:   Wed, 6 Nov 2019 22:35:10 +0000
Message-ID: <HE1PR06MB40112D58AC070DD9EDF889E0AC790@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <HE1PR06MB4011EDD5F2686A05BC35F61CAC790@HE1PR06MB4011.eurprd06.prod.outlook.com>
In-Reply-To: <HE1PR06MB4011EDD5F2686A05BC35F61CAC790@HE1PR06MB4011.eurprd06.prod.outlook.com>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::21)
 To HE1PR06MB4011.eurprd06.prod.outlook.com (2603:10a6:7:9c::32)
x-incomingtopheadermarker: OriginalChecksum:BFDCAEF492AF37A0F06B337CE238938FB5A52ECB6D05F246CA369CAE3B125038;UpperCasedChecksum:FCAD9F7EC7CFF1985DDFB07246F8BD5F56FCDB7B8CD1309E5CAEDD35F6AA66D0;SizeAsReceived:7585;Count:49
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-tmn:  [HGWCUkckwjlwcd01mHSOEmw8yKPFrP2P]
x-microsoft-original-message-id: <20191106223456.2231-1-jonas@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 49
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 212f4cad-133e-4435-387e-08d7630994da
x-ms-traffictypediagnostic: HE1EUR01HT107:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wO6AtUeqbMXSPLQYlJOQyynDSMzLc/zX+IwvqIPa1gtzeF++YQfqtSrExVncgAZIIbF7SRdoLc4koJCQmQuPSj35hJguO1xoxYhk+lUE9rNIVCJ/gN95ZC7gmcHGSr0qWt+E9pYDowTegOHl4nXjNli2UcbfYwPAi3yjmve0thvypeSWaFJzj/sjF4lWynhG
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 212f4cad-133e-4435-387e-08d7630994da
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2019 22:35:10.2917
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1EUR01HT107
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

pic_size in hantro_h264_dec_hw_ctx struct is no longer used,
lets remove it.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
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

