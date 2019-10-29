Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CD98E7DE8
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2019 02:25:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728412AbfJ2BYv convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 28 Oct 2019 21:24:51 -0400
Received: from mail-oln040092064104.outbound.protection.outlook.com ([40.92.64.104]:11301
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727778AbfJ2BYv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Oct 2019 21:24:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CDuaTpyMaoG8+FJkf945hSqh6/hSGZrt6yM7Tm4hC740nnvYp7D/vzeFgUS/4/e9zIUfUqVI+7liZwnTx9Gtrnlw5dpwCi7D4xW51aaLTx3AepKSZvOHDMC3rtUnsr+sXYHyoF5Esz7y5PAQNqcKC9XG75zWCympksxr/iA7pM1S6R5BhN1lcB+eb3oU9kJXFY5/HUyEysD0hOmPblJp+HDlImdMKXsajHUlloSZSyJTWjrYHqK7t8CJONymYfJAJQwKptM4f7Hy7hPDbBnO6j1HS5gyOh2jjIX+amo8kO6461odiwZ3FsqztQoC3mOYz8k275M9ILMDrRtZ2xG5aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7aLbhRJQoRv2DXpWYkLeNE9oJuFhpQAK5mAIz92B5Jw=;
 b=Im1SV0MKhn4fWu3YzTl4/BS6V8BxjvEexmDoX6SpKk6g8xNLYaRSDnrLaeg9mOU+WTTiNb6O6QrdLt3CJFxVTUUvVT86XdYQUVW0lzTEwAPGoFaOhZxDBJ0K5raellDPCmsi0CaiSPgDvfZRq6u/FgNlMueWfavHUoSMGwAj5aO0RYQpccRVWGD1yd8Tc9rRrBsK61VhFGNmFHzyQvY+2qn/j+uQG3ZMLNz1AE1u4l/ruEeCz776jXNpJKlJ9gJRLsSL4+F0CRsLjQaSI1oBdriASqzB0fb5bxJEtF5aVCtZcXST0dpWkqbNFNqi0C096cERf/r+9NppkQglly9Uuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from VE1EUR01FT039.eop-EUR01.prod.protection.outlook.com
 (10.152.2.52) by VE1EUR01HT233.eop-EUR01.prod.protection.outlook.com
 (10.152.3.238) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2387.20; Tue, 29 Oct
 2019 01:24:47 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.2.56) by
 VE1EUR01FT039.mail.protection.outlook.com (10.152.3.35) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20 via Frontend Transport; Tue, 29 Oct 2019 01:24:47 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::b1cf:db6f:95fc:84cc]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::b1cf:db6f:95fc:84cc%7]) with mapi id 15.20.2387.025; Tue, 29 Oct 2019
 01:24:47 +0000
From:   Jonas Karlman <jonas@kwiboo.se>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>
CC:     Jonas Karlman <jonas@kwiboo.se>, Hans Verkuil <hverkuil@xs4all.nl>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 01/10] media: hantro: Fix H264 max frmsize supported on
 RK3288
Thread-Topic: [PATCH v2 01/10] media: hantro: Fix H264 max frmsize supported
 on RK3288
Thread-Index: AQHVjfemF2XvaXcsWUeIJgC1r9NXOw==
Date:   Tue, 29 Oct 2019 01:24:47 +0000
Message-ID: <HE1PR06MB4011858F97A96AD25E75E2E1AC610@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <HE1PR06MB401108289F09802C261374F8AC610@HE1PR06MB4011.eurprd06.prod.outlook.com>
In-Reply-To: <HE1PR06MB401108289F09802C261374F8AC610@HE1PR06MB4011.eurprd06.prod.outlook.com>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR09CA0090.eurprd09.prod.outlook.com
 (2603:10a6:7:3d::34) To HE1PR06MB4011.eurprd06.prod.outlook.com
 (2603:10a6:7:9c::32)
x-incomingtopheadermarker: OriginalChecksum:192CDE21F026038C37B37A2D09E211DEE81BE0F4D1F06E5EC2C0B84E0A7BF455;UpperCasedChecksum:9C4E6B40C89998D2CA4EA53A00051C034470684507E784F215BFE37BCF94CA52;SizeAsReceived:7626;Count:49
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-tmn:  [NGBzO9L4KPIYzf53JaOBTEWZ16gEAj3B]
x-microsoft-original-message-id: <20191029012430.24566-1-jonas@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 49
x-eopattributedmessage: 0
x-ms-traffictypediagnostic: VE1EUR01HT233:
x-ms-exchange-purlcount: 2
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +ckwbhAQx/6R/M7DnKFCEr0XO/f1I10d4KLlLfjdj7CTPRw2/zMeBT2qtWPvFJ7+Fb9riz9Rw2JtusrX8u6RgWbacvvciVmpCcJEug/ptU0XfUgXX0ge+MtETxcnn5zD0ht6O9FYxsYHiaujKMHBbi0ziQ+n+V9V0xif50jTVsATrjV7GWLyr2YNctDi+NHCFVbfhyx7mSSJ8OOZfn+BuAXiWAgVqQShUEoH0w0gHGE=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: eabb34eb-f2ba-44c8-ad2c-08d75c0ec8f8
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2019 01:24:47.0660
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1EUR01HT233
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

TRM specify supported image size 48x48 to 4096x2304 at step size 16 pixels,
change frmsize max_width/max_height to match TRM at [1].

This patch makes it possible to decode the 4096x2304 sample at [2].

[1] http://www.t-firefly.com/download/firefly-rk3288/docs/TRM/rk3288-chapter-25-video-encoder-decoder-unit-(vcodec).pdf
[2] https://4ksamples.com/puppies-bath-in-4k/

Fixes: 760327930e10 ("media: hantro: Enable H264 decoding on rk3288")
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
Changes in v2:
  - updated commit message with reference to TRM and sample video
---
 drivers/staging/media/hantro/rk3288_vpu_hw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/hantro/rk3288_vpu_hw.c b/drivers/staging/media/hantro/rk3288_vpu_hw.c
index c0bdd6c02520..f8db6fcaad73 100644
--- a/drivers/staging/media/hantro/rk3288_vpu_hw.c
+++ b/drivers/staging/media/hantro/rk3288_vpu_hw.c
@@ -67,10 +67,10 @@ static const struct hantro_fmt rk3288_vpu_dec_fmts[] = {
 		.max_depth = 2,
 		.frmsize = {
 			.min_width = 48,
-			.max_width = 3840,
+			.max_width = 4096,
 			.step_width = MB_DIM,
 			.min_height = 48,
-			.max_height = 2160,
+			.max_height = 2304,
 			.step_height = MB_DIM,
 		},
 	},
-- 
2.17.1

