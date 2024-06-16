Return-Path: <linux-media+bounces-13351-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C8F90A0CF
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 01:29:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B935BB21508
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2024 23:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4DC773477;
	Sun, 16 Jun 2024 23:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FkUMzVGN"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD87049658;
	Sun, 16 Jun 2024 23:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718580531; cv=none; b=AUn0TJKzl3EXV4Im+irWvjWAMlwYHxckCtWbBHLnXZp2fDF5kRhvGKWEmFxj4mqBGFsA1dSCPp+zxaUxtgRrY+1bEHbi/qTD86ITt1/+C0h9zvXnrv+nYJ+GKbT7MJD7bfv+JNSBG3BdOetWJQ4JLlqURM2Svm0yWFtLmmVqbWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718580531; c=relaxed/simple;
	bh=K4SRz8AN8PSNor91S1LWTb8PxQaZfZ2ohDKGnTMyjRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m0L6kbwsZ7dtewXGcjZHnTF0pwizMC4E8H5REqYERTRXYHlfbvWheU7CZk7Nk550z2dwyRXKPUACHTDGZ7YplWqrgM4MxsSjhMW5lJSA5tEbQ4b/XuV44cfCW1MWMTqTVva+ZHdiDU+1YaCuaLX67sPA30vnrWRJLDtChei3xSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FkUMzVGN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E2AD1A9A;
	Mon, 17 Jun 2024 01:28:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718580512;
	bh=K4SRz8AN8PSNor91S1LWTb8PxQaZfZ2ohDKGnTMyjRU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FkUMzVGNO0BIfOA6u59Vv9KjqBpZytfcGyeWFxEUyFNMFT1irRhPc/KIDsXeJxZ76
	 PGMeY/u2LV6EM/nn84bST2xJXB/MeAOa25jkFIFaeINU3LtW0CTcvBj5e8wMx+mOa0
	 MdVfXXhHW6nBhjo+IZ1kwb0wqGctT0sXCwfWCq+o=
Date: Mon, 17 Jun 2024 02:28:27 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	HungNien Chen <hn.chen@sunplusit.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH 1/2] media: uvcvideo: Fix hw timestamp handling for slow
 FPS
Message-ID: <20240616232827.GI4782@pendragon.ideasonboard.com>
References: <20240610-hwtimestamp-followup-v1-0-f9eaed7be7f0@chromium.org>
 <20240610-hwtimestamp-followup-v1-1-f9eaed7be7f0@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240610-hwtimestamp-followup-v1-1-f9eaed7be7f0@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Mon, Jun 10, 2024 at 07:17:48PM +0000, Ricardo Ribalda wrote:
> In UVC 1.5 we get a single clock value per frame. With the current
> buffer size of 32, FPS slowers than 32 might roll-over twice.
> 
> The current code cannot handle two roll-over and provide invalid
> timestamps.
> 
> Revome all the samples from the circular buffer that are more than two
> rollovers old, so the algorithm always provides good timestamps.
> 
> Note that we are removing values that are more than one second old,
> which means that there is enough distance between the two points that
> we use for the interpolation to provide good values.
> 
> Tested-by: HungNien Chen <hn.chen@sunplusit.com>
> Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> Reviewed-by: Tomasz Figa <tfiga@chromium.org>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/usb/uvc/uvc_video.c | 23 +++++++++++++++++++++++
>  drivers/media/usb/uvc/uvcvideo.h  |  1 +
>  2 files changed, 24 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index 76a375fe47dc..869876afdcce 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -471,8 +471,30 @@ static void uvc_video_clock_add_sample(struct uvc_clock *clock,
>  {
>  	unsigned long flags;
>  
> +	/*
> +	 * If we write new data on the position where we had the last
> +	 * overflow, remove the overflow pointer. There is no SOF overflow
> +	 * in the whole circular buffer.
> +	 */
> +	if (clock->head == clock->last_sof_overflow)
> +		clock->last_sof_overflow = -1;
> +
>  	spin_lock_irqsave(&clock->lock, flags);
>  
> +	/* Handle SOF overflows. */
> +	if (clock->count > 0 && clock->last_sof > sample->dev_sof) {
> +		/*
> +		 * Remove data from the circular buffer that is older than the
> +		 * last SOF overflow. We only support one SOF overflow per
> +		 * circular buffer.
> +		 */
> +		if (clock->last_sof_overflow != -1)
> +			clock->count = (clock->head - clock->last_sof_overflow
> +					+ clock->size) % clock->size;
> +		clock->last_sof_overflow = clock->head;
> +	}
> +
> +	/* Add sample. */
>  	memcpy(&clock->samples[clock->head], sample, sizeof(*sample));
>  	clock->head = (clock->head + 1) % clock->size;
>  	clock->count = min(clock->count + 1, clock->size);
> @@ -605,6 +627,7 @@ static void uvc_video_clock_reset(struct uvc_clock *clock)
>  	clock->head = 0;
>  	clock->count = 0;
>  	clock->last_sof = -1;
> +	clock->last_sof_overflow = -1;
>  	clock->sof_offset = -1;
>  }
>  
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index e5b12717016f..f21207debd54 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -501,6 +501,7 @@ struct uvc_streaming {
>  		unsigned int head;
>  		unsigned int count;
>  		unsigned int size;
> +		unsigned int last_sof_overflow;
>  
>  		u16 last_sof;
>  		u16 sof_offset;
> 

-- 
Regards,

Laurent Pinchart

