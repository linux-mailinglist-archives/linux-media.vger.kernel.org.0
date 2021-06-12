Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C15543A4D0B
	for <lists+linux-media@lfdr.de>; Sat, 12 Jun 2021 07:56:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230229AbhFLF6N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Jun 2021 01:58:13 -0400
Received: from mail-pl1-f174.google.com ([209.85.214.174]:41830 "EHLO
        mail-pl1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229584AbhFLF6N (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Jun 2021 01:58:13 -0400
Received: by mail-pl1-f174.google.com with SMTP id e1so3871110plh.8
        for <linux-media@vger.kernel.org>; Fri, 11 Jun 2021 22:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9jybcfFDEdpRthSLMeSeZzQdNsMH66S38QGWUxKsozY=;
        b=aUfXDGneQ2wFsTuuQ/1cY4IFtJWP4roJqlsBUnSR+qYOo0vBXFg0obViJsCKa8mFoF
         YxeP6wpH6hxH0yfIdu2CY7ELzGOHjvPoGQTFTBGUfx6JybtWdPr2ALK5AKdLEi39Lusw
         CEEoOELATA2dsAY1hSk+xjSaYWKY5fiDDrATqh4rFQAJkFZEM7Gqxhc8J41FM6aiLh6p
         Z/wiOH3l9IximpSVUjhsQNi4/K6SA/WSLpF2bNipkbrTlUE4FUN2YPjEDadXVAiHiC43
         qWqy4YksqN1mU116+wdjQwVylU89h6aKRJMqhtQtUJyC0M5b9USg6AFAjJFQC1e/uldk
         GduQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9jybcfFDEdpRthSLMeSeZzQdNsMH66S38QGWUxKsozY=;
        b=JNelCQDg9QPp+3HarEc90yEtMFfcx60q8Ay0EZ+oyoX4sqOhrPkeBwsPJeW1ivgnj0
         UohiMduFMj2fx0umwrS2idlZqan/NwBdCOwf3P194yPjSahcyZM3ymmVczDU8CQ0GvZq
         kw/rgMT9GV9ES0Bgr//t+HQUwsmpFD6AOUin1ltaXrFqUWY278QNHjWhkb8PNLcFBABm
         YoJIZBoYNvH+QkscpHvO+eezJHMJwOQ9N2mCaboRCkzMA2XV2rapnGcnU2RwfI0USKtO
         +OVuuV+Yb9lWOPDVFFMAi5qg0eiLuF0CdS6fBL4D7sVrEy/lbrCMHnndXYzOLTlmdZww
         3OOA==
X-Gm-Message-State: AOAM533sYnT2r4PLeDfSa90esRTiooXZ9ZbhWGq9yjSaC82QG2PvpIyh
        Ep0tqLphlIXwk+oWlbauJMyuBHvmiQa/Bx02v2M=
X-Google-Smtp-Source: ABdhPJwGJx7VonwKGcNbgYmC6jLyDSQthLdV3DxE7LWf+LJ+tSbL+FXPTHqEEUHVnmyYRkx7xUb9zwAmIBvGNZCjBc0=
X-Received: by 2002:a17:902:b594:b029:f8:fb4f:f8d3 with SMTP id
 a20-20020a170902b594b02900f8fb4ff8d3mr7161242pls.25.1623477314129; Fri, 11
 Jun 2021 22:55:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210608152451.14730-1-euphoriccatface@gmail.com>
 <20210608152451.14730-3-euphoriccatface@gmail.com> <CAJCx=g=hngBOv-6ov1_0YQ0qRC+fTngfNHopcmpHmF5ToAEVaw@mail.gmail.com>
In-Reply-To: <CAJCx=g=hngBOv-6ov1_0YQ0qRC+fTngfNHopcmpHmF5ToAEVaw@mail.gmail.com>
From:   Seongyong Park <euphoriccatface@gmail.com>
Date:   Sat, 12 Jun 2021 14:55:01 +0900
Message-ID: <CAJp=mWQ_SKw7NAnnMjaS2rp5s1ShHV5cFKX_ecVY6cKMw3ZMsA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] media: video-i2c: append register data on
 MLX90640's frame
To:     Matt Ranostay <matt.ranostay@konsulko.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

2021=EB=85=84 6=EC=9B=94 10=EC=9D=BC (=EB=AA=A9) =EC=98=A4=EC=A0=84 8:13, S=
eongyong Park <euphoriccatface@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=
=B1:
>
> 2021=EB=85=84 6=EC=9B=94 9=EC=9D=BC (=EC=88=98) =EC=98=A4=ED=9B=84 4:14, =
Matt Ranostay <matt.ranostay@konsulko.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
> >
> > On Tue, Jun 8, 2021 at 8:25 AM Seongyong Park <euphoriccatface@gmail.co=
m> wrote:
> >
> > > -       .height =3D 26, /* 24 lines of pixel data + 2 lines of proces=
sing data */
> > > +       .height =3D 27,
> > > +       /* 24 lines of pixel data + 2 lines of processing data + 1 li=
ne of registers */
> >
> > Guess you hit the 80 character line here and checkpatch.pl complained
> > .. But should all be one line since it is
> > much more clear on one line.
> >
> > >  };
> > >
> > >  static const struct regmap_config amg88xx_regmap_config =3D {
> > > @@ -168,8 +169,12 @@ static int amg88xx_xfer(struct video_i2c_data *d=
ata, char *buf)
> > >
> > >  static int mlx90640_xfer(struct video_i2c_data *data, char *buf)
> > >  {
> > > -       return regmap_bulk_read(data->regmap, 0x400, buf,
> > > -                               data->chip->buffer_size);
> > > +       int ret =3D regmap_bulk_read(data->regmap, 0x400, buf,
> > > +                                  data->chip->buffer_size - 64);
> > > +       if (ret)
> > > +               return ret;
> > > +       return regmap_bulk_read(data->regmap, 0x8000, buf + (data->ch=
ip->buffer_size - 64),
> > > +                               64);
> > >  }
> > >
> > >  static int amg88xx_setup(struct video_i2c_data *data)
> > > @@ -375,7 +380,7 @@ static const struct video_i2c_chip video_i2c_chip=
[] =3D {
> > >                 .format         =3D &mlx90640_format,
> > >                 .frame_intervals        =3D mlx90640_frame_intervals,
> > >                 .num_frame_intervals    =3D ARRAY_SIZE(mlx90640_frame=
_intervals),
> > > -               .buffer_size    =3D 1664,
> > > +               .buffer_size    =3D 1728,
> >
> > Minus nitpick above looks good to me. You can keep the acked-by if
> > that is only change
> >
> > Acked-by: Matt Ranostay <matt.ranostay@konsulko.com>
> >
> Yes, other than your suggestion, indeed that is the only change I made
> for this commit between v1 and v2 (and v3 is the same as v2.)
> and that is because of the checkpatch.pl indeed :)
>
> Thanks,
> Seongyong Park

Re-sending this mail mainly because I have made a direct reply, rather
than a reply to all.
Sorry about that.

Matt, while we're at it, if I happen to make another revision of this patch=
set,
would you find it looking okay to make a line break after the second parame=
ter?
The odd arrangement was partly because I wanted to make a line break
after the same number of parameters.

The lines will look like this:
+       int ret =3D regmap_bulk_read(data->regmap, 0x400,
+                                  buf, data->chip->buffer_size - 64);
...
+       return regmap_bulk_read(data->regmap, 0x8000,
+                               buf + (data->chip->buffer_size - 64), 64);

Thanks,
- Seongyong Park
