Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FCE47A08BB
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 17:12:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235295AbjINPMa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 11:12:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238205AbjINPM3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 11:12:29 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1233C1FC9
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 08:12:25 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0D2E11FB;
        Thu, 14 Sep 2023 08:13:02 -0700 (PDT)
Received: from [10.57.93.68] (unknown [10.57.93.68])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8B5CC3F738;
        Thu, 14 Sep 2023 08:12:22 -0700 (PDT)
Message-ID: <8626fea8-4cc9-224e-5cfa-8115ff7816f1@arm.com>
Date:   Thu, 14 Sep 2023 16:12:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 03/13] media: rockchip: rga: allocate DMA descriptors per
 buffer
Content-Language: en-GB
To:     Michael Tretter <m.tretter@pengutronix.de>,
        Jacob Chen <jacob-chen@iotwrt.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Shengyu Qu <wiagn233@outlook.com>,
        Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
        Diederik de Haas <didi.debian@cknow.org>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
References: <20230914-rockchip-rga-multiplanar-v1-0-abfd77260ae3@pengutronix.de>
 <20230914-rockchip-rga-multiplanar-v1-3-abfd77260ae3@pengutronix.de>
From:   Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20230914-rockchip-rga-multiplanar-v1-3-abfd77260ae3@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2023-09-14 13:40, Michael Tretter wrote:
> The RGA driver allocates two buffers for the DMA descriptors of the
> input and output buffers. Whenever a new job is processed, the
> descriptor list is updated for the current buffers.
> 
> By updating the descriptor list during buf_prepare, it is possible to
> correctly fail DMABUF imports if the buffers that shall be imported are
> not within the 32 bit address range that can be addressed by the RGA.
> 
> Managing the DMA descriptor list with the buffer also makes it easier to
> track the buffer mapping and the plane offsets into this mapping.
> 
> The cost is that the driver now requires DMA coherent memory per buffer
> for the descriptor list. However, the size scales with the size of the
> video buffers and is not allocated if the RGA is not used.
> 
> While at it, use dma_alloc_coherent to allocate the descriptors and get
> rid of the virt_to_phys calls to get the physical addresses.
> 
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
>   drivers/media/platform/rockchip/rga/rga-buf.c | 78 +++++++++++++++++----------
>   drivers/media/platform/rockchip/rga/rga-hw.c  | 26 ++++-----
>   drivers/media/platform/rockchip/rga/rga.c     | 31 ++---------
>   drivers/media/platform/rockchip/rga/rga.h     | 21 ++++++--
>   4 files changed, 86 insertions(+), 70 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/media/platform/rockchip/rga/rga-buf.c
> index df5ebc90e32d..e8dcc0d5cb90 100644
> --- a/drivers/media/platform/rockchip/rga/rga-buf.c
> +++ b/drivers/media/platform/rockchip/rga/rga-buf.c
> @@ -55,16 +55,54 @@ rga_queue_setup(struct vb2_queue *vq,
>   	return 0;
>   }
>   
> +static int rga_buf_init(struct vb2_buffer *vb)
> +{
> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +	struct rga_vb_buffer *rbuf = vb_to_rga(vbuf);
> +	struct rga_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
> +	struct rockchip_rga *rga = ctx->rga;
> +	struct rga_frame *f = rga_get_frame(ctx, vb->vb2_queue->type);
> +	int n_desc = 0;
> +
> +	n_desc = DIV_ROUND_UP(f->size, PAGE_SIZE);
> +
> +	rbuf->n_desc = n_desc;
> +	rbuf->dma_desc = dma_alloc_coherent(rga->dev,
> +					    rbuf->n_desc * sizeof(*rbuf->dma_desc),
> +					    &rbuf->dma_desc_pa, GFP_KERNEL);
> +	if (!rbuf->dma_desc)
> +		return -ENOMEM;
> +
> +	return 0;
> +}
> +
>   static int rga_buf_prepare(struct vb2_buffer *vb)
>   {
> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +	struct rga_vb_buffer *rbuf = vb_to_rga(vbuf);
>   	struct rga_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
>   	struct rga_frame *f = rga_get_frame(ctx, vb->vb2_queue->type);
> +	struct rockchip_rga *rga = ctx->rga;
> +	int n_desc;
>   
>   	if (IS_ERR(f))
>   		return PTR_ERR(f);
>   
>   	vb2_set_plane_payload(vb, 0, f->size);
>   
> +	/* Create local MMU table for RGA */
> +	n_desc = fill_descriptors(rbuf->dma_desc,
> +				  vb2_dma_sg_plane_desc(vb, 0));
> +	if (n_desc < 0) {
> +		dev_err(rga->dev, "Failed to map buffer");
> +		return n_desc;
> +	}
> +
> +	/* sync local MMU table for RGA */
> +	dma_sync_single_for_device(rga->dev, rbuf->dma_desc_pa,
> +				   n_desc * sizeof(*rbuf->dma_desc),
> +				   DMA_BIDIRECTIONAL);

This sync is still wrong (and DMA_API_DEBUG should complain), but also 
now pointless if you're using a coherent buffer (as is the one in 
rga_cmd_set(), seemingly)

Thanks,
Robin.

> +
>   	return 0;
>   }
>   
> @@ -76,6 +114,17 @@ static void rga_buf_queue(struct vb2_buffer *vb)
>   	v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
>   }
>   
> +static void rga_buf_cleanup(struct vb2_buffer *vb)
> +{
> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +	struct rga_vb_buffer *rbuf = vb_to_rga(vbuf);
> +	struct rga_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
> +	struct rockchip_rga *rga = ctx->rga;
> +
> +	dma_free_coherent(rga->dev, rbuf->n_desc * sizeof(*rbuf->dma_desc),
> +			  rbuf->dma_desc, rbuf->dma_desc_pa);
> +}
> +
>   static void rga_buf_return_buffers(struct vb2_queue *q,
>   				   enum vb2_buffer_state state)
>   {
> @@ -119,37 +168,12 @@ static void rga_buf_stop_streaming(struct vb2_queue *q)
>   
>   const struct vb2_ops rga_qops = {
>   	.queue_setup = rga_queue_setup,
> +	.buf_init = rga_buf_init,
>   	.buf_prepare = rga_buf_prepare,
>   	.buf_queue = rga_buf_queue,
> +	.buf_cleanup = rga_buf_cleanup,
>   	.wait_prepare = vb2_ops_wait_prepare,
>   	.wait_finish = vb2_ops_wait_finish,
>   	.start_streaming = rga_buf_start_streaming,
>   	.stop_streaming = rga_buf_stop_streaming,
>   };
> -
> -/* RGA MMU is a 1-Level MMU, so it can't be used through the IOMMU API.
> - * We use it more like a scatter-gather list.
> - */
> -void rga_buf_map(struct vb2_buffer *vb)
> -{
> -	struct rga_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
> -	struct rockchip_rga *rga = ctx->rga;
> -	struct rga_dma_desc *pages;
> -	unsigned int num_desc = 0;
> -
> -	if (vb->type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
> -		pages = rga->src_mmu_pages;
> -	else
> -		pages = rga->dst_mmu_pages;
> -
> -	/* Create local MMU table for RGA */
> -	num_desc = fill_descriptors(pages, vb2_dma_sg_plane_desc(vb, 0));
> -	if (num_desc < 0) {
> -		dev_err(rga->dev, "Failed to map buffer");
> -		return;
> -	}
> -
> -	/* sync local MMU table for RGA */
> -	dma_sync_single_for_device(rga->dev, virt_to_phys(pages),
> -				   num_desc * sizeof(*pages), DMA_BIDIRECTIONAL);
> -}
> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
> index aaa96f256356..b391d97d4632 100644
> --- a/drivers/media/platform/rockchip/rga/rga-hw.c
> +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
> @@ -119,40 +119,40 @@ static struct rga_addr_offset *rga_lookup_draw_pos(struct
>   	return NULL;
>   }
>   
> -static void rga_cmd_set_src_addr(struct rga_ctx *ctx, void *mmu_pages)
> +static void rga_cmd_set_src_addr(struct rga_ctx *ctx, dma_addr_t dma_addr)
>   {
>   	struct rockchip_rga *rga = ctx->rga;
>   	u32 *dest = rga->cmdbuf_virt;
>   	unsigned int reg;
>   
>   	reg = RGA_MMU_SRC_BASE - RGA_MODE_BASE_REG;
> -	dest[reg >> 2] = virt_to_phys(mmu_pages) >> 4;
> +	dest[reg >> 2] = dma_addr >> 4;
>   
>   	reg = RGA_MMU_CTRL1 - RGA_MODE_BASE_REG;
>   	dest[reg >> 2] |= 0x7;
>   }
>   
> -static void rga_cmd_set_src1_addr(struct rga_ctx *ctx, void *mmu_pages)
> +static void rga_cmd_set_src1_addr(struct rga_ctx *ctx, dma_addr_t dma_addr)
>   {
>   	struct rockchip_rga *rga = ctx->rga;
>   	u32 *dest = rga->cmdbuf_virt;
>   	unsigned int reg;
>   
>   	reg = RGA_MMU_SRC1_BASE - RGA_MODE_BASE_REG;
> -	dest[reg >> 2] = virt_to_phys(mmu_pages) >> 4;
> +	dest[reg >> 2] = dma_addr >> 4;
>   
>   	reg = RGA_MMU_CTRL1 - RGA_MODE_BASE_REG;
>   	dest[reg >> 2] |= 0x7 << 4;
>   }
>   
> -static void rga_cmd_set_dst_addr(struct rga_ctx *ctx, void *mmu_pages)
> +static void rga_cmd_set_dst_addr(struct rga_ctx *ctx, dma_addr_t dma_addr)
>   {
>   	struct rockchip_rga *rga = ctx->rga;
>   	u32 *dest = rga->cmdbuf_virt;
>   	unsigned int reg;
>   
>   	reg = RGA_MMU_DST_BASE - RGA_MODE_BASE_REG;
> -	dest[reg >> 2] = virt_to_phys(mmu_pages) >> 4;
> +	dest[reg >> 2] = dma_addr >> 4;
>   
>   	reg = RGA_MMU_CTRL1 - RGA_MODE_BASE_REG;
>   	dest[reg >> 2] |= 0x7 << 8;
> @@ -375,20 +375,21 @@ static void rga_cmd_set_mode(struct rga_ctx *ctx)
>   	dest[(RGA_MODE_CTRL - RGA_MODE_BASE_REG) >> 2] = mode.val;
>   }
>   
> -static void rga_cmd_set(struct rga_ctx *ctx)
> +static void rga_cmd_set(struct rga_ctx *ctx,
> +			struct rga_vb_buffer *src, struct rga_vb_buffer *dst)
>   {
>   	struct rockchip_rga *rga = ctx->rga;
>   
>   	memset(rga->cmdbuf_virt, 0, RGA_CMDBUF_SIZE * 4);
>   
> -	rga_cmd_set_src_addr(ctx, rga->src_mmu_pages);
> +	rga_cmd_set_src_addr(ctx, src->dma_desc_pa);
>   	/*
>   	 * Due to hardware bug,
>   	 * src1 mmu also should be configured when using alpha blending.
>   	 */
> -	rga_cmd_set_src1_addr(ctx, rga->dst_mmu_pages);
> +	rga_cmd_set_src1_addr(ctx, dst->dma_desc_pa);
>   
> -	rga_cmd_set_dst_addr(ctx, rga->dst_mmu_pages);
> +	rga_cmd_set_dst_addr(ctx, dst->dma_desc_pa);
>   	rga_cmd_set_mode(ctx);
>   
>   	rga_cmd_set_trans_info(ctx);
> @@ -400,11 +401,12 @@ static void rga_cmd_set(struct rga_ctx *ctx)
>   		PAGE_SIZE, DMA_BIDIRECTIONAL);
>   }
>   
> -void rga_hw_start(struct rockchip_rga *rga)
> +void rga_hw_start(struct rockchip_rga *rga,
> +		  struct rga_vb_buffer *src, struct rga_vb_buffer *dst)
>   {
>   	struct rga_ctx *ctx = rga->curr;
>   
> -	rga_cmd_set(ctx);
> +	rga_cmd_set(ctx, src, dst);
>   
>   	rga_write(rga, RGA_SYS_CTRL, 0x00);
>   
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
> index 25f5b5eebf13..f18fccc7b204 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -45,10 +45,7 @@ static void device_run(void *prv)
>   	src = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
>   	dst = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
>   
> -	rga_buf_map(&src->vb2_buf);
> -	rga_buf_map(&dst->vb2_buf);
> -
> -	rga_hw_start(rga);
> +	rga_hw_start(rga, vb_to_rga(src), vb_to_rga(dst));
>   
>   	spin_unlock_irqrestore(&rga->ctrl_lock, flags);
>   }
> @@ -101,7 +98,7 @@ queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq)
>   	src_vq->drv_priv = ctx;
>   	src_vq->ops = &rga_qops;
>   	src_vq->mem_ops = &vb2_dma_sg_memops;
> -	src_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
> +	src_vq->buf_struct_size = sizeof(struct rga_vb_buffer);
>   	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
>   	src_vq->lock = &ctx->rga->mutex;
>   	src_vq->dev = ctx->rga->v4l2_dev.dev;
> @@ -115,7 +112,7 @@ queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq)
>   	dst_vq->drv_priv = ctx;
>   	dst_vq->ops = &rga_qops;
>   	dst_vq->mem_ops = &vb2_dma_sg_memops;
> -	dst_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
> +	dst_vq->buf_struct_size = sizeof(struct rga_vb_buffer);
>   	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
>   	dst_vq->lock = &ctx->rga->mutex;
>   	dst_vq->dev = ctx->rga->v4l2_dev.dev;
> @@ -872,26 +869,13 @@ static int rga_probe(struct platform_device *pdev)
>   		goto rel_m2m;
>   	}
>   
> -	rga->src_mmu_pages =
> -		(unsigned int *)__get_free_pages(GFP_KERNEL | __GFP_ZERO, 3);
> -	if (!rga->src_mmu_pages) {
> -		ret = -ENOMEM;
> -		goto free_dma;
> -	}
> -	rga->dst_mmu_pages =
> -		(unsigned int *)__get_free_pages(GFP_KERNEL | __GFP_ZERO, 3);
> -	if (!rga->dst_mmu_pages) {
> -		ret = -ENOMEM;
> -		goto free_src_pages;
> -	}
> -
>   	def_frame.stride = (def_frame.width * def_frame.fmt->depth) >> 3;
>   	def_frame.size = def_frame.stride * def_frame.height;
>   
>   	ret = video_register_device(vfd, VFL_TYPE_VIDEO, -1);
>   	if (ret) {
>   		v4l2_err(&rga->v4l2_dev, "Failed to register video device\n");
> -		goto free_dst_pages;
> +		goto free_dma;
>   	}
>   
>   	v4l2_info(&rga->v4l2_dev, "Registered %s as /dev/%s\n",
> @@ -899,10 +883,6 @@ static int rga_probe(struct platform_device *pdev)
>   
>   	return 0;
>   
> -free_dst_pages:
> -	free_pages((unsigned long)rga->dst_mmu_pages, 3);
> -free_src_pages:
> -	free_pages((unsigned long)rga->src_mmu_pages, 3);
>   free_dma:
>   	dma_free_attrs(rga->dev, RGA_CMDBUF_SIZE, rga->cmdbuf_virt,
>   		       rga->cmdbuf_phy, DMA_ATTR_WRITE_COMBINE);
> @@ -925,9 +905,6 @@ static void rga_remove(struct platform_device *pdev)
>   	dma_free_attrs(rga->dev, RGA_CMDBUF_SIZE, rga->cmdbuf_virt,
>   		       rga->cmdbuf_phy, DMA_ATTR_WRITE_COMBINE);
>   
> -	free_pages((unsigned long)rga->src_mmu_pages, 3);
> -	free_pages((unsigned long)rga->dst_mmu_pages, 3);
> -
>   	v4l2_info(&rga->v4l2_dev, "Removing\n");
>   
>   	v4l2_m2m_release(rga->m2m_dev);
> diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
> index 22f7da28ac51..ae984d5a236d 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -85,15 +85,27 @@ struct rockchip_rga {
>   	struct rga_ctx *curr;
>   	dma_addr_t cmdbuf_phy;
>   	void *cmdbuf_virt;
> -	struct rga_dma_desc *src_mmu_pages;
> -	struct rga_dma_desc *dst_mmu_pages;
>   };
>   
> +struct rga_vb_buffer {
> +	struct vb2_v4l2_buffer vb_buf;
> +	struct list_head queue;
> +
> +	/* RGA MMU mapping for this buffer */
> +	struct rga_dma_desc *dma_desc;
> +	dma_addr_t dma_desc_pa;
> +	int n_desc;
> +};
> +
> +static inline struct rga_vb_buffer *vb_to_rga(struct vb2_v4l2_buffer *vb)
> +{
> +	return container_of(vb, struct rga_vb_buffer, vb_buf);
> +}
> +
>   struct rga_frame *rga_get_frame(struct rga_ctx *ctx, enum v4l2_buf_type type);
>   
>   /* RGA Buffers Manage */
>   extern const struct vb2_ops rga_qops;
> -void rga_buf_map(struct vb2_buffer *vb);
>   
>   /* RGA Hardware */
>   static inline void rga_write(struct rockchip_rga *rga, u32 reg, u32 value)
> @@ -114,6 +126,7 @@ static inline void rga_mod(struct rockchip_rga *rga, u32 reg, u32 val, u32 mask)
>   	rga_write(rga, reg, temp);
>   };
>   
> -void rga_hw_start(struct rockchip_rga *rga);
> +void rga_hw_start(struct rockchip_rga *rga,
> +		  struct rga_vb_buffer *src, struct rga_vb_buffer *dst);
>   
>   #endif
> 
