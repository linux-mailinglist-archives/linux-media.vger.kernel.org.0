Return-Path: <linux-media+bounces-12984-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE239049A8
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 05:29:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A39701C22F85
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 03:29:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EB9920332;
	Wed, 12 Jun 2024 03:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Rzw1Gj/0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433B8F4FA
	for <linux-media@vger.kernel.org>; Wed, 12 Jun 2024 03:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718162972; cv=none; b=KK9e4ArVOzG5//9uC85vYubkNVzqje5JEIBqnKXc6mRcKGVaouBnlHEK4TcsG30zMZ+qPBBiuxlUENkjhhvIspvInazN3nPuXhkRqhQiTozl7AgpUz1hTM45t+aj25GnK8KXBsmnhtig/kSglv/ThUeJMd/QEzL1RRJdQIQyXtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718162972; c=relaxed/simple;
	bh=FY9fFF1F7cRvCwX73JSRpuljV2KG6+THYC6d4MhA8ZU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mRH09xCVBJmrmaTjJZmOiVnBgn9ouL0/nk27/gBaqNpQp5LUCPtVQbz7tZ+yLb4bBzEJyHhJaqCH5bl3eRRX2p80SuzGn0eknY9z+1i4pJDDBtcFvs+tGa0DUBEKLTRwbIhZhfgxE9CzMxlQlR+CvQO9+fpgjqYGC1U3vQxfxfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Rzw1Gj/0; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a6f0e153eddso443856266b.0
        for <linux-media@vger.kernel.org>; Tue, 11 Jun 2024 20:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718162968; x=1718767768; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qct4xvMTygFxOfNWaCR3/q2u96535kRB68KKPO3xZ1c=;
        b=Rzw1Gj/0ZofNz5RIVAa2LB5as2e/ZPYVTTmWcYjY4w2aHrOFc7E53VJS5qntvrR4ap
         a1ZaQ73nsJfYT8CNCJq3uu4HOa+/IDAW7SMOVTCuLbdnnjKEykHk1kuPnAsIhE7z0+J6
         bIy+wlzsPEpdcRE3P6M53tP4o2fayoWs6EVRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718162968; x=1718767768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qct4xvMTygFxOfNWaCR3/q2u96535kRB68KKPO3xZ1c=;
        b=hOVr9RYSVUG1HBGSESsaTVOtNEswZS0lvzR7KUuE3D3JhlIMnY2LC557gXMmAB7BaY
         Y2/47p9GKqEk6G8raft+NGyfiINyICxB+n1la0KOnSHo8XVejuvVCAd8FTMKBcw/vZF4
         oFqxCAP8fVIlSw96HasgCzvn9KabUHVCWV4j6gCZuDsD9ymWTc2V+KVlT3+ZQdPXCvHq
         edWztpVqi5EpxADzaSunJ6pX9DMKL2l+3BKZBZJAA9J7kdQuX2dfct3GEWqBnNB3wG5K
         3Yl1b8MmGIEf8+eR4mx31KKiqVb+0PHnMw6PPdTqlxOpMUTsUThOhruuxIcWQx9B8c3O
         56vQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyfGo7k/QmeogJUhueSwOnnMaXQG4VxZovA7htIShKGpy2ACOSO8UVKVsRpHJ5gZQYMfSPr1VPJfgStp5UvPo0+fgp+K05+JWnCe0=
X-Gm-Message-State: AOJu0Yyl4FxHuoguslySqOCnwFLCqXqFp+JgPMkby40o+E/aqeTaFIcb
	us+dM6KGdvU2kJdmMzEWoCavCUyBE4QJMIBdtebqSTYOHLqE5OmNXQyUjp5Zkof7HJNXEDiwQw8
	fIw==
X-Google-Smtp-Source: AGHT+IG5Sf5RrxJtge0AWzinFr9+1WeySmV4iTU5lL5bsXR/CkPRDnSZvXWGmuIMd3H6QMyomZajag==
X-Received: by 2002:a17:906:3398:b0:a6f:173d:36b9 with SMTP id a640c23a62f3a-a6f47f56cf8mr29465266b.16.1718162968073;
        Tue, 11 Jun 2024 20:29:28 -0700 (PDT)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f19171cd0sm385273666b.61.2024.06.11.20.29.25
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jun 2024 20:29:26 -0700 (PDT)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a6e349c0f2bso608969066b.2
        for <linux-media@vger.kernel.org>; Tue, 11 Jun 2024 20:29:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUeNna3x/vLLWMuwO4nFfcNlACC0m55heZqdyFYdWz78i69+ERrjHRiQH/5Zv+noVE6A+Jrk6gJ/S5BEgJXH20Jhf0LWjBL8h4RO5Y=
X-Received: by 2002:a17:906:f206:b0:a6e:fe97:b33a with SMTP id
 a640c23a62f3a-a6f47f938acmr28194866b.29.1718162965328; Tue, 11 Jun 2024
 20:29:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240323-resend-hwtimestamp-v10-0-b08e590d97c7@chromium.org>
 <20240323-resend-hwtimestamp-v10-4-b08e590d97c7@chromium.org>
 <4kck7oedsnj6kfiv7ykwsjg35qodg5bdktu5t5w3xtg2xuscto@2yh6kfdqwimc> <20240610114306.GR18479@pendragon.ideasonboard.com>
In-Reply-To: <20240610114306.GR18479@pendragon.ideasonboard.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 12 Jun 2024 12:28:56 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DAXq6fTrp6jF42URrwzwE+tGz_jJCRM2bhieD76u+QpA@mail.gmail.com>
Message-ID: <CAAFQd5DAXq6fTrp6jF42URrwzwE+tGz_jJCRM2bhieD76u+QpA@mail.gmail.com>
Subject: Re: [PATCH v10 4/6] media: uvcvideo: Allow hw clock updates with
 buffers not full
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"hn.chen" <hn.chen@sunplusit.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 10, 2024 at 8:43=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Wed, May 29, 2024 at 05:03:08PM +0900, Tomasz Figa wrote:
> > On Sat, Mar 23, 2024 at 10:48:05AM +0000, Ricardo Ribalda wrote:
> > > With UVC 1.5 we get as little as one clock sample per frame. Which me=
ans
> > > that it takes 32 frames to move from the software timestamp to the
> > > hardware timestamp method.
> > >
> > > This results in abrupt changes in the timestamping after 32 frames (~=
1
> > > second), resulting in noticeable artifacts when used for encoding.
> > >
> > > With this patch we modify the update algorithm to work with whatever
> > > amount of values are available.
> > >
> > > Tested-by: HungNien Chen <hn.chen@sunplusit.com>
> > > Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > >  drivers/media/usb/uvc/uvc_video.c | 16 ++++++++++++++--
> > >  1 file changed, 14 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uv=
c/uvc_video.c
> > > index d6ca383f643e3..af25b9f1b53fe 100644
> > > --- a/drivers/media/usb/uvc/uvc_video.c
> > > +++ b/drivers/media/usb/uvc/uvc_video.c
> > > @@ -768,10 +768,10 @@ void uvc_video_clock_update(struct uvc_streamin=
g *stream,
> > >
> > >     spin_lock_irqsave(&clock->lock, flags);
> > >
> > > -   if (clock->count < clock->size)
> > > +   if (clock->count < 2)
> > >             goto done;
> > >
> > > -   first =3D &clock->samples[clock->head];
> > > +   first =3D &clock->samples[(clock->head - clock->count + clock->si=
ze) % clock->size];
> > >     last =3D &clock->samples[(clock->head - 1 + clock->size) % clock-=
>size];
> > >
> > >     /* First step, PTS to SOF conversion. */
> > > @@ -786,6 +786,18 @@ void uvc_video_clock_update(struct uvc_streaming=
 *stream,
> > >     if (y2 < y1)
> > >             y2 +=3D 2048 << 16;
> > >
> > > +   /*
> > > +    * Have at least 1/4 of a second of timestamps before we
> > > +    * try to do any calculation. Otherwise we do not have enough
> > > +    * precision. This value was determined by running Android CTS
> > > +    * on different devices.
> > > +    *
> > > +    * dev_sof runs at 1KHz, and we have a fixed point precision of
> > > +    * 16 bits.
> > > +    */
> > > +   if ((y2 - y1) < ((1000 / 4) << 16))
> > > +           goto done;
> >
> > Not a comment for this patch directly, but...
> >
> > This kind of makes me wonder if we don't want to have some documentatio=
n
> > that specifies what the userspace can expect from the timestamps, so
> > that this isn't changed randomly in the future breaking what was fixed
> > by this patch.
>
> I think timestamp handling should really be moved to userspace. It will
> be easier to handle with floating-point arithmetic there. That would
> have been difficult to manage for applications a while ago, but now that
> we have libcamera, we could implement it there. This isn't high on my
> todo list though.

While indeed that would probably be a better way to handle the complex
logic if we designed the driver today, we already have userspace that
expects the timestamps to be handled correctly in the kernel. I
suspect moving it to the userspace would require some core V4L2
changes to define a new timestamp handling mode, where multiple raw
hardware timestamps are exposed to the userspace, instead of the high
level system monotonic one.

Best regards,
Tomasz

