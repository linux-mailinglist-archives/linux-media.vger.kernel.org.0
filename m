Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17C693399D0
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 23:51:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235639AbhCLWuq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 17:50:46 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:48620 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235616AbhCLWub (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 17:50:31 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C958C88F;
        Fri, 12 Mar 2021 23:50:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615589430;
        bh=8dGaAIyf/Z+hKQFuGGj2if7jgmUaYvTMS1lyhN8XqIo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hgUlapg3RkiTqbAcwhC2iA347DFAbZvksYFwu8swLgapg1aSjSSGdgYvUuXOAZ9Av
         HYB8280nFtT2xs3oqRCMjGOV7y3nSIFrsHQ5qlVY9Z78XRXXfx7qKANcQNJkik+lDG
         KTP+oIKe3mCp8M/hgHG9Ke/qfvcRW0rdTTvp6DMA=
Date:   Sat, 13 Mar 2021 00:49:55 +0200
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
Subject: Re: [PATCH v3 6/6] media: uvcvideo: Use dma_alloc_noncontiguous API
Message-ID: <YEvwE1GUJDUMxrkm@pendragon.ideasonboard.com>
References: <20210312222539.1403488-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210312222539.1403488-1-ribalda@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

Thank you for the patch.

On Fri, Mar 12, 2021 at 11:25:39PM +0100, Ricardo Ribalda wrote:
> On architectures where there is no coherent caching such as ARM use the
> dma_alloc_noncontiguous API and handle manually the cache flushing using
> dma_sync_sgtable().

Maybe updating this based on the comment I've just sent in the v2 thread
?

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
> In non-affected architectures we see no significant impact.
> 
> Eg: x86 with an external usb camera
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
> bytes 70179056 : duration 33301
> FPS: 29.99
> URB: 288901/4897 uS/qty: 58.995 avg 26.022 std 4.319 min 253.853 max (uS)
> header: 54792/4897 uS/qty: 11.189 avg 6.218 std 0.620 min 61.750 max (uS)
> latency: 236602/4897 uS/qty: 48.315 avg 24.244 std 1.764 min 240.924 max (uS)
> decode: 52298/4897 uS/qty: 10.679 avg 8.299 std 1.638 min 108.861 max (uS)
> raw decode speed: 10.796 Gbits/s
> raw URB handling speed: 1.949 Gbits/s
> throughput: 16.859 Mbits/s
> URB decode CPU usage 0.157000 %
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
> bytes 71818320 : duration 33301
> FPS: 29.99
> URB: 321021/5000 uS/qty: 64.204 avg 23.001 std 10.430 min 268.837 max (uS)
> header: 54308/5000 uS/qty: 10.861 avg 5.104 std 0.778 min 54.736 max (uS)
> latency: 268799/5000 uS/qty: 53.759 avg 21.827 std 6.095 min 255.153 max (uS)
> decode: 52222/5000 uS/qty: 10.444 avg 7.137 std 1.874 min 71.103 max (uS)
> raw decode speed: 11.048 Gbits/s
> raw URB handling speed: 1.789 Gbits/s
> throughput: 17.253 Mbits/s
> URB decode CPU usage 0.156800 %
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Tomasz Figa <tfiga@chromium.org>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
> 
> Changelog from v2 (Thanks Laurent!):
> 
> - Replace uvc_urb_dma_sync with uvc_submit_urb
> - Add x86 stats in commit message
> 
>  drivers/media/usb/uvc/uvc_video.c | 92 ++++++++++++++++++++++---------
>  drivers/media/usb/uvc/uvcvideo.h  |  5 +-
>  2 files changed, 71 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index f2f565281e63..37ee39412b83 100644
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
> @@ -1096,6 +1099,28 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
>  	return data[0];
>  }
>  
> +static inline enum dma_data_direction stream_dir(struct uvc_streaming *stream)

I hadn't noticed this before, but could you name this function
uvc_stream_dir() (and uvc_stream_to_dmadev() below) to avoid potential
namespace clashes ?

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
> +static int uvc_submit_urb(struct uvc_urb *uvc_urb, gfp_t mem_flags)
> +{
> +	/* Sync DMA. */
> +	dma_sync_sgtable_for_device(stream_to_dmadev(uvc_urb->stream),
> +				    uvc_urb->sgt,
> +				    stream_dir(uvc_urb->stream));
> +	return usb_submit_urb(uvc_urb->urb, GFP_KERNEL);
> +}
> +
>  /*
>   * uvc_video_decode_data_work: Asynchronous memcpy processing
>   *
> @@ -1117,7 +1142,7 @@ static void uvc_video_copy_data_work(struct work_struct *work)
>  		uvc_queue_buffer_release(op->buf);
>  	}
>  
> -	ret = usb_submit_urb(uvc_urb->urb, GFP_KERNEL);
> +	ret = uvc_submit_urb(uvc_urb, GFP_KERNEL);
>  	if (ret < 0)
>  		dev_err(&uvc_urb->stream->intf->dev,
>  			"Failed to resubmit video URB (%d).\n", ret);
> @@ -1537,6 +1562,11 @@ static void uvc_video_complete(struct urb *urb)
>  	/* Re-initialise the URB async work. */
>  	uvc_urb->async_operations = 0;
>  
> +	/* Sync DMA and invalidate vmap range. */
> +	dma_sync_sgtable_for_cpu(stream_to_dmadev(uvc_urb->stream),
> +				 uvc_urb->sgt, stream_dir(stream));
> +	invalidate_kernel_vmap_range(uvc_urb->buffer,
> +				     uvc_urb->stream->urb_size);

And a blank line here ?

Just minor comments, all the rest looks good and my Rb still applies.

>  	/*
>  	 * Process the URB headers, and optionally queue expensive memcpy tasks
>  	 * to be deferred to a work queue.
> @@ -1545,7 +1575,7 @@ static void uvc_video_complete(struct urb *urb)
>  
>  	/* If no async work is needed, resubmit the URB immediately. */
>  	if (!uvc_urb->async_operations) {
> -		ret = usb_submit_urb(uvc_urb->urb, GFP_ATOMIC);
> +		ret = uvc_submit_urb(uvc_urb, GFP_ATOMIC);
>  		if (ret < 0)
>  			dev_err(&stream->intf->dev,
>  				"Failed to resubmit video URB (%d).\n", ret);
> @@ -1560,24 +1590,49 @@ static void uvc_video_complete(struct urb *urb)
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
> @@ -1608,19 +1663,12 @@ static int uvc_alloc_urb_buffers(struct uvc_streaming *stream,
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
> @@ -1730,12 +1778,8 @@ static int uvc_init_video_isoc(struct uvc_streaming *stream,
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
> @@ -1795,10 +1839,8 @@ static int uvc_init_video_bulk(struct uvc_streaming *stream,
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
> @@ -1895,7 +1937,7 @@ static int uvc_video_start_transfer(struct uvc_streaming *stream,
>  
>  	/* Submit the URBs. */
>  	for_each_uvc_urb(uvc_urb, stream) {
> -		ret = usb_submit_urb(uvc_urb->urb, gfp_flags);
> +		ret = uvc_submit_urb(uvc_urb, gfp_flags);
>  		if (ret < 0) {
>  			dev_err(&stream->intf->dev,
>  				"Failed to submit URB %u (%d).\n",
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
