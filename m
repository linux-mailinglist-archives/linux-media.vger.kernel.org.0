Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 183C9E7DE3
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2019 02:25:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728581AbfJ2BYz convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 28 Oct 2019 21:24:55 -0400
Received: from mail-oln040092064015.outbound.protection.outlook.com ([40.92.64.15]:56782
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728523AbfJ2BYy (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Oct 2019 21:24:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HwYWMTpavPJLAs26IMwPHzjSN1eU9XqP8T2UblmskOnVdxEdeYpI1jAB9AuZ8vT9rmrJ/P/1L1uC7xxIpYa9EM7bM+JSsfNIYFyrHvuDkoMxVjHb3fADNT3WwjpOLXGWu41hqTCLc+nDxQ6ZPSAe9oJ63Tc+92qAq2H0qQuyMNTcyqMlBhOJMR4dXYkkBvjZ+diLpC8YRV5ga9S3qTb6XiJ3HQU8vt7U3knwfqJy5T4j7LokdXHFSdKqpmGJ/MERfcB37aRaVmYkIqLDQKgIjersmukRz5uwWW+m8904pejSnFvFUoWVtLa7AoZpkgmZpCXx8FYKg9aERhtFS9dtKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bNtrZ6vGbJE0ObaYJ1TCXSY1JfUNEiTWQpJIa5L7DTg=;
 b=c6ec2MU3DVsofFpYoZsTbmRpquU1GaHsDZcM2IqbvaqDmG/ZiugkKmxvCmU5g1Pf2L0LxGmB98qhKQpFVYEFBQQ64yztToJ+LOmXfLv66rnega5J9Iu+53uzbS3/BKXrJFYhMf18K7FQmzGDRKsrj7+9t1MIZXPbcOj4/RFVwBKk+O/muLrdItHUu+OK6fuwsqCFGmNyoKr+CqV3+gEC0w0fs5zuHajciqxp9d3WY1PItglWGr2Khi7iVltmAOhcfOuER29hGerZfVGPn+FD6FYk/PuZPc1YwPozMUS3SX8/FbaUUr/hp5J4z9kqj6yHxIQPD0A/F8d/jCyqn2tIXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from VE1EUR01FT039.eop-EUR01.prod.protection.outlook.com
 (10.152.2.52) by VE1EUR01HT233.eop-EUR01.prod.protection.outlook.com
 (10.152.3.238) with Microsoft SMTP Server (version=TLS1_2,
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
Subject: [PATCH v2 06/10] media: hantro: Use capture buffer width and height
 for H264 decoding
Thread-Topic: [PATCH v2 06/10] media: hantro: Use capture buffer width and
 height for H264 decoding
Thread-Index: AQHVjfeo82jSI9YHWUmKxjQOPPg3vA==
Date:   Tue, 29 Oct 2019 01:24:50 +0000
Message-ID: <HE1PR06MB4011544CF7A6F36EF1CA47EEAC610@HE1PR06MB4011.eurprd06.prod.outlook.com>
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
x-incomingtopheadermarker: OriginalChecksum:6AE5A82A38F502B304B0D880C8C952D97A55CE5A850562E50F39267229963BF5;UpperCasedChecksum:8C667928A0E4582A42556D31631541D59224DA590EAEE6752BEBC21BD9E4F907;SizeAsReceived:7669;Count:49
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-tmn:  [gGim5ZXdx0JrTTBQtcpEMpeofKhUFehS]
x-microsoft-original-message-id: <20191029012430.24566-6-jonas@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 49
x-eopattributedmessage: 0
x-ms-traffictypediagnostic: VE1EUR01HT233:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 78uxsjHeZbfyP6b9FAVrA/uS9Woid0VBvu66jDqwaNQ4oyIr9ZKo0K8PDko2zeamSkvbZpBUJQtik5PGQ0L1cVjpYzlMFG9NHA/w2vSsYDrwoLnipLHfYA/Xi/p8XGO7/XgDSrFzkxzW3BjBavbGFdgEEK64eMEyrStu8tlstkCNnXF4BqBlxaIgGCcKbWnA
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: c880f473-f168-4298-ced7-08d75c0ecb38
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2019 01:24:50.8637
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1EUR01HT233
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Calculations for motion vector buffer offset is based on width and height
from the configured capture format, lets use the same values for macroblock
width and height hw regs.

Fixes: dea0a82f3d22 ("media: hantro: Add support for H264 decoding on G1")
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
Changes in v2:
  - new patch split from "media: hantro: Fix H264 motion vector buffer offset"
---
 drivers/staging/media/hantro/hantro_g1_h264_dec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_g1_h264_dec.c b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
index 71bf162eaf73..eeed11366135 100644
--- a/drivers/staging/media/hantro/hantro_g1_h264_dec.c
+++ b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
@@ -51,8 +51,8 @@ static void set_params(struct hantro_ctx *ctx)
 	vdpu_write_relaxed(vpu, reg, G1_REG_DEC_CTRL0);
 
 	/* Decoder control register 1. */
-	reg = G1_REG_DEC_CTRL1_PIC_MB_WIDTH(sps->pic_width_in_mbs_minus1 + 1) |
-	      G1_REG_DEC_CTRL1_PIC_MB_HEIGHT_P(sps->pic_height_in_map_units_minus1 + 1) |
+	reg = G1_REG_DEC_CTRL1_PIC_MB_WIDTH(MB_WIDTH(ctx->dst_fmt.width)) |
+	      G1_REG_DEC_CTRL1_PIC_MB_HEIGHT_P(MB_HEIGHT(ctx->dst_fmt.height)) |
 	      G1_REG_DEC_CTRL1_REF_FRAMES(sps->max_num_ref_frames);
 	vdpu_write_relaxed(vpu, reg, G1_REG_DEC_CTRL1);
 
-- 
2.17.1

