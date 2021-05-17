Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8A81386DD1
	for <lists+linux-media@lfdr.de>; Tue, 18 May 2021 01:40:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344540AbhEQXmF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 May 2021 19:42:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239228AbhEQXmB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 May 2021 19:42:01 -0400
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9FC5C061573
        for <linux-media@vger.kernel.org>; Mon, 17 May 2021 16:40:44 -0700 (PDT)
Received: by mail-io1-xd30.google.com with SMTP id z24so7582394ioi.3
        for <linux-media@vger.kernel.org>; Mon, 17 May 2021 16:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=LJhqXDNgAunfF3EaEdEZ2ukbveO+y6tByxrDaKVfys4=;
        b=Ba2T0Aqf/W0NuiwmMe5p93ARPYqEGCFdc1+9a+RPd7Q6D0h9kt5oHX71YiCpQhuyW8
         zGcVoYJSennOwwLxIXVxz+c5GS5es+V1MV/3fQHGtK09GunF6iaAGeRIwwG/cv1zfSBn
         rsVCOr6iPvrviaXtY22ZG1Vue82UdKRs3aUiA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LJhqXDNgAunfF3EaEdEZ2ukbveO+y6tByxrDaKVfys4=;
        b=XcQ1XjLxrIXr8ECTVZu6sqD87U6/2o0LiL2sgWLWzrpYXjyOVM3TByNpKVBvyCHkNy
         B6hjSEaRL9hFC4B3gO/ZZpg0KtumnRYedEGW+wueiABl7oQ0kPP+1VNlZMMZazoePHBZ
         X3+Ggl2XQSUu+Z10e037Nh7EHfXjict953aelvR0CCyuwFjzs/sqfIiSECCRTJ8irBvk
         MbFS83R/hEGVL+hb0GGtaxZLTzBpWfJLYSFuaKbCwGY+OmEwulT2Yf6d7xALoelXEzvD
         S6nN91UfRm/8F6Ky9v7TtvZi8+2HBRE+CpepC2y01MdrPpaA7bbb/njyVFKmhbB0KNXK
         pjPg==
X-Gm-Message-State: AOAM530LdCjB4RwWzCYtA8jhp24l2eI1kMmGFyBCi29UAz44BJUznCly
        /obQ3eGFgCEWmJKiygua0BzeX+qjyl1D9o3+xzwBnMuUnPQZgQ==
X-Google-Smtp-Source: ABdhPJxaTG3gsAyJnUa535o5SoT0wzb1AYOmCE/NP1GUqGEGrOMUtLMiaZ07gOO0MSKoR81bU6eKBQVjSvjuckYh29c=
X-Received: by 2002:a5e:a619:: with SMTP id q25mr1942118ioi.95.1621294844187;
 Mon, 17 May 2021 16:40:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210516110902.784-1-euphoriccatface@gmail.com>
 <20210516110902.784-2-euphoriccatface@gmail.com> <CAJCx=gkWjWrM_JOB3HrCb9y7iQH0rEwJSsCj8KWfoJ5i5+pNCQ@mail.gmail.com>
 <CAJp=mWTq86O_OTXo4yvnKgUw6P_M1hAAqqR7HJdBGkzSZpt4qw@mail.gmail.com>
In-Reply-To: <CAJp=mWTq86O_OTXo4yvnKgUw6P_M1hAAqqR7HJdBGkzSZpt4qw@mail.gmail.com>
From:   Matt Ranostay <matt.ranostay@konsulko.com>
Date:   Mon, 17 May 2021 16:40:32 -0700
Message-ID: <CAJCx=gnZ-4Dyk+f3fzH0-9X-of1r7Q9TSXs1Jk+8cHAiR8+Ueg@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: video-i2c: append register data on MLX90640's frame
To:     Seongyong Park <euphoriccatface@gmail.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, May 16, 2021 at 6:40 PM Seongyong Park
<euphoriccatface@gmail.com> wrote:
>
> 2021=EB=85=84 5=EC=9B=94 17=EC=9D=BC (=EC=9B=94) =EC=98=A4=EC=A0=84 5:49,=
 Matt Ranostay <matt.ranostay@konsulko.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
> >
> > On Sun, May 16, 2021 at 4:09 AM Seongyong Park
> > <euphoriccatface@gmail.com> wrote:
> > >
> > > On MLX90640, Each measurement step updates half of the pixels in the =
frame
> > > (every other pixel in default "chess mode", and every other row
> > > in "interleave mode"), while additional coefficient data (25th & 26th=
 row)
> > > updates every step. The compensational coefficient data only correspo=
nds
> > > with the pixels updated in the same step.
> > >
> > > Only way to know which "subpage" was updated on the last step is to r=
ead
> > > "status register" on address 0x8000. Without this data,
> > > compensation calculation may be able to detect which sets of pixels h=
ave
> > > been updated, but it will have to make assumptions when frame skip ha=
ppens,
> > > and there is no way to do it correctly when the host simply cannot
> > > keep up with refresh rate.
> > >
> > > Signed-off-by: Seongyong Park <euphoriccatface@gmail.com>
> > > ---
> > >  drivers/media/i2c/video-i2c.c | 11 +++++++----
> > >  1 file changed, 7 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/video-i2c.c b/drivers/media/i2c/video-=
i2c.c
> > > index 2ccb08335..ca3a1c504 100644
> > > --- a/drivers/media/i2c/video-i2c.c
> > > +++ b/drivers/media/i2c/video-i2c.c
> > > @@ -74,7 +74,7 @@ static const struct v4l2_fmtdesc mlx90640_format =
=3D {
> > >
> > >  static const struct v4l2_frmsize_discrete mlx90640_size =3D {
> > >         .width =3D 32,
> > > -       .height =3D 26, /* 24 lines of pixel data + 2 lines of proces=
sing data */
> > > +       .height =3D 27, /* 24 lines of pixel data + 2 lines of proces=
sing data + 1 line of registers */
> > >  };
> > >
> > >  static const struct regmap_config amg88xx_regmap_config =3D {
> > > @@ -168,8 +168,11 @@ static int amg88xx_xfer(struct video_i2c_data *d=
ata, char *buf)
> > >
> > >  static int mlx90640_xfer(struct video_i2c_data *data, char *buf)
> > >  {
> > > -       return regmap_bulk_read(data->regmap, 0x400, buf,
> > > -                               data->chip->buffer_size);
> > > +       int ret =3D regmap_bulk_read(data->regmap, 0x400, buf,
> > > +                                  data->chip->buffer_size - 64);
> > > +       if (ret) return ret;
> > > +       return regmap_bulk_read(data->regmap, 0x8000, buf + 1664,
> > > +                               64);
> >
> > Rather than "buf + 1664" it would be more portable and clear if you
> > use "buf + (data->chip->buffer_size - 64)"
>
> Okay, I'll send another patch later to change it.
>
> > Also isn't the 1 line of registers only 32-bytes not 64-bytes?
>
> In terms of the V4L2 frame, a row is 64-bytes because width is 32 and
> each pixel is 16-bit.
> This was the main reason to decide the appendage to be 64-bytes.
>

Ok, forgot this sensor has 12-bit data padded to 16-bits.

- Matt

> For MLX90640, the address 0x8010 is mentioned in the datasheet, and
> actual output appears that up to 0x8013 is valid
> For reference, an output from my sensor shows:
> 0x8000: 0900 a200 9f69 0000 6120 0500 2003 e003 2817 4f8e 8701 8d04
> 0000 8119 0000 0000
> 0x8010: 33be 8000 4d02 0000 ffff ffff ffff ffff ffff ffff ffff ffff
> ffff ffff ffff ffff
>
> - Seongyong
>
> >
> > - Matt
> >
> > >  }
> > >
> > >  static int amg88xx_setup(struct video_i2c_data *data)
> > > @@ -375,7 +378,7 @@ static const struct video_i2c_chip video_i2c_chip=
[] =3D {
> > >                 .format         =3D &mlx90640_format,
> > >                 .frame_intervals        =3D mlx90640_frame_intervals,
> > >                 .num_frame_intervals    =3D ARRAY_SIZE(mlx90640_frame=
_intervals),
> > > -               .buffer_size    =3D 1664,
> > > +               .buffer_size    =3D 1728,
> > >                 .bpp            =3D 16,
> > >                 .regmap_config  =3D &mlx90640_regmap_config,
> > >                 .nvmem_config   =3D &mlx90640_nvram_config,
> > > --
> > > 2.31.1
> > >
