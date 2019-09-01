Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73FC4A4963
	for <lists+linux-media@lfdr.de>; Sun,  1 Sep 2019 14:46:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729005AbfIAMp7 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Sun, 1 Sep 2019 08:45:59 -0400
Received: from mail-oln040092065016.outbound.protection.outlook.com ([40.92.65.16]:3749
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728959AbfIAMp4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 1 Sep 2019 08:45:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IJrCp8nQuyery4HixCUFty+bTWx3MLbZy8XX8WO23+n5iOp+CF9voLAI6g05H5kFEtVLe6hJ3jzgmHaT32PsceheUgjFAQELCSoQw7FOS2gpDRB/lmNhb4AQ5yFxiQFM/wck16y9KNkbY5u7dejBNC/KZzAH65jmxQC/ua6GDwdsLrIWczYCyxITd71qLIGaQrviNx6PRQGsE/2AKKVnAQRjD3xXdht6JVQPB3qAXpQjjyQ4Vl0gytEsDzoWoaU9jDP1g/NJb3r5LWobYJDXx5iyvpaJ3Y8Ul9oR4uhVRHqSJ4fLLqD3W9WncTz6vRbuVvtwBo7R1nur/ypA2KQAWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GyAMD6T6mDCyJgfHd/pIqOz5+cJ0PaCxdv0dAairreY=;
 b=gZbzw9Tgg4G0chHLgc22paTGQP/urmPmRJJfR4UaS7uNgqFenKOmPpR+KrRKcPOUb9CkIu8Tt/PKD1c0lY3fOgRKEng/PrMk8w89SJzOth+Yc54pBRdr62oZDUFZNsZZzM83bfRlj7NHAtv69xbueJp7sNr7hOxS7uO+3AVTIs414a7JgqEf25VZCKA/7nZ2rbQxuT4rJ9GjFN8v+rcDd9nDAhj24EXnJR3PnTc4ouInO0yqoFIvSL2uoAEnbXzQ9szufEJ1MoHKB3rCJNOWVVTuMUUKVFMU1kVf8ZGFcjXxyTWq9Scpng2gpD3ys6iF/RNUrdOQVFsWpfi+pZcEJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from HE1EUR01FT057.eop-EUR01.prod.protection.outlook.com
 (10.152.0.58) by HE1EUR01HT077.eop-EUR01.prod.protection.outlook.com
 (10.152.0.212) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2220.16; Sun, 1 Sep
 2019 12:45:48 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.0.52) by
 HE1EUR01FT057.mail.protection.outlook.com (10.152.0.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.16 via Frontend Transport; Sun, 1 Sep 2019 12:45:48 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::a0ba:e766:2a23:2088]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::a0ba:e766:2a23:2088%3]) with mapi id 15.20.2199.021; Sun, 1 Sep 2019
 12:45:48 +0000
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
Subject: [RFC 10/12] media: hantro: Add support for H264 decoding on RK3399
Thread-Topic: [RFC 10/12] media: hantro: Add support for H264 decoding on
 RK3399
Thread-Index: AQHVYMMtg5M5ndr2ZkScDZ0tFJAWDw==
Date:   Sun, 1 Sep 2019 12:45:48 +0000
Message-ID: <HE1PR06MB40119DE07D38060F531D1070ACBF0@HE1PR06MB4011.eurprd06.prod.outlook.com>
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
x-incomingtopheadermarker: OriginalChecksum:47A84D3F827669B0689E991CC05BEE1A3366AA89E8485A8457F6471EC0AA3AE1;UpperCasedChecksum:4F657246377D395C615F9ACA1B8EBFC6486F1A2DFC634F0A2C183A0189D9182C;SizeAsReceived:7903;Count:50
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-tmn:  [SJOEu5rMWvsiJKkxLWAsEIl0ZZP28EYL]
x-microsoft-original-message-id: <20190901124531.23645-10-jonas@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 50
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031322404)(2017031323274)(2017031324274)(1601125500)(1603101475)(1701031045);SRVR:HE1EUR01HT077;
x-ms-traffictypediagnostic: HE1EUR01HT077:
x-microsoft-antispam-message-info: s6IYQNeYSefO1n1orj0S7gp89RTCofH2m4vTpMxBeqk5tGkb1hLwJicmCrp2N+OKHJ8RsZxBTjzS8YCc+HZj6/icW5TkPk1v+z1jBxHisYAy/NTcCoI6GEuQnnyC/1QOG5Rh3jLfMWvMUQtmpePBrSHfHiWJQSFl6H6BWbbeDZDA93c56EE+hPTWpa/S/NRY
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a109ab1-670f-49fe-ac47-08d72eda502a
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2019 12:45:48.2819
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1EUR01HT077
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rockchip RK3399 SoC has the same Hantro G1 IP block
as RK3288, but the registers are entirely different.

In a similar fashion as MPEG-2 and VP8 decoding,
it's simpler to just add a separate implementation.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/staging/media/hantro/Makefile         |   1 +
 .../staging/media/hantro/hantro_g1_h264_dec.c |   1 -
 drivers/staging/media/hantro/hantro_hw.h      |   1 +
 .../media/hantro/rk3399_vpu_hw_h264_dec.c     | 486 ++++++++++++++++++
 4 files changed, 488 insertions(+), 1 deletion(-)
 create mode 100644 drivers/staging/media/hantro/rk3399_vpu_hw_h264_dec.c

diff --git a/drivers/staging/media/hantro/Makefile b/drivers/staging/media/hantro/Makefile
index 5d6b0383d280..8d33b0e8aa6c 100644
--- a/drivers/staging/media/hantro/Makefile
+++ b/drivers/staging/media/hantro/Makefile
@@ -8,6 +8,7 @@ hantro-vpu-y += \
 		hantro_g1_mpeg2_dec.o \
 		hantro_g1_vp8_dec.o \
 		rk3399_vpu_hw_jpeg_enc.o \
+		rk3399_vpu_hw_h264_dec.o \
 		rk3399_vpu_hw_mpeg2_dec.o \
 		rk3399_vpu_hw_vp8_dec.o \
 		hantro_jpeg.o \
diff --git a/drivers/staging/media/hantro/hantro_g1_h264_dec.c b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
index 4b82b9fd5252..ec2736fb473d 100644
--- a/drivers/staging/media/hantro/hantro_g1_h264_dec.c
+++ b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
@@ -202,7 +202,6 @@
 #define G1_REG_REFBU_E(v)		((v) ? BIT(31) : 0)
 
 #define G1_REG_APF_THRESHOLD(v)		(((v) << 0) & GENMASK(13, 0))
->>>>>>> b22734fb5e2c... Ymedia: hantro: Refactor G1 H264 code
 
 void hantro_g1_h264_dec_run(struct hantro_ctx *ctx)
 {
diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
index 51de2fee2233..00161a4f22ac 100644
--- a/drivers/staging/media/hantro/hantro_hw.h
+++ b/drivers/staging/media/hantro/hantro_hw.h
@@ -165,6 +165,7 @@ u16 hantro_h264_get_ref_nbr(struct hantro_ctx *ctx,
 			    unsigned int dpb_idx);
 int hantro_h264_dec_prepare_run(struct hantro_ctx *ctx);
 void hantro_g1_h264_dec_run(struct hantro_ctx *ctx);
+void rk3399_vpu_h264_dec_run(struct hantro_ctx *ctx);
 int hantro_h264_dec_init(struct hantro_ctx *ctx);
 void hantro_h264_dec_exit(struct hantro_ctx *ctx);
 
diff --git a/drivers/staging/media/hantro/rk3399_vpu_hw_h264_dec.c b/drivers/staging/media/hantro/rk3399_vpu_hw_h264_dec.c
new file mode 100644
index 000000000000..8e480a68ca3d
--- /dev/null
+++ b/drivers/staging/media/hantro/rk3399_vpu_hw_h264_dec.c
@@ -0,0 +1,486 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Hantro VPU codec driver
+ *
+ * Copyright (c) 2014 Rockchip Electronics Co., Ltd.
+ *	Hertz Wong <hertz.wong@rock-chips.com>
+ *	Herman Chen <herman.chen@rock-chips.com>
+ *
+ * Copyright (C) 2014 Google, Inc.
+ *	Tomasz Figa <tfiga@chromium.org>
+ */
+
+#include <linux/types.h>
+#include <linux/sort.h>
+
+#include <media/v4l2-mem2mem.h>
+
+#include "hantro_hw.h"
+#include "hantro_v4l2.h"
+
+#define MV_OFFSET_420	384
+#define MV_OFFSET_400	256
+
+#define VDPU_SWREG(nr)			((nr) * 4)
+
+#define VDPU_REG_DEC_OUT_BASE		VDPU_SWREG(63)
+#define VDPU_REG_RLC_VLC_BASE		VDPU_SWREG(64)
+#define VDPU_REG_QTABLE_BASE		VDPU_SWREG(61)
+#define VDPU_REG_DIR_MV_BASE		VDPU_SWREG(62)
+#define VDPU_REG_REFER0_BASE		VDPU_SWREG(84)
+#define VDPU_REG_REFER1_BASE		VDPU_SWREG(85)
+#define VDPU_REG_REFER2_BASE		VDPU_SWREG(86)
+#define VDPU_REG_REFER3_BASE		VDPU_SWREG(87)
+#define VDPU_REG_REFER4_BASE		VDPU_SWREG(88)
+#define VDPU_REG_REFER5_BASE		VDPU_SWREG(89)
+#define VDPU_REG_REFER6_BASE		VDPU_SWREG(90)
+#define VDPU_REG_REFER7_BASE		VDPU_SWREG(91)
+#define VDPU_REG_REFER8_BASE		VDPU_SWREG(92)
+#define VDPU_REG_REFER9_BASE		VDPU_SWREG(93)
+#define VDPU_REG_REFER10_BASE		VDPU_SWREG(94)
+#define VDPU_REG_REFER11_BASE		VDPU_SWREG(95)
+#define VDPU_REG_REFER12_BASE		VDPU_SWREG(96)
+#define VDPU_REG_REFER13_BASE		VDPU_SWREG(97)
+#define VDPU_REG_REFER14_BASE		VDPU_SWREG(98)
+#define VDPU_REG_REFER15_BASE		VDPU_SWREG(99)
+#define VDPU_REG_DEC_E(v)		((v) ? BIT(0) : 0)
+
+#define VDPU_REG_DEC_ADV_PRE_DIS(v)	((v) ? BIT(11) : 0)
+#define VDPU_REG_DEC_SCMD_DIS(v)	((v) ? BIT(10) : 0)
+#define VDPU_REG_FILTERING_DIS(v)	((v) ? BIT(8) : 0)
+#define VDPU_REG_PIC_FIXED_QUANT(v)	((v) ? BIT(7) : 0)
+#define VDPU_REG_DEC_LATENCY(v)		(((v) << 1) & GENMASK(6, 1))
+
+#define VDPU_REG_INIT_QP(v)		(((v) << 25) & GENMASK(30, 25))
+#define VDPU_REG_STREAM_LEN(v)		(((v) << 0) & GENMASK(23, 0))
+
+#define VDPU_REG_APF_THRESHOLD(v)	(((v) << 17) & GENMASK(30, 17))
+#define VDPU_REG_STARTMB_X(v)		(((v) << 8) & GENMASK(16, 8))
+#define VDPU_REG_STARTMB_Y(v)		(((v) << 0) & GENMASK(7, 0))
+
+#define VDPU_REG_DEC_MODE(v)		(((v) << 0) & GENMASK(3, 0))
+
+#define VDPU_REG_DEC_STRENDIAN_E(v)	((v) ? BIT(5) : 0)
+#define VDPU_REG_DEC_STRSWAP32_E(v)	((v) ? BIT(4) : 0)
+#define VDPU_REG_DEC_OUTSWAP32_E(v)	((v) ? BIT(3) : 0)
+#define VDPU_REG_DEC_INSWAP32_E(v)	((v) ? BIT(2) : 0)
+#define VDPU_REG_DEC_OUT_ENDIAN(v)	((v) ? BIT(1) : 0)
+#define VDPU_REG_DEC_IN_ENDIAN(v)	((v) ? BIT(0) : 0)
+
+#define VDPU_REG_DEC_DATA_DISC_E(v)	((v) ? BIT(22) : 0)
+#define VDPU_REG_DEC_MAX_BURST(v)	(((v) << 16) & GENMASK(20, 16))
+#define VDPU_REG_DEC_AXI_WR_ID(v)	(((v) << 8) & GENMASK(15, 8))
+#define VDPU_REG_DEC_AXI_RD_ID(v)	(((v) << 0) & GENMASK(7, 0))
+
+#define VDPU_REG_START_CODE_E(v)	((v) ? BIT(22) : 0)
+#define VDPU_REG_CH_8PIX_ILEAV_E(v)	((v) ? BIT(21) : 0)
+#define VDPU_REG_RLC_MODE_E(v)		((v) ? BIT(20) : 0)
+#define VDPU_REG_PIC_INTERLACE_E(v)	((v) ? BIT(17) : 0)
+#define VDPU_REG_PIC_FIELDMODE_E(v)	((v) ? BIT(16) : 0)
+#define VDPU_REG_PIC_TOPFIELD_E(v)	((v) ? BIT(13) : 0)
+#define VDPU_REG_WRITE_MVS_E(v)		((v) ? BIT(10) : 0)
+#define VDPU_REG_SEQ_MBAFF_E(v)		((v) ? BIT(7) : 0)
+#define VDPU_REG_PICORD_COUNT_E(v)	((v) ? BIT(6) : 0)
+#define VDPU_REG_DEC_TIMEOUT_E(v)	((v) ? BIT(5) : 0)
+#define VDPU_REG_DEC_CLK_GATE_E(v)	((v) ? BIT(4) : 0)
+
+#define VDPU_REG_PRED_BC_TAP_0_0(v)	(((v) << 22) & GENMASK(31, 22))
+#define VDPU_REG_PRED_BC_TAP_0_1(v)	(((v) << 12) & GENMASK(21, 12))
+#define VDPU_REG_PRED_BC_TAP_0_2(v)	(((v) << 2) & GENMASK(11, 2))
+
+#define VDPU_REG_REFBU_E(v)		((v) ? BIT(31) : 0)
+
+#define VDPU_REG_PINIT_RLIST_F9(v)	(((v) << 25) & GENMASK(29, 25))
+#define VDPU_REG_PINIT_RLIST_F8(v)	(((v) << 20) & GENMASK(24, 20))
+#define VDPU_REG_PINIT_RLIST_F7(v)	(((v) << 15) & GENMASK(19, 15))
+#define VDPU_REG_PINIT_RLIST_F6(v)	(((v) << 10) & GENMASK(14, 10))
+#define VDPU_REG_PINIT_RLIST_F5(v)	(((v) << 5) & GENMASK(9, 5))
+#define VDPU_REG_PINIT_RLIST_F4(v)	(((v) << 0) & GENMASK(4, 0))
+
+#define VDPU_REG_PINIT_RLIST_F15(v)	(((v) << 25) & GENMASK(29, 25))
+#define VDPU_REG_PINIT_RLIST_F14(v)	(((v) << 20) & GENMASK(24, 20))
+#define VDPU_REG_PINIT_RLIST_F13(v)	(((v) << 15) & GENMASK(19, 15))
+#define VDPU_REG_PINIT_RLIST_F12(v)	(((v) << 10) & GENMASK(14, 10))
+#define VDPU_REG_PINIT_RLIST_F11(v)	(((v) << 5) & GENMASK(9, 5))
+#define VDPU_REG_PINIT_RLIST_F10(v)	(((v) << 0) & GENMASK(4, 0))
+
+#define VDPU_REG_REFER1_NBR(v)		(((v) << 16) & GENMASK(31, 16))
+#define VDPU_REG_REFER0_NBR(v)		(((v) << 0) & GENMASK(15, 0))
+
+#define VDPU_REG_REFER3_NBR(v)		(((v) << 16) & GENMASK(31, 16))
+#define VDPU_REG_REFER2_NBR(v)		(((v) << 0) & GENMASK(15, 0))
+
+#define VDPU_REG_REFER5_NBR(v)		(((v) << 16) & GENMASK(31, 16))
+#define VDPU_REG_REFER4_NBR(v)		(((v) << 0) & GENMASK(15, 0))
+
+#define VDPU_REG_REFER7_NBR(v)		(((v) << 16) & GENMASK(31, 16))
+#define VDPU_REG_REFER6_NBR(v)		(((v) << 0) & GENMASK(15, 0))
+
+#define VDPU_REG_REFER9_NBR(v)		(((v) << 16) & GENMASK(31, 16))
+#define VDPU_REG_REFER8_NBR(v)		(((v) << 0) & GENMASK(15, 0))
+
+#define VDPU_REG_REFER11_NBR(v)		(((v) << 16) & GENMASK(31, 16))
+#define VDPU_REG_REFER10_NBR(v)		(((v) << 0) & GENMASK(15, 0))
+
+#define VDPU_REG_REFER13_NBR(v)		(((v) << 16) & GENMASK(31, 16))
+#define VDPU_REG_REFER12_NBR(v)		(((v) << 0) & GENMASK(15, 0))
+
+#define VDPU_REG_REFER15_NBR(v)		(((v) << 16) & GENMASK(31, 16))
+#define VDPU_REG_REFER14_NBR(v)		(((v) << 0) & GENMASK(15, 0))
+
+#define VDPU_REG_BINIT_RLIST_F5(v)	(((v) << 25) & GENMASK(29, 25))
+#define VDPU_REG_BINIT_RLIST_F4(v)	(((v) << 20) & GENMASK(24, 20))
+#define VDPU_REG_BINIT_RLIST_F3(v)	(((v) << 15) & GENMASK(19, 15))
+#define VDPU_REG_BINIT_RLIST_F2(v)	(((v) << 10) & GENMASK(14, 10))
+#define VDPU_REG_BINIT_RLIST_F1(v)	(((v) << 5) & GENMASK(9, 5))
+#define VDPU_REG_BINIT_RLIST_F0(v)	(((v) << 0) & GENMASK(4, 0))
+
+#define VDPU_REG_BINIT_RLIST_F11(v)	(((v) << 25) & GENMASK(29, 25))
+#define VDPU_REG_BINIT_RLIST_F10(v)	(((v) << 20) & GENMASK(24, 20))
+#define VDPU_REG_BINIT_RLIST_F9(v)	(((v) << 15) & GENMASK(19, 15))
+#define VDPU_REG_BINIT_RLIST_F8(v)	(((v) << 10) & GENMASK(14, 10))
+#define VDPU_REG_BINIT_RLIST_F7(v)	(((v) << 5) & GENMASK(9, 5))
+#define VDPU_REG_BINIT_RLIST_F6(v)	(((v) << 0) & GENMASK(4, 0))
+
+#define VDPU_REG_BINIT_RLIST_F15(v)	(((v) << 15) & GENMASK(19, 15))
+#define VDPU_REG_BINIT_RLIST_F14(v)	(((v) << 10) & GENMASK(14, 10))
+#define VDPU_REG_BINIT_RLIST_F13(v)	(((v) << 5) & GENMASK(9, 5))
+#define VDPU_REG_BINIT_RLIST_F12(v)	(((v) << 0) & GENMASK(4, 0))
+
+#define VDPU_REG_BINIT_RLIST_B5(v)	(((v) << 25) & GENMASK(29, 25))
+#define VDPU_REG_BINIT_RLIST_B4(v)	(((v) << 20) & GENMASK(24, 20))
+#define VDPU_REG_BINIT_RLIST_B3(v)	(((v) << 15) & GENMASK(19, 15))
+#define VDPU_REG_BINIT_RLIST_B2(v)	(((v) << 10) & GENMASK(14, 10))
+#define VDPU_REG_BINIT_RLIST_B1(v)	(((v) << 5) & GENMASK(9, 5))
+#define VDPU_REG_BINIT_RLIST_B0(v)	(((v) << 0) & GENMASK(4, 0))
+
+#define VDPU_REG_BINIT_RLIST_B11(v)	(((v) << 25) & GENMASK(29, 25))
+#define VDPU_REG_BINIT_RLIST_B10(v)	(((v) << 20) & GENMASK(24, 20))
+#define VDPU_REG_BINIT_RLIST_B9(v)	(((v) << 15) & GENMASK(19, 15))
+#define VDPU_REG_BINIT_RLIST_B8(v)	(((v) << 10) & GENMASK(14, 10))
+#define VDPU_REG_BINIT_RLIST_B7(v)	(((v) << 5) & GENMASK(9, 5))
+#define VDPU_REG_BINIT_RLIST_B6(v)	(((v) << 0) & GENMASK(4, 0))
+
+#define VDPU_REG_BINIT_RLIST_B15(v)	(((v) << 15) & GENMASK(19, 15))
+#define VDPU_REG_BINIT_RLIST_B14(v)	(((v) << 10) & GENMASK(14, 10))
+#define VDPU_REG_BINIT_RLIST_B13(v)	(((v) << 5) & GENMASK(9, 5))
+#define VDPU_REG_BINIT_RLIST_B12(v)	(((v) << 0) & GENMASK(4, 0))
+
+#define VDPU_REG_PINIT_RLIST_F3(v)	(((v) << 15) & GENMASK(19, 15))
+#define VDPU_REG_PINIT_RLIST_F2(v)	(((v) << 10) & GENMASK(14, 10))
+#define VDPU_REG_PINIT_RLIST_F1(v)	(((v) << 5) & GENMASK(9, 5))
+#define VDPU_REG_PINIT_RLIST_F0(v)	(((v) << 0) & GENMASK(4, 0))
+
+#define VDPU_REG_REFER_LTERM_E(v)	(((v) << 0) & GENMASK(31, 0))
+
+#define VDPU_REG_REFER_VALID_E(v)	(((v) << 0) & GENMASK(31, 0))
+
+#define VDPU_REG_STRM_START_BIT(v)	(((v) << 0) & GENMASK(5, 0))
+
+#define VDPU_REG_CH_QP_OFFSET2(v)	(((v) << 22) & GENMASK(26, 22))
+#define VDPU_REG_CH_QP_OFFSET(v)	(((v) << 17) & GENMASK(21, 17))
+#define VDPU_REG_PIC_MB_HEIGHT_P(v)	(((v) << 9) & GENMASK(16, 9))
+#define VDPU_REG_PIC_MB_WIDTH(v)	(((v) << 0) & GENMASK(8, 0))
+
+#define VDPU_REG_WEIGHT_BIPR_IDC(v)	(((v) << 16) & GENMASK(17, 16))
+#define VDPU_REG_REF_FRAMES(v)		(((v) << 0) & GENMASK(4, 0))
+
+#define VDPU_REG_FILT_CTRL_PRES(v)	((v) ? BIT(31) : 0)
+#define VDPU_REG_RDPIC_CNT_PRES(v)	((v) ? BIT(30) : 0)
+#define VDPU_REG_FRAMENUM_LEN(v)	(((v) << 16) & GENMASK(20, 16))
+#define VDPU_REG_FRAMENUM(v)		(((v) << 0) & GENMASK(15, 0))
+
+#define VDPU_REG_REFPIC_MK_LEN(v)	(((v) << 16) & GENMASK(26, 16))
+#define VDPU_REG_IDR_PIC_ID(v)		(((v) << 0) & GENMASK(15, 0))
+
+#define VDPU_REG_PPS_ID(v)		(((v) << 24) & GENMASK(31, 24))
+#define VDPU_REG_REFIDX1_ACTIVE(v)	(((v) << 19) & GENMASK(23, 19))
+#define VDPU_REG_REFIDX0_ACTIVE(v)	(((v) << 14) & GENMASK(18, 14))
+#define VDPU_REG_POC_LENGTH(v)		(((v) << 0) & GENMASK(7, 0))
+
+#define VDPU_REG_IDR_PIC_E(v)		((v) ? BIT(8) : 0)
+#define VDPU_REG_DIR_8X8_INFER_E(v)	((v) ? BIT(7) : 0)
+#define VDPU_REG_BLACKWHITE_E(v)	((v) ? BIT(6) : 0)
+#define VDPU_REG_CABAC_E(v)		((v) ? BIT(5) : 0)
+#define VDPU_REG_WEIGHT_PRED_E(v)	((v) ? BIT(4) : 0)
+#define VDPU_REG_CONST_INTRA_E(v)	((v) ? BIT(3) : 0)
+#define VDPU_REG_8X8TRANS_FLAG_E(v)	((v) ? BIT(2) : 0)
+#define VDPU_REG_TYPE1_QUANT_E(v)	((v) ? BIT(1) : 0)
+#define VDPU_REG_FIELDPIC_FLAG_E(v)	((v) ? BIT(0) : 0)
+
+void rk3399_vpu_h264_dec_run(struct hantro_ctx *ctx)
+{
+	struct hantro_dev *vpu = ctx->dev;
+	struct vb2_v4l2_buffer *src_buf, *dst_buf;
+	const struct hantro_h264_dec_ctrls *ctrls;
+	const struct v4l2_ctrl_h264_decode_params *dec_param;
+	const struct v4l2_ctrl_h264_slice_params *slices;
+	const struct v4l2_ctrl_h264_sps *sps;
+	const struct v4l2_ctrl_h264_pps *pps;
+	const u8 *b0_reflist, *b1_reflist, *p_reflist;
+	dma_addr_t addr;
+	u32 reg;
+	unsigned int offset = MV_OFFSET_420;
+
+	/* Prepare the H264 decoder context. */
+	if (hantro_h264_dec_prepare_run(ctx))
+		return;
+
+	src_buf = hantro_get_src_buf(ctx);
+	dst_buf = hantro_get_dst_buf(ctx);
+
+	ctrls = &ctx->h264_dec.ctrls;
+	dec_param = ctrls->decode;
+	slices = ctrls->slices;
+	sps = ctrls->sps;
+	pps = ctrls->pps;
+
+	b0_reflist = ctx->h264_dec.reflists.b0;
+	b1_reflist = ctx->h264_dec.reflists.b1;
+	p_reflist = ctx->h264_dec.reflists.p;
+
+	reg = VDPU_REG_DEC_ADV_PRE_DIS(0) |
+	      VDPU_REG_DEC_SCMD_DIS(0) |
+	      VDPU_REG_FILTERING_DIS(0) |
+	      VDPU_REG_PIC_FIXED_QUANT(0) |
+	      VDPU_REG_DEC_LATENCY(0);
+	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(50));
+
+	reg = VDPU_REG_INIT_QP(pps->pic_init_qp_minus26 + 26) |
+	      VDPU_REG_STREAM_LEN(vb2_get_plane_payload(&src_buf->vb2_buf, 0));
+	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(51));
+
+	reg = VDPU_REG_APF_THRESHOLD(8) |
+	      VDPU_REG_STARTMB_X(0) |
+	      VDPU_REG_STARTMB_Y(0);
+	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(52));
+
+	reg = VDPU_REG_DEC_MODE(0);
+	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(53));
+
+	reg = VDPU_REG_DEC_STRENDIAN_E(1) |
+	      VDPU_REG_DEC_STRSWAP32_E(1) |
+	      VDPU_REG_DEC_OUTSWAP32_E(1) |
+	      VDPU_REG_DEC_INSWAP32_E(1) |
+	      VDPU_REG_DEC_OUT_ENDIAN(1) |
+	      VDPU_REG_DEC_IN_ENDIAN(0);
+	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(54));
+
+	reg = VDPU_REG_DEC_DATA_DISC_E(0) |
+	      VDPU_REG_DEC_MAX_BURST(16) |
+	      VDPU_REG_DEC_AXI_WR_ID(0) |
+	      VDPU_REG_DEC_AXI_RD_ID(0xff);
+	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(56));
+
+	reg = VDPU_REG_START_CODE_E(1) |
+	      VDPU_REG_CH_8PIX_ILEAV_E(0) |
+	      VDPU_REG_RLC_MODE_E(0) |
+	      VDPU_REG_PIC_INTERLACE_E(!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY) && (sps->flags & V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD || slices[0].flags & V4L2_H264_SLICE_FLAG_FIELD_PIC)) |
+	      VDPU_REG_PIC_FIELDMODE_E(slices[0].flags & V4L2_H264_SLICE_FLAG_FIELD_PIC) |
+	      VDPU_REG_PIC_TOPFIELD_E(!(slices[0].flags & V4L2_H264_SLICE_FLAG_BOTTOM_FIELD)) |
+	      VDPU_REG_WRITE_MVS_E(dec_param->nal_ref_idc) |
+	      VDPU_REG_SEQ_MBAFF_E(sps->flags & V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD) |
+	      VDPU_REG_PICORD_COUNT_E(1) |
+	      VDPU_REG_DEC_TIMEOUT_E(1) |
+	      VDPU_REG_DEC_CLK_GATE_E(1);
+	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(57));
+
+	reg = VDPU_REG_PRED_BC_TAP_0_0(1) |
+	      VDPU_REG_PRED_BC_TAP_0_1((u32)-5) |
+	      VDPU_REG_PRED_BC_TAP_0_2(20);
+	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(59));
+
+	reg = VDPU_REG_REFBU_E(0);
+	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(65));
+
+	reg = VDPU_REG_PINIT_RLIST_F9(p_reflist[9]) |
+	      VDPU_REG_PINIT_RLIST_F8(p_reflist[8]) |
+	      VDPU_REG_PINIT_RLIST_F7(p_reflist[7]) |
+	      VDPU_REG_PINIT_RLIST_F6(p_reflist[6]) |
+	      VDPU_REG_PINIT_RLIST_F5(p_reflist[5]) |
+	      VDPU_REG_PINIT_RLIST_F4(p_reflist[4]);
+	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(74));
+
+	reg = VDPU_REG_PINIT_RLIST_F15(p_reflist[15]) |
+	      VDPU_REG_PINIT_RLIST_F14(p_reflist[14]) |
+	      VDPU_REG_PINIT_RLIST_F13(p_reflist[13]) |
+	      VDPU_REG_PINIT_RLIST_F12(p_reflist[12]) |
+	      VDPU_REG_PINIT_RLIST_F11(p_reflist[11]) |
+	      VDPU_REG_PINIT_RLIST_F10(p_reflist[10]);
+	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(75));
+
+	reg = VDPU_REG_REFER1_NBR(hantro_h264_get_ref_nbr(ctx, 1)) |
+	      VDPU_REG_REFER0_NBR(hantro_h264_get_ref_nbr(ctx, 0));
+	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(76));
+
+	reg = VDPU_REG_REFER3_NBR(hantro_h264_get_ref_nbr(ctx, 3)) |
+	      VDPU_REG_REFER2_NBR(hantro_h264_get_ref_nbr(ctx, 2));
+	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(77));
+
+	reg = VDPU_REG_REFER5_NBR(hantro_h264_get_ref_nbr(ctx, 5)) |
+	      VDPU_REG_REFER4_NBR(hantro_h264_get_ref_nbr(ctx, 4));
+	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(78));
+
+	reg = VDPU_REG_REFER7_NBR(hantro_h264_get_ref_nbr(ctx, 7)) |
+	      VDPU_REG_REFER6_NBR(hantro_h264_get_ref_nbr(ctx, 6));
+	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(79));
+
+	reg = VDPU_REG_REFER9_NBR(hantro_h264_get_ref_nbr(ctx, 9)) |
+	      VDPU_REG_REFER8_NBR(hantro_h264_get_ref_nbr(ctx, 8));
+	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(80));
+
+	reg = VDPU_REG_REFER11_NBR(hantro_h264_get_ref_nbr(ctx, 11)) |
+	      VDPU_REG_REFER10_NBR(hantro_h264_get_ref_nbr(ctx, 10));
+	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(81));
+
+	reg = VDPU_REG_REFER13_NBR(hantro_h264_get_ref_nbr(ctx, 13)) |
+	      VDPU_REG_REFER12_NBR(hantro_h264_get_ref_nbr(ctx, 12));
+	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(82));
+
+	reg = VDPU_REG_REFER15_NBR(hantro_h264_get_ref_nbr(ctx, 15)) |
+	      VDPU_REG_REFER14_NBR(hantro_h264_get_ref_nbr(ctx, 14));
+	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(83));
+
+	reg = VDPU_REG_BINIT_RLIST_F5(b0_reflist[5]) |
+	      VDPU_REG_BINIT_RLIST_F4(b0_reflist[4]) |
+	      VDPU_REG_BINIT_RLIST_F3(b0_reflist[3]) |
+	      VDPU_REG_BINIT_RLIST_F2(b0_reflist[2]) |
+	      VDPU_REG_BINIT_RLIST_F1(b0_reflist[1]) |
+	      VDPU_REG_BINIT_RLIST_F0(b0_reflist[0]);
+	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(100));
+
+	reg = VDPU_REG_BINIT_RLIST_F11(b0_reflist[11]) |
+	      VDPU_REG_BINIT_RLIST_F10(b0_reflist[10]) |
+	      VDPU_REG_BINIT_RLIST_F9(b0_reflist[9]) |
+	      VDPU_REG_BINIT_RLIST_F8(b0_reflist[8]) |
+	      VDPU_REG_BINIT_RLIST_F7(b0_reflist[7]) |
+	      VDPU_REG_BINIT_RLIST_F6(b0_reflist[6]);
+	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(101));
+
+	reg = VDPU_REG_BINIT_RLIST_F15(b0_reflist[15]) |
+	      VDPU_REG_BINIT_RLIST_F14(b0_reflist[14]) |
+	      VDPU_REG_BINIT_RLIST_F13(b0_reflist[13]) |
+	      VDPU_REG_BINIT_RLIST_F12(b0_reflist[12]);
+	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(102));
+
+	reg = VDPU_REG_BINIT_RLIST_B5(b1_reflist[5]) |
+	      VDPU_REG_BINIT_RLIST_B4(b1_reflist[4]) |
+	      VDPU_REG_BINIT_RLIST_B3(b1_reflist[3]) |
+	      VDPU_REG_BINIT_RLIST_B2(b1_reflist[2]) |
+	      VDPU_REG_BINIT_RLIST_B1(b1_reflist[1]) |
+	      VDPU_REG_BINIT_RLIST_B0(b1_reflist[0]);
+	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(103));
+
+	reg = VDPU_REG_BINIT_RLIST_B11(b1_reflist[11]) |
+	      VDPU_REG_BINIT_RLIST_B10(b1_reflist[10]) |
+	      VDPU_REG_BINIT_RLIST_B9(b1_reflist[9]) |
+	      VDPU_REG_BINIT_RLIST_B8(b1_reflist[8]) |
+	      VDPU_REG_BINIT_RLIST_B7(b1_reflist[7]) |
+	      VDPU_REG_BINIT_RLIST_B6(b1_reflist[6]);
+	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(104));
+
+	reg = VDPU_REG_BINIT_RLIST_B15(b1_reflist[15]) |
+	      VDPU_REG_BINIT_RLIST_B14(b1_reflist[14]) |
+	      VDPU_REG_BINIT_RLIST_B13(b1_reflist[13]) |
+	      VDPU_REG_BINIT_RLIST_B12(b1_reflist[12]);
+	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(105));
+
+	reg = VDPU_REG_PINIT_RLIST_F3(p_reflist[3]) |
+	      VDPU_REG_PINIT_RLIST_F2(p_reflist[2]) |
+	      VDPU_REG_PINIT_RLIST_F1(p_reflist[1]) |
+	      VDPU_REG_PINIT_RLIST_F0(p_reflist[0]);
+	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(106));
+
+	reg = VDPU_REG_REFER_LTERM_E(ctx->h264_dec.dpb_longterm);
+	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(107));
+
+	reg = VDPU_REG_REFER_VALID_E(ctx->h264_dec.dpb_valid);
+	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(108));
+
+	reg = VDPU_REG_STRM_START_BIT(0);
+	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(109));
+
+	reg = VDPU_REG_CH_QP_OFFSET2(pps->second_chroma_qp_index_offset) |
+	      VDPU_REG_CH_QP_OFFSET(pps->chroma_qp_index_offset) |
+	      VDPU_REG_PIC_MB_HEIGHT_P(H264_MB_HEIGHT(ctx->dst_fmt.height)) |
+	      VDPU_REG_PIC_MB_WIDTH(H264_MB_WIDTH(ctx->dst_fmt.width));
+	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(110));
+
+	reg = VDPU_REG_WEIGHT_BIPR_IDC(pps->weighted_bipred_idc) |
+	      VDPU_REG_REF_FRAMES(sps->max_num_ref_frames);
+	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(111));
+
+	reg = VDPU_REG_FILT_CTRL_PRES(pps->flags & V4L2_H264_PPS_FLAG_DEBLOCKING_FILTER_CONTROL_PRESENT) |
+	      VDPU_REG_RDPIC_CNT_PRES(pps->flags & V4L2_H264_PPS_FLAG_REDUNDANT_PIC_CNT_PRESENT) |
+	      VDPU_REG_FRAMENUM_LEN(sps->log2_max_frame_num_minus4 + 4) |
+	      VDPU_REG_FRAMENUM(slices[0].frame_num);
+	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(112));
+
+	reg = VDPU_REG_REFPIC_MK_LEN(slices[0].dec_ref_pic_marking_bit_size) |
+	      VDPU_REG_IDR_PIC_ID(slices[0].idr_pic_id);
+	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(113));
+
+	reg = VDPU_REG_PPS_ID(slices[0].pic_parameter_set_id) |
+	      VDPU_REG_REFIDX1_ACTIVE(pps->num_ref_idx_l1_default_active_minus1 + 1) |
+	      VDPU_REG_REFIDX0_ACTIVE(pps->num_ref_idx_l0_default_active_minus1 + 1) |
+	      VDPU_REG_POC_LENGTH(slices[0].pic_order_cnt_bit_size);
+	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(114));
+
+	reg = VDPU_REG_IDR_PIC_E(dec_param->flags & V4L2_H264_DECODE_PARAM_FLAG_IDR_PIC) |
+	      VDPU_REG_DIR_8X8_INFER_E(sps->flags & V4L2_H264_SPS_FLAG_DIRECT_8X8_INFERENCE) |
+	      VDPU_REG_BLACKWHITE_E(sps->profile_idc >= 100 && sps->chroma_format_idc == 0) |
+	      VDPU_REG_CABAC_E(pps->flags & V4L2_H264_PPS_FLAG_ENTROPY_CODING_MODE) |
+	      VDPU_REG_WEIGHT_PRED_E(pps->flags & V4L2_H264_PPS_FLAG_WEIGHTED_PRED) |
+	      VDPU_REG_CONST_INTRA_E(pps->flags & V4L2_H264_PPS_FLAG_CONSTRAINED_INTRA_PRED) |
+	      VDPU_REG_8X8TRANS_FLAG_E(pps->flags & V4L2_H264_PPS_FLAG_TRANSFORM_8X8_MODE) |
+	      VDPU_REG_TYPE1_QUANT_E(1) |
+	      VDPU_REG_FIELDPIC_FLAG_E(!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY));
+	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(115));
+
+	/* Auxiliary buffer prepared in hantro_g1_h264_dec_prepare_table(). */
+	vdpu_write_relaxed(vpu, ctx->h264_dec.priv.dma, VDPU_REG_QTABLE_BASE);
+
+	/* Source (stream) buffer. */
+	addr = vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0);
+	vdpu_write_relaxed(vpu, addr, VDPU_REG_RLC_VLC_BASE);
+
+	/* Destination (decoded frame) buffer. */
+	addr = vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
+	if (ctrls->slices[0].flags & V4L2_H264_SLICE_FLAG_BOTTOM_FIELD)
+		addr += ALIGN(ctx->dst_fmt.width, H264_MB_DIM);
+	vdpu_write_relaxed(vpu, addr, VDPU_REG_DEC_OUT_BASE);
+
+	/* Motion vector buffer is located after the decoded frame. */
+	addr = vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
+	if (sps->profile_idc >= 100 && sps->chroma_format_idc == 0)
+		offset = MV_OFFSET_400;
+	addr += offset * H264_MB_WIDTH(ctx->dst_fmt.width) *
+		   H264_MB_HEIGHT(ctx->dst_fmt.height);
+	if (ctrls->slices[0].flags & V4L2_H264_SLICE_FLAG_BOTTOM_FIELD)
+		addr += 32 * H264_MB_WIDTH(ctx->dst_fmt.width) *
+			   H264_MB_HEIGHT(ctx->dst_fmt.height);
+	vdpu_write_relaxed(vpu, addr, VDPU_REG_DIR_MV_BASE);
+
+	vdpu_write_relaxed(vpu, hantro_h264_get_ref_dma_addr(ctx, 0), VDPU_REG_REFER0_BASE);
+	vdpu_write_relaxed(vpu, hantro_h264_get_ref_dma_addr(ctx, 1), VDPU_REG_REFER1_BASE);
+	vdpu_write_relaxed(vpu, hantro_h264_get_ref_dma_addr(ctx, 2), VDPU_REG_REFER2_BASE);
+	vdpu_write_relaxed(vpu, hantro_h264_get_ref_dma_addr(ctx, 3), VDPU_REG_REFER3_BASE);
+	vdpu_write_relaxed(vpu, hantro_h264_get_ref_dma_addr(ctx, 4), VDPU_REG_REFER4_BASE);
+	vdpu_write_relaxed(vpu, hantro_h264_get_ref_dma_addr(ctx, 5), VDPU_REG_REFER5_BASE);
+	vdpu_write_relaxed(vpu, hantro_h264_get_ref_dma_addr(ctx, 6), VDPU_REG_REFER6_BASE);
+	vdpu_write_relaxed(vpu, hantro_h264_get_ref_dma_addr(ctx, 7), VDPU_REG_REFER7_BASE);
+	vdpu_write_relaxed(vpu, hantro_h264_get_ref_dma_addr(ctx, 8), VDPU_REG_REFER8_BASE);
+	vdpu_write_relaxed(vpu, hantro_h264_get_ref_dma_addr(ctx, 9), VDPU_REG_REFER9_BASE);
+	vdpu_write_relaxed(vpu, hantro_h264_get_ref_dma_addr(ctx, 10), VDPU_REG_REFER10_BASE);
+	vdpu_write_relaxed(vpu, hantro_h264_get_ref_dma_addr(ctx, 11), VDPU_REG_REFER11_BASE);
+	vdpu_write_relaxed(vpu, hantro_h264_get_ref_dma_addr(ctx, 12), VDPU_REG_REFER12_BASE);
+	vdpu_write_relaxed(vpu, hantro_h264_get_ref_dma_addr(ctx, 13), VDPU_REG_REFER13_BASE);
+	vdpu_write_relaxed(vpu, hantro_h264_get_ref_dma_addr(ctx, 14), VDPU_REG_REFER14_BASE);
+	vdpu_write_relaxed(vpu, hantro_h264_get_ref_dma_addr(ctx, 15), VDPU_REG_REFER15_BASE);
+
+	hantro_finish_run(ctx);
+
+	/* Start decoding! */
+	reg = vdpu_read(vpu, VDPU_SWREG(57)) | VDPU_REG_DEC_E(1);
+	vdpu_write(vpu, reg, VDPU_SWREG(57));
+}
-- 
2.17.1

