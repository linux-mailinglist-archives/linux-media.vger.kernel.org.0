Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 010A139C8ED
	for <lists+linux-media@lfdr.de>; Sat,  5 Jun 2021 16:00:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229958AbhFEOCW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 5 Jun 2021 10:02:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:40762 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229930AbhFEOCW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 5 Jun 2021 10:02:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CD96B61354;
        Sat,  5 Jun 2021 14:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622901634;
        bh=hxclUIZzpdL+w/09+qsOdmrX2Z93cV8AWpuZ+eHpEC8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=QMJqjbdkdB6mV/GMB9yRBqizuiYmMaXHOW0CPOKDXqI+mpqScS6uLdASA7+g9+PcI
         XBYrL4nNK9Up82F8tf/YHQyLAtn6sK7FchxntwCzvtyUuVltrp6yHQDyI6TU4rIkQm
         1m+Q6tykoagz2EiwQEVwENtnChPc+y0qYMFSo7Xa5Hdzlqfg14U0RSjenSXRVcL5kz
         IImFiZYyE1oJCVJ/Ea2ihZ7ZGbnJW0Qio7bZHfFuBNsCwD/BJy5X6Yh5T/qa54jWma
         epsmZazPA/l4VLdQA5O3ncjajINo0DWi8RaqSSEwIsJKyUpc0hAL6/WxgRJOXTZ8ov
         2Or98LXFWJr+A==
Date:   Sat, 5 Jun 2021 16:00:28 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Seongyong Park <euphoriccatface@gmail.com>
Cc:     linux-media@vger.kernel.org,
        Matt Ranostay <matt.ranostay@konsulko.com>
Subject: Re: [PATCH 1/2] media: video-i2c: frame delay based on last frame's
 end time
Message-ID: <20210605160028.6ec30b8a@coco.lan>
In-Reply-To: <20210605115456.14440-2-euphoriccatface@gmail.com>
References: <20210605115456.14440-1-euphoriccatface@gmail.com>
        <20210605115456.14440-2-euphoriccatface@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sat,  5 Jun 2021 20:54:56 +0900
Seongyong Park <euphoriccatface@gmail.com> escreveu:

> Current implementation calculates frame delay based on the time of
> start of the loop. This inevitably causes the loop delay to be
> slightly longer than the actual measurement period, thus skipping a frame
> every now and then.
> 
> However, MLX90640 should ideally be working without a frame skip.
> Each measurement step updates half of the pixels in the frame
> (every other pixel in default "chess mode", and every other row
> in "interleave mode"), while additional coefficient data (25th & 26th row)
> updates every step. The compensational coefficient data only corresponds
> with the pixels updated in the same step.
> 
> In short, if a frame is skipped, then half of a frame loses correction
> information and becomes garbage data.
> 
> Signed-off-by: Seongyong Park <euphoriccatface@gmail.com>
> ---
>  drivers/media/i2c/video-i2c.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/i2c/video-i2c.c b/drivers/media/i2c/video-i2c.c
> index 0465832a4..2ccb08335 100644
> --- a/drivers/media/i2c/video-i2c.c
> +++ b/drivers/media/i2c/video-i2c.c
> @@ -445,14 +445,16 @@ static int video_i2c_thread_vid_cap(void *priv)
>  	struct video_i2c_data *data = priv;
>  	unsigned int delay = mult_frac(HZ, data->frame_interval.numerator,
>  				       data->frame_interval.denominator);
> +	unsigned long end_jiffies = jiffies;
>  
>  	set_freezable();
>  
>  	do {
> -		unsigned long start_jiffies = jiffies;
>  		struct video_i2c_buffer *vid_cap_buf = NULL;
>  		int schedule_delay;
>  
> +		end_jiffies += delay;
> +
>  		try_to_freeze();
>  
>  		spin_lock(&data->slock);
> @@ -477,10 +479,9 @@ static int video_i2c_thread_vid_cap(void *priv)
>  				VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE);
>  		}
>  
> -		schedule_delay = delay - (jiffies - start_jiffies);
> -
> -		if (time_after(jiffies, start_jiffies + delay))
> -			schedule_delay = delay;

> +		schedule_delay = end_jiffies - jiffies;
> +		while (schedule_delay <= 0)
> +			schedule_delay += delay;

Huh? Why do you need a loop for that? If you want to make it positive,
you could just do:

	if (schedule_delay < 0)
		schedule_delay = delay; /* or something else */

but this won't solve the issue, as this is basically equivalent
to the logic you removed.

>  
>  		schedule_timeout_interruptible(schedule_delay);

This is probably what's causing troubles, as this only ensures
that it will sleep for at least schedule_delay (if not
interrupted).

If you want to give a dead line to schedule, you should
likely be doing, instead:

		usleep_range(delay, delay + delta);

this would tell the realtime clock that there's a dead line of
(schedule_delay + delta) microseconds.

You'll need to change the delay to be in microseconds too,
e. g., I guess that something similar to this:


    static int video_i2c_thread_vid_cap(void *priv)
    {
        struct video_i2c_data *data = priv;
	u64 delay;

	delay = div64_u64(1000000ULL * data->frame_interval.numerator,
			  data->frame_interval.denominator);

	set_freezable();

        do {
...
		usleep_range(delay * 3 / 4, delay);
	} while (!kthread_should_stop());

	return 0;
    }

would give you what you want.

Regards,
Mauro
