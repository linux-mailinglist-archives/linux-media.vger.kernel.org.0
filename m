Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EC68446144
	for <lists+linux-media@lfdr.de>; Fri,  5 Nov 2021 10:17:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232528AbhKEJUf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Nov 2021 05:20:35 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:33669 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbhKEJUe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Nov 2021 05:20:34 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id B7E0D1C0023;
        Fri,  5 Nov 2021 09:17:51 +0000 (UTC)
Date:   Fri, 5 Nov 2021 10:18:43 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Eugen Hristev <eugen.hristev@microchip.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        robh+dt@kernel.org, nicolas.ferre@microchip.com
Subject: Re: [PATCH 08/21] media: atmel: atmel-isc-base: use streaming status
 when queueing buffers
Message-ID: <20211105091843.wl3le2lvo2unxfoe@uno.localdomain>
References: <20211022075247.518880-1-eugen.hristev@microchip.com>
 <20211022075247.518880-9-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211022075247.518880-9-eugen.hristev@microchip.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Eugen

On Fri, Oct 22, 2021 at 10:52:34AM +0300, Eugen Hristev wrote:
> During experiments with libcamera, it looks like vb2_is_streaming returns
> true before our start streaming is called.
> Order of operations is streamon -> queue -> start_streaming
> ISC would have started the DMA immediately when a buffer is being added
> to the vbqueue if the queue is streaming.
> It is more safe to start the DMA after the start streaming of the driver is
> called.
> Thus, even if vb2queue is streaming, add the buffer to the dma queue of the
> driver instead of actually starting the DMA process, if the start streaming
> has not been called yet.
>
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>

I cannot really comment on the issue itself, but seeing that isc->stop
is mostly used in negated form (!isc->stop) I suggest to make it
isc->streaming ?

Thanks
   j

> ---
>  drivers/media/platform/atmel/atmel-isc-base.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
> index f3e89a892373..6f14cc549543 100644
> --- a/drivers/media/platform/atmel/atmel-isc-base.c
> +++ b/drivers/media/platform/atmel/atmel-isc-base.c
> @@ -442,12 +442,14 @@ static void isc_buffer_queue(struct vb2_buffer *vb)
>  	unsigned long flags;
>
>  	spin_lock_irqsave(&isc->dma_queue_lock, flags);
> -	if (!isc->cur_frm && list_empty(&isc->dma_queue) &&
> -		vb2_is_streaming(vb->vb2_queue)) {
> +
> +	if (!isc->cur_frm && list_empty(&isc->dma_queue) && !isc->stop) {
>  		isc->cur_frm = buf;
>  		isc_start_dma(isc);
> -	} else
> +	} else {
>  		list_add_tail(&buf->list, &isc->dma_queue);
> +	}
> +
>  	spin_unlock_irqrestore(&isc->dma_queue_lock, flags);
>  }
>
> @@ -1015,7 +1017,7 @@ static int isc_s_fmt_vid_cap(struct file *file, void *priv,
>  {
>  	struct isc_device *isc = video_drvdata(file);
>
> -	if (vb2_is_streaming(&isc->vb2_vidq))
> +	if (!isc->stop)
>  		return -EBUSY;
>
>  	return isc_set_fmt(isc, f);
> @@ -1537,7 +1539,7 @@ static int isc_s_awb_ctrl(struct v4l2_ctrl *ctrl)
>
>  		isc_update_awb_ctrls(isc);
>
> -		if (vb2_is_streaming(&isc->vb2_vidq)) {
> +		if (!isc->stop) {
>  			/*
>  			 * If we are streaming, we can update profile to
>  			 * have the new settings in place.
> @@ -1553,8 +1555,7 @@ static int isc_s_awb_ctrl(struct v4l2_ctrl *ctrl)
>  		}
>
>  		/* if we have autowhitebalance on, start histogram procedure */
> -		if (ctrls->awb == ISC_WB_AUTO &&
> -		    vb2_is_streaming(&isc->vb2_vidq) &&
> +		if (ctrls->awb == ISC_WB_AUTO && !isc->stop &&
>  		    ISC_IS_FORMAT_RAW(isc->config.sd_format->mbus_code))
>  			isc_set_histogram(isc, true);
>
> @@ -1830,6 +1831,8 @@ static int isc_async_complete(struct v4l2_async_notifier *notifier)
>  	struct vb2_queue *q = &isc->vb2_vidq;
>  	int ret = 0;
>
> +	isc->stop = true;
> +
>  	INIT_WORK(&isc->awb_work, isc_awb_work);
>
>  	ret = v4l2_device_register_subdev_nodes(&isc->v4l2_dev);
> --
> 2.25.1
>
