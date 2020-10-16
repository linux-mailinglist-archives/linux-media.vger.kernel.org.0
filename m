Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E5D52906BE
	for <lists+linux-media@lfdr.de>; Fri, 16 Oct 2020 16:01:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408468AbgJPOBL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Oct 2020 10:01:11 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:59543 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408349AbgJPOBL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Oct 2020 10:01:11 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 9C1451C000E;
        Fri, 16 Oct 2020 14:01:06 +0000 (UTC)
Date:   Fri, 16 Oct 2020 18:00:51 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 4/5] rcar-vin: Break out hardware start and stop to new
 methods
Message-ID: <20201016160051.kpioe54xi2cenfvg@uno.localdomain>
References: <20201015231408.2399933-1-niklas.soderlund+renesas@ragnatech.se>
 <20201015231408.2399933-5-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201015231408.2399933-5-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Fri, Oct 16, 2020 at 01:14:07AM +0200, Niklas Söderlund wrote:
> To support suspend and resume the ability to start and stop the hardware
> needs to be available internally in the driver. Currently this code is
> in the start and stop callbacks of the vb2_ops struct. In these
> callbacks the code is intertwined with buffer allocation and freeing.
>
> Prepare for suspend and resume support by braking out the hardware

breaking

> start/stop code into new methods.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

I very much like this, it really simplifies the code
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
   j

> ---
>  drivers/media/platform/rcar-vin/rcar-dma.c | 78 +++++++++++++---------
>  drivers/media/platform/rcar-vin/rcar-vin.h |  3 +
>  2 files changed, 48 insertions(+), 33 deletions(-)
>
> diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
> index f65deac4c2dbed54..5a5f0e5007478c8d 100644
> --- a/drivers/media/platform/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
> @@ -1050,16 +1050,20 @@ static irqreturn_t rvin_irq(int irq, void *data)
>  	return IRQ_RETVAL(handled);
>  }
>
> -/* Need to hold qlock before calling */
>  static void return_unused_buffers(struct rvin_dev *vin,
>  				  enum vb2_buffer_state state)
>  {
>  	struct rvin_buffer *buf, *node;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&vin->qlock, flags);
>
>  	list_for_each_entry_safe(buf, node, &vin->buf_list, list) {
>  		vb2_buffer_done(&buf->vb.vb2_buf, state);
>  		list_del(&buf->list);
>  	}
> +
> +	spin_unlock_irqrestore(&vin->qlock, flags);
>  }
>
>  static int rvin_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
> @@ -1243,53 +1247,55 @@ static int rvin_set_stream(struct rvin_dev *vin, int on)
>  	return ret;
>  }
>
> -static int rvin_start_streaming(struct vb2_queue *vq, unsigned int count)
> +int rvin_start_streaming(struct rvin_dev *vin)
>  {
> -	struct rvin_dev *vin = vb2_get_drv_priv(vq);
>  	unsigned long flags;
>  	int ret;
>
> -	/* Allocate scratch buffer. */
> -	vin->scratch = dma_alloc_coherent(vin->dev, vin->format.sizeimage,
> -					  &vin->scratch_phys, GFP_KERNEL);
> -	if (!vin->scratch) {
> -		spin_lock_irqsave(&vin->qlock, flags);
> -		return_unused_buffers(vin, VB2_BUF_STATE_QUEUED);
> -		spin_unlock_irqrestore(&vin->qlock, flags);
> -		vin_err(vin, "Failed to allocate scratch buffer\n");
> -		return -ENOMEM;
> -	}
> -
>  	ret = rvin_set_stream(vin, 1);
> -	if (ret) {
> -		spin_lock_irqsave(&vin->qlock, flags);
> -		return_unused_buffers(vin, VB2_BUF_STATE_QUEUED);
> -		spin_unlock_irqrestore(&vin->qlock, flags);
> -		goto out;
> -	}
> +	if (ret)
> +		return ret;
>
>  	spin_lock_irqsave(&vin->qlock, flags);
>
>  	vin->sequence = 0;
>
>  	ret = rvin_capture_start(vin);
> -	if (ret) {
> -		return_unused_buffers(vin, VB2_BUF_STATE_QUEUED);
> +	if (ret)
>  		rvin_set_stream(vin, 0);
> -	}
>
>  	spin_unlock_irqrestore(&vin->qlock, flags);
> -out:
> -	if (ret)
> -		dma_free_coherent(vin->dev, vin->format.sizeimage, vin->scratch,
> -				  vin->scratch_phys);
>
>  	return ret;
>  }
>
> -static void rvin_stop_streaming(struct vb2_queue *vq)
> +static int rvin_start_streaming_vq(struct vb2_queue *vq, unsigned int count)
>  {
>  	struct rvin_dev *vin = vb2_get_drv_priv(vq);
> +	int ret = -ENOMEM;
> +
> +	/* Allocate scratch buffer. */
> +	vin->scratch = dma_alloc_coherent(vin->dev, vin->format.sizeimage,
> +					  &vin->scratch_phys, GFP_KERNEL);
> +	if (!vin->scratch)
> +		goto err_scratch;
> +
> +	ret = rvin_start_streaming(vin);
> +	if (ret)
> +		goto err_start;
> +
> +	return 0;
> +err_start:
> +	dma_free_coherent(vin->dev, vin->format.sizeimage, vin->scratch,
> +			  vin->scratch_phys);
> +err_scratch:
> +	return_unused_buffers(vin, VB2_BUF_STATE_QUEUED);
> +
> +	return ret;
> +}
> +
> +void rvin_stop_streaming(struct rvin_dev *vin)
> +{
>  	unsigned int i, retries;
>  	unsigned long flags;
>  	bool buffersFreed;
> @@ -1341,27 +1347,33 @@ static void rvin_stop_streaming(struct vb2_queue *vq)
>  		vin->state = STOPPED;
>  	}
>
> -	/* Return all unused buffers. */
> -	return_unused_buffers(vin, VB2_BUF_STATE_ERROR);
> -
>  	spin_unlock_irqrestore(&vin->qlock, flags);
>
>  	rvin_set_stream(vin, 0);
>
>  	/* disable interrupts */
>  	rvin_disable_interrupts(vin);
> +}
> +
> +static void rvin_stop_streaming_vq(struct vb2_queue *vq)
> +{
> +	struct rvin_dev *vin = vb2_get_drv_priv(vq);
> +
> +	rvin_stop_streaming(vin);
>
>  	/* Free scratch buffer. */
>  	dma_free_coherent(vin->dev, vin->format.sizeimage, vin->scratch,
>  			  vin->scratch_phys);
> +
> +	return_unused_buffers(vin, VB2_BUF_STATE_ERROR);
>  }
>
>  static const struct vb2_ops rvin_qops = {
>  	.queue_setup		= rvin_queue_setup,
>  	.buf_prepare		= rvin_buffer_prepare,
>  	.buf_queue		= rvin_buffer_queue,
> -	.start_streaming	= rvin_start_streaming,
> -	.stop_streaming		= rvin_stop_streaming,
> +	.start_streaming	= rvin_start_streaming_vq,
> +	.stop_streaming		= rvin_stop_streaming_vq,
>  	.wait_prepare		= vb2_ops_wait_prepare,
>  	.wait_finish		= vb2_ops_wait_finish,
>  };
> diff --git a/drivers/media/platform/rcar-vin/rcar-vin.h b/drivers/media/platform/rcar-vin/rcar-vin.h
> index 2fef23470e3ddfe3..4ec8584709c847a9 100644
> --- a/drivers/media/platform/rcar-vin/rcar-vin.h
> +++ b/drivers/media/platform/rcar-vin/rcar-vin.h
> @@ -299,4 +299,7 @@ void rvin_crop_scale_comp(struct rvin_dev *vin);
>  int rvin_set_channel_routing(struct rvin_dev *vin, u8 chsel);
>  void rvin_set_alpha(struct rvin_dev *vin, unsigned int alpha);
>
> +int rvin_start_streaming(struct rvin_dev *vin);
> +void rvin_stop_streaming(struct rvin_dev *vin);
> +
>  #endif
> --
> 2.28.0
>
