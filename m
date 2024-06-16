Return-Path: <linux-media+bounces-13352-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DA190A0D2
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 01:30:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7EB942825A4
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2024 23:30:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13CB773509;
	Sun, 16 Jun 2024 23:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AKkou4iL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC1A11CB8;
	Sun, 16 Jun 2024 23:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718580648; cv=none; b=LHrxXxVprWFq0RLhDDnh6PVhLt5MKJYxnCKNzGp8f+8kpIWBbCxBsKBNygIIUrXOUdf963HnEXyLQNM3lKE7zCq6ozZUtk5CEGxTzD/mA2BX/DYkXlSoNjkWYj/TCZsVPs1m8v3qQ/M3neWILiHJ3xp00u6ZjUCTPd4SLCi370Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718580648; c=relaxed/simple;
	bh=4soU0nO/RdVPxpnNDUIwqlhLaKENAoUrimGjSvk6EFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sNb2d+SdJM1YBGe0ri7ZWDIHFSrHKdwfsd2b8Q86nsxZRypvUD7NPTQ6QvwaXAPRT67OQKPNdAhBnu6NoEKrVl4A/5+1iCGYEQwk6RrLfKc+O3zxObw6cP42cBOfp6CLObqypCXTjm0XtEeVDZwQrBB9j5L2bWpJhUEjN77RGTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AKkou4iL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 00FC92D5;
	Mon, 17 Jun 2024 01:30:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718580629;
	bh=4soU0nO/RdVPxpnNDUIwqlhLaKENAoUrimGjSvk6EFM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AKkou4iL/qZ5anxip5DMYJZDyT2xG5rJ0EMmUVztGyiBZm8zqQipX9D6XRiYP3ndU
	 hBT+BF6LEGgzSk7RczckyfEODRtDfJEIalzt8/gkRK2+kdRxhJua7AmATOAkWRWG1N
	 pWKQq0/3yNvEy9z0X18b7l6qFHPbjWas7s48cJXY=
Date: Mon, 17 Jun 2024 02:30:24 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 2/2] media: uvcvideo: Fix integer overflow calculating
 timestamp
Message-ID: <20240616233024.GJ4782@pendragon.ideasonboard.com>
References: <20240610-hwtimestamp-followup-v1-0-f9eaed7be7f0@chromium.org>
 <20240610-hwtimestamp-followup-v1-2-f9eaed7be7f0@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240610-hwtimestamp-followup-v1-2-f9eaed7be7f0@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Mon, Jun 10, 2024 at 07:17:49PM +0000, Ricardo Ribalda wrote:
> The function uvc_video_clock_update() supports a single SOF overflow. Or
> in other words, the maximum difference between the first ant the last
> timestamp can be 4096 ticks or 4.096 seconds.
> 
> This results in a maximum value for y2 of: 0x12FBECA00, that overflows
> 32bits.
> y2 = (u32)ktime_to_ns(ktime_sub(last->host_time, first->host_time)) + y1;
> 
> Extend the size of y2 to u64 to support all its values.
> 
> Without this patch:
>  # yavta -s 1920x1080 -f YUYV -t 1/5 -c /dev/video0
> Device /dev/v4l/by-id/usb-Shine-Optics_Integrated_Camera_0001-video-index0 opened.
> Device `Integrated Camera: Integrated C' on `usb-0000:00:14.0-6' (driver 'uvcvideo') supports video, capture, without mplanes.
> Video format set: YUYV (56595559) 1920x1080 (stride 3840) field none buffer size 4147200
> Video format: YUYV (56595559) 1920x1080 (stride 3840) field none buffer size 4147200
> Current frame rate: 1/5
> Setting frame rate to: 1/5
> Frame rate set: 1/5
> 8 buffers requested.
> length: 4147200 offset: 0 timestamp type/source: mono/SoE
> Buffer 0/0 mapped at address 0x7947ea94c000.
> length: 4147200 offset: 4149248 timestamp type/source: mono/SoE
> Buffer 1/0 mapped at address 0x7947ea557000.
> length: 4147200 offset: 8298496 timestamp type/source: mono/SoE
> Buffer 2/0 mapped at address 0x7947ea162000.
> length: 4147200 offset: 12447744 timestamp type/source: mono/SoE
> Buffer 3/0 mapped at address 0x7947e9d6d000.
> length: 4147200 offset: 16596992 timestamp type/source: mono/SoE
> Buffer 4/0 mapped at address 0x7947e9978000.
> length: 4147200 offset: 20746240 timestamp type/source: mono/SoE
> Buffer 5/0 mapped at address 0x7947e9583000.
> length: 4147200 offset: 24895488 timestamp type/source: mono/SoE
> Buffer 6/0 mapped at address 0x7947e918e000.
> length: 4147200 offset: 29044736 timestamp type/source: mono/SoE
> Buffer 7/0 mapped at address 0x7947e8d99000.
> 0 (0) [-] none 0 4147200 B 507.554210 508.874282 242.836 fps ts mono/SoE
> 1 (1) [-] none 2 4147200 B 508.886298 509.074289 0.751 fps ts mono/SoE
> 2 (2) [-] none 3 4147200 B 509.076362 509.274307 5.261 fps ts mono/SoE
> 3 (3) [-] none 4 4147200 B 509.276371 509.474336 5.000 fps ts mono/SoE
> 4 (4) [-] none 5 4147200 B 509.476394 509.674394 4.999 fps ts mono/SoE
> 5 (5) [-] none 6 4147200 B 509.676506 509.874345 4.997 fps ts mono/SoE
> 6 (6) [-] none 7 4147200 B 509.876430 510.074370 5.002 fps ts mono/SoE
> 7 (7) [-] none 8 4147200 B 510.076434 510.274365 5.000 fps ts mono/SoE
> 8 (0) [-] none 9 4147200 B 510.276421 510.474333 5.000 fps ts mono/SoE
> 9 (1) [-] none 10 4147200 B 510.476391 510.674429 5.001 fps ts mono/SoE
> 10 (2) [-] none 11 4147200 B 510.676434 510.874283 4.999 fps ts mono/SoE
> 11 (3) [-] none 12 4147200 B 510.886264 511.074349 4.766 fps ts mono/SoE
> 12 (4) [-] none 13 4147200 B 511.070577 511.274304 5.426 fps ts mono/SoE
> 13 (5) [-] none 14 4147200 B 511.286249 511.474301 4.637 fps ts mono/SoE
> 14 (6) [-] none 15 4147200 B 511.470542 511.674251 5.426 fps ts mono/SoE
> 15 (7) [-] none 16 4147200 B 511.672651 511.874337 4.948 fps ts mono/SoE
> 16 (0) [-] none 17 4147200 B 511.873988 512.074462 4.967 fps ts mono/SoE
> 17 (1) [-] none 18 4147200 B 512.075982 512.278296 4.951 fps ts mono/SoE
> 18 (2) [-] none 19 4147200 B 512.282631 512.482423 4.839 fps ts mono/SoE
> 19 (3) [-] none 20 4147200 B 518.986637 512.686333 0.149 fps ts mono/SoE
> 20 (4) [-] none 21 4147200 B 518.342709 512.886386 -1.553 fps ts mono/SoE
> 21 (5) [-] none 22 4147200 B 517.909812 513.090360 -2.310 fps ts mono/SoE
> 22 (6) [-] none 23 4147200 B 517.590775 513.294454 -3.134 fps ts mono/SoE
> 23 (7) [-] none 24 4147200 B 513.298465 513.494335 -0.233 fps ts mono/SoE
> 24 (0) [-] none 25 4147200 B 513.510273 513.698375 4.721 fps ts mono/SoE
> 25 (1) [-] none 26 4147200 B 513.698904 513.902327 5.301 fps ts mono/SoE
> 26 (2) [-] none 27 4147200 B 513.895971 514.102348 5.074 fps ts mono/SoE
> 27 (3) [-] none 28 4147200 B 514.099091 514.306337 4.923 fps ts mono/SoE
> 28 (4) [-] none 29 4147200 B 514.310348 514.510567 4.734 fps ts mono/SoE
> 29 (5) [-] none 30 4147200 B 514.509295 514.710367 5.026 fps ts mono/SoE
> 30 (6) [-] none 31 4147200 B 521.532513 514.914398 0.142 fps ts mono/SoE
> 31 (7) [-] none 32 4147200 B 520.885277 515.118385 -1.545 fps ts mono/SoE
> 32 (0) [-] none 33 4147200 B 520.411140 515.318336 -2.109 fps ts mono/SoE
> 33 (1) [-] none 34 4147200 B 515.325425 515.522278 -0.197 fps ts mono/SoE
> 34 (2) [-] none 35 4147200 B 515.538276 515.726423 4.698 fps ts mono/SoE
> 35 (3) [-] none 36 4147200 B 515.720767 515.930373 5.480 fps ts mono/SoE
> 
> Cc: stable@vger.kernel.org
> Fixes: 66847ef013cc ("[media] uvcvideo: Add UVC timestamps support")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/usb/uvc/uvc_video.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index 869876afdcce..82a69f46718d 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -750,11 +750,11 @@ void uvc_video_clock_update(struct uvc_streaming *stream,
>  	unsigned long flags;
>  	u64 timestamp;
>  	u32 delta_stc;
> -	u32 y1, y2;
> +	u32 y1;
>  	u32 x1, x2;
>  	u32 mean;
>  	u32 sof;
> -	u64 y;
> +	u64 y, y2;
>  
>  	if (!uvc_hw_timestamps_param)
>  		return;
> @@ -805,7 +805,7 @@ void uvc_video_clock_update(struct uvc_streaming *stream,
>  	sof = y;
>  
>  	uvc_dbg(stream->dev, CLOCK,
> -		"%s: PTS %u y %llu.%06llu SOF %u.%06llu (x1 %u x2 %u y1 %u y2 %u SOF offset %u)\n",
> +		"%s: PTS %u y %llu.%06llu SOF %u.%06llu (x1 %u x2 %u y1 %u y2 %llu SOF offset %u)\n",
>  		stream->dev->name, buf->pts,
>  		y >> 16, div_u64((y & 0xffff) * 1000000, 65536),
>  		sof >> 16, div_u64(((u64)sof & 0xffff) * 1000000LLU, 65536),
> @@ -820,7 +820,7 @@ void uvc_video_clock_update(struct uvc_streaming *stream,
>  		goto done;
>  
>  	y1 = NSEC_PER_SEC;
> -	y2 = (u32)ktime_to_ns(ktime_sub(last->host_time, first->host_time)) + y1;
> +	y2 = ktime_to_ns(ktime_sub(last->host_time, first->host_time)) + y1;
>  
>  	/*
>  	 * Interpolated and host SOF timestamps can wrap around at slightly
> @@ -841,7 +841,7 @@ void uvc_video_clock_update(struct uvc_streaming *stream,
>  	timestamp = ktime_to_ns(first->host_time) + y - y1;
>  
>  	uvc_dbg(stream->dev, CLOCK,
> -		"%s: SOF %u.%06llu y %llu ts %llu buf ts %llu (x1 %u/%u/%u x2 %u/%u/%u y1 %u y2 %u)\n",
> +		"%s: SOF %u.%06llu y %llu ts %llu buf ts %llu (x1 %u/%u/%u x2 %u/%u/%u y1 %u y2 %llu)\n",
>  		stream->dev->name,
>  		sof >> 16, div_u64(((u64)sof & 0xffff) * 1000000LLU, 65536),
>  		y, timestamp, vbuf->vb2_buf.timestamp,

-- 
Regards,

Laurent Pinchart

