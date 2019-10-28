Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 428B8E7D58
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2019 00:59:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729074AbfJ1X7Z convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 28 Oct 2019 19:59:25 -0400
Received: from mail-oln040092066087.outbound.protection.outlook.com ([40.92.66.87]:26615
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725951AbfJ1X7Z (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Oct 2019 19:59:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FgdUu/N37ZrXeORuXqrrvIedZMl9B7hymMpwQH2Y3rRa77adewZg6YbAx2ajEjewcOIrb4qI5bM4bkAFqQkOLUK2olwqASOXvWRtfN7MEfUCSrPUfmX+GlPJhWjACLQ+IZSLLclRL8yoBQ3f7tFwMAHGOeSQAzosn9iYyob3vaMCWxw+NT2UlmNGJpR0JmVn12SLiQZ+bCgeeczaysbmB1jHZX9UTCy6sxo8C8SJTZFmnJu5yDDMxokpwW2lTom727R2XDb3YUIoazmMkb3yT2LGTeuxrgR/6g16CobfSJNI9F3drx9HqoyVVsnl/YXD18luRQY3ykml0PAdhkemXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0guVEAM4gvARIEGkxOBk/y5mkJPBDeAw9uqMShafNH4=;
 b=IfBpIeeclwhK949/N5KscRy3tO+Y01QVWJ8Ey6QxjxwCwleG98oeUSZDIQxAdjvL00dTiu9ugJmQcdMGO+8gi+bgn+WEUbDrd8mtc+BUpYd5p8ogaqyjghYhcEBknG/AZSFrKD94QTS6ASGETHpiG1aIzEqCywOOxSJxOWNXK+t/EbSPXObvpun/Z2mge35iony2T0HQbn6gw5cwtqg+XJt1sQGpghSY/0b1N7BEoASgmc6Otkh5/rG7XctuHarxV8bEGKWGGiv+Vkd5F7CqCD4QqARf1o0X252LhLnL+dSS9YEX/oXqwaKpF7zfQwjz7k+d9/JnOPaZgR8ut3hrJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from VE1EUR01FT033.eop-EUR01.prod.protection.outlook.com
 (10.152.2.59) by VE1EUR01HT230.eop-EUR01.prod.protection.outlook.com
 (10.152.3.214) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2387.20; Mon, 28 Oct
 2019 23:59:21 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.2.51) by
 VE1EUR01FT033.mail.protection.outlook.com (10.152.2.230) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20 via Frontend Transport; Mon, 28 Oct 2019 23:59:21 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::b1cf:db6f:95fc:84cc]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::b1cf:db6f:95fc:84cc%7]) with mapi id 15.20.2387.025; Mon, 28 Oct 2019
 23:59:20 +0000
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
Subject: [PATCH 0/3] media: uapi: h264: clarify expected scaling list order
Thread-Topic: [PATCH 0/3] media: uapi: h264: clarify expected scaling list
 order
Thread-Index: AQHVjeu3dy81TAwYmEyjctNGvFIgqA==
Date:   Mon, 28 Oct 2019 23:59:20 +0000
Message-ID: <HE1PR06MB4011D3B8C200D13829648D86AC660@HE1PR06MB4011.eurprd06.prod.outlook.com>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR06CA0102.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::43) To HE1PR06MB4011.eurprd06.prod.outlook.com
 (2603:10a6:7:9c::32)
x-incomingtopheadermarker: OriginalChecksum:6930FCBDB8FA4E42FE39AEB45C14AA429A977ADF7B00162D2E000457ED822758;UpperCasedChecksum:04B2E817A52969BAF3C3B257E46894891D2C29F77DB15DE5754AED832A811088;SizeAsReceived:7658;Count:47
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-tmn:  [fOa/MAEXHSWYUt6xU9RxICC9OcQYJvuk]
x-microsoft-original-message-id: <20191028235902.13486-1-jonas@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 47
x-eopattributedmessage: 0
x-ms-traffictypediagnostic: VE1EUR01HT230:
x-ms-exchange-purlcount: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6lY20dd1wBidLQxfolgn3+3Ol8qV2fhaGCdGp5Z7LyfDSDMAUNDS9PdLATlcJmAt1v0YLRkGpgTqIYh9YHvuPPpgOFuKrB8OPsAL/vaJgCvB3/QFBWHbvk8SH4ylkV1b5J7jxrZ62v6e1wDqk22x1aoayLcaeiouX4oCcYlGJhxDuFuexWHhQgipfQVP+9e9/I6MbifwxtnhEQE9BBUcdaIT0piq+tWbXpIJtb751bg=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: d195b223-6d5c-43dd-6e77-08d75c02d960
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2019 23:59:20.9176
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1EUR01HT230
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is a suggested clarification on the expect order of lists and values
to use in the H264 scaling matrix ctrl, cedrus and hantro currently expect
values in two different orders.

The suggestion is to use the same value order that vaapi, vdpau and nvdec use,
i.e. have the scaling list values in "matrix order"/"raster order",
after the inverse scanning process has been applied.

This also contains a clarification on the order of the scaling lists.

Expected scaling list order will be,
for 4x4: Intra Y, Intra Cb, Intra Cr, Inter Y, Inter Cb, Inter Cr,
for 8x8: Intra Y, Inter Y, Intra Cb, Inter Cb, Intra Cr, Inter Cr.

This series is based on feedback and discussion of [1]

[1] https://patchwork.linuxtv.org/patch/58525/

Jonas Karlman (3):
  media: uapi: h264: clarify expected scaling_list_4x4/8x8 order
  media: cedrus: Use correct H264 8x8 scaling list
  media: hantro: Do not reorder H264 scaling list

 .../media/uapi/v4l/ext-ctrls-codec.rst        |  8 ++-
 drivers/staging/media/hantro/hantro_h264.c    | 51 +++++--------------
 .../staging/media/sunxi/cedrus/cedrus_h264.c  |  4 +-
 3 files changed, 20 insertions(+), 43 deletions(-)

-- 
2.17.1

