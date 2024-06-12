Return-Path: <linux-media+bounces-13013-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EE64E904E75
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 10:48:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79097287BC5
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 08:48:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0730F16D4E3;
	Wed, 12 Jun 2024 08:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BfQtPKIb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1150316D33A
	for <linux-media@vger.kernel.org>; Wed, 12 Jun 2024 08:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718182119; cv=none; b=u/vyz5ceTPP67HqGJGnOGgFjc2iBa9bqaNDIOcOryN0eWJXK4+fjxEE12edHm/iQbYN3xsibGT0v06r2b9G7olOBO7JXRGD+eQD8D5e/UZkGzeuIkVb/8ghc9LIOnelEsnHSrT7tQcT9v8ieuQht/AlE6kdtyOjZQZVwSaCTCEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718182119; c=relaxed/simple;
	bh=uW3zlwozbkwBk3Q0UO6Rb/luAmvnclY7u9aDX3Hq14w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aH+426ONsOSVtUl2cKzCVdJkPujQXqb/YopsHQOE9jqwTuMaXN2d4ub30i+Iytrs/xU+3gVY5N/fRp+YRqscUm/yVzmcDqkSljyLJ3BeFsJr1OEO9PAXE6oAcjLGOZw41XjjZ+s3GPommoHbNhDJPvyTQPcOcpu8VTkmSKnfdaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BfQtPKIb; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a6ef793f4b8so481987966b.1
        for <linux-media@vger.kernel.org>; Wed, 12 Jun 2024 01:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718182114; x=1718786914; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jtVbKt1Lt/6TaBr1LN7eGKLsWZLDTjib6uq4q3NlYf0=;
        b=BfQtPKIbv6wbIv3KDR67Bero1oc7umSI3o0oJ2gOxo93mPP0r9VuD4Rg99RYZa2UVi
         hjimtmU4xyYcFukC041DrqHYXSqdphgXD6y0jZMOXINIHvdiHicS8BV76CH6ZKkOrozB
         v+ur5RfrFO653cGlqlQpDmbZlqL1F8UjWGRWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718182114; x=1718786914;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jtVbKt1Lt/6TaBr1LN7eGKLsWZLDTjib6uq4q3NlYf0=;
        b=s1XABX1QafEDVNVADpe3alKnTtEdthTKzvP2sj7iW1jo3vssgY50X1MvKOQXGWIdcf
         tNr61zDYj681VIa+aZnuh8oBZmzDYwW/WpfnuB0FFmw9nU+xsIqNIJUY6lkcZvmpo6jS
         CLgOZge3dF6wuWiDe01wTETrAEBuTfs0+0Wt4tmWEhp+S+p4MhDz2ECZ9U0bL9vZ/yUN
         d5PEmq96hyYlPoyd3vdbIG4dVHyIxmO6wiSGt9KEt37P/QFsGWi0/Jp8b1zrW6luLnoS
         vlWHtb23z3KSWpiuev+NSVLCGPnV6UEUuH31TYR4HyjuU6q7oJRd/nR4MIFpA6vnzfcY
         MbUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZlmTlow02TgC+q2gBgSzYXfQ9ePiBUZ14fDAz5d0x57triSIuM3zKFhYbqVtM8DofMX0c2xjON9q6ItMSKV15j6CEIK89XmIg/9M=
X-Gm-Message-State: AOJu0YxCgHqyWN7ZhO5NuejtBaXai4em3aPNT/Rx1UtqPXDw93ytJoTA
	Hlek+rXSwBXUpTOTwqhUGaNSjtMgERIg/TWBZ+xPXdp8FzWo5kPMMmupSPb68ealQ2P2EnaOnSB
	PjA==
X-Google-Smtp-Source: AGHT+IFtPL1smyvfCTBJsqIaFyXjLcVLRRLHQvxzre0haGsFQEGo/K/ov8wlWSp6swg7t9bWA0LIJA==
X-Received: by 2002:a17:907:7e91:b0:a6f:1400:2e13 with SMTP id a640c23a62f3a-a6f47fd6f50mr81612966b.58.1718182114477;
        Wed, 12 Jun 2024 01:48:34 -0700 (PDT)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6eb5f04dbbsm668731066b.169.2024.06.12.01.48.33
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jun 2024 01:48:33 -0700 (PDT)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a63359aaaa6so932017666b.2
        for <linux-media@vger.kernel.org>; Wed, 12 Jun 2024 01:48:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVjlXvgmFXlZmLCwKYsTo48Gg3T1FhxTJbg3dmJYuv2XNV5PPmiH6l628e7QkeT5jHdkVb55qdjI88QaARbZPRVgfwpKnsNKoBLXNw=
X-Received: by 2002:a17:906:f5a3:b0:a64:722f:4051 with SMTP id
 a640c23a62f3a-a6f47c07d92mr76196066b.0.1718182112798; Wed, 12 Jun 2024
 01:48:32 -0700 (PDT)
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
 <20240612074342.GA28989@pendragon.ideasonboard.com> <CANiDSCuM9RdQ9Tq4-vL2b8UP3_GFV41gvnKm7Gmh2dpmCO98+A@mail.gmail.com>
 <20240612082040.GD28989@pendragon.ideasonboard.com>
In-Reply-To: <20240612082040.GD28989@pendragon.ideasonboard.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 12 Jun 2024 17:47:52 +0900
X-Gmail-Original-Message-ID: <CAAFQd5B8eOkXMY0m=y6A+3MjEny-UMTteBAhAahDWc1y52woWw@mail.gmail.com>
Message-ID: <CAAFQd5B8eOkXMY0m=y6A+3MjEny-UMTteBAhAahDWc1y52woWw@mail.gmail.com>
Subject: Re: [PATCH v10 4/6] media: uvcvideo: Allow hw clock updates with
 buffers not full
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"hn.chen" <hn.chen@sunplusit.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2024 at 5:21=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Wed, Jun 12, 2024 at 09:47:26AM +0200, Ricardo Ribalda wrote:
> > On Wed, 12 Jun 2024 at 09:44, Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> > >
> > > On Wed, Jun 12, 2024 at 12:28:56PM +0900, Tomasz Figa wrote:
> > > > On Mon, Jun 10, 2024 at 8:43=E2=80=AFPM Laurent Pinchart wrote:
> > > > > On Wed, May 29, 2024 at 05:03:08PM +0900, Tomasz Figa wrote:
> > > > > > On Sat, Mar 23, 2024 at 10:48:05AM +0000, Ricardo Ribalda wrote=
:
> > > > > > > With UVC 1.5 we get as little as one clock sample per frame. =
Which means
> > > > > > > that it takes 32 frames to move from the software timestamp t=
o the
> > > > > > > hardware timestamp method.
> > > > > > >
> > > > > > > This results in abrupt changes in the timestamping after 32 f=
rames (~1
> > > > > > > second), resulting in noticeable artifacts when used for enco=
ding.
> > > > > > >
> > > > > > > With this patch we modify the update algorithm to work with w=
hatever
> > > > > > > amount of values are available.
> > > > > > >
> > > > > > > Tested-by: HungNien Chen <hn.chen@sunplusit.com>
> > > > > > > Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> > > > > > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.=
com>
> > > > > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > > > > ---
> > > > > > >  drivers/media/usb/uvc/uvc_video.c | 16 ++++++++++++++--
> > > > > > >  1 file changed, 14 insertions(+), 2 deletions(-)
> > > > > > >
> > > > > > > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/medi=
a/usb/uvc/uvc_video.c
> > > > > > > index d6ca383f643e3..af25b9f1b53fe 100644
> > > > > > > --- a/drivers/media/usb/uvc/uvc_video.c
> > > > > > > +++ b/drivers/media/usb/uvc/uvc_video.c
> > > > > > > @@ -768,10 +768,10 @@ void uvc_video_clock_update(struct uvc_=
streaming *stream,
> > > > > > >
> > > > > > >     spin_lock_irqsave(&clock->lock, flags);
> > > > > > >
> > > > > > > -   if (clock->count < clock->size)
> > > > > > > +   if (clock->count < 2)
> > > > > > >             goto done;
> > > > > > >
> > > > > > > -   first =3D &clock->samples[clock->head];
> > > > > > > +   first =3D &clock->samples[(clock->head - clock->count + c=
lock->size) % clock->size];
> > > > > > >     last =3D &clock->samples[(clock->head - 1 + clock->size) =
% clock->size];
> > > > > > >
> > > > > > >     /* First step, PTS to SOF conversion. */
> > > > > > > @@ -786,6 +786,18 @@ void uvc_video_clock_update(struct uvc_s=
treaming *stream,
> > > > > > >     if (y2 < y1)
> > > > > > >             y2 +=3D 2048 << 16;
> > > > > > >
> > > > > > > +   /*
> > > > > > > +    * Have at least 1/4 of a second of timestamps before we
> > > > > > > +    * try to do any calculation. Otherwise we do not have en=
ough
> > > > > > > +    * precision. This value was determined by running Androi=
d CTS
> > > > > > > +    * on different devices.
> > > > > > > +    *
> > > > > > > +    * dev_sof runs at 1KHz, and we have a fixed point precis=
ion of
> > > > > > > +    * 16 bits.
> > > > > > > +    */
> > > > > > > +   if ((y2 - y1) < ((1000 / 4) << 16))
> > > > > > > +           goto done;
> > > > > >
> > > > > > Not a comment for this patch directly, but...
> > > > > >
> > > > > > This kind of makes me wonder if we don't want to have some docu=
mentation
> > > > > > that specifies what the userspace can expect from the timestamp=
s, so
> > > > > > that this isn't changed randomly in the future breaking what wa=
s fixed
> > > > > > by this patch.
> > > > >
> > > > > I think timestamp handling should really be moved to userspace. I=
t will
> > > > > be easier to handle with floating-point arithmetic there. That wo=
uld
> > > > > have been difficult to manage for applications a while ago, but n=
ow that
> > > > > we have libcamera, we could implement it there. This isn't high o=
n my
> > > > > todo list though.
> > > >
> > > > While indeed that would probably be a better way to handle the comp=
lex
> > > > logic if we designed the driver today, we already have userspace th=
at
> > > > expects the timestamps to be handled correctly in the kernel. I
> > > > suspect moving it to the userspace would require some core V4L2
> > > > changes to define a new timestamp handling mode, where multiple raw
> > > > hardware timestamps are exposed to the userspace, instead of the hi=
gh
> > > > level system monotonic one.
> > >
> > > The uvcvideo driver already supports exposing the packet headers to
> > > userspace through a metadata capture device, so I think we have all t=
he
> > > components we need. The only missing thing would be the implementatio=
n
> > > in libcamera :-)
> >
> > We would still have to duplicate the quirk information in libcamera
> > and the kernel.
>
> Sure, and there will be some level of code duplication. My point is that
> I believe it can be done in userspace, and while small changes to the
> clock handling on the kernel side are fine, if we wanted to change the
> code significantly I think it would be better moved to userspace.

Okay, that sounds much more reasonable. I guess I misunderstood your
original reply, sorry.

Best regards,
Tomasz

> I
> don't have plans to work on this, and I'm not requesting anyone to do so
> either at this point.
>
> --
> Regards,
>
> Laurent Pinchart

