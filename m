Return-Path: <linux-media+bounces-13011-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F379904E40
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 10:36:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3F9D283447
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 08:36:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19EBD16D32E;
	Wed, 12 Jun 2024 08:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kOqLVRCa"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE0416C875
	for <linux-media@vger.kernel.org>; Wed, 12 Jun 2024 08:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718181364; cv=none; b=qRRTi/S70KhstGz8Rg95kg/nVdtpXxlc5yNkzwri0FICO4p1RLMwVFogvxZqdheRa+BW8Yzk4e76c+MmMhN6Np6AXAfNqKJhkEoMNXfn6FnuGONapf/aXRJX+z4v8NdrpBW24SJEYDTAXrrC/fc8lVt18R14VH6PbSOL9dauPKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718181364; c=relaxed/simple;
	bh=doc3wh/NDobak9luRx8Vah60RaiI2YbRUzuglJj4iF8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mUW0ocfVaIW/7BWxeKPQJ/V4gxJ9qWdOC0M3/m1D6jlkKa2AS5nkz/N22ey/8Ed80Kj9dQMjYFSeuZqFuMm6s3O/3apuIumoEJM8Ml7s8X+IcMGibMraULKh6SNuhRt1cQ2vQvAINFTUcQHlhePvBq5W8p+87osmJjYRs3k63HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kOqLVRCa; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ebf961e504so11474241fa.2
        for <linux-media@vger.kernel.org>; Wed, 12 Jun 2024 01:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718181360; x=1718786160; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=96JHV5aiT5xFVHpkcSz0cCY5wiynRMtgpF9ScNLxjE4=;
        b=kOqLVRCaNQLBlIVOR5jIzBkS9kjhau9co0udjMp4HnUB+LGuYIObgPxlaKUfgL2flC
         7zNphPS4K3F/24pxLCBM8ZKqvsgGJdtenIqGB9qmxLDzXw89N+pmdNZG9nokOWAvuMva
         vBCYwPWjtFs1sfag3of9+dnMaej/9TTeYBGhU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718181360; x=1718786160;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=96JHV5aiT5xFVHpkcSz0cCY5wiynRMtgpF9ScNLxjE4=;
        b=prkVuU4tb3uI1QSTh4qGe5YwqrHO3mvnbqabtDe9OUQj8czU7tu9HKxU0Ebo5ipmb6
         DN+i5bw5KBlz8svVqJSMsx7lvVCfwGWpUoElYTX+kGKOKx1tmpowfHMudzsdp/Dd+kLg
         R4veY4B3ovmcxHji6lie8zsgWtiWhO1wIW6kOlyCYHgrco78C0q+HiYsyekIEnYpIsPp
         Wuu5hAQ3rcLVSLMCYf36oETZqcZSzVRifHKkrgtfw912veYgOThYgaFWSunkgOxyCOGv
         Ru6jmBA8C3r+mvvIqJ4i2hzYaGwSSgwykp5aGrzvOfQotrpulQdJCZ9zYsIzrHe3Zl8t
         M99Q==
X-Forwarded-Encrypted: i=1; AJvYcCWZB/E1THz4QORIGaeCAIT83t+TQ4+hXDmhxO8GwIFrdkYOX1d5/dAb0CXZfZb+QXXJ81wW/zWQ7kCjH0LUGlDAto4HaGRKE9KW2h0=
X-Gm-Message-State: AOJu0YzPfB+ClFC/NSYS5NKrgS0BR77Q23bvhXo598WXJxirZieP1oHr
	RFllKhl2lhhNn+yNH7sljECUqbkMmbcjxP4TejfRaC6EwGiP6KydA1tR18VRnFaFaL7Fz3y+X2w
	+7w==
X-Google-Smtp-Source: AGHT+IG2iCGRb5tRcNdL56phXz6yYwiYErJiWgrC4RrCHqyb0/0wOm6Fn9Vo1p2E7xVcFhJWB0wk8g==
X-Received: by 2002:a2e:2e14:0:b0:2ea:8d54:4516 with SMTP id 38308e7fff4ca-2ebfc8d49dbmr7743861fa.27.1718181359844;
        Wed, 12 Jun 2024 01:35:59 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57c8053b4fdsm5383580a12.58.2024.06.12.01.35.58
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jun 2024 01:35:59 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a6f176c5c10so231901966b.2
        for <linux-media@vger.kernel.org>; Wed, 12 Jun 2024 01:35:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXiXUSkLH/6m4Sq4oiLbzbBCmJXxr95KnVJWLtT6WoD5B7TA7H1ma+7S4EtpZGRdVdTFkuL035E85X37eNoEpxsldyd6hjXvzlqKcw=
X-Received: by 2002:a17:906:741:b0:a6f:1f7b:6a8b with SMTP id
 a640c23a62f3a-a6f47f803fbmr63433366b.66.1718181358251; Wed, 12 Jun 2024
 01:35:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240323-resend-hwtimestamp-v10-0-b08e590d97c7@chromium.org>
 <20240323-resend-hwtimestamp-v10-4-b08e590d97c7@chromium.org>
 <4kck7oedsnj6kfiv7ykwsjg35qodg5bdktu5t5w3xtg2xuscto@2yh6kfdqwimc>
 <20240610114306.GR18479@pendragon.ideasonboard.com> <CAAFQd5DAXq6fTrp6jF42URrwzwE+tGz_jJCRM2bhieD76u+QpA@mail.gmail.com>
 <20240612074342.GA28989@pendragon.ideasonboard.com>
In-Reply-To: <20240612074342.GA28989@pendragon.ideasonboard.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 12 Jun 2024 17:35:38 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AS_h_ydkNnKU-y--Cd_SSoMyyQhj6tXeZ_oydoqzwFFw@mail.gmail.com>
Message-ID: <CAAFQd5AS_h_ydkNnKU-y--Cd_SSoMyyQhj6tXeZ_oydoqzwFFw@mail.gmail.com>
Subject: Re: [PATCH v10 4/6] media: uvcvideo: Allow hw clock updates with
 buffers not full
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"hn.chen" <hn.chen@sunplusit.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2024 at 4:44=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Wed, Jun 12, 2024 at 12:28:56PM +0900, Tomasz Figa wrote:
> > On Mon, Jun 10, 2024 at 8:43=E2=80=AFPM Laurent Pinchart wrote:
> > > On Wed, May 29, 2024 at 05:03:08PM +0900, Tomasz Figa wrote:
> > > > On Sat, Mar 23, 2024 at 10:48:05AM +0000, Ricardo Ribalda wrote:
> > > > > With UVC 1.5 we get as little as one clock sample per frame. Whic=
h means
> > > > > that it takes 32 frames to move from the software timestamp to th=
e
> > > > > hardware timestamp method.
> > > > >
> > > > > This results in abrupt changes in the timestamping after 32 frame=
s (~1
> > > > > second), resulting in noticeable artifacts when used for encoding=
.
> > > > >
> > > > > With this patch we modify the update algorithm to work with whate=
ver
> > > > > amount of values are available.
> > > > >
> > > > > Tested-by: HungNien Chen <hn.chen@sunplusit.com>
> > > > > Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> > > > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > > ---
> > > > >  drivers/media/usb/uvc/uvc_video.c | 16 ++++++++++++++--
> > > > >  1 file changed, 14 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/us=
b/uvc/uvc_video.c
> > > > > index d6ca383f643e3..af25b9f1b53fe 100644
> > > > > --- a/drivers/media/usb/uvc/uvc_video.c
> > > > > +++ b/drivers/media/usb/uvc/uvc_video.c
> > > > > @@ -768,10 +768,10 @@ void uvc_video_clock_update(struct uvc_stre=
aming *stream,
> > > > >
> > > > >     spin_lock_irqsave(&clock->lock, flags);
> > > > >
> > > > > -   if (clock->count < clock->size)
> > > > > +   if (clock->count < 2)
> > > > >             goto done;
> > > > >
> > > > > -   first =3D &clock->samples[clock->head];
> > > > > +   first =3D &clock->samples[(clock->head - clock->count + clock=
->size) % clock->size];
> > > > >     last =3D &clock->samples[(clock->head - 1 + clock->size) % cl=
ock->size];
> > > > >
> > > > >     /* First step, PTS to SOF conversion. */
> > > > > @@ -786,6 +786,18 @@ void uvc_video_clock_update(struct uvc_strea=
ming *stream,
> > > > >     if (y2 < y1)
> > > > >             y2 +=3D 2048 << 16;
> > > > >
> > > > > +   /*
> > > > > +    * Have at least 1/4 of a second of timestamps before we
> > > > > +    * try to do any calculation. Otherwise we do not have enough
> > > > > +    * precision. This value was determined by running Android CT=
S
> > > > > +    * on different devices.
> > > > > +    *
> > > > > +    * dev_sof runs at 1KHz, and we have a fixed point precision =
of
> > > > > +    * 16 bits.
> > > > > +    */
> > > > > +   if ((y2 - y1) < ((1000 / 4) << 16))
> > > > > +           goto done;
> > > >
> > > > Not a comment for this patch directly, but...
> > > >
> > > > This kind of makes me wonder if we don't want to have some document=
ation
> > > > that specifies what the userspace can expect from the timestamps, s=
o
> > > > that this isn't changed randomly in the future breaking what was fi=
xed
> > > > by this patch.
> > >
> > > I think timestamp handling should really be moved to userspace. It wi=
ll
> > > be easier to handle with floating-point arithmetic there. That would
> > > have been difficult to manage for applications a while ago, but now t=
hat
> > > we have libcamera, we could implement it there. This isn't high on my
> > > todo list though.
> >
> > While indeed that would probably be a better way to handle the complex
> > logic if we designed the driver today, we already have userspace that
> > expects the timestamps to be handled correctly in the kernel. I
> > suspect moving it to the userspace would require some core V4L2
> > changes to define a new timestamp handling mode, where multiple raw
> > hardware timestamps are exposed to the userspace, instead of the high
> > level system monotonic one.
>
> The uvcvideo driver already supports exposing the packet headers to
> userspace through a metadata capture device, so I think we have all the
> components we need. The only missing thing would be the implementation
> in libcamera :-)

Okay, I see. That would make it easier indeed. :)

That said, we still need to provide some valid timestamps in the
v4l2_buffer struct returned from DQBUF, as per the current API
contract, so we can't simply remove the timestamp handling code from
the kernel completely.

