Return-Path: <linux-media+bounces-13008-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF5A904E0E
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 10:23:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A6F02899A3
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 08:23:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C495516D326;
	Wed, 12 Jun 2024 08:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="K32rfSKF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4645C16D324
	for <linux-media@vger.kernel.org>; Wed, 12 Jun 2024 08:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718180582; cv=none; b=hL+CIO9KX5cEeVi/O5H872GjRN26V52/seIOqU6B38udF5AHxt4nb6Isj+pliq97m+waGOJpbyt1H6mTk96oZrRm6GFX0+GYkcZuY8OcuFIkABAuA8esy39s9A3gq7/fl4MgQeH4IWKWhjctryeUJBPUOPY05fidF3C7DeXyFKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718180582; c=relaxed/simple;
	bh=8mA86DWfuGOPsmAy+lnwcIprtJ2vnfz6NcDDA/C5nZM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eFn57yTzYqDKy8laD7HZrsGn46KJw4/4xIGpnQ/jpr5o8Jkb7pIOBzZjXDFADJMJk7Eo7NzFSRvRMLgdS12xYVw4VlbakAYpA6s16mj0QRx8CmzCXG6VrybqtUyYp88IO22y2VYJ5xzlEPmyY0tFG9ObQSJBCLAlgwiV6ll1QT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=K32rfSKF; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52c7fbad011so4575385e87.0
        for <linux-media@vger.kernel.org>; Wed, 12 Jun 2024 01:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718180577; x=1718785377; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wUo56RbRQIIa3LEbYGfCfWvYDe+2sMQ0E/1pRbr4dEk=;
        b=K32rfSKFppQgLYcTbuFNbN3+cThNSeM1tOshn89xn+zupnx+oXeMLfuK44cqc88CUf
         5j/UuWFsYgjxG4dEXwNa1a9n9FDPFQMauagB+rj5OUG1e3sFt0zIvwZ7V3cz3OcCcvFW
         cPJNv2oqXOKZphGvD4TYMxmTsbghX6xFx6asQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718180577; x=1718785377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wUo56RbRQIIa3LEbYGfCfWvYDe+2sMQ0E/1pRbr4dEk=;
        b=lwjOLZ6v5a/xjVMCYzuFpmbggDb9ovd20YWSmLjlTB8yBpRBagZAe2MW8yAa9ojYhZ
         ccEPs/7o8ewA2KIWfWJiTgLPxzGAeVyh6ldIJSHY7/53dnTnnretd8zCHM3Z+qS+Nttd
         Ltjl9kKZEXN0tXuiMP2IUPZ/wzi+2YP9WoHxf4Zsz7zGD4VVZ051MUcXCvDR/COHLbZf
         LKMqpVETpG7N267kHLON083LVRG5Wrt1ACuRI1fkFVJAjRIaA+1hlknQ2iSK9Mno85E9
         dKfhhf7G+8XBud5x9UBBJwy7g8I0mn/6QvzynVTdthUqOM830Zj4qh3Ened4kxLz+3S0
         HxEA==
X-Forwarded-Encrypted: i=1; AJvYcCUt1Z6vjeJXQCnwk1o+EFtBpIuA/JVCDC9Ob48/IKW7geuXUIcQLIpQEkLVmvV5v1t1DrVJiVLifJGvOoC6i9luqNGMdf/ESjkPymQ=
X-Gm-Message-State: AOJu0YwOK64G4oEI1gwWgzToI8nG3KgaPzXRe5ybNSxYI+GDUPfh+7fx
	nniXcwFkiwZkAgAR3gC+SVI+0/Pjw+GzfIRqfCTw4KoJZjh3wVW/mlJIM+IpvViwObRVh0mLYm7
	dHQ==
X-Google-Smtp-Source: AGHT+IEbV8i9PBCb+87iddMQpL5v+S00Jt+1LRfGLJObUd0cXsDydcbmxcYeBUxNK0st5gjvmm40Fg==
X-Received: by 2002:a05:6512:158e:b0:52b:c089:4579 with SMTP id 2adb3069b0e04-52c9a3fcbedmr988522e87.49.1718180577269;
        Wed, 12 Jun 2024 01:22:57 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52c95c38433sm435332e87.286.2024.06.12.01.22.56
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jun 2024 01:22:56 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-57c83100bd6so3950212a12.3
        for <linux-media@vger.kernel.org>; Wed, 12 Jun 2024 01:22:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXH8ut8S/RM2gkYOwPfu0BirqvHlgO7WGfgkiwqyIMu1clPUZ2o9vV3kkxzoom9GYJ8f+s09RE32adITu3qvp8GW2gfVn6B9fiQHPY=
X-Received: by 2002:a17:906:3398:b0:a6f:173d:36b9 with SMTP id
 a640c23a62f3a-a6f47f56cf8mr66734666b.16.1718180575566; Wed, 12 Jun 2024
 01:22:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ae3b6b11-c3ec-4a3d-8fa1-c91ef2f8e151@xs4all.nl>
 <7CB6738E-DADE-4F4D-9501-C701B2F3F2B7@collabora.com> <CAAFQd5Ae7ctMiPWw1=ugeVCFhTJYbNQ_G2xnoOoc-EYRqp4B2A@mail.gmail.com>
 <2326f490-d9dc-4fa9-a9dd-86e56d7ba6d2@xs4all.nl> <20240612095448.1e99b751@coco.lan>
In-Reply-To: <20240612095448.1e99b751@coco.lan>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 12 Jun 2024 17:22:34 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BRJt7HB+=Xc8sq+xj1eLOoeUGnFp=Ndv6WJzcw_39wEg@mail.gmail.com>
Message-ID: <CAAFQd5BRJt7HB+=Xc8sq+xj1eLOoeUGnFp=Ndv6WJzcw_39wEg@mail.gmail.com>
Subject: Re: [ANN] Request for Topics and registration for a Media Summit
 September 16th
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Hidenori Kobayashi <hidenorik@chromium.org>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sean Young <sean@mess.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, Ricardo Ribalda <ribalda@chromium.org>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2024 at 4:54=E2=80=AFPM Mauro Carvalho Chehab
<mchehab@kernel.org> wrote:
>
> Em Wed, 12 Jun 2024 08:46:50 +0200
> Hans Verkuil <hverkuil@xs4all.nl> escreveu:
>
> > On 6/12/24 06:12, Tomasz Figa wrote:
> > > On Wed, May 15, 2024 at 1:19=E2=80=AFAM Daniel Almeida
> > > <daniel.almeida@collabora.com> wrote:
> > >>
> > >> Hi Hans, all,
> > >>
> > >> I=E2=80=99d like to attend in person and discuss the use of Rust in =
the subsystem, especially in light of [0] and [1].
> > >>
> > >> Please note that these are new submissions that are unrelated with w=
hat was discussed last year.
> > >>
> > >> 30 minutes will do.
> > >>
> > >> [0] https://lwn.net/ml/linux-media/20240227215146.46487-1-daniel.alm=
eida@collabora.com/
> > >> [1] https://lwn.net/Articles/970565
> > >
> > > Somewhat related to the topic: I see potential for a quite big
> > > redesign of the videobuf2 framework going forward and recently with
> > > more Rust adoption I'm starting to think it could benefit from being
> > > implemented in Rust, since we would have to rewrite it quite a bit
> > > anyway. Especially since it's a part of the subsystem that has to dea=
l
> > > with memory management, object lifetime and asynchronousness quite a
> > > lot and we had a history of issues there. So it could be interesting
> > > to hear everyone's thoughts.
> >
> > I think it is far too soon to write a framework like that in Rust.
>
> Agreed. I don't object redesigns in C to make it better - which could hav=
e
> some colateral effect of making things easier for a future Rust adoption,
> but such changes should be justified by themselves, and not because of a
> language change.

No, the thought of redesign doesn't come from the language change,
it's the other way around. Since rewriting a lot of the code already,
why not do it in a language that is generally considered better.

>
> See: redesigns at the core will potentially affect lots of drivers,
> so it needs very good technical reasons why doing it. Plus, it requires
> comprehensive tests with different types of hardware/drivers to reduce th=
e
> risk of regressions. Depending on the changes, it may require extra tests
> with devices that are outside complex camera world: radio, analog and dig=
ital
> TV drivers - and even some input devices that use VB2 - to ensure that
> nothing broke.

We don't have to do it in an all-or-nothing way. We can start with an
experimental new implementation in Rust, which could be gradually
tested. It could even be done the same way as the vb -> vb2
transition, although I suspect it wouldn't really be necessary, as I
would like to see it more like a drop-in replacement. In general I
think the API exposed outside of the framework wouldn't really change
that much, it's more about the internal design.

>
> > To be
> > honest, I won't even consider it until Linus officially accepts Rust as=
 a
> > second language in the kernel, instead of as an experiment.
>
> This is not enough: if the core starts to use a second language, all medi=
a
> developers will be affected and will be required to have expertise on suc=
h
> language.

Let's be realistic, how many developers are actively touching vb2 these day=
s?

> That's not something that should happen without careful
> analysis and plans that should include a gradual roll-up, lost of tests
> with the affected drivers including the legacy ones and some strategy to
> quickly solve regression issues.

That said, I agree. It needs proper discussion and planning. That's
why I'm proposing this as a topic. :)
Moreover the redesign itself also needs proper discussion and is more
of a long term goal, not something to land in the next few days.

>
> It is not a matter of what language is better. Instead, it is a matter of
> not affecting code maintenance during the (probably long) transition peri=
od
> and beyond.
>
> If you see the past history, the transition from V4L to V4L2 took more th=
an 10
> years - being possible to be done only with the help of libv4l, plus a
> lot of backward-compat code that we added. Still there were several
> regressions and we even had to quickly patch the Kernel and/or some apps
> that were using the uAPI on different ways.

That's a different situation, because UAPI is involved.

>
> Yet, the transition from VB1 to VB2 was also painful, and took a lot of t=
ime.
>

Yes, vb -> vb2 would be a more appropriate comparison.

> On both cases, there were very good technical reasons for the transition,
> in terms of missing needed features, broken memory models and serious
> troubles that utterly causing VB1 to not work well on non-x86 hardware.
>

It's a very similar situation now, vb2 doesn't work well on modern
hardware, but I still have hopes that it can be fixed without
affecting the driver-facing behavior. (We would probably need to
develop some unit tests that validate the driver-facing behavior to
ensure that.)

> In the end, the authors of the core changes need to acquire legacy hardwa=
re
> and to do lots of driver-specific changes to avoid breaking existing stuf=
f.
> Hans and I had to dedicate a lot of time and efforts on such transitions,
> as it required a lot of work.
>
> I can tell you: there's no fun on such changes: typically, companies won'=
t
> pay someone to do changes on drivers for legacy hardware, specially
> when there are no real benefits, which is the case here, as the final res=
ult
> is just to keep the existing drivers to work with existing hardware,
> usually without any new features. So, the ones behind such core changes
> have to commit fixing drivers usually on their spare time.
>

I don't get that argument. Wouldn't the same apply to any core change?
I think the reason we have driver maintainers is that they can help
with testing. Moreover, we need to invest into testing infrastructure
(which is what people have been doing recently via Media CI) to make
such changes less painful. Otherwise the subsystem will just bit-rot
and become useful for modern use cases.

> > The vb2 framework can certainly use some more work, and esp. better sup=
port
> > for codecs, since that's where the main pain is at the moment.
> >
> > But I would need to see a proper proposal first. I assume that's what y=
ou
> > plan to present?
> >
> > > That said, I wouldn't be able to travel this time unfortunately, so i=
t
> > > would be nice if we could arrange this topic in a time slot friendly
> > > for remote attendance from Japan. Also +Hidenori Kobayashi from my
> > > team who would also be interested in joining remotely.
> >
> > That would mean a slot in the morning, right? Since Japan is 7 hours ah=
ead
> > of CEST.
> >
> > Regards,
> >
> >       Hans
> >
> > >
> > > Best,
> > > Tomasz
> >
>
>
> Thanks,
> Mauro

