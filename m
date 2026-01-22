Return-Path: <linux-media+bounces-51308-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCzgA/GBcWk1IAAAu9opvQ
	(envelope-from <linux-media+bounces-51308-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 02:48:33 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C9060807
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 02:48:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 56203408957
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 01:47:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35780340A6B;
	Thu, 22 Jan 2026 01:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cmQnRPbF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E1630F932;
	Thu, 22 Jan 2026 01:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769046434; cv=none; b=oslif6upNW87bQ/9zq6KLDhQ3segO5Y6D7K7Yfsm9TnBmAwGl+LZnLF6HamHvHjWAMsrBUQjYYNHNyn+tUTNQH3QZ9vfNVmDNKv2NUSKHqZ98f2RgSlTDA/PrHgnkYPTiXh18lNX1HOUkAZ9ckwJNO2LdKQP+Uhd6w1CDmBHLKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769046434; c=relaxed/simple;
	bh=eC7vr2+F1H7klDFQdegYA/xcA9Py7nxs559DPZpfc58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PHKYjuBlQ+mnMLClSvoOrHNSgqMhjMyfR9BmCwbd5Bwq5nxcCbolOkFxbij2gDpOZ2ogAtPEHS9Wg69XTgtrr0tg/+RVIMT17Q9auI0PttGzg3OSK0xqkif+UszoJH4fXIvCGE6MDXRRhUgCQhQr84dd4ZGRaMI0CmgI5ZkoIAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cmQnRPbF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (2001-14ba-703d-e500--ff4.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::ff4])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id EA6752DD;
	Thu, 22 Jan 2026 02:46:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769046398;
	bh=eC7vr2+F1H7klDFQdegYA/xcA9Py7nxs559DPZpfc58=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cmQnRPbFaOr6EtJ45SPJCie7AxpZK22kqUmqBu4h8LTpj2vVG07T53s8Vu2Q/dKRs
	 5vPmnPtdq7TkDFmfwHengT2cFFP+PZde7Siuc1LyVj6X3ltB3aCjyDikeMDXRJNL0v
	 tgMS70vt+QQfz1wWi7p2UewT3gkNpEc0Nj0TBSFs=
Date: Thu, 22 Jan 2026 03:47:08 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>,
	Laurent Pinchart <laurent.pinchart@skynet.be>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] media: uvcvideo: Pass allocation size directly to
 uvc_alloc_urb_buffer
Message-ID: <20260122014708.GB183118@killaraus>
References: <20260114-uvc-alloc-urb-v1-0-cedf3fb66711@chromium.org>
 <20260114-uvc-alloc-urb-v1-2-cedf3fb66711@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260114-uvc-alloc-urb-v1-2-cedf3fb66711@chromium.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51308-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[ideasonboard.com,none];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,ideasonboard.com:email,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: B2C9060807
X-Rspamd-Action: no action

Hi Ricardo,

Thank you for the patch.

On Wed, Jan 14, 2026 at 10:32:14AM +0000, Ricardo Ribalda wrote:
> The uvc_alloc_urb_buffer() function implicitly depended on the
> stream->urb_size field, which was set by its caller,
> uvc_alloc_urb_buffers(). This implicit data flow makes the code harder
> to follow.
> 
> More importantly, stream->urb_size was updated within the allocation
> loop before the allocation was confirmed to be successful. If the
> allocation failed, the stream object would be left with a urb_size that
> doesn't correspond to valid, allocated URB buffers.
> 
> Refactor uvc_alloc_urb_buffer() to accept the buffer size as an explicit
> argument. This makes the function's dependencies clear and improves the
> robustness of the error handling path. The stream->urb_size is now set only
> after a complete and successful allocation.
> 
> This is a pure refactoring and introduces no functional changes.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

It's cleaner indeed.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/usb/uvc/uvc_video.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index ec76595f3c4be0f49b798ec663d6855d78ab21c4..59eb95a4b70c05b1a12986e908b7e9979b064fd0 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -1771,12 +1771,13 @@ static void uvc_free_urb_buffers(struct uvc_streaming *stream)
>  }
>  
>  static bool uvc_alloc_urb_buffer(struct uvc_streaming *stream,
> -				 struct uvc_urb *uvc_urb, gfp_t gfp_flags)
> +				 struct uvc_urb *uvc_urb, unsigned int size,
> +				 gfp_t gfp_flags)
>  {
>  	struct usb_device *udev = stream->dev->udev;
>  
> -	uvc_urb->buffer = usb_alloc_noncoherent(udev, stream->urb_size,
> -						gfp_flags, &uvc_urb->dma,
> +	uvc_urb->buffer = usb_alloc_noncoherent(udev, size, gfp_flags,
> +						&uvc_urb->dma,
>  						uvc_stream_dir(stream),
>  						&uvc_urb->sgt);
>  	return !!uvc_urb->buffer;
> @@ -1813,12 +1814,13 @@ static int uvc_alloc_urb_buffers(struct uvc_streaming *stream,
>  
>  	/* Retry allocations until one succeed. */
>  	for (; npackets > 0; npackets /= 2) {
> -		stream->urb_size = psize * npackets;
> +		unsigned int urb_size = psize * npackets;
>  
>  		for (i = 0; i < UVC_URBS; ++i) {
>  			struct uvc_urb *uvc_urb = &stream->uvc_urb[i];
>  
> -			if (!uvc_alloc_urb_buffer(stream, uvc_urb, gfp_flags)) {
> +			if (!uvc_alloc_urb_buffer(stream, uvc_urb, urb_size,
> +						  gfp_flags)) {
>  				uvc_free_urb_buffers(stream);
>  				break;
>  			}
> @@ -1830,6 +1832,7 @@ static int uvc_alloc_urb_buffers(struct uvc_streaming *stream,
>  			uvc_dbg(stream->dev, VIDEO,
>  				"Allocated %u URB buffers of %ux%u bytes each\n",
>  				UVC_URBS, npackets, psize);
> +			stream->urb_size = urb_size;
>  			return npackets;
>  		}
>  	}
> @@ -1837,7 +1840,6 @@ static int uvc_alloc_urb_buffers(struct uvc_streaming *stream,
>  	uvc_dbg(stream->dev, VIDEO,
>  		"Failed to allocate URB buffers (%u bytes per packet)\n",
>  		psize);
> -	stream->urb_size = 0;
>  	return 0;
>  }
>  

-- 
Regards,

Laurent Pinchart

