Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55C5533833F
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 02:43:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbhCLBmv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 20:42:51 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:33846 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231229AbhCLBmt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 20:42:49 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C88A388F;
        Fri, 12 Mar 2021 02:42:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615513368;
        bh=LTIaTV7mffTrdyRJC8ui13p8XsUlKMW/n9oF3otuqpM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=twFyMFNC1TPi99RCmuMG60hIhZBUNFqP+kTmzPDRlDoILwJdd6pp93iz70HVZEl4D
         d/axZoD4Dcg3V8JpNEzCjhlDCbZTz59IOHkaIGLD36kdz/0TOxBrYsl7RGDKejDpHF
         AD5IZiyIC+GwX96TPavxtcj1h2JFv+a3o14vjIgE=
Date:   Fri, 12 Mar 2021 03:42:13 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Sergey Senozhatsky <senozhatsky@google.com>,
        iommu@lists.linux-foundation.org,
        Robin Murphy <robin.murphy@arm.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 6/6] media: uvcvideo: Use dma_alloc_noncontiguos API
Message-ID: <YErG9WUOiAzfHB1N@pendragon.ideasonboard.com>
References: <20210301085236.947011-1-hch@lst.de>
 <20210301085236.947011-7-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210301085236.947011-7-hch@lst.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Christoph and Ricardo,

Thank you for the patch.

On Mon, Mar 01, 2021 at 09:52:36AM +0100, Christoph Hellwig wrote:
> From: Ricardo Ribalda <ribalda@chromium.org>
> 
> On architectures where the is no coherent caching such as ARM use the

s/the is/there is/

> dma_alloc_noncontiguos API and handle manually the cache flushing using

s/dma_alloc_noncontiguos/dma_alloc_noncontiguous/

(and in the subject line too)

> dma_sync_sgtable().
> 
> With this patch on the affected architectures we can measure up to 20x
> performance improvement in uvc_video_copy_data_work().
> 
> Eg: aarch64 with an external usb camera
> 
> NON_CONTIGUOUS
> frames:  999
> packets: 999
> empty:   0 (0 %)
> errors:  0
> invalid: 0
> pts: 0 early, 0 initial, 999 ok
> scr: 0 count ok, 0 diff ok
> sof: 2048 <= sof <= 0, freq 0.000 kHz
> bytes 67034480 : duration 33303
> FPS: 29.99
> URB: 523446/4993 uS/qty: 104.836 avg 132.532 std 13.230 min 831.094 max (uS)
> header: 76564/4993 uS/qty: 15.334 avg 15.229 std 3.438 min 186.875 max (uS)
> latency: 468945/4992 uS/qty: 93.939 avg 132.577 std 9.531 min 824.010 max (uS)
> decode: 54161/4993 uS/qty: 10.847 avg 6.313 std 1.614 min 111.458 max (uS)
> raw decode speed: 9.931 Gbits/s
> raw URB handling speed: 1.025 Gbits/s
> throughput: 16.102 Mbits/s
> URB decode CPU usage 0.162600 %
> 
> COHERENT
> frames:  999
> packets: 999
> empty:   0 (0 %)
> errors:  0
> invalid: 0
> pts: 0 early, 0 initial, 999 ok
> scr: 0 count ok, 0 diff ok
> sof: 2048 <= sof <= 0, freq 0.000 kHz
> bytes 54683536 : duration 33302
> FPS: 29.99
> URB: 1478135/4000 uS/qty: 369.533 avg 390.357 std 22.968 min 3337.865 max (uS)
> header: 79761/4000 uS/qty: 19.940 avg 18.495 std 1.875 min 336.719 max (uS)
> latency: 281077/4000 uS/qty: 70.269 avg 83.102 std 5.104 min 735.000 max (uS)
> decode: 1197057/4000 uS/qty: 299.264 avg 318.080 std 1.615 min 2806.667 max (uS)
> raw decode speed: 365.470 Mbits/s
> raw URB handling speed: 295.986 Mbits/s
> throughput: 13.136 Mbits/s
> URB decode CPU usage 3.594500 %
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> Reviewed-by: Tomasz Figa <tfiga@chromium.org>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/media/usb/uvc/uvc_video.c | 79 ++++++++++++++++++++++---------
>  drivers/media/usb/uvc/uvcvideo.h  |  4 +-
>  2 files changed, 60 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index f2f565281e63ff..d008c68fb6c806 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -6,11 +6,13 @@
>   *          Laurent Pinchart (laurent.pinchart@ideasonboard.com)
>   */
>  

Should we include <linux/dma-mapping.h> ?

> +#include <linux/highmem.h>
>  #include <linux/kernel.h>
>  #include <linux/list.h>
>  #include <linux/module.h>
>  #include <linux/slab.h>
>  #include <linux/usb.h>
> +#include <linux/usb/hcd.h>
>  #include <linux/videodev2.h>
>  #include <linux/vmalloc.h>
>  #include <linux/wait.h>
> @@ -1096,6 +1098,26 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
>  	return data[0];
>  }
>  
> +static inline struct device *stream_to_dmadev(struct uvc_streaming *stream)
> +{
> +	return bus_to_hcd(stream->dev->udev->bus)->self.sysdev;
> +}
> +
> +static void uvc_urb_dma_sync(struct uvc_urb *uvc_urb, bool for_device)
> +{
> +	struct device *dma_dev = stream_to_dmadev(uvc_urb->stream);
> +
> +	if (for_device) {
> +		dma_sync_sgtable_for_device(dma_dev, uvc_urb->sgt,
> +					    DMA_FROM_DEVICE);

The uvcvideo driver also supports video output devices (they are fairly
rare, but they exist). We thus need to handle DMA_TO_DEVICE too.

> +	} else {
> +		dma_sync_sgtable_for_cpu(dma_dev, uvc_urb->sgt,
> +					 DMA_FROM_DEVICE);
> +		invalidate_kernel_vmap_range(uvc_urb->buffer,
> +					     uvc_urb->stream->urb_size);
> +	}
> +}
> +
>  /*
>   * uvc_video_decode_data_work: Asynchronous memcpy processing
>   *
> @@ -1117,6 +1139,8 @@ static void uvc_video_copy_data_work(struct work_struct *work)
>  		uvc_queue_buffer_release(op->buf);
>  	}
>  
> +	uvc_urb_dma_sync(uvc_urb, true);
> +
>  	ret = usb_submit_urb(uvc_urb->urb, GFP_KERNEL);
>  	if (ret < 0)
>  		dev_err(&uvc_urb->stream->intf->dev,
> @@ -1541,10 +1565,12 @@ static void uvc_video_complete(struct urb *urb)
>  	 * Process the URB headers, and optionally queue expensive memcpy tasks
>  	 * to be deferred to a work queue.
>  	 */
> +	uvc_urb_dma_sync(uvc_urb, false);
>  	stream->decode(uvc_urb, buf, buf_meta);
>  
>  	/* If no async work is needed, resubmit the URB immediately. */
>  	if (!uvc_urb->async_operations) {
> +		uvc_urb_dma_sync(uvc_urb, true);
>  		ret = usb_submit_urb(uvc_urb->urb, GFP_ATOMIC);
>  		if (ret < 0)
>  			dev_err(&stream->intf->dev,
> @@ -1560,24 +1586,46 @@ static void uvc_video_complete(struct urb *urb)
>   */
>  static void uvc_free_urb_buffers(struct uvc_streaming *stream)
>  {
> +	struct device *dma_dev = stream_to_dmadev(stream);
>  	struct uvc_urb *uvc_urb;
>  
>  	for_each_uvc_urb(uvc_urb, stream) {
>  		if (!uvc_urb->buffer)
>  			continue;
>  
> -#ifndef CONFIG_DMA_NONCOHERENT
> -		usb_free_coherent(stream->dev->udev, stream->urb_size,
> -				  uvc_urb->buffer, uvc_urb->dma);
> -#else
> -		kfree(uvc_urb->buffer);
> -#endif
> +		dma_vunmap_noncontiguous(dma_dev, uvc_urb->buffer);
> +		dma_free_noncontiguous(dma_dev, stream->urb_size, uvc_urb->sgt,
> +				       DMA_FROM_DEVICE);
> +
>  		uvc_urb->buffer = NULL;

Maybe also

		uvc_urb->sgt = NULL;

? It's not strictly mandatory, but may make use-after-free bugs easier
to spot.

>  	}
>  
>  	stream->urb_size = 0;
>  }
>  
> +static bool uvc_alloc_urb_buffer(struct uvc_streaming *stream,
> +				 struct uvc_urb *uvc_urb, gfp_t gfp_flags)
> +{
> +	struct device *dma_dev = stream_to_dmadev(stream);
> +
> +

Extra blank line.

> +	uvc_urb->sgt = dma_alloc_noncontiguous(dma_dev, stream->urb_size,
> +					       DMA_FROM_DEVICE, gfp_flags, 0);
> +	if (!uvc_urb->sgt)
> +		return false;
> +	uvc_urb->dma = uvc_urb->sgt->sgl->dma_address;
> +
> +	uvc_urb->buffer = dma_vmap_noncontiguous(dma_dev, stream->urb_size,
> +						 uvc_urb->sgt);
> +	if (!uvc_urb->buffer) {
> +		dma_free_noncontiguous(dma_dev, stream->urb_size,
> +				       uvc_urb->sgt, DMA_FROM_DEVICE);

Same here,

		uvc_urb->sgt = NULL;

> +		return false;
> +	}
> +
> +	return true;
> +}
> +
>  /*
>   * Allocate transfer buffers. This function can be called with buffers
>   * already allocated when resuming from suspend, in which case it will
> @@ -1608,19 +1656,11 @@ static int uvc_alloc_urb_buffers(struct uvc_streaming *stream,
>  
>  	/* Retry allocations until one succeed. */
>  	for (; npackets > 1; npackets /= 2) {
> +		stream->urb_size = psize * npackets;

A blank line here would be nice.

>  		for (i = 0; i < UVC_URBS; ++i) {
>  			struct uvc_urb *uvc_urb = &stream->uvc_urb[i];
>  
> -			stream->urb_size = psize * npackets;
> -#ifndef CONFIG_DMA_NONCOHERENT
> -			uvc_urb->buffer = usb_alloc_coherent(
> -				stream->dev->udev, stream->urb_size,
> -				gfp_flags | __GFP_NOWARN, &uvc_urb->dma);
> -#else
> -			uvc_urb->buffer =
> -			    kmalloc(stream->urb_size, gfp_flags | __GFP_NOWARN);
> -#endif
> -			if (!uvc_urb->buffer) {
> +			if (!uvc_alloc_urb_buffer(stream, uvc_urb, gfp_flags)) {
>  				uvc_free_urb_buffers(stream);
>  				break;
>  			}
> @@ -1730,12 +1770,8 @@ static int uvc_init_video_isoc(struct uvc_streaming *stream,
>  		urb->context = uvc_urb;
>  		urb->pipe = usb_rcvisocpipe(stream->dev->udev,
>  				ep->desc.bEndpointAddress);
> -#ifndef CONFIG_DMA_NONCOHERENT
>  		urb->transfer_flags = URB_ISO_ASAP | URB_NO_TRANSFER_DMA_MAP;
>  		urb->transfer_dma = uvc_urb->dma;
> -#else
> -		urb->transfer_flags = URB_ISO_ASAP;
> -#endif
>  		urb->interval = ep->desc.bInterval;
>  		urb->transfer_buffer = uvc_urb->buffer;
>  		urb->complete = uvc_video_complete;
> @@ -1795,10 +1831,8 @@ static int uvc_init_video_bulk(struct uvc_streaming *stream,
>  
>  		usb_fill_bulk_urb(urb, stream->dev->udev, pipe,	uvc_urb->buffer,
>  				  size, uvc_video_complete, uvc_urb);
> -#ifndef CONFIG_DMA_NONCOHERENT
>  		urb->transfer_flags = URB_NO_TRANSFER_DMA_MAP;
>  		urb->transfer_dma = uvc_urb->dma;
> -#endif
>  
>  		uvc_urb->urb = urb;
>  	}
> @@ -1895,6 +1929,7 @@ static int uvc_video_start_transfer(struct uvc_streaming *stream,
>  
>  	/* Submit the URBs. */
>  	for_each_uvc_urb(uvc_urb, stream) {
> +		uvc_urb_dma_sync(uvc_urb, true);
>  		ret = usb_submit_urb(uvc_urb->urb, gfp_flags);
>  		if (ret < 0) {
>  			dev_err(&stream->intf->dev,
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 97df5ecd66c9a7..fec24f1eca1c96 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -545,7 +545,8 @@ struct uvc_copy_op {
>   * @urb: the URB described by this context structure
>   * @stream: UVC streaming context
>   * @buffer: memory storage for the URB
> - * @dma: DMA coherent addressing for the urb_buffer
> + * @dma: Allocated DMA handle
> + * @sgt: sgt_table with the urb locations in memory
>   * @async_operations: counter to indicate the number of copy operations
>   * @copy_operations: work descriptors for asynchronous copy operations
>   * @work: work queue entry for asynchronous decode
> @@ -556,6 +557,7 @@ struct uvc_urb {
>  
>  	char *buffer;
>  	dma_addr_t dma;
> +	struct sg_table *sgt;

A forward declaration of struct sg_table with the other forward
declarations would be useful.

>  
>  	unsigned int async_operations;
>  	struct uvc_copy_op copy_operations[UVC_MAX_PACKETS];

-- 
Regards,

Laurent Pinchart
