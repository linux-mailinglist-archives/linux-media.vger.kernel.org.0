Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23ACFA4973
	for <lists+linux-media@lfdr.de>; Sun,  1 Sep 2019 14:46:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728923AbfIAMps convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Sun, 1 Sep 2019 08:45:48 -0400
Received: from mail-oln040092066049.outbound.protection.outlook.com ([40.92.66.49]:33511
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728796AbfIAMps (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 1 Sep 2019 08:45:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NIeM3bkPKPTY9Cj2VyJSEJfBFqN99Mwshyetv9aE9IBPtijjPu8LnKicl+0EaUrKtxAC+c4ddJEtIH84XFyiXz0chc+VM1Pp+ZYkCD7CcZI3dou+v2NmG+Y2IXRN01vYTBnx/9X5ke8MAteB1cxOy5nym93U7DXg35lmwHLZ+KGBz+ozNnD1nkMKIk6soXfjUC7g+AoTl5i2insdTRDZAH4qhoJbDDFOBmk/UEcdasdLAokzw9IYubC3uxKhdY16+lpfz7zFj24k0tg5j3kRLnQwFv4kxn6Mn8G3QOfEaIpD0hdRNEfn8micLz3n2KsNZb9hVuiBBcDH9BbtgmlRkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lw7Bt98n5L10mThbFY2tt8yVsw+lHJ4yj4cdqD+fb0Y=;
 b=YyQVR2AWtTVHFh2Ccopa5r8nd7pmpMeYgw8A/k+Wfqj/Ru9Dp9k8w/0FMIQ3+wbJcE6yalzx12eq+qPizBM7oSF3vxX8/JMygIQF16vd2dtvcDF1Ngr+GeA8JEGpvi7L6edgkSR4NJ0zWgwSFIvY1kkVhUieDemyYl0gRv+ChjeoFZC3r21zv9Xcz8HFW98MSFdGMFL5rdc8sVSxVKBp3YxUr3U51m0W7nW9llp1hqxJLCApe+Nie8rJrSjGFOAqAPxU5u6cN8PW66Y7MjFNcHEpPjfpgadg1XnOojDkg/V6ZC11UfWOj5r+hQmr22/yH/+BTZ6XZTINX6pYampsdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from HE1EUR01FT057.eop-EUR01.prod.protection.outlook.com
 (10.152.0.54) by HE1EUR01HT115.eop-EUR01.prod.protection.outlook.com
 (10.152.1.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2220.16; Sun, 1 Sep
 2019 12:45:44 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.0.52) by
 HE1EUR01FT057.mail.protection.outlook.com (10.152.0.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.16 via Frontend Transport; Sun, 1 Sep 2019 12:45:44 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::a0ba:e766:2a23:2088]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::a0ba:e766:2a23:2088%3]) with mapi id 15.20.2199.021; Sun, 1 Sep 2019
 12:45:44 +0000
From:   Jonas Karlman <jonas@kwiboo.se>
To:     Ezequiel Garcia <ezequiel@collabora.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-rockchip@lists.infradead.org" 
        <linux-rockchip@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 04/12] media: hantro: Reduce H264 extra space for motion
 vectors
Thread-Topic: [PATCH 04/12] media: hantro: Reduce H264 extra space for motion
 vectors
Thread-Index: AQHVYMMrEJfGZ9HbrUSVxD/h4ic69A==
Date:   Sun, 1 Sep 2019 12:45:44 +0000
Message-ID: <HE1PR06MB4011D387573107C54185D528ACBF0@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <HE1PR06MB40117D0EE96E6FA638A04B78ACBF0@HE1PR06MB4011.eurprd06.prod.outlook.com>
 <20190901124531.23645-1-jonas@kwiboo.se>
In-Reply-To: <20190901124531.23645-1-jonas@kwiboo.se>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR05CA0343.eurprd05.prod.outlook.com
 (2603:10a6:7:92::38) To HE1PR06MB4011.eurprd06.prod.outlook.com
 (2603:10a6:7:9c::32)
x-incomingtopheadermarker: OriginalChecksum:B4297240E09998F234978948D481396A76F9DCABC8A70EBCDF478E74D986C822;UpperCasedChecksum:1C34746D4CAC2A7D159E524506B2DFC9F74C88DA3A98F310E3198A13AF2E3E93;SizeAsReceived:7900;Count:50
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-tmn:  [v/mcZ07sONr7zqg6vbP+ckjF8GBdDrLD]
x-microsoft-original-message-id: <20190901124531.23645-4-jonas@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 50
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031322404)(2017031323274)(2017031324274)(1601125500)(1603101475)(1701031045);SRVR:HE1EUR01HT115;
x-ms-traffictypediagnostic: HE1EUR01HT115:
x-microsoft-antispam-message-info: sEc1Oyzky77V2Xx732OTOEV8Pv1RzCpHWbYY5SctvPVRB1npnACb5bQvdgjIt/aA42m7Fz5yKWgFBGMHgPScfXepIBukz3jnrRVjRcVtWv64CrAlPleWaWGGhr6nvqxZlqvAl+c1I6qmo24mQTP7RETvXOV/4sQRKoQb8yB0lzx4ASfjH9+WqMLA/5c3PCqh
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ca6f34d-1e18-4cf6-84a1-08d72eda4db3
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2019 12:45:44.1006
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1EUR01HT115
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A decoded 8-bit 4:2:0 frame need memory for up to 448 macroblocks
with additional 32 bytes on multi-core variants.

Memory layout is as follow:

+-------------------+
| Y-plane   256 MBs |
+-------------------+
| UV-plane  128 MBs |
+-------------------+
| MV buffer  64 MBs |
+-------------------+
| MC sync  32 bytes |
+-------------------+

Reduce the extra space allocated now that motion vector buffer offset no
longer is based on the extra space.

Only use extra space for 64 MBs of motion vector buffer and 32 bytes for
multi-core sync.

Fixes: a9471e25629b ("media: hantro: Add core bits to support H264 decoding")
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/staging/media/hantro/hantro_v4l2.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
index 3dae52abb96c..3a360a6a17e2 100644
--- a/drivers/staging/media/hantro/hantro_v4l2.c
+++ b/drivers/staging/media/hantro/hantro_v4l2.c
@@ -242,12 +242,12 @@ static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f,
 		/*
 		 * The H264 decoder needs extra space on the output buffers
 		 * to store motion vectors. This is needed for reference
-		 * frames.
+		 * frames. 32 extra bytes is used for multi-core sync.
 		 */
 		if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_H264_SLICE)
 			pix_mp->plane_fmt[0].sizeimage +=
-				128 * DIV_ROUND_UP(pix_mp->width, 16) *
-				      DIV_ROUND_UP(pix_mp->height, 16);
+				64 * H264_MB_WIDTH(pix_mp->width) *
+				     H264_MB_WIDTH(pix_mp->height) + 32;
 	} else if (!pix_mp->plane_fmt[0].sizeimage) {
 		/*
 		 * For coded formats the application can specify
-- 
2.17.1

