Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 391CC4E8358
	for <lists+linux-media@lfdr.de>; Sat, 26 Mar 2022 19:34:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234564AbiCZSfz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 26 Mar 2022 14:35:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234477AbiCZSfy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 26 Mar 2022 14:35:54 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 321891FA75;
        Sat, 26 Mar 2022 11:34:14 -0700 (PDT)
Received: from localhost (unknown [IPv6:2a02:3030:b:56bb:4cb:3227:231:99f8])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sebastianfricke)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 234D81F44FBF;
        Sat, 26 Mar 2022 18:34:13 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1648319653;
        bh=0uxq8oBVPNTWn2BI3NbnvmT8fnd2e756ZbhoZUvU2G4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ewWOIca4wQaznMd0cMJa1Ei6QSKZI/WDtfKHIdGCbSlMhr6BoP510XXJZYGtpLIG8
         uvSkkpfrFtkuJJii3aRKms84kqJLp50wCangUajib1FLFxQ9zGuGvDDLiycpPQH6kj
         Eav4QOPUPM/4m+rZNqRipaepLebDVl07sLXkGk/6kLZUiRAeYHL79BKeJRQC5LXjuA
         WUHsdzvDJZmgB2tYIO8dMZuBO1Oo60bCjkuWCPjBQ3Rpr379+2Hz4Fi5WbTPaFYGtN
         yzo6x1ScuO+TT/U820NljkeKie/dIPU/gl/jdHWefsJecioeJ+vQgGctRko2ulya2q
         BeX0X/0JFmbxw==
From:   Sebastian Fricke <sebastian.fricke@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     acourbot@chromium.org, tfiga@chromium.org,
        hverkuil-cisco@xs4all.nl,
        Sebastian Fricke <sebastian.fricke@collabora.com>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner
        sunXi SoC support),
        linux-sunxi@lists.linux.dev (open list:ARM/Allwinner sunXi SoC support),
        linux-kernel@vger.kernel.org (open list)
Subject: [RFC PATCH 2/2] staging: media: cedrus: Rename H265 to HEVC
Date:   Sat, 26 Mar 2022 19:31:58 +0100
Message-Id: <20220326183158.65303-2-sebastian.fricke@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220326183158.65303-1-sebastian.fricke@collabora.com>
References: <20220326183158.65303-1-sebastian.fricke@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rename all instances where the identifier H265 is used with HEVC.
The codec has multiple identifiers H.265 (ITU-T), MPEG-H Part 2 (ISO),
but the actual name of the codec is HEVC (High Efficiency Video Coding).
Also nearly all other related drivers use the term HEVC instead of H265.

Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>
---
 drivers/staging/media/sunxi/cedrus/Makefile   |   2 +-
 drivers/staging/media/sunxi/cedrus/cedrus.c   |  30 +-
 drivers/staging/media/sunxi/cedrus/cedrus.h   |  14 +-
 .../staging/media/sunxi/cedrus/cedrus_dec.c   |  10 +-
 .../cedrus/{cedrus_h265.c => cedrus_hevc.c}   | 438 +++++++++---------
 5 files changed, 247 insertions(+), 247 deletions(-)
 rename drivers/staging/media/sunxi/cedrus/{cedrus_h265.c => cedrus_hevc.c} (53%)

diff --git a/drivers/staging/media/sunxi/cedrus/Makefile b/drivers/staging/media/sunxi/cedrus/Makefile
index a647b3690bf8..84b1b5db3128 100644
--- a/drivers/staging/media/sunxi/cedrus/Makefile
+++ b/drivers/staging/media/sunxi/cedrus/Makefile
@@ -2,5 +2,5 @@
 obj-$(CONFIG_VIDEO_SUNXI_CEDRUS) += sunxi-cedrus.o
 
 sunxi-cedrus-y = cedrus.o cedrus_video.o cedrus_hw.o cedrus_dec.o \
-		 cedrus_mpeg2.o cedrus_h264.o cedrus_h265.o \
+		 cedrus_mpeg2.o cedrus_h264.o cedrus_hevc.o \
 		 cedrus_vp8.o
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 68b3dcdb5df3..f27cb8036a72 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -54,7 +54,7 @@ static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
 			/* Luma and chroma bit depth mismatch */
 			return -EINVAL;
 
-		if (ctx->dev->capabilities & CEDRUS_CAPABILITY_H265_10_DEC) {
+		if (ctx->dev->capabilities & CEDRUS_CAPABILITY_HEVC_10_DEC) {
 			if (sps->bit_depth_luma_minus8 != 0 && sps->bit_depth_luma_minus8 != 2)
 				/* Only 8-bit and 10-bit are supported */
 				return -EINVAL;
@@ -167,25 +167,25 @@ static const struct cedrus_control cedrus_controls[] = {
 			.id	= V4L2_CID_MPEG_VIDEO_HEVC_SPS,
 			.ops	= &cedrus_ctrl_ops,
 		},
-		.codec		= CEDRUS_CODEC_H265,
+		.codec		= CEDRUS_CODEC_HEVC,
 	},
 	{
 		.cfg = {
 			.id	= V4L2_CID_MPEG_VIDEO_HEVC_PPS,
 		},
-		.codec		= CEDRUS_CODEC_H265,
+		.codec		= CEDRUS_CODEC_HEVC,
 	},
 	{
 		.cfg = {
 			.id	= V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS,
 		},
-		.codec		= CEDRUS_CODEC_H265,
+		.codec		= CEDRUS_CODEC_HEVC,
 	},
 	{
 		.cfg = {
 			.id	= V4L2_CID_MPEG_VIDEO_HEVC_SCALING_MATRIX,
 		},
-		.codec		= CEDRUS_CODEC_H265,
+		.codec		= CEDRUS_CODEC_HEVC,
 	},
 	{
 		.cfg = {
@@ -193,7 +193,7 @@ static const struct cedrus_control cedrus_controls[] = {
 			.max	= V4L2_MPEG_VIDEO_HEVC_DECODE_MODE_SLICE_BASED,
 			.def	= V4L2_MPEG_VIDEO_HEVC_DECODE_MODE_SLICE_BASED,
 		},
-		.codec		= CEDRUS_CODEC_H265,
+		.codec		= CEDRUS_CODEC_HEVC,
 	},
 	{
 		.cfg = {
@@ -201,7 +201,7 @@ static const struct cedrus_control cedrus_controls[] = {
 			.max	= V4L2_MPEG_VIDEO_HEVC_START_CODE_NONE,
 			.def	= V4L2_MPEG_VIDEO_HEVC_START_CODE_NONE,
 		},
-		.codec		= CEDRUS_CODEC_H265,
+		.codec		= CEDRUS_CODEC_HEVC,
 	},
 	{
 		.cfg = {
@@ -213,7 +213,7 @@ static const struct cedrus_control cedrus_controls[] = {
 		.cfg = {
 			.id = V4L2_CID_MPEG_VIDEO_HEVC_DECODE_PARAMS,
 		},
-		.codec		= CEDRUS_CODEC_H265,
+		.codec		= CEDRUS_CODEC_HEVC,
 	},
 };
 
@@ -434,7 +434,7 @@ static int cedrus_probe(struct platform_device *pdev)
 
 	dev->dec_ops[CEDRUS_CODEC_MPEG2] = &cedrus_dec_ops_mpeg2;
 	dev->dec_ops[CEDRUS_CODEC_H264] = &cedrus_dec_ops_h264;
-	dev->dec_ops[CEDRUS_CODEC_H265] = &cedrus_dec_ops_h265;
+	dev->dec_ops[CEDRUS_CODEC_HEVC] = &cedrus_dec_ops_hevc;
 	dev->dec_ops[CEDRUS_CODEC_VP8] = &cedrus_dec_ops_vp8;
 
 	mutex_init(&dev->dev_mutex);
@@ -563,7 +563,7 @@ static const struct cedrus_variant sun8i_h3_cedrus_variant = {
 	.capabilities	= CEDRUS_CAPABILITY_UNTILED |
 			  CEDRUS_CAPABILITY_MPEG2_DEC |
 			  CEDRUS_CAPABILITY_H264_DEC |
-			  CEDRUS_CAPABILITY_H265_DEC |
+			  CEDRUS_CAPABILITY_HEVC_DEC |
 			  CEDRUS_CAPABILITY_VP8_DEC,
 	.mod_rate	= 402000000,
 };
@@ -586,7 +586,7 @@ static const struct cedrus_variant sun20i_d1_cedrus_variant = {
 	.capabilities	= CEDRUS_CAPABILITY_UNTILED |
 			  CEDRUS_CAPABILITY_MPEG2_DEC |
 			  CEDRUS_CAPABILITY_H264_DEC |
-			  CEDRUS_CAPABILITY_H265_DEC,
+			  CEDRUS_CAPABILITY_HEVC_DEC,
 	.mod_rate	= 432000000,
 };
 
@@ -594,7 +594,7 @@ static const struct cedrus_variant sun50i_a64_cedrus_variant = {
 	.capabilities	= CEDRUS_CAPABILITY_UNTILED |
 			  CEDRUS_CAPABILITY_MPEG2_DEC |
 			  CEDRUS_CAPABILITY_H264_DEC |
-			  CEDRUS_CAPABILITY_H265_DEC |
+			  CEDRUS_CAPABILITY_HEVC_DEC |
 			  CEDRUS_CAPABILITY_VP8_DEC,
 	.mod_rate	= 402000000,
 };
@@ -603,7 +603,7 @@ static const struct cedrus_variant sun50i_h5_cedrus_variant = {
 	.capabilities	= CEDRUS_CAPABILITY_UNTILED |
 			  CEDRUS_CAPABILITY_MPEG2_DEC |
 			  CEDRUS_CAPABILITY_H264_DEC |
-			  CEDRUS_CAPABILITY_H265_DEC |
+			  CEDRUS_CAPABILITY_HEVC_DEC |
 			  CEDRUS_CAPABILITY_VP8_DEC,
 	.mod_rate	= 402000000,
 };
@@ -612,8 +612,8 @@ static const struct cedrus_variant sun50i_h6_cedrus_variant = {
 	.capabilities	= CEDRUS_CAPABILITY_UNTILED |
 			  CEDRUS_CAPABILITY_MPEG2_DEC |
 			  CEDRUS_CAPABILITY_H264_DEC |
-			  CEDRUS_CAPABILITY_H265_DEC |
-			  CEDRUS_CAPABILITY_H265_10_DEC |
+			  CEDRUS_CAPABILITY_HEVC_DEC |
+			  CEDRUS_CAPABILITY_HEVC_10_DEC |
 			  CEDRUS_CAPABILITY_VP8_DEC,
 	.mod_rate	= 600000000,
 };
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
index 3bc094eb497f..2c260fe27325 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -29,16 +29,16 @@
 #define CEDRUS_NAME			"cedrus"
 
 #define CEDRUS_CAPABILITY_UNTILED	BIT(0)
-#define CEDRUS_CAPABILITY_H265_DEC	BIT(1)
+#define CEDRUS_CAPABILITY_HEVC_DEC	BIT(1)
 #define CEDRUS_CAPABILITY_H264_DEC	BIT(2)
 #define CEDRUS_CAPABILITY_MPEG2_DEC	BIT(3)
 #define CEDRUS_CAPABILITY_VP8_DEC	BIT(4)
-#define CEDRUS_CAPABILITY_H265_10_DEC	BIT(5)
+#define CEDRUS_CAPABILITY_HEVC_10_DEC	BIT(5)
 
 enum cedrus_codec {
 	CEDRUS_CODEC_MPEG2,
 	CEDRUS_CODEC_H264,
-	CEDRUS_CODEC_H265,
+	CEDRUS_CODEC_HEVC,
 	CEDRUS_CODEC_VP8,
 	CEDRUS_CODEC_LAST,
 };
@@ -75,7 +75,7 @@ struct cedrus_mpeg2_run {
 	const struct v4l2_ctrl_mpeg2_quantisation	*quantisation;
 };
 
-struct cedrus_h265_run {
+struct cedrus_hevc_run {
 	const struct v4l2_ctrl_hevc_sps			*sps;
 	const struct v4l2_ctrl_hevc_pps			*pps;
 	const struct v4l2_ctrl_hevc_slice_params	*slice_params;
@@ -94,7 +94,7 @@ struct cedrus_run {
 	union {
 		struct cedrus_h264_run	h264;
 		struct cedrus_mpeg2_run	mpeg2;
-		struct cedrus_h265_run	h265;
+		struct cedrus_hevc_run	hevc;
 		struct cedrus_vp8_run	vp8;
 	};
 };
@@ -146,7 +146,7 @@ struct cedrus_ctx {
 			ssize_t		mv_col_buf_unit_size;
 			void		*neighbor_info_buf;
 			dma_addr_t	neighbor_info_buf_addr;
-		} h265;
+		} hevc;
 		struct {
 			unsigned int	last_frame_p_type;
 			unsigned int	last_filter_type;
@@ -201,7 +201,7 @@ struct cedrus_dev {
 
 extern struct cedrus_dec_ops cedrus_dec_ops_mpeg2;
 extern struct cedrus_dec_ops cedrus_dec_ops_h264;
-extern struct cedrus_dec_ops cedrus_dec_ops_h265;
+extern struct cedrus_dec_ops cedrus_dec_ops_hevc;
 extern struct cedrus_dec_ops cedrus_dec_ops_vp8;
 
 static inline void cedrus_write(struct cedrus_dev *dev, u32 reg, u32 val)
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
index 9c7200299465..95f192127a50 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
@@ -64,15 +64,15 @@ void cedrus_device_run(void *priv)
 		break;
 
 	case V4L2_PIX_FMT_HEVC_SLICE:
-		run.h265.sps = cedrus_find_control_data(ctx,
+		run.hevc.sps = cedrus_find_control_data(ctx,
 			V4L2_CID_MPEG_VIDEO_HEVC_SPS);
-		run.h265.pps = cedrus_find_control_data(ctx,
+		run.hevc.pps = cedrus_find_control_data(ctx,
 			V4L2_CID_MPEG_VIDEO_HEVC_PPS);
-		run.h265.slice_params = cedrus_find_control_data(ctx,
+		run.hevc.slice_params = cedrus_find_control_data(ctx,
 			V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS);
-		run.h265.decode_params = cedrus_find_control_data(ctx,
+		run.hevc.decode_params = cedrus_find_control_data(ctx,
 			V4L2_CID_MPEG_VIDEO_HEVC_DECODE_PARAMS);
-		run.h265.scaling_matrix = cedrus_find_control_data(ctx,
+		run.hevc.scaling_matrix = cedrus_find_control_data(ctx,
 			V4L2_CID_MPEG_VIDEO_HEVC_SCALING_MATRIX);
 		break;
 
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/staging/media/sunxi/cedrus/cedrus_hevc.c
similarity index 53%
rename from drivers/staging/media/sunxi/cedrus/cedrus_h265.c
rename to drivers/staging/media/sunxi/cedrus/cedrus_hevc.c
index 44f385be9f6c..211410214d84 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_hevc.c
@@ -21,13 +21,13 @@
  * internal decoding metadata. They match the values used by the early BSP
  * implementations, that were initially exposed in libvdpau-sunxi.
  * Subsequent BSP implementations seem to double the neighbor info buffer size
- * for the H6 SoC, which may be related to 10 bit H265 support.
+ * for the H6 SoC, which may be related to 10 bit HEVC support.
  */
-#define CEDRUS_H265_NEIGHBOR_INFO_BUF_SIZE	(794 * SZ_1K)
-#define CEDRUS_H265_ENTRY_POINTS_BUF_SIZE	(4 * SZ_1K)
-#define CEDRUS_H265_MV_COL_BUF_UNIT_CTB_SIZE	160
+#define CEDRUS_HEVC_NEIGHBOR_INFO_BUF_SIZE	(794 * SZ_1K)
+#define CEDRUS_HEVC_ENTRY_POINTS_BUF_SIZE	(4 * SZ_1K)
+#define CEDRUS_HEVC_MV_COL_BUF_UNIT_CTB_SIZE	160
 
-struct cedrus_h265_sram_frame_info {
+struct cedrus_hevc_sram_frame_info {
 	__le32	top_pic_order_cnt;
 	__le32	bottom_pic_order_cnt;
 	__le32	top_mv_col_buf_addr;
@@ -36,69 +36,69 @@ struct cedrus_h265_sram_frame_info {
 	__le32	chroma_addr;
 } __packed;
 
-struct cedrus_h265_sram_pred_weight {
+struct cedrus_hevc_sram_pred_weight {
 	__s8	delta_weight;
 	__s8	offset;
 } __packed;
 
-static enum cedrus_irq_status cedrus_h265_irq_status(struct cedrus_ctx *ctx)
+static enum cedrus_irq_status cedrus_hevc_irq_status(struct cedrus_ctx *ctx)
 {
 	struct cedrus_dev *dev = ctx->dev;
 	u32 reg;
 
-	reg = cedrus_read(dev, VE_DEC_H265_STATUS);
-	reg &= VE_DEC_H265_STATUS_CHECK_MASK;
+	reg = cedrus_read(dev, VE_DEC_HEVC_STATUS);
+	reg &= VE_DEC_HEVC_STATUS_CHECK_MASK;
 
-	if (reg & VE_DEC_H265_STATUS_CHECK_ERROR ||
-	    !(reg & VE_DEC_H265_STATUS_SUCCESS))
+	if (reg & VE_DEC_HEVC_STATUS_CHECK_ERROR ||
+	    !(reg & VE_DEC_HEVC_STATUS_SUCCESS))
 		return CEDRUS_IRQ_ERROR;
 
 	return CEDRUS_IRQ_OK;
 }
 
-static void cedrus_h265_irq_clear(struct cedrus_ctx *ctx)
+static void cedrus_hevc_irq_clear(struct cedrus_ctx *ctx)
 {
 	struct cedrus_dev *dev = ctx->dev;
 
-	cedrus_write(dev, VE_DEC_H265_STATUS, VE_DEC_H265_STATUS_CHECK_MASK);
+	cedrus_write(dev, VE_DEC_HEVC_STATUS, VE_DEC_HEVC_STATUS_CHECK_MASK);
 }
 
-static void cedrus_h265_irq_disable(struct cedrus_ctx *ctx)
+static void cedrus_hevc_irq_disable(struct cedrus_ctx *ctx)
 {
 	struct cedrus_dev *dev = ctx->dev;
-	u32 reg = cedrus_read(dev, VE_DEC_H265_CTRL);
+	u32 reg = cedrus_read(dev, VE_DEC_HEVC_CTRL);
 
-	reg &= ~VE_DEC_H265_CTRL_IRQ_MASK;
+	reg &= ~VE_DEC_HEVC_CTRL_IRQ_MASK;
 
-	cedrus_write(dev, VE_DEC_H265_CTRL, reg);
+	cedrus_write(dev, VE_DEC_HEVC_CTRL, reg);
 }
 
-static void cedrus_h265_sram_write_offset(struct cedrus_dev *dev, u32 offset)
+static void cedrus_hevc_sram_write_offset(struct cedrus_dev *dev, u32 offset)
 {
-	cedrus_write(dev, VE_DEC_H265_SRAM_OFFSET, offset);
+	cedrus_write(dev, VE_DEC_HEVC_SRAM_OFFSET, offset);
 }
 
-static void cedrus_h265_sram_write_data(struct cedrus_dev *dev, void *data,
+static void cedrus_hevc_sram_write_data(struct cedrus_dev *dev, void *data,
 					unsigned int size)
 {
 	u32 *word = data;
 
 	while (size >= sizeof(u32)) {
-		cedrus_write(dev, VE_DEC_H265_SRAM_DATA, *word++);
+		cedrus_write(dev, VE_DEC_HEVC_SRAM_DATA, *word++);
 		size -= sizeof(u32);
 	}
 }
 
 static inline dma_addr_t
-cedrus_h265_frame_info_mv_col_buf_addr(struct cedrus_ctx *ctx,
+cedrus_hevc_frame_info_mv_col_buf_addr(struct cedrus_ctx *ctx,
 				       unsigned int index, unsigned int field)
 {
-	return ctx->codec.h265.mv_col_buf_addr + index *
-	       ctx->codec.h265.mv_col_buf_unit_size +
-	       field * ctx->codec.h265.mv_col_buf_unit_size / 2;
+	return ctx->codec.hevc.mv_col_buf_addr + index *
+	       ctx->codec.hevc.mv_col_buf_unit_size +
+	       field * ctx->codec.hevc.mv_col_buf_unit_size / 2;
 }
 
-static void cedrus_h265_frame_info_write_single(struct cedrus_ctx *ctx,
+static void cedrus_hevc_frame_info_write_single(struct cedrus_ctx *ctx,
 						unsigned int index,
 						bool field_pic,
 						u32 pic_order_cnt[],
@@ -108,31 +108,31 @@ static void cedrus_h265_frame_info_write_single(struct cedrus_ctx *ctx,
 	dma_addr_t dst_luma_addr = cedrus_dst_buf_addr(ctx, buffer_index, 0);
 	dma_addr_t dst_chroma_addr = cedrus_dst_buf_addr(ctx, buffer_index, 1);
 	dma_addr_t mv_col_buf_addr[2] = {
-		cedrus_h265_frame_info_mv_col_buf_addr(ctx, buffer_index, 0),
-		cedrus_h265_frame_info_mv_col_buf_addr(ctx, buffer_index,
+		cedrus_hevc_frame_info_mv_col_buf_addr(ctx, buffer_index, 0),
+		cedrus_hevc_frame_info_mv_col_buf_addr(ctx, buffer_index,
 						       field_pic ? 1 : 0)
 	};
-	u32 offset = VE_DEC_H265_SRAM_OFFSET_FRAME_INFO +
-		     VE_DEC_H265_SRAM_OFFSET_FRAME_INFO_UNIT * index;
-	struct cedrus_h265_sram_frame_info frame_info = {
+	u32 offset = VE_DEC_HEVC_SRAM_OFFSET_FRAME_INFO +
+		     VE_DEC_HEVC_SRAM_OFFSET_FRAME_INFO_UNIT * index;
+	struct cedrus_hevc_sram_frame_info frame_info = {
 		.top_pic_order_cnt = cpu_to_le32(pic_order_cnt[0]),
 		.bottom_pic_order_cnt = cpu_to_le32(field_pic ?
 						    pic_order_cnt[1] :
 						    pic_order_cnt[0]),
 		.top_mv_col_buf_addr =
-			cpu_to_le32(VE_DEC_H265_SRAM_DATA_ADDR_BASE(mv_col_buf_addr[0])),
+			cpu_to_le32(VE_DEC_HEVC_SRAM_DATA_ADDR_BASE(mv_col_buf_addr[0])),
 		.bottom_mv_col_buf_addr = cpu_to_le32(field_pic ?
-			VE_DEC_H265_SRAM_DATA_ADDR_BASE(mv_col_buf_addr[1]) :
-			VE_DEC_H265_SRAM_DATA_ADDR_BASE(mv_col_buf_addr[0])),
-		.luma_addr = cpu_to_le32(VE_DEC_H265_SRAM_DATA_ADDR_BASE(dst_luma_addr)),
-		.chroma_addr = cpu_to_le32(VE_DEC_H265_SRAM_DATA_ADDR_BASE(dst_chroma_addr)),
+			VE_DEC_HEVC_SRAM_DATA_ADDR_BASE(mv_col_buf_addr[1]) :
+			VE_DEC_HEVC_SRAM_DATA_ADDR_BASE(mv_col_buf_addr[0])),
+		.luma_addr = cpu_to_le32(VE_DEC_HEVC_SRAM_DATA_ADDR_BASE(dst_luma_addr)),
+		.chroma_addr = cpu_to_le32(VE_DEC_HEVC_SRAM_DATA_ADDR_BASE(dst_chroma_addr)),
 	};
 
-	cedrus_h265_sram_write_offset(dev, offset);
-	cedrus_h265_sram_write_data(dev, &frame_info, sizeof(frame_info));
+	cedrus_hevc_sram_write_offset(dev, offset);
+	cedrus_hevc_sram_write_data(dev, &frame_info, sizeof(frame_info));
 }
 
-static void cedrus_h265_frame_info_write_dpb(struct cedrus_ctx *ctx,
+static void cedrus_hevc_frame_info_write_dpb(struct cedrus_ctx *ctx,
 					     const struct v4l2_hevc_dpb_entry *dpb,
 					     u8 num_active_dpb_entries)
 {
@@ -147,13 +147,13 @@ static void cedrus_h265_frame_info_write_dpb(struct cedrus_ctx *ctx,
 			dpb[i].pic_order_cnt[1]
 		};
 
-		cedrus_h265_frame_info_write_single(ctx, i, dpb[i].field_pic,
+		cedrus_hevc_frame_info_write_single(ctx, i, dpb[i].field_pic,
 						    pic_order_cnt,
 						    buffer_index);
 	}
 }
 
-static void cedrus_h265_ref_pic_list_write(struct cedrus_dev *dev,
+static void cedrus_hevc_ref_pic_list_write(struct cedrus_dev *dev,
 					   const struct v4l2_hevc_dpb_entry *dpb,
 					   const u8 list[],
 					   u8 num_ref_idx_active,
@@ -162,7 +162,7 @@ static void cedrus_h265_ref_pic_list_write(struct cedrus_dev *dev,
 	unsigned int i;
 	u32 word = 0;
 
-	cedrus_h265_sram_write_offset(dev, sram_offset);
+	cedrus_hevc_sram_write_offset(dev, sram_offset);
 
 	for (i = 0; i < num_ref_idx_active; i++) {
 		unsigned int shift = (i % 4) * 8;
@@ -170,20 +170,20 @@ static void cedrus_h265_ref_pic_list_write(struct cedrus_dev *dev,
 		u8 value = list[i];
 
 		if (dpb[index].flags & V4L2_HEVC_DPB_ENTRY_LONG_TERM_REFERENCE)
-			value |= VE_DEC_H265_SRAM_REF_PIC_LIST_LT_REF;
+			value |= VE_DEC_HEVC_SRAM_REF_PIC_LIST_LT_REF;
 
 		/* Each SRAM word gathers up to 4 references. */
 		word |= value << shift;
 
 		/* Write the word to SRAM and clear it for the next batch. */
 		if ((i % 4) == 3 || i == (num_ref_idx_active - 1)) {
-			cedrus_h265_sram_write_data(dev, &word, sizeof(word));
+			cedrus_hevc_sram_write_data(dev, &word, sizeof(word));
 			word = 0;
 		}
 	}
 }
 
-static void cedrus_h265_pred_weight_write(struct cedrus_dev *dev,
+static void cedrus_hevc_pred_weight_write(struct cedrus_dev *dev,
 					  const s8 delta_luma_weight[],
 					  const s8 luma_offset[],
 					  const s8 delta_chroma_weight[][2],
@@ -192,10 +192,10 @@ static void cedrus_h265_pred_weight_write(struct cedrus_dev *dev,
 					  u32 sram_luma_offset,
 					  u32 sram_chroma_offset)
 {
-	struct cedrus_h265_sram_pred_weight pred_weight[2] = { { 0 } };
+	struct cedrus_hevc_sram_pred_weight pred_weight[2] = { { 0 } };
 	unsigned int i, j;
 
-	cedrus_h265_sram_write_offset(dev, sram_luma_offset);
+	cedrus_hevc_sram_write_offset(dev, sram_luma_offset);
 
 	for (i = 0; i < num_ref_idx_active; i++) {
 		unsigned int index = i % 2;
@@ -204,11 +204,11 @@ static void cedrus_h265_pred_weight_write(struct cedrus_dev *dev,
 		pred_weight[index].offset = luma_offset[i];
 
 		if (index == 1 || i == (num_ref_idx_active - 1))
-			cedrus_h265_sram_write_data(dev, (u32 *)&pred_weight,
+			cedrus_hevc_sram_write_data(dev, (u32 *)&pred_weight,
 						    sizeof(pred_weight));
 	}
 
-	cedrus_h265_sram_write_offset(dev, sram_chroma_offset);
+	cedrus_hevc_sram_write_offset(dev, sram_chroma_offset);
 
 	for (i = 0; i < num_ref_idx_active; i++) {
 		for (j = 0; j < 2; j++) {
@@ -216,50 +216,50 @@ static void cedrus_h265_pred_weight_write(struct cedrus_dev *dev,
 			pred_weight[j].offset = chroma_offset[i][j];
 		}
 
-		cedrus_h265_sram_write_data(dev, &pred_weight,
+		cedrus_hevc_sram_write_data(dev, &pred_weight,
 					    sizeof(pred_weight));
 	}
 }
 
-static void cedrus_h265_skip_bits(struct cedrus_dev *dev, int num)
+static void cedrus_hevc_skip_bits(struct cedrus_dev *dev, int num)
 {
 	int count = 0;
 
 	while (count < num) {
 		int tmp = min(num - count, 32);
 
-		cedrus_write(dev, VE_DEC_H265_TRIGGER,
-			     VE_DEC_H265_TRIGGER_FLUSH_BITS |
-			     VE_DEC_H265_TRIGGER_TYPE_N_BITS(tmp));
-		while (cedrus_read(dev, VE_DEC_H265_STATUS) & VE_DEC_H265_STATUS_VLD_BUSY)
+		cedrus_write(dev, VE_DEC_HEVC_TRIGGER,
+			     VE_DEC_HEVC_TRIGGER_FLUSH_BITS |
+			     VE_DEC_HEVC_TRIGGER_TYPE_N_BITS(tmp));
+		while (cedrus_read(dev, VE_DEC_HEVC_STATUS) & VE_DEC_HEVC_STATUS_VLD_BUSY)
 			udelay(1);
 
 		count += tmp;
 	}
 }
 
-static void cedrus_h265_write_scaling_list(struct cedrus_ctx *ctx,
+static void cedrus_hevc_write_scaling_list(struct cedrus_ctx *ctx,
 					   struct cedrus_run *run)
 {
 	const struct v4l2_ctrl_hevc_scaling_matrix *scaling;
 	struct cedrus_dev *dev = ctx->dev;
 	u32 i, j, k, val;
 
-	scaling = run->h265.scaling_matrix;
+	scaling = run->hevc.scaling_matrix;
 
-	cedrus_write(dev, VE_DEC_H265_SCALING_LIST_DC_COEF0,
+	cedrus_write(dev, VE_DEC_HEVC_SCALING_LIST_DC_COEF0,
 		     (scaling->scaling_list_dc_coef_32x32[1] << 24) |
 		     (scaling->scaling_list_dc_coef_32x32[0] << 16) |
 		     (scaling->scaling_list_dc_coef_16x16[1] << 8) |
 		     (scaling->scaling_list_dc_coef_16x16[0] << 0));
 
-	cedrus_write(dev, VE_DEC_H265_SCALING_LIST_DC_COEF1,
+	cedrus_write(dev, VE_DEC_HEVC_SCALING_LIST_DC_COEF1,
 		     (scaling->scaling_list_dc_coef_16x16[5] << 24) |
 		     (scaling->scaling_list_dc_coef_16x16[4] << 16) |
 		     (scaling->scaling_list_dc_coef_16x16[3] << 8) |
 		     (scaling->scaling_list_dc_coef_16x16[2] << 0));
 
-	cedrus_h265_sram_write_offset(dev, VE_DEC_H265_SRAM_OFFSET_SCALING_LISTS);
+	cedrus_hevc_sram_write_offset(dev, VE_DEC_HEVC_SRAM_OFFSET_SCALING_LISTS);
 
 	for (i = 0; i < 6; i++)
 		for (j = 0; j < 8; j++)
@@ -268,7 +268,7 @@ static void cedrus_h265_write_scaling_list(struct cedrus_ctx *ctx,
 				      ((u32)scaling->scaling_list_8x8[i][j + (k + 2) * 8] << 16) |
 				      ((u32)scaling->scaling_list_8x8[i][j + (k + 1) * 8] << 8) |
 				      scaling->scaling_list_8x8[i][j + k * 8];
-				cedrus_write(dev, VE_DEC_H265_SRAM_DATA, val);
+				cedrus_write(dev, VE_DEC_HEVC_SRAM_DATA, val);
 			}
 
 	for (i = 0; i < 2; i++)
@@ -278,7 +278,7 @@ static void cedrus_h265_write_scaling_list(struct cedrus_ctx *ctx,
 				      ((u32)scaling->scaling_list_32x32[i][j + (k + 2) * 8] << 16) |
 				      ((u32)scaling->scaling_list_32x32[i][j + (k + 1) * 8] << 8) |
 				      scaling->scaling_list_32x32[i][j + k * 8];
-				cedrus_write(dev, VE_DEC_H265_SRAM_DATA, val);
+				cedrus_write(dev, VE_DEC_HEVC_SRAM_DATA, val);
 			}
 
 	for (i = 0; i < 6; i++)
@@ -288,7 +288,7 @@ static void cedrus_h265_write_scaling_list(struct cedrus_ctx *ctx,
 				      ((u32)scaling->scaling_list_16x16[i][j + (k + 2) * 8] << 16) |
 				      ((u32)scaling->scaling_list_16x16[i][j + (k + 1) * 8] << 8) |
 				      scaling->scaling_list_16x16[i][j + k * 8];
-				cedrus_write(dev, VE_DEC_H265_SRAM_DATA, val);
+				cedrus_write(dev, VE_DEC_HEVC_SRAM_DATA, val);
 			}
 
 	for (i = 0; i < 6; i++)
@@ -297,11 +297,11 @@ static void cedrus_h265_write_scaling_list(struct cedrus_ctx *ctx,
 			      ((u32)scaling->scaling_list_4x4[i][j + 8] << 16) |
 			      ((u32)scaling->scaling_list_4x4[i][j + 4] << 8) |
 			      scaling->scaling_list_4x4[i][j];
-			cedrus_write(dev, VE_DEC_H265_SRAM_DATA, val);
+			cedrus_write(dev, VE_DEC_HEVC_SRAM_DATA, val);
 		}
 }
 
-static void cedrus_h265_setup(struct cedrus_ctx *ctx,
+static void cedrus_hevc_setup(struct cedrus_ctx *ctx,
 			      struct cedrus_run *run)
 {
 	struct cedrus_dev *dev = ctx->dev;
@@ -319,10 +319,10 @@ static void cedrus_h265_setup(struct cedrus_ctx *ctx,
 	u32 pic_order_cnt[2];
 	u32 reg;
 
-	sps = run->h265.sps;
-	pps = run->h265.pps;
-	slice_params = run->h265.slice_params;
-	decode_params = run->h265.decode_params;
+	sps = run->hevc.sps;
+	pps = run->hevc.pps;
+	slice_params = run->hevc.slice_params;
+	decode_params = run->hevc.decode_params;
 	pred_weight_table = &slice_params->pred_weight_table;
 
 	log2_max_luma_coding_block_size =
@@ -333,7 +333,7 @@ static void cedrus_h265_setup(struct cedrus_ctx *ctx,
 		DIV_ROUND_UP(sps->pic_width_in_luma_samples, ctb_size_luma);
 
 	/* MV column buffer size and allocation. */
-	if (!ctx->codec.h265.mv_col_buf_size) {
+	if (!ctx->codec.hevc.mv_col_buf_size) {
 		unsigned int num_buffers =
 			run->dst->vb2_buf.vb2_queue->num_buffers;
 
@@ -342,269 +342,269 @@ static void cedrus_h265_setup(struct cedrus_ctx *ctx,
 		 * Since the address is given with missing lsb bits, 1 KiB is
 		 * added to each buffer to ensure proper alignment.
 		 */
-		ctx->codec.h265.mv_col_buf_unit_size =
+		ctx->codec.hevc.mv_col_buf_unit_size =
 			DIV_ROUND_UP(ctx->src_fmt.width, ctb_size_luma) *
 			DIV_ROUND_UP(ctx->src_fmt.height, ctb_size_luma) *
-			CEDRUS_H265_MV_COL_BUF_UNIT_CTB_SIZE + SZ_1K;
+			CEDRUS_HEVC_MV_COL_BUF_UNIT_CTB_SIZE + SZ_1K;
 
-		ctx->codec.h265.mv_col_buf_size = num_buffers *
-			ctx->codec.h265.mv_col_buf_unit_size;
+		ctx->codec.hevc.mv_col_buf_size = num_buffers *
+			ctx->codec.hevc.mv_col_buf_unit_size;
 
 		/* Buffer is never accessed by CPU, so we can skip kernel mapping. */
-		ctx->codec.h265.mv_col_buf =
+		ctx->codec.hevc.mv_col_buf =
 			dma_alloc_attrs(dev->dev,
-					ctx->codec.h265.mv_col_buf_size,
-					&ctx->codec.h265.mv_col_buf_addr,
+					ctx->codec.hevc.mv_col_buf_size,
+					&ctx->codec.hevc.mv_col_buf_addr,
 					GFP_KERNEL, DMA_ATTR_NO_KERNEL_MAPPING);
-		if (!ctx->codec.h265.mv_col_buf) {
-			ctx->codec.h265.mv_col_buf_size = 0;
+		if (!ctx->codec.hevc.mv_col_buf) {
+			ctx->codec.hevc.mv_col_buf_size = 0;
 			// TODO: Abort the process here.
 			return;
 		}
 	}
 
-	/* Activate H265 engine. */
-	cedrus_engine_enable(ctx, CEDRUS_CODEC_H265);
+	/* Activate HEVC engine. */
+	cedrus_engine_enable(ctx, CEDRUS_CODEC_HEVC);
 
 	/* Source offset and length in bits. */
 
-	cedrus_write(dev, VE_DEC_H265_BITS_OFFSET, 0);
+	cedrus_write(dev, VE_DEC_HEVC_BITS_OFFSET, 0);
 
 	reg = slice_params->bit_size;
-	cedrus_write(dev, VE_DEC_H265_BITS_LEN, reg);
+	cedrus_write(dev, VE_DEC_HEVC_BITS_LEN, reg);
 
 	/* Source beginning and end addresses. */
 
 	src_buf_addr = vb2_dma_contig_plane_dma_addr(&run->src->vb2_buf, 0);
 
-	reg = VE_DEC_H265_BITS_ADDR_BASE(src_buf_addr);
-	reg |= VE_DEC_H265_BITS_ADDR_VALID_SLICE_DATA;
-	reg |= VE_DEC_H265_BITS_ADDR_LAST_SLICE_DATA;
-	reg |= VE_DEC_H265_BITS_ADDR_FIRST_SLICE_DATA;
+	reg = VE_DEC_HEVC_BITS_ADDR_BASE(src_buf_addr);
+	reg |= VE_DEC_HEVC_BITS_ADDR_VALID_SLICE_DATA;
+	reg |= VE_DEC_HEVC_BITS_ADDR_LAST_SLICE_DATA;
+	reg |= VE_DEC_HEVC_BITS_ADDR_FIRST_SLICE_DATA;
 
-	cedrus_write(dev, VE_DEC_H265_BITS_ADDR, reg);
+	cedrus_write(dev, VE_DEC_HEVC_BITS_ADDR, reg);
 
 	src_buf_end_addr = src_buf_addr +
 			   DIV_ROUND_UP(slice_params->bit_size, 8);
 
-	reg = VE_DEC_H265_BITS_END_ADDR_BASE(src_buf_end_addr);
-	cedrus_write(dev, VE_DEC_H265_BITS_END_ADDR, reg);
+	reg = VE_DEC_HEVC_BITS_END_ADDR_BASE(src_buf_end_addr);
+	cedrus_write(dev, VE_DEC_HEVC_BITS_END_ADDR, reg);
 
 	/* Coding tree block address */
-	reg = VE_DEC_H265_DEC_CTB_ADDR_X(slice_params->slice_segment_addr % width_in_ctb_luma);
-	reg |= VE_DEC_H265_DEC_CTB_ADDR_Y(slice_params->slice_segment_addr / width_in_ctb_luma);
-	cedrus_write(dev, VE_DEC_H265_DEC_CTB_ADDR, reg);
+	reg = VE_DEC_HEVC_DEC_CTB_ADDR_X(slice_params->slice_segment_addr % width_in_ctb_luma);
+	reg |= VE_DEC_HEVC_DEC_CTB_ADDR_Y(slice_params->slice_segment_addr / width_in_ctb_luma);
+	cedrus_write(dev, VE_DEC_HEVC_DEC_CTB_ADDR, reg);
 
-	cedrus_write(dev, VE_DEC_H265_TILE_START_CTB, 0);
-	cedrus_write(dev, VE_DEC_H265_TILE_END_CTB, 0);
+	cedrus_write(dev, VE_DEC_HEVC_TILE_START_CTB, 0);
+	cedrus_write(dev, VE_DEC_HEVC_TILE_END_CTB, 0);
 
 	/* Clear the number of correctly-decoded coding tree blocks. */
 	if (ctx->fh.m2m_ctx->new_frame)
-		cedrus_write(dev, VE_DEC_H265_DEC_CTB_NUM, 0);
+		cedrus_write(dev, VE_DEC_HEVC_DEC_CTB_NUM, 0);
 
 	/* Initialize bitstream access. */
-	cedrus_write(dev, VE_DEC_H265_TRIGGER, VE_DEC_H265_TRIGGER_INIT_SWDEC);
+	cedrus_write(dev, VE_DEC_HEVC_TRIGGER, VE_DEC_HEVC_TRIGGER_INIT_SWDEC);
 
-	cedrus_h265_skip_bits(dev, slice_params->data_bit_offset);
+	cedrus_hevc_skip_bits(dev, slice_params->data_bit_offset);
 
 	/* Bitstream parameters. */
 
-	reg = VE_DEC_H265_DEC_NAL_HDR_NAL_UNIT_TYPE(slice_params->nal_unit_type) |
-	      VE_DEC_H265_DEC_NAL_HDR_NUH_TEMPORAL_ID_PLUS1(slice_params->nuh_temporal_id_plus1);
+	reg = VE_DEC_HEVC_DEC_NAL_HDR_NAL_UNIT_TYPE(slice_params->nal_unit_type) |
+	      VE_DEC_HEVC_DEC_NAL_HDR_NUH_TEMPORAL_ID_PLUS1(slice_params->nuh_temporal_id_plus1);
 
-	cedrus_write(dev, VE_DEC_H265_DEC_NAL_HDR, reg);
+	cedrus_write(dev, VE_DEC_HEVC_DEC_NAL_HDR, reg);
 
 	/* SPS. */
 
-	reg = VE_DEC_H265_DEC_SPS_HDR_MAX_TRANSFORM_HIERARCHY_DEPTH_INTRA(sps->max_transform_hierarchy_depth_intra) |
-	      VE_DEC_H265_DEC_SPS_HDR_MAX_TRANSFORM_HIERARCHY_DEPTH_INTER(sps->max_transform_hierarchy_depth_inter) |
-	      VE_DEC_H265_DEC_SPS_HDR_LOG2_DIFF_MAX_MIN_TRANSFORM_BLOCK_SIZE(sps->log2_diff_max_min_luma_transform_block_size) |
-	      VE_DEC_H265_DEC_SPS_HDR_LOG2_MIN_TRANSFORM_BLOCK_SIZE_MINUS2(sps->log2_min_luma_transform_block_size_minus2) |
-	      VE_DEC_H265_DEC_SPS_HDR_LOG2_DIFF_MAX_MIN_LUMA_CODING_BLOCK_SIZE(sps->log2_diff_max_min_luma_coding_block_size) |
-	      VE_DEC_H265_DEC_SPS_HDR_LOG2_MIN_LUMA_CODING_BLOCK_SIZE_MINUS3(sps->log2_min_luma_coding_block_size_minus3) |
-	      VE_DEC_H265_DEC_SPS_HDR_BIT_DEPTH_CHROMA_MINUS8(sps->bit_depth_chroma_minus8) |
-	      VE_DEC_H265_DEC_SPS_HDR_BIT_DEPTH_LUMA_MINUS8(sps->bit_depth_luma_minus8) |
-	      VE_DEC_H265_DEC_SPS_HDR_CHROMA_FORMAT_IDC(sps->chroma_format_idc);
-
-	reg |= VE_DEC_H265_FLAG(VE_DEC_H265_DEC_SPS_HDR_FLAG_STRONG_INTRA_SMOOTHING_ENABLE,
+	reg = VE_DEC_HEVC_DEC_SPS_HDR_MAX_TRANSFORM_HIERARCHY_DEPTH_INTRA(sps->max_transform_hierarchy_depth_intra) |
+	      VE_DEC_HEVC_DEC_SPS_HDR_MAX_TRANSFORM_HIERARCHY_DEPTH_INTER(sps->max_transform_hierarchy_depth_inter) |
+	      VE_DEC_HEVC_DEC_SPS_HDR_LOG2_DIFF_MAX_MIN_TRANSFORM_BLOCK_SIZE(sps->log2_diff_max_min_luma_transform_block_size) |
+	      VE_DEC_HEVC_DEC_SPS_HDR_LOG2_MIN_TRANSFORM_BLOCK_SIZE_MINUS2(sps->log2_min_luma_transform_block_size_minus2) |
+	      VE_DEC_HEVC_DEC_SPS_HDR_LOG2_DIFF_MAX_MIN_LUMA_CODING_BLOCK_SIZE(sps->log2_diff_max_min_luma_coding_block_size) |
+	      VE_DEC_HEVC_DEC_SPS_HDR_LOG2_MIN_LUMA_CODING_BLOCK_SIZE_MINUS3(sps->log2_min_luma_coding_block_size_minus3) |
+	      VE_DEC_HEVC_DEC_SPS_HDR_BIT_DEPTH_CHROMA_MINUS8(sps->bit_depth_chroma_minus8) |
+	      VE_DEC_HEVC_DEC_SPS_HDR_BIT_DEPTH_LUMA_MINUS8(sps->bit_depth_luma_minus8) |
+	      VE_DEC_HEVC_DEC_SPS_HDR_CHROMA_FORMAT_IDC(sps->chroma_format_idc);
+
+	reg |= VE_DEC_HEVC_FLAG(VE_DEC_HEVC_DEC_SPS_HDR_FLAG_STRONG_INTRA_SMOOTHING_ENABLE,
 				V4L2_HEVC_SPS_FLAG_STRONG_INTRA_SMOOTHING_ENABLED,
 				sps->flags);
 
-	reg |= VE_DEC_H265_FLAG(VE_DEC_H265_DEC_SPS_HDR_FLAG_SPS_TEMPORAL_MVP_ENABLED,
+	reg |= VE_DEC_HEVC_FLAG(VE_DEC_HEVC_DEC_SPS_HDR_FLAG_SPS_TEMPORAL_MVP_ENABLED,
 				V4L2_HEVC_SPS_FLAG_SPS_TEMPORAL_MVP_ENABLED,
 				sps->flags);
 
-	reg |= VE_DEC_H265_FLAG(VE_DEC_H265_DEC_SPS_HDR_FLAG_SAMPLE_ADAPTIVE_OFFSET_ENABLED,
+	reg |= VE_DEC_HEVC_FLAG(VE_DEC_HEVC_DEC_SPS_HDR_FLAG_SAMPLE_ADAPTIVE_OFFSET_ENABLED,
 				V4L2_HEVC_SPS_FLAG_SAMPLE_ADAPTIVE_OFFSET,
 				sps->flags);
 
-	reg |= VE_DEC_H265_FLAG(VE_DEC_H265_DEC_SPS_HDR_FLAG_AMP_ENABLED,
+	reg |= VE_DEC_HEVC_FLAG(VE_DEC_HEVC_DEC_SPS_HDR_FLAG_AMP_ENABLED,
 				V4L2_HEVC_SPS_FLAG_AMP_ENABLED, sps->flags);
 
-	reg |= VE_DEC_H265_FLAG(VE_DEC_H265_DEC_SPS_HDR_FLAG_SEPARATE_COLOUR_PLANE,
+	reg |= VE_DEC_HEVC_FLAG(VE_DEC_HEVC_DEC_SPS_HDR_FLAG_SEPARATE_COLOUR_PLANE,
 				V4L2_HEVC_SPS_FLAG_SEPARATE_COLOUR_PLANE,
 				sps->flags);
 
-	cedrus_write(dev, VE_DEC_H265_DEC_SPS_HDR, reg);
+	cedrus_write(dev, VE_DEC_HEVC_DEC_SPS_HDR, reg);
 
-	reg = VE_DEC_H265_DEC_PCM_CTRL_LOG2_DIFF_MAX_MIN_PCM_LUMA_CODING_BLOCK_SIZE(sps->log2_diff_max_min_pcm_luma_coding_block_size) |
-	      VE_DEC_H265_DEC_PCM_CTRL_LOG2_MIN_PCM_LUMA_CODING_BLOCK_SIZE_MINUS3(sps->log2_min_pcm_luma_coding_block_size_minus3) |
-	      VE_DEC_H265_DEC_PCM_CTRL_PCM_SAMPLE_BIT_DEPTH_CHROMA_MINUS1(sps->pcm_sample_bit_depth_chroma_minus1) |
-	      VE_DEC_H265_DEC_PCM_CTRL_PCM_SAMPLE_BIT_DEPTH_LUMA_MINUS1(sps->pcm_sample_bit_depth_luma_minus1);
+	reg = VE_DEC_HEVC_DEC_PCM_CTRL_LOG2_DIFF_MAX_MIN_PCM_LUMA_CODING_BLOCK_SIZE(sps->log2_diff_max_min_pcm_luma_coding_block_size) |
+	      VE_DEC_HEVC_DEC_PCM_CTRL_LOG2_MIN_PCM_LUMA_CODING_BLOCK_SIZE_MINUS3(sps->log2_min_pcm_luma_coding_block_size_minus3) |
+	      VE_DEC_HEVC_DEC_PCM_CTRL_PCM_SAMPLE_BIT_DEPTH_CHROMA_MINUS1(sps->pcm_sample_bit_depth_chroma_minus1) |
+	      VE_DEC_HEVC_DEC_PCM_CTRL_PCM_SAMPLE_BIT_DEPTH_LUMA_MINUS1(sps->pcm_sample_bit_depth_luma_minus1);
 
-	reg |= VE_DEC_H265_FLAG(VE_DEC_H265_DEC_PCM_CTRL_FLAG_PCM_ENABLED,
+	reg |= VE_DEC_HEVC_FLAG(VE_DEC_HEVC_DEC_PCM_CTRL_FLAG_PCM_ENABLED,
 				V4L2_HEVC_SPS_FLAG_PCM_ENABLED, sps->flags);
 
-	reg |= VE_DEC_H265_FLAG(VE_DEC_H265_DEC_PCM_CTRL_FLAG_PCM_LOOP_FILTER_DISABLED,
+	reg |= VE_DEC_HEVC_FLAG(VE_DEC_HEVC_DEC_PCM_CTRL_FLAG_PCM_LOOP_FILTER_DISABLED,
 				V4L2_HEVC_SPS_FLAG_PCM_LOOP_FILTER_DISABLED,
 				sps->flags);
 
-	cedrus_write(dev, VE_DEC_H265_DEC_PCM_CTRL, reg);
+	cedrus_write(dev, VE_DEC_HEVC_DEC_PCM_CTRL, reg);
 
 	/* PPS. */
 
-	reg = VE_DEC_H265_DEC_PPS_CTRL0_PPS_CR_QP_OFFSET(pps->pps_cr_qp_offset) |
-	      VE_DEC_H265_DEC_PPS_CTRL0_PPS_CB_QP_OFFSET(pps->pps_cb_qp_offset) |
-	      VE_DEC_H265_DEC_PPS_CTRL0_INIT_QP_MINUS26(pps->init_qp_minus26) |
-	      VE_DEC_H265_DEC_PPS_CTRL0_DIFF_CU_QP_DELTA_DEPTH(pps->diff_cu_qp_delta_depth);
+	reg = VE_DEC_HEVC_DEC_PPS_CTRL0_PPS_CR_QP_OFFSET(pps->pps_cr_qp_offset) |
+	      VE_DEC_HEVC_DEC_PPS_CTRL0_PPS_CB_QP_OFFSET(pps->pps_cb_qp_offset) |
+	      VE_DEC_HEVC_DEC_PPS_CTRL0_INIT_QP_MINUS26(pps->init_qp_minus26) |
+	      VE_DEC_HEVC_DEC_PPS_CTRL0_DIFF_CU_QP_DELTA_DEPTH(pps->diff_cu_qp_delta_depth);
 
-	reg |= VE_DEC_H265_FLAG(VE_DEC_H265_DEC_PPS_CTRL0_FLAG_CU_QP_DELTA_ENABLED,
+	reg |= VE_DEC_HEVC_FLAG(VE_DEC_HEVC_DEC_PPS_CTRL0_FLAG_CU_QP_DELTA_ENABLED,
 				V4L2_HEVC_PPS_FLAG_CU_QP_DELTA_ENABLED,
 				pps->flags);
 
-	reg |= VE_DEC_H265_FLAG(VE_DEC_H265_DEC_PPS_CTRL0_FLAG_TRANSFORM_SKIP_ENABLED,
+	reg |= VE_DEC_HEVC_FLAG(VE_DEC_HEVC_DEC_PPS_CTRL0_FLAG_TRANSFORM_SKIP_ENABLED,
 				V4L2_HEVC_PPS_FLAG_TRANSFORM_SKIP_ENABLED,
 				pps->flags);
 
-	reg |= VE_DEC_H265_FLAG(VE_DEC_H265_DEC_PPS_CTRL0_FLAG_CONSTRAINED_INTRA_PRED,
+	reg |= VE_DEC_HEVC_FLAG(VE_DEC_HEVC_DEC_PPS_CTRL0_FLAG_CONSTRAINED_INTRA_PRED,
 				V4L2_HEVC_PPS_FLAG_CONSTRAINED_INTRA_PRED,
 				pps->flags);
 
-	reg |= VE_DEC_H265_FLAG(VE_DEC_H265_DEC_PPS_CTRL0_FLAG_SIGN_DATA_HIDING_ENABLED,
+	reg |= VE_DEC_HEVC_FLAG(VE_DEC_HEVC_DEC_PPS_CTRL0_FLAG_SIGN_DATA_HIDING_ENABLED,
 				V4L2_HEVC_PPS_FLAG_SIGN_DATA_HIDING_ENABLED,
 				pps->flags);
 
-	cedrus_write(dev, VE_DEC_H265_DEC_PPS_CTRL0, reg);
+	cedrus_write(dev, VE_DEC_HEVC_DEC_PPS_CTRL0, reg);
 
-	reg = VE_DEC_H265_DEC_PPS_CTRL1_LOG2_PARALLEL_MERGE_LEVEL_MINUS2(pps->log2_parallel_merge_level_minus2);
+	reg = VE_DEC_HEVC_DEC_PPS_CTRL1_LOG2_PARALLEL_MERGE_LEVEL_MINUS2(pps->log2_parallel_merge_level_minus2);
 
-	reg |= VE_DEC_H265_FLAG(VE_DEC_H265_DEC_PPS_CTRL1_FLAG_PPS_LOOP_FILTER_ACROSS_SLICES_ENABLED,
+	reg |= VE_DEC_HEVC_FLAG(VE_DEC_HEVC_DEC_PPS_CTRL1_FLAG_PPS_LOOP_FILTER_ACROSS_SLICES_ENABLED,
 				V4L2_HEVC_PPS_FLAG_PPS_LOOP_FILTER_ACROSS_SLICES_ENABLED,
 				pps->flags);
 
-	reg |= VE_DEC_H265_FLAG(VE_DEC_H265_DEC_PPS_CTRL1_FLAG_LOOP_FILTER_ACROSS_TILES_ENABLED,
+	reg |= VE_DEC_HEVC_FLAG(VE_DEC_HEVC_DEC_PPS_CTRL1_FLAG_LOOP_FILTER_ACROSS_TILES_ENABLED,
 				V4L2_HEVC_PPS_FLAG_LOOP_FILTER_ACROSS_TILES_ENABLED,
 				pps->flags);
 
-	reg |= VE_DEC_H265_FLAG(VE_DEC_H265_DEC_PPS_CTRL1_FLAG_ENTROPY_CODING_SYNC_ENABLED,
+	reg |= VE_DEC_HEVC_FLAG(VE_DEC_HEVC_DEC_PPS_CTRL1_FLAG_ENTROPY_CODING_SYNC_ENABLED,
 				V4L2_HEVC_PPS_FLAG_ENTROPY_CODING_SYNC_ENABLED,
 				pps->flags);
 
-	/* TODO: VE_DEC_H265_DEC_PPS_CTRL1_FLAG_TILES_ENABLED */
+	/* TODO: VE_DEC_HEVC_DEC_PPS_CTRL1_FLAG_TILES_ENABLED */
 
-	reg |= VE_DEC_H265_FLAG(VE_DEC_H265_DEC_PPS_CTRL1_FLAG_TRANSQUANT_BYPASS_ENABLED,
+	reg |= VE_DEC_HEVC_FLAG(VE_DEC_HEVC_DEC_PPS_CTRL1_FLAG_TRANSQUANT_BYPASS_ENABLED,
 				V4L2_HEVC_PPS_FLAG_TRANSQUANT_BYPASS_ENABLED,
 				pps->flags);
 
-	reg |= VE_DEC_H265_FLAG(VE_DEC_H265_DEC_PPS_CTRL1_FLAG_WEIGHTED_BIPRED,
+	reg |= VE_DEC_HEVC_FLAG(VE_DEC_HEVC_DEC_PPS_CTRL1_FLAG_WEIGHTED_BIPRED,
 				V4L2_HEVC_PPS_FLAG_WEIGHTED_BIPRED, pps->flags);
 
-	reg |= VE_DEC_H265_FLAG(VE_DEC_H265_DEC_PPS_CTRL1_FLAG_WEIGHTED_PRED,
+	reg |= VE_DEC_HEVC_FLAG(VE_DEC_HEVC_DEC_PPS_CTRL1_FLAG_WEIGHTED_PRED,
 				V4L2_HEVC_PPS_FLAG_WEIGHTED_PRED, pps->flags);
 
-	cedrus_write(dev, VE_DEC_H265_DEC_PPS_CTRL1, reg);
+	cedrus_write(dev, VE_DEC_HEVC_DEC_PPS_CTRL1, reg);
 
 	/* Slice Parameters. */
 
-	reg = VE_DEC_H265_DEC_SLICE_HDR_INFO0_PICTURE_TYPE(slice_params->pic_struct) |
-	      VE_DEC_H265_DEC_SLICE_HDR_INFO0_FIVE_MINUS_MAX_NUM_MERGE_CAND(slice_params->five_minus_max_num_merge_cand) |
-	      VE_DEC_H265_DEC_SLICE_HDR_INFO0_NUM_REF_IDX_L1_ACTIVE_MINUS1(slice_params->num_ref_idx_l1_active_minus1) |
-	      VE_DEC_H265_DEC_SLICE_HDR_INFO0_NUM_REF_IDX_L0_ACTIVE_MINUS1(slice_params->num_ref_idx_l0_active_minus1) |
-	      VE_DEC_H265_DEC_SLICE_HDR_INFO0_COLLOCATED_REF_IDX(slice_params->collocated_ref_idx) |
-	      VE_DEC_H265_DEC_SLICE_HDR_INFO0_COLOUR_PLANE_ID(slice_params->colour_plane_id) |
-	      VE_DEC_H265_DEC_SLICE_HDR_INFO0_SLICE_TYPE(slice_params->slice_type);
+	reg = VE_DEC_HEVC_DEC_SLICE_HDR_INFO0_PICTURE_TYPE(slice_params->pic_struct) |
+	      VE_DEC_HEVC_DEC_SLICE_HDR_INFO0_FIVE_MINUS_MAX_NUM_MERGE_CAND(slice_params->five_minus_max_num_merge_cand) |
+	      VE_DEC_HEVC_DEC_SLICE_HDR_INFO0_NUM_REF_IDX_L1_ACTIVE_MINUS1(slice_params->num_ref_idx_l1_active_minus1) |
+	      VE_DEC_HEVC_DEC_SLICE_HDR_INFO0_NUM_REF_IDX_L0_ACTIVE_MINUS1(slice_params->num_ref_idx_l0_active_minus1) |
+	      VE_DEC_HEVC_DEC_SLICE_HDR_INFO0_COLLOCATED_REF_IDX(slice_params->collocated_ref_idx) |
+	      VE_DEC_HEVC_DEC_SLICE_HDR_INFO0_COLOUR_PLANE_ID(slice_params->colour_plane_id) |
+	      VE_DEC_HEVC_DEC_SLICE_HDR_INFO0_SLICE_TYPE(slice_params->slice_type);
 
-	reg |= VE_DEC_H265_FLAG(VE_DEC_H265_DEC_SLICE_HDR_INFO0_FLAG_COLLOCATED_FROM_L0,
+	reg |= VE_DEC_HEVC_FLAG(VE_DEC_HEVC_DEC_SLICE_HDR_INFO0_FLAG_COLLOCATED_FROM_L0,
 				V4L2_HEVC_SLICE_PARAMS_FLAG_COLLOCATED_FROM_L0,
 				slice_params->flags);
 
-	reg |= VE_DEC_H265_FLAG(VE_DEC_H265_DEC_SLICE_HDR_INFO0_FLAG_CABAC_INIT,
+	reg |= VE_DEC_HEVC_FLAG(VE_DEC_HEVC_DEC_SLICE_HDR_INFO0_FLAG_CABAC_INIT,
 				V4L2_HEVC_SLICE_PARAMS_FLAG_CABAC_INIT,
 				slice_params->flags);
 
-	reg |= VE_DEC_H265_FLAG(VE_DEC_H265_DEC_SLICE_HDR_INFO0_FLAG_MVD_L1_ZERO,
+	reg |= VE_DEC_HEVC_FLAG(VE_DEC_HEVC_DEC_SLICE_HDR_INFO0_FLAG_MVD_L1_ZERO,
 				V4L2_HEVC_SLICE_PARAMS_FLAG_MVD_L1_ZERO,
 				slice_params->flags);
 
-	reg |= VE_DEC_H265_FLAG(VE_DEC_H265_DEC_SLICE_HDR_INFO0_FLAG_SLICE_SAO_CHROMA,
+	reg |= VE_DEC_HEVC_FLAG(VE_DEC_HEVC_DEC_SLICE_HDR_INFO0_FLAG_SLICE_SAO_CHROMA,
 				V4L2_HEVC_SLICE_PARAMS_FLAG_SLICE_SAO_CHROMA,
 				slice_params->flags);
 
-	reg |= VE_DEC_H265_FLAG(VE_DEC_H265_DEC_SLICE_HDR_INFO0_FLAG_SLICE_SAO_LUMA,
+	reg |= VE_DEC_HEVC_FLAG(VE_DEC_HEVC_DEC_SLICE_HDR_INFO0_FLAG_SLICE_SAO_LUMA,
 				V4L2_HEVC_SLICE_PARAMS_FLAG_SLICE_SAO_LUMA,
 				slice_params->flags);
 
-	reg |= VE_DEC_H265_FLAG(VE_DEC_H265_DEC_SLICE_HDR_INFO0_FLAG_SLICE_TEMPORAL_MVP_ENABLE,
+	reg |= VE_DEC_HEVC_FLAG(VE_DEC_HEVC_DEC_SLICE_HDR_INFO0_FLAG_SLICE_TEMPORAL_MVP_ENABLE,
 				V4L2_HEVC_SLICE_PARAMS_FLAG_SLICE_TEMPORAL_MVP_ENABLED,
 				slice_params->flags);
 
-	reg |= VE_DEC_H265_FLAG(VE_DEC_H265_DEC_SLICE_HDR_INFO0_FLAG_DEPENDENT_SLICE_SEGMENT,
+	reg |= VE_DEC_HEVC_FLAG(VE_DEC_HEVC_DEC_SLICE_HDR_INFO0_FLAG_DEPENDENT_SLICE_SEGMENT,
 				V4L2_HEVC_SLICE_PARAMS_FLAG_DEPENDENT_SLICE_SEGMENT,
 				slice_params->flags);
 
 	if (ctx->fh.m2m_ctx->new_frame)
-		reg |= VE_DEC_H265_DEC_SLICE_HDR_INFO0_FLAG_FIRST_SLICE_SEGMENT_IN_PIC;
+		reg |= VE_DEC_HEVC_DEC_SLICE_HDR_INFO0_FLAG_FIRST_SLICE_SEGMENT_IN_PIC;
 
-	cedrus_write(dev, VE_DEC_H265_DEC_SLICE_HDR_INFO0, reg);
+	cedrus_write(dev, VE_DEC_HEVC_DEC_SLICE_HDR_INFO0, reg);
 
-	reg = VE_DEC_H265_DEC_SLICE_HDR_INFO1_SLICE_TC_OFFSET_DIV2(slice_params->slice_tc_offset_div2) |
-	      VE_DEC_H265_DEC_SLICE_HDR_INFO1_SLICE_BETA_OFFSET_DIV2(slice_params->slice_beta_offset_div2) |
-	      VE_DEC_H265_DEC_SLICE_HDR_INFO1_SLICE_POC_BIGEST_IN_RPS_ST(decode_params->num_poc_st_curr_after == 0) |
-	      VE_DEC_H265_DEC_SLICE_HDR_INFO1_SLICE_CR_QP_OFFSET(slice_params->slice_cr_qp_offset) |
-	      VE_DEC_H265_DEC_SLICE_HDR_INFO1_SLICE_CB_QP_OFFSET(slice_params->slice_cb_qp_offset) |
-	      VE_DEC_H265_DEC_SLICE_HDR_INFO1_SLICE_QP_DELTA(slice_params->slice_qp_delta);
+	reg = VE_DEC_HEVC_DEC_SLICE_HDR_INFO1_SLICE_TC_OFFSET_DIV2(slice_params->slice_tc_offset_div2) |
+	      VE_DEC_HEVC_DEC_SLICE_HDR_INFO1_SLICE_BETA_OFFSET_DIV2(slice_params->slice_beta_offset_div2) |
+	      VE_DEC_HEVC_DEC_SLICE_HDR_INFO1_SLICE_POC_BIGEST_IN_RPS_ST(decode_params->num_poc_st_curr_after == 0) |
+	      VE_DEC_HEVC_DEC_SLICE_HDR_INFO1_SLICE_CR_QP_OFFSET(slice_params->slice_cr_qp_offset) |
+	      VE_DEC_HEVC_DEC_SLICE_HDR_INFO1_SLICE_CB_QP_OFFSET(slice_params->slice_cb_qp_offset) |
+	      VE_DEC_HEVC_DEC_SLICE_HDR_INFO1_SLICE_QP_DELTA(slice_params->slice_qp_delta);
 
-	reg |= VE_DEC_H265_FLAG(VE_DEC_H265_DEC_SLICE_HDR_INFO1_FLAG_SLICE_DEBLOCKING_FILTER_DISABLED,
+	reg |= VE_DEC_HEVC_FLAG(VE_DEC_HEVC_DEC_SLICE_HDR_INFO1_FLAG_SLICE_DEBLOCKING_FILTER_DISABLED,
 				V4L2_HEVC_SLICE_PARAMS_FLAG_SLICE_DEBLOCKING_FILTER_DISABLED,
 				slice_params->flags);
 
-	reg |= VE_DEC_H265_FLAG(VE_DEC_H265_DEC_SLICE_HDR_INFO1_FLAG_SLICE_LOOP_FILTER_ACROSS_SLICES_ENABLED,
+	reg |= VE_DEC_HEVC_FLAG(VE_DEC_HEVC_DEC_SLICE_HDR_INFO1_FLAG_SLICE_LOOP_FILTER_ACROSS_SLICES_ENABLED,
 				V4L2_HEVC_SLICE_PARAMS_FLAG_SLICE_LOOP_FILTER_ACROSS_SLICES_ENABLED,
 				slice_params->flags);
 
-	cedrus_write(dev, VE_DEC_H265_DEC_SLICE_HDR_INFO1, reg);
+	cedrus_write(dev, VE_DEC_HEVC_DEC_SLICE_HDR_INFO1, reg);
 
 	chroma_log2_weight_denom = pred_weight_table->luma_log2_weight_denom +
 				   pred_weight_table->delta_chroma_log2_weight_denom;
-	reg = VE_DEC_H265_DEC_SLICE_HDR_INFO2_NUM_ENTRY_POINT_OFFSETS(0) |
-	      VE_DEC_H265_DEC_SLICE_HDR_INFO2_CHROMA_LOG2_WEIGHT_DENOM(chroma_log2_weight_denom) |
-	      VE_DEC_H265_DEC_SLICE_HDR_INFO2_LUMA_LOG2_WEIGHT_DENOM(pred_weight_table->luma_log2_weight_denom);
+	reg = VE_DEC_HEVC_DEC_SLICE_HDR_INFO2_NUM_ENTRY_POINT_OFFSETS(0) |
+	      VE_DEC_HEVC_DEC_SLICE_HDR_INFO2_CHROMA_LOG2_WEIGHT_DENOM(chroma_log2_weight_denom) |
+	      VE_DEC_HEVC_DEC_SLICE_HDR_INFO2_LUMA_LOG2_WEIGHT_DENOM(pred_weight_table->luma_log2_weight_denom);
 
-	cedrus_write(dev, VE_DEC_H265_DEC_SLICE_HDR_INFO2, reg);
+	cedrus_write(dev, VE_DEC_HEVC_DEC_SLICE_HDR_INFO2, reg);
 
 	/* Decoded picture size. */
 
-	reg = VE_DEC_H265_DEC_PIC_SIZE_WIDTH(ctx->src_fmt.width) |
-	      VE_DEC_H265_DEC_PIC_SIZE_HEIGHT(ctx->src_fmt.height);
+	reg = VE_DEC_HEVC_DEC_PIC_SIZE_WIDTH(ctx->src_fmt.width) |
+	      VE_DEC_HEVC_DEC_PIC_SIZE_HEIGHT(ctx->src_fmt.height);
 
-	cedrus_write(dev, VE_DEC_H265_DEC_PIC_SIZE, reg);
+	cedrus_write(dev, VE_DEC_HEVC_DEC_PIC_SIZE, reg);
 
 	/* Scaling list. */
 
 	if (sps->flags & V4L2_HEVC_SPS_FLAG_SCALING_LIST_ENABLED) {
-		cedrus_h265_write_scaling_list(ctx, run);
-		reg = VE_DEC_H265_SCALING_LIST_CTRL0_FLAG_ENABLED;
+		cedrus_hevc_write_scaling_list(ctx, run);
+		reg = VE_DEC_HEVC_SCALING_LIST_CTRL0_FLAG_ENABLED;
 	} else {
-		reg = VE_DEC_H265_SCALING_LIST_CTRL0_DEFAULT;
+		reg = VE_DEC_HEVC_SCALING_LIST_CTRL0_DEFAULT;
 	}
-	cedrus_write(dev, VE_DEC_H265_SCALING_LIST_CTRL0, reg);
+	cedrus_write(dev, VE_DEC_HEVC_SCALING_LIST_CTRL0, reg);
 
 	/* Neightbor information address. */
-	reg = VE_DEC_H265_NEIGHBOR_INFO_ADDR_BASE(ctx->codec.h265.neighbor_info_buf_addr);
-	cedrus_write(dev, VE_DEC_H265_NEIGHBOR_INFO_ADDR, reg);
+	reg = VE_DEC_HEVC_NEIGHBOR_INFO_ADDR_BASE(ctx->codec.hevc.neighbor_info_buf_addr);
+	cedrus_write(dev, VE_DEC_HEVC_NEIGHBOR_INFO_ADDR, reg);
 
 	/* Write decoded picture buffer in pic list. */
-	cedrus_h265_frame_info_write_dpb(ctx, decode_params->dpb,
+	cedrus_hevc_frame_info_write_dpb(ctx, decode_params->dpb,
 					 decode_params->num_active_dpb_entries);
 
 	/* Output frame. */
@@ -613,104 +613,104 @@ static void cedrus_h265_setup(struct cedrus_ctx *ctx,
 	pic_order_cnt[0] = slice_params->slice_pic_order_cnt;
 	pic_order_cnt[1] = slice_params->slice_pic_order_cnt;
 
-	cedrus_h265_frame_info_write_single(ctx, output_pic_list_index,
+	cedrus_hevc_frame_info_write_single(ctx, output_pic_list_index,
 					    slice_params->pic_struct != 0,
 					    pic_order_cnt,
 					    run->dst->vb2_buf.index);
 
-	cedrus_write(dev, VE_DEC_H265_OUTPUT_FRAME_IDX, output_pic_list_index);
+	cedrus_write(dev, VE_DEC_HEVC_OUTPUT_FRAME_IDX, output_pic_list_index);
 
 	/* Reference picture list 0 (for P/B frames). */
 	if (slice_params->slice_type != V4L2_HEVC_SLICE_TYPE_I) {
-		cedrus_h265_ref_pic_list_write(dev, decode_params->dpb,
+		cedrus_hevc_ref_pic_list_write(dev, decode_params->dpb,
 					       slice_params->ref_idx_l0,
 					       slice_params->num_ref_idx_l0_active_minus1 + 1,
-					       VE_DEC_H265_SRAM_OFFSET_REF_PIC_LIST0);
+					       VE_DEC_HEVC_SRAM_OFFSET_REF_PIC_LIST0);
 
 		if ((pps->flags & V4L2_HEVC_PPS_FLAG_WEIGHTED_PRED) ||
 		    (pps->flags & V4L2_HEVC_PPS_FLAG_WEIGHTED_BIPRED))
-			cedrus_h265_pred_weight_write(dev,
+			cedrus_hevc_pred_weight_write(dev,
 						      pred_weight_table->delta_luma_weight_l0,
 						      pred_weight_table->luma_offset_l0,
 						      pred_weight_table->delta_chroma_weight_l0,
 						      pred_weight_table->chroma_offset_l0,
 						      slice_params->num_ref_idx_l0_active_minus1 + 1,
-						      VE_DEC_H265_SRAM_OFFSET_PRED_WEIGHT_LUMA_L0,
-						      VE_DEC_H265_SRAM_OFFSET_PRED_WEIGHT_CHROMA_L0);
+						      VE_DEC_HEVC_SRAM_OFFSET_PRED_WEIGHT_LUMA_L0,
+						      VE_DEC_HEVC_SRAM_OFFSET_PRED_WEIGHT_CHROMA_L0);
 	}
 
 	/* Reference picture list 1 (for B frames). */
 	if (slice_params->slice_type == V4L2_HEVC_SLICE_TYPE_B) {
-		cedrus_h265_ref_pic_list_write(dev, decode_params->dpb,
+		cedrus_hevc_ref_pic_list_write(dev, decode_params->dpb,
 					       slice_params->ref_idx_l1,
 					       slice_params->num_ref_idx_l1_active_minus1 + 1,
-					       VE_DEC_H265_SRAM_OFFSET_REF_PIC_LIST1);
+					       VE_DEC_HEVC_SRAM_OFFSET_REF_PIC_LIST1);
 
 		if (pps->flags & V4L2_HEVC_PPS_FLAG_WEIGHTED_BIPRED)
-			cedrus_h265_pred_weight_write(dev,
+			cedrus_hevc_pred_weight_write(dev,
 						      pred_weight_table->delta_luma_weight_l1,
 						      pred_weight_table->luma_offset_l1,
 						      pred_weight_table->delta_chroma_weight_l1,
 						      pred_weight_table->chroma_offset_l1,
 						      slice_params->num_ref_idx_l1_active_minus1 + 1,
-						      VE_DEC_H265_SRAM_OFFSET_PRED_WEIGHT_LUMA_L1,
-						      VE_DEC_H265_SRAM_OFFSET_PRED_WEIGHT_CHROMA_L1);
+						      VE_DEC_HEVC_SRAM_OFFSET_PRED_WEIGHT_LUMA_L1,
+						      VE_DEC_HEVC_SRAM_OFFSET_PRED_WEIGHT_CHROMA_L1);
 	}
 
 	/* Enable appropriate interruptions. */
-	cedrus_write(dev, VE_DEC_H265_CTRL, VE_DEC_H265_CTRL_IRQ_MASK);
+	cedrus_write(dev, VE_DEC_HEVC_CTRL, VE_DEC_HEVC_CTRL_IRQ_MASK);
 }
 
-static int cedrus_h265_start(struct cedrus_ctx *ctx)
+static int cedrus_hevc_start(struct cedrus_ctx *ctx)
 {
 	struct cedrus_dev *dev = ctx->dev;
 
 	/* The buffer size is calculated at setup time. */
-	ctx->codec.h265.mv_col_buf_size = 0;
+	ctx->codec.hevc.mv_col_buf_size = 0;
 
 	/* Buffer is never accessed by CPU, so we can skip kernel mapping. */
-	ctx->codec.h265.neighbor_info_buf =
-		dma_alloc_attrs(dev->dev, CEDRUS_H265_NEIGHBOR_INFO_BUF_SIZE,
-				&ctx->codec.h265.neighbor_info_buf_addr,
+	ctx->codec.hevc.neighbor_info_buf =
+		dma_alloc_attrs(dev->dev, CEDRUS_HEVC_NEIGHBOR_INFO_BUF_SIZE,
+				&ctx->codec.hevc.neighbor_info_buf_addr,
 				GFP_KERNEL, DMA_ATTR_NO_KERNEL_MAPPING);
-	if (!ctx->codec.h265.neighbor_info_buf)
+	if (!ctx->codec.hevc.neighbor_info_buf)
 		return -ENOMEM;
 
 	return 0;
 }
 
-static void cedrus_h265_stop(struct cedrus_ctx *ctx)
+static void cedrus_hevc_stop(struct cedrus_ctx *ctx)
 {
 	struct cedrus_dev *dev = ctx->dev;
 
-	if (ctx->codec.h265.mv_col_buf_size > 0) {
-		dma_free_attrs(dev->dev, ctx->codec.h265.mv_col_buf_size,
-			       ctx->codec.h265.mv_col_buf,
-			       ctx->codec.h265.mv_col_buf_addr,
+	if (ctx->codec.hevc.mv_col_buf_size > 0) {
+		dma_free_attrs(dev->dev, ctx->codec.hevc.mv_col_buf_size,
+			       ctx->codec.hevc.mv_col_buf,
+			       ctx->codec.hevc.mv_col_buf_addr,
 			       DMA_ATTR_NO_KERNEL_MAPPING);
 
-		ctx->codec.h265.mv_col_buf_size = 0;
+		ctx->codec.hevc.mv_col_buf_size = 0;
 	}
 
-	dma_free_attrs(dev->dev, CEDRUS_H265_NEIGHBOR_INFO_BUF_SIZE,
-		       ctx->codec.h265.neighbor_info_buf,
-		       ctx->codec.h265.neighbor_info_buf_addr,
+	dma_free_attrs(dev->dev, CEDRUS_HEVC_NEIGHBOR_INFO_BUF_SIZE,
+		       ctx->codec.hevc.neighbor_info_buf,
+		       ctx->codec.hevc.neighbor_info_buf_addr,
 		       DMA_ATTR_NO_KERNEL_MAPPING);
 }
 
-static void cedrus_h265_trigger(struct cedrus_ctx *ctx)
+static void cedrus_hevc_trigger(struct cedrus_ctx *ctx)
 {
 	struct cedrus_dev *dev = ctx->dev;
 
-	cedrus_write(dev, VE_DEC_H265_TRIGGER, VE_DEC_H265_TRIGGER_DEC_SLICE);
+	cedrus_write(dev, VE_DEC_HEVC_TRIGGER, VE_DEC_HEVC_TRIGGER_DEC_SLICE);
 }
 
-struct cedrus_dec_ops cedrus_dec_ops_h265 = {
-	.irq_clear	= cedrus_h265_irq_clear,
-	.irq_disable	= cedrus_h265_irq_disable,
-	.irq_status	= cedrus_h265_irq_status,
-	.setup		= cedrus_h265_setup,
-	.start		= cedrus_h265_start,
-	.stop		= cedrus_h265_stop,
-	.trigger	= cedrus_h265_trigger,
+struct cedrus_dec_ops cedrus_dec_ops_hevc = {
+	.irq_clear	= cedrus_hevc_irq_clear,
+	.irq_disable	= cedrus_hevc_irq_disable,
+	.irq_status	= cedrus_hevc_irq_status,
+	.setup		= cedrus_hevc_setup,
+	.start		= cedrus_hevc_start,
+	.stop		= cedrus_hevc_stop,
+	.trigger	= cedrus_hevc_trigger,
 };
-- 
2.25.1

