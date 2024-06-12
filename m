Return-Path: <linux-media+bounces-13014-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1C7904EB3
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 11:02:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9D20289D7D
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 09:02:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72DFC12B89;
	Wed, 12 Jun 2024 09:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="A6+xI3cH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAE516D9A6
	for <linux-media@vger.kernel.org>; Wed, 12 Jun 2024 09:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718182911; cv=none; b=o7E4eI44k9ByMuv6gmFisEucDEDOn3KkZfFDvIgK1j1hoQA9aXZcfG32OrRrCYybFqUH0DukjZIMdMzcHLpN3aAgHJQNnpG5+VR10AVXtkOEIWCQl5JqHwaDwvU2YIuMP2cgYdlh507vHk/5bF3rdwhsy6Qr+tjPoSwal3jl8gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718182911; c=relaxed/simple;
	bh=xqOlwhkZQ2V1oxa+j+hiTLnAK8+TnPPN84bvfMoL4sk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W6GzrjaBoVfMGnEuNROnUTY0kimhoCv/ITxQVDv9ZFF6bo8iiHa97SwMJr3s+QXNFBBo32KcGRwpiCAEy6W4+m8tGgNXxbZO07XY8JeZi8nDpiwDGgrSnqKnN66eiYw45DckBWLiVrjJwzYk1QuRutr4BV0Z4KbgfxCuJP3JHZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=A6+xI3cH; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a6f177b78dcso410408166b.1
        for <linux-media@vger.kernel.org>; Wed, 12 Jun 2024 02:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718182907; x=1718787707; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CjiSdGZpp8Ky5hlHh8PARWoxJweX0pvEsnSwKascdQk=;
        b=A6+xI3cHg/kmyE0MWu6yRON40CoH+t0BdK9Q5N74/KLnJLVSYLejvITEPQE2b4dYPA
         d4cKZ+3+gd9GPkn3hxuOZM0/BvI+puHJLducV7+kf8JqER2sjrnU8TgbEdhD415uMXVU
         /8vjFtJ37CE3M22h/pJNUi5RLzY1ahPtkAZJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718182907; x=1718787707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CjiSdGZpp8Ky5hlHh8PARWoxJweX0pvEsnSwKascdQk=;
        b=at2Tte7n3+RmxrsfDBLm9UyB3QqaR1xAaDngNOF1XaU4zIFUaZ5IWJcTL3XUKlMBOW
         re+3Iux3Mj3BDqHlEzWys+iWUqMVjbfXDC/tBwy+PfzfKTo67xumvrsAA4FmGBj85LKx
         Yxjpz0J2s1x7ugGU2s0FXT5LXUGcZx7fmEiXdZKfdjGT1CckJ9WhIBAIj+QhC27wDpvL
         T1jNoGdWHdWbYQNnQdCFHWTjzJuhYWYuHn7YLtfbGEMMKhfgvNDL2tuLVu28/InujiiR
         I/eUNS8b6f3cwp/TQjDmuc9vLXqh85k8/3P5KiAkECHAesNILjDhTLHRHtjwDWixRGqz
         VDeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzQbNme6RbQfl5oSKBLkkzFdJCfTi344X2/WUw+0udXmvmJXF6A+lSmw1T9Gvye85NlV3idDb0Mz4lnLYF3oC+9VI7P7GIobbKUiw=
X-Gm-Message-State: AOJu0Yxwh5Q7DWM2tZ9ldHg9eAhd7YIm7DucuXJLfnL3Ndl3RsWKCcKL
	SRZ/+hUu1gTO6uOK6O5XHnbPDdmPfG2QUW0f3ek2qwu71/mRykqdJQ5jo00sm2QvfnJYwSgn8Yw
	1/g==
X-Google-Smtp-Source: AGHT+IFQzDPB/N6TKKa0U7hIWydjyku8lM1fMAzziAUv47oWADjNHRpN6gRkPn7Xe2lQ1wvRA3MgPw==
X-Received: by 2002:a17:906:a46:b0:a6f:33b7:6a1f with SMTP id a640c23a62f3a-a6f4800b798mr68358366b.50.1718182907063;
        Wed, 12 Jun 2024 02:01:47 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f0deda4e4sm536685066b.177.2024.06.12.02.01.46
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jun 2024 02:01:46 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a6267778b3aso655657966b.3
        for <linux-media@vger.kernel.org>; Wed, 12 Jun 2024 02:01:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVW0CBC9RkzS0fDEMUPT1CDeqfuxZPrgVTRXgLOuOwZWrmlNTrTTwXYpaxLZe+wU2nvr+24WitxytIo9DhdH9kl6JeF4Bq6b57wvvs=
X-Received: by 2002:a17:906:d297:b0:a5c:dfc2:7239 with SMTP id
 a640c23a62f3a-a6f4801bda1mr68476666b.66.1718182905374; Wed, 12 Jun 2024
 02:01:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ae3b6b11-c3ec-4a3d-8fa1-c91ef2f8e151@xs4all.nl>
 <7CB6738E-DADE-4F4D-9501-C701B2F3F2B7@collabora.com> <CAAFQd5Ae7ctMiPWw1=ugeVCFhTJYbNQ_G2xnoOoc-EYRqp4B2A@mail.gmail.com>
 <2326f490-d9dc-4fa9-a9dd-86e56d7ba6d2@xs4all.nl> <20240612095448.1e99b751@coco.lan>
 <CAAFQd5BRJt7HB+=Xc8sq+xj1eLOoeUGnFp=Ndv6WJzcw_39wEg@mail.gmail.com> <20240612083430.GE28989@pendragon.ideasonboard.com>
In-Reply-To: <20240612083430.GE28989@pendragon.ideasonboard.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 12 Jun 2024 18:01:07 +0900
X-Gmail-Original-Message-ID: <CAAFQd5ApRq4WL_PcGKp+58u64yKfvyxgfCxXxiZjqzSugzV1FA@mail.gmail.com>
Message-ID: <CAAFQd5ApRq4WL_PcGKp+58u64yKfvyxgfCxXxiZjqzSugzV1FA@mail.gmail.com>
Subject: Re: [ANN] Request for Topics and registration for a Media Summit
 September 16th
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Hidenori Kobayashi <hidenorik@chromium.org>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, Sean Young <sean@mess.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, Ricardo Ribalda <ribalda@chromium.org>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2024 at 5:34=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Tomasz,
>
> On Wed, Jun 12, 2024 at 05:22:34PM +0900, Tomasz Figa wrote:
> > On Wed, Jun 12, 2024 at 4:54=E2=80=AFPM Mauro Carvalho Chehab wrote:
> > > Em Wed, 12 Jun 2024 08:46:50 +0200 Hans Verkuil escreveu:
> > > > On 6/12/24 06:12, Tomasz Figa wrote:
> > > > > On Wed, May 15, 2024 at 1:19=E2=80=AFAM Daniel Almeida wrote:
> > > > >>
> > > > >> Hi Hans, all,
> > > > >>
> > > > >> I=E2=80=99d like to attend in person and discuss the use of Rust=
 in the subsystem, especially in light of [0] and [1].
> > > > >>
> > > > >> Please note that these are new submissions that are unrelated wi=
th what was discussed last year.
> > > > >>
> > > > >> 30 minutes will do.
> > > > >>
> > > > >> [0] https://lwn.net/ml/linux-media/20240227215146.46487-1-daniel=
.almeida@collabora.com/
> > > > >> [1] https://lwn.net/Articles/970565
> > > > >
> > > > > Somewhat related to the topic: I see potential for a quite big
> > > > > redesign of the videobuf2 framework going forward and recently wi=
th
> > > > > more Rust adoption I'm starting to think it could benefit from be=
ing
> > > > > implemented in Rust, since we would have to rewrite it quite a bi=
t
> > > > > anyway. Especially since it's a part of the subsystem that has to=
 deal
> > > > > with memory management, object lifetime and asynchronousness quit=
e a
> > > > > lot and we had a history of issues there. So it could be interest=
ing
> > > > > to hear everyone's thoughts.
> > > >
> > > > I think it is far too soon to write a framework like that in Rust.
> > >
> > > Agreed. I don't object redesigns in C to make it better - which could=
 have
> > > some colateral effect of making things easier for a future Rust adopt=
ion,
> > > but such changes should be justified by themselves, and not because o=
f a
> > > language change.
> >
> > No, the thought of redesign doesn't come from the language change,
> > it's the other way around. Since rewriting a lot of the code already,
> > why not do it in a language that is generally considered better.
> >
> > > See: redesigns at the core will potentially affect lots of drivers,
> > > so it needs very good technical reasons why doing it. Plus, it requir=
es
> > > comprehensive tests with different types of hardware/drivers to reduc=
e the
> > > risk of regressions. Depending on the changes, it may require extra t=
ests
> > > with devices that are outside complex camera world: radio, analog and=
 digital
> > > TV drivers - and even some input devices that use VB2 - to ensure tha=
t
> > > nothing broke.
> >
> > We don't have to do it in an all-or-nothing way. We can start with an
> > experimental new implementation in Rust, which could be gradually
> > tested. It could even be done the same way as the vb -> vb2
> > transition, although I suspect it wouldn't really be necessary, as I
> > would like to see it more like a drop-in replacement. In general I
> > think the API exposed outside of the framework wouldn't really change
> > that much, it's more about the internal design.
> >
> > > > To be
> > > > honest, I won't even consider it until Linus officially accepts Rus=
t as a
> > > > second language in the kernel, instead of as an experiment.
> > >
> > > This is not enough: if the core starts to use a second language, all =
media
> > > developers will be affected and will be required to have expertise on=
 such
> > > language.
> >
> > Let's be realistic, how many developers are actively touching vb2 these=
 days?
> >
> > > That's not something that should happen without careful
> > > analysis and plans that should include a gradual roll-up, lost of tes=
ts
> > > with the affected drivers including the legacy ones and some strategy=
 to
> > > quickly solve regression issues.
> >
> > That said, I agree. It needs proper discussion and planning. That's
> > why I'm proposing this as a topic. :)
> > Moreover the redesign itself also needs proper discussion and is more
> > of a long term goal, not something to land in the next few days.
>
> Focussing on this topic, if we're brainstorming memory management for
> media devices, I'd like to throw in a controversial idea. In addition to
> being clearer on the fact that USERPTR is deprecated,

Definitely. This has been long overdue.

>  I would like to
> deprecate MMAP too and only focus on DMABUF. I believe Linux needs a
> centralized buffer allocator, instead of having multiple allocation APIs
> scattered in different places. There are design ideas in gralloc that we
> could benefit from.
>

Given that we now have DMA-buf heaps in mainline, it sounds much more
realistic. It would certainly help eliminate some issues in the vb2
layer, such as vb2-dma-sg having its own open coded page allocation
that can't handle DMA addressing limitations (which can be fixed with
some additions to the DMA API, but eliminating the problem altogether
is way better than any other solution.)

That said, as we already use a centralized DMA-buf allocator in
ChromeOS and don't really care about the MMAP mode, I'm definitely
biased here. We would need to hear from people working on userspace
which still uses it (if there is any).

> > > It is not a matter of what language is better. Instead, it is a matte=
r of
> > > not affecting code maintenance during the (probably long) transition =
period
> > > and beyond.
> > >
> > > If you see the past history, the transition from V4L to V4L2 took mor=
e than 10
> > > years - being possible to be done only with the help of libv4l, plus =
a
> > > lot of backward-compat code that we added. Still there were several
> > > regressions and we even had to quickly patch the Kernel and/or some a=
pps
> > > that were using the uAPI on different ways.
> >
> > That's a different situation, because UAPI is involved.
> >
> > > Yet, the transition from VB1 to VB2 was also painful, and took a lot =
of time.
> >
> > Yes, vb -> vb2 would be a more appropriate comparison.
> >
> > > On both cases, there were very good technical reasons for the transit=
ion,
> > > in terms of missing needed features, broken memory models and serious
> > > troubles that utterly causing VB1 to not work well on non-x86 hardwar=
e.
> >
> > It's a very similar situation now, vb2 doesn't work well on modern
> > hardware, but I still have hopes that it can be fixed without
> > affecting the driver-facing behavior. (We would probably need to
> > develop some unit tests that validate the driver-facing behavior to
> > ensure that.)
> >
> > > In the end, the authors of the core changes need to acquire legacy ha=
rdware
> > > and to do lots of driver-specific changes to avoid breaking existing =
stuff.
> > > Hans and I had to dedicate a lot of time and efforts on such transiti=
ons,
> > > as it required a lot of work.
> > >
> > > I can tell you: there's no fun on such changes: typically, companies =
won't
> > > pay someone to do changes on drivers for legacy hardware, specially
> > > when there are no real benefits, which is the case here, as the final=
 result
> > > is just to keep the existing drivers to work with existing hardware,
> > > usually without any new features. So, the ones behind such core chang=
es
> > > have to commit fixing drivers usually on their spare time.
> >
> > I don't get that argument. Wouldn't the same apply to any core change?
> > I think the reason we have driver maintainers is that they can help
> > with testing. Moreover, we need to invest into testing infrastructure
> > (which is what people have been doing recently via Media CI) to make
> > such changes less painful. Otherwise the subsystem will just bit-rot
> > and become useful for modern use cases.
>
> I've recently seen an increase in people experimenting with sourdough,
> kombucha, kimchi and other fermentation techniques, so rotting isn't
> always negative [*], but I assume you meant useless here, not useful :-)

Yeah, definitely. I'd love it if bit-rotting led to computer software
becoming more useful, but sadly it's rarely the case.

Best regards,
Tomasz

>
> * I'll draw the line at surstr=C3=B6mming.
>
> > > > The vb2 framework can certainly use some more work, and esp. better=
 support
> > > > for codecs, since that's where the main pain is at the moment.
> > > >
> > > > But I would need to see a proper proposal first. I assume that's wh=
at you
> > > > plan to present?
> > > >
> > > > > That said, I wouldn't be able to travel this time unfortunately, =
so it
> > > > > would be nice if we could arrange this topic in a time slot frien=
dly
> > > > > for remote attendance from Japan. Also +Hidenori Kobayashi from m=
y
> > > > > team who would also be interested in joining remotely.
> > > >
> > > > That would mean a slot in the morning, right? Since Japan is 7 hour=
s ahead
> > > > of CEST.
>
> --
> Regards,
>
> Laurent Pinchart

