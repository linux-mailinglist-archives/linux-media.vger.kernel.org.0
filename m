Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3A518DE57
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2019 22:04:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729451AbfHNUEk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Aug 2019 16:04:40 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:57632 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729021AbfHNUEj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Aug 2019 16:04:39 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 1E48C28CBA9
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        fbuergisser@chromium.org, linux-kernel@vger.kernel.org,
        Hertz Wong <hertz.wong@rock-chips.com>
Subject: [PATCH v6 09/11] media: hantro: Add core bits to support H264 decoding
Date:   Wed, 14 Aug 2019 16:59:29 -0300
Message-Id: <20190814195931.6587-10-ezequiel@collabora.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190814195931.6587-1-ezequiel@collabora.com>
References: <20190814195931.6587-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hertz Wong <hertz.wong@rock-chips.com>

Add helpers and patch hantro_{drv,v4l2}.c to prepare addition of H264
decoding support.

Signed-off-by: Hertz Wong <hertz.wong@rock-chips.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Tested-by: Philipp Zabel <p.zabel@pengutronix.de>
---
Changes in v6:
* Fixed duplicated CABAC table memcpy.
* Adjust to renamed controls.
Changes in v5:
* None.
Changes in v4:
* Rework extra_size0, exposing the size via TRY_FMT/S_FMT
  to allow buffer importation, as suggested by Tomasz.
* Drop max slice limit.
* Use a ternary operator instead of substracting POCs,
  to avoid an overflow as pointed out by Rasmus.
* Specify annex B slice start code.
* Add missing extra_size0 to sizeimage
* Swap the first 2 entries of list B1 when B0 and B1 match (mandated by
  the spec)
* Move the update_dpb() call before the prepare_table() one to make the
  POCs stored in the private table match the content of the new DPB
---
 drivers/staging/media/hantro/Makefile      |   1 +
 drivers/staging/media/hantro/hantro.h      |   9 +-
 drivers/staging/media/hantro/hantro_drv.c  |  42 ++
 drivers/staging/media/hantro/hantro_h264.c | 641 +++++++++++++++++++++
 drivers/staging/media/hantro/hantro_hw.h   |  55 ++
 drivers/staging/media/hantro/hantro_v4l2.c |  10 +
 6 files changed, 757 insertions(+), 1 deletion(-)
 create mode 100644 drivers/staging/media/hantro/hantro_h264.c

diff --git a/drivers/staging/media/hantro/Makefile b/drivers/staging/media/hantro/Makefile
index f5ec597d9e08..0f0d3afb1cca 100644
--- a/drivers/staging/media/hantro/Makefile
+++ b/drivers/staging/media/hantro/Makefile
@@ -10,6 +10,7 @@ hantro-vpu-y += \
 		rk3399_vpu_hw_mpeg2_dec.o \
 		rk3399_vpu_hw_vp8_dec.o \
 		hantro_jpeg.o \
+		hantro_h264.o \
 		hantro_mpeg2.o \
 		hantro_vp8.o
 
diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
index c4c86c32ea2d..f670bbde4159 100644
--- a/drivers/staging/media/hantro/hantro.h
+++ b/drivers/staging/media/hantro/hantro.h
@@ -30,6 +30,10 @@
 #define VP8_MB_WIDTH(w)			DIV_ROUND_UP(w, VP8_MB_DIM)
 #define VP8_MB_HEIGHT(h)		DIV_ROUND_UP(h, VP8_MB_DIM)
 
+#define H264_MB_DIM			16
+#define H264_MB_WIDTH(w)		DIV_ROUND_UP(w, H264_MB_DIM)
+#define H264_MB_HEIGHT(h)		DIV_ROUND_UP(h, H264_MB_DIM)
+
 #define MPEG2_MB_DIM			16
 #define MPEG2_MB_WIDTH(w)		DIV_ROUND_UP(w, MPEG2_MB_DIM)
 #define MPEG2_MB_HEIGHT(h)		DIV_ROUND_UP(h, MPEG2_MB_DIM)
@@ -43,9 +47,9 @@ struct hantro_codec_ops;
 
 #define HANTRO_JPEG_ENCODER	BIT(0)
 #define HANTRO_ENCODERS		0x0000ffff
-
 #define HANTRO_MPEG2_DECODER	BIT(16)
 #define HANTRO_VP8_DECODER	BIT(17)
+#define HANTRO_H264_DECODER	BIT(18)
 #define HANTRO_DECODERS		0xffff0000
 
 /**
@@ -102,12 +106,14 @@ struct hantro_variant {
  * enum hantro_codec_mode - codec operating mode.
  * @HANTRO_MODE_NONE:  No operating mode. Used for RAW video formats.
  * @HANTRO_MODE_JPEG_ENC: JPEG encoder.
+ * @HANTRO_MODE_H264_DEC: H264 decoder.
  * @HANTRO_MODE_MPEG2_DEC: MPEG-2 decoder.
  * @HANTRO_MODE_VP8_DEC: VP8 decoder.
  */
 enum hantro_codec_mode {
 	HANTRO_MODE_NONE = -1,
 	HANTRO_MODE_JPEG_ENC,
+	HANTRO_MODE_H264_DEC,
 	HANTRO_MODE_MPEG2_DEC,
 	HANTRO_MODE_VP8_DEC,
 };
@@ -246,6 +252,7 @@ struct hantro_ctx {
 
 	/* Specific for particular codec modes. */
 	union {
+		struct hantro_h264_dec_hw_ctx h264_dec;
 		struct hantro_jpeg_enc_hw_ctx jpeg_enc;
 		struct hantro_mpeg2_dec_hw_ctx mpeg2_dec;
 		struct hantro_vp8_dec_hw_ctx vp8_dec;
diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index 6e2351e46750..f4cea216c926 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -314,6 +314,48 @@ static const struct hantro_ctrl controls[] = {
 		.cfg = {
 			.id = V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER,
 		},
+	}, {
+		.codec = HANTRO_H264_DECODER,
+		.cfg = {
+			.id = V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS,
+		},
+	}, {
+		.codec = HANTRO_H264_DECODER,
+		.cfg = {
+			.id = V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS,
+		},
+	}, {
+		.codec = HANTRO_H264_DECODER,
+		.cfg = {
+			.id = V4L2_CID_MPEG_VIDEO_H264_SPS,
+		},
+	}, {
+		.codec = HANTRO_H264_DECODER,
+		.cfg = {
+			.id = V4L2_CID_MPEG_VIDEO_H264_PPS,
+		},
+	}, {
+		.codec = HANTRO_H264_DECODER,
+		.cfg = {
+			.id = V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX,
+		},
+	}, {
+		.codec = HANTRO_H264_DECODER,
+		.cfg = {
+			.id = V4L2_CID_MPEG_VIDEO_H264_DECODE_MODE,
+			.max = V4L2_MPEG_VIDEO_H264_DECODE_MODE_FRAME_BASED,
+			.def = V4L2_MPEG_VIDEO_H264_DECODE_MODE_FRAME_BASED,
+			.menu_skip_mask = BIT(V4L2_MPEG_VIDEO_H264_DECODE_MODE_SLICE_BASED),
+		},
+	}, {
+		.codec = HANTRO_H264_DECODER,
+		.cfg = {
+			.id = V4L2_CID_MPEG_VIDEO_H264_START_CODE,
+			.max = V4L2_MPEG_VIDEO_H264_START_CODE_ANNEX_B,
+			.def = V4L2_MPEG_VIDEO_H264_START_CODE_ANNEX_B,
+			.menu_skip_mask = BIT(V4L2_MPEG_VIDEO_H264_START_CODE_NONE),
+		},
+	}, {
 	},
 };
 
diff --git a/drivers/staging/media/hantro/hantro_h264.c b/drivers/staging/media/hantro/hantro_h264.c
new file mode 100644
index 000000000000..05e210a2cdbe
--- /dev/null
+++ b/drivers/staging/media/hantro/hantro_h264.c
@@ -0,0 +1,641 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Rockchip RK3288 VPU codec driver
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
+#include <media/v4l2-mem2mem.h>
+
+#include "hantro.h"
+#include "hantro_hw.h"
+
+/* Size with u32 units. */
+#define CABAC_INIT_BUFFER_SIZE		(460 * 2)
+#define POC_BUFFER_SIZE			34
+#define SCALING_LIST_SIZE		(6 * 16 + 6 * 64)
+
+#define POC_CMP(p0, p1) ((p0) < (p1) ? -1 : 1)
+
+/* Data structure describing auxiliary buffer format. */
+struct hantro_h264_dec_priv_tbl {
+	u32 cabac_table[CABAC_INIT_BUFFER_SIZE];
+	u32 poc[POC_BUFFER_SIZE];
+	u8 scaling_list[SCALING_LIST_SIZE];
+};
+
+/* Constant CABAC table. */
+static const u32 h264_cabac_table[] = {
+	0x14f10236, 0x034a14f1, 0x0236034a, 0xe47fe968, 0xfa35ff36, 0x07330000,
+	0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
+	0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
+	0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
+	0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
+	0x0029003f, 0x003f003f, 0xf7530456, 0x0061f948, 0x0d29033e, 0x000b0137,
+	0x0045ef7f, 0xf3660052, 0xf94aeb6b, 0xe57fe17f, 0xe87fee5f, 0xe57feb72,
+	0xe27fef7b, 0xf473f07a, 0xf573f43f, 0xfe44f154, 0xf368fd46, 0xf85df65a,
+	0xe27fff4a, 0xfa61f95b, 0xec7ffc38, 0xfb52f94c, 0xea7df95d, 0xf557fd4d,
+	0xfb47fc3f, 0xfc44f454, 0xf93ef941, 0x083d0538, 0xfe420140, 0x003dfe4e,
+	0x01320734, 0x0a23002c, 0x0b26012d, 0x002e052c, 0x1f110133, 0x07321c13,
+	0x10210e3e, 0xf36cf164, 0xf365f35b, 0xf45ef658, 0xf054f656, 0xf953f357,
+	0xed5e0146, 0x0048fb4a, 0x123bf866, 0xf164005f, 0xfc4b0248, 0xf54bfd47,
+	0x0f2ef345, 0x003e0041, 0x1525f148, 0x09391036, 0x003e0c48, 0x18000f09,
+	0x08190d12, 0x0f090d13, 0x0a250c12, 0x061d1421, 0x0f1e042d, 0x013a003e,
+	0x073d0c26, 0x0b2d0f27, 0x0b2a0d2c, 0x102d0c29, 0x0a311e22, 0x122a0a37,
+	0x1133112e, 0x00591aed, 0x16ef1aef, 0x1ee71cec, 0x21e925e5, 0x21e928e4,
+	0x26ef21f5, 0x28f129fa, 0x26012911, 0x1efa1b03, 0x1a1625f0, 0x23fc26f8,
+	0x26fd2503, 0x26052a00, 0x23102716, 0x0e301b25, 0x153c0c44, 0x0261fd47,
+	0xfa2afb32, 0xfd36fe3e, 0x003a013f, 0xfe48ff4a, 0xf75bfb43, 0xfb1bfd27,
+	0xfe2c002e, 0xf040f844, 0xf64efa4d, 0xf656f45c, 0xf137f63c, 0xfa3efc41,
+	0xf449f84c, 0xf950f758, 0xef6ef561, 0xec54f54f, 0xfa49fc4a, 0xf356f360,
+	0xf561ed75, 0xf84efb21, 0xfc30fe35, 0xfd3ef347, 0xf64ff456, 0xf35af261,
+	0x0000fa5d, 0xfa54f84f, 0x0042ff47, 0x003efe3c, 0xfe3bfb4b, 0xfd3efc3a,
+	0xf742ff4f, 0x00470344, 0x0a2cf93e, 0x0f240e28, 0x101b0c1d, 0x012c1424,
+	0x1220052a, 0x01300a3e, 0x112e0940, 0xf468f561, 0xf060f958, 0xf855f955,
+	0xf755f358, 0x0442fd4d, 0xfd4cfa4c, 0x0a3aff4c, 0xff53f963, 0xf25f025f,
+	0x004cfb4a, 0x0046f54b, 0x01440041, 0xf249033e, 0x043eff44, 0xf34b0b37,
+	0x05400c46, 0x0f060613, 0x07100c0e, 0x120d0d0b, 0x0d0f0f10, 0x0c170d17,
+	0x0f140e1a, 0x0e2c1128, 0x112f1811, 0x15151916, 0x1f1b161d, 0x13230e32,
+	0x0a39073f, 0xfe4dfc52, 0xfd5e0945, 0xf46d24dd, 0x24de20e6, 0x25e22ce0,
+	0x22ee22f1, 0x28f121f9, 0x23fb2100, 0x2602210d, 0x17230d3a, 0x1dfd1a00,
+	0x161e1ff9, 0x23f122fd, 0x220324ff, 0x2205200b, 0x2305220c, 0x270b1e1d,
+	0x221a1d27, 0x13421f15, 0x1f1f1932, 0xef78ec70, 0xee72f555, 0xf15cf259,
+	0xe647f151, 0xf2500044, 0xf246e838, 0xe944e832, 0xf54a17f3, 0x1af328f1,
+	0x31f22c03, 0x2d062c22, 0x21361352, 0xfd4bff17, 0x0122012b, 0x0036fe37,
+	0x003d0140, 0x0044f75c, 0xf26af361, 0xf15af45a, 0xee58f649, 0xf74ff256,
+	0xf649f646, 0xf645fb42, 0xf740fb3a, 0x023b15f6, 0x18f51cf8, 0x1cff1d03,
+	0x1d092314, 0x1d240e43, 0x14f10236, 0x034a14f1, 0x0236034a, 0xe47fe968,
+	0xfa35ff36, 0x07331721, 0x17021500, 0x01090031, 0xdb760539, 0xf34ef541,
+	0x013e0c31, 0xfc491132, 0x1240092b, 0x1d001a43, 0x105a0968, 0xd27fec68,
+	0x0143f34e, 0xf541013e, 0xfa56ef5f, 0xfa3d092d, 0xfd45fa51, 0xf5600637,
+	0x0743fb56, 0x0258003a, 0xfd4cf65e, 0x05360445, 0xfd510058, 0xf943fb4a,
+	0xfc4afb50, 0xf948013a, 0x0029003f, 0x003f003f, 0xf7530456, 0x0061f948,
+	0x0d29033e, 0x002dfc4e, 0xfd60e57e, 0xe462e765, 0xe943e452, 0xec5ef053,
+	0xea6eeb5b, 0xee66f35d, 0xe37ff95c, 0xfb59f960, 0xf36cfd2e, 0xff41ff39,
+	0xf75dfd4a, 0xf75cf857, 0xe97e0536, 0x063c063b, 0x0645ff30, 0x0044fc45,
+	0xf858fe55, 0xfa4eff4b, 0xf94d0236, 0x0532fd44, 0x0132062a, 0xfc51013f,
+	0xfc460043, 0x0239fe4c, 0x0b230440, 0x013d0b23, 0x12190c18, 0x0d1d0d24,
+	0xf65df949, 0xfe490d2e, 0x0931f964, 0x09350235, 0x0535fe3d, 0x00380038,
+	0xf33ffb3c, 0xff3e0439, 0xfa450439, 0x0e270433, 0x0d440340, 0x013d093f,
+	0x07321027, 0x052c0434, 0x0b30fb3c, 0xff3b003b, 0x1621052c, 0x0e2bff4e,
+	0x003c0945, 0x0b1c0228, 0x032c0031, 0x002e022c, 0x0233002f, 0x0427023e,
+	0x062e0036, 0x0336023a, 0x043f0633, 0x06390735, 0x06340637, 0x0b2d0e24,
+	0x0835ff52, 0x0737fd4e, 0x0f2e161f, 0xff541907, 0x1ef91c03, 0x1c042000,
+	0x22ff1e06, 0x1e062009, 0x1f131a1b, 0x1a1e2514, 0x1c221146, 0x0143053b,
+	0x0943101e, 0x12201223, 0x161d181f, 0x1726122b, 0x14290b3f, 0x093b0940,
+	0xff5efe59, 0xf76cfa4c, 0xfe2c002d, 0x0034fd40, 0xfe3bfc46, 0xfc4bf852,
+	0xef66f74d, 0x0318002a, 0x00300037, 0xfa3bf947, 0xf453f557, 0xe277013a,
+	0xfd1dff24, 0x0126022b, 0xfa37003a, 0x0040fd4a, 0xf65a0046, 0xfc1d051f,
+	0x072a013b, 0xfe3afd48, 0xfd51f561, 0x003a0805, 0x0a0e0e12, 0x0d1b0228,
+	0x003afd46, 0xfa4ff855, 0x0000f36a, 0xf06af657, 0xeb72ee6e, 0xf262ea6e,
+	0xeb6aee67, 0xeb6be96c, 0xe670f660, 0xf45ffb5b, 0xf75dea5e, 0xfb560943,
+	0xfc50f655, 0xff46073c, 0x093a053d, 0x0c320f32, 0x12311136, 0x0a29072e,
+	0xff330731, 0x08340929, 0x062f0237, 0x0d290a2c, 0x06320535, 0x0d31043f,
+	0x0640fe45, 0xfe3b0646, 0x0a2c091f, 0x0c2b0335, 0x0e220a26, 0xfd340d28,
+	0x1120072c, 0x07260d32, 0x0a391a2b, 0x0e0b0b0e, 0x090b120b, 0x150917fe,
+	0x20f120f1, 0x22eb27e9, 0x2adf29e1, 0x2ee426f4, 0x151d2de8, 0x35d330e6,
+	0x41d52bed, 0x27f61e09, 0x121a141b, 0x0039f252, 0xfb4bed61, 0xdd7d1b00,
+	0x1c001ffc, 0x1b062208, 0x1e0a1816, 0x21131620, 0x1a1f1529, 0x1a2c172f,
+	0x10410e47, 0x083c063f, 0x11411518, 0x17141a17, 0x1b201c17, 0x1c181728,
+	0x18201c1d, 0x172a1339, 0x1635163d, 0x0b560c28, 0x0b330e3b, 0xfc4ff947,
+	0xfb45f746, 0xf842f644, 0xed49f445, 0xf046f143, 0xec3eed46, 0xf042ea41,
+	0xec3f09fe, 0x1af721f7, 0x27f929fe, 0x2d033109, 0x2d1b243b, 0xfa42f923,
+	0xf92af82d, 0xfb30f438, 0xfa3cfb3e, 0xf842f84c, 0xfb55fa51, 0xf64df951,
+	0xef50ee49, 0xfc4af653, 0xf747f743, 0xff3df842, 0xf242003b, 0x023b15f3,
+	0x21f227f9, 0x2efe3302, 0x3c063d11, 0x37222a3e, 0x14f10236, 0x034a14f1,
+	0x0236034a, 0xe47fe968, 0xfa35ff36, 0x07331619, 0x22001000, 0xfe090429,
+	0xe3760241, 0xfa47f34f, 0x05340932, 0xfd460a36, 0x1a221316, 0x28003902,
+	0x29241a45, 0xd37ff165, 0xfc4cfa47, 0xf34f0534, 0x0645f35a, 0x0034082b,
+	0xfe45fb52, 0xf660023b, 0x024bfd57, 0xfd640138, 0xfd4afa55, 0x003bfd51,
+	0xf956fb5f, 0xff42ff4d, 0x0146fe56, 0xfb48003d, 0x0029003f, 0x003f003f,
+	0xf7530456, 0x0061f948, 0x0d29033e, 0x0d0f0733, 0x0250d97f, 0xee5bef60,
+	0xe651dd62, 0xe866e961, 0xe577e863, 0xeb6eee66, 0xdc7f0050, 0xfb59f95e,
+	0xfc5c0027, 0x0041f154, 0xdd7ffe49, 0xf468f75b, 0xe17f0337, 0x07380737,
+	0x083dfd35, 0x0044f94a, 0xf758f367, 0xf35bf759, 0xf25cf84c, 0xf457e96e,
+	0xe869f64e, 0xec70ef63, 0xb27fba7f, 0xce7fd27f, 0xfc42fb4e, 0xfc47f848,
+	0x023bff37, 0xf946fa4b, 0xf859de77, 0xfd4b2014, 0x1e16d47f, 0x0036fb3d,
+	0x003aff3c, 0xfd3df843, 0xe754f24a, 0xfb410534, 0x0239003d, 0xf745f546,
+	0x1237fc47, 0x003a073d, 0x09291219, 0x0920052b, 0x092f002c, 0x0033022e,
+	0x1326fc42, 0x0f260c2a, 0x09220059, 0x042d0a1c, 0x0a1f21f5, 0x34d5120f,
+	0x1c0023ea, 0x26e72200, 0x27ee20f4, 0x66a20000, 0x38f121fc, 0x1d0a25fb,
+	0x33e327f7, 0x34de45c6, 0x43c12cfb, 0x200737e3, 0x20010000, 0x1b2421e7,
+	0x22e224e4, 0x26e426e5, 0x22ee23f0, 0x22f220f8, 0x25fa2300, 0x1e0a1c12,
+	0x1a191d29, 0x004b0248, 0x084d0e23, 0x121f1123, 0x151e112d, 0x142a122d,
+	0x1b1a1036, 0x07421038, 0x0b490a43, 0xf674e970, 0xf147f93d, 0x0035fb42,
+	0xf54df750, 0xf754f657, 0xde7feb65, 0xfd27fb35, 0xf93df54b, 0xf14def5b,
+	0xe76be76f, 0xe47af54c, 0xf62cf634, 0xf639f73a, 0xf048f945, 0xfc45fb4a,
+	0xf7560242, 0xf7220120, 0x0b1f0534, 0xfe37fe43, 0x0049f859, 0x03340704,
+	0x0a081108, 0x10130325, 0xff3dfb49, 0xff46fc4e, 0x0000eb7e, 0xe97cec6e,
+	0xe67ee77c, 0xef69e579, 0xe575ef66, 0xe675e574, 0xdf7af65f, 0xf264f85f,
+	0xef6fe472, 0xfa59fe50, 0xfc52f755, 0xf851ff48, 0x05400143, 0x09380045,
+	0x01450745, 0xf945fa43, 0xf04dfe40, 0x023dfa43, 0xfd400239, 0xfd41fd42,
+	0x003e0933, 0xff42fe47, 0xfe4bff46, 0xf7480e3c, 0x1025002f, 0x12230b25,
+	0x0c290a29, 0x02300c29, 0x0d29003b, 0x03321328, 0x03421232, 0x13fa12fa,
+	0x0e001af4, 0x1ff021e7, 0x21ea25e4, 0x27e22ae2, 0x2fd62ddc, 0x31de29ef,
+	0x200945b9, 0x3fc142c0, 0x4db636d9, 0x34dd29f6, 0x240028ff, 0x1e0e1c1a,
+	0x17250c37, 0x0b4125df, 0x27dc28db, 0x26e22edf, 0x2ae228e8, 0x31e326f4,
+	0x28f626fd, 0x2efb1f14, 0x1d1e192c, 0x0c300b31, 0x1a2d1616, 0x17161b15,
+	0x21141a1c, 0x1e181b22, 0x122a1927, 0x12320c46, 0x15360e47, 0x0b531920,
+	0x15311536, 0xfb55fa51, 0xf64df951, 0xef50ee49, 0xfc4af653, 0xf747f743,
+	0xff3df842, 0xf242003b, 0x023b11f6, 0x20f32af7, 0x31fb3500, 0x4003440a,
+	0x421b2f39, 0xfb470018, 0xff24fe2a, 0xfe34f739, 0xfa3ffc41, 0xfc43f952,
+	0xfd51fd4c, 0xf948fa4e, 0xf448f244, 0xfd46fa4c, 0xfb42fb3e, 0x0039fc3d,
+	0xf73c0136, 0x023a11f6, 0x20f32af7, 0x31fb3500, 0x4003440a, 0x421b2f39,
+	0x14f10236, 0x034a14f1, 0x0236034a, 0xe47fe968, 0xfa35ff36, 0x07331d10,
+	0x19000e00, 0xf633fd3e, 0xe5631a10, 0xfc55e866, 0x05390639, 0xef490e39,
+	0x1428140a, 0x1d003600, 0x252a0c61, 0xe07fea75, 0xfe4afc55, 0xe8660539,
+	0xfa5df258, 0xfa2c0437, 0xf559f167, 0xeb741339, 0x143a0454, 0x0660013f,
+	0xfb55f36a, 0x053f064b, 0xfd5aff65, 0x0337fc4f, 0xfe4bf461, 0xf932013c,
+	0x0029003f, 0x003f003f, 0xf7530456, 0x0061f948, 0x0d29033e, 0x0722f758,
+	0xec7fdc7f, 0xef5bf25f, 0xe754e756, 0xf459ef5b, 0xe17ff24c, 0xee67f35a,
+	0xdb7f0b50, 0x054c0254, 0x054efa37, 0x043df253, 0xdb7ffb4f, 0xf568f55b,
+	0xe27f0041, 0xfe4f0048, 0xfc5cfa38, 0x0344f847, 0xf362fc56, 0xf458fb52,
+	0xfd48fc43, 0xf848f059, 0xf745ff3b, 0x05420439, 0xfc47fe47, 0x023aff4a,
+	0xfc2cff45, 0x003ef933, 0xfc2ffa2a, 0xfd29fa35, 0x084cf74e, 0xf5530934,
+	0x0043fb5a, 0x0143f148, 0xfb4bf850, 0xeb53eb40, 0xf31fe740, 0xe35e094b,
+	0x113ff84a, 0xfb23fe1b, 0x0d5b0341, 0xf945084d, 0xf642033e, 0xfd44ec51,
+	0x001e0107, 0xfd17eb4a, 0x1042e97c, 0x11252cee, 0x32deea7f, 0x0427002a,
+	0x07220b1d, 0x081f0625, 0x072a0328, 0x08210d2b, 0x0d24042f, 0x0337023a,
+	0x063c082c, 0x0b2c0e2a, 0x07300438, 0x04340d25, 0x0931133a, 0x0a300c2d,
+	0x00451421, 0x083f23ee, 0x21e71cfd, 0x180a1b00, 0x22f234d4, 0x27e81311,
+	0x1f19241d, 0x1821220f, 0x1e141649, 0x1422131f, 0x1b2c1310, 0x0f240f24,
+	0x151c1915, 0x1e141f0c, 0x1b10182a, 0x005d0e38, 0x0f391a26, 0xe87fe873,
+	0xea52f73e, 0x0035003b, 0xf255f359, 0xf35ef55c, 0xe37feb64, 0xf239f443,
+	0xf547f64d, 0xeb55f058, 0xe968f162, 0xdb7ff652, 0xf830f83d, 0xf842f946,
+	0xf24bf64f, 0xf753f45c, 0xee6cfc4f, 0xea45f04b, 0xfe3a013a, 0xf34ef753,
+	0xfc51f363, 0xf351fa26, 0xf33efa3a, 0xfe3bf049, 0xf64cf356, 0xf753f657,
+	0x0000ea7f, 0xe77fe778, 0xe57fed72, 0xe975e776, 0xe675e871, 0xe476e178,
+	0xdb7cf65e, 0xf166f663, 0xf36ace7f, 0xfb5c1139, 0xfb56f35e, 0xf45bfe4d,
+	0x0047ff49, 0x0440f951, 0x05400f39, 0x01430044, 0xf6430144, 0x004d0240,
+	0x0044fb4e, 0x0737053b, 0x02410e36, 0x0f2c053c, 0x0246fe4c, 0xee560c46,
+	0x0540f446, 0x0b370538, 0x00450241, 0xfa4a0536, 0x0736fa4c, 0xf552fe4d,
+	0xfe4d192a, 0x11f310f7, 0x11f41beb, 0x25e229d8, 0x2ad730d1, 0x27e02ed8,
+	0x34cd2ed7, 0x34d92bed, 0x200b3dc9, 0x38d23ece, 0x51bd2dec, 0x23fe1c0f,
+	0x22012701, 0x1e111426, 0x122d0f36, 0x004f24f0, 0x25f225ef, 0x2001220f,
+	0x1d0f1819, 0x22161f10, 0x23121f1c, 0x2129241c, 0x1b2f153e, 0x121f131a,
+	0x24181817, 0x1b10181e, 0x1f1d1629, 0x162a103c, 0x0f340e3c, 0x034ef07b,
+	0x15351638, 0x193d1521, 0x1332113d, 0xfd4ef84a, 0xf748f648, 0xee4bf447,
+	0xf53ffb46, 0xef4bf248, 0xf043f835, 0xf23bf734, 0xf54409fe, 0x1ef61ffc,
+	0x21ff2107, 0x1f0c2517, 0x1f261440, 0xf747f925, 0xf82cf531, 0xf638f43b,
+	0xf83ff743, 0xfa44f64f, 0xfd4ef84a, 0xf748f648, 0xee4bf447, 0xf53ffb46,
+	0xef4bf248, 0xf043f835, 0xf23bf734, 0xf54409fe, 0x1ef61ffc, 0x21ff2107,
+	0x1f0c2517, 0x1f261440
+};
+
+/*
+ * NOTE: The scaling lists are in zig-zag order, apply inverse scanning process
+ * to get the values in matrix order. In addition, the hardware requires bytes
+ * swapped within each subsequent 4 bytes. Both arrays below include both
+ * transformations.
+ */
+static const u32 zig_zag_4x4[] = {
+	3, 2, 7, 11, 6, 1, 0, 5, 10, 15, 14, 9, 4, 8, 13, 12
+};
+
+static const u32 zig_zag_8x8[] = {
+	3, 2, 11, 19, 10, 1, 0, 9, 18, 27, 35, 26, 17, 8, 7, 6,
+	15, 16, 25, 34, 43, 51, 42, 33, 24, 23, 14, 5, 4, 13, 22, 31,
+	32, 41, 50, 59, 58, 49, 40, 39, 30, 21, 12, 20, 29, 38, 47, 48,
+	57, 56, 55, 46, 37, 28, 36, 45, 54, 63, 62, 53, 44, 52, 61, 60
+};
+
+static void
+reorder_scaling_list(struct hantro_ctx *ctx)
+{
+	const struct hantro_h264_dec_ctrls *ctrls = &ctx->h264_dec.ctrls;
+	const struct v4l2_ctrl_h264_scaling_matrix *scaling = ctrls->scaling;
+	const size_t num_list_4x4 = ARRAY_SIZE(scaling->scaling_list_4x4);
+	const size_t list_len_4x4 = ARRAY_SIZE(scaling->scaling_list_4x4[0]);
+	const size_t num_list_8x8 = ARRAY_SIZE(scaling->scaling_list_8x8);
+	const size_t list_len_8x8 = ARRAY_SIZE(scaling->scaling_list_8x8[0]);
+	struct hantro_h264_dec_priv_tbl *tbl = ctx->h264_dec.priv.cpu;
+	u8 *dst = tbl->scaling_list;
+	const u8 *src;
+	int i, j;
+
+	BUILD_BUG_ON(ARRAY_SIZE(zig_zag_4x4) != list_len_4x4);
+	BUILD_BUG_ON(ARRAY_SIZE(zig_zag_8x8) != list_len_8x8);
+	BUILD_BUG_ON(ARRAY_SIZE(tbl->scaling_list) !=
+		     num_list_4x4 * list_len_4x4 +
+		     num_list_8x8 * list_len_8x8);
+
+	src = &scaling->scaling_list_4x4[0][0];
+	for (i = 0; i < num_list_4x4; ++i) {
+		for (j = 0; j < list_len_4x4; ++j)
+			dst[zig_zag_4x4[j]] = src[j];
+		src += list_len_4x4;
+		dst += list_len_4x4;
+	}
+
+	src = &scaling->scaling_list_8x8[0][0];
+	for (i = 0; i < num_list_8x8; ++i) {
+		for (j = 0; j < list_len_8x8; ++j)
+			dst[zig_zag_8x8[j]] = src[j];
+		src += list_len_8x8;
+		dst += list_len_8x8;
+	}
+}
+
+static void prepare_table(struct hantro_ctx *ctx)
+{
+	const struct hantro_h264_dec_ctrls *ctrls = &ctx->h264_dec.ctrls;
+	const struct v4l2_ctrl_h264_decode_params *dec_param = ctrls->decode;
+	struct hantro_h264_dec_priv_tbl *tbl = ctx->h264_dec.priv.cpu;
+	const struct v4l2_h264_dpb_entry *dpb = ctx->h264_dec.dpb;
+	int i;
+
+	for (i = 0; i < HANTRO_H264_DPB_SIZE; ++i) {
+		tbl->poc[i * 2] = dpb[i].top_field_order_cnt;
+		tbl->poc[i * 2 + 1] = dpb[i].bottom_field_order_cnt;
+	}
+
+	tbl->poc[32] = dec_param->top_field_order_cnt;
+	tbl->poc[33] = dec_param->bottom_field_order_cnt;
+
+	reorder_scaling_list(ctx);
+}
+
+struct hantro_h264_reflist_builder {
+	const struct v4l2_h264_dpb_entry *dpb;
+	s32 pocs[HANTRO_H264_DPB_SIZE];
+	u8 unordered_reflist[HANTRO_H264_DPB_SIZE];
+	s32 curpoc;
+	u8 num_valid;
+};
+
+static s32 get_poc(enum v4l2_field field, s32 top_field_order_cnt,
+		   s32 bottom_field_order_cnt)
+{
+	switch (field) {
+	case V4L2_FIELD_TOP:
+		return top_field_order_cnt;
+	case V4L2_FIELD_BOTTOM:
+		return bottom_field_order_cnt;
+	default:
+		break;
+	}
+
+	return min(top_field_order_cnt, bottom_field_order_cnt);
+}
+
+static void
+init_reflist_builder(struct hantro_ctx *ctx,
+		     struct hantro_h264_reflist_builder *b)
+{
+	const struct v4l2_ctrl_h264_decode_params *dec_param;
+	struct vb2_v4l2_buffer *buf = hantro_get_dst_buf(ctx);
+	const struct v4l2_h264_dpb_entry *dpb = ctx->h264_dec.dpb;
+	struct vb2_queue *cap_q = &ctx->fh.m2m_ctx->cap_q_ctx.q;
+	unsigned int i;
+
+	dec_param = ctx->h264_dec.ctrls.decode;
+
+	memset(b, 0, sizeof(*b));
+	b->dpb = dpb;
+	b->curpoc = get_poc(buf->field, dec_param->top_field_order_cnt,
+			    dec_param->bottom_field_order_cnt);
+
+	for (i = 0; i < ARRAY_SIZE(ctx->h264_dec.dpb); i++) {
+		int buf_idx;
+
+		if (!(dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE))
+			continue;
+
+		buf_idx = vb2_find_timestamp(cap_q, dpb[i].reference_ts, 0);
+		if (buf_idx < 0)
+			continue;
+
+		buf = to_vb2_v4l2_buffer(vb2_get_buffer(cap_q, buf_idx));
+		b->pocs[i] = get_poc(buf->field, dpb[i].top_field_order_cnt,
+				     dpb[i].bottom_field_order_cnt);
+		b->unordered_reflist[b->num_valid] = i;
+		b->num_valid++;
+	}
+
+	for (i = b->num_valid; i < ARRAY_SIZE(ctx->h264_dec.dpb); i++)
+		b->unordered_reflist[i] = i;
+}
+
+static int p_ref_list_cmp(const void *ptra, const void *ptrb, const void *data)
+{
+	const struct hantro_h264_reflist_builder *builder = data;
+	const struct v4l2_h264_dpb_entry *a, *b;
+	u8 idxa, idxb;
+
+	idxa = *((u8 *)ptra);
+	idxb = *((u8 *)ptrb);
+	a = &builder->dpb[idxa];
+	b = &builder->dpb[idxb];
+
+	if ((a->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM) !=
+	    (b->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM)) {
+		/* Short term pics firt. */
+		if (!(a->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM))
+			return -1;
+		else
+			return 1;
+	}
+
+	/*
+	 * Short term pics in descending pic num order, long term ones in
+	 * ascending order.
+	 */
+	if (!(a->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM))
+		return b->frame_num - a->frame_num;
+
+	return a->pic_num - b->pic_num;
+}
+
+static int b0_ref_list_cmp(const void *ptra, const void *ptrb, const void *data)
+{
+	const struct hantro_h264_reflist_builder *builder = data;
+	const struct v4l2_h264_dpb_entry *a, *b;
+	s32 poca, pocb;
+	u8 idxa, idxb;
+
+	idxa = *((u8 *)ptra);
+	idxb = *((u8 *)ptrb);
+	a = &builder->dpb[idxa];
+	b = &builder->dpb[idxb];
+
+	if ((a->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM) !=
+	    (b->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM)) {
+		/* Short term pics firt. */
+		if (!(a->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM))
+			return -1;
+		else
+			return 1;
+	}
+
+	/* Long term pics in ascending pic num order. */
+	if (a->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM)
+		return a->pic_num - b->pic_num;
+
+	poca = builder->pocs[idxa];
+	pocb = builder->pocs[idxb];
+
+	/*
+	 * Short term pics with POC < cur POC first in POC descending order
+	 * followed by short term pics with POC > cur POC in POC ascending
+	 * order.
+	 */
+	if ((poca < builder->curpoc) != (pocb < builder->curpoc))
+		return POC_CMP(poca, pocb);
+	else if (poca < builder->curpoc)
+		return POC_CMP(pocb, poca);
+
+	return POC_CMP(poca, pocb);
+}
+
+static int b1_ref_list_cmp(const void *ptra, const void *ptrb, const void *data)
+{
+	const struct hantro_h264_reflist_builder *builder = data;
+	const struct v4l2_h264_dpb_entry *a, *b;
+	s32 poca, pocb;
+	u8 idxa, idxb;
+
+	idxa = *((u8 *)ptra);
+	idxb = *((u8 *)ptrb);
+	a = &builder->dpb[idxa];
+	b = &builder->dpb[idxb];
+
+	if ((a->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM) !=
+	    (b->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM)) {
+		/* Short term pics firt. */
+		if (!(a->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM))
+			return -1;
+		else
+			return 1;
+	}
+
+	/* Long term pics in ascending pic num order. */
+	if (a->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM)
+		return a->pic_num - b->pic_num;
+
+	poca = builder->pocs[idxa];
+	pocb = builder->pocs[idxb];
+
+	/*
+	 * Short term pics with POC > cur POC first in POC ascending order
+	 * followed by short term pics with POC > cur POC in POC descending
+	 * order.
+	 */
+	if ((poca < builder->curpoc) != (pocb < builder->curpoc))
+		return POC_CMP(pocb, poca);
+	else if (poca < builder->curpoc)
+		return POC_CMP(pocb, poca);
+
+	return POC_CMP(poca, pocb);
+}
+
+static void
+build_p_ref_list(const struct hantro_h264_reflist_builder *builder,
+		 u8 *reflist)
+{
+	memcpy(reflist, builder->unordered_reflist,
+	       sizeof(builder->unordered_reflist));
+	sort_r(reflist, builder->num_valid, sizeof(*reflist),
+	       p_ref_list_cmp, NULL, builder);
+}
+
+static void
+build_b_ref_lists(const struct hantro_h264_reflist_builder *builder,
+		  u8 *b0_reflist, u8 *b1_reflist)
+{
+	memcpy(b0_reflist, builder->unordered_reflist,
+	       sizeof(builder->unordered_reflist));
+	sort_r(b0_reflist, builder->num_valid, sizeof(*b0_reflist),
+	       b0_ref_list_cmp, NULL, builder);
+
+	memcpy(b1_reflist, builder->unordered_reflist,
+	       sizeof(builder->unordered_reflist));
+	sort_r(b1_reflist, builder->num_valid, sizeof(*b1_reflist),
+	       b1_ref_list_cmp, NULL, builder);
+
+	if (builder->num_valid > 1 &&
+	    !memcmp(b1_reflist, b0_reflist, builder->num_valid))
+		swap(b1_reflist[0], b1_reflist[1]);
+}
+
+static bool dpb_entry_match(const struct v4l2_h264_dpb_entry *a,
+			    const struct v4l2_h264_dpb_entry *b)
+{
+	return a->top_field_order_cnt == b->top_field_order_cnt &&
+	       a->bottom_field_order_cnt == b->bottom_field_order_cnt;
+}
+
+static void update_dpb(struct hantro_ctx *ctx)
+{
+	const struct v4l2_ctrl_h264_decode_params *dec_param;
+	DECLARE_BITMAP(new, ARRAY_SIZE(dec_param->dpb)) = { 0, };
+	DECLARE_BITMAP(used, ARRAY_SIZE(dec_param->dpb)) = { 0, };
+	unsigned int i, j;
+
+	dec_param = ctx->h264_dec.ctrls.decode;
+
+	/* Disable all entries by default. */
+	for (i = 0; i < ARRAY_SIZE(ctx->h264_dec.dpb); i++)
+		ctx->h264_dec.dpb[i].flags &= ~V4L2_H264_DPB_ENTRY_FLAG_ACTIVE;
+
+	/* Try to match new DPB entries with existing ones by their POCs. */
+	for (i = 0; i < ARRAY_SIZE(dec_param->dpb); i++) {
+		const struct v4l2_h264_dpb_entry *ndpb = &dec_param->dpb[i];
+
+		if (!(ndpb->flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE))
+			continue;
+
+		/*
+		 * To cut off some comparisons, iterate only on target DPB
+		 * entries which are not used yet.
+		 */
+		for_each_clear_bit(j, used, ARRAY_SIZE(ctx->h264_dec.dpb)) {
+			struct v4l2_h264_dpb_entry *cdpb;
+
+			cdpb = &ctx->h264_dec.dpb[j];
+			if (cdpb->flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE ||
+			    !dpb_entry_match(cdpb, ndpb))
+				continue;
+
+			*cdpb = *ndpb;
+			set_bit(j, used);
+			break;
+		}
+
+		if (j == ARRAY_SIZE(ctx->h264_dec.dpb))
+			set_bit(i, new);
+	}
+
+	/* For entries that could not be matched, use remaining free slots. */
+	for_each_set_bit(i, new, ARRAY_SIZE(dec_param->dpb)) {
+		const struct v4l2_h264_dpb_entry *ndpb = &dec_param->dpb[i];
+		struct v4l2_h264_dpb_entry *cdpb;
+
+		/*
+		 * Both arrays are of the same sizes, so there is no way
+		 * we can end up with no space in target array, unless
+		 * something is buggy.
+		 */
+		j = find_first_zero_bit(used, ARRAY_SIZE(ctx->h264_dec.dpb));
+		if (WARN_ON(j >= ARRAY_SIZE(ctx->h264_dec.dpb)))
+			return;
+
+		cdpb = &ctx->h264_dec.dpb[j];
+		*cdpb = *ndpb;
+		set_bit(j, used);
+	}
+}
+
+struct vb2_buffer *hantro_h264_get_ref_buf(struct hantro_ctx *ctx,
+					   unsigned int dpb_idx)
+{
+	struct vb2_queue *cap_q = &ctx->fh.m2m_ctx->cap_q_ctx.q;
+	struct v4l2_h264_dpb_entry *dpb = ctx->h264_dec.dpb;
+	struct vb2_buffer *buf;
+	int buf_idx = -1;
+
+	if (dpb[dpb_idx].flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE)
+		buf_idx = vb2_find_timestamp(cap_q,
+					     dpb[dpb_idx].reference_ts, 0);
+
+	if (buf_idx >= 0) {
+		buf = vb2_get_buffer(cap_q, buf_idx);
+	} else {
+		struct vb2_v4l2_buffer *dst_buf;
+
+		/*
+		 * If a DPB entry is unused or invalid, address of current
+		 * destination buffer is returned.
+		 */
+		dst_buf = hantro_get_dst_buf(ctx);
+		buf = &dst_buf->vb2_buf;
+	}
+
+	return buf;
+}
+
+int hantro_h264_dec_prepare_run(struct hantro_ctx *ctx)
+{
+	struct hantro_h264_dec_hw_ctx *h264_ctx = &ctx->h264_dec;
+	struct hantro_h264_dec_ctrls *ctrls = &h264_ctx->ctrls;
+	struct hantro_h264_reflist_builder reflist_builder;
+
+	hantro_prepare_run(ctx);
+
+	ctrls->scaling =
+		hantro_get_ctrl(ctx, V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX);
+	if (WARN_ON(!ctrls->scaling))
+		return -EINVAL;
+
+	ctrls->decode =
+		hantro_get_ctrl(ctx, V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS);
+	if (WARN_ON(!ctrls->decode))
+		return -EINVAL;
+
+	ctrls->slices =
+		hantro_get_ctrl(ctx, V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS);
+	if (WARN_ON(!ctrls->slices))
+		return -EINVAL;
+
+	ctrls->sps =
+		hantro_get_ctrl(ctx, V4L2_CID_MPEG_VIDEO_H264_SPS);
+	if (WARN_ON(!ctrls->sps))
+		return -EINVAL;
+
+	ctrls->pps =
+		hantro_get_ctrl(ctx, V4L2_CID_MPEG_VIDEO_H264_PPS);
+	if (WARN_ON(!ctrls->pps))
+		return -EINVAL;
+
+	/* Update the DPB with new refs. */
+	update_dpb(ctx);
+
+	/* Prepare data in memory. */
+	prepare_table(ctx);
+
+	/* Build the P/B{0,1} ref lists. */
+	init_reflist_builder(ctx, &reflist_builder);
+	build_p_ref_list(&reflist_builder, h264_ctx->reflists.p);
+	build_b_ref_lists(&reflist_builder, h264_ctx->reflists.b0,
+			  h264_ctx->reflists.b1);
+	return 0;
+}
+
+void hantro_h264_dec_exit(struct hantro_ctx *ctx)
+{
+	struct hantro_dev *vpu = ctx->dev;
+	struct hantro_h264_dec_hw_ctx *h264_dec = &ctx->h264_dec;
+	struct hantro_aux_buf *priv = &h264_dec->priv;
+
+	dma_free_coherent(vpu->dev, priv->size, priv->cpu, priv->dma);
+}
+
+int hantro_h264_dec_init(struct hantro_ctx *ctx)
+{
+	struct hantro_dev *vpu = ctx->dev;
+	struct hantro_h264_dec_hw_ctx *h264_dec = &ctx->h264_dec;
+	struct hantro_aux_buf *priv = &h264_dec->priv;
+	struct hantro_h264_dec_priv_tbl *tbl;
+	struct v4l2_pix_format_mplane pix_mp;
+
+	priv->cpu = dma_alloc_coherent(vpu->dev, sizeof(*tbl), &priv->dma,
+				       GFP_KERNEL);
+	if (!priv->cpu)
+		return -ENOMEM;
+
+	priv->size = sizeof(*tbl);
+	tbl = priv->cpu;
+	memcpy(tbl->cabac_table, h264_cabac_table, sizeof(tbl->cabac_table));
+
+	v4l2_fill_pixfmt_mp(&pix_mp, ctx->dst_fmt.pixelformat,
+			    ctx->dst_fmt.width, ctx->dst_fmt.height);
+	h264_dec->pic_size = pix_mp.plane_fmt[0].sizeimage;
+
+	return 0;
+}
diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
index 2b8029674a75..75f1ce45a21f 100644
--- a/drivers/staging/media/hantro/hantro_hw.h
+++ b/drivers/staging/media/hantro/hantro_hw.h
@@ -11,6 +11,7 @@
 
 #include <linux/interrupt.h>
 #include <linux/v4l2-controls.h>
+#include <media/h264-ctrls.h>
 #include <media/mpeg2-ctrls.h>
 #include <media/vp8-ctrls.h>
 #include <media/videobuf2-core.h>
@@ -42,6 +43,54 @@ struct hantro_jpeg_enc_hw_ctx {
 	struct hantro_aux_buf bounce_buffer;
 };
 
+/* Max. number of entries in the DPB (HW limitation). */
+#define HANTRO_H264_DPB_SIZE		16
+
+/**
+ * struct hantro_h264_dec_ctrls
+ * @decode:	Decode params
+ * @scaling:	Scaling info
+ * @slice:	Slice params
+ * @sps:	SPS info
+ * @pps:	PPS info
+ */
+struct hantro_h264_dec_ctrls {
+	const struct v4l2_ctrl_h264_decode_params *decode;
+	const struct v4l2_ctrl_h264_scaling_matrix *scaling;
+	const struct v4l2_ctrl_h264_slice_params *slices;
+	const struct v4l2_ctrl_h264_sps *sps;
+	const struct v4l2_ctrl_h264_pps *pps;
+};
+
+/**
+ * struct hantro_h264_dec_reflists
+ * @p:		P reflist
+ * @b0:		B0 reflist
+ * @b1:		B1 reflist
+ */
+struct hantro_h264_dec_reflists {
+	u8 p[HANTRO_H264_DPB_SIZE];
+	u8 b0[HANTRO_H264_DPB_SIZE];
+	u8 b1[HANTRO_H264_DPB_SIZE];
+};
+
+/**
+ * struct hantro_h264_dec_hw_ctx
+ * @priv:	Private auxiliary buffer for hardware.
+ * @dpb:	DPB
+ * @reflists:	P/B0/B1 reflists
+ * @ctrls:	V4L2 controls attached to a run
+ * @pic_size:	Size in bytes of decoded picture, this is needed
+ *		to pass the location of motion vectors.
+ */
+struct hantro_h264_dec_hw_ctx {
+	struct hantro_aux_buf priv;
+	struct v4l2_h264_dpb_entry dpb[HANTRO_H264_DPB_SIZE];
+	struct hantro_h264_dec_reflists reflists;
+	struct hantro_h264_dec_ctrls ctrls;
+	size_t pic_size;
+};
+
 /**
  * struct hantro_mpeg2_dec_hw_ctx
  * @qtable:		Quantization table
@@ -109,6 +158,12 @@ void rk3399_vpu_jpeg_enc_run(struct hantro_ctx *ctx);
 int hantro_jpeg_enc_init(struct hantro_ctx *ctx);
 void hantro_jpeg_enc_exit(struct hantro_ctx *ctx);
 
+struct vb2_buffer *hantro_h264_get_ref_buf(struct hantro_ctx *ctx,
+					   unsigned int dpb_idx);
+int hantro_h264_dec_prepare_run(struct hantro_ctx *ctx);
+int hantro_h264_dec_init(struct hantro_ctx *ctx);
+void hantro_h264_dec_exit(struct hantro_ctx *ctx);
+
 void hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx);
 void rk3399_vpu_mpeg2_dec_run(struct hantro_ctx *ctx);
 void hantro_mpeg2_dec_copy_qtable(u8 *qtable,
diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
index cd4eaa256e8b..3dae52abb96c 100644
--- a/drivers/staging/media/hantro/hantro_v4l2.c
+++ b/drivers/staging/media/hantro/hantro_v4l2.c
@@ -239,6 +239,15 @@ static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f,
 		/* Fill remaining fields */
 		v4l2_fill_pixfmt_mp(pix_mp, fmt->fourcc, pix_mp->width,
 				    pix_mp->height);
+		/*
+		 * The H264 decoder needs extra space on the output buffers
+		 * to store motion vectors. This is needed for reference
+		 * frames.
+		 */
+		if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_H264_SLICE)
+			pix_mp->plane_fmt[0].sizeimage +=
+				128 * DIV_ROUND_UP(pix_mp->width, 16) *
+				      DIV_ROUND_UP(pix_mp->height, 16);
 	} else if (!pix_mp->plane_fmt[0].sizeimage) {
 		/*
 		 * For coded formats the application can specify
@@ -345,6 +354,7 @@ hantro_update_requires_request(struct hantro_ctx *ctx, u32 fourcc)
 		break;
 	case V4L2_PIX_FMT_MPEG2_SLICE:
 	case V4L2_PIX_FMT_VP8_FRAME:
+	case V4L2_PIX_FMT_H264_SLICE:
 		ctx->fh.m2m_ctx->out_q_ctx.q.requires_requests = true;
 		break;
 	default:
-- 
2.22.0

