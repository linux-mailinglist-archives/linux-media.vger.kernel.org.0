Return-Path: <linux-media+bounces-13153-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB5A9064C4
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 09:18:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 227F11F22721
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 07:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16D9D5914A;
	Thu, 13 Jun 2024 07:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cMLnEj0D"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9F07FB
	for <linux-media@vger.kernel.org>; Thu, 13 Jun 2024 07:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718263089; cv=none; b=feP/MHcJri3gx/yk4/M4VNnggV6ghskUdqL4GLAFr/OcCK/tcb0xOFZzqNL3ArI+sol4vsf4WmJGaC4AmwoTHn99Ojh63bpojIrG/K0nUjc8obwV0VHRJJflBwSnwcigd6m9BGtyAvdy05jCTBmKzCNLDZwI5U2hNanPoLEGGcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718263089; c=relaxed/simple;
	bh=NFawOIOeqbwWu2fa4TqTDPulab2QTDHj8kkh2xmnCE8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ObKpnHZnZYSxkSQ8vGasTHvg7E50sKdZZiSQQcRUY3xC8OVLFp4Dg2SDXHH6qgMzrfLH6RU4M7tLiFN7cO34cd06sYnqidEeEmUVKdnn1qcRi+WvQom1krr+JC1gibK6MKmtJsQ1fffVXmax2IvzgtzQS9tcGKPF0k6qpcZ0zLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cMLnEj0D; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2eaafda3b5cso7195461fa.3
        for <linux-media@vger.kernel.org>; Thu, 13 Jun 2024 00:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718263086; x=1718867886; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xaYYAKTToc1G3rzx2GP+97vvyi6uy2puQme5ScL1rHI=;
        b=cMLnEj0DBVvVNSu2fZ46u7+SSKXq/HTBkZi6XWe58dkXeTrC+bvJZo4A6ToQ5Lr7LG
         /QuzAFTxfxAK97oIoHjq4C8DlSx7OqjMpivqR67BVa29nrpILQ2DSne57IawG3wXHltp
         R46rEg/62tpImClni42v+QY+64xXS7B/5qEyA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718263086; x=1718867886;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xaYYAKTToc1G3rzx2GP+97vvyi6uy2puQme5ScL1rHI=;
        b=YTiwl4ajw+aUIDK7DRoJ7JD0klmJVLV0aH8uYAcCWFmYv5z1jS8uvVHD/yAnuSXP65
         oEBrMVpTjxXdNhmfOl1QTZY7KhIjeyDPaRROMaxeU78btyxhiY2hU3y7jhL+1kf57cvE
         7TEDq24vfF80OmcD/F5vgTSVPLqduTwdRB55LZG1kzbSdX+DOh84okNq+9r2ziBd7FTo
         hpyOHG7peOBzxZLnlzrLncD+XyjVwIkkdfwo30eId3tOncPNqGJwGJ0D0gpCwK8oCTFk
         2V5oTpaHTXybkQvjyIY7oqXyILF67w7Sm3rdQCHWAVot4JDISOFI9dT+NaHiWkJsDqqL
         bD1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXYiumRUrspCd5tRASuGY99ZpfxA3+g6snVzz/UAJo3OV0HjgXxw6OHuJIgKFPvw9F00hUc0kjG34faiOuWwIUXnwluItdnCpW4C1c=
X-Gm-Message-State: AOJu0Yz31FugWUdiNL9M9tcHcN060PK0FlzLrD5sXtXerQzRC6rPD4C+
	dmefR76JLLeAP7jxe9FN7GtJzjCdBVrlF1M2hkItO1SdNArlK09BPz439KTTyE50kYZw8KN0Kgk
	rj/P4P7c4td4JinWAWFiA8TTSGzNQkpZnDLJB
X-Google-Smtp-Source: AGHT+IF2SOjxD36qgdVi0HXHMkd3S6E5iOu9IelmHMNCNHqV+dLgmmhjl9dhQKA2mwdmg6RCJcUogH/yvdNodQU5Wj0=
X-Received: by 2002:a2e:9105:0:b0:2ea:e751:fef4 with SMTP id
 38308e7fff4ca-2ebfc92b9e2mr21733361fa.20.1718263085470; Thu, 13 Jun 2024
 00:18:05 -0700 (PDT)
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
In-Reply-To: <CAAFQd5ApRq4WL_PcGKp+58u64yKfvyxgfCxXxiZjqzSugzV1FA@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 13 Jun 2024 15:17:53 +0800
Message-ID: <CAGXv+5FrLyhEqZEm8w6sqm9ZX+=N_x6vgLaG4HYbuK_f4XMvhg@mail.gmail.com>
Subject: Re: [ANN] Request for Topics and registration for a Media Summit
 September 16th
To: Tomasz Figa <tfiga@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Hidenori Kobayashi <hidenorik@chromium.org>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, Sean Young <sean@mess.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, Ricardo Ribalda <ribalda@chromium.org>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2024 at 5:02=E2=80=AFPM Tomasz Figa <tfiga@chromium.org> wr=
ote:
>
> On Wed, Jun 12, 2024 at 5:34=E2=80=AFPM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > Hi Tomasz,
> >
> > On Wed, Jun 12, 2024 at 05:22:34PM +0900, Tomasz Figa wrote:
> > > On Wed, Jun 12, 2024 at 4:54=E2=80=AFPM Mauro Carvalho Chehab wrote:
> > > > Em Wed, 12 Jun 2024 08:46:50 +0200 Hans Verkuil escreveu:
> > > > > On 6/12/24 06:12, Tomasz Figa wrote:
> > > > > > On Wed, May 15, 2024 at 1:19=E2=80=AFAM Daniel Almeida wrote:
> > > > > >>
> > > > > >> Hi Hans, all,
> > > > > >>
> > > > > >> I=E2=80=99d like to attend in person and discuss the use of Ru=
st in the subsystem, especially in light of [0] and [1].
> > > > > >>
> > > > > >> Please note that these are new submissions that are unrelated =
with what was discussed last year.
> > > > > >>
> > > > > >> 30 minutes will do.
> > > > > >>
> > > > > >> [0] https://lwn.net/ml/linux-media/20240227215146.46487-1-dani=
el.almeida@collabora.com/
> > > > > >> [1] https://lwn.net/Articles/970565
> > > > > >
> > > > > > Somewhat related to the topic: I see potential for a quite big
> > > > > > redesign of the videobuf2 framework going forward and recently =
with
> > > > > > more Rust adoption I'm starting to think it could benefit from =
being
> > > > > > implemented in Rust, since we would have to rewrite it quite a =
bit
> > > > > > anyway. Especially since it's a part of the subsystem that has =
to deal
> > > > > > with memory management, object lifetime and asynchronousness qu=
ite a
> > > > > > lot and we had a history of issues there. So it could be intere=
sting
> > > > > > to hear everyone's thoughts.
> > > > >
> > > > > I think it is far too soon to write a framework like that in Rust=
.
> > > >
> > > > Agreed. I don't object redesigns in C to make it better - which cou=
ld have
> > > > some colateral effect of making things easier for a future Rust ado=
ption,
> > > > but such changes should be justified by themselves, and not because=
 of a
> > > > language change.
> > >
> > > No, the thought of redesign doesn't come from the language change,
> > > it's the other way around. Since rewriting a lot of the code already,
> > > why not do it in a language that is generally considered better.
> > >
> > > > See: redesigns at the core will potentially affect lots of drivers,
> > > > so it needs very good technical reasons why doing it. Plus, it requ=
ires
> > > > comprehensive tests with different types of hardware/drivers to red=
uce the
> > > > risk of regressions. Depending on the changes, it may require extra=
 tests
> > > > with devices that are outside complex camera world: radio, analog a=
nd digital
> > > > TV drivers - and even some input devices that use VB2 - to ensure t=
hat
> > > > nothing broke.
> > >
> > > We don't have to do it in an all-or-nothing way. We can start with an
> > > experimental new implementation in Rust, which could be gradually
> > > tested. It could even be done the same way as the vb -> vb2
> > > transition, although I suspect it wouldn't really be necessary, as I
> > > would like to see it more like a drop-in replacement. In general I
> > > think the API exposed outside of the framework wouldn't really change
> > > that much, it's more about the internal design.
> > >
> > > > > To be
> > > > > honest, I won't even consider it until Linus officially accepts R=
ust as a
> > > > > second language in the kernel, instead of as an experiment.
> > > >
> > > > This is not enough: if the core starts to use a second language, al=
l media
> > > > developers will be affected and will be required to have expertise =
on such
> > > > language.
> > >
> > > Let's be realistic, how many developers are actively touching vb2 the=
se days?
> > >
> > > > That's not something that should happen without careful
> > > > analysis and plans that should include a gradual roll-up, lost of t=
ests
> > > > with the affected drivers including the legacy ones and some strate=
gy to
> > > > quickly solve regression issues.
> > >
> > > That said, I agree. It needs proper discussion and planning. That's
> > > why I'm proposing this as a topic. :)
> > > Moreover the redesign itself also needs proper discussion and is more
> > > of a long term goal, not something to land in the next few days.
> >
> > Focussing on this topic, if we're brainstorming memory management for
> > media devices, I'd like to throw in a controversial idea. In addition t=
o
> > being clearer on the fact that USERPTR is deprecated,
>
> Definitely. This has been long overdue.
>
> >  I would like to
> > deprecate MMAP too and only focus on DMABUF. I believe Linux needs a
> > centralized buffer allocator, instead of having multiple allocation API=
s
> > scattered in different places. There are design ideas in gralloc that w=
e
> > could benefit from.
> >
>
> Given that we now have DMA-buf heaps in mainline, it sounds much more
> realistic. It would certainly help eliminate some issues in the vb2
> layer, such as vb2-dma-sg having its own open coded page allocation
> that can't handle DMA addressing limitations (which can be fixed with
> some additions to the DMA API, but eliminating the problem altogether
> is way better than any other solution.)
>
> That said, as we already use a centralized DMA-buf allocator in
> ChromeOS and don't really care about the MMAP mode, I'm definitely
> biased here. We would need to hear from people working on userspace
> which still uses it (if there is any).

That's not entirely true. In the decode path, if a post-processor is
needed (mostly for detiling), then the decoder capture buffers are
allocated with the MMAP mode.


ChenYu

> > > > It is not a matter of what language is better. Instead, it is a mat=
ter of
> > > > not affecting code maintenance during the (probably long) transitio=
n period
> > > > and beyond.
> > > >
> > > > If you see the past history, the transition from V4L to V4L2 took m=
ore than 10
> > > > years - being possible to be done only with the help of libv4l, plu=
s a
> > > > lot of backward-compat code that we added. Still there were several
> > > > regressions and we even had to quickly patch the Kernel and/or some=
 apps
> > > > that were using the uAPI on different ways.
> > >
> > > That's a different situation, because UAPI is involved.
> > >
> > > > Yet, the transition from VB1 to VB2 was also painful, and took a lo=
t of time.
> > >
> > > Yes, vb -> vb2 would be a more appropriate comparison.
> > >
> > > > On both cases, there were very good technical reasons for the trans=
ition,
> > > > in terms of missing needed features, broken memory models and serio=
us
> > > > troubles that utterly causing VB1 to not work well on non-x86 hardw=
are.
> > >
> > > It's a very similar situation now, vb2 doesn't work well on modern
> > > hardware, but I still have hopes that it can be fixed without
> > > affecting the driver-facing behavior. (We would probably need to
> > > develop some unit tests that validate the driver-facing behavior to
> > > ensure that.)
> > >
> > > > In the end, the authors of the core changes need to acquire legacy =
hardware
> > > > and to do lots of driver-specific changes to avoid breaking existin=
g stuff.
> > > > Hans and I had to dedicate a lot of time and efforts on such transi=
tions,
> > > > as it required a lot of work.
> > > >
> > > > I can tell you: there's no fun on such changes: typically, companie=
s won't
> > > > pay someone to do changes on drivers for legacy hardware, specially
> > > > when there are no real benefits, which is the case here, as the fin=
al result
> > > > is just to keep the existing drivers to work with existing hardware=
,
> > > > usually without any new features. So, the ones behind such core cha=
nges
> > > > have to commit fixing drivers usually on their spare time.
> > >
> > > I don't get that argument. Wouldn't the same apply to any core change=
?
> > > I think the reason we have driver maintainers is that they can help
> > > with testing. Moreover, we need to invest into testing infrastructure
> > > (which is what people have been doing recently via Media CI) to make
> > > such changes less painful. Otherwise the subsystem will just bit-rot
> > > and become useful for modern use cases.
> >
> > I've recently seen an increase in people experimenting with sourdough,
> > kombucha, kimchi and other fermentation techniques, so rotting isn't
> > always negative [*], but I assume you meant useless here, not useful :-=
)
>
> Yeah, definitely. I'd love it if bit-rotting led to computer software
> becoming more useful, but sadly it's rarely the case.
>
> Best regards,
> Tomasz
>
> >
> > * I'll draw the line at surstr=C3=B6mming.
> >
> > > > > The vb2 framework can certainly use some more work, and esp. bett=
er support
> > > > > for codecs, since that's where the main pain is at the moment.
> > > > >
> > > > > But I would need to see a proper proposal first. I assume that's =
what you
> > > > > plan to present?
> > > > >
> > > > > > That said, I wouldn't be able to travel this time unfortunately=
, so it
> > > > > > would be nice if we could arrange this topic in a time slot fri=
endly
> > > > > > for remote attendance from Japan. Also +Hidenori Kobayashi from=
 my
> > > > > > team who would also be interested in joining remotely.
> > > > >
> > > > > That would mean a slot in the morning, right? Since Japan is 7 ho=
urs ahead
> > > > > of CEST.
> >
> > --
> > Regards,
> >
> > Laurent Pinchart
>

