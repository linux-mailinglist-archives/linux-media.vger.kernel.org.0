Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 787AC3398F7
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 22:17:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235253AbhCLVQR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 16:16:17 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:46390 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235255AbhCLVPu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 16:15:50 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E42F588F;
        Fri, 12 Mar 2021 22:15:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615583748;
        bh=p8ueHT9hBdjrMPYv+MNwpSukqWWphQpzWFHWfs4obWw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ALfevHDTrqstjtEeufaD30QjSQve50uup68letkVC4uQxPj7cVqO5KT3DRpP3TdzZ
         MyPx0dq/9Jx5+TQLrUYyC6jmpRk3nLVlocJG6DCHomcfKJCNbHLkh5FXvjLvpfx08V
         Ew9T+yE5q2GJItOt27mAspmiE7CiRDW4Sgq1Hyio=
Date:   Fri, 12 Mar 2021 23:15:03 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@google.com>,
        iommu@lists.linux-foundation.org,
        Robin Murphy <robin.murphy@arm.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 6/6] media: uvcvideo: Use dma_alloc_noncontiguous API
Message-ID: <YEvZ17VIP6WbpHdm@pendragon.ideasonboard.com>
References: <20210312125709.1347177-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210312125709.1347177-1-ribalda@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

Thank you for the patch.

On Fri, Mar 12, 2021 at 01:57:09PM +0100, Ricardo Ribalda wrote:
> On architectures where there is no coherent caching such as ARM use the
> dma_alloc_noncontiguous API and handle manually the cache flushing using
> dma_sync_sgtable().

You're actually switching to dma_alloc_noncontiguous() unconditionally,
not only on those architectures :-) Do I assume correctly that
dma_alloc_noncontiguous() will do the right thing on x86 too ?

> With this patch on the affected architectures we can measure up to 20x
> performance improvement in uvc_video_copy_data_work().

Have you measured performances on x86 to ensure there's no regression ?

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
> 
> Changelog from v2: (Thanks Laurent)
> 
> - Fix typos
> - Use the right dma direction if not capturing
> - Clear sgt during free
> 
>  drivers/media/usb/uvc/uvc_video.c | 92 +++++++++++++++++++++++--------
>  drivers/media/usb/uvc/uvcvideo.h  |  5 +-
>  2 files changed, 74 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index f2f565281e63..8e60f81e2257 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -6,11 +6,14 @@
>   *          Laurent Pinchart (laurent.pinchart@ideasonboard.com)
>   */
>  
> +#include <linux/dma-mapping.h>
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
> @@ -1096,6 +1099,34 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
>  	return data[0];
>  }
>  
> +static inline enum dma_data_direction stream_dir(struct uvc_streaming *stream)
> +{
> +	if (stream->type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
> +		return DMA_FROM_DEVICE;
> +	else
> +		return DMA_TO_DEVICE;
> +}
> +
> +static inline struct device *stream_to_dmadev(struct uvc_streaming *stream)
> +{
> +	return bus_to_hcd(stream->dev->udev->bus)->self.sysdev;
> +}
> +
> +static void uvc_urb_dma_sync(struct uvc_urb *uvc_urb, bool for_device)

Maybe nitpicking a little bit, but wouldn't the code be clearer if you
created uvc_urb_dma_sync_for_cpu() and uvc_urb_dma_sync_for_device() ?
When reading

	uvc_urb_dma_sync(uvc_urb, true);

I have to constantly look up the definition of the function to figure
out what boolean value corresponds to what direction.

Given that uvc_urb_dma_sync(..., true) is always called right before
submitting the URB, we could even create a uvc_submit_urb() function
that groups the dma_sync_sgtable_for_device() and usb_submit_urb()
calls, and do without uvc_urb_dma_sync_for_device(). Up to you on this
one.

With those small changes, and assuming there's no performance regression
on x86,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +{
> +	struct device *dma_dev = stream_to_dmadev(uvc_urb->stream);
> +
> +	if (for_device) {
> +		dma_sync_sgtable_for_device(dma_dev, uvc_urb->sgt,
> +					    stream_dir(uvc_urb->stream));
> +	} else {
> +		dma_sync_sgtable_for_cpu(dma_dev, uvc_urb->sgt,
> +					 stream_dir(uvc_urb->stream));
> +		invalidate_kernel_vmap_range(uvc_urb->buffer,
> +					     uvc_urb->stream->urb_size);
> +	}
> +}
> +
>  /*
>   * uvc_video_decode_data_work: Asynchronous memcpy processing
>   *
> @@ -1117,6 +1148,8 @@ static void uvc_video_copy_data_work(struct work_struct *work)
>  		uvc_queue_buffer_release(op->buf);
>  	}
>  
> +	uvc_urb_dma_sync(uvc_urb, true);
> +
>  	ret = usb_submit_urb(uvc_urb->urb, GFP_KERNEL);
>  	if (ret < 0)
>  		dev_err(&uvc_urb->stream->intf->dev,
> @@ -1541,10 +1574,12 @@ static void uvc_video_complete(struct urb *urb)
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
> @@ -1560,24 +1595,49 @@ static void uvc_video_complete(struct urb *urb)
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
> +				       stream_dir(stream));
> +
>  		uvc_urb->buffer = NULL;
> +		uvc_urb->sgt = NULL;
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
> +	uvc_urb->sgt = dma_alloc_noncontiguous(dma_dev, stream->urb_size,
> +					       stream_dir(stream),
> +					       gfp_flags, 0);
> +	if (!uvc_urb->sgt)
> +		return false;
> +	uvc_urb->dma = uvc_urb->sgt->sgl->dma_address;
> +
> +	uvc_urb->buffer = dma_vmap_noncontiguous(dma_dev, stream->urb_size,
> +						 uvc_urb->sgt);
> +	if (!uvc_urb->buffer) {
> +		dma_free_noncontiguous(dma_dev, stream->urb_size,
> +				       uvc_urb->sgt,
> +				       stream_dir(stream));
> +		uvc_urb->sgt = NULL;
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
>  /*
>   * Allocate transfer buffers. This function can be called with buffers
>   * already allocated when resuming from suspend, in which case it will
> @@ -1608,19 +1668,12 @@ static int uvc_alloc_urb_buffers(struct uvc_streaming *stream,
>  
>  	/* Retry allocations until one succeed. */
>  	for (; npackets > 1; npackets /= 2) {
> +		stream->urb_size = psize * npackets;
> +
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
> @@ -1730,12 +1783,8 @@ static int uvc_init_video_isoc(struct uvc_streaming *stream,
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
> @@ -1795,10 +1844,8 @@ static int uvc_init_video_bulk(struct uvc_streaming *stream,
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
> @@ -1895,6 +1942,7 @@ static int uvc_video_start_transfer(struct uvc_streaming *stream,
>  
>  	/* Submit the URBs. */
>  	for_each_uvc_urb(uvc_urb, stream) {
> +		uvc_urb_dma_sync(uvc_urb, true);
>  		ret = usb_submit_urb(uvc_urb->urb, gfp_flags);
>  		if (ret < 0) {
>  			dev_err(&stream->intf->dev,
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 97df5ecd66c9..cce5e38133cd 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -219,6 +219,7 @@
>   */
>  
>  struct gpio_desc;
> +struct sg_table;
>  struct uvc_device;
>  
>  /* TODO: Put the most frequently accessed fields at the beginning of
> @@ -545,7 +546,8 @@ struct uvc_copy_op {
>   * @urb: the URB described by this context structure
>   * @stream: UVC streaming context
>   * @buffer: memory storage for the URB
> - * @dma: DMA coherent addressing for the urb_buffer
> + * @dma: Allocated DMA handle
> + * @sgt: sgt_table with the urb locations in memory
>   * @async_operations: counter to indicate the number of copy operations
>   * @copy_operations: work descriptors for asynchronous copy operations
>   * @work: work queue entry for asynchronous decode
> @@ -556,6 +558,7 @@ struct uvc_urb {
>  
>  	char *buffer;
>  	dma_addr_t dma;
> +	struct sg_table *sgt;
>  
>  	unsigned int async_operations;
>  	struct uvc_copy_op copy_operations[UVC_MAX_PACKETS];

-- 
Regards,

Laurent Pinchart
