Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5C4D3820D2
	for <lists+linux-media@lfdr.de>; Sun, 16 May 2021 22:13:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232844AbhEPUOz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 May 2021 16:14:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231145AbhEPUOz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 May 2021 16:14:55 -0400
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31D70C061573
        for <linux-media@vger.kernel.org>; Sun, 16 May 2021 13:13:39 -0700 (PDT)
Received: by mail-il1-x136.google.com with SMTP id c16so4318258ilo.1
        for <linux-media@vger.kernel.org>; Sun, 16 May 2021 13:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2+Hk/aMu9z2tjSt8cT64FJp5MCQ/GofROgiMOyYZu/s=;
        b=d4xi5smHsFDzCJCEyNPSw+vwDwfAeZ8K3su/BiIOccawRwBzYPVySEUrTbuj1xGOaR
         eiOXEq+hh6hmsu/U/0PHDln43hXFKgNVLlx9yWTzfKSmSat4+Oa/hfLHd0JBNMfqdp0l
         6wNRvlU/nxY+rRsnzt/Lrckh6ogkVJ/qX/vkQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2+Hk/aMu9z2tjSt8cT64FJp5MCQ/GofROgiMOyYZu/s=;
        b=P5mD6UkhwWICKFCIOQpPzVpfUI3hsTADwygRt/cLKOasyj9qeOvVuA/MYE85Mxyc+m
         Kikg2lNcO8p8UdNzz+Rs35ewsUs9YS7ep7ocijz8hQ6sqN4ogKI6NRVm7XrNJlocpgAr
         0AATlWCcLMxVeWiQM6NjtPW4XoRl2RWDvKWZfnZhRRhSviWVPF6KthGmj3DfP+g/pV0Y
         WB5yBUBH/FeQltfcz9jRJId39Rbo7NSbmJmu6DF0HWMowKSuoeud95gZf1DMC2EfXlfA
         eVOOMl3iB5oG65mYQGU3x1lQ6ilC7MaDfaiX/AcdcBEtMsWaD33PjXbTItQOmYZie0gH
         vcZQ==
X-Gm-Message-State: AOAM533SysTm79CE1a0umfSHXFZJJgo7Sa+iyT+NJyCHZz6mzBnMQw7d
        ELwluFkI4K2o4kSL7eqIjnv/n/ou4SPnGAfs34dgDw==
X-Google-Smtp-Source: ABdhPJw/4mNTSmLTGhcV2HLCQJcapFcs3+RVX/RxH6jTwbwNBE+3MhMKRUXmZZylSF7u/ucwtzs9rbzC03Gvdc/R+K8=
X-Received: by 2002:a05:6e02:eac:: with SMTP id u12mr50575722ilj.177.1621196019343;
 Sun, 16 May 2021 13:13:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210516110902.784-1-euphoriccatface@gmail.com>
In-Reply-To: <20210516110902.784-1-euphoriccatface@gmail.com>
From:   Matt Ranostay <matt.ranostay@konsulko.com>
Date:   Sun, 16 May 2021 13:13:28 -0700
Message-ID: <CAJCx=gkKBSubNJfQsz7uXmYQ3TrsXrZ43wB4e5V1L+EWzbb_kg@mail.gmail.com>
Subject: Re: [PATCH 1/2] media: video-i2c: frame delay based on last frame's
 end time
To:     Seongyong Park <euphoriccatface@gmail.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, May 16, 2021 at 4:09 AM Seongyong Park
<euphoriccatface@gmail.com> wrote:
>
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

This changeset makes sense to me. Guess I got lucky with the timing on my board.

Reviewed-by: Matt Ranostay <matt.ranostay@konsulko.com>

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
>         struct video_i2c_data *data = priv;
>         unsigned int delay = mult_frac(HZ, data->frame_interval.numerator,
>                                        data->frame_interval.denominator);
> +       unsigned long end_jiffies = jiffies;
>
>         set_freezable();
>
>         do {
> -               unsigned long start_jiffies = jiffies;
>                 struct video_i2c_buffer *vid_cap_buf = NULL;
>                 int schedule_delay;
>
> +               end_jiffies += delay;
> +
>                 try_to_freeze();
>
>                 spin_lock(&data->slock);
> @@ -477,10 +479,9 @@ static int video_i2c_thread_vid_cap(void *priv)
>                                 VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE);
>                 }
>
> -               schedule_delay = delay - (jiffies - start_jiffies);
> -
> -               if (time_after(jiffies, start_jiffies + delay))
> -                       schedule_delay = delay;
> +               schedule_delay = end_jiffies - jiffies;
> +               while (schedule_delay <= 0)
> +                       schedule_delay += delay;
>
>                 schedule_timeout_interruptible(schedule_delay);
>         } while (!kthread_should_stop());
> --
> 2.31.1
>
