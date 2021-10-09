Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C790427964
	for <lists+linux-media@lfdr.de>; Sat,  9 Oct 2021 13:14:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235737AbhJILQk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 Oct 2021 07:16:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233160AbhJILQi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 9 Oct 2021 07:16:38 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4999CC061570
        for <linux-media@vger.kernel.org>; Sat,  9 Oct 2021 04:14:42 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id m21so5701878pgu.13
        for <linux-media@vger.kernel.org>; Sat, 09 Oct 2021 04:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3P5BasEA1a1sjx45YX6htf0plCj0PERI910vkXF4DVE=;
        b=bDqvOEnRAJWWP0DV4MiHK4KAfMm0ukjBFFC3G2nARFgdDpHeRHQ9bbiHbzSeHzxuu+
         38Iq6y2QPAjCRInAQonSW3R+442lPeWwycAIYWwlwPu1vBnw8ZTUg/jHRUr39bdCV+Vf
         o4Aq2kfo40UEW7kEYDzU1dh/jY5SQvVarISDuwAZg9YqypkqvDTNKMNTxq7OfHunZoxL
         B/YHfLtkHHfRdY9Tfh3db5d/ebsj+a/3qyGrBHeQ3H9IJu7pbwqa5iSRyOSh8DYuh5+j
         acUwNXz7Qn9qYXAU+HvYuqRug4porTobeCztDkJhqMkwr+Z+qZZuy1geNoFa2j9nRSQe
         kmCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3P5BasEA1a1sjx45YX6htf0plCj0PERI910vkXF4DVE=;
        b=sd2Io4oe2TaBloZFu3cFsrWCwB9HatW2fHZ4fQJsw5XUVMB960Ic1gxmoJbUvkpto7
         KSiFv1fa8YpAFUChh0mS7fz8gnkl3BNJkDatum+mZ4036f3p/i4uwxD3W4fXP83zJKcM
         ++4TW4LaNXg/fGEltGPgtO6lmxI4phPbJzPcsCn8RB1Bp1C8jJoyXGcucN8Cy2ADIgYY
         ks0wiUPLE5+BKnj9L1qvBbgLKpYXg7syn87n5vTTA2I+enz3w40fk70tIwYI5DNJ/eAu
         bFSRY+P3tPV82mypx6wD1/KNFi9OVO9iFmfO+kbiPihRKQWNfkvQlDFIb1rgk+Gr35QB
         ayEA==
X-Gm-Message-State: AOAM53099rEbh1cwqwZzTqQdOQwWZuopKb/xpppvBB1aMl3YSQB4mLqh
        dXD1orAQ+vJf4RvT56cEpxPl4xMRVX1YnudNMGQ=
X-Google-Smtp-Source: ABdhPJxTlKxyWMVrd+y97Ce3if13cXwXLBa3ZA9olREzNcKqvciZewvrA1azSaREFsla79oAZhTQxA5twlWqrum30MI=
X-Received: by 2002:a63:6e4a:: with SMTP id j71mr1704827pgc.447.1633778081695;
 Sat, 09 Oct 2021 04:14:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210608152451.14730-1-euphoriccatface@gmail.com>
 <20210608152451.14730-3-euphoriccatface@gmail.com> <20210805145504.GC3@valkosipuli.retiisi.eu>
 <4f18b09b-993b-6fc7-6ee2-59e2b738d21f@xs4all.nl> <YT8iaJ6NLwg8129+@valkosipuli.retiisi.eu>
In-Reply-To: <YT8iaJ6NLwg8129+@valkosipuli.retiisi.eu>
From:   Seongyong Park <euphoriccatface@gmail.com>
Date:   Sat, 9 Oct 2021 20:14:07 +0900
Message-ID: <CAJp=mWQ6d_tzfu29hyVFcR4EeUbdhURthbEyMpbPjc7NnRzV9g@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] media: video-i2c: append register data on
 MLX90640's frame
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        linux-media <linux-media@vger.kernel.org>,
        Matt Ranostay <matt.ranostay@konsulko.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thank you to everyone who gave some feedback.
I finally have found the time to get back to this. Sorry for the delay.

I tried gathering what I'd need to do if I wanted to add the suggested
new pixel format.
Since I'm learning a ton with this project on my own, I'd like some
help to figure things out.
Much appreciated if someone could confirm whether this looks right:

1. Modify any part in video-i2c that assume capability / stream
parameter / buffer type of *VIDEO_CAPTURE only
For example, the following part of `video_i2c_g_parm()`
```
if (parm->type !=3D V4L2_BUF_TYPE_VIDEO_CAPTURE)
    return -EINVAL;
```

2. Make it possible for the videobuf2 queue to be configured for
BUF_TYPE_VIDEO_CAPTURE_MPLANE as well
Since the `vb2_queue_init()` is currently called inside
`video_i2c_probe()`, I assume the setup and initialization will have
to be moved to another place. Maybe into `start_streaming()`.

3. Add an entry to `videodev2.h`
I assume so because, with quick grep-ing, I couldn't find any pixel
format definitions under `drivers/media` but one
(drivers/media/usb/msi2500)
The entry would be named like V4L2_PIX_FMT_MLX9064X (MLX90641 seems to
have similar format)

4. Add a flag in `video_i2c_data` for the multiplane output, and add
appropriate code to fill in the second plane

...and then the rest will be adjusting the code, like getting the size
of data correct and so on.

Thanks in advance.
Seongyong Park

2021=EB=85=84 9=EC=9B=94 13=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 7:05, S=
akari Ailus <sakari.ailus@iki.fi>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:

>
> Hi Hans, Seongyong,
>
> On Mon, Sep 13, 2021 at 10:57:04AM +0200, Hans Verkuil wrote:
> > On 05/08/2021 16:55, Sakari Ailus wrote:
> > > Hi Seongyong,
> > >
> > > On Wed, Jun 09, 2021 at 12:24:51AM +0900, Seongyong Park wrote:
> > >> On MLX90640, Each measurement step updates half of the pixels in the=
 frame
> > >> (every other pixel in default "chess mode", and every other row
> > >> in "interleave mode"), while additional coefficient data (25th & 26t=
h row)
> > >> updates every step. The compensational coefficient data only corresp=
onds
> > >> with the pixels updated in the same step.
> > >>
> > >> Only way to know which "subpage" was updated on the last step is to =
read
> > >> "status register" on address 0x8000. Without this data,
> > >> compensation calculation may be able to detect which sets of pixels =
have
> > >> been updated, but it will have to make assumptions when frame skip h=
appens,
> > >> and there is no way to do it correctly when the host simply cannot
> > >> keep up with refresh rate.
> > >>
> > >> Signed-off-by: Seongyong Park <euphoriccatface@gmail.com>
> > >> ---
> > >>  drivers/media/i2c/video-i2c.c | 13 +++++++++----
> > >>  1 file changed, 9 insertions(+), 4 deletions(-)
> > >>
> > >> diff --git a/drivers/media/i2c/video-i2c.c b/drivers/media/i2c/video=
-i2c.c
> > >> index 64ba96329..2b50a76f3 100644
> > >> --- a/drivers/media/i2c/video-i2c.c
> > >> +++ b/drivers/media/i2c/video-i2c.c
> > >> @@ -74,7 +74,8 @@ static const struct v4l2_fmtdesc mlx90640_format =
=3D {
> > >>
> > >>  static const struct v4l2_frmsize_discrete mlx90640_size =3D {
> > >>    .width =3D 32,
> > >> -  .height =3D 26, /* 24 lines of pixel data + 2 lines of processing=
 data */
> > >> +  .height =3D 27,
> > >> +  /* 24 lines of pixel data + 2 lines of processing data + 1 line o=
f registers */
> > >
> > > This device should actually use a multi-plane format as the data isn'=
t
> > > Y16_BE as the driver declares. That said, the format would be device
> > > specific and using one would require specific support from applicatio=
ns.
> > >
> > > I might just declare it produces fewer lines while an application tha=
t
> > > knows the device could access the extra data close to the end of the
> > > buffer.
> > >
> > > An alternative would be to use that multi-plane format and keep drive=
r
> > > support for the plain Y16_BE as well. But I think this would be a bit
> > > heavy-weight solution.
> > >
> > > I wonder what Hans thinks.
> >
> > I think it is a bit overkill as well.
> >
> > Wouldn't it be better to just add a new pixel format for this device, a=
nd
> > document it properly? I would keep the existing Y16_BE as it was to avo=
id
> > breaking userspace (since adding the extra line breaks the ABI IMHO), a=
nd
> > add a new format that properly documents how to parse the contents of t=
he
> > buffer, which includes the last line with the status register.
> >
> > Sorry for the late reply, it looks like an attempt was made to CC me, b=
ut
> > the email address was wrong, so I never received it. I only noticed thi=
s
> > when I started to review this patch.
>
> Yeah, my mistake. I thought I had an alias for you but apparently not. I =
do
> now.
>
> I think that'd be fine, albeit equally heavy-weight. But also correct.
> Documenting what's there is also important.
>
> --
> Regards,
>
> Sakari Ailus
