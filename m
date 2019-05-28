Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD83E2CCFE
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2019 19:03:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727237AbfE1RD7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 13:03:59 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46014 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726523AbfE1RD7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 13:03:59 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id CCEC8280195
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>
Cc:     kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v6 11/16] rockchip/vpu: Add decoder boilerplate
Date:   Tue, 28 May 2019 14:02:27 -0300
Message-Id: <20190528170232.2091-12-ezequiel@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190528170232.2091-1-ezequiel@collabora.com>
References: <20190528170232.2091-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This commit adds the needed boilerplate code to support the VPU
in decoding operation. Two v4l2 interfaces are exposed, one for
encoding and one for decoding, but a single m2m device is shared
by them, so jobs are properly serialized.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
--
Changes from v4:
* Remove vpu_common.h inclusion
* Set ->requires_requests from s_fmt() instead of fixing it at queue
  creation time (suggested by Hans)

Changes from v3:
* Update things according to changes done in the patch introducing
  custom media controller support (Boris)
* Move the rk3399 vdpu irq definition in the commit introducing
  MPGEG2 support on rk3399
* Fix media controller deregistration code (Jonas)

Changes from v2:
* Use the common vb2/v4l2 implementation
* Use strscpy instead of strlcpy.
* Abstract vidioc v4l2 api implementations into generic code, creating
  helpers that can be used by the encoder and the decoder.
* Only prevent S_FMT on the coded format queue, if the peer queue has buffers allocated.
* Refactor the code, adding a buf_finish callback to rockchip_vpu_ctx.
  With this change, is_enc field is not needed.
* Separate OUTPUT and CAPTURE queue ops (vb2_ops), and create common helpers that
  can be used by both.
* Pass a no kernel mapping attribute on both ends of the decoder.
---
 drivers/staging/media/rockchip/vpu/Kconfig    |   1 +
 .../staging/media/rockchip/vpu/rockchip_vpu.h |  42 ++++-
 .../media/rockchip/vpu/rockchip_vpu_drv.c     | 169 ++++++++++++++----
 .../media/rockchip/vpu/rockchip_vpu_v4l2.c    |  29 ++-
 4 files changed, 203 insertions(+), 38 deletions(-)

diff --git a/drivers/staging/media/rockchip/vpu/Kconfig b/drivers/staging/media/rockchip/vpu/Kconfig
index fc54bbf6753d..842b003e08b8 100644
--- a/drivers/staging/media/rockchip/vpu/Kconfig
+++ b/drivers/staging/media/rockchip/vpu/Kconfig
@@ -3,6 +3,7 @@ config VIDEO_ROCKCHIP_VPU
 	tristate "Rockchip VPU driver"
 	depends on ARCH_ROCKCHIP || COMPILE_TEST
 	depends on VIDEO_DEV && VIDEO_V4L2 && MEDIA_CONTROLLER
+	depends on MEDIA_CONTROLLER_REQUEST_API
 	select VIDEOBUF2_DMA_CONTIG
 	select VIDEOBUF2_VMALLOC
 	select V4L2_MEM2MEM_DEV
diff --git a/drivers/staging/media/rockchip/vpu/rockchip_vpu.h b/drivers/staging/media/rockchip/vpu/rockchip_vpu.h
index 0d24fd257a2b..3d64f3e95c9b 100644
--- a/drivers/staging/media/rockchip/vpu/rockchip_vpu.h
+++ b/drivers/staging/media/rockchip/vpu/rockchip_vpu.h
@@ -40,23 +40,31 @@ struct rockchip_vpu_codec_ops;
  * struct rockchip_vpu_variant - information about VPU hardware variant
  *
  * @enc_offset:			Offset from VPU base to encoder registers.
+ * @dec_offset:			Offset from VPU base to decoder registers.
  * @enc_fmts:			Encoder formats.
  * @num_enc_fmts:		Number of encoder formats.
+ * @dec_fmts:			Decoder formats.
+ * @num_dec_fmts:		Number of decoder formats.
  * @codec:			Supported codecs
  * @codec_ops:			Codec ops.
  * @init:			Initialize hardware.
  * @vepu_irq:			encoder interrupt handler
+ * @vdpu_irq:			decoder interrupt handler
  * @clk_names:			array of clock names
  * @num_clocks:			number of clocks in the array
  */
 struct rockchip_vpu_variant {
 	unsigned int enc_offset;
+	unsigned int dec_offset;
 	const struct rockchip_vpu_fmt *enc_fmts;
 	unsigned int num_enc_fmts;
+	const struct rockchip_vpu_fmt *dec_fmts;
+	unsigned int num_dec_fmts;
 	unsigned int codec;
 	const struct rockchip_vpu_codec_ops *codec_ops;
 	int (*init)(struct rockchip_vpu_dev *vpu);
 	irqreturn_t (*vepu_irq)(int irq, void *priv);
+	irqreturn_t (*vdpu_irq)(int irq, void *priv);
 	const char *clk_names[ROCKCHIP_VPU_MAX_CLOCKS];
 	int num_clocks;
 };
@@ -112,12 +120,14 @@ rockchip_vpu_vdev_to_func(struct video_device *vdev)
  * @m2m_dev:		mem2mem device associated to this device.
  * @mdev:		media device associated to this device.
  * @encoder:		encoder functionality.
+ * @decoder:		decoder functionality.
  * @pdev:		Pointer to VPU platform device.
  * @dev:		Pointer to device for convenient logging using
  *			dev_ macros.
  * @clocks:		Array of clock handles.
  * @base:		Mapped address of VPU registers.
  * @enc_base:		Mapped address of VPU encoder register for convenience.
+ * @dec_base:		Mapped address of VPU decoder register for convenience.
  * @vpu_mutex:		Mutex to synchronize V4L2 calls.
  * @irqlock:		Spinlock to synchronize access to data structures
  *			shared with interrupt handlers.
@@ -129,11 +139,13 @@ struct rockchip_vpu_dev {
 	struct v4l2_m2m_dev *m2m_dev;
 	struct media_device mdev;
 	struct rockchip_vpu_func *encoder;
+	struct rockchip_vpu_func *decoder;
 	struct platform_device *pdev;
 	struct device *dev;
 	struct clk_bulk_data clocks[ROCKCHIP_VPU_MAX_CLOCKS];
 	void __iomem *base;
 	void __iomem *enc_base;
+	void __iomem *dec_base;
 
 	struct mutex vpu_mutex;	/* video_device lock */
 	spinlock_t irqlock;
@@ -158,6 +170,9 @@ struct rockchip_vpu_dev {
  * @ctrl_handler:	Control handler used to register controls.
  * @jpeg_quality:	User-specified JPEG compression quality.
  *
+ * @buf_finish:		Buffer finish. This depends on encoder or decoder
+ *			context, and it's called right before
+ *			calling v4l2_m2m_job_finish.
  * @codec_ops:		Set of operations related to codec mode.
  * @jpeg_enc:		JPEG-encoding context.
  */
@@ -176,6 +191,10 @@ struct rockchip_vpu_ctx {
 	struct v4l2_ctrl_handler ctrl_handler;
 	int jpeg_quality;
 
+	int (*buf_finish)(struct rockchip_vpu_ctx *ctx,
+			  struct vb2_buffer *buf,
+			  unsigned int bytesused);
+
 	const struct rockchip_vpu_codec_ops *codec_ops;
 
 	/* Specific for particular codec modes. */
@@ -262,10 +281,27 @@ static inline u32 vepu_read(struct rockchip_vpu_dev *vpu, u32 reg)
 	return val;
 }
 
-static inline bool
-rockchip_vpu_is_encoder_ctx(const struct rockchip_vpu_ctx *ctx)
+static inline void vdpu_write_relaxed(struct rockchip_vpu_dev *vpu,
+				      u32 val, u32 reg)
+{
+	vpu_debug(6, "0x%04x = 0x%08x\n", reg / 4, val);
+	writel_relaxed(val, vpu->dec_base + reg);
+}
+
+static inline void vdpu_write(struct rockchip_vpu_dev *vpu, u32 val, u32 reg)
+{
+	vpu_debug(6, "0x%04x = 0x%08x\n", reg / 4, val);
+	writel(val, vpu->dec_base + reg);
+}
+
+static inline u32 vdpu_read(struct rockchip_vpu_dev *vpu, u32 reg)
 {
-	return true;
+	u32 val = readl(vpu->dec_base + reg);
+
+	vpu_debug(6, "0x%04x = 0x%08x\n", reg / 4, val);
+	return val;
 }
 
+bool rockchip_vpu_is_encoder_ctx(const struct rockchip_vpu_ctx *ctx);
+
 #endif /* ROCKCHIP_VPU_H_ */
diff --git a/drivers/staging/media/rockchip/vpu/rockchip_vpu_drv.c b/drivers/staging/media/rockchip/vpu/rockchip_vpu_drv.c
index d85b88067b03..0a8d7fb8903a 100644
--- a/drivers/staging/media/rockchip/vpu/rockchip_vpu_drv.c
+++ b/drivers/staging/media/rockchip/vpu/rockchip_vpu_drv.c
@@ -35,13 +35,48 @@ module_param_named(debug, rockchip_vpu_debug, int, 0644);
 MODULE_PARM_DESC(debug,
 		 "Debug level - higher value produces more verbose messages");
 
+static int
+rockchip_vpu_enc_buf_finish(struct rockchip_vpu_ctx *ctx,
+			    struct vb2_buffer *buf,
+			    unsigned int bytesused)
+{
+	size_t avail_size;
+
+	avail_size = vb2_plane_size(buf, 0) - ctx->vpu_dst_fmt->header_size;
+	if (bytesused > avail_size)
+		return -EINVAL;
+	/*
+	 * The bounce buffer is only for the JPEG encoder.
+	 * TODO: Rework the JPEG encoder to eliminate the need
+	 * for a bounce buffer.
+	 */
+	if (ctx->jpeg_enc.bounce_buffer.cpu) {
+		memcpy(vb2_plane_vaddr(buf, 0) +
+		       ctx->vpu_dst_fmt->header_size,
+		       ctx->jpeg_enc.bounce_buffer.cpu, bytesused);
+	}
+	buf->planes[0].bytesused =
+		ctx->vpu_dst_fmt->header_size + bytesused;
+	return 0;
+}
+
+static int
+rockchip_vpu_dec_buf_finish(struct rockchip_vpu_ctx *ctx,
+			    struct vb2_buffer *buf,
+			    unsigned int bytesused)
+{
+	/* For decoders set bytesused as per the output picture. */
+	buf->planes[0].bytesused = ctx->dst_fmt.plane_fmt[0].sizeimage;
+	return 0;
+}
+
 static void rockchip_vpu_job_finish(struct rockchip_vpu_dev *vpu,
 				    struct rockchip_vpu_ctx *ctx,
 				    unsigned int bytesused,
 				    enum vb2_buffer_state result)
 {
 	struct vb2_v4l2_buffer *src, *dst;
-	size_t avail_size;
+	int ret;
 
 	pm_runtime_mark_last_busy(vpu->dev);
 	pm_runtime_put_autosuspend(vpu->dev);
@@ -60,24 +95,9 @@ static void rockchip_vpu_job_finish(struct rockchip_vpu_dev *vpu,
 
 	v4l2_m2m_buf_copy_metadata(src, dst, true);
 
-	avail_size = vb2_plane_size(&dst->vb2_buf, 0) -
-		     ctx->vpu_dst_fmt->header_size;
-	if (bytesused <= avail_size) {
-		/*
-		 * The bounce buffer is only for the JPEG encoder.
-		 * TODO: Rework the JPEG encoder to eliminate the need
-		 * for a bounce buffer.
-		 */
-		if (ctx->jpeg_enc.bounce_buffer.cpu) {
-			memcpy(vb2_plane_vaddr(&dst->vb2_buf, 0) +
-			       ctx->vpu_dst_fmt->header_size,
-			       ctx->jpeg_enc.bounce_buffer.cpu, bytesused);
-		}
-		dst->vb2_buf.planes[0].bytesused =
-			ctx->vpu_dst_fmt->header_size + bytesused;
-	} else {
+	ret = ctx->buf_finish(ctx, &dst->vb2_buf, bytesused);
+	if (ret)
 		result = VB2_BUF_STATE_ERROR;
-	}
 
 	v4l2_m2m_buf_done(src, result);
 	v4l2_m2m_buf_done(dst, result);
@@ -135,6 +155,11 @@ static void device_run(void *priv)
 	rockchip_vpu_job_finish(ctx->dev, ctx, 0, VB2_BUF_STATE_ERROR);
 }
 
+bool rockchip_vpu_is_encoder_ctx(const struct rockchip_vpu_ctx *ctx)
+{
+	return ctx->buf_finish == rockchip_vpu_enc_buf_finish;
+}
+
 static struct v4l2_m2m_ops vpu_m2m_ops = {
 	.device_run = device_run,
 };
@@ -169,18 +194,25 @@ queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq)
 		return ret;
 
 	/*
-	 * The CAPTURE queue doesn't need dma memory,
-	 * as the CPU needs to create the JPEG frames,
-	 * from the hardware-produced JPEG payload.
+	 * When encoding, the CAPTURE queue doesn't need dma memory,
+	 * as the CPU needs to create the JPEG frames, from the
+	 * hardware-produced JPEG payload.
 	 *
-	 * For the DMA destination buffer, we use
-	 * a bounce buffer.
+	 * For the DMA destination buffer, we use a bounce buffer.
 	 */
+	if (rockchip_vpu_is_encoder_ctx(ctx)) {
+		dst_vq->mem_ops = &vb2_vmalloc_memops;
+	} else {
+		dst_vq->bidirectional = true;
+		dst_vq->mem_ops = &vb2_dma_contig_memops;
+		dst_vq->dma_attrs = DMA_ATTR_ALLOC_SINGLE_PAGES |
+				    DMA_ATTR_NO_KERNEL_MAPPING;
+	}
+
 	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
 	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
 	dst_vq->drv_priv = ctx;
 	dst_vq->ops = &rockchip_vpu_queue_ops;
-	dst_vq->mem_ops = &vb2_vmalloc_memops;
 	dst_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
 	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
 	dst_vq->lock = &ctx->dev->vpu_mutex;
@@ -258,11 +290,17 @@ static int rockchip_vpu_open(struct file *filp)
 		return -ENOMEM;
 
 	ctx->dev = vpu;
-	if (func->id == MEDIA_ENT_F_PROC_VIDEO_ENCODER)
+	if (func->id == MEDIA_ENT_F_PROC_VIDEO_ENCODER) {
+		ctx->buf_finish = rockchip_vpu_enc_buf_finish;
 		ctx->fh.m2m_ctx = v4l2_m2m_ctx_init(vpu->m2m_dev, ctx,
 						    queue_init);
-	else
+	} else if (func->id == MEDIA_ENT_F_PROC_VIDEO_DECODER) {
+		ctx->buf_finish = rockchip_vpu_dec_buf_finish;
+		ctx->fh.m2m_ctx = v4l2_m2m_ctx_init(vpu->m2m_dev, ctx,
+						    queue_init);
+	} else {
 		ctx->fh.m2m_ctx = ERR_PTR(-ENODEV);
+	}
 	if (IS_ERR(ctx->fh.m2m_ctx)) {
 		ret = PTR_ERR(ctx->fh.m2m_ctx);
 		kfree(ctx);
@@ -463,7 +501,8 @@ static void rockchip_detach_func(struct rockchip_vpu_func *func)
 	media_device_unregister_entity(&func->vdev.entity);
 }
 
-static int rockchip_vpu_add_enc_func(struct rockchip_vpu_dev *vpu)
+static int rockchip_vpu_add_func(struct rockchip_vpu_dev *vpu,
+				 unsigned int funcid)
 {
 	const struct of_device_id *match;
 	struct rockchip_vpu_func *func;
@@ -477,7 +516,7 @@ static int rockchip_vpu_add_enc_func(struct rockchip_vpu_dev *vpu)
 		return -ENOMEM;
 	}
 
-	func->id = MEDIA_ENT_F_PROC_VIDEO_ENCODER;
+	func->id = funcid;
 
 	vfd = &func->vdev;
 	vfd->fops = &rockchip_vpu_fops;
@@ -487,9 +526,14 @@ static int rockchip_vpu_add_enc_func(struct rockchip_vpu_dev *vpu)
 	vfd->vfl_dir = VFL_DIR_M2M;
 	vfd->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_M2M_MPLANE;
 	vfd->ioctl_ops = &rockchip_vpu_ioctl_ops;
-	snprintf(vfd->name, sizeof(vfd->name), "%s-enc", match->compatible);
+	snprintf(vfd->name, sizeof(vfd->name), "%s-%s", match->compatible,
+		 funcid == MEDIA_ENT_F_PROC_VIDEO_ENCODER ? "enc" : "dec");
+
+	if (funcid == MEDIA_ENT_F_PROC_VIDEO_ENCODER)
+		vpu->encoder = func;
+	else
+		vpu->decoder = func;
 
-	vpu->encoder = func;
 	video_set_drvdata(vfd, vpu);
 
 	ret = video_register_device(vfd, VFL_TYPE_GRABBER, -1);
@@ -514,9 +558,31 @@ static int rockchip_vpu_add_enc_func(struct rockchip_vpu_dev *vpu)
 	return ret;
 }
 
-static void rockchip_vpu_remove_enc_func(struct rockchip_vpu_dev *vpu)
+static int rockchip_vpu_add_enc_func(struct rockchip_vpu_dev *vpu)
+{
+	if (!vpu->variant->enc_fmts)
+		return 0;
+
+	return rockchip_vpu_add_func(vpu, MEDIA_ENT_F_PROC_VIDEO_ENCODER);
+}
+
+static int rockchip_vpu_add_dec_func(struct rockchip_vpu_dev *vpu)
+{
+	if (!vpu->variant->dec_fmts)
+		return 0;
+
+	return rockchip_vpu_add_func(vpu, MEDIA_ENT_F_PROC_VIDEO_DECODER);
+}
+
+static void rockchip_vpu_remove_func(struct rockchip_vpu_dev *vpu,
+				     unsigned int funcid)
 {
-	struct rockchip_vpu_func *func = vpu->encoder;
+	struct rockchip_vpu_func *func;
+
+	if (funcid == MEDIA_ENT_F_PROC_VIDEO_ENCODER)
+		func = vpu->encoder;
+	else
+		func = vpu->decoder;
 
 	if (!func)
 		return;
@@ -525,6 +591,16 @@ static void rockchip_vpu_remove_enc_func(struct rockchip_vpu_dev *vpu)
 	video_unregister_device(&func->vdev);
 }
 
+static void rockchip_vpu_remove_enc_func(struct rockchip_vpu_dev *vpu)
+{
+	rockchip_vpu_remove_func(vpu, MEDIA_ENT_F_PROC_VIDEO_ENCODER);
+}
+
+static void rockchip_vpu_remove_dec_func(struct rockchip_vpu_dev *vpu)
+{
+	rockchip_vpu_remove_func(vpu, MEDIA_ENT_F_PROC_VIDEO_DECODER);
+}
+
 static const struct media_device_ops rockchip_m2m_media_ops = {
 	.req_validate = vb2_request_validate,
 	.req_queue = v4l2_m2m_request_queue,
@@ -563,6 +639,7 @@ static int rockchip_vpu_probe(struct platform_device *pdev)
 	if (IS_ERR(vpu->base))
 		return PTR_ERR(vpu->base);
 	vpu->enc_base = vpu->base + vpu->variant->enc_offset;
+	vpu->dec_base = vpu->base + vpu->variant->dec_offset;
 
 	ret = dma_set_coherent_mask(vpu->dev, DMA_BIT_MASK(32));
 	if (ret) {
@@ -570,6 +647,23 @@ static int rockchip_vpu_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	if (vpu->variant->vdpu_irq) {
+		int irq;
+
+		irq = platform_get_irq_byname(vpu->pdev, "vdpu");
+		if (irq <= 0) {
+			dev_err(vpu->dev, "Could not get vdpu IRQ.\n");
+			return -ENXIO;
+		}
+
+		ret = devm_request_irq(vpu->dev, irq, vpu->variant->vdpu_irq,
+				       0, dev_name(vpu->dev), vpu);
+		if (ret) {
+			dev_err(vpu->dev, "Could not request vdpu IRQ.\n");
+			return ret;
+		}
+	}
+
 	if (vpu->variant->vepu_irq) {
 		int irq;
 
@@ -631,14 +725,22 @@ static int rockchip_vpu_probe(struct platform_device *pdev)
 		goto err_m2m_rel;
 	}
 
+	ret = rockchip_vpu_add_dec_func(vpu);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to register decoder\n");
+		goto err_rm_enc_func;
+	}
+
 	ret = media_device_register(&vpu->mdev);
 	if (ret) {
 		v4l2_err(&vpu->v4l2_dev, "Failed to register mem2mem media device\n");
-		goto err_rm_enc_func;
+		goto err_rm_dec_func;
 	}
 
 	return 0;
 
+err_rm_dec_func:
+	rockchip_vpu_remove_dec_func(vpu);
 err_rm_enc_func:
 	rockchip_vpu_remove_enc_func(vpu);
 err_m2m_rel:
@@ -660,6 +762,7 @@ static int rockchip_vpu_remove(struct platform_device *pdev)
 	v4l2_info(&vpu->v4l2_dev, "Removing %s\n", pdev->name);
 
 	media_device_unregister(&vpu->mdev);
+	rockchip_vpu_remove_dec_func(vpu);
 	rockchip_vpu_remove_enc_func(vpu);
 	media_device_cleanup(&vpu->mdev);
 	v4l2_m2m_release(vpu->m2m_dev);
diff --git a/drivers/staging/media/rockchip/vpu/rockchip_vpu_v4l2.c b/drivers/staging/media/rockchip/vpu/rockchip_vpu_v4l2.c
index 1ab558d6492d..1b80a45df8fe 100644
--- a/drivers/staging/media/rockchip/vpu/rockchip_vpu_v4l2.c
+++ b/drivers/staging/media/rockchip/vpu/rockchip_vpu_v4l2.c
@@ -36,8 +36,13 @@ rockchip_vpu_get_formats(const struct rockchip_vpu_ctx *ctx,
 {
 	const struct rockchip_vpu_fmt *formats;
 
-	formats = ctx->dev->variant->enc_fmts;
-	*num_fmts = ctx->dev->variant->num_enc_fmts;
+	if (rockchip_vpu_is_encoder_ctx(ctx)) {
+		formats = ctx->dev->variant->enc_fmts;
+		*num_fmts = ctx->dev->variant->num_enc_fmts;
+	} else {
+		formats = ctx->dev->variant->dec_fmts;
+		*num_fmts = ctx->dev->variant->num_dec_fmts;
+	}
 
 	return formats;
 }
@@ -331,6 +336,22 @@ void rockchip_vpu_reset_fmts(struct rockchip_vpu_ctx *ctx)
 	rockchip_vpu_reset_raw_fmt(ctx);
 }
 
+static void
+rockchip_vpu_update_requires_request(struct rockchip_vpu_ctx *ctx,
+				     u32 fourcc)
+{
+	switch (fourcc) {
+	case V4L2_PIX_FMT_JPEG:
+		ctx->fh.m2m_ctx->out_q_ctx.q.requires_requests = false;
+		break;
+	case V4L2_PIX_FMT_MPEG2_SLICE:
+		ctx->fh.m2m_ctx->out_q_ctx.q.requires_requests = true;
+		break;
+	default:
+		break;
+	}
+}
+
 static int
 vidioc_s_fmt_out_mplane(struct file *file, void *priv, struct v4l2_format *f)
 {
@@ -387,6 +408,8 @@ vidioc_s_fmt_out_mplane(struct file *file, void *priv, struct v4l2_format *f)
 	ctx->dst_fmt.xfer_func = pix_mp->xfer_func;
 	ctx->dst_fmt.quantization = pix_mp->quantization;
 
+	rockchip_vpu_update_requires_request(ctx, pix_mp->pixelformat);
+
 	vpu_debug(0, "OUTPUT codec mode: %d\n", ctx->vpu_src_fmt->codec_mode);
 	vpu_debug(0, "fmt - w: %d, h: %d\n",
 		  pix_mp->width, pix_mp->height);
@@ -456,6 +479,8 @@ static int vidioc_s_fmt_cap_mplane(struct file *file, void *priv,
 	vpu_debug(0, "fmt - w: %d, h: %d\n",
 		  pix_mp->width, pix_mp->height);
 
+	rockchip_vpu_update_requires_request(ctx, pix_mp->pixelformat);
+
 	return 0;
 }
 
-- 
2.20.1

