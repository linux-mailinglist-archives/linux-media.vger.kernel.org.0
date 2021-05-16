Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4082382107
	for <lists+linux-media@lfdr.de>; Sun, 16 May 2021 22:49:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233648AbhEPUuZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 May 2021 16:50:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229900AbhEPUuZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 May 2021 16:50:25 -0400
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAB9CC061573
        for <linux-media@vger.kernel.org>; Sun, 16 May 2021 13:49:09 -0700 (PDT)
Received: by mail-il1-x12e.google.com with SMTP id h11so4307359ili.9
        for <linux-media@vger.kernel.org>; Sun, 16 May 2021 13:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OJf9iBcCCc/UVdMuPCI5ttnV0t0WRtBJaGyKqbLFHqo=;
        b=bBsGsmJ1vuQWZPiu0Ony95dF/aB3qEOmnFC0ket30HKe6l+t/mGn2uloqpzRI0ipyW
         D3gts1gi6fwRaE25sNIzoOrdQsWkUppaodQpn/+RLRDa/+xda45GLsa2S35sU9wWy33b
         CTB2uP4lyD9sR6t495OGckNjIqV1yNTJ+CVWU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OJf9iBcCCc/UVdMuPCI5ttnV0t0WRtBJaGyKqbLFHqo=;
        b=GdlolKkdPIiWsXkqjOeTwU+hAPmzNAm0DoUn3dNREMHHRVQ0K3gdtXILMHMJwKWqiZ
         i+rKzlb0D1hfdyn1Bsm0x6w5p6YxF2lKaIEjv02/xMz/VCWS4XUzUk+1w1oKnwPHDQHN
         H2GskeYZfkICmUeRSQ53sASCsvCCfR2+b6lxPJ19I2gCxF2cJKrPJqXL3HntCHJGHzga
         WxfNu51AGhfnFO/z5zvW6xauAVYOYO9tv28iX4QMqZgy0G9KabN8S//JffunaxHL/Cp0
         MwUIrq7SPBYVNWEBe10aEYm4/4Ukw3UC8jCw99i/1qhzYty/vbeliSa+ZbZnreFkf8T4
         IY9w==
X-Gm-Message-State: AOAM533eA00trXxe2w7YMIvxm4yiE7xepCmr1Wzo0EYRCtcAG6rNdhJb
        1Pw62q/vM/nvyYG8tisTRYhrZOjZ8UfpKN9ajDmuSw==
X-Google-Smtp-Source: ABdhPJyjRLHANfaJ1uff07Fj0z80VH09TOGbiTPgbBKQ8nNuw1EWmVWAWrAGeimzA3dMisYXcM4CMDUht96lbaZVcFU=
X-Received: by 2002:a92:ad07:: with SMTP id w7mr48266408ilh.98.1621198149232;
 Sun, 16 May 2021 13:49:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210516110902.784-1-euphoriccatface@gmail.com> <20210516110902.784-2-euphoriccatface@gmail.com>
In-Reply-To: <20210516110902.784-2-euphoriccatface@gmail.com>
From:   Matt Ranostay <matt.ranostay@konsulko.com>
Date:   Sun, 16 May 2021 13:48:57 -0700
Message-ID: <CAJCx=gkWjWrM_JOB3HrCb9y7iQH0rEwJSsCj8KWfoJ5i5+pNCQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: video-i2c: append register data on MLX90640's frame
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
>  drivers/media/i2c/video-i2c.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/i2c/video-i2c.c b/drivers/media/i2c/video-i2c.c
> index 2ccb08335..ca3a1c504 100644
> --- a/drivers/media/i2c/video-i2c.c
> +++ b/drivers/media/i2c/video-i2c.c
> @@ -74,7 +74,7 @@ static const struct v4l2_fmtdesc mlx90640_format = {
>
>  static const struct v4l2_frmsize_discrete mlx90640_size = {
>         .width = 32,
> -       .height = 26, /* 24 lines of pixel data + 2 lines of processing data */
> +       .height = 27, /* 24 lines of pixel data + 2 lines of processing data + 1 line of registers */
>  };
>
>  static const struct regmap_config amg88xx_regmap_config = {
> @@ -168,8 +168,11 @@ static int amg88xx_xfer(struct video_i2c_data *data, char *buf)
>
>  static int mlx90640_xfer(struct video_i2c_data *data, char *buf)
>  {
> -       return regmap_bulk_read(data->regmap, 0x400, buf,
> -                               data->chip->buffer_size);
> +       int ret = regmap_bulk_read(data->regmap, 0x400, buf,
> +                                  data->chip->buffer_size - 64);
> +       if (ret) return ret;
> +       return regmap_bulk_read(data->regmap, 0x8000, buf + 1664,
> +                               64);

Rather than "buf + 1664" it would be more portable and clear if you
use "buf + (data->chip->buffer_size - 64)"

Also isn't the 1 line of registers only 32-bytes not 64-bytes?

- Matt

>  }
>
>  static int amg88xx_setup(struct video_i2c_data *data)
> @@ -375,7 +378,7 @@ static const struct video_i2c_chip video_i2c_chip[] = {
>                 .format         = &mlx90640_format,
>                 .frame_intervals        = mlx90640_frame_intervals,
>                 .num_frame_intervals    = ARRAY_SIZE(mlx90640_frame_intervals),
> -               .buffer_size    = 1664,
> +               .buffer_size    = 1728,
>                 .bpp            = 16,
>                 .regmap_config  = &mlx90640_regmap_config,
>                 .nvmem_config   = &mlx90640_nvram_config,
> --
> 2.31.1
>
