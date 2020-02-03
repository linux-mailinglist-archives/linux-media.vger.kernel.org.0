Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 334221504F2
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2020 12:14:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727936AbgBCLOG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Feb 2020 06:14:06 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:45964 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727722AbgBCLOG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Feb 2020 06:14:06 -0500
Received: by mail-ed1-f67.google.com with SMTP id v28so15479448edw.12
        for <linux-media@vger.kernel.org>; Mon, 03 Feb 2020 03:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+yNuFpCLdENCrOu/6taXbpfMWjpnDOjCp0lZEI0arXY=;
        b=c27VhUEbZIHiatO2u6kTPbn7uHk+J7oRFhVv+JnEG72EmFdvLo26GFcwMGdFQH3k5g
         vft0Z3R293XgeV8XluJlhxXIr/aJgqBvCZpB+iiiwc06yUExjRRVAzkOBqBGIdYTpafW
         WfBk0LNZPyEPCGuXg5ju1klO4hnhfHCGO9vd4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+yNuFpCLdENCrOu/6taXbpfMWjpnDOjCp0lZEI0arXY=;
        b=Aui4UR9U9RnN5X/FdU6Gr45l7nIAuvwHlMG7+yYH2Tb5GgJ+rFGqfnQNqky2uVeb4F
         ZqSYchBDnDYJhXe3L9khqghT5z4+jz0PfTvqG0LPohVBrfyxwhS+/Dh7KOVj0IwH+VEh
         4sYSxIz+iYSSx8NlC8i4tAB4eHkDXvSbirGW4sA3kWnCgIboaqYIJGxbBZiO62DoUFAZ
         GJUcRBBtoeV78nIfizDWm1xi+ZyEWe3O7GJiJRrMg96qP+cUnGlyC1JeVD9oiQMk/Jw6
         7EdNiFlQ7VqSIlNl9+UorDpdXKSwmGexstnFcU27g2TNPFcqmWO1Ese7MdvqYTXZlTsG
         wIDw==
X-Gm-Message-State: APjAAAUyTS7QGC79In19nES1WJFt54cJil68BXEn+Vvd9pKKRAos6zJg
        q1PaBQw9Xva/4cBtuJnxW1YHQHOIgqhcvQ==
X-Google-Smtp-Source: APXvYqymTmgcJm+lnrVQ0VDicJXBHs9CxIIgU4EBd/Cnt6YMMmLAcrN9X1161JsIH8gK5WgYfulsbg==
X-Received: by 2002:a05:6402:22ca:: with SMTP id dm10mr11293767edb.267.1580728442375;
        Mon, 03 Feb 2020 03:14:02 -0800 (PST)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com. [209.85.221.44])
        by smtp.gmail.com with ESMTPSA id f11sm1047828ejk.62.2020.02.03.03.14.01
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2020 03:14:01 -0800 (PST)
Received: by mail-wr1-f44.google.com with SMTP id t2so17509708wrr.1
        for <linux-media@vger.kernel.org>; Mon, 03 Feb 2020 03:14:01 -0800 (PST)
X-Received: by 2002:adf:f58a:: with SMTP id f10mr15866458wro.105.1580728441001;
 Mon, 03 Feb 2020 03:14:01 -0800 (PST)
MIME-Version: 1.0
References: <20191122051608.128717-1-hiroh@chromium.org> <767528be59275265072896e5c679e97575615fdd.camel@ndufresne.ca>
 <CAAFQd5D3OpAAtX7_0ktz4-aAgWN_G4YBQMR=Vwp7JPopjvRkRA@mail.gmail.com>
 <f5341ed837529bd38d466d4b655e261d64065912.camel@ndufresne.ca>
 <CAAFQd5Cpk8qG+VgE6+aznBmXu11YG0gNQyCRanZghds-TPKvyg@mail.gmail.com>
 <c88b2822-0dd2-8ea3-eb0b-262df5a30830@xs4all.nl> <8b10414a1c198a6e3bd5e131a72bd6f68466bea5.camel@ndufresne.ca>
In-Reply-To: <8b10414a1c198a6e3bd5e131a72bd6f68466bea5.camel@ndufresne.ca>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 3 Feb 2020 20:13:48 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AZ1DTtz2myuO9YSwjMaxPme0BDNaOBo97tSHLbm4XWPg@mail.gmail.com>
Message-ID: <CAAFQd5AZ1DTtz2myuO9YSwjMaxPme0BDNaOBo97tSHLbm4XWPg@mail.gmail.com>
Subject: Re: [PATCH] media: hantro: Support H264 profile control
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Hirokazu Honda <hiroh@chromium.org>,
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

On Sat, Jan 18, 2020 at 10:31 PM Nicolas Dufresne <nicolas@ndufresne.ca> wr=
ote:
>
> Le vendredi 10 janvier 2020 =C3=A0 13:31 +0100, Hans Verkuil a =C3=A9crit=
 :
> > On 11/29/19 1:16 AM, Tomasz Figa wrote:
> > > On Sat, Nov 23, 2019 at 1:52 AM Nicolas Dufresne <nicolas@ndufresne.c=
a>
> > > wrote:
> > > > Le samedi 23 novembre 2019 =C3=A0 01:00 +0900, Tomasz Figa a =C3=A9=
crit :
> > > > > On Sat, Nov 23, 2019 at 12:09 AM Nicolas Dufresne <nicolas@ndufre=
sne.ca>
> > > > > wrote:
> > > > > > Le vendredi 22 novembre 2019 =C3=A0 14:16 +0900, Hirokazu Honda=
 a =C3=A9crit :
> > > > > > > The Hantro G1 decoder supports H.264 profiles from Baseline t=
o High,
> > > > > > > with
> > > > > > > the exception of the Extended profile.
> > > > > > >
> > > > > > > Expose the V4L2_CID_MPEG_VIDEO_H264_PROFILE control, so that =
the
> > > > > > > applications can query the driver for the list of supported
> > > > > > > profiles.
> > > > > >
> > > > > > Thanks for this patch. Do you think we could also add the LEVEL
> > > > > > control
> > > > > > so the profile/level enumeration becomes complete ?
> > > > > >
> > > > > > I'm thinking it would be nice if the v4l2 compliance test make =
sure
> > > > > > that codecs do implement these controls (both stateful and stat=
eless),
> > > > > > it's essential for stack with software fallback, or multiple ca=
pable
> > > > > > codec hardware but with different capabilities.
> > > > > >
> > > > >
> > > > > Level is a difficult story, because it also specifies the number =
of
> > > > > macroblocks per second, but for decoders like this the number of
> > > > > macroblocks per second it can handle depends on things the driver
> > > > > might be not aware of - clock frequencies, DDR throughput, system
> > > > > load, etc.
> > > > >
> > > > > My take on this is that the decoder driver should advertise the
> > > > > highest resolution the decoder can handle due to hardware constra=
ints.
> > > > > Performance related things depend on the integration details and
> > > > > should be managed elsewhere. For example Android and Chrome OS ma=
nage
> > > > > expected decoding performance in per-board configuration files.
> > > >
> > > > When you read datasheet, the HW is always rated to maximum level (a=
nd
> > > > it's a range) with the assumption of a single stream. It seems much
> > > > easier to expose this as-is, statically then to start doing some ma=
th
> > > > with data that isn't fully exposed to the user. This is about filte=
ring
> > > > of multiple CODEC instances, it does not need to be rocket science,
> > > > specially that the amount of missing data is important (e.g. usage =
of
> > > > tiles, compression, IPP all have an impact on the final performance=
).
> > > > All we want to know in userspace is if this HW is even possibly cap=
able
> > > > of LEVEL X, and if not, we'll look for another one.
> > > >
> > >
> > > Agreed, one could potentially define it this way, but would it be
> > > really useful for the userspace and the users? I guess it could enabl=
e
> > > slightly faster fallback to software decoding in the extreme case of
> > > the hardware not supporting the level at all, but I suspect that the
> > > majority of cases would be the hardware just being unusably slow.
> > >
> > > Also, as I mentioned before, we already return the range of supported
> > > resolutions, which in practice should map to the part of the level
> > > that may depend on hardware capabilities rather than performance, so
> > > exposing levels as well would add redundancy to the information
> > > exposed.
> >
> > There is a lot of discussion here, but it all revolves around a potenti=
al
> > LEVEL control.
> >
> > So I gather everyone is OK with merging this patch?
>
> I'm ok with this. For me, the level reflects the real time performance
> capability as define in the spec, while the width/height constraints usua=
lly
> represent an addressing capabicity, which may or may not operate real-tim=
e.
>

I'd like to see the level control documentation improved before we
start adding it to the drivers. I'll be okay with that then as long as
the values are exposed in a consistent and well defined way. :)

As for this patch, Hans, are you going to apply it?

Best regards,
Tomasz

> >
> > If not, let me know asap.
> >
> > Regards,
> >
> >       Hans
> >
> > > > > > > Signed-off-by: Hirokazu Honda <hiroh@chromium.org>
> > > > > > > ---
> > > > > > >  drivers/staging/media/hantro/hantro_drv.c | 10 ++++++++++
> > > > > > >  1 file changed, 10 insertions(+)
> > > > > > >
> > > > > > > diff --git a/drivers/staging/media/hantro/hantro_drv.c
> > > > > > > b/drivers/staging/media/hantro/hantro_drv.c
> > > > > > > index 6d9d41170832..9387619235d8 100644
> > > > > > > --- a/drivers/staging/media/hantro/hantro_drv.c
> > > > > > > +++ b/drivers/staging/media/hantro/hantro_drv.c
> > > > > > > @@ -355,6 +355,16 @@ static const struct hantro_ctrl controls=
[] =3D {
> > > > > > >                       .def =3D
> > > > > > > V4L2_MPEG_VIDEO_H264_START_CODE_ANNEX_B,
> > > > > > >                       .max =3D
> > > > > > > V4L2_MPEG_VIDEO_H264_START_CODE_ANNEX_B,
> > > > > > >               },
> > > > > > > +     }, {
> > > > > > > +             .codec =3D HANTRO_H264_DECODER,
> > > > > > > +             .cfg =3D {
> > > > > > > +                     .id =3D V4L2_CID_MPEG_VIDEO_H264_PROFIL=
E,
> > > > > > > +                     .min =3D V4L2_MPEG_VIDEO_H264_PROFILE_B=
ASELINE,
> > > > > > > +                     .max =3D V4L2_MPEG_VIDEO_H264_PROFILE_H=
IGH,
> > > > > > > +                     .menu_skip_mask =3D
> > > > > > > +                     BIT(V4L2_MPEG_VIDEO_H264_PROFILE_EXTEND=
ED),
> > > > > > > +                     .def =3D V4L2_MPEG_VIDEO_H264_PROFILE_M=
AIN,
> > > > > > > +             }
> > > > > > >       }, {
> > > > > > >       },
> > > > > > >  };
>
