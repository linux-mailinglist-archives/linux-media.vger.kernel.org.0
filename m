Return-Path: <linux-media+bounces-42938-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A83ACB91088
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 14:03:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E0DA4212C4
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 12:03:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 056E9303A24;
	Mon, 22 Sep 2025 12:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="b2YGDvS0"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB353208;
	Mon, 22 Sep 2025 12:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758542619; cv=none; b=u+LaUb33sMt4DRNmainhDL0uEQI6ZwLIxQxYBO0s+XBEQqUdMZBVDDSI0Ejp5b6CQJ1QL6X7CmYTT/lOrul5IlubapYe74XCDoht0vLVQgcXQnvHMIsCPPbYF3CF5xGXI+mNGWfFVU/jcD+igJmWIzuF3CO8cRlBgq0ECsSMoz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758542619; c=relaxed/simple;
	bh=TSifsDY2MLHnyHMUQ32ICWjn3sn1KzMcLALEQBHUPZY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MahqKJFFrmAY3tKBIQqtK2OjDjEzx4mrMA1RJI13O+N4obUB018HFscQ9D9T8KrY+d7bwgLeB9quQODdp4hELl+OQ2CRHiLI+psAtY2UMhCo6FubYDxlokZ8bali8XGmoimIzHks37n4Z7tH/TboftM44hgUQGtZ37D1BCbNp/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=b2YGDvS0; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CDB08669;
	Mon, 22 Sep 2025 14:02:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758542532;
	bh=TSifsDY2MLHnyHMUQ32ICWjn3sn1KzMcLALEQBHUPZY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=b2YGDvS0Eafex9Whp+2AouOw5VwI0GneaGuwnkIfrxuPQrWqhmpOQgYDgS76NeDbm
	 ATpDRJDCnpWyiXOF/3cX2wqP05kVoOFqZW4+fq4MsPtbRDryvVE0Ff9Qt/mGXdKFUp
	 UzKhJnfBVahnkBlJsMTdBi/Wy+LSSwM5akZSiKog=
Message-ID: <fe72238a-c417-4584-9a38-f625d371dc84@ideasonboard.com>
Date: Mon, 22 Sep 2025 15:03:30 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/16] media: ti: j721e-csi2rx: separate out device and
 context
To: Rishikesh Donadkar <r-donadkar@ti.com>, jai.luthra@linux.dev,
 laurent.pinchart@ideasonboard.com, mripard@kernel.org
Cc: y-abhilashchandra@ti.com, devarsht@ti.com, s-jain1@ti.com,
 vigneshr@ti.com, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 p.zabel@pengutronix.de, conor+dt@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil-cisco@xs4all.nl, jai.luthra@ideasonboard.com,
 changhuang.liang@starfivetech.com, jack.zhu@starfivetech.com,
 sjoerd@collabora.com, hverkuil+cisco@kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250911102832.1583440-1-r-donadkar@ti.com>
 <20250911102832.1583440-4-r-donadkar@ti.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20250911102832.1583440-4-r-donadkar@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11/09/2025 13:28, Rishikesh Donadkar wrote:
> From: Jai Luthra <j-luthra@ti.com>
> 
> The TI CSI2RX wrapper has two parts: the main device and the DMA
> contexts. The driver was originally written with single camera capture
> in mind, so only one DMA context was needed. For the sake of simplicity,
> the context specific stuff was not modeled different to the main device.
> 
> To enable multiplexed stream capture, the contexts need to be separated
> out from the main device. Create a struct ti_csi2rx_ctx that holds the
> DMA context specific things. Separate out functions handling the device
> and context related functionality.
> 
> Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> Co-developed-by: Pratyush Yadav <p.yadav@ti.com>
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> ---
>  .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 423 ++++++++++--------

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

 Tomi

>  1 file changed, 234 insertions(+), 189 deletions(-)
> 
> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> index 6a981b5f5d51..25d905be1728 100644
> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> @@ -44,6 +44,8 @@
>  
>  #define TI_CSI2RX_MAX_PIX_PER_CLK	4
>  #define PSIL_WORD_SIZE_BYTES		16
> +#define TI_CSI2RX_NUM_CTX		1
> +
>  /*
>   * There are no hard limits on the width or height. The DMA engine can handle
>   * all sizes. The max width and height are arbitrary numbers for this driver.
> @@ -70,7 +72,7 @@ struct ti_csi2rx_buffer {
>  	/* Common v4l2 buffer. Must be first. */
>  	struct vb2_v4l2_buffer		vb;
>  	struct list_head		list;
> -	struct ti_csi2rx_dev		*csi;
> +	struct ti_csi2rx_ctx		*ctx;
>  };
>  
>  enum ti_csi2rx_dma_state {
> @@ -90,30 +92,38 @@ struct ti_csi2rx_dma {
>  	 * Queue of buffers submitted to DMA engine.
>  	 */
>  	struct list_head		submitted;
> -	/* Buffer to drain stale data from PSI-L endpoint */
> -	struct {
> -		void			*vaddr;
> -		dma_addr_t		paddr;
> -		size_t			len;
> -	} drain;
> +};
> +
> +struct ti_csi2rx_dev;
> +
> +struct ti_csi2rx_ctx {
> +	struct ti_csi2rx_dev		*csi;
> +	struct video_device		vdev;
> +	struct vb2_queue		vidq;
> +	struct mutex			mutex; /* To serialize ioctls. */
> +	struct v4l2_format		v_fmt;
> +	struct ti_csi2rx_dma		dma;
> +	u32				sequence;
> +	u32				idx;
>  };
>  
>  struct ti_csi2rx_dev {
>  	struct device			*dev;
>  	void __iomem			*shim;
>  	struct v4l2_device		v4l2_dev;
> -	struct video_device		vdev;
>  	struct media_device		mdev;
>  	struct media_pipeline		pipe;
>  	struct media_pad		pad;
>  	struct v4l2_async_notifier	notifier;
>  	struct v4l2_subdev		*source;
> -	struct vb2_queue		vidq;
> -	struct mutex			mutex; /* To serialize ioctls. */
> -	struct v4l2_format		v_fmt;
> -	struct ti_csi2rx_dma		dma;
> -	u32				sequence;
> +	struct ti_csi2rx_ctx		ctx[TI_CSI2RX_NUM_CTX];
>  	u8				pix_per_clk;
> +	/* Buffer to drain stale data from PSI-L endpoint */
> +	struct {
> +		void			*vaddr;
> +		dma_addr_t		paddr;
> +		size_t			len;
> +	} drain;
>  };
>  
>  static const struct ti_csi2rx_fmt ti_csi2rx_formats[] = {
> @@ -219,7 +229,7 @@ static const struct ti_csi2rx_fmt ti_csi2rx_formats[] = {
>  };
>  
>  /* Forward declaration needed by ti_csi2rx_dma_callback. */
> -static int ti_csi2rx_start_dma(struct ti_csi2rx_dev *csi,
> +static int ti_csi2rx_start_dma(struct ti_csi2rx_ctx *ctx,
>  			       struct ti_csi2rx_buffer *buf);
>  
>  static const struct ti_csi2rx_fmt *find_format_by_fourcc(u32 pixelformat)
> @@ -302,7 +312,7 @@ static int ti_csi2rx_enum_fmt_vid_cap(struct file *file, void *priv,
>  static int ti_csi2rx_g_fmt_vid_cap(struct file *file, void *priv,
>  				   struct v4l2_format *f)
>  {
> -	struct ti_csi2rx_dev *csi = video_drvdata(file);
> +	struct ti_csi2rx_ctx *csi = video_drvdata(file);
>  
>  	*f = csi->v_fmt;
>  
> @@ -333,7 +343,7 @@ static int ti_csi2rx_try_fmt_vid_cap(struct file *file, void *priv,
>  static int ti_csi2rx_s_fmt_vid_cap(struct file *file, void *priv,
>  				   struct v4l2_format *f)
>  {
> -	struct ti_csi2rx_dev *csi = video_drvdata(file);
> +	struct ti_csi2rx_ctx *csi = video_drvdata(file);
>  	struct vb2_queue *q = &csi->vidq;
>  	int ret;
>  
> @@ -411,26 +421,35 @@ static int csi_async_notifier_bound(struct v4l2_async_notifier *notifier,
>  static int csi_async_notifier_complete(struct v4l2_async_notifier *notifier)
>  {
>  	struct ti_csi2rx_dev *csi = dev_get_drvdata(notifier->v4l2_dev->dev);
> -	struct video_device *vdev = &csi->vdev;
> -	int ret;
> +	int ret, i;
>  
> -	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
> -	if (ret)
> -		return ret;
> -
> -	ret = media_create_pad_link(&csi->source->entity, CSI2RX_BRIDGE_SOURCE_PAD,
> -				    &vdev->entity, csi->pad.index,
> -				    MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED);
> +	for (i = 0; i < TI_CSI2RX_NUM_CTX; i++) {
> +		struct ti_csi2rx_ctx *ctx = &csi->ctx[i];
> +		struct video_device *vdev = &ctx->vdev;
>  
> -	if (ret) {
> -		video_unregister_device(vdev);
> -		return ret;
> +		ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
> +		if (ret)
> +			goto unregister_dev;
>  	}
>  
> +	ret = media_create_pad_link(&csi->source->entity,
> +				    CSI2RX_BRIDGE_SOURCE_PAD,
> +				    &csi->ctx[0].vdev.entity, csi->pad.index,
> +				    MEDIA_LNK_FL_IMMUTABLE |
> +				    MEDIA_LNK_FL_ENABLED);
> +	if (ret)
> +		goto unregister_dev;
> +
>  	ret = v4l2_device_register_subdev_nodes(&csi->v4l2_dev);
>  	if (ret)
> -		video_unregister_device(vdev);
> +		goto unregister_dev;
>  
> +	return 0;
> +
> +unregister_dev:
> +	i--;
> +	for (; i >= 0; i--)
> +		video_unregister_device(&csi->ctx[i].vdev);
>  	return ret;
>  }
>  
> @@ -475,13 +494,14 @@ static int ti_csi2rx_notifier_register(struct ti_csi2rx_dev *csi)
>  }
>  
>  /* Request maximum possible pixels per clock from the bridge */
> -static void ti_csi2rx_request_max_ppc(struct ti_csi2rx_dev *csi)
> +static void ti_csi2rx_request_max_ppc(struct ti_csi2rx_ctx *ctx)
>  {
> +	struct ti_csi2rx_dev *csi = ctx->csi;
>  	u8 ppc = TI_CSI2RX_MAX_PIX_PER_CLK;
>  	struct media_pad *pad;
>  	int ret;
>  
> -	pad = media_entity_remote_source_pad_unique(&csi->vdev.entity);
> +	pad = media_entity_remote_source_pad_unique(&ctx->vdev.entity);
>  	if (!pad)
>  		return;
>  
> @@ -494,19 +514,20 @@ static void ti_csi2rx_request_max_ppc(struct ti_csi2rx_dev *csi)
>  	}
>  }
>  
> -static void ti_csi2rx_setup_shim(struct ti_csi2rx_dev *csi)
> +static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
>  {
> +	struct ti_csi2rx_dev *csi = ctx->csi;
>  	const struct ti_csi2rx_fmt *fmt;
>  	unsigned int reg;
>  
> -	fmt = find_format_by_fourcc(csi->v_fmt.fmt.pix.pixelformat);
> +	fmt = find_format_by_fourcc(ctx->v_fmt.fmt.pix.pixelformat);
>  
>  	/* De-assert the pixel interface reset. */
>  	reg = SHIM_CNTL_PIX_RST;
>  	writel(reg, csi->shim + SHIM_CNTL);
>  
>  	/* Negotiate pixel count from the source */
> -	ti_csi2rx_request_max_ppc(csi);
> +	ti_csi2rx_request_max_ppc(ctx);
>  
>  	reg = SHIM_DMACNTX_EN;
>  	reg |= FIELD_PREP(SHIM_DMACNTX_FMT, fmt->csi_dt);
> @@ -573,8 +594,9 @@ static void ti_csi2rx_drain_callback(void *param)
>   * To prevent that stale data corrupting the subsequent transactions, it is
>   * required to issue DMA requests to drain it out.
>   */
> -static int ti_csi2rx_drain_dma(struct ti_csi2rx_dev *csi)
> +static int ti_csi2rx_drain_dma(struct ti_csi2rx_ctx *ctx)
>  {
> +	struct ti_csi2rx_dev *csi = ctx->csi;
>  	struct dma_async_tx_descriptor *desc;
>  	struct completion drain_complete;
>  	dma_cookie_t cookie;
> @@ -582,8 +604,8 @@ static int ti_csi2rx_drain_dma(struct ti_csi2rx_dev *csi)
>  
>  	init_completion(&drain_complete);
>  
> -	desc = dmaengine_prep_slave_single(csi->dma.chan, csi->dma.drain.paddr,
> -					   csi->dma.drain.len, DMA_DEV_TO_MEM,
> +	desc = dmaengine_prep_slave_single(ctx->dma.chan, csi->drain.paddr,
> +					   csi->drain.len, DMA_DEV_TO_MEM,
>  					   DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
>  	if (!desc) {
>  		ret = -EIO;
> @@ -598,11 +620,11 @@ static int ti_csi2rx_drain_dma(struct ti_csi2rx_dev *csi)
>  	if (ret)
>  		goto out;
>  
> -	dma_async_issue_pending(csi->dma.chan);
> +	dma_async_issue_pending(ctx->dma.chan);
>  
>  	if (!wait_for_completion_timeout(&drain_complete,
>  					 msecs_to_jiffies(DRAIN_TIMEOUT_MS))) {
> -		dmaengine_terminate_sync(csi->dma.chan);
> +		dmaengine_terminate_sync(ctx->dma.chan);
>  		dev_dbg(csi->dev, "DMA transfer timed out for drain buffer\n");
>  		ret = -ETIMEDOUT;
>  		goto out;
> @@ -614,8 +636,9 @@ static int ti_csi2rx_drain_dma(struct ti_csi2rx_dev *csi)
>  static void ti_csi2rx_dma_callback(void *param)
>  {
>  	struct ti_csi2rx_buffer *buf = param;
> -	struct ti_csi2rx_dev *csi = buf->csi;
> -	struct ti_csi2rx_dma *dma = &csi->dma;
> +	struct ti_csi2rx_ctx *ctx = buf->ctx;
> +	struct ti_csi2rx_dev *csi = ctx->csi;
> +	struct ti_csi2rx_dma *dma = &ctx->dma;
>  	unsigned long flags;
>  
>  	/*
> @@ -623,7 +646,7 @@ static void ti_csi2rx_dma_callback(void *param)
>  	 * hardware monitor registers.
>  	 */
>  	buf->vb.vb2_buf.timestamp = ktime_get_ns();
> -	buf->vb.sequence = csi->sequence++;
> +	buf->vb.sequence = ctx->sequence++;
>  
>  	spin_lock_irqsave(&dma->lock, flags);
>  
> @@ -635,7 +658,7 @@ static void ti_csi2rx_dma_callback(void *param)
>  	while (!list_empty(&dma->queue)) {
>  		buf = list_entry(dma->queue.next, struct ti_csi2rx_buffer, list);
>  
> -		if (ti_csi2rx_start_dma(csi, buf)) {
> +		if (ti_csi2rx_start_dma(ctx, buf)) {
>  			dev_err(csi->dev, "Failed to queue the next buffer for DMA\n");
>  			list_del(&buf->list);
>  			vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
> @@ -650,17 +673,17 @@ static void ti_csi2rx_dma_callback(void *param)
>  	spin_unlock_irqrestore(&dma->lock, flags);
>  }
>  
> -static int ti_csi2rx_start_dma(struct ti_csi2rx_dev *csi,
> +static int ti_csi2rx_start_dma(struct ti_csi2rx_ctx *ctx,
>  			       struct ti_csi2rx_buffer *buf)
>  {
>  	unsigned long addr;
>  	struct dma_async_tx_descriptor *desc;
> -	size_t len = csi->v_fmt.fmt.pix.sizeimage;
> +	size_t len = ctx->v_fmt.fmt.pix.sizeimage;
>  	dma_cookie_t cookie;
>  	int ret = 0;
>  
>  	addr = vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
> -	desc = dmaengine_prep_slave_single(csi->dma.chan, addr, len,
> +	desc = dmaengine_prep_slave_single(ctx->dma.chan, addr, len,
>  					   DMA_DEV_TO_MEM,
>  					   DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
>  	if (!desc)
> @@ -674,20 +697,20 @@ static int ti_csi2rx_start_dma(struct ti_csi2rx_dev *csi,
>  	if (ret)
>  		return ret;
>  
> -	dma_async_issue_pending(csi->dma.chan);
> +	dma_async_issue_pending(ctx->dma.chan);
>  
>  	return 0;
>  }
>  
> -static void ti_csi2rx_stop_dma(struct ti_csi2rx_dev *csi)
> +static void ti_csi2rx_stop_dma(struct ti_csi2rx_ctx *ctx)
>  {
> -	struct ti_csi2rx_dma *dma = &csi->dma;
> +	struct ti_csi2rx_dma *dma = &ctx->dma;
>  	enum ti_csi2rx_dma_state state;
>  	unsigned long flags;
>  	int ret;
>  
>  	spin_lock_irqsave(&dma->lock, flags);
> -	state = csi->dma.state;
> +	state = ctx->dma.state;
>  	dma->state = TI_CSI2RX_DMA_STOPPED;
>  	spin_unlock_irqrestore(&dma->lock, flags);
>  
> @@ -698,30 +721,30 @@ static void ti_csi2rx_stop_dma(struct ti_csi2rx_dev *csi)
>  		 * is stopped, as the module-level pixel reset cannot be
>  		 * enforced before terminating DMA.
>  		 */
> -		ret = ti_csi2rx_drain_dma(csi);
> +		ret = ti_csi2rx_drain_dma(ctx);
>  		if (ret && ret != -ETIMEDOUT)
> -			dev_warn(csi->dev,
> +			dev_warn(ctx->csi->dev,
>  				 "Failed to drain DMA. Next frame might be bogus\n");
>  	}
>  
> -	ret = dmaengine_terminate_sync(csi->dma.chan);
> +	ret = dmaengine_terminate_sync(ctx->dma.chan);
>  	if (ret)
> -		dev_err(csi->dev, "Failed to stop DMA: %d\n", ret);
> +		dev_err(ctx->csi->dev, "Failed to stop DMA: %d\n", ret);
>  }
>  
> -static void ti_csi2rx_cleanup_buffers(struct ti_csi2rx_dev *csi,
> +static void ti_csi2rx_cleanup_buffers(struct ti_csi2rx_ctx *ctx,
>  				      enum vb2_buffer_state state)
>  {
> -	struct ti_csi2rx_dma *dma = &csi->dma;
> +	struct ti_csi2rx_dma *dma = &ctx->dma;
>  	struct ti_csi2rx_buffer *buf, *tmp;
>  	unsigned long flags;
>  
>  	spin_lock_irqsave(&dma->lock, flags);
> -	list_for_each_entry_safe(buf, tmp, &csi->dma.queue, list) {
> +	list_for_each_entry_safe(buf, tmp, &ctx->dma.queue, list) {
>  		list_del(&buf->list);
>  		vb2_buffer_done(&buf->vb.vb2_buf, state);
>  	}
> -	list_for_each_entry_safe(buf, tmp, &csi->dma.submitted, list) {
> +	list_for_each_entry_safe(buf, tmp, &ctx->dma.submitted, list) {
>  		list_del(&buf->list);
>  		vb2_buffer_done(&buf->vb.vb2_buf, state);
>  	}
> @@ -732,8 +755,8 @@ static int ti_csi2rx_queue_setup(struct vb2_queue *q, unsigned int *nbuffers,
>  				 unsigned int *nplanes, unsigned int sizes[],
>  				 struct device *alloc_devs[])
>  {
> -	struct ti_csi2rx_dev *csi = vb2_get_drv_priv(q);
> -	unsigned int size = csi->v_fmt.fmt.pix.sizeimage;
> +	struct ti_csi2rx_ctx *ctx = vb2_get_drv_priv(q);
> +	unsigned int size = ctx->v_fmt.fmt.pix.sizeimage;
>  
>  	if (*nplanes) {
>  		if (sizes[0] < size)
> @@ -749,11 +772,11 @@ static int ti_csi2rx_queue_setup(struct vb2_queue *q, unsigned int *nbuffers,
>  
>  static int ti_csi2rx_buffer_prepare(struct vb2_buffer *vb)
>  {
> -	struct ti_csi2rx_dev *csi = vb2_get_drv_priv(vb->vb2_queue);
> -	unsigned long size = csi->v_fmt.fmt.pix.sizeimage;
> +	struct ti_csi2rx_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
> +	unsigned long size = ctx->v_fmt.fmt.pix.sizeimage;
>  
>  	if (vb2_plane_size(vb, 0) < size) {
> -		dev_err(csi->dev, "Data will not fit into plane\n");
> +		dev_err(ctx->csi->dev, "Data will not fit into plane\n");
>  		return -EINVAL;
>  	}
>  
> @@ -763,15 +786,15 @@ static int ti_csi2rx_buffer_prepare(struct vb2_buffer *vb)
>  
>  static void ti_csi2rx_buffer_queue(struct vb2_buffer *vb)
>  {
> -	struct ti_csi2rx_dev *csi = vb2_get_drv_priv(vb->vb2_queue);
> +	struct ti_csi2rx_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
>  	struct ti_csi2rx_buffer *buf;
> -	struct ti_csi2rx_dma *dma = &csi->dma;
> +	struct ti_csi2rx_dma *dma = &ctx->dma;
>  	bool restart_dma = false;
>  	unsigned long flags = 0;
>  	int ret;
>  
>  	buf = container_of(vb, struct ti_csi2rx_buffer, vb.vb2_buf);
> -	buf->csi = csi;
> +	buf->ctx = ctx;
>  
>  	spin_lock_irqsave(&dma->lock, flags);
>  	/*
> @@ -800,18 +823,18 @@ static void ti_csi2rx_buffer_queue(struct vb2_buffer *vb)
>  		 * the application and will only confuse it. Issue a DMA
>  		 * transaction to drain that up.
>  		 */
> -		ret = ti_csi2rx_drain_dma(csi);
> +		ret = ti_csi2rx_drain_dma(ctx);
>  		if (ret && ret != -ETIMEDOUT)
> -			dev_warn(csi->dev,
> +			dev_warn(ctx->csi->dev,
>  				 "Failed to drain DMA. Next frame might be bogus\n");
>  
>  		spin_lock_irqsave(&dma->lock, flags);
> -		ret = ti_csi2rx_start_dma(csi, buf);
> +		ret = ti_csi2rx_start_dma(ctx, buf);
>  		if (ret) {
>  			vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
>  			dma->state = TI_CSI2RX_DMA_IDLE;
>  			spin_unlock_irqrestore(&dma->lock, flags);
> -			dev_err(csi->dev, "Failed to start DMA: %d\n", ret);
> +			dev_err(ctx->csi->dev, "Failed to start DMA: %d\n", ret);
>  		} else {
>  			list_add_tail(&buf->list, &dma->submitted);
>  			spin_unlock_irqrestore(&dma->lock, flags);
> @@ -821,8 +844,9 @@ static void ti_csi2rx_buffer_queue(struct vb2_buffer *vb)
>  
>  static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
>  {
> -	struct ti_csi2rx_dev *csi = vb2_get_drv_priv(vq);
> -	struct ti_csi2rx_dma *dma = &csi->dma;
> +	struct ti_csi2rx_ctx *ctx = vb2_get_drv_priv(vq);
> +	struct ti_csi2rx_dev *csi = ctx->csi;
> +	struct ti_csi2rx_dma *dma = &ctx->dma;
>  	struct ti_csi2rx_buffer *buf;
>  	unsigned long flags;
>  	int ret = 0;
> @@ -834,18 +858,18 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
>  	if (ret)
>  		return ret;
>  
> -	ret = video_device_pipeline_start(&csi->vdev, &csi->pipe);
> +	ret = video_device_pipeline_start(&ctx->vdev, &csi->pipe);
>  	if (ret)
>  		goto err;
>  
> -	ti_csi2rx_setup_shim(csi);
> +	ti_csi2rx_setup_shim(ctx);
>  
> -	csi->sequence = 0;
> +	ctx->sequence = 0;
>  
>  	spin_lock_irqsave(&dma->lock, flags);
>  	buf = list_entry(dma->queue.next, struct ti_csi2rx_buffer, list);
>  
> -	ret = ti_csi2rx_start_dma(csi, buf);
> +	ret = ti_csi2rx_start_dma(ctx, buf);
>  	if (ret) {
>  		dev_err(csi->dev, "Failed to start DMA: %d\n", ret);
>  		spin_unlock_irqrestore(&dma->lock, flags);
> @@ -863,22 +887,23 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
>  	return 0;
>  
>  err_dma:
> -	ti_csi2rx_stop_dma(csi);
> +	ti_csi2rx_stop_dma(ctx);
>  err_pipeline:
> -	video_device_pipeline_stop(&csi->vdev);
> +	video_device_pipeline_stop(&ctx->vdev);
>  	writel(0, csi->shim + SHIM_CNTL);
>  	writel(0, csi->shim + SHIM_DMACNTX);
>  err:
> -	ti_csi2rx_cleanup_buffers(csi, VB2_BUF_STATE_QUEUED);
> +	ti_csi2rx_cleanup_buffers(ctx, VB2_BUF_STATE_QUEUED);
>  	return ret;
>  }
>  
>  static void ti_csi2rx_stop_streaming(struct vb2_queue *vq)
>  {
> -	struct ti_csi2rx_dev *csi = vb2_get_drv_priv(vq);
> +	struct ti_csi2rx_ctx *ctx = vb2_get_drv_priv(vq);
> +	struct ti_csi2rx_dev *csi = ctx->csi;
>  	int ret;
>  
> -	video_device_pipeline_stop(&csi->vdev);
> +	video_device_pipeline_stop(&ctx->vdev);
>  
>  	writel(0, csi->shim + SHIM_CNTL);
>  	writel(0, csi->shim + SHIM_DMACNTX);
> @@ -887,8 +912,8 @@ static void ti_csi2rx_stop_streaming(struct vb2_queue *vq)
>  	if (ret)
>  		dev_err(csi->dev, "Failed to stop subdev stream\n");
>  
> -	ti_csi2rx_stop_dma(csi);
> -	ti_csi2rx_cleanup_buffers(csi, VB2_BUF_STATE_ERROR);
> +	ti_csi2rx_stop_dma(ctx);
> +	ti_csi2rx_cleanup_buffers(ctx, VB2_BUF_STATE_ERROR);
>  }
>  
>  static const struct vb2_ops csi_vb2_qops = {
> @@ -899,20 +924,43 @@ static const struct vb2_ops csi_vb2_qops = {
>  	.stop_streaming = ti_csi2rx_stop_streaming,
>  };
>  
> -static int ti_csi2rx_init_vb2q(struct ti_csi2rx_dev *csi)
> +static void ti_csi2rx_cleanup_v4l2(struct ti_csi2rx_dev *csi)
>  {
> -	struct vb2_queue *q = &csi->vidq;
> +	media_device_unregister(&csi->mdev);
> +	v4l2_device_unregister(&csi->v4l2_dev);
> +	media_device_cleanup(&csi->mdev);
> +}
> +
> +static void ti_csi2rx_cleanup_notifier(struct ti_csi2rx_dev *csi)
> +{
> +	v4l2_async_nf_unregister(&csi->notifier);
> +	v4l2_async_nf_cleanup(&csi->notifier);
> +}
> +
> +static void ti_csi2rx_cleanup_ctx(struct ti_csi2rx_ctx *ctx)
> +{
> +	dma_release_channel(ctx->dma.chan);
> +	vb2_queue_release(&ctx->vidq);
> +
> +	video_unregister_device(&ctx->vdev);
> +
> +	mutex_destroy(&ctx->mutex);
> +}
> +
> +static int ti_csi2rx_init_vb2q(struct ti_csi2rx_ctx *ctx)
> +{
> +	struct vb2_queue *q = &ctx->vidq;
>  	int ret;
>  
>  	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
>  	q->io_modes = VB2_MMAP | VB2_DMABUF;
> -	q->drv_priv = csi;
> +	q->drv_priv = ctx;
>  	q->buf_struct_size = sizeof(struct ti_csi2rx_buffer);
>  	q->ops = &csi_vb2_qops;
>  	q->mem_ops = &vb2_dma_contig_memops;
>  	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> -	q->dev = dmaengine_get_dma_device(csi->dma.chan);
> -	q->lock = &csi->mutex;
> +	q->dev = dmaengine_get_dma_device(ctx->dma.chan);
> +	q->lock = &ctx->mutex;
>  	q->min_queued_buffers = 1;
>  	q->allow_cache_hints = 1;
>  
> @@ -920,7 +968,7 @@ static int ti_csi2rx_init_vb2q(struct ti_csi2rx_dev *csi)
>  	if (ret)
>  		return ret;
>  
> -	csi->vdev.queue = q;
> +	ctx->vdev.queue = q;
>  
>  	return 0;
>  }
> @@ -929,8 +977,9 @@ static int ti_csi2rx_link_validate(struct media_link *link)
>  {
>  	struct media_entity *entity = link->sink->entity;
>  	struct video_device *vdev = media_entity_to_video_device(entity);
> -	struct ti_csi2rx_dev *csi = container_of(vdev, struct ti_csi2rx_dev, vdev);
> -	struct v4l2_pix_format *csi_fmt = &csi->v_fmt.fmt.pix;
> +	struct ti_csi2rx_ctx *ctx = container_of(vdev, struct ti_csi2rx_ctx, vdev);
> +	struct ti_csi2rx_dev *csi = ctx->csi;
> +	struct v4l2_pix_format *csi_fmt = &ctx->v_fmt.fmt.pix;
>  	struct v4l2_subdev_format source_fmt = {
>  		.which	= V4L2_SUBDEV_FORMAT_ACTIVE,
>  		.pad	= link->source->index,
> @@ -983,47 +1032,63 @@ static const struct media_entity_operations ti_csi2rx_video_entity_ops = {
>  	.link_validate = ti_csi2rx_link_validate,
>  };
>  
> -static int ti_csi2rx_init_dma(struct ti_csi2rx_dev *csi)
> +static int ti_csi2rx_init_dma(struct ti_csi2rx_ctx *ctx)
>  {
>  	struct dma_slave_config cfg = {
>  		.src_addr_width = DMA_SLAVE_BUSWIDTH_16_BYTES,
>  	};
>  	int ret;
>  
> -	INIT_LIST_HEAD(&csi->dma.queue);
> -	INIT_LIST_HEAD(&csi->dma.submitted);
> -	spin_lock_init(&csi->dma.lock);
> -
> -	csi->dma.state = TI_CSI2RX_DMA_STOPPED;
> +	ctx->dma.chan = dma_request_chan(ctx->csi->dev, "rx0");
> +	if (IS_ERR(ctx->dma.chan))
> +		return PTR_ERR(ctx->dma.chan);
>  
> -	csi->dma.chan = dma_request_chan(csi->dev, "rx0");
> -	if (IS_ERR(csi->dma.chan))
> -		return PTR_ERR(csi->dma.chan);
> -
> -	ret = dmaengine_slave_config(csi->dma.chan, &cfg);
> +	ret = dmaengine_slave_config(ctx->dma.chan, &cfg);
>  	if (ret) {
> -		dma_release_channel(csi->dma.chan);
> +		dma_release_channel(ctx->dma.chan);
>  		return ret;
>  	}
>  
> -	csi->dma.drain.len = DRAIN_BUFFER_SIZE;
> -	csi->dma.drain.vaddr = dma_alloc_coherent(csi->dev, csi->dma.drain.len,
> -						  &csi->dma.drain.paddr,
> -						  GFP_KERNEL);
> -	if (!csi->dma.drain.vaddr)
> -		return -ENOMEM;
> -
>  	return 0;
>  }
>  
>  static int ti_csi2rx_v4l2_init(struct ti_csi2rx_dev *csi)
>  {
>  	struct media_device *mdev = &csi->mdev;
> -	struct video_device *vdev = &csi->vdev;
> +	int ret;
> +
> +	mdev->dev = csi->dev;
> +	mdev->hw_revision = 1;
> +	strscpy(mdev->model, "TI-CSI2RX", sizeof(mdev->model));
> +
> +	media_device_init(mdev);
> +
> +	csi->v4l2_dev.mdev = mdev;
> +
> +	ret = v4l2_device_register(csi->dev, &csi->v4l2_dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = media_device_register(mdev);
> +	if (ret) {
> +		v4l2_device_unregister(&csi->v4l2_dev);
> +		media_device_cleanup(mdev);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int ti_csi2rx_init_ctx(struct ti_csi2rx_ctx *ctx)
> +{
> +	struct ti_csi2rx_dev *csi = ctx->csi;
> +	struct video_device *vdev = &ctx->vdev;
>  	const struct ti_csi2rx_fmt *fmt;
> -	struct v4l2_pix_format *pix_fmt = &csi->v_fmt.fmt.pix;
> +	struct v4l2_pix_format *pix_fmt = &ctx->v_fmt.fmt.pix;
>  	int ret;
>  
> +	mutex_init(&ctx->mutex);
> +
>  	fmt = find_format_by_fourcc(V4L2_PIX_FMT_UYVY);
>  	if (!fmt)
>  		return -EINVAL;
> @@ -1032,19 +1097,20 @@ static int ti_csi2rx_v4l2_init(struct ti_csi2rx_dev *csi)
>  	pix_fmt->height = 480;
>  	pix_fmt->field = V4L2_FIELD_NONE;
>  	pix_fmt->colorspace = V4L2_COLORSPACE_SRGB;
> -	pix_fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
> -	pix_fmt->quantization = V4L2_QUANTIZATION_LIM_RANGE;
> -	pix_fmt->xfer_func = V4L2_XFER_FUNC_SRGB;
> -
> -	ti_csi2rx_fill_fmt(fmt, &csi->v_fmt);
> +	pix_fmt->ycbcr_enc = V4L2_YCBCR_ENC_601,
> +	pix_fmt->quantization = V4L2_QUANTIZATION_LIM_RANGE,
> +	pix_fmt->xfer_func = V4L2_XFER_FUNC_SRGB,
>  
> -	mdev->dev = csi->dev;
> -	mdev->hw_revision = 1;
> -	strscpy(mdev->model, "TI-CSI2RX", sizeof(mdev->model));
> +	ti_csi2rx_fill_fmt(fmt, &ctx->v_fmt);
>  
> -	media_device_init(mdev);
> +	csi->pad.flags = MEDIA_PAD_FL_SINK;
> +	vdev->entity.ops = &ti_csi2rx_video_entity_ops;
> +	ret = media_entity_pads_init(&ctx->vdev.entity, 1, &csi->pad);
> +	if (ret)
> +		return ret;
>  
> -	strscpy(vdev->name, TI_CSI2RX_MODULE_NAME, sizeof(vdev->name));
> +	snprintf(vdev->name, sizeof(vdev->name), "%s context %u",
> +		 dev_name(csi->dev), ctx->idx);
>  	vdev->v4l2_dev = &csi->v4l2_dev;
>  	vdev->vfl_dir = VFL_DIR_RX;
>  	vdev->fops = &csi_fops;
> @@ -1052,61 +1118,33 @@ static int ti_csi2rx_v4l2_init(struct ti_csi2rx_dev *csi)
>  	vdev->release = video_device_release_empty;
>  	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING |
>  			    V4L2_CAP_IO_MC;
> -	vdev->lock = &csi->mutex;
> -	video_set_drvdata(vdev, csi);
> -
> -	csi->pad.flags = MEDIA_PAD_FL_SINK;
> -	vdev->entity.ops = &ti_csi2rx_video_entity_ops;
> -	ret = media_entity_pads_init(&csi->vdev.entity, 1, &csi->pad);
> -	if (ret)
> -		return ret;
> +	vdev->lock = &ctx->mutex;
> +	video_set_drvdata(vdev, ctx);
>  
> -	csi->v4l2_dev.mdev = mdev;
> +	INIT_LIST_HEAD(&ctx->dma.queue);
> +	INIT_LIST_HEAD(&ctx->dma.submitted);
> +	spin_lock_init(&ctx->dma.lock);
> +	ctx->dma.state = TI_CSI2RX_DMA_STOPPED;
>  
> -	ret = v4l2_device_register(csi->dev, &csi->v4l2_dev);
> +	ret = ti_csi2rx_init_dma(ctx);
>  	if (ret)
>  		return ret;
>  
> -	ret = media_device_register(mdev);
> -	if (ret) {
> -		v4l2_device_unregister(&csi->v4l2_dev);
> -		media_device_cleanup(mdev);
> -		return ret;
> -	}
> +	ret = ti_csi2rx_init_vb2q(ctx);
> +	if (ret)
> +		goto cleanup_dma;
>  
>  	return 0;
> -}
> -
> -static void ti_csi2rx_cleanup_dma(struct ti_csi2rx_dev *csi)
> -{
> -	dma_free_coherent(csi->dev, csi->dma.drain.len,
> -			  csi->dma.drain.vaddr, csi->dma.drain.paddr);
> -	csi->dma.drain.vaddr = NULL;
> -	dma_release_channel(csi->dma.chan);
> -}
> -
> -static void ti_csi2rx_cleanup_v4l2(struct ti_csi2rx_dev *csi)
> -{
> -	media_device_unregister(&csi->mdev);
> -	v4l2_device_unregister(&csi->v4l2_dev);
> -	media_device_cleanup(&csi->mdev);
> -}
>  
> -static void ti_csi2rx_cleanup_subdev(struct ti_csi2rx_dev *csi)
> -{
> -	v4l2_async_nf_unregister(&csi->notifier);
> -	v4l2_async_nf_cleanup(&csi->notifier);
> -}
> -
> -static void ti_csi2rx_cleanup_vb2q(struct ti_csi2rx_dev *csi)
> -{
> -	vb2_queue_release(&csi->vidq);
> +cleanup_dma:
> +	dma_release_channel(ctx->dma.chan);
> +	return ret;
>  }
>  
>  static int ti_csi2rx_probe(struct platform_device *pdev)
>  {
>  	struct ti_csi2rx_dev *csi;
> -	int ret;
> +	int ret, i;
>  
>  	csi = devm_kzalloc(&pdev->dev, sizeof(*csi), GFP_KERNEL);
>  	if (!csi)
> @@ -1115,62 +1153,69 @@ static int ti_csi2rx_probe(struct platform_device *pdev)
>  	csi->dev = &pdev->dev;
>  	platform_set_drvdata(pdev, csi);
>  
> -	mutex_init(&csi->mutex);
>  	csi->shim = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(csi->shim)) {
>  		ret = PTR_ERR(csi->shim);
> -		goto err_mutex;
> +		return ret;
>  	}
>  
> -	ret = ti_csi2rx_init_dma(csi);
> -	if (ret)
> -		goto err_mutex;
> +	csi->drain.len = DRAIN_BUFFER_SIZE;
> +	csi->drain.vaddr = dma_alloc_coherent(csi->dev, csi->drain.len,
> +					      &csi->drain.paddr,
> +					      GFP_KERNEL);
> +	if (!csi->drain.vaddr)
> +		return -ENOMEM;
>  
>  	ret = ti_csi2rx_v4l2_init(csi);
> -	if (ret)
> -		goto err_dma;
> -
> -	ret = ti_csi2rx_init_vb2q(csi);
>  	if (ret)
>  		goto err_v4l2;
>  
> +	for (i = 0; i < TI_CSI2RX_NUM_CTX; i++) {
> +		csi->ctx[i].idx = i;
> +		csi->ctx[i].csi = csi;
> +		ret = ti_csi2rx_init_ctx(&csi->ctx[i]);
> +		if (ret)
> +			goto err_ctx;
> +	}
> +
>  	ret = ti_csi2rx_notifier_register(csi);
>  	if (ret)
> -		goto err_vb2q;
> +		goto err_ctx;
>  
>  	ret = devm_of_platform_populate(csi->dev);
>  	if (ret) {
>  		dev_err(csi->dev, "Failed to create children: %d\n", ret);
> -		goto err_subdev;
> +		goto err_notifier;
>  	}
>  
>  	return 0;
>  
> -err_subdev:
> -	ti_csi2rx_cleanup_subdev(csi);
> -err_vb2q:
> -	ti_csi2rx_cleanup_vb2q(csi);
> -err_v4l2:
> +err_notifier:
> +	ti_csi2rx_cleanup_notifier(csi);
> +err_ctx:
> +	i--;
> +	for (; i >= 0; i--)
> +		ti_csi2rx_cleanup_ctx(&csi->ctx[i]);
>  	ti_csi2rx_cleanup_v4l2(csi);
> -err_dma:
> -	ti_csi2rx_cleanup_dma(csi);
> -err_mutex:
> -	mutex_destroy(&csi->mutex);
> +err_v4l2:
> +	dma_free_coherent(csi->dev, csi->drain.len, csi->drain.vaddr,
> +			  csi->drain.paddr);
>  	return ret;
>  }
>  
>  static void ti_csi2rx_remove(struct platform_device *pdev)
>  {
>  	struct ti_csi2rx_dev *csi = platform_get_drvdata(pdev);
> +	unsigned int i;
>  
> -	video_unregister_device(&csi->vdev);
> +	for (i = 0; i < TI_CSI2RX_NUM_CTX; i++)
> +		ti_csi2rx_cleanup_ctx(&csi->ctx[i]);
>  
> -	ti_csi2rx_cleanup_vb2q(csi);
> -	ti_csi2rx_cleanup_subdev(csi);
> +	ti_csi2rx_cleanup_notifier(csi);
>  	ti_csi2rx_cleanup_v4l2(csi);
> -	ti_csi2rx_cleanup_dma(csi);
>  
> -	mutex_destroy(&csi->mutex);
> +	dma_free_coherent(csi->dev, csi->drain.len, csi->drain.vaddr,
> +			  csi->drain.paddr);
>  }
>  
>  static const struct of_device_id ti_csi2rx_of_match[] = {


