Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7536C3A0DB1
	for <lists+linux-media@lfdr.de>; Wed,  9 Jun 2021 09:23:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237146AbhFIHZr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Jun 2021 03:25:47 -0400
Received: from mail-il1-f181.google.com ([209.85.166.181]:46072 "EHLO
        mail-il1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235509AbhFIHZq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Jun 2021 03:25:46 -0400
Received: by mail-il1-f181.google.com with SMTP id b5so23930219ilc.12
        for <linux-media@vger.kernel.org>; Wed, 09 Jun 2021 00:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6Ngvcag9Vkb66g617q4tLFqsXkYbFKcbR59RcA1ZZ8Q=;
        b=Q/4aG4dBEnmxEuTQMK5lZ/ng/aatWyaM0TNMKJgpIVEbJwZcviYknzvzQAzPPResDY
         Fp5ggGZA/Oot5zT0lDR8UD4jP1SSqPgHZRo2bUDTH2w/iF7fNsPA1QUJoNPP0BsM7QOF
         uWREUedSrV2de2tWeFNLJZefbfk2CDYAw2+40=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6Ngvcag9Vkb66g617q4tLFqsXkYbFKcbR59RcA1ZZ8Q=;
        b=cgIF2//FSfDdOrr40WMUGhuXbjfDIlsOcgwI7RD3A4I2kWngEhkJ3xmOyZUQRguUuA
         awbbzjAG2Q6ouIt3568+qSbj4SzIv/HKQVlPAbNmBY6wgj8y6glQD+0GlZGyfu7ADzmy
         yD6LUHXd9WZpq/jdG/9g7HwMO4Ki6XoYgkjnM7Gmee/6IvT+P/ch1vMKOTe50l23E8G8
         7HAwyyoZBC9FbhUhXyCbo/7PjFnLc/IVju6tp9HneTKPnriW3LU2+aPCFmeVDQp+LT+a
         Aa85zDbTclGXWKA2QSd3pz8I7QIY8anaI+CtFbYnUKkONKjCfbpfBW7D9Bz2aOV6Q6od
         dLvQ==
X-Gm-Message-State: AOAM5300t+GT9tL2oqJVlYhLzqjkocu1Dc/HJ0SdanSCjFd3ZSYnp8wn
        7HhhMN2hxvjWAeNxvPAf9gzU7d6FWlVzmyXhJeLDJA==
X-Google-Smtp-Source: ABdhPJxEfQ1Izyo+nWKdo7TkGTZKcClIQ40KHFZu1tXvHriFMYJx20rTXV/S7mt2i8yVl5VGSMSmZOT9AHI3rdMJp1M=
X-Received: by 2002:a05:6602:2145:: with SMTP id y5mr242488ioy.46.1623223372781;
 Wed, 09 Jun 2021 00:22:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210608152451.14730-1-euphoriccatface@gmail.com> <20210608152451.14730-2-euphoriccatface@gmail.com>
In-Reply-To: <20210608152451.14730-2-euphoriccatface@gmail.com>
From:   Matt Ranostay <matt.ranostay@konsulko.com>
Date:   Wed, 9 Jun 2021 00:22:41 -0700
Message-ID: <CAJCx=gm6eX9+AqvJZj2vqjBXKMu=ssXnmS-r3RXtT9uMbmm+cg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] media: video-i2c: more precise intervals between frames
To:     Seongyong Park <euphoriccatface@gmail.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 8, 2021 at 8:25 AM Seongyong Park <euphoriccatface@gmail.com> wrote:
>
> MLX90640 should ideally be working without a frame skip.
> In short, if a frame is skipped, then half of a frame loses correction
> information, having no way to retrieve its original compensation.
>
> This patch improves the timing in three ways:
>
> 1) Replaced schedule_timeout_interruptible() to usleep_range()
> The former "only ensures that it will sleep for at least
> schedule_delay (if not interrupted)", as pointed out by mchehab.
> As a result, the frame rate could lag behind than the actual capability
> of the hardware
> (Raspberry Pi would show a few Hz slower than set value)
>
> 2) Calculation based on us, not jiffies
> Jiffies usually has resolution of 100Hz, and possibly even cruder.
> MLX90640 can go up to 64Hz frame rate, which does not make sense to
> calculate the interval with aforementioned resolution.
>
> 3) Interval calculation based on the last frame's end time
> Using the start time of the current frame will probably make tiny bit
> of drift every time. This made more sense when I didn't realize 1),
> but it still makes sense without adding virtually any complexity,
> so this stays in.
>
> Signed-off-by: Seongyong Park <euphoriccatface@gmail.com>
> ---
>  drivers/media/i2c/video-i2c.c | 21 ++++++++++++---------
>  1 file changed, 12 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/media/i2c/video-i2c.c b/drivers/media/i2c/video-i2c.c
> index 0465832a4..64ba96329 100644
> --- a/drivers/media/i2c/video-i2c.c
> +++ b/drivers/media/i2c/video-i2c.c
> @@ -443,14 +443,15 @@ static void buffer_queue(struct vb2_buffer *vb)
>  static int video_i2c_thread_vid_cap(void *priv)
>  {
>         struct video_i2c_data *data = priv;
> -       unsigned int delay = mult_frac(HZ, data->frame_interval.numerator,
> -                                      data->frame_interval.denominator);
> +       u32 delay = mult_frac(1000000UL, data->frame_interval.numerator,
> +                              data->frame_interval.denominator);
> +       s64 end_us = ktime_to_us(ktime_get());
>
>         set_freezable();
>
>         do {
> -               unsigned long start_jiffies = jiffies;
>                 struct video_i2c_buffer *vid_cap_buf = NULL;
> +               s64 current_us;
>                 int schedule_delay;
>
>                 try_to_freeze();
> @@ -477,12 +478,14 @@ static int video_i2c_thread_vid_cap(void *priv)
>                                 VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE);
>                 }
>
> -               schedule_delay = delay - (jiffies - start_jiffies);
> -
> -               if (time_after(jiffies, start_jiffies + delay))
> -                       schedule_delay = delay;
> -
> -               schedule_timeout_interruptible(schedule_delay);
> +               end_us += delay;
> +               current_us = ktime_to_us(ktime_get());
> +               if (current_us < end_us) {
> +                       schedule_delay = end_us - current_us;
> +                       usleep_range(schedule_delay * 3/4, schedule_delay);

Looks fine to me.. not sure I like the 3/4 but the only way to do it
without a floating point of 0.75 which
is evil and would kick off a compiler warning anyway.

Acked-by: Matt Ranostay <matt.ranostay@konsulko.com>

> +               } else {
> +                       end_us = current_us;
> +               }
>         } while (!kthread_should_stop());
>
>         return 0;
> --
> 2.31.1
>
