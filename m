Return-Path: <linux-media+bounces-8855-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6059889C835
	for <lists+linux-media@lfdr.de>; Mon,  8 Apr 2024 17:25:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 84D8E1C233EC
	for <lists+linux-media@lfdr.de>; Mon,  8 Apr 2024 15:25:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 665691411C6;
	Mon,  8 Apr 2024 15:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fXaihqeH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1269A14039D
	for <linux-media@vger.kernel.org>; Mon,  8 Apr 2024 15:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712589934; cv=none; b=O74WdQonswm6vUKu1bln/985oZqyn6XpLzucYzxaIuJrEF3RLOphNs0x+KRAgUpDXPHfuZ+NZOcEHeGK/LRoR0mp4KdCpVN4t0roQucs2yRcr0aS2nTN5Gry9JF7AvACi316He9UtChymWwq8CU1q3Xubl6V3Sns0yHD6OyKm24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712589934; c=relaxed/simple;
	bh=B/v1v3h2AYw4P1pjILLZrQfWcIRBhUaMnA8TnkMXbps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pbIqexKA0mGSL9Rlav4VPpHxeyHuDnpur+ucM4feOalTHdPgtD7wSK6PxRilyPULtBG4fm/geOlbtHRuudgfc7ZlZ9lVDyxi7cp0dbmnz5MP+gC1EeACU+wKhGQqFVEh9VpNnKh20I7pZRdw1gwAJuqu9ZHhcdYJK0hrl2bSP7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fXaihqeH; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-36a133ff27eso6924195ab.1
        for <linux-media@vger.kernel.org>; Mon, 08 Apr 2024 08:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712589932; x=1713194732; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dyLeEtLJTKGlZTVOKTvm8+gq5ePSTykbDWLodWR3pJk=;
        b=fXaihqeHobvHFOMSh6wbKZNHxvhuGh8REeGSzKe7vcpCrCp4wrqtGyqWzYt3xF6FIT
         G9ZwhZFAAkqWMhz2TGAtz6H299VTT2/3jzNA5ykX0HSYUGOfw8wV74VEOOuCSnweoZRO
         ESbicSrKmNI16nwFJfc8JITLG10Ot4+9CavmCuqk5CbA2BX25asDHdZ6Oto+Xh0TgF+n
         MPb+tpqq1PDWyHXiVhz87hiy/S1WZpAiIGJXoZqF37+b+/0b5HiQM1bY8tR4X+wANfxr
         gDUffVINdlNavkfIfn4pjIyXDrljpr+LLhCS8GpElCKngY6pHX4q1Zj4FLRUuLrJyeJW
         FdyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712589932; x=1713194732;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dyLeEtLJTKGlZTVOKTvm8+gq5ePSTykbDWLodWR3pJk=;
        b=h4N65nEBRvk8pvgzjwxZFaC/7SZ3zBNBZMPhEEmU9vDXOwQrUkvWMwzUED7KtL/9n1
         WK2wBjQlSVf8NXIl7PcuuJO+BGR/8BrYeEbsDZvFpWwRA52tjIGyXJ8/hWHwAJtbky67
         Wl43qeyOVT8ldqkJaukuAIExJe1wUqJ+bT6xYQvg5jA19RsNcrVBdteWydeUcDtp63Ii
         GwC1KbEtc5dPez+zfZfZcxfYIsRtoWBNVQjaKMbL70m3ItDBKv+tR1qxf8ab0fYK//38
         NRgxNKG65AbNWZZl78jcd1SK7J0KvqDFK9bYDo+F0/tqYXScr5fipmqjSH3DMDPCcltF
         /nig==
X-Forwarded-Encrypted: i=1; AJvYcCVP91lERbE2wYs2YdSmN19KvJ8fBnq7aopHwFPPvrE4UJz0plK+z6iGItr8JHAxjbIHoWJuQQta57iB9T2uswze5X5bHMHulMO0wsU=
X-Gm-Message-State: AOJu0YxLbLTEZGU9YQp8rBYrPRpPvITaqg7Bt7Kviru9//vU8hD+l7H2
	O3tTa7kCGWSK4m51WmewxOBtOpyEflwVbdNBajFQfS/8XG2lbtgmZ6sTlxr0j9/WziG9S1PYdkG
	AvcP4HeYsL+RlFRjTdZI7lijV1YqNQAZvfwQmRLR2Vx9ffpCm4j6QJHE=
X-Google-Smtp-Source: AGHT+IFoibPO7BhL7RK/sv94V3MP2D2AB7zKuNJZK2klNQtL4Sva6nteovilZR+8Gxg0RywxiuMfLjq9IgnaG49qvAE=
X-Received: by 2002:a92:c68e:0:b0:368:7571:686d with SMTP id
 o14-20020a92c68e000000b003687571686dmr2483ilg.1.1712589932007; Mon, 08 Apr
 2024 08:25:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240405141411.1807189-1-panikiel@google.com> <6027dacf-549e-4855-97d9-dd02e65fd94a@xs4all.nl>
 <5aa6d853-60f5-485b-b892-e6e81acdfc12@xs4all.nl>
In-Reply-To: <5aa6d853-60f5-485b-b892-e6e81acdfc12@xs4all.nl>
From: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <panikiel@google.com>
Date: Mon, 8 Apr 2024 17:25:21 +0200
Message-ID: <CAM5zL5qqv=XFnCwV2g1ErNzjMP0LzJaxRRCPEmqOkvWNDr8U3A@mail.gmail.com>
Subject: Re: [PATCH 00/16] Switch subdev dv timing callbacks to pad ops
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: kieran.bingham@ideasonboard.com, mchehab@kernel.org, tharvey@gateworks.com, 
	niklas.soderlund@ragnatech.se, prabhakar.csengg@gmail.com, 
	charles-antoine.couret@nexvision.fr, thierry.reding@gmail.com, 
	jonathanh@nvidia.com, skomatineni@nvidia.com, luca.ceresoli@bootlin.com, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	chromeos-krk-upstreaming@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 8, 2024 at 4:18=E2=80=AFPM Hans Verkuil <hverkuil-cisco@xs4all.=
nl> wrote:
>
> On 08/04/2024 16:15, Hans Verkuil wrote:
> > On 05/04/2024 16:13, Pawe=C5=82 Anikiel wrote:
> >> Currently, subdev dv timing calls (i.e. g/s/query_dv_timings) are vide=
o
> >> ops without a pad argument. This is a problem if the subdevice can hav=
e
> >> different dv timings for each pad (e.g. a DisplayPort receiver with
> >> multiple virtual channels).
> >>
> >> This patchset changes subdev dv timing callbacks to include a pad
> >> argument, and moves them from video to pad ops. All the affected
> >> drivers are updated to use the new pad ops version.
> >>
> >> The affected drivers were updated in a way that mathes how they deal
> >> with the pad argument in other callbacks (mainly enum_dv_timings,
> >> dv_timings_cap, get/set_edid).
> >>
> >> This was originally a part of a larger patchset:
> >> https://lore.kernel.org/lkml/20240221160215.484151-2-panikiel@google.c=
om/
> >>
> >> Pawe=C5=82 Anikiel (16):
> >>   media: v4l2-subdev: Add pad versions of dv timing subdev calls
> >>   media: i2c: adv748x: Switch dv timing callbacks to pad ops
> >>   media: i2c: adv7511: Switch dv timing callbacks to pad ops
> >>   media: i2c: adv7604: Switch dv timing callbacks to pad ops
> >>   media: i2c: adv7842: Switch dv timing callbacks to pad ops
> >>   media: i2c: tc358743: Switch dv timing callbacks to pad ops
> >>   media: i2c: tda1997x: Switch dv timing callbacks to pad ops
> >>   media: i2c: ths7303: Switch dv timing callbacks to pad ops
> >>   media: i2c: ths8200: Switch dv timing callbacks to pad ops
> >>   media: i2c: tvp7002: Switch dv timing callbacks to pad ops
> >>   media: spi: gs1662: Switch dv timing callbacks to pad ops
> >>   media: cobalt: Use pad variant of dv timing subdev calls
> >>   media: rcar-vin: Use pad variant of dv timing subdev calls
> >>   media: vpif_capture: Use pad variant of dv timing subdev calls
> >>   media: tegra-video: Use pad variant of dv timing subdev calls
> >>   media: v4l2-subdev: Remove non-pad dv timing callbacks
> >
> > You missed one:
> >
> > In file included from include/media/v4l2-device.h:13,
> >                  from drivers/media/platform/ti/davinci/vpif_display.h:=
13,
> >                  from drivers/media/platform/ti/davinci/vpif_display.c:=
26:
> > drivers/media/platform/ti/davinci/vpif_display.c: In function 'vpif_s_d=
v_timings':
> > include/media/v4l2-subdev.h:1816:56: error: 'const struct v4l2_subdev_v=
ideo_ops' has no member named 's_dv_timings'
> >  1816 |                 else if (!(__sd->ops->o && __sd->ops->o->f))   =
         \
> >       |                                                        ^~
> > drivers/media/platform/ti/davinci/vpif_display.c:937:15: note: in expan=
sion of macro 'v4l2_subdev_call'
> >   937 |         ret =3D v4l2_subdev_call(ch->sd, video, s_dv_timings, t=
imings);
> >       |               ^~~~~~~~~~~~~~~~
> > include/media/v4l2-subdev.h:1819:53: error: 'const struct v4l2_subdev_v=
ideo_ops' has no member named 's_dv_timings'
> >  1819 |                          v4l2_subdev_call_wrappers.o->f)       =
         \
> >       |                                                     ^~
> > drivers/media/platform/ti/davinci/vpif_display.c:937:15: note: in expan=
sion of macro 'v4l2_subdev_call'
> >   937 |         ret =3D v4l2_subdev_call(ch->sd, video, s_dv_timings, t=
imings);
> >       |               ^~~~~~~~~~~~~~~~
> > include/media/v4l2-subdev.h:1820:63: error: 'const struct v4l2_subdev_v=
ideo_ops' has no member named 's_dv_timings'
> >  1820 |                         __result =3D v4l2_subdev_call_wrappers.=
o->f(      \
> >       |                                                               ^=
~
> > drivers/media/platform/ti/davinci/vpif_display.c:937:15: note: in expan=
sion of macro 'v4l2_subdev_call'
> >   937 |         ret =3D v4l2_subdev_call(ch->sd, video, s_dv_timings, t=
imings);
> >       |               ^~~~~~~~~~~~~~~~
> > include/media/v4l2-subdev.h:1823:48: error: 'const struct v4l2_subdev_v=
ideo_ops' has no member named 's_dv_timings'
> >  1823 |                         __result =3D __sd->ops->o->f(__sd, ##ar=
gs);       \
> >       |                                                ^~
> > drivers/media/platform/ti/davinci/vpif_display.c:937:15: note: in expan=
sion of macro 'v4l2_subdev_call'
> >   937 |         ret =3D v4l2_subdev_call(ch->sd, video, s_dv_timings, t=
imings);
> >       |               ^~~~~~~~~~~~~~~~
> > drivers/media/platform/ti/davinci/vpif_display.c:937:15: error: no memb=
er 's_dv_timings' in struct v4l2_subdev_video_ops
> > drivers/media/platform/ti/davinci/vpif_display.c:937:15: error: no memb=
er 's_dv_timings' in struct v4l2_subdev_video_ops
> > drivers/media/platform/ti/davinci/vpif_display.c:937:15: error: no memb=
er 's_dv_timings' in struct v4l2_subdev_video_ops
> > drivers/media/platform/ti/davinci/vpif_display.c:937:15: error: no memb=
er 's_dv_timings' in struct v4l2_subdev_video_ops
>
> No need to post a v2. Just post a single patch '14.5/16' to convert vpif_=
display that
> will be added after patch [14/16], then I'll take care of it.

I probably thought vpif-capture.c and vpif-display.c were the same
file. I sent the 14.5 patch as you requested.

As an aside, how did you run the compile test? It would be nice to
know for the future. For this, I did a few greps and manually enabled
all the drivers in menuconfig. Is there a better way?

Regards,
Pawe=C5=82

>
> Regards,
>
>         Hans
>
> >
> > Regards,
> >
> >       Hans
> >
> >>
> >>  drivers/media/i2c/adv748x/adv748x-hdmi.c      | 16 ++++----
> >>  drivers/media/i2c/adv7511-v4l2.c              | 14 +++++--
> >>  drivers/media/i2c/adv7604.c                   | 14 +++----
> >>  drivers/media/i2c/adv7842.c                   | 25 ++++++++----
> >>  drivers/media/i2c/tc358743.c                  | 23 +++++++----
> >>  drivers/media/i2c/tda1997x.c                  | 12 +++---
> >>  drivers/media/i2c/ths7303.c                   |  8 +++-
> >>  drivers/media/i2c/ths8200.c                   | 14 +++++--
> >>  drivers/media/i2c/tvp7002.c                   | 26 +++++++++----
> >>  drivers/media/pci/cobalt/cobalt-v4l2.c        | 12 +++---
> >>  .../platform/renesas/rcar-vin/rcar-v4l2.c     |  9 +++--
> >>  .../media/platform/ti/davinci/vpif_capture.c  |  4 +-
> >>  drivers/media/spi/gs1662.c                    | 21 +++++++---
> >>  drivers/media/v4l2-core/v4l2-subdev.c         | 39 +++++++++++++++++-=
-
> >>  drivers/staging/media/tegra-video/vi.c        | 12 +++---
> >>  include/media/v4l2-subdev.h                   | 28 ++++++-------
> >>  16 files changed, 183 insertions(+), 94 deletions(-)
> >>
> >
> >
>

