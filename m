Return-Path: <linux-media+bounces-14966-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5315892FB89
	for <lists+linux-media@lfdr.de>; Fri, 12 Jul 2024 15:36:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94B311F21D4D
	for <lists+linux-media@lfdr.de>; Fri, 12 Jul 2024 13:36:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5577416F903;
	Fri, 12 Jul 2024 13:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Xx5Zz44u"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC3FEAC7;
	Fri, 12 Jul 2024 13:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720791359; cv=none; b=ApnnFOHAUgHemPzJA/y961CmI+1OofSpmOCgilRM+/F2PKmgUaTYbJY3eh2DvuACQ94T/FlI4rKYA86xbYNJty3r090JgG6nYAUPfZm7GseIQEzpWp745F5XD8GuNb/qdyNBc5RJUjEzOPi4ji24qJAGuiTZNwJqg5a1Ja7HpgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720791359; c=relaxed/simple;
	bh=EqqNtiBpMbhWU4CRSRizjUUKAnXJCI88i3q40OtjE6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XuicsqCHMNMaAx6J7/xdOhrdY+1+fKizCqDJP3ClcM/LGLqk49jqQiRkaAXn2KKDMlBkwBDx88awVKq5jlPfwHC0KRa3b2pDxr/4BTmW4qkarHUDlgdgbpVnzLz6XiJ3lTRDoX+nhng/nzWMWVxvGrpf8d5hQDJYbHBnZ7AF1OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Xx5Zz44u; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-56-63.net.vodafone.it [5.90.56.63])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BA7985A5;
	Fri, 12 Jul 2024 15:35:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1720791321;
	bh=EqqNtiBpMbhWU4CRSRizjUUKAnXJCI88i3q40OtjE6w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xx5Zz44uR/oOavNjjmABrMph4y2OeEkRmLZ07hP5+WOVouKpEH46VARZOfrwzqroT
	 bhwY2lzBi/6jBoXYvrwFslful8uYvvXA9Ajzwawj1nqPd55u9CFjpD0kvzJ/k5UE9S
	 RosIIu0eWowfGY5Ru8Jx6qUT1ELFI3VQiMCYCzpM=
Date: Fri, 12 Jul 2024 15:35:51 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Jai Luthra <j-luthra@ti.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Vaishnav Achath <vaishnav.a@ti.com>, 
	Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>, 
	Aradhya Bhatia <a-bhatia1@ti.com>, Devarsh Thakkar <devarsht@ti.com>, 
	Changhuang Liang <changhuang.liang@starfivetech.com>, Jack Zhu <jack.zhu@starfivetech.com>, 
	Julien Massot <julien.massot@collabora.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 03/13] media: ti: j721e-csi2rx: separate out device
 and context
Message-ID: <6ho73ubcxq344i63aqwj7p36lptondqp5ue3nb4gf5dlglx2zv@d36zp3nafx4q>
References: <20240627-multistream-v2-0-6ae96c54c1c3@ti.com>
 <20240627-multistream-v2-3-6ae96c54c1c3@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240627-multistream-v2-3-6ae96c54c1c3@ti.com>

Hi Jai

On Thu, Jun 27, 2024 at 06:39:58PM GMT, Jai Luthra wrote:
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
> Co-developed-by: Pratyush Yadav <p.yadav@ti.com>
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> ---
>  .../media/platform/ti/j721e-csi2rx/j721e-csi2rx.c  | 423 ++++++++++++---------
>  1 file changed, 242 insertions(+), 181 deletions(-)
>
> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> index 22442fce7607..d8dfe0002b72 100644
> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> @@ -40,6 +40,8 @@
>  #define SHIM_PSI_CFG0_DST_TAG		GENMASK(31, 16)
>
>  #define PSIL_WORD_SIZE_BYTES		16
> +#define TI_CSI2RX_NUM_CTX		1
> +
>  /*
>   * There are no hard limits on the width or height. The DMA engine can handle
>   * all sizes. The max width and height are arbitrary numbers for this driver.
> @@ -64,7 +66,7 @@ struct ti_csi2rx_buffer {
>  	/* Common v4l2 buffer. Must be first. */
>  	struct vb2_v4l2_buffer		vb;
>  	struct list_head		list;
> -	struct ti_csi2rx_dev		*csi;
> +	struct ti_csi2rx_ctx		*ctx;
>  };
>
>  enum ti_csi2rx_dma_state {
> @@ -84,29 +86,37 @@ struct ti_csi2rx_dma {
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
> +	/* Buffer to drain stale data from PSI-L endpoint */
> +	struct {
> +		void			*vaddr;
> +		dma_addr_t		paddr;
> +		size_t			len;
> +	} drain;
>  };
>
>  static const struct ti_csi2rx_fmt ti_csi2rx_formats[] = {
> @@ -212,7 +222,7 @@ static const struct ti_csi2rx_fmt ti_csi2rx_formats[] = {
>  };
>
>  /* Forward declaration needed by ti_csi2rx_dma_callback. */
> -static int ti_csi2rx_start_dma(struct ti_csi2rx_dev *csi,
> +static int ti_csi2rx_start_dma(struct ti_csi2rx_ctx *ctx,
>  			       struct ti_csi2rx_buffer *buf);
>
>  static const struct ti_csi2rx_fmt *find_format_by_fourcc(u32 pixelformat)
> @@ -302,7 +312,7 @@ static int ti_csi2rx_enum_fmt_vid_cap(struct file *file, void *priv,
>  static int ti_csi2rx_g_fmt_vid_cap(struct file *file, void *prov,
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
> @@ -419,25 +429,33 @@ static int csi_async_notifier_bound(struct v4l2_async_notifier *notifier,
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
> +	for (i = 0; i < TI_CSI2RX_NUM_CTX; i++) {
> +		struct ti_csi2rx_ctx *ctx = &csi->ctx[i];
> +		struct video_device *vdev = &ctx->vdev;
>
> -	ret = v4l2_create_fwnode_links_to_pad(csi->source, &csi->pad,
> -					      MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED);
> -
> -	if (ret) {
> -		video_unregister_device(vdev);
> -		return ret;
> +		ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
> +		if (ret)
> +			goto unregister_dev;
>  	}
>
> +	ret = v4l2_create_fwnode_links_to_pad(csi->source, &csi->pad,
> +					      MEDIA_LNK_FL_IMMUTABLE |
> +					      MEDIA_LNK_FL_ENABLED);
> +	if (ret)
> +		goto unregister_dev;
> +
>  	ret = v4l2_device_register_subdev_nodes(&csi->v4l2_dev);
>  	if (ret)
> -		video_unregister_device(vdev);
> +		goto unregister_dev;
> +
> +	return 0;
>
> +unregister_dev:
> +	i--;
> +	for (; i >= 0; i--)
> +		video_unregister_device(&csi->ctx[i].vdev);
>  	return ret;
>  }
>
> @@ -483,12 +501,13 @@ static int ti_csi2rx_notifier_register(struct ti_csi2rx_dev *csi)
>  	return 0;
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
> @@ -555,8 +574,9 @@ static void ti_csi2rx_drain_callback(void *param)
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
> @@ -564,8 +584,8 @@ static int ti_csi2rx_drain_dma(struct ti_csi2rx_dev *csi)
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
> @@ -580,11 +600,11 @@ static int ti_csi2rx_drain_dma(struct ti_csi2rx_dev *csi)
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
> @@ -596,8 +616,8 @@ static int ti_csi2rx_drain_dma(struct ti_csi2rx_dev *csi)
>  static void ti_csi2rx_dma_callback(void *param)
>  {
>  	struct ti_csi2rx_buffer *buf = param;
> -	struct ti_csi2rx_dev *csi = buf->csi;
> -	struct ti_csi2rx_dma *dma = &csi->dma;
> +	struct ti_csi2rx_ctx *ctx = buf->ctx;
> +	struct ti_csi2rx_dma *dma = &ctx->dma;
>  	unsigned long flags;
>
>  	/*
> @@ -605,7 +625,7 @@ static void ti_csi2rx_dma_callback(void *param)
>  	 * hardware monitor registers.
>  	 */
>  	buf->vb.vb2_buf.timestamp = ktime_get_ns();
> -	buf->vb.sequence = csi->sequence++;
> +	buf->vb.sequence = ctx->sequence++;
>
>  	spin_lock_irqsave(&dma->lock, flags);
>
> @@ -617,8 +637,9 @@ static void ti_csi2rx_dma_callback(void *param)
>  	while (!list_empty(&dma->queue)) {
>  		buf = list_entry(dma->queue.next, struct ti_csi2rx_buffer, list);
>
> -		if (ti_csi2rx_start_dma(csi, buf)) {
> -			dev_err(csi->dev, "Failed to queue the next buffer for DMA\n");
> +		if (ti_csi2rx_start_dma(ctx, buf)) {
> +			dev_err(ctx->csi->dev,
> +				"Failed to queue the next buffer for DMA\n");
>  			vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
>  		} else {
>  			list_move_tail(&buf->list, &dma->submitted);
> @@ -631,17 +652,17 @@ static void ti_csi2rx_dma_callback(void *param)
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
> @@ -655,20 +676,20 @@ static int ti_csi2rx_start_dma(struct ti_csi2rx_dev *csi,
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
> @@ -679,30 +700,30 @@ static void ti_csi2rx_stop_dma(struct ti_csi2rx_dev *csi)
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
> @@ -713,8 +734,8 @@ static int ti_csi2rx_queue_setup(struct vb2_queue *q, unsigned int *nbuffers,
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
> @@ -730,11 +751,11 @@ static int ti_csi2rx_queue_setup(struct vb2_queue *q, unsigned int *nbuffers,
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
> @@ -744,15 +765,15 @@ static int ti_csi2rx_buffer_prepare(struct vb2_buffer *vb)
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
> @@ -781,18 +802,18 @@ static void ti_csi2rx_buffer_queue(struct vb2_buffer *vb)
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
> @@ -802,8 +823,9 @@ static void ti_csi2rx_buffer_queue(struct vb2_buffer *vb)
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
> @@ -815,18 +837,18 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
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
> @@ -844,22 +866,23 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
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
> @@ -868,8 +891,8 @@ static void ti_csi2rx_stop_streaming(struct vb2_queue *vq)
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
> @@ -882,27 +905,60 @@ static const struct vb2_ops csi_vb2_qops = {
>  	.wait_finish = vb2_ops_wait_finish,
>  };
>
> -static int ti_csi2rx_init_vb2q(struct ti_csi2rx_dev *csi)
> +static void ti_csi2rx_cleanup_dma(struct ti_csi2rx_ctx *ctx)

Is it worth a wrapper function ?

>  {
> -	struct vb2_queue *q = &csi->vidq;
> +	dma_release_channel(ctx->dma.chan);
> +}
> +
> +static void ti_csi2rx_cleanup_v4l2(struct ti_csi2rx_dev *csi)
> +{
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
> +static void ti_csi2rx_cleanup_vb2q(struct ti_csi2rx_ctx *ctx)

Has a single caller, can be inlined maybe ?

> +{
> +	vb2_queue_release(&ctx->vidq);
> +}
> +
> +static void ti_csi2rx_cleanup_ctx(struct ti_csi2rx_ctx *ctx)
> +{
> +	ti_csi2rx_cleanup_dma(ctx);
> +	ti_csi2rx_cleanup_vb2q(ctx);

So this would become

        dma_release_channel(ctx->dma.chan);
        vb2_queue_release(&ctx->vidq);

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
>
>  	ret = vb2_queue_init(q);
>  	if (ret)
>  		return ret;
>
> -	csi->vdev.queue = q;
> +	ctx->vdev.queue = q;
>
>  	return 0;
>  }
> @@ -911,8 +967,9 @@ static int ti_csi2rx_link_validate(struct media_link *link)
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
> @@ -965,47 +1022,69 @@ static const struct media_entity_operations ti_csi2rx_video_entity_ops = {
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
> +	INIT_LIST_HEAD(&ctx->dma.queue);
> +	INIT_LIST_HEAD(&ctx->dma.submitted);
> +	spin_lock_init(&ctx->dma.lock);
>
> -	csi->dma.state = TI_CSI2RX_DMA_STOPPED;
> +	ctx->dma.state = TI_CSI2RX_DMA_STOPPED;
>
> -	csi->dma.chan = dma_request_chan(csi->dev, "rx0");
> -	if (IS_ERR(csi->dma.chan))
> -		return PTR_ERR(csi->dma.chan);
> +	ctx->dma.chan = dma_request_chan(ctx->csi->dev, "rx0");

The channel name should probably be parametrized, I presume it will
happen next

> +	if (IS_ERR(ctx->dma.chan))
> +		return PTR_ERR(ctx->dma.chan);
>
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
> @@ -1018,15 +1097,16 @@ static int ti_csi2rx_v4l2_init(struct ti_csi2rx_dev *csi)
>  	pix_fmt->quantization = V4L2_QUANTIZATION_LIM_RANGE,
>  	pix_fmt->xfer_func = V4L2_XFER_FUNC_SRGB,
>
> -	ti_csi2rx_fill_fmt(fmt, &csi->v_fmt);
> -
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
> @@ -1034,61 +1114,28 @@ static int ti_csi2rx_v4l2_init(struct ti_csi2rx_dev *csi)
>  	vdev->release = video_device_release_empty;
>  	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING |
>  			    V4L2_CAP_IO_MC;
> -	vdev->lock = &csi->mutex;
> -	video_set_drvdata(vdev, csi);
> +	vdev->lock = &ctx->mutex;
> +	video_set_drvdata(vdev, ctx);
>
> -	csi->pad.flags = MEDIA_PAD_FL_SINK;
> -	vdev->entity.ops = &ti_csi2rx_video_entity_ops;
> -	ret = media_entity_pads_init(&csi->vdev.entity, 1, &csi->pad);
> +	ret = ti_csi2rx_init_dma(ctx);
>  	if (ret)
>  		return ret;
>
> -	csi->v4l2_dev.mdev = mdev;
> -
> -	ret = v4l2_device_register(csi->dev, &csi->v4l2_dev);
> +	ret = ti_csi2rx_init_vb2q(ctx);
>  	if (ret)
> -		return ret;
> -
> -	ret = media_device_register(mdev);
> -	if (ret) {
> -		v4l2_device_unregister(&csi->v4l2_dev);
> -		media_device_cleanup(mdev);
> -		return ret;
> -	}
> +		goto cleanup_dma;
>
>  	return 0;
> -}
>
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
> -
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
> +	ti_csi2rx_cleanup_dma(ctx);
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
> @@ -1097,62 +1144,76 @@ static int ti_csi2rx_probe(struct platform_device *pdev)
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
>  	ret = of_platform_populate(csi->dev->of_node, NULL, NULL, csi->dev);
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
> +	int i;

unsigned

> +
> +	for (i = 0; i < TI_CSI2RX_NUM_CTX; i++) {
> +		if (vb2_is_busy(&csi->ctx[i].vidq))

Can this happen ?

> +			dev_err(csi->dev,
> +				"Failed to remove as queue busy for ctx %u\n",
> +				i);
> +	}
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
>
> --
> 2.43.0
>
>

