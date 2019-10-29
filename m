Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E39EE7D63
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2019 01:00:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727384AbfJ2AA4 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 28 Oct 2019 20:00:56 -0400
Received: from mail-oln040092064091.outbound.protection.outlook.com ([40.92.64.91]:54624
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726510AbfJ2AA4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Oct 2019 20:00:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YItapuOlhIfFvDcO98xL3Tm1S0sfgYTT1Vvahufk5pQX1ePH5C2174+7ua9dHMzDxw68TKfU/rXHrMTyhGiG1F2T9Ho4RBEjZqjz5AqxQDhCv1kuWzCm0TuqlOVW6Av2+YkWg+A5GeoCxZEVr8DCieOH45OYm0+86aYF3Q6mFkz7YuHwByzgzqpMWPnLApF6pZq4wZRELQNh8sR70Dym1M+aB8F8zoCKepY98yGZFU/NgAlXod4QQLDeBw1BDvnDxDhdjAWdc9tZXcjccCy72j8BFOedf+O4nNlZmdXgEtZyRGeUyYmbLAuhAkyrynalVToekqsUAVUD+yoGS1tasw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qhY84JGQL+LsClwI5c+VltZa9XncY2TaTLjtP/tdtNM=;
 b=Lh9Lw3cXia10tK8ZaXl+mZgVJzg1n8NkPOMtsaYBFuq53g/XqS22KEFx4I9jg5Rc0tBBuQbz19km3dirFUCkOlmsJskzHisqr0LxIuuwO+B2tTsYhe0NBkN45INFY/pGaqkx4BWXdjCJCflwl4rwtAJ8EBciBY5Ljwv+TUGnaxNKEp4U1HU71miZNVTwG68btzT57K4SidVsKxbP8ex5aE3qHGFE3YrSfpcQOgakvcNcInynZkn6jFXuBQM3LBkibUVaIPLDmLkLP5+hOJvz7CAE6l/RHZCtCe7bDmmIuOv8X1KX4Pph7gxFu1NsRympi9WW6rsGO+P37nnOCF0p5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from VE1EUR01FT033.eop-EUR01.prod.protection.outlook.com
 (10.152.2.51) by VE1EUR01HT116.eop-EUR01.prod.protection.outlook.com
 (10.152.2.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2387.20; Tue, 29 Oct
 2019 00:00:52 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.2.51) by
 VE1EUR01FT033.mail.protection.outlook.com (10.152.2.230) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20 via Frontend Transport; Tue, 29 Oct 2019 00:00:52 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::b1cf:db6f:95fc:84cc]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::b1cf:db6f:95fc:84cc%7]) with mapi id 15.20.2387.025; Tue, 29 Oct 2019
 00:00:52 +0000
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
Subject: [PATCH 2/3] media: cedrus: Use correct H264 8x8 scaling list
Thread-Topic: [PATCH 2/3] media: cedrus: Use correct H264 8x8 scaling list
Thread-Index: AQHVjevtToLePUba9keRVf8adq/S/Q==
Date:   Tue, 29 Oct 2019 00:00:52 +0000
Message-ID: <HE1PR06MB4011189B5455E402FACE08C2AC610@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <HE1PR06MB4011D3B8C200D13829648D86AC660@HE1PR06MB4011.eurprd06.prod.outlook.com>
 <20191029000033.13540-1-jonas@kwiboo.se>
In-Reply-To: <20191029000033.13540-1-jonas@kwiboo.se>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM3PR07CA0087.eurprd07.prod.outlook.com
 (2603:10a6:207:6::21) To HE1PR06MB4011.eurprd06.prod.outlook.com
 (2603:10a6:7:9c::32)
x-incomingtopheadermarker: OriginalChecksum:A97F9B700A7DF12A4E0FA950D5AA1F37E1C92B71B8885AB55572D16CF0391841;UpperCasedChecksum:D198B57F43084CE59C2A08EED393459EF892AE0E9894D2D87BE0D011E5B3A808;SizeAsReceived:7826;Count:49
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-tmn:  [1QdvK4xjjAOf5d0vmcj4nqmyh4tfbhvo]
x-microsoft-original-message-id: <20191029000033.13540-2-jonas@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 49
x-eopattributedmessage: 0
x-ms-traffictypediagnostic: VE1EUR01HT116:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sX6go5H26QBPuRSnISoAcJbG0rnLP3Wlpczt1JEo0nEtsNj8rAEz2fG9Cz2Qazh2UqnRXpkNQS1JQ885Hzkf7F8HACAAOPIZxlS+3npGFw9P4AciI6hnViK1+kHN4vpxSD8gnPg1TuRgIMFNR7zhr5wh0jfwyz+tgjKBK+9KKB7r16biHGHWw33BiqkKNrhs
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 9364eb9a-68fb-4ab3-6474-08d75c031030
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2019 00:00:52.6606
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1EUR01HT116
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Documentation now define the expected order of scaling lists,
change to use correct indices.

Fixes: 6eb9b758e307 ("media: cedrus: Add H264 decoding support")
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/staging/media/sunxi/cedrus/cedrus_h264.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
index cd85668f9c80..f08cc0d4079e 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
@@ -240,8 +240,8 @@ static void cedrus_write_scaling_lists(struct cedrus_ctx *ctx,
 			       sizeof(scaling->scaling_list_8x8[0]));
 
 	cedrus_h264_write_sram(dev, CEDRUS_SRAM_H264_SCALING_LIST_8x8_1,
-			       scaling->scaling_list_8x8[3],
-			       sizeof(scaling->scaling_list_8x8[3]));
+			       scaling->scaling_list_8x8[1],
+			       sizeof(scaling->scaling_list_8x8[1]));
 
 	cedrus_h264_write_sram(dev, CEDRUS_SRAM_H264_SCALING_LIST_4x4,
 			       scaling->scaling_list_4x4,
-- 
2.17.1

