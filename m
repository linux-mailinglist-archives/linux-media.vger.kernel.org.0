Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D16CE7D62
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2019 01:00:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729718AbfJ2AA4 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 28 Oct 2019 20:00:56 -0400
Received: from mail-oln040092065064.outbound.protection.outlook.com ([40.92.65.64]:50946
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725951AbfJ2AA4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Oct 2019 20:00:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DtdO1Zht61E72udO30h9oq59X5JvtlvTpX4Vb0194VFQx50yDcpNehrIHxuCEcPc+6/qwCevRSMw1shPzhkmN+C5GJAgslK/EF0gobWRiW7AWDvU7EagHGk9ifyxck0QDaLjTQSzPDT8Ciwuk9hWKqDLEHPPrd3itmDxT1zQUjL7GwLcttAg48mYdumjtEm0yUOqKpmrQ75acV+XjM+BStQMP2r/Z/oL2pbI1kmF2R+O186UJYCztZYHH2N6cW2DJt5z5riutoFWlCxWA1oEd+Bgv7zYsw0DFLIi4Gz6AiiVG5BTVUlSKC6bb+ZBav00TMjW5KlAKYv33uiep8LZnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QXtVI7VP240TSK9n8Q1V7bsae2yNe1cSHVzcwTCjbKM=;
 b=Lq7UeB+A40qRRtjZNrxL8EuQ8UDCD1d4zJ5FCt1285vwmQp/gopOnEG9L0dEXGBcdSlupdYnQOO6BMQhhrkuVbD9SzWsbJDZhpsxe0NmliuUxR0vPW9k/XT1om2Y525TnKuqRyIgHI5Z4fY9hYO/tcyEfiJTYE9hmGYcAiWD4OCjc80fiVSK261tpIY+7T/hPZStQLaKGrvIX1k0Ww4PhxTzYOIYCTqAv49/I81PzGSl8NCvqecT4KNUChP1yI51fa/1jTrPqXY5vTRgvwUaXXqno+MdSJb/ycaRknIlF1ufwLabdaPqnU2eQ1oWN4aYLSpkb//Uk2eqvv7poNcvpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from VE1EUR01FT033.eop-EUR01.prod.protection.outlook.com
 (10.152.2.57) by VE1EUR01HT086.eop-EUR01.prod.protection.outlook.com
 (10.152.3.1) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2387.20; Tue, 29 Oct
 2019 00:00:51 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.2.51) by
 VE1EUR01FT033.mail.protection.outlook.com (10.152.2.230) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20 via Frontend Transport; Tue, 29 Oct 2019 00:00:51 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::b1cf:db6f:95fc:84cc]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::b1cf:db6f:95fc:84cc%7]) with mapi id 15.20.2387.025; Tue, 29 Oct 2019
 00:00:51 +0000
From:   Jonas Karlman <jonas@kwiboo.se>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
CC:     Jonas Karlman <jonas@kwiboo.se>, Hans Verkuil <hverkuil@xs4all.nl>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/3] media: uapi: h264: clarify expected scaling_list_4x4/8x8
 order
Thread-Topic: [PATCH 1/3] media: uapi: h264: clarify expected
 scaling_list_4x4/8x8 order
Thread-Index: AQHVjevtJ+L50WvpIk+wlVAYjSNOrQ==
Date:   Tue, 29 Oct 2019 00:00:51 +0000
Message-ID: <HE1PR06MB4011E174FC8A19141A3ABE95AC610@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <HE1PR06MB4011D3B8C200D13829648D86AC660@HE1PR06MB4011.eurprd06.prod.outlook.com>
In-Reply-To: <HE1PR06MB4011D3B8C200D13829648D86AC660@HE1PR06MB4011.eurprd06.prod.outlook.com>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM3PR07CA0087.eurprd07.prod.outlook.com
 (2603:10a6:207:6::21) To HE1PR06MB4011.eurprd06.prod.outlook.com
 (2603:10a6:7:9c::32)
x-incomingtopheadermarker: OriginalChecksum:5D63E8D52D94AE0F32F63CEDBEAEABB9312346FCE2E99E48E88A41E96D84CE47;UpperCasedChecksum:DFEB48380540C9B25A0039388BC59437720F5665B65A410302968041236B42A0;SizeAsReceived:7857;Count:49
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-tmn:  [nLVzJ5VF1BY77PkmAJZY0nPsOlUPiZDp]
x-microsoft-original-message-id: <20191029000033.13540-1-jonas@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 49
x-eopattributedmessage: 0
x-ms-traffictypediagnostic: VE1EUR01HT086:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 84zX2eniEQfw2pfV32RshKPtacn4kWrUr8XfHHIJxiAYHW+ttq6rZc9nkIIjV3whfu06p6g1p3RPDrej6kF0f2zddyXzRPewWd0vq96RUxnOVujM0KWkY3DvjV9COtLS2xdCBbE/e09YU8jowg3omJ8douQ0b43ze/ZYkRRISro6g6ObPbBNFG1RBD5Bf165
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 2497b034-9a76-4cc4-19fa-08d75c030f77
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2019 00:00:51.3583
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1EUR01HT086
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Clarify that the expected order of scaling lists should follow the order
they are listed in the H264 standard.

The expected scaling list order,
for 4x4: Intra Y, Intra Cb, Intra Cr, Inter Y, Inter Cb, Inter Cr,
for 8x8: Intra Y, Inter Y, Intra Cb, Inter Cb, Intra Cr, Inter Cr.

Also clarify that the values in a scaling list should be in matrix order,
the same value order that vaapi, vdpau and nvdec use.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 Documentation/media/uapi/v4l/ext-ctrls-codec.rst | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
index a1209f68c5e8..28313c0f4e7c 100644
--- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
+++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
@@ -1713,10 +1713,14 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
 
     * - __u8
       - ``scaling_list_4x4[6][16]``
-      -
+      - Scaling matrix after applying the inverse scanning process.
+        Expected list order is Intra Y, Intra Cb, Intra Cr, Inter Y,
+        Inter Cb, Inter Cr.
     * - __u8
       - ``scaling_list_8x8[6][64]``
-      -
+      - Scaling matrix after applying the inverse scanning process.
+        Expected list order is Intra Y, Inter Y, Intra Cb, Inter Cb,
+        Intra Cr, Inter Cr.
 
 ``V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS (struct)``
     Specifies the slice parameters (as extracted from the bitstream)
-- 
2.17.1

