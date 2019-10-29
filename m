Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67759E7DF8
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2019 02:26:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728998AbfJ2B0D convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 28 Oct 2019 21:26:03 -0400
Received: from mail-oln040092066055.outbound.protection.outlook.com ([40.92.66.55]:3138
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728978AbfJ2B0D (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Oct 2019 21:26:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F7MXrH4qGIzMzoZTinbu+ITxc6Zyf/HZO3PrqUPb3BZzmA7GuPMmOfJ5/zJjSSM6xTILWXHxBXstDPKYi+4ooNDaV8iRYdwH1YbQDspt0plzp2T8igLkxPUZSCdgjlD2KLCnwW38wj63t+ruJz7ReG+9MngAndsoCQ8iZiamDrpAfFkxHneR6UQoWJ3JFaMK4po0T8vEi7C9UelomwO+6Sxa8/ybd4S0hnAenRbXpZ8UqBFyId4TqegXNaSCmvbp3NutcZuzfDs0zPDmpkG7/ILd/jPcOk5+Mg+SDt2NSyh8tnhfdS5Z/UdYWAUzizWXIGfDbnZQgB7fyrBkq0Ba9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fUXWKGJjsKsF53zm9MGKy1D9n1aFly1AT9vrIQSgEvc=;
 b=EJsT+cHwtez19zPO5SDiVgV0YdSroLp/w7mxiKWR+ggV4TBFlKmtF4NQyu9uP2pS7UngQ4hGY0wwiUAboEqCjzSkl6/nd3CFCGMebH4LZODZDdzkEkLEgLYZegHWdqLGzMZFsruBgF5rILcR0cfTjENE5RyzCBwfoKIOWrT3Co4B4/9xqLoSPhfafo3qnQt69y/X19QhEuGru00GLwJ6+r3lykaLNoZenZo0gHbn/Cz1uLd1/Eje08ITednqm/gQ1LufavD1861RyVz2dDakFE8yhIf2q/1x1MJcm1N0zHIsQPzCGUElNdGhm+rYt66mcdvUzRv9dZNk6CfPLySx5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from VE1EUR01FT039.eop-EUR01.prod.protection.outlook.com
 (10.152.2.60) by VE1EUR01HT188.eop-EUR01.prod.protection.outlook.com
 (10.152.3.211) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2387.20; Tue, 29 Oct
 2019 01:26:00 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.2.56) by
 VE1EUR01FT039.mail.protection.outlook.com (10.152.3.35) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20 via Frontend Transport; Tue, 29 Oct 2019 01:26:00 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::b1cf:db6f:95fc:84cc]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::b1cf:db6f:95fc:84cc%7]) with mapi id 15.20.2387.025; Tue, 29 Oct 2019
 01:26:00 +0000
From:   Jonas Karlman <jonas@kwiboo.se>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>
CC:     Jonas Karlman <jonas@kwiboo.se>, Hans Verkuil <hverkuil@xs4all.nl>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 08/10] media: hantro: Set H264 FIELDPIC_FLAG_E flag
 correctly
Thread-Topic: [PATCH v2 08/10] media: hantro: Set H264 FIELDPIC_FLAG_E flag
 correctly
Thread-Index: AQHVjffSvhTEZV4MtESzVZoKJ6SaYw==
Date:   Tue, 29 Oct 2019 01:26:00 +0000
Message-ID: <HE1PR06MB401120C5E10154E39D0C9865AC610@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <HE1PR06MB401108289F09802C261374F8AC610@HE1PR06MB4011.eurprd06.prod.outlook.com>
In-Reply-To: <HE1PR06MB401108289F09802C261374F8AC610@HE1PR06MB4011.eurprd06.prod.outlook.com>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR05CA0354.eurprd05.prod.outlook.com
 (2603:10a6:7:92::49) To HE1PR06MB4011.eurprd06.prod.outlook.com
 (2603:10a6:7:9c::32)
x-incomingtopheadermarker: OriginalChecksum:71609C14098BAD96D2C40504CBA11777430D3F58488070B2D133B90DF3C9E5C3;UpperCasedChecksum:2EEEC8F3F3969A35FC7792BF040722842D4D7774F87AB4D6F618D21B7C95FB72;SizeAsReceived:7614;Count:49
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-tmn:  [YQd7JpoAtTmp6k7A6sfIt2aYZjgbHAyf]
x-microsoft-original-message-id: <20191029012550.24628-1-jonas@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 49
x-eopattributedmessage: 0
x-ms-traffictypediagnostic: VE1EUR01HT188:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sJSlAQLo0ftQwHpiZM3IaeF6OdnlA343JREWLW2Xba06QlCLYgfTlFu2OMug8PD/jmdXOnuzSUthJX8J3EDGZdb6q3MHneqEGot7Ox/XWDI8CSEnV7LMbE00EQ/eg2fRKbn+rwRSyv9KV/zqrr82ilqUzdSLHwDzMEvXhfbqlJVvBd9co0r2XpAx4KcDTHhA
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 0abe0bde-b04d-44f0-2a9a-08d75c0ef4ce
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2019 01:26:00.5942
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1EUR01HT188
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The FIELDPIC_FLAG_E bit should be set when field_pic_flag exists in stream,
it is currently set based on field_pic_flag of current frame.
The PIC_FIELDMODE_E bit is correctly set based on the field_pic_flag.

Fix this by setting the FIELDPIC_FLAG_E bit when frame_mbs_only is not set.

Fixes: dea0a82f3d22 ("media: hantro: Add support for H264 decoding on G1")
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/staging/media/hantro/hantro_g1_h264_dec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/hantro/hantro_g1_h264_dec.c b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
index eeed11366135..c07da0ee4973 100644
--- a/drivers/staging/media/hantro/hantro_g1_h264_dec.c
+++ b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
@@ -63,7 +63,7 @@ static void set_params(struct hantro_ctx *ctx)
 	/* always use the matrix sent from userspace */
 	reg |= G1_REG_DEC_CTRL2_TYPE1_QUANT_E;
 
-	if (slices[0].flags &  V4L2_H264_SLICE_FLAG_FIELD_PIC)
+	if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY))
 		reg |= G1_REG_DEC_CTRL2_FIELDPIC_FLAG_E;
 	vdpu_write_relaxed(vpu, reg, G1_REG_DEC_CTRL2);
 
-- 
2.17.1

