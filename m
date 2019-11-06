Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22897F21C3
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2019 23:34:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732707AbfKFWe0 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 6 Nov 2019 17:34:26 -0500
Received: from mail-oln040092064030.outbound.protection.outlook.com ([40.92.64.30]:63302
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727295AbfKFWe0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 Nov 2019 17:34:26 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YbCd/jqbCMLrLbUAXxXKsQLSWStfKuG1+2hqGzMSf3lVOkyc6ReHLsUIgmKFO2IMd2qjPYw9Z+6N2hFxpJPpyWpkMy5uV7e/Mgq1iS59IOxYWj9mcZhy4BuiNhjXUk0H42d6Qtp/NYW6ikliYUhi4uv7CEis9jxkBEY9GmrAlvpgH6+lwSdew7mSd+wGn7CcYrLkav5Nso+6wzwDOZOIslAcHzua0Di/NzKLeRLjbi2Mio9dsp54gwTzUUGEYZwKAcdSO9tKxm3r6cZX7L1X9fvE40yKPQ8UEr7chjgB1Kbcws9OC+89zxv83D4okhKFKeuKGSFgpqTBjfdiQcG4Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Z/DbCNA0HKcJJbeiit76tQEXESJJ6W+etRZNRa1dP8=;
 b=cdGtbpoC/V1RNRt0UzliDVBeY2/FHNi64Yvj9nKtQBDII3x2pE9jeIg0WuKoTL3VO6j0RNKkq79RPbCJzo1FsUvrFIZn/QmJQ0v/ZNLbI0D1YLasYK9WTNv8qlFnKxTn5l76lWHSuP5POWZbBh4wQY54kTfwfbItN2oeEXFFcTTEEyK8lhh1a2TyScIbX4Zu0rOWl18rlYHOYmscUkaUDWCOxv+CRUjp+ZzVlTuNkgqJe1rR/ev5FduXLN3qNjl5DGCXO/slqm9ef3lhXm1BYMv/OYakPXDoDKaMlkd+ZPOjodx5hWbSIFJxgQA2s+ycbDz9AGTVvtzU+/LKj81Ljw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from HE1EUR01FT023.eop-EUR01.prod.protection.outlook.com
 (10.152.0.53) by HE1EUR01HT148.eop-EUR01.prod.protection.outlook.com
 (10.152.0.232) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2387.20; Wed, 6 Nov
 2019 22:34:21 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.0.53) by
 HE1EUR01FT023.mail.protection.outlook.com (10.152.0.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20 via Frontend Transport; Wed, 6 Nov 2019 22:34:21 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::b1cf:db6f:95fc:84cc]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::b1cf:db6f:95fc:84cc%7]) with mapi id 15.20.2408.028; Wed, 6 Nov 2019
 22:34:21 +0000
From:   Jonas Karlman <jonas@kwiboo.se>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>
CC:     Jonas Karlman <jonas@kwiboo.se>, Hans Verkuil <hverkuil@xs4all.nl>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 2/5] media: hantro: Reduce H264 extra space for motion
 vectors
Thread-Topic: [PATCH v3 2/5] media: hantro: Reduce H264 extra space for motion
 vectors
Thread-Index: AQHVlPJVZ936l8/120Gju1K8MGGoAA==
Date:   Wed, 6 Nov 2019 22:34:21 +0000
Message-ID: <HE1PR06MB4011FF930111A869E4645C8CAC790@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <HE1PR06MB4011EDD5F2686A05BC35F61CAC790@HE1PR06MB4011.eurprd06.prod.outlook.com>
 <20191106223408.2176-1-jonas@kwiboo.se>
In-Reply-To: <20191106223408.2176-1-jonas@kwiboo.se>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0402CA0025.eurprd04.prod.outlook.com
 (2603:10a6:7:7c::14) To HE1PR06MB4011.eurprd06.prod.outlook.com
 (2603:10a6:7:9c::32)
x-incomingtopheadermarker: OriginalChecksum:4431E710FC8B7AA902B43480A0F327D3C2AEE2F00E233BD68ECD68FFAB9517A0;UpperCasedChecksum:FCA02FB32EFD1856BF9C2821DD0D8D5530699A64FB342215CB564A5F9683D3C5;SizeAsReceived:7640;Count:49
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-tmn:  [4waR297pjFE6rBd6s39yeErM6q8pH/st]
x-microsoft-original-message-id: <20191106223408.2176-2-jonas@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 49
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 064d899d-de47-4aca-4e4e-08d7630977c2
x-ms-traffictypediagnostic: HE1EUR01HT148:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nj6hr1NfnlhOfctausY9Rh8vpUSUS1Ynn03J/KTxPDb25+70jVcdGienmnsu1LGdQ8aVFQIQ20JQfq+gn51H0eSN+3MNukLx+m8SOCQW2OwtTuoH9dZzgeVsiWeYVqwqLkMNyvx/ptkgBrsohcOCLJr/6i+B7X8lsbP6HO8ILp1EAXwOOEQXRxwGqb+bqR5E
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 064d899d-de47-4aca-4e4e-08d7630977c2
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2019 22:34:21.5880
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1EUR01HT148
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A decoded 8-bit 4:2:0 frame need memory for up to 448 bytes per
macroblock with additional 32 bytes on multi-core variants.

Memory layout is as follow:

+---------------------------+
| Y-plane   256 bytes x MBs |
+---------------------------+
| UV-plane  128 bytes x MBs |
+---------------------------+
| MV buffer  64 bytes x MBs |
+---------------------------+
| MC sync          32 bytes |
+---------------------------+

Reduce the extra space allocated now that motion vector buffer offset no
longer is based on the extra space.

Only allocate extra space for 64 bytes x MBs of motion vector buffer
and 32 bytes for multi-core sync.

Fixes: a9471e25629b ("media: hantro: Add core bits to support H264 decoding")
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
Changes in v3:
  - add memory layout to code comment (Boris)
Changes in v2:
  - updated commit message
---
 drivers/staging/media/hantro/hantro_v4l2.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
index 3dae52abb96c..c8c896a06f58 100644
--- a/drivers/staging/media/hantro/hantro_v4l2.c
+++ b/drivers/staging/media/hantro/hantro_v4l2.c
@@ -240,14 +240,30 @@ static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f,
 		v4l2_fill_pixfmt_mp(pix_mp, fmt->fourcc, pix_mp->width,
 				    pix_mp->height);
 		/*
+		 * A decoded 8-bit 4:2:0 NV12 frame may need memory for up to
+		 * 448 bytes per macroblock with additional 32 bytes on
+		 * multi-core variants.
+		 *
 		 * The H264 decoder needs extra space on the output buffers
 		 * to store motion vectors. This is needed for reference
 		 * frames.
+		 *
+		 * Memory layout is as follow:
+		 *
+		 * +---------------------------+
+		 * | Y-plane   256 bytes x MBs |
+		 * +---------------------------+
+		 * | UV-plane  128 bytes x MBs |
+		 * +---------------------------+
+		 * | MV buffer  64 bytes x MBs |
+		 * +---------------------------+
+		 * | MC sync          32 bytes |
+		 * +---------------------------+
 		 */
 		if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_H264_SLICE)
 			pix_mp->plane_fmt[0].sizeimage +=
-				128 * DIV_ROUND_UP(pix_mp->width, 16) *
-				      DIV_ROUND_UP(pix_mp->height, 16);
+				64 * MB_WIDTH(pix_mp->width) *
+				     MB_WIDTH(pix_mp->height) + 32;
 	} else if (!pix_mp->plane_fmt[0].sizeimage) {
 		/*
 		 * For coded formats the application can specify
-- 
2.17.1

