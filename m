Return-Path: <linux-media+bounces-12854-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F638902075
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 13:38:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36D6E28470E
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 11:38:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 004657E101;
	Mon, 10 Jun 2024 11:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wCWtl+vL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFC8537E9;
	Mon, 10 Jun 2024 11:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718019504; cv=none; b=RV/rEhe00V38rCr5fkL66yawrU2VjBwqI9c5JWRSIlSBto/XJcWV+dguiSJnejVSFlDVqTQ6UR9u8W2sqBtIj6yKwgUn+Ty2Akwje95zSNLQRFWKmF1AJHvmKdv8wYpL+wMCgAGcIp712xRza+vEDHlCDLEE37LGwhUyL4wJvX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718019504; c=relaxed/simple;
	bh=5zWnGlA/sZUI0df8LRl+1oE1aI/eFOMmPhqgCeKWOZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ASL57zbMf7h0b80HT/oSJFYkH57IXatr0wiY8DCYZsfPy3otWZxFwEP9/uBH57zz826/zDVVW7aP7NPFYJFBpJ2CaNmWW8yVIy7dvPY+XDGd2gjUZS45pLOhP4fKVtcCwzedNONb+hWFN/p7GFTqtPBu+oQAQGCGHFzqk4tmD7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wCWtl+vL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C903D66F;
	Mon, 10 Jun 2024 13:38:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718019489;
	bh=5zWnGlA/sZUI0df8LRl+1oE1aI/eFOMmPhqgCeKWOZo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wCWtl+vLmPgAClQslHn9349CQyDVcYNJK4opxIegxm76lxRhnk5BWCLPLkQhms7/y
	 eRwgEBpHje8Y7A5PoVG6pS2iGiWQWSU34B9Sxoebd1zbF35ARiu1nKqZ7jKMHSAsrb
	 8NEzvWgyn4JuKNuTK+NBwP9nQQdg3u6bh+5aj/a4=
Date: Mon, 10 Jun 2024 14:38:00 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, "hn.chen" <hn.chen@sunplusit.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH v10 1/6] media: uvcvideo: Support timestamp lists of any
 size
Message-ID: <20240610113800.GQ18479@pendragon.ideasonboard.com>
References: <20240323-resend-hwtimestamp-v10-0-b08e590d97c7@chromium.org>
 <20240323-resend-hwtimestamp-v10-1-b08e590d97c7@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240323-resend-hwtimestamp-v10-1-b08e590d97c7@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Sat, Mar 23, 2024 at 10:48:02AM +0000, Ricardo Ribalda wrote:
> The tail of the list lives at the position before the head. This is
> mathematically noted as:
> ```
> (head-1) mod size.
> ```
> Unfortunately C, does not have a modulus operator, but a remainder
> operator (%).
> The reminder operation has a different result than the modulus if
> (head -1) is a negative number and size is not a power of two.
> 
> Adding size to (head-1) allows the code to run with any value of size.
> 
> This does not change the current behaviour of the driver, as the size is
> always a power of two, but avoid tedious debugging if we ever change its
> size.
> 
> Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/usb/uvc/uvc_video.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index 7cbf4692bd875..659c9e9880a99 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -732,7 +732,7 @@ void uvc_video_clock_update(struct uvc_streaming *stream,
>  		goto done;
>  
>  	first = &clock->samples[clock->head];
> -	last = &clock->samples[(clock->head - 1) % clock->size];
> +	last = &clock->samples[(clock->head - 1 + clock->size) % clock->size];
>  
>  	/* First step, PTS to SOF conversion. */
>  	delta_stc = buf->pts - (1UL << 31);
> 

-- 
Regards,

Laurent Pinchart

