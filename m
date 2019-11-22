Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A77B910754A
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2019 17:00:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbfKVQAY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Nov 2019 11:00:24 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:46581 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726546AbfKVQAY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Nov 2019 11:00:24 -0500
Received: by mail-ed1-f67.google.com with SMTP id t11so6419926eds.13
        for <linux-media@vger.kernel.org>; Fri, 22 Nov 2019 08:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=o/W4ayAOoACKQZVXBLP2Z/cgRT7wVm7u2PBZdtOrT5o=;
        b=jMlY2xqV1U4GP7NURAVPe7R9M0XRzk21qdvgXiCy5WaPBW/haBCpJXOt0hccpIbKpe
         yZOeBm+fYdAMGqoSFsMQGijq8Jpf5mgze83nD+dW4wrqmoE+DyRjZkonzlFprHEjuPen
         2eYXyMwCOyLUaqisdC/+8UftZHcskza9UjbXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=o/W4ayAOoACKQZVXBLP2Z/cgRT7wVm7u2PBZdtOrT5o=;
        b=K9JBIcM5tqzcASWfWp37TXVyUILWZzFIjhXHkE191HZUCtcDv3/kOhH5grAh+f8hrs
         sFd0+UFJlNRMYKkASZUDc+x07mzoesv7DSkcby3vf2HdmiDyVxaZ+Ls7xpjgzZpMNKSx
         OlwTXb+QDrwmj5Oe66azcPyvEg49slBpa5+U656huqo7GtJl6dqP5YAJTkjL/ZD5AOfC
         f+VW9UjOF1fHg6lUim/fj7o2ZkhAo0Za53OWUN4I3VOdubbly8yqKQ0iYZqN1Wq+DpUX
         fxYjlxMEY+Rk8cT+UhBAffcb118aCOjLw2tvwn+sGs2BYayZKwBpEt4BmfgLvgnhjX5R
         bAeQ==
X-Gm-Message-State: APjAAAU7g9D7Dxqp9XKzX5K2u0LS0yBOaXBUoRk3NLWjm6iGmjcFkrY2
        cQew2lb1dT9xoN2//5IYX8I4BS0JQl0=
X-Google-Smtp-Source: APXvYqzNuuAfw+zTc20MzCb1CMzSzta8OWyVPMioXicLBINdmLrD83YmrtJq5JFS9UImZo9Fq4hd5A==
X-Received: by 2002:a17:906:5586:: with SMTP id y6mr22755169ejp.76.1574438419738;
        Fri, 22 Nov 2019 08:00:19 -0800 (PST)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com. [209.85.128.46])
        by smtp.gmail.com with ESMTPSA id x34sm315339edd.41.2019.11.22.08.00.17
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2019 08:00:18 -0800 (PST)
Received: by mail-wm1-f46.google.com with SMTP id g206so7716509wme.1
        for <linux-media@vger.kernel.org>; Fri, 22 Nov 2019 08:00:17 -0800 (PST)
X-Received: by 2002:a1c:40c1:: with SMTP id n184mr17914395wma.116.1574438417276;
 Fri, 22 Nov 2019 08:00:17 -0800 (PST)
MIME-Version: 1.0
References: <20191122051608.128717-1-hiroh@chromium.org> <767528be59275265072896e5c679e97575615fdd.camel@ndufresne.ca>
In-Reply-To: <767528be59275265072896e5c679e97575615fdd.camel@ndufresne.ca>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Sat, 23 Nov 2019 01:00:06 +0900
X-Gmail-Original-Message-ID: <CAAFQd5D3OpAAtX7_0ktz4-aAgWN_G4YBQMR=Vwp7JPopjvRkRA@mail.gmail.com>
Message-ID: <CAAFQd5D3OpAAtX7_0ktz4-aAgWN_G4YBQMR=Vwp7JPopjvRkRA@mail.gmail.com>
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

On Sat, Nov 23, 2019 at 12:09 AM Nicolas Dufresne <nicolas@ndufresne.ca> wr=
ote:
>
> Le vendredi 22 novembre 2019 =C3=A0 14:16 +0900, Hirokazu Honda a =C3=A9c=
rit :
> > The Hantro G1 decoder supports H.264 profiles from Baseline to High, wi=
th
> > the exception of the Extended profile.
> >
> > Expose the V4L2_CID_MPEG_VIDEO_H264_PROFILE control, so that the
> > applications can query the driver for the list of supported profiles.
>
> Thanks for this patch. Do you think we could also add the LEVEL control
> so the profile/level enumeration becomes complete ?
>
> I'm thinking it would be nice if the v4l2 compliance test make sure
> that codecs do implement these controls (both stateful and stateless),
> it's essential for stack with software fallback, or multiple capable
> codec hardware but with different capabilities.
>

Level is a difficult story, because it also specifies the number of
macroblocks per second, but for decoders like this the number of
macroblocks per second it can handle depends on things the driver
might be not aware of - clock frequencies, DDR throughput, system
load, etc.

My take on this is that the decoder driver should advertise the
highest resolution the decoder can handle due to hardware constraints.
Performance related things depend on the integration details and
should be managed elsewhere. For example Android and Chrome OS manage
expected decoding performance in per-board configuration files.

> >
> > Signed-off-by: Hirokazu Honda <hiroh@chromium.org>
> > ---
> >  drivers/staging/media/hantro/hantro_drv.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/stagin=
g/media/hantro/hantro_drv.c
> > index 6d9d41170832..9387619235d8 100644
> > --- a/drivers/staging/media/hantro/hantro_drv.c
> > +++ b/drivers/staging/media/hantro/hantro_drv.c
> > @@ -355,6 +355,16 @@ static const struct hantro_ctrl controls[] =3D {
> >                       .def =3D V4L2_MPEG_VIDEO_H264_START_CODE_ANNEX_B,
> >                       .max =3D V4L2_MPEG_VIDEO_H264_START_CODE_ANNEX_B,
> >               },
> > +     }, {
> > +             .codec =3D HANTRO_H264_DECODER,
> > +             .cfg =3D {
> > +                     .id =3D V4L2_CID_MPEG_VIDEO_H264_PROFILE,
> > +                     .min =3D V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
> > +                     .max =3D V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
> > +                     .menu_skip_mask =3D
> > +                     BIT(V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED),
> > +                     .def =3D V4L2_MPEG_VIDEO_H264_PROFILE_MAIN,
> > +             }
> >       }, {
> >       },
> >  };
>
