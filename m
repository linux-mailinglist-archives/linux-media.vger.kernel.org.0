Return-Path: <linux-media+bounces-36976-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB5CAFB04B
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 11:52:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 51FB87B103D
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 09:50:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C320E293C68;
	Mon,  7 Jul 2025 09:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lSep1Zqy"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FE5291C1F;
	Mon,  7 Jul 2025 09:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751881807; cv=none; b=cm1BYnNA0VIpRd1BzxFaW0Jqxe1WElN8RZxbEbP/QR6GA3N29uk9l/eq0Lxweumi/I4hwp1IOyPhPhKInvUKRD76QGpHcyB+4+PWdeVgAMNk0KkQ/JYH6DDD+Hn6QeGWivynWOeGvJ+NRSvLVVEhSi0CkE5E8omtWLH/ehDQ3AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751881807; c=relaxed/simple;
	bh=7KaMEj8xzP0ksk4G6oStKO53a2h7yxZ7Hc/eGxrDOXQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AJSL27xx+2gvFD1HnwrIKXLrsD7uoV2geNS3OvUO7b4NhHCXLiBoT1KX71fgzgWV5gr6949G3Uku6H+78qxXZZ6ljWumhIIVRZc0MbV4BRoECWJ8Zg7fGuMQ3BtCruj6TJVsdaW6Y2aTEd1WmmWTagYwskQx40Xqx8lO06nGrLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lSep1Zqy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BDCFC4CEE3;
	Mon,  7 Jul 2025 09:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751881806;
	bh=7KaMEj8xzP0ksk4G6oStKO53a2h7yxZ7Hc/eGxrDOXQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lSep1Zqyp2fCZ2aHu/ClmOtBmegeHNX1KWMkwEJSwk1hm3x0Igup/b4yK6iYkOeaK
	 BTv45DfgHNxl++y+8O9k3KhzSeoP0YJECwvbqvNyO2KwOPqWScF3JYnAuiVubwW9o2
	 1VfHEu2GpUuCeBi+pfhyvVJUrO4BHYIX75qD0r0OIqvAD9ZZPhjcyf9RWsl9aaSQAn
	 CmoDak9t7OhOWnRB9Z23mD6iDLzv4jA0OSO+nJCizbi5CJyrc3sg2W3EyA9ylppM3/
	 9uo+ShwcOXcinxILcSHQPapGk5JQxJCaIzGQttT9eE+/qlEq6/rDcesj7BolOdutPh
	 E60aO22ywZ0XQ==
Message-ID: <a4380f08-bd39-42ea-a77d-7a6662ad8a34@kernel.org>
Date: Mon, 7 Jul 2025 11:50:01 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] media: uvcvideo: use
 usb_alloc_noncoherent/usb_free_noncoherent()
To: Xu Yang <xu.yang_2@nxp.com>, ezequiel@vanguardiasur.com.ar,
 mchehab@kernel.org, laurent.pinchart@ideasonboard.com,
 gregkh@linuxfoundation.org, mingo@kernel.org, tglx@linutronix.de,
 andriy.shevchenko@linux.intel.com, viro@zeniv.linux.org.uk,
 thomas.weissschuh@linutronix.de
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
References: <20250704095751.73765-1-xu.yang_2@nxp.com>
 <20250704095751.73765-3-xu.yang_2@nxp.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250704095751.73765-3-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4-Jul-25 11:57, Xu Yang wrote:
> This will use USB noncoherent API to alloc/free urb buffers, then
> uvc driver needn't to do dma sync operations by itself.
> 
> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hansg@kernel.org>

Regards,

Hans


> ---
> Changes in v5:
>  - add Rb tag
> Changes in v4:
>  - remove uvc_stream_to_dmadev()
> Changes in v3:
>  - no changes
> ---
>  drivers/media/usb/uvc/uvc_video.c | 61 +++++++------------------------
>  1 file changed, 14 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index e3567aeb0007..a75af314e46b 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -1275,20 +1275,6 @@ static inline enum dma_data_direction uvc_stream_dir(
>  		return DMA_TO_DEVICE;
>  }
>  
> -static inline struct device *uvc_stream_to_dmadev(struct uvc_streaming *stream)
> -{
> -	return bus_to_hcd(stream->dev->udev->bus)->self.sysdev;
> -}
> -
> -static int uvc_submit_urb(struct uvc_urb *uvc_urb, gfp_t mem_flags)
> -{
> -	/* Sync DMA. */
> -	dma_sync_sgtable_for_device(uvc_stream_to_dmadev(uvc_urb->stream),
> -				    uvc_urb->sgt,
> -				    uvc_stream_dir(uvc_urb->stream));
> -	return usb_submit_urb(uvc_urb->urb, mem_flags);
> -}
> -
>  /*
>   * uvc_video_decode_data_work: Asynchronous memcpy processing
>   *
> @@ -1310,7 +1296,7 @@ static void uvc_video_copy_data_work(struct work_struct *work)
>  		uvc_queue_buffer_release(op->buf);
>  	}
>  
> -	ret = uvc_submit_urb(uvc_urb, GFP_KERNEL);
> +	ret = usb_submit_urb(uvc_urb->urb, GFP_KERNEL);
>  	if (ret < 0)
>  		dev_err(&uvc_urb->stream->intf->dev,
>  			"Failed to resubmit video URB (%d).\n", ret);
> @@ -1736,12 +1722,6 @@ static void uvc_video_complete(struct urb *urb)
>  	/* Re-initialise the URB async work. */
>  	uvc_urb->async_operations = 0;
>  
> -	/* Sync DMA and invalidate vmap range. */
> -	dma_sync_sgtable_for_cpu(uvc_stream_to_dmadev(uvc_urb->stream),
> -				 uvc_urb->sgt, uvc_stream_dir(stream));
> -	invalidate_kernel_vmap_range(uvc_urb->buffer,
> -				     uvc_urb->stream->urb_size);
> -
>  	/*
>  	 * Process the URB headers, and optionally queue expensive memcpy tasks
>  	 * to be deferred to a work queue.
> @@ -1750,7 +1730,7 @@ static void uvc_video_complete(struct urb *urb)
>  
>  	/* If no async work is needed, resubmit the URB immediately. */
>  	if (!uvc_urb->async_operations) {
> -		ret = uvc_submit_urb(uvc_urb, GFP_ATOMIC);
> +		ret = usb_submit_urb(uvc_urb->urb, GFP_ATOMIC);
>  		if (ret < 0)
>  			dev_err(&stream->intf->dev,
>  				"Failed to resubmit video URB (%d).\n", ret);
> @@ -1765,17 +1745,15 @@ static void uvc_video_complete(struct urb *urb)
>   */
>  static void uvc_free_urb_buffers(struct uvc_streaming *stream)
>  {
> -	struct device *dma_dev = uvc_stream_to_dmadev(stream);
> +	struct usb_device *udev = stream->dev->udev;
>  	struct uvc_urb *uvc_urb;
>  
>  	for_each_uvc_urb(uvc_urb, stream) {
>  		if (!uvc_urb->buffer)
>  			continue;
>  
> -		dma_vunmap_noncontiguous(dma_dev, uvc_urb->buffer);
> -		dma_free_noncontiguous(dma_dev, stream->urb_size, uvc_urb->sgt,
> -				       uvc_stream_dir(stream));
> -
> +		usb_free_noncoherent(udev, stream->urb_size, uvc_urb->buffer,
> +				     uvc_stream_dir(stream), uvc_urb->sgt);
>  		uvc_urb->buffer = NULL;
>  		uvc_urb->sgt = NULL;
>  	}
> @@ -1786,26 +1764,13 @@ static void uvc_free_urb_buffers(struct uvc_streaming *stream)
>  static bool uvc_alloc_urb_buffer(struct uvc_streaming *stream,
>  				 struct uvc_urb *uvc_urb, gfp_t gfp_flags)
>  {
> -	struct device *dma_dev = uvc_stream_to_dmadev(stream);
> -
> -	uvc_urb->sgt = dma_alloc_noncontiguous(dma_dev, stream->urb_size,
> -					       uvc_stream_dir(stream),
> -					       gfp_flags, 0);
> -	if (!uvc_urb->sgt)
> -		return false;
> -	uvc_urb->dma = uvc_urb->sgt->sgl->dma_address;
> -
> -	uvc_urb->buffer = dma_vmap_noncontiguous(dma_dev, stream->urb_size,
> -						 uvc_urb->sgt);
> -	if (!uvc_urb->buffer) {
> -		dma_free_noncontiguous(dma_dev, stream->urb_size,
> -				       uvc_urb->sgt,
> -				       uvc_stream_dir(stream));
> -		uvc_urb->sgt = NULL;
> -		return false;
> -	}
> +	struct usb_device *udev = stream->dev->udev;
>  
> -	return true;
> +	uvc_urb->buffer = usb_alloc_noncoherent(udev, stream->urb_size,
> +						gfp_flags, &uvc_urb->dma,
> +						uvc_stream_dir(stream),
> +						&uvc_urb->sgt);
> +	return !!uvc_urb->buffer;
>  }
>  
>  /*
> @@ -1953,6 +1918,7 @@ static int uvc_init_video_isoc(struct uvc_streaming *stream,
>  		urb->complete = uvc_video_complete;
>  		urb->number_of_packets = npackets;
>  		urb->transfer_buffer_length = size;
> +		urb->sgt = uvc_urb->sgt;
>  
>  		for (i = 0; i < npackets; ++i) {
>  			urb->iso_frame_desc[i].offset = i * psize;
> @@ -2009,6 +1975,7 @@ static int uvc_init_video_bulk(struct uvc_streaming *stream,
>  				  size, uvc_video_complete, uvc_urb);
>  		urb->transfer_flags = URB_NO_TRANSFER_DMA_MAP;
>  		urb->transfer_dma = uvc_urb->dma;
> +		urb->sgt = uvc_urb->sgt;
>  
>  		uvc_urb->urb = urb;
>  	}
> @@ -2120,7 +2087,7 @@ static int uvc_video_start_transfer(struct uvc_streaming *stream,
>  
>  	/* Submit the URBs. */
>  	for_each_uvc_urb(uvc_urb, stream) {
> -		ret = uvc_submit_urb(uvc_urb, gfp_flags);
> +		ret = usb_submit_urb(uvc_urb->urb, gfp_flags);
>  		if (ret < 0) {
>  			dev_err(&stream->intf->dev,
>  				"Failed to submit URB %u (%d).\n",


