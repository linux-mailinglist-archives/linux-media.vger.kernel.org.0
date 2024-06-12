Return-Path: <linux-media+bounces-13017-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E25A7904F5F
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 11:34:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5ADAA1F24C06
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 09:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7824C16DEC9;
	Wed, 12 Jun 2024 09:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BjRody7x"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C272DA34
	for <linux-media@vger.kernel.org>; Wed, 12 Jun 2024 09:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718184834; cv=none; b=VFRgCx2zV7xpAyV7zvv5Z/tEJGxwh4KsfWsSvDUFMNvx+4jiVLegsBhdCCuiktsweST14ez2EzZlxnDkvaPGopkK+FBNB8WJUwSp46vt/HjT9L7uTMX2dRXJvJgKZ2BdRdFL7/JzdUdJgx8pArUdeKFKq9KfDJf41aq61qrsTrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718184834; c=relaxed/simple;
	bh=6l/VPwTaTkn9kGZBpsWBG+BqSe2ZN5TAcDJ9oAvZIMY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LZ1yBNZqaZnlTHmZ0zzFjaA+dsq2vfQHyvepuLvhhtvrw+6TpQ+d10eDhmUXyfGABVBJcio5EDzOrk6d4MG5sqhJVaftZpeugsL0l3Bg6mj8W6M2pFw/hr+9dwrx3nh/x0rWaX3EAyWJcOfrNzaUzbT7eFt55RsfPAmc6jnfrS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BjRody7x; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a6f177b78dcso413901766b.1
        for <linux-media@vger.kernel.org>; Wed, 12 Jun 2024 02:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718184830; x=1718789630; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mq40ts2uJkn/LuWXIKlveyUWEzggcAajW9X/S+6gFCo=;
        b=BjRody7xttDAogKJsbSjIs8lcEqGbGYADYdlSALs4iO2oAx955KbwLxNm0FwLeDKwP
         dgyqq91MD9+nLed9GBRhqGUWHt8R10cfDCbqXAY/WO0lkU98TxykUvHFc2CFCF1ERsvy
         +5k9Qokf1U6WtMZg3Jj+krnqN5o2JveXf1WIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718184830; x=1718789630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mq40ts2uJkn/LuWXIKlveyUWEzggcAajW9X/S+6gFCo=;
        b=j42QnQZSkEsxH97EKqG9xjrAgv3pGkKG1CQloV8LCx9shcb/W5HyQdhPOyH1yrmhbk
         Fci35FDcHzHINEmpkRhH5UAYebeNanm4kwtSbNBZZFKm32pYMVK0l2tHsnLOV15KQyuP
         a5+XFYKCGnC9cP2Nl29MVcN51v78UpeTx6w34Lq4BjewM3Z4D9qvuAdWT3eA7tft7Jds
         tHiuYcmZ6rQmAOEMy3PI135lAFWMttNG/f5TWhh4KXAquZ8vmCLWfTfORSAgekboygxF
         hqQbwXv4InHOKhFURIo5kS2d9M1tEUPCposebiWZbPUumLaPUkFOukOGMApzdpRa7xZT
         wy3g==
X-Forwarded-Encrypted: i=1; AJvYcCWO0vwWLbJJ+Xum0yUmHEvFYaCYObQlP/twR5f30n/NmLJA1QxH3RHUDjKxYp9fb0KVRLZr90/60bboS5nN53kOHR9xzWa2Z+SM5RM=
X-Gm-Message-State: AOJu0YyUuKqvYGHnDviY215QGjfWJuVANSJ4j9QvujOozklifT1i8cbg
	cJYfsap4f4U12M4JGWulZn3t/QEXNl2pGC21NCZ2KfmSjRprkbv7DT/Ue0ABqpjeidWMXiBMPDI
	qfA==
X-Google-Smtp-Source: AGHT+IF5j+MWtAdWydzI4XGL1tsMZ8sZ3wuCZzAIUsZMkcBgzYcMKgT9WNStw9KFo+WI34NnMpU+Fw==
X-Received: by 2002:a17:906:b00e:b0:a69:2288:41da with SMTP id a640c23a62f3a-a6f47f7fff2mr70351566b.30.1718184830225;
        Wed, 12 Jun 2024 02:33:50 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f01a060dcsm557874666b.182.2024.06.12.02.33.49
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jun 2024 02:33:49 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a689ad8d1f6so799625566b.2
        for <linux-media@vger.kernel.org>; Wed, 12 Jun 2024 02:33:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXYc0V73MIidWmHQ3CLMOLBNn7tUdvKvILgf7rm39A9rFYQ2/PkHd5IE1PdP+p7gubRWB2nFBxerES/Lit9gGmjALjSNYBZmuzSQfw=
X-Received: by 2002:a17:907:944e:b0:a6f:1231:a8be with SMTP id
 a640c23a62f3a-a6f4800b1b6mr81806066b.53.1718184828883; Wed, 12 Jun 2024
 02:33:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ae3b6b11-c3ec-4a3d-8fa1-c91ef2f8e151@xs4all.nl>
 <7CB6738E-DADE-4F4D-9501-C701B2F3F2B7@collabora.com> <CAAFQd5Ae7ctMiPWw1=ugeVCFhTJYbNQ_G2xnoOoc-EYRqp4B2A@mail.gmail.com>
 <2326f490-d9dc-4fa9-a9dd-86e56d7ba6d2@xs4all.nl> <20240612095448.1e99b751@coco.lan>
 <CAAFQd5BRJt7HB+=Xc8sq+xj1eLOoeUGnFp=Ndv6WJzcw_39wEg@mail.gmail.com>
 <20240612083430.GE28989@pendragon.ideasonboard.com> <CAAFQd5ApRq4WL_PcGKp+58u64yKfvyxgfCxXxiZjqzSugzV1FA@mail.gmail.com>
 <20240612092001.GF28989@pendragon.ideasonboard.com>
In-Reply-To: <20240612092001.GF28989@pendragon.ideasonboard.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 12 Jun 2024 18:33:14 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CLEGJPC7N9U4f2gk2PxzY_-8Zu+GBmnYae9n-Fxtm+9Q@mail.gmail.com>
Message-ID: <CAAFQd5CLEGJPC7N9U4f2gk2PxzY_-8Zu+GBmnYae9n-Fxtm+9Q@mail.gmail.com>
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

On Wed, Jun 12, 2024 at 6:20=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Wed, Jun 12, 2024 at 06:01:07PM +0900, Tomasz Figa wrote:
> > On Wed, Jun 12, 2024 at 5:34=E2=80=AFPM Laurent Pinchart wrote:
> > > On Wed, Jun 12, 2024 at 05:22:34PM +0900, Tomasz Figa wrote:
> > > > On Wed, Jun 12, 2024 at 4:54=E2=80=AFPM Mauro Carvalho Chehab wrote=
:
> > > > > Em Wed, 12 Jun 2024 08:46:50 +0200 Hans Verkuil escreveu:
> > > > > > On 6/12/24 06:12, Tomasz Figa wrote:
> > > > > > > On Wed, May 15, 2024 at 1:19=E2=80=AFAM Daniel Almeida wrote:
> > > > > > >>
> > > > > > >> Hi Hans, all,
> > > > > > >>
> > > > > > >> I=E2=80=99d like to attend in person and discuss the use of =
Rust in the subsystem, especially in light of [0] and [1].
> > > > > > >>
> > > > > > >> Please note that these are new submissions that are unrelate=
d with what was discussed last year.
> > > > > > >>
> > > > > > >> 30 minutes will do.
> > > > > > >>
> > > > > > >> [0] https://lwn.net/ml/linux-media/20240227215146.46487-1-da=
niel.almeida@collabora.com/
> > > > > > >> [1] https://lwn.net/Articles/970565
> > > > > > >
> > > > > > > Somewhat related to the topic: I see potential for a quite bi=
g
> > > > > > > redesign of the videobuf2 framework going forward and recentl=
y with
> > > > > > > more Rust adoption I'm starting to think it could benefit fro=
m being
> > > > > > > implemented in Rust, since we would have to rewrite it quite =
a bit
> > > > > > > anyway. Especially since it's a part of the subsystem that ha=
s to deal
> > > > > > > with memory management, object lifetime and asynchronousness =
quite a
> > > > > > > lot and we had a history of issues there. So it could be inte=
resting
> > > > > > > to hear everyone's thoughts.
> > > > > >
> > > > > > I think it is far too soon to write a framework like that in Ru=
st.
> > > > >
> > > > > Agreed. I don't object redesigns in C to make it better - which c=
ould have
> > > > > some colateral effect of making things easier for a future Rust a=
doption,
> > > > > but such changes should be justified by themselves, and not becau=
se of a
> > > > > language change.
> > > >
> > > > No, the thought of redesign doesn't come from the language change,
> > > > it's the other way around. Since rewriting a lot of the code alread=
y,
> > > > why not do it in a language that is generally considered better.
> > > >
> > > > > See: redesigns at the core will potentially affect lots of driver=
s,
> > > > > so it needs very good technical reasons why doing it. Plus, it re=
quires
> > > > > comprehensive tests with different types of hardware/drivers to r=
educe the
> > > > > risk of regressions. Depending on the changes, it may require ext=
ra tests
> > > > > with devices that are outside complex camera world: radio, analog=
 and digital
> > > > > TV drivers - and even some input devices that use VB2 - to ensure=
 that
> > > > > nothing broke.
> > > >
> > > > We don't have to do it in an all-or-nothing way. We can start with =
an
> > > > experimental new implementation in Rust, which could be gradually
> > > > tested. It could even be done the same way as the vb -> vb2
> > > > transition, although I suspect it wouldn't really be necessary, as =
I
> > > > would like to see it more like a drop-in replacement. In general I
> > > > think the API exposed outside of the framework wouldn't really chan=
ge
> > > > that much, it's more about the internal design.
> > > >
> > > > > > To be
> > > > > > honest, I won't even consider it until Linus officially accepts=
 Rust as a
> > > > > > second language in the kernel, instead of as an experiment.
> > > > >
> > > > > This is not enough: if the core starts to use a second language, =
all media
> > > > > developers will be affected and will be required to have expertis=
e on such
> > > > > language.
> > > >
> > > > Let's be realistic, how many developers are actively touching vb2 t=
hese days?
> > > >
> > > > > That's not something that should happen without careful
> > > > > analysis and plans that should include a gradual roll-up, lost of=
 tests
> > > > > with the affected drivers including the legacy ones and some stra=
tegy to
> > > > > quickly solve regression issues.
> > > >
> > > > That said, I agree. It needs proper discussion and planning. That's
> > > > why I'm proposing this as a topic. :)
> > > > Moreover the redesign itself also needs proper discussion and is mo=
re
> > > > of a long term goal, not something to land in the next few days.
> > >
> > > Focussing on this topic, if we're brainstorming memory management for
> > > media devices, I'd like to throw in a controversial idea. In addition=
 to
> > > being clearer on the fact that USERPTR is deprecated,
> >
> > Definitely. This has been long overdue.
> >
> > >  I would like to
> > > deprecate MMAP too and only focus on DMABUF. I believe Linux needs a
> > > centralized buffer allocator, instead of having multiple allocation A=
PIs
> > > scattered in different places. There are design ideas in gralloc that=
 we
> > > could benefit from.
> >
> > Given that we now have DMA-buf heaps in mainline, it sounds much more
> > realistic. It would certainly help eliminate some issues in the vb2
> > layer, such as vb2-dma-sg having its own open coded page allocation
> > that can't handle DMA addressing limitations (which can be fixed with
> > some additions to the DMA API, but eliminating the problem altogether
> > is way better than any other solution.)
>
> There are (at least) two issues we'll have to solve to make DMA heaps
> more universally usable:
>
> - Memory allocation from DMA heaps isn't accounted in the process
>   resource limits. This is one of the blockers for getting distributions
>   to enable the heaps. We'll have to fix that.

I think the same applies to MMAP buffers today or am I missing something?

That said, it's something that has to be fixed anyway. DMA heaps would
make it easier to fix, since we would have one central place where the
accounting could be implemented.

>
> - We need a userspace library to pick the right heap based on the memory
>   constraints of the devices that you'll want to share the buffer with.
>   This will require exposing those constraints to userspace somehow.

That is not a new problem either. Today with MMAP we also need the
userspace to somehow choose the right exporter. So we could start with
each video node pointing to the right heap (probably for each plane
separately?), which would provide the same level of functionality as
with MMAP today, but using a uniform API and a central implementation
in the kernel.

Then we could follow up with exposing more information, if needed, to
help the userspace make a more informed decision.

>
> I'm sure there will be more issues, but solving issues is what we do :-)
>
> > That said, as we already use a centralized DMA-buf allocator in
> > ChromeOS and don't really care about the MMAP mode, I'm definitely
> > biased here. We would need to hear from people working on userspace
> > which still uses it (if there is any).
> >
> > > > > It is not a matter of what language is better. Instead, it is a m=
atter of
> > > > > not affecting code maintenance during the (probably long) transit=
ion period
> > > > > and beyond.
> > > > >
> > > > > If you see the past history, the transition from V4L to V4L2 took=
 more than 10
> > > > > years - being possible to be done only with the help of libv4l, p=
lus a
> > > > > lot of backward-compat code that we added. Still there were sever=
al
> > > > > regressions and we even had to quickly patch the Kernel and/or so=
me apps
> > > > > that were using the uAPI on different ways.
> > > >
> > > > That's a different situation, because UAPI is involved.
> > > >
> > > > > Yet, the transition from VB1 to VB2 was also painful, and took a =
lot of time.
> > > >
> > > > Yes, vb -> vb2 would be a more appropriate comparison.
> > > >
> > > > > On both cases, there were very good technical reasons for the tra=
nsition,
> > > > > in terms of missing needed features, broken memory models and ser=
ious
> > > > > troubles that utterly causing VB1 to not work well on non-x86 har=
dware.
> > > >
> > > > It's a very similar situation now, vb2 doesn't work well on modern
> > > > hardware, but I still have hopes that it can be fixed without
> > > > affecting the driver-facing behavior. (We would probably need to
> > > > develop some unit tests that validate the driver-facing behavior to
> > > > ensure that.)
> > > >
> > > > > In the end, the authors of the core changes need to acquire legac=
y hardware
> > > > > and to do lots of driver-specific changes to avoid breaking exist=
ing stuff.
> > > > > Hans and I had to dedicate a lot of time and efforts on such tran=
sitions,
> > > > > as it required a lot of work.
> > > > >
> > > > > I can tell you: there's no fun on such changes: typically, compan=
ies won't
> > > > > pay someone to do changes on drivers for legacy hardware, special=
ly
> > > > > when there are no real benefits, which is the case here, as the f=
inal result
> > > > > is just to keep the existing drivers to work with existing hardwa=
re,
> > > > > usually without any new features. So, the ones behind such core c=
hanges
> > > > > have to commit fixing drivers usually on their spare time.
> > > >
> > > > I don't get that argument. Wouldn't the same apply to any core chan=
ge?
> > > > I think the reason we have driver maintainers is that they can help
> > > > with testing. Moreover, we need to invest into testing infrastructu=
re
> > > > (which is what people have been doing recently via Media CI) to mak=
e
> > > > such changes less painful. Otherwise the subsystem will just bit-ro=
t
> > > > and become useful for modern use cases.
> > >
> > > I've recently seen an increase in people experimenting with sourdough=
,
> > > kombucha, kimchi and other fermentation techniques, so rotting isn't
> > > always negative [*], but I assume you meant useless here, not useful =
:-)
> >
> > Yeah, definitely. I'd love it if bit-rotting led to computer software
> > becoming more useful, but sadly it's rarely the case.
> >
> > > * I'll draw the line at surstr=C3=B6mming.
> > >
> > > > > > The vb2 framework can certainly use some more work, and esp. be=
tter support
> > > > > > for codecs, since that's where the main pain is at the moment.
> > > > > >
> > > > > > But I would need to see a proper proposal first. I assume that'=
s what you
> > > > > > plan to present?
> > > > > >
> > > > > > > That said, I wouldn't be able to travel this time unfortunate=
ly, so it
> > > > > > > would be nice if we could arrange this topic in a time slot f=
riendly
> > > > > > > for remote attendance from Japan. Also +Hidenori Kobayashi fr=
om my
> > > > > > > team who would also be interested in joining remotely.
> > > > > >
> > > > > > That would mean a slot in the morning, right? Since Japan is 7 =
hours ahead
> > > > > > of CEST.
>
> --
> Regards,
>
> Laurent Pinchart

