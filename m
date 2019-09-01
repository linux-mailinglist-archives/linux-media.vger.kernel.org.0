Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B020A496F
	for <lists+linux-media@lfdr.de>; Sun,  1 Sep 2019 14:46:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729096AbfIAMqV convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Sun, 1 Sep 2019 08:46:21 -0400
Received: from mail-oln040092066108.outbound.protection.outlook.com ([40.92.66.108]:17057
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728778AbfIAMpt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 1 Sep 2019 08:45:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ScBcnZgexdPpql/o03yoLI6EEQMb5CsqBBRwC5VoAZz0nehl0w7k1VogVNAZ/3c7/flG/0KTlmsK2XtoGoFkw5iqHxIo9ALfEmvTyBcD3Y6vEkda02rbLglPZxPsWc5f6hnzA9NrWyJajcDy9COcimi3Wh7Pyv2kuPk1wScR0Ddnzycglu0jZX4tuF5ocL53ukmoGtbH/0x7ygnhoE+lUwX9trRn3ASiEpM11mxm3NRlmI9tR10sT8Odcp6b81ctWyL3lKf5B97YNHydTF8cqwAcwkrfkJOWvFnQ/KR9UdA3z9OPdH5PguLoQctC2qhRUwwsQGXvPsdQNgRqb2DNFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i1D1TtidGf0e+IYluAQ0YC6CO3UlaWo4MT6NDpzJksE=;
 b=UgsRfHWmHrGzCnKCxDtrVayXEaEK/P0OKp9Q07oK9f0GDdNMuP8uQphHweE7Ak/IdO9a+STHp6i6pZczryXc4wcgbXYGovEk3Ir80benh/PbAAspaYVkS/0bFdhKuAja8ZtDgW2ETiplObahyzBat2g0mHJCPZjSaUhiH31rCXnLn+QLyqUIX4AjrbBVN1TA40C44xsx0rWQjg+/204hXeOrUM7ugyckAA9JPfJARpdMDmADEYStqA0ackvO27b++lwTBvb3oDX7JzH1dYCB/EUpjMq/Lwd+Z2Y7/yPeCXr1G3bgr+Ow0R3lCeVkwp7cYJSP4IQRT0XiyF8gLxM4eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from HE1EUR01FT057.eop-EUR01.prod.protection.outlook.com
 (10.152.0.52) by HE1EUR01HT095.eop-EUR01.prod.protection.outlook.com
 (10.152.0.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2220.16; Sun, 1 Sep
 2019 12:45:43 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.0.52) by
 HE1EUR01FT057.mail.protection.outlook.com (10.152.0.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.16 via Frontend Transport; Sun, 1 Sep 2019 12:45:43 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::a0ba:e766:2a23:2088]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::a0ba:e766:2a23:2088%3]) with mapi id 15.20.2199.021; Sun, 1 Sep 2019
 12:45:43 +0000
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
Subject: [PATCH 03/12] media: hantro: Fix H264 motion vector buffer offset
Thread-Topic: [PATCH 03/12] media: hantro: Fix H264 motion vector buffer
 offset
Thread-Index: AQHVYMMqTL16PRzVbkakeBcuIqgT/g==
Date:   Sun, 1 Sep 2019 12:45:43 +0000
Message-ID: <HE1PR06MB40115337CD86C429EF24430CACBF0@HE1PR06MB4011.eurprd06.prod.outlook.com>
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
x-incomingtopheadermarker: OriginalChecksum:7B3B7B4361546BE563588277909E8130A217913F21AEC558698F98757A841C47;UpperCasedChecksum:62E16AB91CC13DA896C7ED5FE7A5F6CF9B54B9F7E43A760B5B5C0B2C667E4B2F;SizeAsReceived:7885;Count:50
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-tmn:  [uESRWVmun0WYnhYOb3DotRktmKxM8NBt]
x-microsoft-original-message-id: <20190901124531.23645-3-jonas@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 50
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031322404)(2017031323274)(2017031324274)(1601125500)(1603101475)(1701031045);SRVR:HE1EUR01HT095;
x-ms-traffictypediagnostic: HE1EUR01HT095:
x-microsoft-antispam-message-info: o5wJ3ehQTvE6yRWZsBVlF99nVM8satnFAVKMNEdagAmZFe3RC76vc2PF5jRpYN/6jaEXE1/JoJZPXh+xJDt+/Id9mYxrnlE7Dp2j3u7wNSuGKm+Y/d0J1O9ywtsm1sdwrkTdtNHxB42EFqOMCnDBdMQG7tEfUDLu3ZUDAZ3aF42X3J0r3+Oot7WsdunqFA3V
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: e17331a2-a8c1-4fd4-fd81-08d72eda4d47
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2019 12:45:43.3830
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1EUR01HT095
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A decoded 8-bit 4:2:0 frame need memory for up to 448 macroblocks
and is laid out in memory as follow:

+-------------------+
| Y-plane   256 MBs |
+-------------------+
| UV-plane  128 MBs |
+-------------------+
| MV buffer  64 MBs |
+-------------------+

The motion vector buffer offset is currently correct for 4:2:0 because
the extra space for motion vectors is overallocated with an extra 64 MBs.

Wrong offset for both destination and motion vector buffer are used
for the bottom field of field encoded content, wrong offset is
also used for 4:0:0 (monochrome) content.

Fix this by always setting the motion vector address to the expected
384 MBs offset for 4:2:0 and 256 MBs offset for 4:0:0 content.

Also use correct destination and motion vector buffer offset
for the bottom field of field encoded content.

While at it also extend the check for 4:0:0 (monochrome) to include an
additional check for High Profile (100).

Fixes: dea0a82f3d22 ("media: hantro: Add support for H264 decoding on G1")
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 .../staging/media/hantro/hantro_g1_h264_dec.c | 33 +++++++++++--------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_g1_h264_dec.c b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
index 7ab534936843..159bd67e0a36 100644
--- a/drivers/staging/media/hantro/hantro_g1_h264_dec.c
+++ b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
@@ -19,6 +19,9 @@
 #include "hantro_hw.h"
 #include "hantro_v4l2.h"
 
+#define MV_OFFSET_420	384
+#define MV_OFFSET_400	256
+
 static void set_params(struct hantro_ctx *ctx)
 {
 	const struct hantro_h264_dec_ctrls *ctrls = &ctx->h264_dec.ctrls;
@@ -49,8 +52,8 @@ static void set_params(struct hantro_ctx *ctx)
 	vdpu_write_relaxed(vpu, reg, G1_REG_DEC_CTRL0);
 
 	/* Decoder control register 1. */
-	reg = G1_REG_DEC_CTRL1_PIC_MB_WIDTH(sps->pic_width_in_mbs_minus1 + 1) |
-	      G1_REG_DEC_CTRL1_PIC_MB_HEIGHT_P(sps->pic_height_in_map_units_minus1 + 1) |
+	reg = G1_REG_DEC_CTRL1_PIC_MB_WIDTH(H264_MB_WIDTH(ctx->dst_fmt.width)) |
+	      G1_REG_DEC_CTRL1_PIC_MB_HEIGHT_P(H264_MB_HEIGHT(ctx->dst_fmt.height)) |
 	      G1_REG_DEC_CTRL1_REF_FRAMES(sps->max_num_ref_frames);
 	vdpu_write_relaxed(vpu, reg, G1_REG_DEC_CTRL1);
 
@@ -79,7 +82,7 @@ static void set_params(struct hantro_ctx *ctx)
 		reg |= G1_REG_DEC_CTRL4_CABAC_E;
 	if (sps->flags & V4L2_H264_SPS_FLAG_DIRECT_8X8_INFERENCE)
 		reg |= G1_REG_DEC_CTRL4_DIR_8X8_INFER_E;
-	if (sps->chroma_format_idc == 0)
+	if (sps->profile_idc >= 100 && sps->chroma_format_idc == 0)
 		reg |= G1_REG_DEC_CTRL4_BLACKWHITE_E;
 	if (pps->flags & V4L2_H264_PPS_FLAG_WEIGHTED_PRED)
 		reg |= G1_REG_DEC_CTRL4_WEIGHT_PRED_E;
@@ -233,6 +236,7 @@ static void set_buffers(struct hantro_ctx *ctx)
 	struct vb2_v4l2_buffer *src_buf, *dst_buf;
 	struct hantro_dev *vpu = ctx->dev;
 	dma_addr_t src_dma, dst_dma;
+	unsigned int offset = MV_OFFSET_420;
 
 	src_buf = hantro_get_src_buf(ctx);
 	dst_buf = hantro_get_dst_buf(ctx);
@@ -243,19 +247,20 @@ static void set_buffers(struct hantro_ctx *ctx)
 
 	/* Destination (decoded frame) buffer. */
 	dst_dma = vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
+	if (ctrls->slices[0].flags & V4L2_H264_SLICE_FLAG_BOTTOM_FIELD)
+		dst_dma += ALIGN(ctx->dst_fmt.width, H264_MB_DIM);
 	vdpu_write_relaxed(vpu, dst_dma, G1_REG_ADDR_DST);
 
-	/* Higher profiles require DMV buffer appended to reference frames. */
-	if (ctrls->sps->profile_idc > 66) {
-		size_t pic_size = ctx->h264_dec.pic_size;
-		size_t mv_offset = round_up(pic_size, 8);
-
-		if (ctrls->slices[0].flags & V4L2_H264_SLICE_FLAG_BOTTOM_FIELD)
-			mv_offset += 32 * H264_MB_WIDTH(ctx->dst_fmt.width);
-
-		vdpu_write_relaxed(vpu, dst_dma + mv_offset,
-				   G1_REG_ADDR_DIR_MV);
-	}
+	/* Motion vector buffer is located after the decoded frame. */
+	dst_dma = vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
+	if (ctrls->sps->profile_idc >= 100 && ctrls->sps->chroma_format_idc == 0)
+		offset = MV_OFFSET_400;
+	dst_dma += offset * H264_MB_WIDTH(ctx->dst_fmt.width) *
+		   H264_MB_HEIGHT(ctx->dst_fmt.height);
+	if (ctrls->slices[0].flags & V4L2_H264_SLICE_FLAG_BOTTOM_FIELD)
+		dst_dma += 32 * H264_MB_WIDTH(ctx->dst_fmt.width) *
+			   H264_MB_HEIGHT(ctx->dst_fmt.height);
+	vdpu_write_relaxed(vpu, dst_dma, G1_REG_ADDR_DIR_MV);
 
 	/* Auxiliary buffer prepared in hantro_g1_h264_dec_prepare_table(). */
 	vdpu_write_relaxed(vpu, ctx->h264_dec.priv.dma, G1_REG_ADDR_QTABLE);
-- 
2.17.1

