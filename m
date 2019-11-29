Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D10B10D026
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2019 01:17:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726664AbfK2ARN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Nov 2019 19:17:13 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:44369 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726616AbfK2ARN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Nov 2019 19:17:13 -0500
Received: by mail-ed1-f68.google.com with SMTP id a67so24258980edf.11
        for <linux-media@vger.kernel.org>; Thu, 28 Nov 2019 16:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=hKdxAEvC9giOVo+5fI8UhBseDYEwGbYsXK3mw9tmIQY=;
        b=hVlmWmpzm8h9AJJ3dV8J/Vq5S3tr8XdfS5TULH7gtd+QDlFhFvJl5GIs3pVRxbpuAr
         vb1xpQaVDVwJEn8ubFxWrx0Sy+N9ZDlY0LzWfmLkB4krIK6/YmWQQ+vvqvlvkaGE6nAX
         DPJPCbcwVfWu0Kox3IVCt7MSklSiOlMkMdfDc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=hKdxAEvC9giOVo+5fI8UhBseDYEwGbYsXK3mw9tmIQY=;
        b=EcaNOFZIqDcFQYMdKn3CCsLv9u8dlgo3nvjf40UrwBpavm8/jWpo/AOukBtqxvc278
         4ihh8M4fiUB6ZOFQu7tYENWpX5pXhiLRBBNoz5bp2NjuetYcZ9zYFRKwb+jn208TPpWR
         Lmfx1n+wK0Yerw20VWotCdRum500xcvpGML1//tpnjcOCltTi5p3I3uRrG70EdsxrogV
         cWCNc27nPyhtt6e/4TK/9GiZrVCP662plNkp/B8nEymiuZr6A1MJrkLPZxxCXeE4u0OY
         7avBp7q4LXZf1b3CEmo7y79pNVACihCUKVCXbPYkaNK2qsuj6tIUAu9fy3GcswKI5xWz
         Elyw==
X-Gm-Message-State: APjAAAXsAbgr3QyDvFJDSi1LfXhkBOaEfpLcr8ZDfgfm9sxDK6rnzYS8
        R5rN4n/ZgQaWCRbcAe2BjhnrfjlYHWBeFw==
X-Google-Smtp-Source: APXvYqwwiA0wYI+iTPAjPzTO3IMKbfZl1s3jb9gk1XN3cVDQsvM2IDI1nrkBqXprd46yNjgJ6A/Ing==
X-Received: by 2002:aa7:d904:: with SMTP id a4mr36976254edr.44.1574986630350;
        Thu, 28 Nov 2019 16:17:10 -0800 (PST)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com. [209.85.128.50])
        by smtp.gmail.com with ESMTPSA id f8sm1249344edb.60.2019.11.28.16.17.09
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2019 16:17:09 -0800 (PST)
Received: by mail-wm1-f50.google.com with SMTP id l17so12495812wmh.0
        for <linux-media@vger.kernel.org>; Thu, 28 Nov 2019 16:17:09 -0800 (PST)
X-Received: by 2002:a1c:3c42:: with SMTP id j63mr12611006wma.90.1574986628632;
 Thu, 28 Nov 2019 16:17:08 -0800 (PST)
MIME-Version: 1.0
References: <20191122051608.128717-1-hiroh@chromium.org> <767528be59275265072896e5c679e97575615fdd.camel@ndufresne.ca>
 <CAAFQd5D3OpAAtX7_0ktz4-aAgWN_G4YBQMR=Vwp7JPopjvRkRA@mail.gmail.com> <f5341ed837529bd38d466d4b655e261d64065912.camel@ndufresne.ca>
In-Reply-To: <f5341ed837529bd38d466d4b655e261d64065912.camel@ndufresne.ca>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 29 Nov 2019 09:16:57 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Cpk8qG+VgE6+aznBmXu11YG0gNQyCRanZghds-TPKvyg@mail.gmail.com>
Message-ID: <CAAFQd5Cpk8qG+VgE6+aznBmXu11YG0gNQyCRanZghds-TPKvyg@mail.gmail.com>
Subject: Re: [PATCH] media: hantro: Support H264 profile control
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Hirokazu Honda <hiroh@chromium.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devel@driverdev.osuosl.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Nov 23, 2019 at 1:52 AM Nicolas Dufresne <nicolas@ndufresne.ca> wro=
te:
>
> Le samedi 23 novembre 2019 =C3=A0 01:00 +0900, Tomasz Figa a =C3=A9crit :
> > On Sat, Nov 23, 2019 at 12:09 AM Nicolas Dufresne <nicolas@ndufresne.ca=
> wrote:
> > > Le vendredi 22 novembre 2019 =C3=A0 14:16 +0900, Hirokazu Honda a =C3=
=A9crit :
> > > > The Hantro G1 decoder supports H.264 profiles from Baseline to High=
, with
> > > > the exception of the Extended profile.
> > > >
> > > > Expose the V4L2_CID_MPEG_VIDEO_H264_PROFILE control, so that the
> > > > applications can query the driver for the list of supported profile=
s.
> > >
> > > Thanks for this patch. Do you think we could also add the LEVEL contr=
ol
> > > so the profile/level enumeration becomes complete ?
> > >
> > > I'm thinking it would be nice if the v4l2 compliance test make sure
> > > that codecs do implement these controls (both stateful and stateless)=
,
> > > it's essential for stack with software fallback, or multiple capable
> > > codec hardware but with different capabilities.
> > >
> >
> > Level is a difficult story, because it also specifies the number of
> > macroblocks per second, but for decoders like this the number of
> > macroblocks per second it can handle depends on things the driver
> > might be not aware of - clock frequencies, DDR throughput, system
> > load, etc.
> >
> > My take on this is that the decoder driver should advertise the
> > highest resolution the decoder can handle due to hardware constraints.
> > Performance related things depend on the integration details and
> > should be managed elsewhere. For example Android and Chrome OS manage
> > expected decoding performance in per-board configuration files.
>
> When you read datasheet, the HW is always rated to maximum level (and
> it's a range) with the assumption of a single stream. It seems much
> easier to expose this as-is, statically then to start doing some math
> with data that isn't fully exposed to the user. This is about filtering
> of multiple CODEC instances, it does not need to be rocket science,
> specially that the amount of missing data is important (e.g. usage of
> tiles, compression, IPP all have an impact on the final performance).
> All we want to know in userspace is if this HW is even possibly capable
> of LEVEL X, and if not, we'll look for another one.
>

Agreed, one could potentially define it this way, but would it be
really useful for the userspace and the users? I guess it could enable
slightly faster fallback to software decoding in the extreme case of
the hardware not supporting the level at all, but I suspect that the
majority of cases would be the hardware just being unusably slow.

Also, as I mentioned before, we already return the range of supported
resolutions, which in practice should map to the part of the level
that may depend on hardware capabilities rather than performance, so
exposing levels as well would add redundancy to the information
exposed.

> >
> > > > Signed-off-by: Hirokazu Honda <hiroh@chromium.org>
> > > > ---
> > > >  drivers/staging/media/hantro/hantro_drv.c | 10 ++++++++++
> > > >  1 file changed, 10 insertions(+)
> > > >
> > > > diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/st=
aging/media/hantro/hantro_drv.c
> > > > index 6d9d41170832..9387619235d8 100644
> > > > --- a/drivers/staging/media/hantro/hantro_drv.c
> > > > +++ b/drivers/staging/media/hantro/hantro_drv.c
> > > > @@ -355,6 +355,16 @@ static const struct hantro_ctrl controls[] =3D=
 {
> > > >                       .def =3D V4L2_MPEG_VIDEO_H264_START_CODE_ANNE=
X_B,
> > > >                       .max =3D V4L2_MPEG_VIDEO_H264_START_CODE_ANNE=
X_B,
> > > >               },
> > > > +     }, {
> > > > +             .codec =3D HANTRO_H264_DECODER,
> > > > +             .cfg =3D {
> > > > +                     .id =3D V4L2_CID_MPEG_VIDEO_H264_PROFILE,
> > > > +                     .min =3D V4L2_MPEG_VIDEO_H264_PROFILE_BASELIN=
E,
> > > > +                     .max =3D V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
> > > > +                     .menu_skip_mask =3D
> > > > +                     BIT(V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED),
> > > > +                     .def =3D V4L2_MPEG_VIDEO_H264_PROFILE_MAIN,
> > > > +             }
> > > >       }, {
> > > >       },
> > > >  };
