Return-Path: <linux-media+bounces-7556-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A29B886442
	for <lists+linux-media@lfdr.de>; Fri, 22 Mar 2024 01:12:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 635442816E2
	for <lists+linux-media@lfdr.de>; Fri, 22 Mar 2024 00:12:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C4DA637;
	Fri, 22 Mar 2024 00:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Z9S6J6Nu"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B157376;
	Fri, 22 Mar 2024 00:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711066362; cv=none; b=PWLXoW7+CsWXKKnHbivSty42CNibnMoWqhBQnURQYs/aNcWsjb61nDy+AvcUlBvzuoBWHG6IjQoZ93LtZCB0Y3ZZwNoXIno0U4dsziYnsmy3DnjPG/sKXqNbhq0CBWC16PyImKI9g8rDuzJcS3lZCxB+Cn7kcYNQgKYcF5QOv3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711066362; c=relaxed/simple;
	bh=IAy8FuvSRJCrxIuqCCe10NRYXu7gVZcnvVIWgS+pCdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rDJp77BvPW4Akz+SLFrnki57AzXWQJhjSsvbklujy18n/jncfiRAIJAggaiMHef8PBUfjdQ2zjG40b+2ytaNvEhBfnlxLzWHnJS+CbhwKIZX4jDCc7NX9ItnH/GcMY6M+ZTFsUa2Xa6cOOczu/WlyJuO5ASbDIx2kp0bnkNV86U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Z9S6J6Nu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A98672E4;
	Fri, 22 Mar 2024 01:12:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711066330;
	bh=IAy8FuvSRJCrxIuqCCe10NRYXu7gVZcnvVIWgS+pCdw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z9S6J6NuZSx0zxKyJCKKK5tLwLlghVTcK26PQmw75m/Bf9d4QGNr8KimDKzzMsSJn
	 1XE3PIINxdSmvszzI/fL9ZCRn5RfIZP/OqT7iWc77GQFVCEUDvCmlRx4wpSI0QM7r4
	 AkRsvx8/Rc+6WolHj2m6G1ZZ85/W7ODHQ/7/T+yY=
Date: Fri, 22 Mar 2024 02:12:35 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	linux-kernel@vger.kernel.org, "hn.chen" <hn.chen@sunplusit.com>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v9 4/6] media: uvcvideo: Allow hw clock updates with
 buffers not full
Message-ID: <20240322001235.GD20938@pendragon.ideasonboard.com>
References: <20220920-resend-hwtimestamp-v9-0-55a89f46f6be@chromium.org>
 <20220920-resend-hwtimestamp-v9-4-55a89f46f6be@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220920-resend-hwtimestamp-v9-4-55a89f46f6be@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Wed, Mar 15, 2023 at 02:30:15PM +0100, Ricardo Ribalda wrote:
> With UVC 1.5 we get as little as one clock sample per frame. Which means
> that it takes 32 frames to move from the software timestamp to the
> hardware timestamp method.
> 
> This results in abrupt changes in the timestamping after 32 frames (~1
> second), resulting in noticeable artifacts when used for encoding.
> 
> With this patch we modify the update algorithm to work with whatever
> amount of values are available.
> 
> Tested-by: HungNien Chen <hn.chen@sunplusit.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_video.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index 4d566edb73e7..6d0243ea0e07 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -754,10 +754,10 @@ void uvc_video_clock_update(struct uvc_streaming *stream,
>  
>  	spin_lock_irqsave(&clock->lock, flags);
>  
> -	if (clock->count < clock->size)
> +	if (clock->count < 2)
>  		goto done;
>  
> -	first = &clock->samples[clock->head];
> +	first = &clock->samples[(clock->head - clock->count + clock->size) % clock->size];
>  	last = &clock->samples[(clock->head - 1 + clock->size) % clock->size];
>  
>  	/* First step, PTS to SOF conversion. */
> @@ -772,6 +772,17 @@ void uvc_video_clock_update(struct uvc_streaming *stream,
>  	if (y2 < y1)
>  		y2 += 2048 << 16;
>  
> +	/*
> +	 * Have at least 1/4 of a second of timestamps before we
> +	 * try to do any calculation. Otherwise we do not have enough
> +	 * precision. This value was determined by running Android CTS
> +	 * on different devices.

Either a blank line for a new paragraph, or no line break.

> +	 * Dev_sof runs at 1KHz, and we have a fixed point precision of

s/Dev_sof/dev_sof/

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +	 * 16 bits.
> +	 */
> +	if ((y2 - y1) < ( (1000 / 4) << 16))
> +		goto done;
> +
>  	y = (u64)(y2 - y1) * (1ULL << 31) + (u64)y1 * (u64)x2
>  	  - (u64)y2 * (u64)x1;
>  	y = div_u64(y, x2 - x1);
> 

-- 
Regards,

Laurent Pinchart

