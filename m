Return-Path: <linux-media+bounces-12860-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F5E902210
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 14:53:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 457A6285E43
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 12:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10B5D81728;
	Mon, 10 Jun 2024 12:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Leqc6Kvn"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC39E80C04;
	Mon, 10 Jun 2024 12:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718024001; cv=none; b=VyAGBfRktcqHgJiylvf0zutn5LU+Re559IOzJU/hu1cMddv9cDbC+g1urF0dODZX3mg4Zh68lMGDxH3YbDQswrlyWCa0SctNqAFpz4LthzxCpTkEFtXo/jKLuuyMP60d0aFqMUmKJIG9Vq895czzD21TWUl2Gz4n+Ty+Hz9aJBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718024001; c=relaxed/simple;
	bh=wcohEeF4gEM8YyrO9XdyR/1RfQ3aZQdKPRPXDmVl77c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ota77rRnBQlmk8ToqU5lvBiznpR3hpjUai4RmC5laZ82gd5dl/K/Z15jG+gJ8RvkcLltxo1pTICytiNgfyjbGzIjlSe1lfIecIoWlOhY3Amm+46pcwpWWpgZsutie95CnnG1LF6YdWj7yq1uQoJ9sufSdRit5sCZEKjtG6e6Qjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Leqc6Kvn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F0F29230;
	Mon, 10 Jun 2024 14:53:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718023986;
	bh=wcohEeF4gEM8YyrO9XdyR/1RfQ3aZQdKPRPXDmVl77c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Leqc6KvnGTAnYiXdta0MPbfSJnlA57wK00SXfNhLjRxiRnyOfNwmqBdTiuLxqqvSc
	 xaVJbOGmKMgXW6ZJc5Q2Kidb/YUCBbimB/Ko0GqAHHq4OUFMPkR6Z84DNwMMjCgfSe
	 8qJqFfvjw5ap9TJ5Nbj884ALBeImc2LBUpx/bC4E=
Date: Mon, 10 Jun 2024 15:52:58 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, "hn.chen" <hn.chen@sunplusit.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH v10 6/6] media: uvcvideo: Fix hw timestamp handling for
 slow FPS
Message-ID: <20240610125258.GS18479@pendragon.ideasonboard.com>
References: <20240323-resend-hwtimestamp-v10-0-b08e590d97c7@chromium.org>
 <20240323-resend-hwtimestamp-v10-6-b08e590d97c7@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240323-resend-hwtimestamp-v10-6-b08e590d97c7@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Sat, Mar 23, 2024 at 10:48:07AM +0000, Ricardo Ribalda wrote:
> In UVC 1.5 we get a single clock value per frame. With the current
> buffer size of 32, FPS slowers than 32 might roll-over twice.
> 
> The current code cannot handle two roll-over and provide invalid
> timestamps.
> 
> Remove all the samples from the circular buffer that are more than two
> rollovers old, so the algorithm always provides good timestamps.
> 
> Note that we are removing values that are more than one second old,
> which means that there is enough distance between the two points that
> we use for the interpolation to provide good values.
> 
> Tested-by: HungNien Chen <hn.chen@sunplusit.com>
> Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_video.c | 24 ++++++++++++++++++++++++
>  drivers/media/usb/uvc/uvcvideo.h  |  1 +
>  2 files changed, 25 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index 5df8f61d39cd1..900b57afac93a 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -471,8 +471,31 @@ static void uvc_video_clock_add_sample(struct uvc_clock *clock,
>  {
>  	unsigned long flags;
>  
> +	/*
> +	 * If we write new data on the position where we had the last
> +	 * overflow, remove the overflow pointer. There is no overflow

s/overflow/SOF overflow/

otherwise it sounds like a circular buffer overflow. Same in the other
comments below.

> +	 * on the whole circular buffer.
> +	 */
> +	if (clock->head == clock->last_sof_overflow)
> +		clock->last_sof_overflow = -1;
> +
>  	spin_lock_irqsave(&clock->lock, flags);
>  
> +	/* Handle overflows */

s/overflows/overflows./

> +	if (clock->count > 0 && clock->last_sof > sample->dev_sof) {
> +		/*
> +		 * Remove data from the circular buffer that is older than the
> +		 * last overflow. We only support one overflow per circular
> +		 * buffer.
> +		 */
> +		if (clock->last_sof_overflow != -1) {
> +			clock->count = (clock->head - clock->last_sof_overflow
> +					+ clock->count) % clock->count;

If I'm following you correctly here, you want to set count to the
distance between last_sof_overflow and head. Shouldn't it be

			clock->count = (clock->head - clock->last_sof_overflow
					+ clock->size) % clock->size;

> +		}

No need for curly braces.

> +		clock->last_sof_overflow = clock->head;
> +	}
> +
> +	/* Add sample */

s/sample/sample./

I still think it would be nicer to handle multiple rollovers correctly,
but that probably better handled by moving all the clock handling to
userspace. With the above issues addressed, I think this patch can go
in.

I could address all these issues when applying, but I'd like the count
-> size change to be tested first. You can submit a new version of this
patch only, I've applied the rest of the series to my tree already.

>  	clock->samples[clock->head] = *sample;
>  	clock->head = (clock->head + 1) % clock->size;
>  	clock->count = min(clock->count + 1, clock->size);
> @@ -616,6 +639,7 @@ static void uvc_video_clock_reset(struct uvc_clock *clock)
>  	clock->head = 0;
>  	clock->count = 0;
>  	clock->last_sof = -1;
> +	clock->last_sof_overflow = -1;
>  	clock->sof_offset = -1;
>  }
>  
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index cb9dd50bba8ac..fb9f9771131ac 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -499,6 +499,7 @@ struct uvc_streaming {
>  		unsigned int head;
>  		unsigned int count;
>  		unsigned int size;
> +		unsigned int last_sof_overflow;
>  
>  		u16 last_sof;
>  		u16 sof_offset;

-- 
Regards,

Laurent Pinchart

