Return-Path: <linux-media+bounces-34801-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 29526AD9D69
	for <lists+linux-media@lfdr.de>; Sat, 14 Jun 2025 16:17:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D90D6178A21
	for <lists+linux-media@lfdr.de>; Sat, 14 Jun 2025 14:17:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69FFD2DA75C;
	Sat, 14 Jun 2025 14:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="s/7TKoqL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017E270808;
	Sat, 14 Jun 2025 14:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749910626; cv=none; b=qNLtuKGzOWRu1ivyhE5+gHHQvVcRqUrGx6B4WfXxUS76Y+J+HsUXz80E0Rjg5h0gZQK4/oQQ+BYbza/nLQ6BKhO2HoNFORFhTG2W5zVnfPo5nOoSuqQAr44wEtslSoMtjvhBieYMdiQvGPrGyaHpvUgfsS9AnuUOc2pKgsILD2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749910626; c=relaxed/simple;
	bh=r81LIaPmXQ/xJrl22YxOKvr5pcoDhEJL8IYVM3F4dpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kcReYv6Bw5e+y4sg3kVVPUL6as9BUxY+1o0SqM9acQ/20aBDJrFZUWraYpHIp7wpIbfqubGMX+G6QU85/AhwRdcEo7XHSvTd5L3CgRiTrDIZhpMV6+gHngBFbdUVr56NLBItWUMAgM5cJG+njeHpdqe9/Tfq7yQZJ4AyKmSKjAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=s/7TKoqL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7A70D741;
	Sat, 14 Jun 2025 16:16:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749910612;
	bh=r81LIaPmXQ/xJrl22YxOKvr5pcoDhEJL8IYVM3F4dpQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s/7TKoqLG6twgWd7iJPobhuzYkMM77JhkpNG4TUPfOfpn4LRiVLE3YWz3Ft6hZUUB
	 sUP4iaCwNmq0+yUorGIO2u1X8FY2QD1WfNhjhYoPvlLn/cyQ3xfp3n8tSdU3ms5oTH
	 ztFoNmD8337akuUwXNMHpgQEgi3jz58ZiCM0A2Zc=
Date: Sat, 14 Jun 2025 17:16:47 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
	hdegoede@redhat.com, mchehab@kernel.org,
	jeff.johnson@oss.qualcomm.com, linux-media@vger.kernel.org,
	linux-usb@vger.kernel.org, jun.li@nxp.com, imx@lists.linux.dev
Subject: Re: [PATCH 1/2] usbmon: do dma sync for cpu read if the buffer is
 not dma coherent
Message-ID: <20250614141647.GM25137@pendragon.ideasonboard.com>
References: <20250614132446.251218-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250614132446.251218-1-xu.yang_2@nxp.com>

On Sat, Jun 14, 2025 at 09:24:45PM +0800, Xu Yang wrote:
> The urb->transfer_dma may not be dma coherent, in this case usb monitor
> may get old data. For example, commit "20e1dbf2bbe2 media: uvcvideo:
> Use dma_alloc_noncontiguous API" is allocating non-coherent buffer.
> 
> To make usbmon result more reliable, this will add a flag
> URB_USBMON_NEED_SYNC to indicate that usb monitor need do dma sync
> before reading buffer data.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/mon/mon_main.c | 7 +++++++
>  include/linux/usb.h        | 1 +
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/usb/mon/mon_main.c b/drivers/usb/mon/mon_main.c
> index af852d53aac6..b9d5c1b46b85 100644
> --- a/drivers/usb/mon/mon_main.c
> +++ b/drivers/usb/mon/mon_main.c
> @@ -14,6 +14,7 @@
>  #include <linux/slab.h>
>  #include <linux/notifier.h>
>  #include <linux/mutex.h>
> +#include <linux/dma-mapping.h>
>  
>  #include "usb_mon.h"
>  
> @@ -142,6 +143,12 @@ static void mon_complete(struct usb_bus *ubus, struct urb *urb, int status)
>  {
>  	struct mon_bus *mbus;
>  
> +	if (urb->transfer_flags & URB_USBMON_NEED_SYNC)
> +		dma_sync_single_for_cpu(ubus->sysdev,
> +					urb->transfer_dma,
> +					urb->transfer_buffer_length,
> +					DMA_FROM_DEVICE);

This will result in a double sync, impacting performance. Futhermore,
the sync code in uvc_video.c reads as

	/* Sync DMA and invalidate vmap range. */
	dma_sync_sgtable_for_cpu(uvc_stream_to_dmadev(uvc_urb->stream),
				 uvc_urb->sgt, uvc_stream_dir(stream));
	invalidate_kernel_vmap_range(uvc_urb->buffer,
				     uvc_urb->stream->urb_size);

The difference makes me think something has been overlooked here.
Finally, uvcvideo supports output devices, so the DMA_FROM_DEVICE
direction doesn't seem universally applicable.

It seems there are quite a few issues to solve to merge this feature. If
the DMA sync operation can be done in a generic way in usbmon, then we
should consider moving it to the USB core and avoid the sync in the
driver. That may remove too much flexibility from drivers though, in
which case it may be best to let the driver handle the sync in a way
that guarantees it gets performed before usbmon inspects the data.

The issue doesn't seem specific to the uvcvideo driver. All drivers that
set URB_NO_TRANSFER_DMA_MAP seem to be affected. A more generic
mechanism to handle that would also be good.

> +
>  	mbus = ubus->mon_bus;
>  	if (mbus != NULL)
>  		mon_bus_complete(mbus, urb, status);
> diff --git a/include/linux/usb.h b/include/linux/usb.h
> index 1b2545b4363b..d31baee4ffa6 100644
> --- a/include/linux/usb.h
> +++ b/include/linux/usb.h
> @@ -1368,6 +1368,7 @@ extern int usb_disabled(void);
>  #define URB_ISO_ASAP		0x0002	/* iso-only; use the first unexpired
>  					 * slot in the schedule */
>  #define URB_NO_TRANSFER_DMA_MAP	0x0004	/* urb->transfer_dma valid on submit */
> +#define URB_USBMON_NEED_SYNC	0x0008	/* usb monitor need do dma sync for cpu read */
>  #define URB_ZERO_PACKET		0x0040	/* Finish bulk OUT with short packet */
>  #define URB_NO_INTERRUPT	0x0080	/* HINT: no non-error interrupt
>  					 * needed */

-- 
Regards,

Laurent Pinchart

