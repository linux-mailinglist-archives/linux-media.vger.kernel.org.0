Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72C083A0D6B
	for <lists+linux-media@lfdr.de>; Wed,  9 Jun 2021 09:14:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237151AbhFIHQP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Jun 2021 03:16:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235471AbhFIHQO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Jun 2021 03:16:14 -0400
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6198C061574
        for <linux-media@vger.kernel.org>; Wed,  9 Jun 2021 00:14:10 -0700 (PDT)
Received: by mail-il1-x131.google.com with SMTP id h16so11218032ila.6
        for <linux-media@vger.kernel.org>; Wed, 09 Jun 2021 00:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X3DtYst6A/mBqMOXmXvZKUfqHu7r5s5KvyZbfU1v3sU=;
        b=qI/UbSz9bcifVyvpfiHIGhboZU8MjrqvrmZBjYk/Xl/NYCgnS7XEusjLLFqpaZbtdM
         UXxwUD/qIl/9GKNpFSlLaPuIf+R5OiS9WwhkMi33P78U9PB8WEp4r/rTpwbYJXizTA5k
         GdXIHWNoRpHJlwfeCW4P1rk/+MGT7cZRmjapY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X3DtYst6A/mBqMOXmXvZKUfqHu7r5s5KvyZbfU1v3sU=;
        b=PaeEssGRZic5N4qaWdZzTWxliMUgmgjRAm4CaGhd+YHGK10qOGaD9DdCFxavJSNVVK
         cEAJ7YYX0jTWffnhhVxYmtUOYzJYYtL6STpAQ2ci8sCV3HkdGiaPleYqtGnaPCdgoW24
         KG3ZCSOiK66jj+osrUzW0cgwKro89Kn329ccFI3c79+GjBoGrfwLrg5j1PMehvxDqkNl
         aZsutWDytfbepG+f2Gl4wG1pjdXBKVpVLiX4TRFBH7e61blYFNO5QiN/IpbqtyL2KmB2
         cYV3bB6/3le12oBabfRnMcHmI8ebm98F+skGNaGe08wOT+f0CPuDa/3wpOugFc79Q4V7
         pEvQ==
X-Gm-Message-State: AOAM5334+4GEnjIAeTzwhdf5pHSys7BRy8Zn36EJaKzuOyMyB5dsUwvd
        aaSvCOJrDcUTJeIbz0PoqTE/kyodvYHdJVos+8E7nw==
X-Google-Smtp-Source: ABdhPJyv0vQJfjh5xp+zfLZdJ1/0jw/hfzSIKqDUn5HJ7FHQlwN/BHhoy7ib0qp79vam5jNQvLbltBL+k+w9XkVOVo0=
X-Received: by 2002:a05:6602:2145:: with SMTP id y5mr220349ioy.46.1623222850295;
 Wed, 09 Jun 2021 00:14:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210608152451.14730-1-euphoriccatface@gmail.com> <20210608152451.14730-3-euphoriccatface@gmail.com>
In-Reply-To: <20210608152451.14730-3-euphoriccatface@gmail.com>
From:   Matt Ranostay <matt.ranostay@konsulko.com>
Date:   Wed, 9 Jun 2021 00:13:59 -0700
Message-ID: <CAJCx=g=hngBOv-6ov1_0YQ0qRC+fTngfNHopcmpHmF5ToAEVaw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] media: video-i2c: append register data on
 MLX90640's frame
To:     Seongyong Park <euphoriccatface@gmail.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 8, 2021 at 8:25 AM Seongyong Park <euphoriccatface@gmail.com> wrote:
>
> On MLX90640, Each measurement step updates half of the pixels in the frame
> (every other pixel in default "chess mode", and every other row
> in "interleave mode"), while additional coefficient data (25th & 26th row)
> updates every step. The compensational coefficient data only corresponds
> with the pixels updated in the same step.
>
> Only way to know which "subpage" was updated on the last step is to read
> "status register" on address 0x8000. Without this data,
> compensation calculation may be able to detect which sets of pixels have
> been updated, but it will have to make assumptions when frame skip happens,
> and there is no way to do it correctly when the host simply cannot
> keep up with refresh rate.
>
> Signed-off-by: Seongyong Park <euphoriccatface@gmail.com>
> ---
>  drivers/media/i2c/video-i2c.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/i2c/video-i2c.c b/drivers/media/i2c/video-i2c.c
> index 64ba96329..2b50a76f3 100644
> --- a/drivers/media/i2c/video-i2c.c
> +++ b/drivers/media/i2c/video-i2c.c
> @@ -74,7 +74,8 @@ static const struct v4l2_fmtdesc mlx90640_format = {
>
>  static const struct v4l2_frmsize_discrete mlx90640_size = {
>         .width = 32,
> -       .height = 26, /* 24 lines of pixel data + 2 lines of processing data */
> +       .height = 27,
> +       /* 24 lines of pixel data + 2 lines of processing data + 1 line of registers */

Guess you hit the 80 character line here and checkpatch.pl complained
.. But should all be one line since it is
much more clear on one line.

>  };
>
>  static const struct regmap_config amg88xx_regmap_config = {
> @@ -168,8 +169,12 @@ static int amg88xx_xfer(struct video_i2c_data *data, char *buf)
>
>  static int mlx90640_xfer(struct video_i2c_data *data, char *buf)
>  {
> -       return regmap_bulk_read(data->regmap, 0x400, buf,
> -                               data->chip->buffer_size);
> +       int ret = regmap_bulk_read(data->regmap, 0x400, buf,
> +                                  data->chip->buffer_size - 64);
> +       if (ret)
> +               return ret;
> +       return regmap_bulk_read(data->regmap, 0x8000, buf + (data->chip->buffer_size - 64),
> +                               64);
>  }
>
>  static int amg88xx_setup(struct video_i2c_data *data)
> @@ -375,7 +380,7 @@ static const struct video_i2c_chip video_i2c_chip[] = {
>                 .format         = &mlx90640_format,
>                 .frame_intervals        = mlx90640_frame_intervals,
>                 .num_frame_intervals    = ARRAY_SIZE(mlx90640_frame_intervals),
> -               .buffer_size    = 1664,
> +               .buffer_size    = 1728,

Minus nitpick above looks good to me. You can keep the acked-by if
that is only change

Acked-by: Matt Ranostay <matt.ranostay@konsulko.com>


>                 .bpp            = 16,
>                 .regmap_config  = &mlx90640_regmap_config,
>                 .nvmem_config   = &mlx90640_nvram_config,
> --
> 2.31.1
>
