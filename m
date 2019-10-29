Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 039EBE7DE5
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2019 02:25:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728662AbfJ2BZB convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 28 Oct 2019 21:25:01 -0400
Received: from mail-oln040092064074.outbound.protection.outlook.com ([40.92.64.74]:7032
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728275AbfJ2BYw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Oct 2019 21:24:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oh3pGrsfwoLKzLw6R0R02TqUv8feNXZIcY9/egyxpmD5sbFIBG0TkEnPZZ/0EAXXavKS02XTDCyWa3fWFsy8Wu/MGLwpt5KSBt66YbJVcB8d66BqZrnTmt1gEHco4ojCJF/1xAY1hzkO+7cA5c/UDvl+TC64zM6sOm7nLB7s7JqSLiclXeDKLLh/T9aiySEqF5dUN7LXMwoGCR0EgXkP8W2D8h/omRgzsR1LEqSGIOxKaDmQ20qoP/pcDjwSN9qiHm05pNsIrYoMz8x8vpWwWQeTLtPASwhDM0jWwOxKUDA87gnOPNXc7FYG7YoX/0RIs5gadGK4OlHrEvVKvXvu+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mbdkoqxue9SdJx1tURxrk9ixGLHYdCMeZY0sSbKNWeE=;
 b=JUki1tvHgyGO8Bwmol16o0bXXG9mWhjiCwRIlIgTlx3rBMcIi40TM97CZnfSmDdCLX+Q+zV6kYgyWbA8XK0lXaUEJ/rYURI4nUXuaIMgT5D8hbMrAjXgRWnsKOYE+FCvCtQGkdAhwGQ7tzUFE4ScActCc3k5mizjAOiA4rbnYqaBOs4mboQ0qr26rvLlqIybZ/4jIBF84UiQO0Zv+PU+y4cU9iq7f91RRbM+56f3If1fsHQPHRsHnlaYMDVemxDhxvXyGudH1iSZic7tJDYUV91Qw2q2CL8LnkFqmErHLHeYVDlBvanjRQyNynf0RV+rOQxZKa4s+Tiqy5rI9m6jeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from VE1EUR01FT039.eop-EUR01.prod.protection.outlook.com
 (10.152.2.60) by VE1EUR01HT223.eop-EUR01.prod.protection.outlook.com
 (10.152.3.189) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2387.20; Tue, 29 Oct
 2019 01:24:49 +0000
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
Subject: [PATCH v2 03/10] media: hantro: Fix picture order count table enable
Thread-Topic: [PATCH v2 03/10] media: hantro: Fix picture order count table
 enable
Thread-Index: AQHVjfenW+QV7xN1iEKvDJAzBRe6dQ==
Date:   Tue, 29 Oct 2019 01:24:48 +0000
Message-ID: <HE1PR06MB4011525BAC0F0F1DC419EB7EAC610@HE1PR06MB4011.eurprd06.prod.outlook.com>
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
x-incomingtopheadermarker: OriginalChecksum:A8EDAC8130853A12E0A455885BE22E70B93C42578BBD656B34E7F3E6588FB43A;UpperCasedChecksum:B406E0A90BB57025A2D11D8C2C35EE9CE132AA4162E818331F567F9D0A9C674B;SizeAsReceived:7662;Count:49
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-tmn:  [g3fkyxEr0Fweu1dI25Or8bnhRokza/OS]
x-microsoft-original-message-id: <20191029012430.24566-3-jonas@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 49
x-eopattributedmessage: 0
x-ms-traffictypediagnostic: VE1EUR01HT223:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 08Y7M+FKsyI7Fmhevi7siRIe4oaNmxgm1rQVhDQpzuyz05xY0ysaZP3iYmSO1JDJcEne1W25f6vAfyIqaVely/R7dclzGvTKwty9R2tCNVTA3Ldg7u5ZSQFitNzvJVGnM/oWaeG2+HO0ToGQiQWx64r5vBonvys9G3FJJ4rQEAzZ0HhZ1x12k+Duw/lhnsax
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a7ae417-87ce-4eb2-2b2f-08d75c0ec9d7
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2019 01:24:48.6371
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1EUR01HT223
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Francois Buergisser <fbuergisser@chromium.org>

The picture order count table only makes sense for profiles
higher than Baseline. This is confirmed by the H.264 specification
(See 8.2.1 Decoding process for picture order count), which
clarifies how POC are used for features not present in Baseline.

"""
Picture order counts are used to determine initial picture orderings
for reference pictures in the decoding of B slices, to represent picture
order differences between frames or fields for motion vector derivation
in temporal direct mode, for implicit mode weighted prediction in B slices,
and for decoder conformance checking.
"""

As a side note, this change matches various vendors downstream codebases,
including ChromiumOS and IMX VPU libraries.

Fixes: dea0a82f3d22 ("media: hantro: Add support for H264 decoding on G1")
Signed-off-by: Francois Buergisser <fbuergisser@chromium.org>
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/staging/media/hantro/hantro_g1_h264_dec.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_g1_h264_dec.c b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
index a1cb18680200..70a6b5b26477 100644
--- a/drivers/staging/media/hantro/hantro_g1_h264_dec.c
+++ b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
@@ -34,9 +34,11 @@ static void set_params(struct hantro_ctx *ctx)
 	reg = G1_REG_DEC_CTRL0_DEC_AXI_WR_ID(0x0);
 	if (sps->flags & V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD)
 		reg |= G1_REG_DEC_CTRL0_SEQ_MBAFF_E;
-	reg |= G1_REG_DEC_CTRL0_PICORD_COUNT_E;
-	if (sps->profile_idc > 66 && dec_param->nal_ref_idc)
-		reg |= G1_REG_DEC_CTRL0_WRITE_MVS_E;
+	if (sps->profile_idc > 66) {
+		reg |= G1_REG_DEC_CTRL0_PICORD_COUNT_E;
+		if (dec_param->nal_ref_idc)
+			reg |= G1_REG_DEC_CTRL0_WRITE_MVS_E;
+	}
 
 	if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY) &&
 	    (sps->flags & V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD ||
-- 
2.17.1

