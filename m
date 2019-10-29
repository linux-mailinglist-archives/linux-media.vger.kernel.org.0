Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C946E7DE1
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2019 02:25:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728551AbfJ2BYx convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 28 Oct 2019 21:24:53 -0400
Received: from mail-oln040092066099.outbound.protection.outlook.com ([40.92.66.99]:32085
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728445AbfJ2BYx (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Oct 2019 21:24:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=foDg+z3ACmPyZQCPSp6f68ox5bq6nonodXB8sD/IkA3HEzUrKfjNq+zp9bcV9k/BWyJiRnBZ34lL2FwU40AV+jtk1qldYPC17WioRkrfubj8OgJn0cUSbJmV0YCdTdDvFjInnyMnTkrKjvIil3ZEWDsYG4n8zUlEsDsGJd9L5HZehS/5i8TJ6sj5E5ovXdw3DalhEIMjGnjISDpHPHW/JJ163nDEGbGtwK3OFxx6Yq4Z071WE3fkMXD6qo6g4TUTn8H19MofxIl28cAwdRCqyO2EvmUvpPAmXu38FZMPPiOHpXgd/wps884xBcKLYpJy0zyPqU6Hg1P9uG8K2rHHrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XyXz7Yc9Hv1qOM3igLbfydxqYNhZoxCA4rytODrLUxo=;
 b=hwFGJ5W4e93lRPEq50pvOwpXDHl0Mk+GzWOf7/kNLUboHcjjzVHZ+HsLOOmqssyHTI0vIsdXUieHPE0iSgiDSR3PNF7Ysa13Bz0rDF0DGfDlvyg1xPDO95vloWo5ctK8gDdD3IFBH5EmW624mksMVF5lVjsSVNSsNS1mB98CzOpYxjnYOOvyiPqZfVifxsnBoskPR3nqQH3ZCrkeNMh14EK60rhlrm7lzf6wRl5vV4ueNeUzUKUH751mZqQiCpJJSmcuE7dBkmAZDSz0/P0sVjxH4G2bFojDZhOcB0LrH0BbGf9fkLyOe79daaN8IkD8Q4vq+/TeKzBEC76srbWASA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from VE1EUR01FT039.eop-EUR01.prod.protection.outlook.com
 (10.152.2.53) by VE1EUR01HT139.eop-EUR01.prod.protection.outlook.com
 (10.152.3.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2387.20; Tue, 29 Oct
 2019 01:24:50 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.2.56) by
 VE1EUR01FT039.mail.protection.outlook.com (10.152.3.35) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20 via Frontend Transport; Tue, 29 Oct 2019 01:24:50 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::b1cf:db6f:95fc:84cc]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::b1cf:db6f:95fc:84cc%7]) with mapi id 15.20.2387.025; Tue, 29 Oct 2019
 01:24:50 +0000
From:   Jonas Karlman <jonas@kwiboo.se>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>
CC:     Jonas Karlman <jonas@kwiboo.se>, Hans Verkuil <hverkuil@xs4all.nl>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 05/10] media: hantro: Reduce H264 extra space for motion
 vectors
Thread-Topic: [PATCH v2 05/10] media: hantro: Reduce H264 extra space for
 motion vectors
Thread-Index: AQHVjfeo82yZ/o1JSUKXch8trRudlg==
Date:   Tue, 29 Oct 2019 01:24:50 +0000
Message-ID: <HE1PR06MB4011C972A372449941929026AC610@HE1PR06MB4011.eurprd06.prod.outlook.com>
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
x-incomingtopheadermarker: OriginalChecksum:A47A365794BAB41714C3A544477806C33515EC5B456862A11A8C6B1084E7AD17;UpperCasedChecksum:2608D3E58CDA59C206FD4A05819EECE95D372DDC48620A78E867D595CDEE02F4;SizeAsReceived:7647;Count:49
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-tmn:  [YnRDKRoe9ImjT5DU6PZRPyKiBR9En3Gl]
x-microsoft-original-message-id: <20191029012430.24566-5-jonas@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 49
x-eopattributedmessage: 0
x-ms-traffictypediagnostic: VE1EUR01HT139:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gyX33lnAAr6Yjw+C6isqyL9Zw1+9Y4LIkpJMzAWOOc6jyt6OISgd/xIa9rYOol2msgWE2pDjgASXEGyCMPK6/W9l0oZvelAIu5huBG+KstHFiuUYtQST7+ZvBxmlKrlzpJXx5aR351eKNJQapnzKDNcLjm8zhw5ZhJBEzC7C96bd6Wvc+1/BRRenW9D4J7LF
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: a100ff32-346b-4a92-59d3-08d75c0ecac7
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2019 01:24:50.1661
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1EUR01HT139
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
---
Changes in v2:
  - updated commit message
---
 drivers/staging/media/hantro/hantro_v4l2.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
index 3dae52abb96c..b3a4368b37de 100644
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
+				64 * MB_WIDTH(pix_mp->width) *
+				     MB_WIDTH(pix_mp->height) + 32;
 	} else if (!pix_mp->plane_fmt[0].sizeimage) {
 		/*
 		 * For coded formats the application can specify
-- 
2.17.1

