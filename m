Return-Path: <linux-media+bounces-12999-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 363E2904D18
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 09:47:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23AC81C22E1F
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 07:47:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADF6216B753;
	Wed, 12 Jun 2024 07:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jaX7PZYR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5589C1369AF
	for <linux-media@vger.kernel.org>; Wed, 12 Jun 2024 07:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718178466; cv=none; b=EBulHQXPqnISAQ4xHfTT9Yk+f0gLJwM+FPaRqYs/UPtprYkhUqbeMjWBBYFWXI25F80mTSL9G++ZRa9mB4506SnuZf8Yvve5Xtqk0a6srkgHy15kXp5YpoI/7OEhxtdhwckvPT44mZDdIPaUFp4b2DCPKWD8XuG4ZbfXOEQdMvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718178466; c=relaxed/simple;
	bh=+tl9JMqUu0n+y7TzF8Ko462bpmGnHN5qKwZIJDCVbU4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UlOgyYp0l1M6Apvo1yXnRcbL9BMdvm20GivuIpMVDpEpcfjeeU0jz0P+FIPfeonVLnAAD+2kQ/XmYzrzuft9nMWIrYU5jfUUd9SLlycuZ57PJF/LlhgScQuYl+zyy92Y3imAcyAzMkLlMI4zwIUTzDNR8W5abKDDZmJrlSC0m2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jaX7PZYR; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52bc1261f45so5073137e87.0
        for <linux-media@vger.kernel.org>; Wed, 12 Jun 2024 00:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718178462; x=1718783262; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nLdTXN9lYe0a3EsiIXNNLenN6Ja+aPhpUeSTY7jocuk=;
        b=jaX7PZYRr2Ktc3Ao3BIi5Xw92yLS37DI6+uEJaGmMpRlJAq0rlzzQfEkYluwOigUZo
         j87gsAzAHn23OYO806EyzIKT4Tt4J2oK92yqFryng0egZASs/v2kJDGwBwgJjDMOAI0q
         jNLKX1q+33hZhm7wzh6HtahzUy/Etur6kTZew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718178462; x=1718783262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nLdTXN9lYe0a3EsiIXNNLenN6Ja+aPhpUeSTY7jocuk=;
        b=nGvDf4TRTscxsMILUsAc9fH5JXgIwRuwOGrB71BrPLAWlvplhFSdFYSGiEoH4WPHZ7
         XspSRAdpNEX5/Fo6IJdjMLkRoeoEu0szFxJvAZeRMHKzSsUdsDPfJyqtxhEjb+2wR+Yp
         wquSqMttMwVGecT531KOTfwlSYuOEJwuN5yfIDOPxzP4/o+8uzgyCs95+3YlE7lDhDfK
         0Jyx66SSf3pwuJWyq7lhVNg1dgZejb34uqp0Eks8KZXu80WwBsfDxl31ngYogdP5ZHdV
         zeRfaF9Ozks6+BTZtC+c97Cl8D2OzjdUpYsXMLVaVh96MxedPKZPPm6LinrzFlaY4Hb5
         SIeg==
X-Forwarded-Encrypted: i=1; AJvYcCVUiJ3U+hBrlzcmKaK8XPie4qlwmGivoGiDD3MNRr3MTLjwJkOyFAfl08UljMK7JljkUNYRvpuQ/WARoNGntK9uiS2YiQ5AnKVma8E=
X-Gm-Message-State: AOJu0YyCmnOY5UKK/5fyE2Eo81gRYrWcFd69bVpz3OiQs28TfOHdscmM
	hNP5icrOfl80tzccsvzVVBEiSH11O7MGMzDR63USDMUyvj8u4gKUNBpeNVh0kLUZnUVv0isrLfl
	DVuT9
X-Google-Smtp-Source: AGHT+IHhIYrRDsZmLyocBbuOVnsmSp/HM2W9JbRUE6PvGue3GzZuIaAjs6b/rMhl/iwAVRJPHy3SHQ==
X-Received: by 2002:a05:6512:3da5:b0:52b:c0cd:7312 with SMTP id 2adb3069b0e04-52c9a3fca3bmr821266e87.49.1718178462309;
        Wed, 12 Jun 2024 00:47:42 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52bb434dda8sm2360461e87.300.2024.06.12.00.47.41
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jun 2024 00:47:41 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5295e488248so7176613e87.2
        for <linux-media@vger.kernel.org>; Wed, 12 Jun 2024 00:47:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXIBJSQXEdSqW6sc/0lFRZDGOjMO0lmLJyHyNIMRc7XNPdEvRtTkDhA6OKO2DdZsdxky1hLsIxJlXg7VuKIZ7ZMIqqXjQNIHFPx2E0=
X-Received: by 2002:a05:6512:61b:b0:52b:ce2f:5d11 with SMTP id
 2adb3069b0e04-52c9a3c6eb8mr505332e87.25.1718178461142; Wed, 12 Jun 2024
 00:47:41 -0700 (PDT)
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
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 12 Jun 2024 09:47:26 +0200
X-Gmail-Original-Message-ID: <CANiDSCuM9RdQ9Tq4-vL2b8UP3_GFV41gvnKm7Gmh2dpmCO98+A@mail.gmail.com>
Message-ID: <CANiDSCuM9RdQ9Tq4-vL2b8UP3_GFV41gvnKm7Gmh2dpmCO98+A@mail.gmail.com>
Subject: Re: [PATCH v10 4/6] media: uvcvideo: Allow hw clock updates with
 buffers not full
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tomasz Figa <tfiga@chromium.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, "hn.chen" <hn.chen@sunplusit.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Sergey Senozhatsky <senozhatsky@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 12 Jun 2024 at 09:44, Laurent Pinchart
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

We would still have to duplicate the quirk information in libcamera
and the kernel.



>
> --
> Regards,
>
> Laurent Pinchart



--
Ricardo Ribalda

