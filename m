Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82B04F21C2
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2019 23:34:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732603AbfKFWeZ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 6 Nov 2019 17:34:25 -0500
Received: from mail-oln040092064089.outbound.protection.outlook.com ([40.92.64.89]:1540
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727196AbfKFWeY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 Nov 2019 17:34:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TKuAAqqErqVSIIsX42VVD2yIxIpsHRb7chTY8nddYT6aDvbFkHvAZwpyiLmgb4xkQeuVq8c7o4Uz+KGiHvBOrOM+SOIWGeQTMy7H7NwNa6mUQQoJEZmzLFeO4y4OcD/bJ5ayv8A4OiAIcg+CkCUkQ1yb4dmTmOyCg3MYN1dLxLyVHXDqfj0z+s/VydNai1d1fFxWrlHTBu4mr/xtLS4GDtOOohth3XMIVC2fq7N8H8uQbI9sS8xMjq9SJxc8TcI27WhcI7clzEZZKhH7Fmznr4dGDrY+Q4pkCYj/iJSBuQy75aNbHALwX7oqx0rkmJ334F5E6FgLImpnAMZ1b4+qhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uAj2ozVkjfB+JihtA9gKeRVdQ+3AHZIj4mAcf8+U6YE=;
 b=SKMyCuNZl2xfLa9XPkMq9q07YpQ3Ao5veFO1gALOr0wjmlezvnLGCxv09Q5cefYYl5a3mhcRv+/0nlIOxuKCqMsL5YThe6cKpE2WNu277vlrLNJKtsp+nQqWKH7UBkeVycrUaotWkaThbaV/1nycNwre/qA2+BxlSC/YZUPKTuyq2MfNuxMEVoTh0XlM7ijExtC6xwcpEArvCE01mqyIjI7c+j8GeIfjFBniagYwCNS8kuKT5e9Wz0lufq4TyAm/dUUHkeXIQtTuz/j7+rJM9FzclYxYLcIWe9V9OD8LoaCdnmfeu2jgp2t55iL2EkbYNsJ2FfwdqphQUyqnIojUaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from HE1EUR01FT023.eop-EUR01.prod.protection.outlook.com
 (10.152.0.57) by HE1EUR01HT227.eop-EUR01.prod.protection.outlook.com
 (10.152.1.190) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2387.20; Wed, 6 Nov
 2019 22:34:20 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.0.53) by
 HE1EUR01FT023.mail.protection.outlook.com (10.152.0.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20 via Frontend Transport; Wed, 6 Nov 2019 22:34:20 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::b1cf:db6f:95fc:84cc]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::b1cf:db6f:95fc:84cc%7]) with mapi id 15.20.2408.028; Wed, 6 Nov 2019
 22:34:20 +0000
From:   Jonas Karlman <jonas@kwiboo.se>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>
CC:     Jonas Karlman <jonas@kwiboo.se>, Hans Verkuil <hverkuil@xs4all.nl>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 1/5] media: hantro: Fix H264 motion vector buffer offset
Thread-Topic: [PATCH v3 1/5] media: hantro: Fix H264 motion vector buffer
 offset
Thread-Index: AQHVlPJVAc/IWZZA0kesy7QMFtzL3A==
Date:   Wed, 6 Nov 2019 22:34:20 +0000
Message-ID: <HE1PR06MB4011A23596DCD988F2CAC603AC790@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <HE1PR06MB4011EDD5F2686A05BC35F61CAC790@HE1PR06MB4011.eurprd06.prod.outlook.com>
In-Reply-To: <HE1PR06MB4011EDD5F2686A05BC35F61CAC790@HE1PR06MB4011.eurprd06.prod.outlook.com>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0402CA0025.eurprd04.prod.outlook.com
 (2603:10a6:7:7c::14) To HE1PR06MB4011.eurprd06.prod.outlook.com
 (2603:10a6:7:9c::32)
x-incomingtopheadermarker: OriginalChecksum:FAB4DE15588B8F08381DEF91E847964DE794E6CD0206A3A4874E30D7BF6C8870;UpperCasedChecksum:6B31A0C61A6ED227BE4E0679102D0404143C600FB4954111DEA6EC49DD80B949;SizeAsReceived:7610;Count:49
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-tmn:  [05Dsyv6BcSqygptF2ciYDCl7/HNZWGFQ]
x-microsoft-original-message-id: <20191106223408.2176-1-jonas@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 49
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: ac046653-4039-416c-c75c-08d763097746
x-ms-traffictypediagnostic: HE1EUR01HT227:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Uqn6+QLkvNLqXT71aUOUcBzjiPEW/yxOn/J78xF2z0Bl7zuig4yJ19dqNWtl5GXhtPT08/d+mw6iPdKylUhekbD4C3F9nYGlqrIEQPC7/YqyrnPIRH8x/KwGKpWR7qeGVDt/KUSyPEoAa5xaNwgEAhlXlwG0E2MejZM7P/uKxwVkKlQmen4gTG03Jfr0z6OT
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: ac046653-4039-416c-c75c-08d763097746
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2019 22:34:20.8054
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1EUR01HT227
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A decoded 8-bit 4:2:0 frame need memory for up to 448 bytes per
macroblock and is laid out in memory as follow:

+---------------------------+
| Y-plane   256 bytes x MBs |
+---------------------------+
| UV-plane  128 bytes x MBs |
+---------------------------+
| MV buffer  64 bytes x MBs |
+---------------------------+

The motion vector buffer offset is currently correct for 4:2:0 because the
extra space for motion vectors is overallocated with an extra 64 bytes x MBs.

Wrong offset for both destination and motion vector buffer are used
for the bottom field of field encoded content, wrong offset is
also used for 4:0:0 (monochrome) content.

Fix this by setting the motion vector address to the expected 384 bytes x MBs
offset for 4:2:0 and 256 bytes x MBs offset for 4:0:0 content.

Also use correct destination and motion vector buffer offset
for the bottom field of field encoded content.

While at it also extend the check for 4:0:0 (monochrome) to include an
additional check for High Profile (100).

Fixes: dea0a82f3d22 ("media: hantro: Add support for H264 decoding on G1")
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
Changes in v3:
  * address remarks from Boris
  - use src_fmt instead of dst_fmt
Changes in v2:
  * address remarks from Philipp and Ezequiel
  - update commit message
  - rename offset to bytes_per_mb
  - remove MV_OFFSET macros
  - move PIC_MB_WIDTH/HEIGHT_P change to separate patch
---
 .../staging/media/hantro/hantro_g1_h264_dec.c | 31 +++++++++++++------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_g1_h264_dec.c b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
index 70a6b5b26477..30d977c3d529 100644
--- a/drivers/staging/media/hantro/hantro_g1_h264_dec.c
+++ b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
@@ -81,7 +81,7 @@ static void set_params(struct hantro_ctx *ctx)
 		reg |= G1_REG_DEC_CTRL4_CABAC_E;
 	if (sps->flags & V4L2_H264_SPS_FLAG_DIRECT_8X8_INFERENCE)
 		reg |= G1_REG_DEC_CTRL4_DIR_8X8_INFER_E;
-	if (sps->chroma_format_idc == 0)
+	if (sps->profile_idc >= 100 && sps->chroma_format_idc == 0)
 		reg |= G1_REG_DEC_CTRL4_BLACKWHITE_E;
 	if (pps->flags & V4L2_H264_PPS_FLAG_WEIGHTED_PRED)
 		reg |= G1_REG_DEC_CTRL4_WEIGHT_PRED_E;
@@ -234,6 +234,7 @@ static void set_buffers(struct hantro_ctx *ctx)
 	struct vb2_v4l2_buffer *src_buf, *dst_buf;
 	struct hantro_dev *vpu = ctx->dev;
 	dma_addr_t src_dma, dst_dma;
+	size_t offset = 0;
 
 	src_buf = hantro_get_src_buf(ctx);
 	dst_buf = hantro_get_dst_buf(ctx);
@@ -244,18 +245,30 @@ static void set_buffers(struct hantro_ctx *ctx)
 
 	/* Destination (decoded frame) buffer. */
 	dst_dma = vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
-	vdpu_write_relaxed(vpu, dst_dma, G1_REG_ADDR_DST);
+	/* Adjust dma addr to start at second line for bottom field */
+	if (ctrls->slices[0].flags & V4L2_H264_SLICE_FLAG_BOTTOM_FIELD)
+		offset = ALIGN(ctx->src_fmt.width, MB_DIM);
+	vdpu_write_relaxed(vpu, dst_dma + offset, G1_REG_ADDR_DST);
 
 	/* Higher profiles require DMV buffer appended to reference frames. */
 	if (ctrls->sps->profile_idc > 66 && ctrls->decode->nal_ref_idc) {
-		size_t pic_size = ctx->h264_dec.pic_size;
-		size_t mv_offset = round_up(pic_size, 8);
-
+		unsigned int bytes_per_mb = 384;
+
+		/* DMV buffer for monochrome start directly after Y-plane */
+		if (ctrls->sps->profile_idc >= 100 &&
+		    ctrls->sps->chroma_format_idc == 0)
+			bytes_per_mb = 256;
+		offset = bytes_per_mb * MB_WIDTH(ctx->src_fmt.width) *
+			 MB_HEIGHT(ctx->src_fmt.height);
+
+		/*
+		 * DMV buffer is split in two for field encoded frames,
+		 * adjust offset for bottom field
+		 */
 		if (ctrls->slices[0].flags & V4L2_H264_SLICE_FLAG_BOTTOM_FIELD)
-			mv_offset += 32 * MB_WIDTH(ctx->dst_fmt.width);
-
-		vdpu_write_relaxed(vpu, dst_dma + mv_offset,
-				   G1_REG_ADDR_DIR_MV);
+			offset += 32 * MB_WIDTH(ctx->src_fmt.width) *
+				  MB_HEIGHT(ctx->src_fmt.height);
+		vdpu_write_relaxed(vpu, dst_dma + offset, G1_REG_ADDR_DIR_MV);
 	}
 
 	/* Auxiliary buffer prepared in hantro_g1_h264_dec_prepare_table(). */
-- 
2.17.1

