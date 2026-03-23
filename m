Return-Path: <linux-media+bounces-56775-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIj9FULCwWkHWQQAu9opvQ
	(envelope-from <linux-media+bounces-56775-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 23:44:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F30F42FE6F7
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 23:44:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8673E3028002
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 22:44:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 187C7383C68;
	Mon, 23 Mar 2026 22:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oC0Zzc7x"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECC12FE582;
	Mon, 23 Mar 2026 22:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774305837; cv=none; b=O0z142XPk5diMUrggpwZmmhc7dB0bgU8Le7SI7AwhegLFg+pl7ycCPWoYC0w/XkFLShEyo1Tjfm2d/9wcwK9jB1PLWs+0w8+Hyd9ERzS4OVeRi/qxnFWs92ioVTUD6kdHQzjYbItoX23ZtYeztlBoL+kVBY8OoASDEJHhRaT5BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774305837; c=relaxed/simple;
	bh=6dTh16VaUXIX3RejBYnNd0Tc2DOhnHPZfvxew3+gr/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RpNsCflHsxe2B2PTQuUG8ibKNkHFcqpTPaKt/u72wz76L776p3qkA7eUBi6bNjO3TBsmzLdFz6gxHHMzzGhnSNj8wn2ND8xCD5ZQPI5hPE1Bs5bV6EGiAzoChkpvCJL/bvtx6yQSJB+YnkcBGBLq5PHATILY1HnDr+tDCFqwVjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oC0Zzc7x; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id EC76C78C;
	Mon, 23 Mar 2026 23:42:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774305758;
	bh=6dTh16VaUXIX3RejBYnNd0Tc2DOhnHPZfvxew3+gr/c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oC0Zzc7xDWLyVNVSS+dW91aTS51FT+rwHX9Fh6XIqO5wv2HLsdFr8fnucQiLdpfBW
	 jaDDUxZtPLTnb0xfiJjW1DA/N/C4zmsQMu45GhGhW6ZTNJ5KlaXu78tAfhWNKdQKl0
	 Q5cSmbaZudVskWQ7FqyHscqCi/V20WftOUAALxFs=
Date: Tue, 24 Mar 2026 00:43:52 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Fix bug in error path of
 uvc_alloc_urb_buffers
Message-ID: <20260323224352.GA2334070@killaraus.ideasonboard.com>
References: <20260320-uvc-urb-free-error-v1-1-b12cc3762a19@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260320-uvc-urb-free-error-v1-1-b12cc3762a19@chromium.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56775-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[killaraus.ideasonboard.com:mid,ideasonboard.com:dkim,ideasonboard.com:email,chromium.org:email,invisiblethingslab.com:email]
X-Rspamd-Queue-Id: F30F42FE6F7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026 at 07:49:10AM +0000, Ricardo Ribalda wrote:
> Recent cleanup introduced a bug in the error path of
> uvc_alloc_urb_buffers(). If there is not enough memory for the
> allocation the following error will be triggered:
> 
> [  739.196672] UBSAN: shift-out-of-bounds in mm/page_alloc.c:1403:22
> [  739.196710] shift exponent 52 is too large for 32-bit type 'int'
> 
> Resulting in:
> [  740.464422] BUG: unable to handle page fault for address: fffffac1c0800000
> 
> The reason for the bug is that usb_free_noncoherent is called with an
> invalid size (0) instead of the actual size of the urb.
> 
> This patch takes care of that.
> 
> Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Closes: https://lore.kernel.org/linux-media/abycbXzYupZpGkvR@hyeyoo/T/#t
> Tested-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Fixes: c824345288d1 ("media: uvcvideo: Pass allocation size directly to uvc_alloc_urb_buffer")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

This is a v7.0 fix. Hans, Mauro, could you please pick it up ?

> ---
>  drivers/media/usb/uvc/uvc_video.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index 40c76c051da2..f6c8e3223796 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -1751,7 +1751,8 @@ static void uvc_video_complete(struct urb *urb)
>  /*
>   * Free transfer buffers.
>   */
> -static void uvc_free_urb_buffers(struct uvc_streaming *stream)
> +static void uvc_free_urb_buffers(struct uvc_streaming *stream,
> +				 unsigned int size)
>  {
>  	struct usb_device *udev = stream->dev->udev;
>  	struct uvc_urb *uvc_urb;
> @@ -1760,7 +1761,7 @@ static void uvc_free_urb_buffers(struct uvc_streaming *stream)
>  		if (!uvc_urb->buffer)
>  			continue;
>  
> -		usb_free_noncoherent(udev, stream->urb_size, uvc_urb->buffer,
> +		usb_free_noncoherent(udev, size, uvc_urb->buffer,
>  				     uvc_stream_dir(stream), uvc_urb->sgt);
>  		uvc_urb->buffer = NULL;
>  		uvc_urb->sgt = NULL;
> @@ -1820,7 +1821,7 @@ static int uvc_alloc_urb_buffers(struct uvc_streaming *stream,
>  
>  			if (!uvc_alloc_urb_buffer(stream, uvc_urb, urb_size,
>  						  gfp_flags)) {
> -				uvc_free_urb_buffers(stream);
> +				uvc_free_urb_buffers(stream, urb_size);
>  				break;
>  			}
>  
> @@ -1868,7 +1869,7 @@ static void uvc_video_stop_transfer(struct uvc_streaming *stream,
>  	}
>  
>  	if (free_buffers)
> -		uvc_free_urb_buffers(stream);
> +		uvc_free_urb_buffers(stream, stream->urb_size);
>  }
>  
>  /*
> 
> ---
> base-commit: a93a51f42ac354425a252210183c4151d991f75d
> change-id: 20260320-uvc-urb-free-error-e73b1db16e21

-- 
Regards,

Laurent Pinchart

