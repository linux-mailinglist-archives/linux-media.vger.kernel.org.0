Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34564E7DF1
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2019 02:26:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728926AbfJ2BZd convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 28 Oct 2019 21:25:33 -0400
Received: from mail-oln040092066061.outbound.protection.outlook.com ([40.92.66.61]:22016
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728363AbfJ2BZc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Oct 2019 21:25:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CCI4+9/3z6IkcALxCtmhdDTQJXvCaafms6ne/7eI3NybbjfWTXSELf2/MczbblEEQyO5V6hv3Opb00nCGO6jDxIoybECg08ZpBFxbD4W2DaVq08HT4fFtIGmEeLdCGkUuW5Ik9s/SlFWQ7JiAltbYG5P3mCwVbOobuk4vpFWMrxA+fnbbSS56SyjlmlXSc54bsi+CfJHdmgjAdXpr/N6YeL9rLI9hJwthScd6QXXEK1nuHXvdD5arQq4QtDG9aBzByY7H9Mv9/eO09Nyl+LSqPNTbbDkoNx6aBWuxdyBskxXcCibsRU1/ULQoa14tq+BzQBvzKulvthB10cWc9EzYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CjkXWgQoItBzowBktBSSrmBy4zZbONIpUEGe13cubQY=;
 b=QS9tthlGhSYNaDmpvnnc7J1dwywARd6/t/5T5M+xKV5o27RSkjDPBujfts3xSgeuzaloJA777gatf11oPdA+hsWZJLjDXv+XQtDuvc+eYvrbVpz1ZFebn1MnhkmPMQH/cGHwOYN3E7JT8JTbcxpWPZehxgtwceGhGvlvOLrjLIt1Rl7HqFl90GnDXjhw9IuUp/nhn3+mfhjVQZ2QA72tESnIswKd41c/do7f8XK9eY4We+kwBec9Jz4tu7pTwgqAPzcoOfnoktjUO33tULY5NEzabolsykpv3xqNBhyX5XJUDQzGe06vpzjsIIy3UuzZocN5GNoFdPTL7ldc6dEbAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from VE1EUR01FT039.eop-EUR01.prod.protection.outlook.com
 (10.152.2.55) by VE1EUR01HT182.eop-EUR01.prod.protection.outlook.com
 (10.152.3.169) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2387.20; Tue, 29 Oct
 2019 01:24:49 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.2.56) by
 VE1EUR01FT039.mail.protection.outlook.com (10.152.3.35) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20 via Frontend Transport; Tue, 29 Oct 2019 01:24:49 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::b1cf:db6f:95fc:84cc]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::b1cf:db6f:95fc:84cc%7]) with mapi id 15.20.2387.025; Tue, 29 Oct 2019
 01:24:49 +0000
From:   Jonas Karlman <jonas@kwiboo.se>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>
CC:     Jonas Karlman <jonas@kwiboo.se>, Hans Verkuil <hverkuil@xs4all.nl>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 04/10] media: hantro: Fix H264 motion vector buffer offset
Thread-Topic: [PATCH v2 04/10] media: hantro: Fix H264 motion vector buffer
 offset
Thread-Index: AQHVjfeopTA6Bcvow0iTWFRfp5QfqA==
Date:   Tue, 29 Oct 2019 01:24:49 +0000
Message-ID: <HE1PR06MB40118883BE689D89380EBD06AC610@HE1PR06MB4011.eurprd06.prod.outlook.com>
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
x-incomingtopheadermarker: OriginalChecksum:D3B570380C971082EB1073675FF7FA740E873773E58A726EBF5DA27FB527E62F;UpperCasedChecksum:DDE70B0111C27B8206B3CB4758D5255F7C566BF2200E18AF8C4F9316EC590334;SizeAsReceived:7615;Count:49
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-tmn:  [0XDZBUTqKt1RW3TidFtvX5MqCnYiTE99]
x-microsoft-original-message-id: <20191029012430.24566-4-jonas@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 49
x-eopattributedmessage: 0
x-ms-traffictypediagnostic: VE1EUR01HT182:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KMg21dBCb1GKakxCG03MB3K8tcasC++aCeWZhK50zOe22hmF2YT4TqJ0BPiKr7PujBG1X+eDK3FwHNAzjCGRUVgL62MWw7raPovNlb4lzpvd0GkvrlZka5RAuzc1fZqM6pW3DxxIPGB2sQKUHfpCUWibl5Zp3KmOdh+OfbgPWantGVoT0AbNaDlgObiqrKPo
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: bf9cf040-c3db-4fef-50cd-08d75c0eca5a
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2019 01:24:49.4066
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1EUR01HT182
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
---
Changes in v2:
  * address remarks from Philipp and Ezequiel
  - update commit message
  - rename offset to bytes_per_mb
  - remove MV_OFFSET macros
  - move PIC_MB_WIDTH/HEIGHT_P change to separate patch
---
 .../staging/media/hantro/hantro_g1_h264_dec.c | 29 +++++++++++++------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_g1_h264_dec.c b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
index 70a6b5b26477..71bf162eaf73 100644
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
@@ -244,18 +245,28 @@ static void set_buffers(struct hantro_ctx *ctx)
 
 	/* Destination (decoded frame) buffer. */
 	dst_dma = vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
-	vdpu_write_relaxed(vpu, dst_dma, G1_REG_ADDR_DST);
+	/* Adjust dma addr to start at second line for bottom field */
+	if (ctrls->slices[0].flags & V4L2_H264_SLICE_FLAG_BOTTOM_FIELD)
+		offset = ALIGN(ctx->dst_fmt.width, MB_DIM);
+	vdpu_write_relaxed(vpu, dst_dma + offset, G1_REG_ADDR_DST);
 
 	/* Higher profiles require DMV buffer appended to reference frames. */
 	if (ctrls->sps->profile_idc > 66 && ctrls->decode->nal_ref_idc) {
-		size_t pic_size = ctx->h264_dec.pic_size;
-		size_t mv_offset = round_up(pic_size, 8);
-
+		unsigned int bytes_per_mb = 384;
+		/* DMV buffer for monochrome start directly after Y-plane */
+		if (ctrls->sps->profile_idc >= 100 &&
+		    ctrls->sps->chroma_format_idc == 0)
+			bytes_per_mb = 256;
+		offset = bytes_per_mb * MB_WIDTH(ctx->dst_fmt.width) *
+			 MB_HEIGHT(ctx->dst_fmt.height);
+
+		/* DMV buffer is split in two for field encoded frames,
+		 * adjust offset for bottom field
+		 */
 		if (ctrls->slices[0].flags & V4L2_H264_SLICE_FLAG_BOTTOM_FIELD)
-			mv_offset += 32 * MB_WIDTH(ctx->dst_fmt.width);
-
-		vdpu_write_relaxed(vpu, dst_dma + mv_offset,
-				   G1_REG_ADDR_DIR_MV);
+			offset += 32 * MB_WIDTH(ctx->dst_fmt.width) *
+				  MB_HEIGHT(ctx->dst_fmt.height);
+		vdpu_write_relaxed(vpu, dst_dma + offset, G1_REG_ADDR_DIR_MV);
 	}
 
 	/* Auxiliary buffer prepared in hantro_g1_h264_dec_prepare_table(). */
-- 
2.17.1

