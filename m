Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C0D698141
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2019 19:28:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728420AbfHUR1v convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 21 Aug 2019 13:27:51 -0400
Received: from mail-oln040092066094.outbound.protection.outlook.com ([40.92.66.94]:17564
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727022AbfHUR1v (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Aug 2019 13:27:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DeRH78s6StyMHi1vPMS7xKhhux0rsitG4w4vlQxTzKfkbVHbgAv/qpIq3/w75NlirQyS4N3aUmsiOYJwaBqir0NFZ1r9oPpxu08S5+tzSOYw7tuyKgJqq7brw0tkQftWUDEENU3lHTDxOGLPXOH+0YMgxAcTjSvNjejhCY4iM404q32q+lpp9a/tXvBsH/B1k0c9Rc6j9QBI8LlvU41GJczmOGNVOyNxKZ7jO5dfA28aiVxKFtGMfYV44kOT/ku6iqSTUUUilgSIKEqLRPAODYEg8YwlCd2E1VELN8s4lXEASlbXqLDWyi2epaz7SxdK44FHnpx5/MD5DDUnX4xwUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=glWX/RJ/utZoHGCZhTO1BE7hX5gqOXGqfUGPT1sTmN0=;
 b=ck4xbTjbduxF2lBD4OpyTWDWOTaJ69CsRSApPTptjvc53orwm+enDz7LKaAbjnwUOCpE4b0qTf8curbYnvnxwhdOat7TlmgkxZPTaIE5dWp0nsGKhxIGLvOJLnlK5GYng4hTHGWZLsyfy+aCg1GwL8LVs3WcW1ruUSJO18ULuoSM0ghu/PSIfYvUcefaR6Kz8qkdwGjjQ8Pfe01hZ2kyPOY7BWT2yyvzWc0EUWERtx0jo7ucQ+E/w9Xp5UagF50NfzPb6N0GnxnBJQT6mDAaGd5hP5HseNMiuZ+iQY+13jhHIaryyvt+Imr++XhxrcyMBfrjfFRk8/kVhTTylwm40g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from VE1EUR01FT021.eop-EUR01.prod.protection.outlook.com
 (10.152.2.53) by VE1EUR01HT201.eop-EUR01.prod.protection.outlook.com
 (10.152.3.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.13; Wed, 21 Aug
 2019 17:27:47 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.2.53) by
 VE1EUR01FT021.mail.protection.outlook.com (10.152.2.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.13 via Frontend Transport; Wed, 21 Aug 2019 17:27:47 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::a0ba:e766:2a23:2088]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::a0ba:e766:2a23:2088%3]) with mapi id 15.20.2178.020; Wed, 21 Aug 2019
 17:27:47 +0000
From:   Jonas Karlman <jonas@kwiboo.se>
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
CC:     Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "linux-rockchip@lists.infradead.org" 
        <linux-rockchip@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH] media: hantro: Enable VP8 decoding on RK3328
Thread-Topic: [PATCH] media: hantro: Enable VP8 decoding on RK3328
Thread-Index: AQHVWEXAbuiwMpKTK0OtyOz+u3RpMA==
Date:   Wed, 21 Aug 2019 17:27:47 +0000
Message-ID: <HE1PR06MB4011F3DB984CB3BFE210DB12ACAA0@HE1PR06MB4011.eurprd06.prod.outlook.com>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0902CA0009.eurprd09.prod.outlook.com
 (2603:10a6:3:e5::19) To HE1PR06MB4011.eurprd06.prod.outlook.com
 (2603:10a6:7:9c::32)
x-incomingtopheadermarker: OriginalChecksum:2F5F2A9495C1777DF11185D205B187942F05CF4B2DF281429480DA1AF526802E;UpperCasedChecksum:3ED5E9CE293436B5ED6B36A18CFF49D6F83F4F23F5A9D7351D4150856FC7C5D8;SizeAsReceived:7547;Count:48
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-tmn:  [KDCaQEt0RBZ5hJ2WXuSpPwO9MK2ppmYW]
x-microsoft-original-message-id: <20190821172715.16909-1-jonas@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 48
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031322404)(2017031323274)(2017031324274)(1601125500)(1603101475)(1701031045);SRVR:VE1EUR01HT201;
x-ms-traffictypediagnostic: VE1EUR01HT201:
x-microsoft-antispam-message-info: GEWK2dxq/itMx8J5UYm03dKK9tsntUCH6TC6NB95mW4L81cvkGUhzAVUZ+KNak9w0cfecHdlMJkmK4ZiWAtgLD1OKxHsoWtKHTREZelARUmGRK5QI3JFmQCvzW40hp3hd/tTzS+yPElOlQckGF/LOw8Ecwdvp3+iywSZ7ZarORJ43NMPUyR8Kg2f2fGtQmeN
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 46fd3108-3a36-41fe-543c-08d7265ce22a
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2019 17:27:47.7211
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1EUR01HT201
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

RK3328 SoC has the same decoder IP block as RK3399,
lets enable VP8 decoding on RK3328.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/staging/media/hantro/rk3399_vpu_hw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/hantro/rk3399_vpu_hw.c b/drivers/staging/media/hantro/rk3399_vpu_hw.c
index 414b1d3fbb1f..14d14bc6b12b 100644
--- a/drivers/staging/media/hantro/rk3399_vpu_hw.c
+++ b/drivers/staging/media/hantro/rk3399_vpu_hw.c
@@ -213,7 +213,7 @@ const struct hantro_variant rk3328_vpu_variant = {
 	.dec_offset = 0x400,
 	.dec_fmts = rk3399_vpu_dec_fmts,
 	.num_dec_fmts = ARRAY_SIZE(rk3399_vpu_dec_fmts),
-	.codec = HANTRO_MPEG2_DECODER,
+	.codec = HANTRO_MPEG2_DECODER | HANTRO_VP8_DECODER,
 	.codec_ops = rk3399_vpu_codec_ops,
 	.irqs = rk3328_irqs,
 	.num_irqs = ARRAY_SIZE(rk3328_irqs),
-- 
2.17.1

