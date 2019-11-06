Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CDA8F21C9
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2019 23:35:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732791AbfKFWfP convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 6 Nov 2019 17:35:15 -0500
Received: from mail-oln040092064088.outbound.protection.outlook.com ([40.92.64.88]:28165
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727328AbfKFWfP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 Nov 2019 17:35:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dwifi2WHenyUWZUFnMZcujqZLMuRxKAyvETGvkdnFFi6uS+u88X1LPh9IPAhk+H+GkNODmp0K0YajEFUIkMi7oduCLedXnwk9SAqamS8plArmlNG8qJEOV+7DNMd+L9nBOykDD7xyUE8vY1KDSUfWWRU4Hf2jx9Qj9fDmC5nsHLhSf4Qh8iJcsLzeRsjzN2JQSEL7OPX08JxCNjwRC0qoYYR9pn/lXHaXYOWfble54xQxYf4ft8jG5PH/oe5pi0RHPI8F9+ZrhnAtTroUZH59E3fGJKcKmJ/XNKYZeLKhSjHwDAXTzEg48yTD1qwkvsipXykY0cdkEp60diOSQFg4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1OPe+fb97oluh+t9hbwEkniByC1FC63cXM4fZqXncXQ=;
 b=eznjEPhLh4p5wskj4svgGT7eSVVkrigsEUyepDvi6XuuzcuTxe8wA+Y1nqxZpvKMzI8SxNstDHDy5s07ajWCY22S+P9I8NrLqfDVRezUcB9UkvEmc8kPEKhPikyOUOzmHUau3qQ2vSSTiLOGn/Vnv1H8byxAlBS88Af3BIf2kjTZ/sqEwIhZprF82fa5S6qd8FzBUa6T1DEcRvXGCP/7+blrgywA+etVX6uQXMLiBLnPcjcuTLMqPekiX9TAaDAZyQ/fQHqh3Z9ytkykmZP2EgI6r8NNvZQmqO+Dtqn+liDNr7Q7rL1sw2aHsp9FZUSZIZeaTTULGBz0xpMx7L/ZsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from HE1EUR01FT023.eop-EUR01.prod.protection.outlook.com
 (10.152.0.51) by HE1EUR01HT196.eop-EUR01.prod.protection.outlook.com
 (10.152.1.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2387.20; Wed, 6 Nov
 2019 22:35:11 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.0.53) by
 HE1EUR01FT023.mail.protection.outlook.com (10.152.0.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20 via Frontend Transport; Wed, 6 Nov 2019 22:35:11 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::b1cf:db6f:95fc:84cc]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::b1cf:db6f:95fc:84cc%7]) with mapi id 15.20.2408.028; Wed, 6 Nov 2019
 22:35:11 +0000
From:   Jonas Karlman <jonas@kwiboo.se>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>
CC:     Jonas Karlman <jonas@kwiboo.se>, Hans Verkuil <hverkuil@xs4all.nl>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 5/5] media: hantro: Set H264 FIELDPIC_FLAG_E flag correctly
Thread-Topic: [PATCH v3 5/5] media: hantro: Set H264 FIELDPIC_FLAG_E flag
 correctly
Thread-Index: AQHVlPJzwQY9pzF2rE6i7nBwc3b4fQ==
Date:   Wed, 6 Nov 2019 22:35:11 +0000
Message-ID: <HE1PR06MB4011FC02825E5F2B2389263EAC790@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <HE1PR06MB4011EDD5F2686A05BC35F61CAC790@HE1PR06MB4011.eurprd06.prod.outlook.com>
 <20191106223456.2231-1-jonas@kwiboo.se>
In-Reply-To: <20191106223456.2231-1-jonas@kwiboo.se>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::21)
 To HE1PR06MB4011.eurprd06.prod.outlook.com (2603:10a6:7:9c::32)
x-incomingtopheadermarker: OriginalChecksum:7A9562009A8B0CFA8ECB4EEBEA733DEA74AADFEDAA30AF7EB6AAE8BB6879FBEC;UpperCasedChecksum:10FD2EF91D6F598D1E1723089999768EF23398A1230DE31A40DD434EAD160D73;SizeAsReceived:7611;Count:49
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-tmn:  [oS3SogeI94SO73Q6naetwVMvFASxWXfs]
x-microsoft-original-message-id: <20191106223456.2231-2-jonas@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 49
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 6d1ea9ed-32e4-41d3-1797-08d763099540
x-ms-traffictypediagnostic: HE1EUR01HT196:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WHNDBMUDpqIzdC+81JDr/cTZRrtqaB6v1P8R2b+cGmRGlmVZktfze2+FIN0OLkBYNH6A3iXsLt+/lFpLt3s6zVT94O/AcNW3b0+ibaCO7qCIpWHtZEKi2fwzzX7MRc4baVxAxZWaGgvD9i/oq05R4rkhjJUtP1jvcmqql1X3NWb5XVXuBn7t8hQHONJPrdLB
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d1ea9ed-32e4-41d3-1797-08d763099540
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2019 22:35:11.2471
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1EUR01HT196
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
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/staging/media/hantro/hantro_g1_h264_dec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/hantro/hantro_g1_h264_dec.c b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
index 27d40d8d3728..3cd40a8f0daa 100644
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

