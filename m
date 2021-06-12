Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A5443A4D48
	for <lists+linux-media@lfdr.de>; Sat, 12 Jun 2021 09:10:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230370AbhFLHMQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Jun 2021 03:12:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230028AbhFLHMQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Jun 2021 03:12:16 -0400
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4E9AC061574
        for <linux-media@vger.kernel.org>; Sat, 12 Jun 2021 00:10:15 -0700 (PDT)
Received: by mail-il1-x132.google.com with SMTP id i17so7246159ilj.11
        for <linux-media@vger.kernel.org>; Sat, 12 Jun 2021 00:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2r88LMJZr7tIQEKfbOMwWJK+eANRkD15tgCK2MYTKEw=;
        b=IRMnqHkJGQy/FaoEHfyzA/wvoyGqe0su9QVczLxGbuqRSRF/GxZ+ulZ9BbxXbhyIjW
         bVTQJOh1S3yq+wq4AEi3+fRHkru/2u7ZndpUo8e8wxPVkNgAaN6h5SzK32V1ew7NRFD2
         b5udT3upOo2lPFXY0VASjQCxnl+2dqJPGPBl4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2r88LMJZr7tIQEKfbOMwWJK+eANRkD15tgCK2MYTKEw=;
        b=n9tG6NB3JkVzGIREWBmj5ppbBul0sKwiRj1RMCxZwrTLYt6O9pH7es9kkCz+KbERsf
         awIaVepq+3ZcfO35J9XhJMhKB1PPkeur0DMw6a52L+SNH84aY+JupY0i1stVKABVSCls
         aPOc5K+CBr29CjtL3TIjagZ7eP8FVn1shHz+cyopC+OlENTJvG/OAv6bmh4hXAXLj1ES
         Gh+y9L9mLWlKRn/CJnQSBxgdkLLP7/PiNrHpThrfBg5bdV3yAGlrttxvHeKQtmy861dx
         dMiN88SqWfJW0zkXl5DCupx6LF/C9UOev0bRR6rrucySPerdnAx2l3rpmSkSDsIsDoz8
         jY+Q==
X-Gm-Message-State: AOAM531aULL0YGexcBa8kXg5sJJV9AbS3hL3acrO2NDWgYFk4E1zQXb2
        c+MTjycAhByOQwO55ZfJ4ry2y+EfROZ2tB23d/9aiGr3B1ikLQ==
X-Google-Smtp-Source: ABdhPJyht3SDduifUXGzWBD9Pg6RGNWPy2R2RKc1gOByk83C3OUY6x00liN15I6NTmMulAjZMpeDUkkdT70bQ5v8vR8=
X-Received: by 2002:a05:6e02:d51:: with SMTP id h17mr6140809ilj.177.1623481815211;
 Sat, 12 Jun 2021 00:10:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210608152451.14730-1-euphoriccatface@gmail.com>
 <20210608152451.14730-3-euphoriccatface@gmail.com> <CAJCx=g=hngBOv-6ov1_0YQ0qRC+fTngfNHopcmpHmF5ToAEVaw@mail.gmail.com>
 <CAJp=mWQ_SKw7NAnnMjaS2rp5s1ShHV5cFKX_ecVY6cKMw3ZMsA@mail.gmail.com>
In-Reply-To: <CAJp=mWQ_SKw7NAnnMjaS2rp5s1ShHV5cFKX_ecVY6cKMw3ZMsA@mail.gmail.com>
From:   Matt Ranostay <matt.ranostay@konsulko.com>
Date:   Sat, 12 Jun 2021 00:10:04 -0700
Message-ID: <CAJCx=g=8mYoeSdK3v9jG7-JPDNLfdvDp20GGApJUzixeaDr4rA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] media: video-i2c: append register data on
 MLX90640's frame
To:     Seongyong Park <euphoriccatface@gmail.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jun 11, 2021 at 10:55 PM Seongyong Park
<euphoriccatface@gmail.com> wrote:
>
> 2021=EB=85=84 6=EC=9B=94 10=EC=9D=BC (=EB=AA=A9) =EC=98=A4=EC=A0=84 8:13,=
 Seongyong Park <euphoriccatface@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
> >
> > 2021=EB=85=84 6=EC=9B=94 9=EC=9D=BC (=EC=88=98) =EC=98=A4=ED=9B=84 4:14=
, Matt Ranostay <matt.ranostay@konsulko.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
> > >
> > > On Tue, Jun 8, 2021 at 8:25 AM Seongyong Park <euphoriccatface@gmail.=
com> wrote:
> > >
> > > > -       .height =3D 26, /* 24 lines of pixel data + 2 lines of proc=
essing data */
> > > > +       .height =3D 27,
> > > > +       /* 24 lines of pixel data + 2 lines of processing data + 1 =
line of registers */
> > >
> > > Guess you hit the 80 character line here and checkpatch.pl complained
> > > .. But should all be one line since it is
> > > much more clear on one line.
> > >
> > > >  };
> > > >
> > > >  static const struct regmap_config amg88xx_regmap_config =3D {
> > > > @@ -168,8 +169,12 @@ static int amg88xx_xfer(struct video_i2c_data =
*data, char *buf)
> > > >
> > > >  static int mlx90640_xfer(struct video_i2c_data *data, char *buf)
> > > >  {
> > > > -       return regmap_bulk_read(data->regmap, 0x400, buf,
> > > > -                               data->chip->buffer_size);
> > > > +       int ret =3D regmap_bulk_read(data->regmap, 0x400, buf,
> > > > +                                  data->chip->buffer_size - 64);
> > > > +       if (ret)
> > > > +               return ret;
> > > > +       return regmap_bulk_read(data->regmap, 0x8000, buf + (data->=
chip->buffer_size - 64),
> > > > +                               64);
> > > >  }
> > > >
> > > >  static int amg88xx_setup(struct video_i2c_data *data)
> > > > @@ -375,7 +380,7 @@ static const struct video_i2c_chip video_i2c_ch=
ip[] =3D {
> > > >                 .format         =3D &mlx90640_format,
> > > >                 .frame_intervals        =3D mlx90640_frame_interval=
s,
> > > >                 .num_frame_intervals    =3D ARRAY_SIZE(mlx90640_fra=
me_intervals),
> > > > -               .buffer_size    =3D 1664,
> > > > +               .buffer_size    =3D 1728,
> > >
> > > Minus nitpick above looks good to me. You can keep the acked-by if
> > > that is only change
> > >
> > > Acked-by: Matt Ranostay <matt.ranostay@konsulko.com>
> > >
> > Yes, other than your suggestion, indeed that is the only change I made
> > for this commit between v1 and v2 (and v3 is the same as v2.)
> > and that is because of the checkpatch.pl indeed :)
> >
> > Thanks,
> > Seongyong Park
>
> Re-sending this mail mainly because I have made a direct reply, rather
> than a reply to all.
> Sorry about that.
>
> Matt, while we're at it, if I happen to make another revision of this pat=
chset,
> would you find it looking okay to make a line break after the second para=
meter?
> The odd arrangement was partly because I wanted to make a line break
> after the same number of parameters.
>
> The lines will look like this:
> +       int ret =3D regmap_bulk_read(data->regmap, 0x400,
> +                                  buf, data->chip->buffer_size - 64);
> ...
> +       return regmap_bulk_read(data->regmap, 0x8000,
> +                               buf + (data->chip->buffer_size - 64), 64)=
;
>

Yeah this is fine by me. Keep the signed off if this is the  only change.

- Matt

> Thanks,
> - Seongyong Park
