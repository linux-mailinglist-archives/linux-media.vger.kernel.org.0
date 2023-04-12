Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFC206DF482
	for <lists+linux-media@lfdr.de>; Wed, 12 Apr 2023 13:57:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230363AbjDLL5U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Apr 2023 07:57:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231576AbjDLL5P (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Apr 2023 07:57:15 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7209C7D82;
        Wed, 12 Apr 2023 04:57:10 -0700 (PDT)
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:c2e:89bd:4b8e:9e98])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id EF12F6604EB1;
        Wed, 12 Apr 2023 12:57:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1681300629;
        bh=JEJkHxByeNu9u3JGT5/0HDII4mPFpEXpxJ0hJDBZfTw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mS7OUr8DHYyFf6vhjEO5viwnx8TSKm3eeaaA0tg0iCDT7sGklwaYsuxHTWwRK0IvX
         5iAN4sktECaPaP172xIbziceqltRTzG9ne+JH4Gyp27gpzlSBEi4oXd/GdC/Kmu7bi
         ht4jMU4ZMMA9t/nLjgEVkqPxcykUzkY2PpC653PZcqML1BTERilZeBqvf+FkmYI/7F
         uEh7xW8tYW4VahJ2R5G7b6gxQkuic1pE9Ul2Oz7QTLJKeJ/OTixqEANygUPnx4argr
         uGrmTC0AxbLX5wQgRw8RUaBEwwjFgygNTlMzBJozyBDilaPPiPPW4j9Jzzx7W9xp65
         CWv3vAliwGXPQ==
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
        mchehab@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, heiko@sntech.de,
        hverkuil-cisco@xs4all.nl, nicolas.dufresne@collabora.com
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v6 11/13] media: verisilicon: Add film grain feature to AV1 driver
Date:   Wed, 12 Apr 2023 13:56:50 +0200
Message-Id: <20230412115652.403949-12-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230412115652.403949-1-benjamin.gaignard@collabora.com>
References: <20230412115652.403949-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Film grain feature add "old style" grain noise on decoded streams.
Grain noise is applied after decoding by the postprocessor.
The level of grain is based on gaussian sequence.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 drivers/media/platform/verisilicon/Makefile   |   1 +
 .../media/platform/verisilicon/hantro_hw.h    |   3 +
 .../verisilicon/rockchip_av1_filmgrain.c      | 401 ++++++++++++++++++
 .../verisilicon/rockchip_av1_filmgrain.h      |  36 ++
 .../verisilicon/rockchip_vpu981_hw_av1_dec.c  | 210 +++++++++
 5 files changed, 651 insertions(+)
 create mode 100644 drivers/media/platform/verisilicon/rockchip_av1_filmgrain.c
 create mode 100644 drivers/media/platform/verisilicon/rockchip_av1_filmgrain.h

diff --git a/drivers/media/platform/verisilicon/Makefile b/drivers/media/platform/verisilicon/Makefile
index c9a9806ab8c5..6ad2ef885920 100644
--- a/drivers/media/platform/verisilicon/Makefile
+++ b/drivers/media/platform/verisilicon/Makefile
@@ -19,6 +19,7 @@ hantro-vpu-y += \
 		rockchip_vpu2_hw_mpeg2_dec.o \
 		rockchip_vpu2_hw_vp8_dec.o \
 		rockchip_vpu981_hw_av1_dec.o \
+		rockchip_av1_filmgrain.o \
 		rockchip_av1_entropymode.o \
 		hantro_jpeg.o \
 		hantro_h264.o \
diff --git a/drivers/media/platform/verisilicon/hantro_hw.h b/drivers/media/platform/verisilicon/hantro_hw.h
index 25456fb960c8..e3d303cea7f6 100644
--- a/drivers/media/platform/verisilicon/hantro_hw.h
+++ b/drivers/media/platform/verisilicon/hantro_hw.h
@@ -16,6 +16,7 @@
 #include <media/videobuf2-core.h>
 
 #include "rockchip_av1_entropymode.h"
+#include "rockchip_av1_filmgrain.h"
 
 #define DEC_8190_ALIGN_MASK	0x07U
 
@@ -288,6 +289,7 @@ struct hantro_av1_frame_ref {
  * @global_model:	global model buffer
  * @tile_info:		tile info buffer
  * @segment:		segmentation info buffer
+ * @film_grain:		film grain buffer
  * @prob_tbl:		probability table
  * @prob_tbl_out:	probability table output
  * @tile_buf:		tile buffer
@@ -312,6 +314,7 @@ struct hantro_av1_dec_hw_ctx {
 	struct hantro_aux_buf global_model;
 	struct hantro_aux_buf tile_info;
 	struct hantro_aux_buf segment;
+	struct hantro_aux_buf film_grain;
 	struct hantro_aux_buf prob_tbl;
 	struct hantro_aux_buf prob_tbl_out;
 	struct hantro_aux_buf tile_buf;
diff --git a/drivers/media/platform/verisilicon/rockchip_av1_filmgrain.c b/drivers/media/platform/verisilicon/rockchip_av1_filmgrain.c
new file mode 100644
index 000000000000..f2ae84f0b436
--- /dev/null
+++ b/drivers/media/platform/verisilicon/rockchip_av1_filmgrain.c
@@ -0,0 +1,401 @@
+// SPDX-License-Identifier: GPL-2.0-only or Apache-2.0
+
+#include "rockchip_av1_filmgrain.h"
+
+static const s32 gaussian_sequence[2048] = {
+	56, 568, -180, 172, 124, -84, 172, -64, -900, 24, 820,
+	224, 1248, 996, 272, -8, -916, -388, -732, -104, -188, 800,
+	112, -652, -320, -376, 140, -252, 492, -168, 44, -788, 588,
+	-584, 500, -228, 12, 680, 272, -476, 972, -100, 652, 368,
+	432, -196, -720, -192, 1000, -332, 652, -136, -552, -604, -4,
+	192, -220, -136, 1000, -52, 372, -96, -624, 124, -24, 396,
+	540, -12, -104, 640, 464, 244, -208, -84, 368, -528, -740,
+	248, -968, -848, 608, 376, -60, -292, -40, -156, 252, -292,
+	248, 224, -280, 400, -244, 244, -60, 76, -80, 212, 532,
+	340, 128, -36, 824, -352, -60, -264, -96, -612, 416, -704,
+	220, -204, 640, -160, 1220, -408, 900, 336, 20, -336, -96,
+	-792, 304, 48, -28, -1232, -1172, -448, 104, -292, -520, 244,
+	60, -948, 0, -708, 268, 108, 356, -548, 488, -344, -136,
+	488, -196, -224, 656, -236, -1128, 60, 4, 140, 276, -676,
+	-376, 168, -108, 464, 8, 564, 64, 240, 308, -300, -400,
+	-456, -136, 56, 120, -408, -116, 436, 504, -232, 328, 844,
+	-164, -84, 784, -168, 232, -224, 348, -376, 128, 568, 96,
+	-1244, -288, 276, 848, 832, -360, 656, 464, -384, -332, -356,
+	728, -388, 160, -192, 468, 296, 224, 140, -776, -100, 280,
+	4, 196, 44, -36, -648, 932, 16, 1428, 28, 528, 808,
+	772, 20, 268, 88, -332, -284, 124, -384, -448, 208, -228,
+	-1044, -328, 660, 380, -148, -300, 588, 240, 540, 28, 136,
+	-88, -436, 256, 296, -1000, 1400, 0, -48, 1056, -136, 264,
+	-528, -1108, 632, -484, -592, -344, 796, 124, -668, -768, 388,
+	1296, -232, -188, -200, -288, -4, 308, 100, -168, 256, -500,
+	204, -508, 648, -136, 372, -272, -120, -1004, -552, -548, -384,
+	548, -296, 428, -108, -8, -912, -324, -224, -88, -112, -220,
+	-100, 996, -796, 548, 360, -216, 180, 428, -200, -212, 148,
+	96, 148, 284, 216, -412, -320, 120, -300, -384, -604, -572,
+	-332, -8, -180, -176, 696, 116, -88, 628, 76, 44, -516,
+	240, -208, -40, 100, -592, 344, -308, -452, -228, 20, 916,
+	-1752, -136, -340, -804, 140, 40, 512, 340, 248, 184, -492,
+	896, -156, 932, -628, 328, -688, -448, -616, -752, -100, 560,
+	-1020, 180, -800, -64, 76, 576, 1068, 396, 660, 552, -108,
+	-28, 320, -628, 312, -92, -92, -472, 268, 16, 560, 516,
+	-672, -52, 492, -100, 260, 384, 284, 292, 304, -148, 88,
+	-152, 1012, 1064, -228, 164, -376, -684, 592, -392, 156, 196,
+	-524, -64, -884, 160, -176, 636, 648, 404, -396, -436, 864,
+	424, -728, 988, -604, 904, -592, 296, -224, 536, -176, -920,
+	436, -48, 1176, -884, 416, -776, -824, -884, 524, -548, -564,
+	-68, -164, -96, 692, 364, -692, -1012, -68, 260, -480, 876,
+	-1116, 452, -332, -352, 892, -1088, 1220, -676, 12, -292, 244,
+	496, 372, -32, 280, 200, 112, -440, -96, 24, -644, -184,
+	56, -432, 224, -980, 272, -260, 144, -436, 420, 356, 364,
+	-528, 76, 172, -744, -368, 404, -752, -416, 684, -688, 72,
+	540, 416, 92, 444, 480, -72, -1416, 164, -1172, -68, 24,
+	424, 264, 1040, 128, -912, -524, -356, 64, 876, -12, 4,
+	-88, 532, 272, -524, 320, 276, -508, 940, 24, -400, -120,
+	756, 60, 236, -412, 100, 376, -484, 400, -100, -740, -108,
+	-260, 328, -268, 224, -200, -416, 184, -604, -564, -20, 296,
+	60, 892, -888, 60, 164, 68, -760, 216, -296, 904, -336,
+	-28, 404, -356, -568, -208, -1480, -512, 296, 328, -360, -164,
+	-1560, -776, 1156, -428, 164, -504, -112, 120, -216, -148, -264,
+	308, 32, 64, -72, 72, 116, 176, -64, -272, 460, -536,
+	-784, -280, 348, 108, -752, -132, 524, -540, -776, 116, -296,
+	-1196, -288, -560, 1040, -472, 116, -848, -1116, 116, 636, 696,
+	284, -176, 1016, 204, -864, -648, -248, 356, 972, -584, -204,
+	264, 880, 528, -24, -184, 116, 448, -144, 828, 524, 212,
+	-212, 52, 12, 200, 268, -488, -404, -880, 824, -672, -40,
+	908, -248, 500, 716, -576, 492, -576, 16, 720, -108, 384,
+	124, 344, 280, 576, -500, 252, 104, -308, 196, -188, -8,
+	1268, 296, 1032, -1196, 436, 316, 372, -432, -200, -660, 704,
+	-224, 596, -132, 268, 32, -452, 884, 104, -1008, 424, -1348,
+	-280, 4, -1168, 368, 476, 696, 300, -8, 24, 180, -592,
+	-196, 388, 304, 500, 724, -160, 244, -84, 272, -256, -420,
+	320, 208, -144, -156, 156, 364, 452, 28, 540, 316, 220,
+	-644, -248, 464, 72, 360, 32, -388, 496, -680, -48, 208,
+	-116, -408, 60, -604, -392, 548, -840, 784, -460, 656, -544,
+	-388, -264, 908, -800, -628, -612, -568, 572, -220, 164, 288,
+	-16, -308, 308, -112, -636, -760, 280, -668, 432, 364, 240,
+	-196, 604, 340, 384, 196, 592, -44, -500, 432, -580, -132,
+	636, -76, 392, 4, -412, 540, 508, 328, -356, -36, 16,
+	-220, -64, -248, -60, 24, -192, 368, 1040, 92, -24, -1044,
+	-32, 40, 104, 148, 192, -136, -520, 56, -816, -224, 732,
+	392, 356, 212, -80, -424, -1008, -324, 588, -1496, 576, 460,
+	-816, -848, 56, -580, -92, -1372, -112, -496, 200, 364, 52,
+	-140, 48, -48, -60, 84, 72, 40, 132, -356, -268, -104,
+	-284, -404, 732, -520, 164, -304, -540, 120, 328, -76, -460,
+	756, 388, 588, 236, -436, -72, -176, -404, -316, -148, 716,
+	-604, 404, -72, -88, -888, -68, 944, 88, -220, -344, 960,
+	472, 460, -232, 704, 120, 832, -228, 692, -508, 132, -476,
+	844, -748, -364, -44, 1116, -1104, -1056, 76, 428, 552, -692,
+	60, 356, 96, -384, -188, -612, -576, 736, 508, 892, 352,
+	-1132, 504, -24, -352, 324, 332, -600, -312, 292, 508, -144,
+	-8, 484, 48, 284, -260, -240, 256, -100, -292, -204, -44,
+	472, -204, 908, -188, -1000, -256, 92, 1164, -392, 564, 356,
+	652, -28, -884, 256, 484, -192, 760, -176, 376, -524, -452,
+	-436, 860, -736, 212, 124, 504, -476, 468, 76, -472, 552,
+	-692, -944, -620, 740, -240, 400, 132, 20, 192, -196, 264,
+	-668, -1012, -60, 296, -316, -828, 76, -156, 284, -768, -448,
+	-832, 148, 248, 652, 616, 1236, 288, -328, -400, -124, 588,
+	220, 520, -696, 1032, 768, -740, -92, -272, 296, 448, -464,
+	412, -200, 392, 440, -200, 264, -152, -260, 320, 1032, 216,
+	320, -8, -64, 156, -1016, 1084, 1172, 536, 484, -432, 132,
+	372, -52, -256, 84, 116, -352, 48, 116, 304, -384, 412,
+	924, -300, 528, 628, 180, 648, 44, -980, -220, 1320, 48,
+	332, 748, 524, -268, -720, 540, -276, 564, -344, -208, -196,
+	436, 896, 88, -392, 132, 80, -964, -288, 568, 56, -48,
+	-456, 888, 8, 552, -156, -292, 948, 288, 128, -716, -292,
+	1192, -152, 876, 352, -600, -260, -812, -468, -28, -120, -32,
+	-44, 1284, 496, 192, 464, 312, -76, -516, -380, -456, -1012,
+	-48, 308, -156, 36, 492, -156, -808, 188, 1652, 68, -120,
+	-116, 316, 160, -140, 352, 808, -416, 592, 316, -480, 56,
+	528, -204, -568, 372, -232, 752, -344, 744, -4, 324, -416,
+	-600, 768, 268, -248, -88, -132, -420, -432, 80, -288, 404,
+	-316, -1216, -588, 520, -108, 92, -320, 368, -480, -216, -92,
+	1688, -300, 180, 1020, -176, 820, -68, -228, -260, 436, -904,
+	20, 40, -508, 440, -736, 312, 332, 204, 760, -372, 728,
+	96, -20, -632, -520, -560, 336, 1076, -64, -532, 776, 584,
+	192, 396, -728, -520, 276, -188, 80, -52, -612, -252, -48,
+	648, 212, -688, 228, -52, -260, 428, -412, -272, -404, 180,
+	816, -796, 48, 152, 484, -88, -216, 988, 696, 188, -528,
+	648, -116, -180, 316, 476, 12, -564, 96, 476, -252, -364,
+	-376, -392, 556, -256, -576, 260, -352, 120, -16, -136, -260,
+	-492, 72, 556, 660, 580, 616, 772, 436, 424, -32, -324,
+	-1268, 416, -324, -80, 920, 160, 228, 724, 32, -516, 64,
+	384, 68, -128, 136, 240, 248, -204, -68, 252, -932, -120,
+	-480, -628, -84, 192, 852, -404, -288, -132, 204, 100, 168,
+	-68, -196, -868, 460, 1080, 380, -80, 244, 0, 484, -888,
+	64, 184, 352, 600, 460, 164, 604, -196, 320, -64, 588,
+	-184, 228, 12, 372, 48, -848, -344, 224, 208, -200, 484,
+	128, -20, 272, -468, -840, 384, 256, -720, -520, -464, -580,
+	112, -120, 644, -356, -208, -608, -528, 704, 560, -424, 392,
+	828, 40, 84, 200, -152, 0, -144, 584, 280, -120, 80,
+	-556, -972, -196, -472, 724, 80, 168, -32, 88, 160, -688,
+	0, 160, 356, 372, -776, 740, -128, 676, -248, -480, 4,
+	-364, 96, 544, 232, -1032, 956, 236, 356, 20, -40, 300,
+	24, -676, -596, 132, 1120, -104, 532, -1096, 568, 648, 444,
+	508, 380, 188, -376, -604, 1488, 424, 24, 756, -220, -192,
+	716, 120, 920, 688, 168, 44, -460, 568, 284, 1144, 1160,
+	600, 424, 888, 656, -356, -320, 220, 316, -176, -724, -188,
+	-816, -628, -348, -228, -380, 1012, -452, -660, 736, 928, 404,
+	-696, -72, -268, -892, 128, 184, -344, -780, 360, 336, 400,
+	344, 428, 548, -112, 136, -228, -216, -820, -516, 340, 92,
+	-136, 116, -300, 376, -244, 100, -316, -520, -284, -12, 824,
+	164, -548, -180, -128, 116, -924, -828, 268, -368, -580, 620,
+	192, 160, 0, -1676, 1068, 424, -56, -360, 468, -156, 720,
+	288, -528, 556, -364, 548, -148, 504, 316, 152, -648, -620,
+	-684, -24, -376, -384, -108, -920, -1032, 768, 180, -264, -508,
+	-1268, -260, -60, 300, -240, 988, 724, -376, -576, -212, -736,
+	556, 192, 1092, -620, -880, 376, -56, -4, -216, -32, 836,
+	268, 396, 1332, 864, -600, 100, 56, -412, -92, 356, 180,
+	884, -468, -436, 292, -388, -804, -704, -840, 368, -348, 140,
+	-724, 1536, 940, 372, 112, -372, 436, -480, 1136, 296, -32,
+	-228, 132, -48, -220, 868, -1016, -60, -1044, -464, 328, 916,
+	244, 12, -736, -296, 360, 468, -376, -108, -92, 788, 368,
+	-56, 544, 400, -672, -420, 728, 16, 320, 44, -284, -380,
+	-796, 488, 132, 204, -596, -372, 88, -152, -908, -636, -572,
+	-624, -116, -692, -200, -56, 276, -88, 484, -324, 948, 864,
+	1000, -456, -184, -276, 292, -296, 156, 676, 320, 160, 908,
+	-84, -1236, -288, -116, 260, -372, -644, 732, -756, -96, 84,
+	344, -520, 348, -688, 240, -84, 216, -1044, -136, -676, -396,
+	-1500, 960, -40, 176, 168, 1516, 420, -504, -344, -364, -360,
+	1216, -940, -380, -212, 252, -660, -708, 484, -444, -152, 928,
+	-120, 1112, 476, -260, 560, -148, -344, 108, -196, 228, -288,
+	504, 560, -328, -88, 288, -1008, 460, -228, 468, -836, -196,
+	76, 388, 232, 412, -1168, -716, -644, 756, -172, -356, -504,
+	116, 432, 528, 48, 476, -168, -608, 448, 160, -532, -272,
+	28, -676, -12, 828, 980, 456, 520, 104, -104, 256, -344,
+	-4, -28, -368, -52, -524, -572, -556, -200, 768, 1124, -208,
+	-512, 176, 232, 248, -148, -888, 604, -600, -304, 804, -156,
+	-212, 488, -192, -804, -256, 368, -360, -916, -328, 228, -240,
+	-448, -472, 856, -556, -364, 572, -12, -156, -368, -340, 432,
+	252, -752, -152, 288, 268, -580, -848, -592, 108, -76, 244,
+	312, -716, 592, -80, 436, 360, 4, -248, 160, 516, 584,
+	732, 44, -468, -280, -292, -156, -588, 28, 308, 912, 24,
+	124, 156, 180, -252, 944, -924, -772, -520, -428, -624, 300,
+	-212, -1144, 32, -724, 800, -1128, -212, -1288, -848, 180, -416,
+	440, 192, -576, -792, -76, -1080, 80, -532, -352, -132, 380,
+	-820, 148, 1112, 128, 164, 456, 700, -924, 144, -668, -384,
+	648, -832, 508, 552, -52, -100, -656, 208, -568, 748, -88,
+	680, 232, 300, 192, -408, -1012, -152, -252, -268, 272, -876,
+	-664, -648, -332, -136, 16, 12, 1152, -28, 332, -536, 320,
+	-672, -460, -316, 532, -260, 228, -40, 1052, -816, 180, 88,
+	-496, -556, -672, -368, 428, 92, 356, 404, -408, 252, 196,
+	-176, -556, 792, 268, 32, 372, 40, 96, -332, 328, 120,
+	372, -900, -40, 472, -264, -592, 952, 128, 656, 112, 664,
+	-232, 420, 4, -344, -464, 556, 244, -416, -32, 252, 0,
+	-412, 188, -696, 508, -476, 324, -1096, 656, -312, 560, 264,
+	-136, 304, 160, -64, -580, 248, 336, -720, 560, -348, -288,
+	-276, -196, -500, 852, -544, -236, -1128, -992, -776, 116, 56,
+	52, 860, 884, 212, -12, 168, 1020, 512, -552, 924, -148,
+	716, 188, 164, -340, -520, -184, 880, -152, -680, -208, -1156,
+	-300, -528, -472, 364, 100, -744, -1056, -32, 540, 280, 144,
+	-676, -32, -232, -280, -224, 96, 568, -76, 172, 148, 148,
+	104, 32, -296, -32, 788, -80, 32, -16, 280, 288, 944,
+	428, -484
+};
+
+static inline s32 clamp(s32 value, s32 low, s32 high)
+{
+	return value < low ? low : (value > high ? high : value);
+}
+
+static inline s32 round_power_of_two(const s32 val, s32 n)
+{
+	const s32 a = (s32)1 << (n - 1);
+
+	return (val + a) >> n;
+}
+
+static void rockchip_av1_init_random_generator(u8 luma_num, u16 seed,
+					       u16 *random_register)
+{
+	u16 random_reg = seed;
+
+	random_reg ^= ((luma_num * 37 + 178) & 255) << 8;
+	random_reg ^= ((luma_num * 173 + 105) & 255);
+	*random_register = random_reg;
+}
+
+static inline void rockchip_av1_update_random_register(u16 *random_register)
+{
+	u16 bit;
+	u16 random_reg = *random_register;
+
+	bit = ((random_reg >> 0) ^ (random_reg >> 1) ^ (random_reg >> 3) ^
+	       (random_reg >> 12)) & 1;
+	*random_register = (random_reg >> 1) | (bit << 15);
+}
+
+static inline s32 rockchip_av1_get_random_number(u16 random_register)
+{
+	return (random_register >> 5) & ((1 << 11) - 1);
+}
+
+void rockchip_av1_generate_luma_grain_block(s32 (*luma_grain_block)[73][82],
+					    s32 bitdepth,
+					    u8 num_y_points,
+					    s32 grain_scale_shift,
+					    s32 ar_coeff_lag,
+					    s32 (*ar_coeffs_y)[24],
+					    s32 ar_coeff_shift,
+					    s32 grain_min,
+					    s32 grain_max,
+					    u16 random_seed)
+{
+	s32 gauss_sec_shift = 12 - bitdepth + grain_scale_shift;
+	u16 grain_random_register = random_seed;
+	s32 i, j;
+
+	for (i = 0; i < 73; i++) {
+		for (j = 0; j < 82; j++) {
+			if (num_y_points > 0) {
+				rockchip_av1_update_random_register
+				    (&grain_random_register);
+				(*luma_grain_block)[i][j] =
+				    round_power_of_two(gaussian_sequence
+					     [rockchip_av1_get_random_number
+					      (grain_random_register)],
+					     gauss_sec_shift);
+			} else {
+				(*luma_grain_block)[i][j] = 0;
+			}
+		}
+	}
+
+	for (i = 3; i < 73; i++)
+		for (j = 3; j < 82 - 3; j++) {
+			s32 pos = 0;
+			s32 wsum = 0;
+			s32 deltarow, deltacol;
+
+			for (deltarow = -ar_coeff_lag; deltarow <= 0;
+			     deltarow++) {
+				for (deltacol = -ar_coeff_lag;
+				     deltacol <= ar_coeff_lag; deltacol++) {
+					if (deltarow == 0 && deltacol == 0)
+						break;
+					wsum = wsum + (*ar_coeffs_y)[pos] *
+					    (*luma_grain_block)[i + deltarow][j + deltacol];
+					++pos;
+				}
+			}
+			(*luma_grain_block)[i][j] =
+				clamp((*luma_grain_block)[i][j] +
+				      round_power_of_two(wsum, ar_coeff_shift),
+				      grain_min, grain_max);
+		}
+}
+
+// Calculate chroma grain noise once per frame
+void rockchip_av1_generate_chroma_grain_block(s32 (*luma_grain_block)[73][82],
+					      s32 (*cb_grain_block)[38][44],
+					      s32 (*cr_grain_block)[38][44],
+					      s32 bitdepth,
+					      u8 num_y_points,
+					      u8 num_cb_points,
+					      u8 num_cr_points,
+					      s32 grain_scale_shift,
+					      s32 ar_coeff_lag,
+					      s32 (*ar_coeffs_cb)[25],
+					      s32 (*ar_coeffs_cr)[25],
+					      s32 ar_coeff_shift,
+					      s32 grain_min,
+					      s32 grain_max,
+					      u8 chroma_scaling_from_luma,
+					      u16 random_seed)
+{
+	s32 gauss_sec_shift = 12 - bitdepth + grain_scale_shift;
+	u16 grain_random_register = 0;
+	s32 i, j;
+
+	rockchip_av1_init_random_generator(7, random_seed,
+					   &grain_random_register);
+	for (i = 0; i < 38; i++) {
+		for (j = 0; j < 44; j++) {
+			if (num_cb_points || chroma_scaling_from_luma) {
+				rockchip_av1_update_random_register
+				    (&grain_random_register);
+				(*cb_grain_block)[i][j] =
+				    round_power_of_two(gaussian_sequence
+					     [rockchip_av1_get_random_number
+					      (grain_random_register)],
+					     gauss_sec_shift);
+			} else {
+				(*cb_grain_block)[i][j] = 0;
+			}
+		}
+	}
+
+	rockchip_av1_init_random_generator(11, random_seed,
+					   &grain_random_register);
+	for (i = 0; i < 38; i++) {
+		for (j = 0; j < 44; j++) {
+			if (num_cr_points || chroma_scaling_from_luma) {
+				rockchip_av1_update_random_register
+				    (&grain_random_register);
+				(*cr_grain_block)[i][j] =
+				    round_power_of_two(gaussian_sequence
+					     [rockchip_av1_get_random_number
+					      (grain_random_register)],
+					     gauss_sec_shift);
+			} else {
+				(*cr_grain_block)[i][j] = 0;
+			}
+		}
+	}
+
+	for (i = 3; i < 38; i++) {
+		for (j = 3; j < 44 - 3; j++) {
+			s32 wsum_cb = 0;
+			s32 wsum_cr = 0;
+			s32 pos = 0;
+			s32 deltarow, deltacol;
+
+			for (deltarow = -ar_coeff_lag; deltarow <= 0;
+			     deltarow++) {
+				for (deltacol = -ar_coeff_lag;
+				     deltacol <= ar_coeff_lag; deltacol++) {
+					if (deltarow == 0 && deltacol == 0)
+						break;
+					wsum_cb = wsum_cb + (*ar_coeffs_cb)[pos] *
+					    (*cb_grain_block)[i + deltarow][j + deltacol];
+					wsum_cr =
+					    wsum_cr +
+					    (*ar_coeffs_cr)[pos] *
+					    (*cr_grain_block)[i + deltarow][j + deltacol];
+					++pos;
+				}
+			}
+
+			if (num_y_points > 0) {
+				s32 av_luma = 0;
+				s32 luma_coord_y = (i << 1) - 3;
+				s32 luma_coord_x = (j << 1) - 3;
+
+				av_luma +=
+				    (*luma_grain_block)[luma_coord_y][luma_coord_x];
+				av_luma +=
+				    (*luma_grain_block)[luma_coord_y][luma_coord_x + 1];
+				av_luma +=
+				    (*luma_grain_block)[luma_coord_y + 1][luma_coord_x];
+				av_luma +=
+				    (*luma_grain_block)[(luma_coord_y + 1)][luma_coord_x + 1];
+				av_luma = round_power_of_two(av_luma, 2);
+
+				wsum_cb = wsum_cb + (*ar_coeffs_cb)[pos] * av_luma;
+				wsum_cr = wsum_cr + (*ar_coeffs_cr)[pos] * av_luma;
+			}
+
+			if (num_cb_points || chroma_scaling_from_luma) {
+				(*cb_grain_block)[i][j] =
+				    clamp((*cb_grain_block)[i][j] +
+					  round_power_of_two(wsum_cb, ar_coeff_shift),
+					  grain_min, grain_max);
+			}
+			if (num_cr_points || chroma_scaling_from_luma) {
+				(*cr_grain_block)[i][j] =
+				    clamp((*cr_grain_block)[i][j] +
+					  round_power_of_two(wsum_cr, ar_coeff_shift),
+					  grain_min, grain_max);
+			}
+		}
+	}
+}
diff --git a/drivers/media/platform/verisilicon/rockchip_av1_filmgrain.h b/drivers/media/platform/verisilicon/rockchip_av1_filmgrain.h
new file mode 100644
index 000000000000..31a8b7920c31
--- /dev/null
+++ b/drivers/media/platform/verisilicon/rockchip_av1_filmgrain.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef _ROCKCHIP_AV1_FILMGRAIN_H_
+#define _ROCKCHIP_AV1_FILMGRAIN_H_
+
+#include <linux/types.h>
+
+void rockchip_av1_generate_luma_grain_block(s32 (*luma_grain_block)[73][82],
+					    s32 bitdepth,
+					    u8 num_y_points,
+					    s32 grain_scale_shift,
+					    s32 ar_coeff_lag,
+					    s32 (*ar_coeffs_y)[24],
+					    s32 ar_coeff_shift,
+					    s32 grain_min,
+					    s32 grain_max,
+					    u16 random_seed);
+
+void rockchip_av1_generate_chroma_grain_block(s32 (*luma_grain_block)[73][82],
+					      s32 (*cb_grain_block)[38][44],
+					      s32 (*cr_grain_block)[38][44],
+					      s32 bitdepth,
+					      u8 num_y_points,
+					      u8 num_cb_points,
+					      u8 num_cr_points,
+					      s32 grain_scale_shift,
+					      s32 ar_coeff_lag,
+					      s32 (*ar_coeffs_cb)[25],
+					      s32 (*ar_coeffs_cr)[25],
+					      s32 ar_coeff_shift,
+					      s32 grain_min,
+					      s32 grain_max,
+					      u8 chroma_scaling_from_luma,
+					      u16 random_seed);
+
+#endif
diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
index b9fc70f606a3..0a7d4fa978b3 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
@@ -334,6 +334,12 @@ void rockchip_vpu981_av1_dec_exit(struct hantro_ctx *ctx)
 				  av1_dec->tile_info.dma);
 	av1_dec->tile_info.cpu = NULL;
 
+	if (av1_dec->film_grain.cpu)
+		dma_free_coherent(vpu->dev, av1_dec->film_grain.size,
+				  av1_dec->film_grain.cpu,
+				  av1_dec->film_grain.dma);
+	av1_dec->film_grain.cpu = NULL;
+
 	if (av1_dec->prob_tbl.cpu)
 		dma_free_coherent(vpu->dev, av1_dec->prob_tbl.size,
 				  av1_dec->prob_tbl.cpu, av1_dec->prob_tbl.dma);
@@ -374,6 +380,14 @@ int rockchip_vpu981_av1_dec_init(struct hantro_ctx *ctx)
 		return -ENOMEM;
 	av1_dec->tile_info.size = AV1_MAX_TILES;
 
+	av1_dec->film_grain.cpu = dma_alloc_coherent(vpu->dev,
+						     ALIGN(sizeof(struct rockchip_av1_film_grain), 2048),
+						     &av1_dec->film_grain.dma,
+						     GFP_KERNEL);
+	if (!av1_dec->film_grain.cpu)
+		return -ENOMEM;
+	av1_dec->film_grain.size = ALIGN(sizeof(struct rockchip_av1_film_grain), 2048);
+
 	av1_dec->prob_tbl.cpu = dma_alloc_coherent(vpu->dev,
 						   ALIGN(sizeof(struct av1cdfs), 2048),
 						   &av1_dec->prob_tbl.dma,
@@ -1180,6 +1194,201 @@ static void rockchip_vpu981_av1_dec_set_prob(struct hantro_ctx *ctx)
 	hantro_write_addr(vpu, AV1_PROP_TABLE, av1_dec->prob_tbl.dma);
 }
 
+static void
+rockchip_vpu981_av1_dec_init_scaling_function(const u8 *values, const u8 *scaling,
+					      u8 num_points, u8 *scaling_lut)
+{
+	int i, point;
+
+	if (num_points == 0) {
+		memset(scaling_lut, 0, 256);
+		return;
+	}
+
+	for (point = 0; point < num_points - 1; point++) {
+		int x;
+		s32 delta_y = scaling[point + 1] - scaling[point];
+		s32 delta_x = values[point + 1] - values[point];
+		s64 delta =
+		    delta_x ? delta_y * ((65536 + (delta_x >> 1)) /
+					 delta_x) : 0;
+
+		for (x = 0; x < delta_x; x++) {
+			scaling_lut[values[point] + x] =
+			    scaling[point] +
+			    (s32)((x * delta + 32768) >> 16);
+		}
+	}
+
+	for (i = values[num_points - 1]; i < 256; i++)
+		scaling_lut[i] = scaling[num_points - 1];
+}
+
+static void rockchip_vpu981_av1_dec_set_fgs(struct hantro_ctx *ctx)
+{
+	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
+	struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
+	const struct v4l2_ctrl_av1_film_grain *film_grain = ctrls->film_grain;
+	struct rockchip_av1_film_grain *fgmem = av1_dec->film_grain.cpu;
+	struct hantro_dev *vpu = ctx->dev;
+	bool scaling_from_luma =
+		!!(film_grain->flags & V4L2_AV1_FILM_GRAIN_FLAG_CHROMA_SCALING_FROM_LUMA);
+	s32 (*ar_coeffs_y)[24];
+	s32 (*ar_coeffs_cb)[25];
+	s32 (*ar_coeffs_cr)[25];
+	s32 (*luma_grain_block)[73][82];
+	s32 (*cb_grain_block)[38][44];
+	s32 (*cr_grain_block)[38][44];
+	s32 ar_coeff_lag, ar_coeff_shift;
+	s32 grain_scale_shift, bitdepth;
+	s32 grain_center, grain_min, grain_max;
+	int i, j;
+
+	hantro_reg_write(vpu, &av1_apply_grain, 0);
+
+	if (!(film_grain->flags & V4L2_AV1_FILM_GRAIN_FLAG_APPLY_GRAIN)) {
+		hantro_reg_write(vpu, &av1_num_y_points_b, 0);
+		hantro_reg_write(vpu, &av1_num_cb_points_b, 0);
+		hantro_reg_write(vpu, &av1_num_cr_points_b, 0);
+		hantro_reg_write(vpu, &av1_scaling_shift, 0);
+		hantro_reg_write(vpu, &av1_cb_mult, 0);
+		hantro_reg_write(vpu, &av1_cb_luma_mult, 0);
+		hantro_reg_write(vpu, &av1_cb_offset, 0);
+		hantro_reg_write(vpu, &av1_cr_mult, 0);
+		hantro_reg_write(vpu, &av1_cr_luma_mult, 0);
+		hantro_reg_write(vpu, &av1_cr_offset, 0);
+		hantro_reg_write(vpu, &av1_overlap_flag, 0);
+		hantro_reg_write(vpu, &av1_clip_to_restricted_range, 0);
+		hantro_reg_write(vpu, &av1_chroma_scaling_from_luma, 0);
+		hantro_reg_write(vpu, &av1_random_seed, 0);
+		hantro_write_addr(vpu, AV1_FILM_GRAIN, 0);
+		return;
+	}
+
+	ar_coeffs_y = kzalloc(sizeof(int32_t) * 24, GFP_KERNEL);
+	ar_coeffs_cb = kzalloc(sizeof(int32_t) * 25, GFP_KERNEL);
+	ar_coeffs_cr = kzalloc(sizeof(int32_t) * 25, GFP_KERNEL);
+	luma_grain_block = kzalloc(sizeof(int32_t) * 73 * 82, GFP_KERNEL);
+	cb_grain_block = kzalloc(sizeof(int32_t) * 38 * 44, GFP_KERNEL);
+	cr_grain_block = kzalloc(sizeof(int32_t) * 38 * 44, GFP_KERNEL);
+
+	if (!ar_coeffs_y || !ar_coeffs_cb || !ar_coeffs_cr ||
+	    !luma_grain_block || !cb_grain_block || !cr_grain_block) {
+		pr_warn("Fail allocating memory for film grain parameters\n");
+		goto alloc_fail;
+	}
+
+	hantro_reg_write(vpu, &av1_apply_grain, 1);
+
+	hantro_reg_write(vpu, &av1_num_y_points_b,
+			 film_grain->num_y_points > 0);
+	hantro_reg_write(vpu, &av1_num_cb_points_b,
+			 film_grain->num_cb_points > 0);
+	hantro_reg_write(vpu, &av1_num_cr_points_b,
+			 film_grain->num_cr_points > 0);
+	hantro_reg_write(vpu, &av1_scaling_shift,
+			 film_grain->grain_scaling_minus_8 + 8);
+
+	if (!scaling_from_luma) {
+		hantro_reg_write(vpu, &av1_cb_mult, film_grain->cb_mult - 128);
+		hantro_reg_write(vpu, &av1_cb_luma_mult, film_grain->cb_luma_mult - 128);
+		hantro_reg_write(vpu, &av1_cb_offset, film_grain->cb_offset - 256);
+		hantro_reg_write(vpu, &av1_cr_mult, film_grain->cr_mult - 128);
+		hantro_reg_write(vpu, &av1_cr_luma_mult, film_grain->cr_luma_mult - 128);
+		hantro_reg_write(vpu, &av1_cr_offset, film_grain->cr_offset - 256);
+	} else {
+		hantro_reg_write(vpu, &av1_cb_mult, 0);
+		hantro_reg_write(vpu, &av1_cb_luma_mult, 0);
+		hantro_reg_write(vpu, &av1_cb_offset, 0);
+		hantro_reg_write(vpu, &av1_cr_mult, 0);
+		hantro_reg_write(vpu, &av1_cr_luma_mult, 0);
+		hantro_reg_write(vpu, &av1_cr_offset, 0);
+	}
+
+	hantro_reg_write(vpu, &av1_overlap_flag,
+			 !!(film_grain->flags & V4L2_AV1_FILM_GRAIN_FLAG_OVERLAP));
+	hantro_reg_write(vpu, &av1_clip_to_restricted_range,
+			 !!(film_grain->flags & V4L2_AV1_FILM_GRAIN_FLAG_CLIP_TO_RESTRICTED_RANGE));
+	hantro_reg_write(vpu, &av1_chroma_scaling_from_luma, scaling_from_luma);
+	hantro_reg_write(vpu, &av1_random_seed, film_grain->grain_seed);
+
+	rockchip_vpu981_av1_dec_init_scaling_function(film_grain->point_y_value,
+						      film_grain->point_y_scaling,
+						      film_grain->num_y_points,
+						      fgmem->scaling_lut_y);
+
+	if (film_grain->flags &
+	    V4L2_AV1_FILM_GRAIN_FLAG_CHROMA_SCALING_FROM_LUMA) {
+		memcpy(fgmem->scaling_lut_cb, fgmem->scaling_lut_y,
+		       sizeof(*fgmem->scaling_lut_y) * 256);
+		memcpy(fgmem->scaling_lut_cr, fgmem->scaling_lut_y,
+		       sizeof(*fgmem->scaling_lut_y) * 256);
+	} else {
+		rockchip_vpu981_av1_dec_init_scaling_function
+		    (film_grain->point_cb_value, film_grain->point_cb_scaling,
+		     film_grain->num_cb_points, fgmem->scaling_lut_cb);
+		rockchip_vpu981_av1_dec_init_scaling_function
+		    (film_grain->point_cr_value, film_grain->point_cr_scaling,
+		     film_grain->num_cr_points, fgmem->scaling_lut_cr);
+	}
+
+	for (i = 0; i < V4L2_AV1_AR_COEFFS_SIZE; i++) {
+		if (i < 24)
+			(*ar_coeffs_y)[i] = film_grain->ar_coeffs_y_plus_128[i] - 128;
+		(*ar_coeffs_cb)[i] = film_grain->ar_coeffs_cb_plus_128[i] - 128;
+		(*ar_coeffs_cr)[i] = film_grain->ar_coeffs_cr_plus_128[i] - 128;
+	}
+
+	ar_coeff_lag = film_grain->ar_coeff_lag;
+	ar_coeff_shift = film_grain->ar_coeff_shift_minus_6 + 6;
+	grain_scale_shift = film_grain->grain_scale_shift;
+	bitdepth = ctx->bit_depth;
+	grain_center = 128 << (bitdepth - 8);
+	grain_min = 0 - grain_center;
+	grain_max = (256 << (bitdepth - 8)) - 1 - grain_center;
+
+	rockchip_av1_generate_luma_grain_block(luma_grain_block, bitdepth,
+					       film_grain->num_y_points, grain_scale_shift,
+					       ar_coeff_lag, ar_coeffs_y, ar_coeff_shift,
+					       grain_min, grain_max, film_grain->grain_seed);
+
+	rockchip_av1_generate_chroma_grain_block(luma_grain_block, cb_grain_block,
+						 cr_grain_block, bitdepth,
+						 film_grain->num_y_points,
+						 film_grain->num_cb_points,
+						 film_grain->num_cr_points,
+						 grain_scale_shift, ar_coeff_lag, ar_coeffs_cb,
+						 ar_coeffs_cr, ar_coeff_shift, grain_min,
+						 grain_max,
+						 scaling_from_luma,
+						 film_grain->grain_seed);
+
+	for (i = 0; i < 64; i++) {
+		for (j = 0; j < 64; j++)
+			fgmem->cropped_luma_grain_block[i * 64 + j] =
+				(*luma_grain_block)[i + 9][j + 9];
+	}
+
+	for (i = 0; i < 32; i++) {
+		for (j = 0; j < 32; j++) {
+			fgmem->cropped_chroma_grain_block[i * 64 + 2 * j] =
+				(*cb_grain_block)[i + 6][j + 6];
+			fgmem->cropped_chroma_grain_block[i * 64 + 2 * j + 1] =
+				(*cr_grain_block)[i + 6][j + 6];
+		}
+	}
+
+	hantro_write_addr(vpu, AV1_FILM_GRAIN, av1_dec->film_grain.dma);
+
+alloc_fail:
+	kfree(ar_coeffs_y);
+	kfree(ar_coeffs_cb);
+	kfree(ar_coeffs_cr);
+	kfree(luma_grain_block);
+	kfree(cb_grain_block);
+	kfree(cr_grain_block);
+}
+
 static void rockchip_vpu981_av1_dec_set_cdef(struct hantro_ctx *ctx)
 {
 	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
@@ -1917,6 +2126,7 @@ int rockchip_vpu981_av1_dec_run(struct hantro_ctx *ctx)
 	rockchip_vpu981_av1_dec_set_picture_dimensions(ctx);
 	rockchip_vpu981_av1_dec_set_cdef(ctx);
 	rockchip_vpu981_av1_dec_set_lr(ctx);
+	rockchip_vpu981_av1_dec_set_fgs(ctx);
 	rockchip_vpu981_av1_dec_set_prob(ctx);
 
 	hantro_reg_write(vpu, &av1_dec_mode, AV1_DEC_MODE);
-- 
2.34.1

