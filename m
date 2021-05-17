Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F7EA382291
	for <lists+linux-media@lfdr.de>; Mon, 17 May 2021 03:40:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233046AbhEQBl2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 May 2021 21:41:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232764AbhEQBl2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 May 2021 21:41:28 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F11AC061573
        for <linux-media@vger.kernel.org>; Sun, 16 May 2021 18:40:11 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id k19so3885232pfu.5
        for <linux-media@vger.kernel.org>; Sun, 16 May 2021 18:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jJ1lxrVRk43oQoSv5pH/hCRF8IHSbXlnNDgT6vu3FIM=;
        b=cHinX+3/FqgKHijTvEd4jSR7jybarpkFCi59VlE/51gIs0mfmDPU/QW6lq+1rC8Xsq
         Mb/s0vm8fMoXz1EN9VYS8XvhFMZCHgpGxUOKh3S92KHWWpYKdFdTI+rWkkwHFpACLETZ
         D3cevLHzsOYAJWl08vgqNMKD6ttBdPUmezt+qqy6aQWEU613X2wG5l7n5dRXDXciLBNj
         NJd3V6vg/YjLhIxP4cpp9ARoCKee3FPC+8f+Ok0K4BvJAyUJ2Y5/+FEPPEGs+tubajLb
         4udxR68ivZ+SwCSFDngvlzaNgmxafoZiFt7rjMvE+1y5SrLmQ+1/mv7idYw85Zimsr2R
         OjYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jJ1lxrVRk43oQoSv5pH/hCRF8IHSbXlnNDgT6vu3FIM=;
        b=BPtyBsQSyqlmpXgk6tXaHgjxD+Y3ohUTrMRHDs3kX0bKUr4rS5YTFJIe+rJ2I6rYVt
         stshyk5Be2Uih61u6tn/vp+rDFLAxzsHL0gmWJb2scg601af/UYId4QpPh1hhO4rQpxr
         Yn9o/SVudC6nSyW64fEXkaX6zuytxf878xTtt3VkMEfhDs7KToojXipWsICh8w1XgL/8
         6pj337ptqgZcuTIBJr3fHQcueRrezbGAOmGC8A3muB3O8IC7FbL6Cxyucd3oHQ7yNlU7
         uKivPSYa0bI5BE3lIKIy0mqxp3kr+QTsoFjKuYH0+6mk810KQxt/0lRQO83UCTuXU9bd
         +47g==
X-Gm-Message-State: AOAM530eFDTgyBlOms+y4RZuScrHk5zh8ONKQE1EErLcRE5bOokLgRpb
        aaFcNenfs/ymqT/qh0SXJ19s9pkRHja4ExvZfJJLRiFl73+XMdE1
X-Google-Smtp-Source: ABdhPJyiJ892a5dAfrbrRL2xd/14JbNUBKut5lCJ7vWJSC5NVGgOMDr4uVbvJKddLYE7azKdgED3GJATjdUCH3jhF48=
X-Received: by 2002:a63:707:: with SMTP id 7mr59942536pgh.441.1621215610910;
 Sun, 16 May 2021 18:40:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210516110902.784-1-euphoriccatface@gmail.com>
 <20210516110902.784-2-euphoriccatface@gmail.com> <CAJCx=gkWjWrM_JOB3HrCb9y7iQH0rEwJSsCj8KWfoJ5i5+pNCQ@mail.gmail.com>
In-Reply-To: <CAJCx=gkWjWrM_JOB3HrCb9y7iQH0rEwJSsCj8KWfoJ5i5+pNCQ@mail.gmail.com>
From:   Seongyong Park <euphoriccatface@gmail.com>
Date:   Mon, 17 May 2021 10:39:57 +0900
Message-ID: <CAJp=mWTq86O_OTXo4yvnKgUw6P_M1hAAqqR7HJdBGkzSZpt4qw@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: video-i2c: append register data on MLX90640's frame
To:     Matt Ranostay <matt.ranostay@konsulko.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

2021=EB=85=84 5=EC=9B=94 17=EC=9D=BC (=EC=9B=94) =EC=98=A4=EC=A0=84 5:49, M=
att Ranostay <matt.ranostay@konsulko.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=
=B1:
>
> On Sun, May 16, 2021 at 4:09 AM Seongyong Park
> <euphoriccatface@gmail.com> wrote:
> >
> > On MLX90640, Each measurement step updates half of the pixels in the fr=
ame
> > (every other pixel in default "chess mode", and every other row
> > in "interleave mode"), while additional coefficient data (25th & 26th r=
ow)
> > updates every step. The compensational coefficient data only correspond=
s
> > with the pixels updated in the same step.
> >
> > Only way to know which "subpage" was updated on the last step is to rea=
d
> > "status register" on address 0x8000. Without this data,
> > compensation calculation may be able to detect which sets of pixels hav=
e
> > been updated, but it will have to make assumptions when frame skip happ=
ens,
> > and there is no way to do it correctly when the host simply cannot
> > keep up with refresh rate.
> >
> > Signed-off-by: Seongyong Park <euphoriccatface@gmail.com>
> > ---
> >  drivers/media/i2c/video-i2c.c | 11 +++++++----
> >  1 file changed, 7 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/media/i2c/video-i2c.c b/drivers/media/i2c/video-i2=
c.c
> > index 2ccb08335..ca3a1c504 100644
> > --- a/drivers/media/i2c/video-i2c.c
> > +++ b/drivers/media/i2c/video-i2c.c
> > @@ -74,7 +74,7 @@ static const struct v4l2_fmtdesc mlx90640_format =3D =
{
> >
> >  static const struct v4l2_frmsize_discrete mlx90640_size =3D {
> >         .width =3D 32,
> > -       .height =3D 26, /* 24 lines of pixel data + 2 lines of processi=
ng data */
> > +       .height =3D 27, /* 24 lines of pixel data + 2 lines of processi=
ng data + 1 line of registers */
> >  };
> >
> >  static const struct regmap_config amg88xx_regmap_config =3D {
> > @@ -168,8 +168,11 @@ static int amg88xx_xfer(struct video_i2c_data *dat=
a, char *buf)
> >
> >  static int mlx90640_xfer(struct video_i2c_data *data, char *buf)
> >  {
> > -       return regmap_bulk_read(data->regmap, 0x400, buf,
> > -                               data->chip->buffer_size);
> > +       int ret =3D regmap_bulk_read(data->regmap, 0x400, buf,
> > +                                  data->chip->buffer_size - 64);
> > +       if (ret) return ret;
> > +       return regmap_bulk_read(data->regmap, 0x8000, buf + 1664,
> > +                               64);
>
> Rather than "buf + 1664" it would be more portable and clear if you
> use "buf + (data->chip->buffer_size - 64)"

Okay, I'll send another patch later to change it.

> Also isn't the 1 line of registers only 32-bytes not 64-bytes?

In terms of the V4L2 frame, a row is 64-bytes because width is 32 and
each pixel is 16-bit.
This was the main reason to decide the appendage to be 64-bytes.

For MLX90640, the address 0x8010 is mentioned in the datasheet, and
actual output appears that up to 0x8013 is valid
For reference, an output from my sensor shows:
0x8000: 0900 a200 9f69 0000 6120 0500 2003 e003 2817 4f8e 8701 8d04
0000 8119 0000 0000
0x8010: 33be 8000 4d02 0000 ffff ffff ffff ffff ffff ffff ffff ffff
ffff ffff ffff ffff

- Seongyong

>
> - Matt
>
> >  }
> >
> >  static int amg88xx_setup(struct video_i2c_data *data)
> > @@ -375,7 +378,7 @@ static const struct video_i2c_chip video_i2c_chip[]=
 =3D {
> >                 .format         =3D &mlx90640_format,
> >                 .frame_intervals        =3D mlx90640_frame_intervals,
> >                 .num_frame_intervals    =3D ARRAY_SIZE(mlx90640_frame_i=
ntervals),
> > -               .buffer_size    =3D 1664,
> > +               .buffer_size    =3D 1728,
> >                 .bpp            =3D 16,
> >                 .regmap_config  =3D &mlx90640_regmap_config,
> >                 .nvmem_config   =3D &mlx90640_nvram_config,
> > --
> > 2.31.1
> >
