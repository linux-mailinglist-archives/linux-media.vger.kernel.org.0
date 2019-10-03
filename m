Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23A84CAEE9
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 21:09:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732952AbfJCTJO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 15:09:14 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:45138 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732733AbfJCTJO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 15:09:14 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id C962B28E58A
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     kernel@collabora.com, Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Chris Healy <cphealy@gmail.com>, linux-kernel@vger.kernel.org,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v2 4/4] media: hantro: Support color conversion via post-processing
Date:   Thu,  3 Oct 2019 16:08:33 -0300
Message-Id: <20191003190833.29046-5-ezequiel@collabora.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191003190833.29046-1-ezequiel@collabora.com>
References: <20191003190833.29046-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Hantro G1 decoder is able to enable a post-processor
on the decoding pipeline, which can be used to perform
scaling and color conversion.

The post-processor is integrated to the decoder, and it's
possible to use it in a way that is completely transparent
to the user.

This commit enables color conversion via post-processing,
which means the driver now exposes YUV packed, in addition to NV12.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/staging/media/hantro/Makefile         |   1 +
 drivers/staging/media/hantro/hantro.h         |  84 ++++++++++-
 drivers/staging/media/hantro/hantro_drv.c     |  90 ++++++++++-
 .../staging/media/hantro/hantro_g1_h264_dec.c |   2 +-
 .../media/hantro/hantro_g1_mpeg2_dec.c        |   2 +-
 drivers/staging/media/hantro/hantro_g1_regs.h |  51 +++++++
 .../staging/media/hantro/hantro_g1_vp8_dec.c  |   2 +-
 drivers/staging/media/hantro/hantro_h264.c    |   6 +-
 drivers/staging/media/hantro/hantro_hw.h      |  13 ++
 .../staging/media/hantro/hantro_postproc.c    | 141 ++++++++++++++++++
 drivers/staging/media/hantro/hantro_v4l2.c    |  47 +++++-
 drivers/staging/media/hantro/rk3288_vpu_hw.c  |  10 ++
 12 files changed, 436 insertions(+), 13 deletions(-)
 create mode 100644 drivers/staging/media/hantro/hantro_postproc.c

diff --git a/drivers/staging/media/hantro/Makefile b/drivers/staging/media/hantro/Makefile
index 5d6b0383d280..496b30c3c396 100644
--- a/drivers/staging/media/hantro/Makefile
+++ b/drivers/staging/media/hantro/Makefile
@@ -3,6 +3,7 @@ obj-$(CONFIG_VIDEO_HANTRO) += hantro-vpu.o
 hantro-vpu-y += \
 		hantro_drv.o \
 		hantro_v4l2.o \
+		hantro_postproc.o \
 		hantro_h1_jpeg_enc.o \
 		hantro_g1_h264_dec.o \
 		hantro_g1_mpeg2_dec.o \
diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
index 15506b9a34f4..9b8b3a01b0cc 100644
--- a/drivers/staging/media/hantro/hantro.h
+++ b/drivers/staging/media/hantro/hantro.h
@@ -60,6 +60,8 @@ struct hantro_irq {
  * @num_enc_fmts:		Number of encoder formats.
  * @dec_fmts:			Decoder formats.
  * @num_dec_fmts:		Number of decoder formats.
+ * @postproc_fmts:		Post-processor formats.
+ * @num_postproc_fmts:		Number of post-processor formats.
  * @codec:			Supported codecs
  * @codec_ops:			Codec ops.
  * @init:			Initialize hardware.
@@ -70,6 +72,7 @@ struct hantro_irq {
  * @num_clocks:			number of clocks in the array
  * @reg_names:			array of register range names
  * @num_regs:			number of register range names in the array
+ * @postproc_regs:		&struct hantro_postproc_regs pointer
  */
 struct hantro_variant {
 	unsigned int enc_offset;
@@ -78,6 +81,8 @@ struct hantro_variant {
 	unsigned int num_enc_fmts;
 	const struct hantro_fmt *dec_fmts;
 	unsigned int num_dec_fmts;
+	const struct hantro_fmt *postproc_fmts;
+	unsigned int num_postproc_fmts;
 	unsigned int codec;
 	const struct hantro_codec_ops *codec_ops;
 	int (*init)(struct hantro_dev *vpu);
@@ -88,6 +93,7 @@ struct hantro_variant {
 	int num_clocks;
 	const char * const *reg_names;
 	int num_regs;
+	const struct hantro_postproc_regs *postproc_regs;
 };
 
 /**
@@ -127,6 +133,8 @@ struct hantro_ctrl {
  * @vdev_pads:		&struct media_pad with the @vdev pads.
  * @sd_proc:		&struct v4l2_subdev exposing the encoder or decoder sub-device
  * @sd_proc_pads:	&struct media_pad with the @sd_proc pads.
+ * @sd_postproc:	&struct v4l2_subdev exposing the post-proc sub-device
+ * @sd_postproc_pads:	&struct media_pad with the @sd_postproc pads.
  *
  * Contains everything needed to attach the video device to the media device.
  */
@@ -137,6 +145,9 @@ struct hantro_func {
 
 	struct v4l2_subdev sd_proc;
 	struct media_pad sd_proc_pads[2];
+
+	struct v4l2_subdev sd_postproc;
+	struct media_pad sd_postproc_pads[2];
 };
 
 static inline struct hantro_func *
@@ -145,6 +156,12 @@ hantro_vdev_to_func(struct video_device *vdev)
 	return container_of(vdev, struct hantro_func, vdev);
 }
 
+enum hantro_decoder_mode {
+	HANTRO_NONE_MODE = 0x0,
+	HANTRO_DECODER_ONLY_MODE = 0x1,
+	HANTRO_POSTPROC_MODE = 0x2,
+};
+
 /**
  * struct hantro_dev - driver data
  * @v4l2_dev:		V4L2 device to register video devices for.
@@ -160,6 +177,7 @@ hantro_vdev_to_func(struct video_device *vdev)
  * @enc_base:		Mapped address of VPU encoder register for convenience.
  * @dec_base:		Mapped address of VPU decoder register for convenience.
  * @ctrl_base:		Mapped address of VPU control block.
+ * @dec_mode:		Decoder mode, specifies if post-processor is pipelined.
  * @vpu_mutex:		Mutex to synchronize V4L2 calls.
  * @irqlock:		Spinlock to synchronize access to data structures
  *			shared with interrupt handlers.
@@ -180,6 +198,7 @@ struct hantro_dev {
 	void __iomem *dec_base;
 	void __iomem *ctrl_base;
 
+	enum hantro_decoder_mode dec_mode;
 	struct mutex vpu_mutex;	/* video_device lock */
 	spinlock_t irqlock;
 	const struct hantro_variant *variant;
@@ -207,6 +226,7 @@ struct hantro_dev {
  *			context, and it's called right before
  *			calling v4l2_m2m_job_finish.
  * @codec_ops:		Set of operations related to codec mode.
+ * @postproc:		Post-processing context.
  * @jpeg_enc:		JPEG-encoding context.
  * @mpeg2_dec:		MPEG-2-decoding context.
  * @vp8_dec:		VP8-decoding context.
@@ -232,6 +252,7 @@ struct hantro_ctx {
 			  unsigned int bytesused);
 
 	const struct hantro_codec_ops *codec_ops;
+	struct hantro_postproc_ctx postproc;
 
 	/* Specific for particular codec modes. */
 	union {
@@ -269,6 +290,23 @@ struct hantro_reg {
 	u32 mask;
 };
 
+struct hantro_postproc_regs {
+	struct hantro_reg pipeline_en;
+	struct hantro_reg max_burst;
+	struct hantro_reg clk_gate;
+	struct hantro_reg out_swap32;
+	struct hantro_reg out_endian;
+	struct hantro_reg out_luma_base;
+	struct hantro_reg input_width;
+	struct hantro_reg input_height;
+	struct hantro_reg output_width;
+	struct hantro_reg output_height;
+	struct hantro_reg input_fmt;
+	struct hantro_reg output_fmt;
+	struct hantro_reg orig_width;
+	struct hantro_reg display_width;
+};
+
 /* Logging helpers */
 
 /**
@@ -347,9 +385,23 @@ static inline u32 vdpu_read(struct hantro_dev *vpu, u32 reg)
 	return val;
 }
 
-static inline void hantro_reg_write(struct hantro_dev *vpu,
-				    const struct hantro_reg *reg,
-				    u32 val)
+static inline void
+hantro_reg_write(struct hantro_dev *vpu,
+		 const struct hantro_reg *reg,
+		 u32 val)
+{
+	u32 v;
+
+	v = vdpu_read(vpu, reg->base);
+	v &= ~(reg->mask << reg->shift);
+	v |= ((val & reg->mask) << reg->shift);
+	vdpu_write(vpu, v, reg->base);
+}
+
+static inline void
+hantro_reg_write_relaxed(struct hantro_dev *vpu,
+			 const struct hantro_reg *reg,
+			 u32 val)
 {
 	u32 v;
 
@@ -376,4 +428,30 @@ hantro_get_dst_buf(struct hantro_ctx *ctx)
 	return v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
 }
 
+static inline bool
+hantro_postproc_enabled(const struct hantro_ctx *ctx)
+{
+	return ctx->dev->dec_mode == HANTRO_POSTPROC_MODE;
+}
+
+static inline bool
+hantro_needs_postproc(struct hantro_ctx *ctx)
+{
+	return hantro_postproc_enabled(ctx) &&
+		ctx->vpu_dst_fmt->fourcc != V4L2_PIX_FMT_NV12;
+}
+
+static inline dma_addr_t
+hantro_get_dec_buf_addr(struct hantro_ctx *ctx, struct vb2_buffer *vb)
+{
+	if (hantro_needs_postproc(ctx))
+		return ctx->postproc.dec_q[vb->index].dma;
+	return vb2_dma_contig_plane_dma_addr(vb, 0);
+}
+
+void hantro_postproc_disable(struct hantro_ctx *ctx);
+void hantro_postproc_setup(struct hantro_ctx *ctx);
+void hantro_postproc_free(struct hantro_ctx *ctx);
+int hantro_postproc_alloc(struct hantro_ctx *ctx);
+
 #endif /* HANTRO_H_ */
diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index 35beb5a9bf52..e72915cd3d99 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -53,7 +53,7 @@ dma_addr_t hantro_get_ref(struct hantro_ctx *ctx, u64 ts)
 	if (index < 0)
 		return 0;
 	buf = vb2_get_buffer(q, index);
-	return vb2_dma_contig_plane_dma_addr(buf, 0);
+	return hantro_get_dec_buf_addr(ctx, buf);
 }
 
 static int
@@ -159,12 +159,18 @@ void hantro_prepare_run(struct hantro_ctx *ctx)
 	src_buf = hantro_get_src_buf(ctx);
 	v4l2_ctrl_request_setup(src_buf->vb2_buf.req_obj.req,
 				&ctx->ctrl_handler);
+
+	if (!hantro_needs_postproc(ctx))
+		hantro_postproc_disable(ctx);
 }
 
 void hantro_finish_run(struct hantro_ctx *ctx)
 {
 	struct vb2_v4l2_buffer *src_buf;
 
+	if (hantro_needs_postproc(ctx))
+		hantro_postproc_setup(ctx);
+
 	src_buf = hantro_get_src_buf(ctx);
 	v4l2_ctrl_request_complete(src_buf->vb2_buf.req_obj.req,
 				   &ctx->ctrl_handler);
@@ -382,6 +388,7 @@ static int hantro_ctrls_setup(struct hantro_dev *vpu,
 			return ctx->ctrl_handler.error;
 		}
 	}
+
 	return v4l2_ctrl_handler_setup(&ctx->ctrl_handler);
 }
 
@@ -492,7 +499,65 @@ static int link_setup(struct media_entity *entity,
 		      const struct media_pad *local,
 		      const struct media_pad *remote, u32 flags)
 {
-	/* empty for now */
+	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
+	struct hantro_dev *vpu = v4l2_get_subdevdata(sd);
+	bool enable = flags & MEDIA_LNK_FL_ENABLED;
+	unsigned int new_mode, mode_mask, mode_set;
+
+	/*
+	 * This device topology is quite simple, and the non-immutable
+	 * links are just two: decoder to v4l and post-processor to v4l.
+	 *
+	 * There are tree possible states:
+	 * - [Decoder] -> [Post-processor] -> V4L
+	 * - [Decoder] -> V4L
+	 * - [] -> V4L
+	 *
+	 * In the first case, the post-processor is enabled in the data path
+	 * and can produce other pixel formats. When the post-processor is
+	 * used, more memory is in-use due to the extra buffers required.
+	 *
+	 * In the second case, only the decoder is enabled, so only the decoder
+	 * native pixel format is available.
+	 *
+	 * The last case is when neither the decoder,
+	 * nor the post-processor is connected to the V4L device,
+	 * and enabled.
+	 *
+	 * Notes:
+	 * - The post-processor can be used or not used depending
+	 *   on the pixel format. Therefore, enabling the link doesn't
+	 *   necesarily mean it's gonna be used.
+	 *
+	 * - The post-processor can be used or not on a per-request,
+	 *   per-context way. However, because the topology
+	 *   is described at the media controller level, the enable
+	 *   is done at a device level.
+	 *
+	 * - Topology is only used to expose the post-processor feature
+	 *   to the application (and allow enabling it). Topology changes
+	 *   while a context is streaming is allowed, and will be noticed
+	 *   by applications on the next format negotiation (S_FMT,TRY_FMT).
+	 */
+	if (local->entity->function == MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER &&
+	    remote->entity->function == MEDIA_ENT_F_IO_V4L) {
+		mode_mask = HANTRO_POSTPROC_MODE;
+	} else if (local->entity->function == MEDIA_ENT_F_PROC_VIDEO_DECODER &&
+		   remote->entity->function == MEDIA_ENT_F_IO_V4L) {
+		mode_mask = HANTRO_DECODER_ONLY_MODE;
+	} else {
+		return -EINVAL;
+	}
+
+	mode_set = enable ? mode_mask : 0x0;
+	new_mode = vpu->dec_mode & ~mode_mask;
+	new_mode |= (mode_mask & mode_set);
+
+	/* Reject an illegal setup. */
+	if (new_mode == (HANTRO_DECODER_ONLY_MODE | HANTRO_POSTPROC_MODE))
+		return -EINVAL;
+
+	vpu->dec_mode = new_mode;
 	return 0;
 }
 
@@ -629,14 +694,29 @@ static int hantro_attach_func(struct hantro_dev *vpu,
 	const struct hantro_subdev decoder_subdevs[] = {
 		HANTRO_SUBDEV(&func->sd_proc, "decoder", func->id,
 			      func->sd_proc_pads),
+		HANTRO_SUBDEV(&func->sd_postproc, "postproc",
+			      MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER,
+			      func->sd_postproc_pads),
 	};
 	const struct hantro_subdev encoder_subdevs[] = {
 		HANTRO_SUBDEV(&func->sd_proc, "encoder", func->id,
 			      func->sd_proc_pads),
 	};
+	/*
+	 * By default, the decoder is connected, but the post-proc
+	 * is disconnected. The application is expected to connect
+	 * the post-processor explicitly in order to use it.
+	 *
+	 * The encoder has no post-processor, so in this case the link
+	 * is enabled and immutable.
+	 */
 	const struct hantro_link decoder_links[] = {
 		/* decoder -> vdev */
-		HANTRO_LINK_IM(&func->sd_proc.entity, &func->vdev.entity),
+		HANTRO_LINK_EN(&func->sd_proc.entity, &func->vdev.entity),
+		/* decoder -> post-proc */
+		HANTRO_LINK_IM(&func->sd_proc.entity, &func->sd_postproc.entity),
+		/* post-proc -> vdev */
+		HANTRO_LINK(&func->sd_postproc.entity, &func->vdev.entity),
 		/* vdev -> decoder */
 		HANTRO_LINK_IM(&func->vdev.entity, &func->sd_proc.entity),
 	};
@@ -712,6 +792,9 @@ static int hantro_attach_func(struct hantro_dev *vpu,
 		goto err_rm_devnode;
 	}
 
+	/* The default mode. */
+	vpu->dec_mode = HANTRO_DECODER_ONLY_MODE;
+
 	return 0;
 err_rm_devnode:
 	media_devnode_remove(func->vdev.intf_devnode);
@@ -728,6 +811,7 @@ static void hantro_detach_func(struct hantro_func *func)
 	media_devnode_remove(func->vdev.intf_devnode);
 	media_device_unregister_entity(&func->vdev.entity);
 	v4l2_device_unregister_subdev(&func->sd_proc);
+	v4l2_device_unregister_subdev(&func->sd_postproc);
 }
 
 static int hantro_add_func(struct hantro_dev *vpu, unsigned int funcid)
diff --git a/drivers/staging/media/hantro/hantro_g1_h264_dec.c b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
index 29130946dea4..e263a6b50651 100644
--- a/drivers/staging/media/hantro/hantro_g1_h264_dec.c
+++ b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
@@ -241,7 +241,7 @@ static void set_buffers(struct hantro_ctx *ctx)
 	vdpu_write_relaxed(vpu, src_dma, G1_REG_ADDR_STR);
 
 	/* Destination (decoded frame) buffer. */
-	dst_dma = vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
+	dst_dma = hantro_get_dec_buf_addr(ctx, &dst_buf->vb2_buf);
 	vdpu_write_relaxed(vpu, dst_dma, G1_REG_ADDR_DST);
 
 	/* Higher profiles require DMV buffer appended to reference frames. */
diff --git a/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c b/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
index 663bf05459a9..6fdced7d7f4b 100644
--- a/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
+++ b/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
@@ -65,7 +65,7 @@ hantro_g1_mpeg2_dec_set_buffers(struct hantro_dev *vpu, struct hantro_ctx *ctx,
 	vdpu_write_relaxed(vpu, addr, G1_REG_ADDR_STR);
 
 	/* Destination frame buffer */
-	addr = vb2_dma_contig_plane_dma_addr(dst_buf, 0);
+	addr = hantro_get_dec_buf_addr(ctx, dst_buf);
 	current_addr = addr;
 
 	if (picture->picture_structure == PICT_BOTTOM_FIELD)
diff --git a/drivers/staging/media/hantro/hantro_g1_regs.h b/drivers/staging/media/hantro/hantro_g1_regs.h
index 84b93915a953..68f2a53a3680 100644
--- a/drivers/staging/media/hantro/hantro_g1_regs.h
+++ b/drivers/staging/media/hantro/hantro_g1_regs.h
@@ -304,4 +304,55 @@
 #define     G1_REG_REF_BUF_CTRL2_APF_THRESHOLD(x)	(((x) & 0x3fff) << 0)
 #define G1_REG_SOFT_RESET				G1_SWREG(101)
 
+/* Post-processor registers. */
+#define G1_REG_PP_INTERRUPT		G1_SWREG(60)
+#define    G1_REG_PP_READY_IRQ		BIT(12)
+#define    G1_REG_PP_IRQ		BIT(8)
+#define    G1_REG_PP_IRQ_DIS		BIT(4)
+#define    G1_REG_PP_PIPELINE_EN	BIT(1)
+#define    G1_REG_PP_EXTERNAL_TRIGGER	BIT(0)
+#define G1_REG_PP_DEV_CONFIG		G1_SWREG(61)
+#define     G1_REG_PP_AXI_RD_ID(v)	(((v) << 24) & GENMASK(31, 24))
+#define     G1_REG_PP_AXI_WR_ID(v)	(((v) << 16) & GENMASK(23, 16))
+#define     G1_REG_PP_INSWAP32_E(v)	((v) ? BIT(10) : 0)
+#define     G1_REG_PP_DATA_DISC_E(v)	((v) ? BIT(9) : 0)
+#define     G1_REG_PP_CLK_GATE_E(v)	((v) ? BIT(8) : 0)
+#define     G1_REG_PP_IN_ENDIAN(v)	((v) ? BIT(7) : 0)
+#define     G1_REG_PP_OUT_ENDIAN(v)	((v) ? BIT(6) : 0)
+#define     G1_REG_PP_OUTSWAP32_E(v)	((v) ? BIT(5) : 0)
+#define     G1_REG_PP_MAX_BURST(v)	(((v) << 0) & GENMASK(4, 0))
+#define G1_REG_PP_IN_LUMA_BASE		G1_SWREG(63)
+#define G1_REG_PP_IN_CB_BASE		G1_SWREG(64)
+#define G1_REG_PP_IN_CR_BASE		G1_SWREG(65)
+#define G1_REG_PP_OUT_LUMA_BASE		G1_SWREG(66)
+#define G1_REG_PP_OUT_CHROMA_BASE	G1_SWREG(67)
+#define G1_REG_PP_CONTRAST_ADJUST	G1_SWREG(68)
+#define G1_REG_PP_COLOR_CONVERSION	G1_SWREG(69)
+#define G1_REG_PP_COLOR_CONVERSION0	G1_SWREG(70)
+#define G1_REG_PP_COLOR_CONVERSION1	G1_SWREG(71)
+#define G1_REG_PP_INPUT_SIZE		G1_SWREG(72)
+#define    G1_REG_PP_INPUT_SIZE_HEIGHT(v) (((v) << 9) & GENMASK(16, 9))
+#define    G1_REG_PP_INPUT_SIZE_WIDTH(v)  (((v) << 0) & GENMASK(8, 0))
+#define G1_REG_PP_SCALING0		G1_SWREG(79)
+#define     G1_REG_PP_PADD_R(v)	(((v) << 23) & GENMASK(27, 23))
+#define     G1_REG_PP_PADD_G(v)	(((v) << 18) & GENMASK(22, 18))
+#define     G1_REG_PP_RANGEMAP_Y(v) ((v) ? BIT(31) : 0)
+#define     G1_REG_PP_RANGEMAP_C(v) ((v) ? BIT(30) : 0)
+#define     G1_REG_PP_YCBCR_RANGE(v) ((v) ? BIT(29) : 0)
+#define     G1_REG_PP_RGB_16(v) ((v) ? BIT(28) : 0)
+#define G1_REG_PP_SCALING1		G1_SWREG(80)
+#define     G1_REG_PP_PADD_B(v)	(((v) << 18) & GENMASK(22, 18))
+#define G1_REG_PP_MASK_R		G1_SWREG(82)
+#define G1_REG_PP_MASK_G		G1_SWREG(83)
+#define G1_REG_PP_MASK_B		G1_SWREG(84)
+#define G1_REG_PP_CONTROL		G1_SWREG(85)
+#define     G1_REG_PP_CONTROL_IN_FMT(v)	(((v) << 29) & GENMASK(31, 29))
+#define     G1_REG_PP_CONTROL_OUT_FMT(v) (((v) << 26) & GENMASK(28, 26))
+#define     G1_REG_PP_CONTROL_OUT_HEIGHT(v) (((v) << 15) & GENMASK(25, 15))
+#define     G1_REG_PP_CONTROL_OUT_WIDTH(v) (((v) << 4) & GENMASK(14, 4))
+#define G1_REG_PP_MASK1_ORIG_WIDTH	G1_SWREG(88)
+#define     G1_REG_PP_ORIG_WIDTH(v)	(((v) << 23) & GENMASK(31, 23))
+#define G1_REG_PP_DISPLAY_WIDTH		G1_SWREG(92)
+#define G1_REG_PP_FUSE			G1_SWREG(99)
+
 #endif /* HANTRO_G1_REGS_H_ */
diff --git a/drivers/staging/media/hantro/hantro_g1_vp8_dec.c b/drivers/staging/media/hantro/hantro_g1_vp8_dec.c
index cad18094fee0..e708994d1aba 100644
--- a/drivers/staging/media/hantro/hantro_g1_vp8_dec.c
+++ b/drivers/staging/media/hantro/hantro_g1_vp8_dec.c
@@ -422,7 +422,7 @@ static void cfg_buffers(struct hantro_ctx *ctx,
 	}
 	vdpu_write_relaxed(vpu, reg, G1_REG_FWD_PIC(0));
 
-	dst_dma = vb2_dma_contig_plane_dma_addr(&vb2_dst->vb2_buf, 0);
+	dst_dma = hantro_get_dec_buf_addr(ctx, &vb2_dst->vb2_buf);
 	vdpu_write_relaxed(vpu, dst_dma, G1_REG_ADDR_DST);
 }
 
diff --git a/drivers/staging/media/hantro/hantro_h264.c b/drivers/staging/media/hantro/hantro_h264.c
index 02cbe7761769..ab6f9d04dcc1 100644
--- a/drivers/staging/media/hantro/hantro_h264.c
+++ b/drivers/staging/media/hantro/hantro_h264.c
@@ -656,7 +656,11 @@ int hantro_h264_dec_init(struct hantro_ctx *ctx)
 	tbl = priv->cpu;
 	memcpy(tbl->cabac_table, h264_cabac_table, sizeof(tbl->cabac_table));
 
-	v4l2_fill_pixfmt_mp(&pix_mp, ctx->dst_fmt.pixelformat,
+	/*
+	 * For the decoder picture size, we want the decoder
+	 * native pixel format.
+	 */
+	v4l2_fill_pixfmt_mp(&pix_mp, V4L2_PIX_FMT_NV12,
 			    ctx->dst_fmt.width, ctx->dst_fmt.height);
 	h264_dec->pic_size = pix_mp.plane_fmt[0].sizeimage;
 
diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
index 69b88f4d3fb3..18e7d9e1f469 100644
--- a/drivers/staging/media/hantro/hantro_hw.h
+++ b/drivers/staging/media/hantro/hantro_hw.h
@@ -28,11 +28,13 @@ struct hantro_variant;
  * @cpu:	CPU pointer to the buffer.
  * @dma:	DMA address of the buffer.
  * @size:	Size of the buffer.
+ * @attrs:	Attributes of the DMA mapping.
  */
 struct hantro_aux_buf {
 	void *cpu;
 	dma_addr_t dma;
 	size_t size;
+	unsigned long attrs;
 };
 
 /**
@@ -109,6 +111,15 @@ struct hantro_vp8_dec_hw_ctx {
 	struct hantro_aux_buf prob_tbl;
 };
 
+/**
+ * struct hantro_postproc_ctx
+ *
+ * @dec_q:		References buffers, in decoder format.
+ */
+struct hantro_postproc_ctx {
+	struct hantro_aux_buf dec_q[VB2_MAX_FRAME];
+};
+
 /**
  * struct hantro_codec_ops - codec mode specific operations
  *
@@ -144,6 +155,8 @@ extern const struct hantro_variant rk3399_vpu_variant;
 extern const struct hantro_variant rk3328_vpu_variant;
 extern const struct hantro_variant rk3288_vpu_variant;
 
+extern const struct hantro_postproc_regs hantro_g1_postproc_regs;
+
 extern const u32 hantro_vp8_dec_mc_filter[8][6];
 
 void hantro_watchdog(struct work_struct *work);
diff --git a/drivers/staging/media/hantro/hantro_postproc.c b/drivers/staging/media/hantro/hantro_postproc.c
new file mode 100644
index 000000000000..e95d38a20963
--- /dev/null
+++ b/drivers/staging/media/hantro/hantro_postproc.c
@@ -0,0 +1,141 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Hantro G1 post-processor support
+ *
+ * Copyright (C) 2019 Collabora, Ltd.
+ */
+
+#include <linux/dma-mapping.h>
+#include <linux/types.h>
+
+#include "hantro.h"
+#include "hantro_hw.h"
+#include "hantro_g1_regs.h"
+
+#define HANTRO_PP_REG_WRITE(vpu, reg_name, val) \
+	do { \
+		if ((vpu)->variant->postproc_regs->reg_name.base)	\
+			hantro_reg_write_relaxed(vpu, \
+					 &vpu->variant->postproc_regs->reg_name, \
+					 (val)); \
+	} while (0)
+
+#define HANTRO_PP_REG_WRITE_S(vpu, reg_name, val) \
+	do { \
+		if ((vpu)->variant->postproc_regs->reg_name.base)	\
+			hantro_reg_write(vpu, \
+					 &vpu->variant->postproc_regs->reg_name, \
+					 (val)); \
+	} while (0)
+
+#define VPU_PP_IN_YUYV			0x0
+#define VPU_PP_IN_NV12			0x1
+#define VPU_PP_IN_YUV420		0x2
+#define VPU_PP_IN_YUV240_TILED		0x5
+#define VPU_PP_OUT_RGB			0x0
+#define VPU_PP_OUT_YUYV			0x3
+
+const struct hantro_postproc_regs hantro_g1_postproc_regs = {
+	.pipeline_en = {G1_REG_PP_INTERRUPT, 1, 0x1},
+	.max_burst = {G1_REG_PP_DEV_CONFIG, 0, 0x1f},
+	.clk_gate = {G1_REG_PP_DEV_CONFIG, 1, 0x1},
+	.out_swap32 = {G1_REG_PP_DEV_CONFIG, 5, 0x1},
+	.out_endian = {G1_REG_PP_DEV_CONFIG, 6, 0x1},
+	.out_luma_base = {G1_REG_PP_OUT_LUMA_BASE, 0, 0xffffffff},
+	.input_width = {G1_REG_PP_INPUT_SIZE, 0, 0x1ff},
+	.input_height = {G1_REG_PP_INPUT_SIZE, 9, 0x1ff},
+	.output_width = {G1_REG_PP_CONTROL, 4, 0x7ff},
+	.output_height = {G1_REG_PP_CONTROL, 15, 0x7ff},
+	.input_fmt = {G1_REG_PP_CONTROL, 29, 0x7},
+	.output_fmt = {G1_REG_PP_CONTROL, 26, 0x7},
+	.orig_width = {G1_REG_PP_MASK1_ORIG_WIDTH, 23, 0x1ff},
+	.display_width = {G1_REG_PP_DISPLAY_WIDTH, 0, 0xfff},
+};
+
+void hantro_postproc_setup(struct hantro_ctx *ctx)
+{
+	struct hantro_dev *vpu = ctx->dev;
+	struct vb2_v4l2_buffer *dst_buf;
+	u32 src_pp_fmt, dst_pp_fmt;
+	dma_addr_t dst_dma;
+
+	/* Turn on pipeline mode. Must be done first. */
+	HANTRO_PP_REG_WRITE_S(vpu, pipeline_en, 0x1);
+
+	src_pp_fmt = VPU_PP_IN_NV12;
+
+	switch (ctx->vpu_dst_fmt->fourcc) {
+	case V4L2_PIX_FMT_YUYV:
+		dst_pp_fmt = VPU_PP_OUT_YUYV;
+		break;
+	default:
+		WARN(1, "output format %d not supported by the post-processor, this wasn't expected.",
+		     ctx->vpu_dst_fmt->fourcc);
+		dst_pp_fmt = 0;
+		break;
+	}
+
+	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
+	dst_dma = vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
+
+	HANTRO_PP_REG_WRITE(vpu, clk_gate, 0x1);
+	HANTRO_PP_REG_WRITE(vpu, out_endian, 0x1);
+	HANTRO_PP_REG_WRITE(vpu, out_swap32, 0x1);
+	HANTRO_PP_REG_WRITE(vpu, max_burst, 16);
+	HANTRO_PP_REG_WRITE(vpu, out_luma_base, dst_dma);
+	HANTRO_PP_REG_WRITE(vpu, input_width, MB_WIDTH(ctx->dst_fmt.width));
+	HANTRO_PP_REG_WRITE(vpu, input_height, MB_HEIGHT(ctx->dst_fmt.height));
+	HANTRO_PP_REG_WRITE(vpu, input_fmt, src_pp_fmt);
+	HANTRO_PP_REG_WRITE(vpu, output_fmt, dst_pp_fmt);
+	HANTRO_PP_REG_WRITE(vpu, output_width, ctx->dst_fmt.width);
+	HANTRO_PP_REG_WRITE(vpu, output_height, ctx->dst_fmt.height);
+	HANTRO_PP_REG_WRITE(vpu, orig_width, MB_WIDTH(ctx->dst_fmt.width));
+	HANTRO_PP_REG_WRITE(vpu, display_width, ctx->dst_fmt.width);
+}
+
+void hantro_postproc_free(struct hantro_ctx *ctx)
+{
+	struct hantro_dev *vpu = ctx->dev;
+	unsigned int i;
+
+	for (i = 0; i < VB2_MAX_FRAME; ++i) {
+		struct hantro_aux_buf *priv = &ctx->postproc.dec_q[i];
+
+		if (priv->cpu) {
+			dma_free_attrs(vpu->dev, priv->size, priv->cpu,
+				       priv->dma, priv->attrs);
+			priv->cpu = NULL;
+		}
+	}
+}
+
+int hantro_postproc_alloc(struct hantro_ctx *ctx)
+{
+	struct hantro_dev *vpu = ctx->dev;
+	unsigned int i, buf_size;
+
+	buf_size = ctx->dst_fmt.plane_fmt[0].sizeimage;
+
+	for (i = 0; i < VB2_MAX_FRAME; ++i) {
+		struct hantro_aux_buf *priv = &ctx->postproc.dec_q[i];
+
+		/*
+		 * The buffers on this queue are meant as intermediate
+		 * buffers for the decoder, so no mapping is needed.
+		 */
+		priv->attrs = DMA_ATTR_NO_KERNEL_MAPPING;
+		priv->cpu = dma_alloc_attrs(vpu->dev, buf_size, &priv->dma,
+					    GFP_KERNEL, priv->attrs);
+		if (!priv->cpu)
+			return -ENOMEM;
+		priv->size = buf_size;
+	}
+	return 0;
+}
+
+void hantro_postproc_disable(struct hantro_ctx *ctx)
+{
+	struct hantro_dev *vpu = ctx->dev;
+
+	HANTRO_PP_REG_WRITE_S(vpu, pipeline_en, 0x0);
+}
diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
index 58fa4b52275b..ddd180278c8b 100644
--- a/drivers/staging/media/hantro/hantro_v4l2.c
+++ b/drivers/staging/media/hantro/hantro_v4l2.c
@@ -46,6 +46,19 @@ hantro_get_formats(const struct hantro_ctx *ctx, unsigned int *num_fmts)
 	return formats;
 }
 
+static const struct hantro_fmt *
+hantro_get_postproc_formats(const struct hantro_ctx *ctx,
+			    unsigned int *num_fmts)
+{
+	if (!hantro_postproc_enabled(ctx) || hantro_is_encoder_ctx(ctx)) {
+		*num_fmts = 0;
+		return NULL;
+	}
+
+	*num_fmts = ctx->dev->variant->num_postproc_fmts;
+	return ctx->dev->variant->postproc_fmts;
+}
+
 static const struct hantro_fmt *
 hantro_find_format(const struct hantro_ctx *ctx, u32 fourcc)
 {
@@ -57,6 +70,10 @@ hantro_find_format(const struct hantro_ctx *ctx, u32 fourcc)
 		if (formats[i].fourcc == fourcc)
 			return &formats[i];
 
+	formats = hantro_get_postproc_formats(ctx, &num_fmts);
+	for (i = 0; i < num_fmts; i++)
+		if (formats[i].fourcc == fourcc)
+			return &formats[i];
 	return NULL;
 }
 
@@ -151,6 +168,20 @@ static int vidioc_enum_fmt(struct file *file, void *priv,
 		}
 		++j;
 	}
+
+	/* Enumerate post-processed formats. */
+	if (!capture)
+		return -EINVAL;
+	formats = hantro_get_postproc_formats(ctx, &num_fmts);
+	for (i = 0; i < num_fmts; i++) {
+		if (j == f->index) {
+			fmt = &formats[i];
+			f->pixelformat = fmt->fourcc;
+			return 0;
+		}
+		++j;
+	}
+
 	return -EINVAL;
 }
 
@@ -241,9 +272,10 @@ static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f,
 		/*
 		 * The H264 decoder needs extra space on the output buffers
 		 * to store motion vectors. This is needed for reference
-		 * frames.
+		 * frames and only if the format is non-post-processed (NV12).
 		 */
-		if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_H264_SLICE)
+		if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_H264_SLICE &&
+		    fmt->fourcc == V4L2_PIX_FMT_NV12)
 			pix_mp->plane_fmt[0].sizeimage +=
 				128 * DIV_ROUND_UP(pix_mp->width, 16) *
 				      DIV_ROUND_UP(pix_mp->height, 16);
@@ -622,10 +654,18 @@ static int hantro_start_streaming(struct vb2_queue *q, unsigned int count)
 			if (ret)
 				goto err_pipe_stop;
 		}
-	}
 
+		if (hantro_needs_postproc(ctx)) {
+			ret = hantro_postproc_alloc(ctx);
+			if (ret)
+				goto err_codec_exit;
+		}
+	}
 	return ret;
 
+err_codec_exit:
+	if (ctx->codec_ops && ctx->codec_ops->exit)
+		ctx->codec_ops->exit(ctx);
 err_pipe_stop:
 	media_pipeline_stop(entity);
 	return ret;
@@ -655,6 +695,7 @@ static void hantro_stop_streaming(struct vb2_queue *q)
 	struct media_entity *entity = &ctx->fh.vdev->entity;
 
 	if (hantro_vq_is_coded(q)) {
+		hantro_postproc_free(ctx);
 		if (ctx->codec_ops && ctx->codec_ops->exit)
 			ctx->codec_ops->exit(ctx);
 	}
diff --git a/drivers/staging/media/hantro/rk3288_vpu_hw.c b/drivers/staging/media/hantro/rk3288_vpu_hw.c
index c0bdd6c02520..7d65fb75ac94 100644
--- a/drivers/staging/media/hantro/rk3288_vpu_hw.c
+++ b/drivers/staging/media/hantro/rk3288_vpu_hw.c
@@ -56,6 +56,13 @@ static const struct hantro_fmt rk3288_vpu_enc_fmts[] = {
 	},
 };
 
+static const struct hantro_fmt rk3288_vpu_postproc_fmts[] = {
+	{
+		.fourcc = V4L2_PIX_FMT_YUYV,
+		.codec_mode = HANTRO_MODE_NONE,
+	},
+};
+
 static const struct hantro_fmt rk3288_vpu_dec_fmts[] = {
 	{
 		.fourcc = V4L2_PIX_FMT_NV12,
@@ -215,6 +222,9 @@ const struct hantro_variant rk3288_vpu_variant = {
 	.dec_offset = 0x400,
 	.dec_fmts = rk3288_vpu_dec_fmts,
 	.num_dec_fmts = ARRAY_SIZE(rk3288_vpu_dec_fmts),
+	.postproc_fmts = rk3288_vpu_postproc_fmts,
+	.num_postproc_fmts = ARRAY_SIZE(rk3288_vpu_postproc_fmts),
+	.postproc_regs = &hantro_g1_postproc_regs,
 	.codec = HANTRO_JPEG_ENCODER | HANTRO_MPEG2_DECODER |
 		 HANTRO_VP8_DECODER | HANTRO_H264_DECODER,
 	.codec_ops = rk3288_vpu_codec_ops,
-- 
2.22.0

