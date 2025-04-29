Return-Path: <linux-media+bounces-31334-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A95EFAA117A
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 18:25:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E2993B90A2
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 16:25:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAC9E24395C;
	Tue, 29 Apr 2025 16:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aT4pJcot"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CEEE8BEE
	for <linux-media@vger.kernel.org>; Tue, 29 Apr 2025 16:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745943919; cv=none; b=CFfRF5o4nDbxeF7lpFRpPdTXsgPm5H2beuUDSzbOlRNwufi25VYDr3B2HlZigKjKGzF1QKJ8DrUj5xizwfy2Rv0B69Oy5Aw5KYVO2Pmas5FOyjjkPNmii6xWPvoqV6AzBJjVbAQUhkkKcVEaeyCGeLy4Mn8OHvvZyh9qfTieeLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745943919; c=relaxed/simple;
	bh=zEkqCoMnBAc0Wp+N4g4w9WI69e6AZ3+XFa/FDwoVmJ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nroCCK+IPOPFRIbaoJqES0qohFDZI3TL+hzfQ+IKjAye3Frk7W/onQ5chpaL2/lRkxBPfwjXIY1O7k30iZ7mw8imV1vsnmAWKFaxYbxYG1ujMQ6ICBYGxdjLe27Z39Fk5m/j0bVjLyjqPVxUx/B/YedSvBjQvQ254iAck+P23A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aT4pJcot; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5499614d3d2so6660419e87.3
        for <linux-media@vger.kernel.org>; Tue, 29 Apr 2025 09:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745943914; x=1746548714; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oKOagLWA/kZg/ToUTo4BHkndG6E7DkyiHJdjnSUiHVY=;
        b=aT4pJcot6qxlMjlIaDFOHUd4YCSMFxRjj+EnkhlD53ps2kHf1HvY73vRdyzAshQvGX
         rYOrxpSgHKZwNQ83ckPk9bRtEBA+zcd5/BcA9a1POYiGqTe6eko6C6MGwv09CuKX1+Mt
         r1y0g0HA/CBGY10sBmQdj+RjfjGMhDR6SsqxD9Ax/iT/RsnYBS/uA429um0YcZAgNkj4
         Dz4NYw6IBRG7j4MUSzbO7TXHSXnV6X7h8QyzzlbZXu2t9+QAJHaMSJHsJvzYPAZuLOOQ
         X5NQ4d/D1iJy0Im2l81rkxJsRh4d9TfTt8Ohd1wXQ1iMSRUd6M0urSt0VmLhR3lv5VQK
         ZSGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745943914; x=1746548714;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oKOagLWA/kZg/ToUTo4BHkndG6E7DkyiHJdjnSUiHVY=;
        b=LVWkhSI2veeVJf8VpNWHap6gd5yh4pqjNYur9AYuLQ0UbSwq3xRm9mWfU5YH+FJRVC
         UYxuPFwJh/8mbhNAtXY0f2z/EnnOCscc1x2COHB9zXXsGfqKPDJlRBKg35KMVEsxX770
         GafmV0WxtUEiDh2ALuZoHpV3ECTRKLAZ3CNtH09KleoERNETyQt+fQTyKS+DLUAciMCx
         +q8cXgrzYJedRubc9ogXUD9NaLJ5X5jAX4LGfqAA0h+MoBDPe7GgbeEPjW+sneS2BMzy
         EiCXvnxy4tHlEZf4GtY/KhmhfcGEeB0qV8sdT7Y0eZXZL/gfr7N7LfDwBvRIwzDPilZg
         00LQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLiEhUCczdFley21hdtxHGErRJnggG1uJdcQ1M3G4X0VfkMPELpiYSCfR5d06CiSfbJUy7K+y03Iilnw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwokT7VOVJkkpcZ8WBoyoSGkv5BMPbcvwoPA/Jb5MY/Paq5Kgbw
	hjyhLh/BxEx6cY5lKS0dfQ0ETgD7KTAAy8a/BqTrXg11G0X8eFgmqM11fC+is1MXnfUqWsJ54Fu
	dBTNocG64zHl+pdiQ4gDpL98gf38p+34M9RhnooD2hqSk7s9P
X-Gm-Gg: ASbGncu3vj/SkfXA8LbFvhmleHvVrJdhOBNwB0NmlA0RSP2h6/IhOb7B1MQpWw96d6E
	/YErilCG5dJnjhlyXw0r5hwLDblVcD/hRxEookLIlyiUEJjJZh2+cKwOdeTvINuXR2Bz8bVla0A
	568OT1eFqxmA+umB6uSMH1Ig==
X-Google-Smtp-Source: AGHT+IFz8rD0QJHmc5e9+fFedl8kedVp2EJSv9dtVHgPF6jnpm6m9U4oX5GINjIas2t7Kv1uptEWFoB+brR+qe4jTNY=
X-Received: by 2002:a05:6512:4021:b0:545:2d4d:36de with SMTP id
 2adb3069b0e04-54e9daf7079mr1518766e87.31.1745943913905; Tue, 29 Apr 2025
 09:25:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250422191939.555963-1-jkangas@redhat.com> <20250422191939.555963-3-jkangas@redhat.com>
 <20250424-sassy-cunning-pillbug-ffde51@houat> <CANDhNCqfsUbN3aavAH5hi4wdcKuUkjLX4jqhKzy-q+jCEqpoow@mail.gmail.com>
 <20250425-savvy-chubby-alpaca-0196e3@houat> <CANDhNCroe6ZBtN_o=c71kzFFaWK-fF5rCdnr9P5h1sgPOWSGSw@mail.gmail.com>
 <20250428-greedy-vivid-goldfish-5abb35@houat>
In-Reply-To: <20250428-greedy-vivid-goldfish-5abb35@houat>
From: John Stultz <jstultz@google.com>
Date: Tue, 29 Apr 2025 09:25:00 -0700
X-Gm-Features: ATxdqUG-hdRFM6Y9Ghi7S9yM9T68MXFZrkwlsbB6L0JPOCzRmgrsDsYydEWJg1Q
Message-ID: <CANDhNCqdL7Oha+cGkk0XCZ8shO08ax1rd2k6f9SckuREUdQUjg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dma-buf: heaps: Give default CMA heap a fixed name
To: Maxime Ripard <mripard@kernel.org>
Cc: Jared Kangas <jkangas@redhat.com>, sumit.semwal@linaro.org, 
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, tjmercier@google.com, 
	christian.koenig@amd.com, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 7:52=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
> On Fri, Apr 25, 2025 at 12:39:40PM -0700, John Stultz wrote:
> > To your larger point about policy, I do get the tension that you want
> > to be able to programmatically derive or evaluate heap names, so that
> > applications can consistently derive a pathname to get what they want.
>
> We've discussed it in the past, I don't really want to. But it was clear
> from the last discussion that you (plural) wanted to infer heap
> semantics from the names. I'm ok with that, but then if we want to make
> it work we need to have well defined names.

So my name keeps on getting attached to that, but I don't think I was
involved in the LPC conversation when that got decided.

> And it's actually what I really want to discuss here: we've discussed at
> length how bad the heaps name are (and not only here), but I don't think
> we have any documented policy on what makes a good name?

I very much think having a policy/guidance for better names is a good goal.

I just want to make sure it doesn't become a strict policy that lead
folks to make mistaken assumptions about a static solution being
viable in userland (like folks nostalgicly using "eth0" or a fixed
network device name in scripts expecting it to work on a different
system)

> For example, I'm not sure exposing the allocator name is a good idea:
> it's an implementation detail and for all userspace cares about, we
> could change it every release if it provided the same kind of buffers.

That is a fair point.

> Taking your camera buffers example before, then we could also expose a
> memory region id, and let the platform figure it out, or use the usecase
> as the name.
>
> But if we don't document that, how can we possibly expect everyone
> including downstream to come up with perfect names every time. And FTR,
> I'm willing to write that doc down once the discussion settles.

So again, yeah, I very much support having better guidance on the names.

I think the number of device constraints and device combinations makes
a raw enumeration of things difficult.

This is why the per-device use->heap mapping "glue" seems necessary to me.

And, I do get that this runs into a similar problem with enumerating
and defining "uses" (which boil down to a combination of
devices-in-a-pipeline and access use patterns), but for Andorid it has
so far been manageable.

Personally, I think the best idea I've heard so far to resolve this
from userland was Christian's suggestion that devices expose links to
compatible heaps, and then userland without a use->heap mapping could
for the set of devices they plan to use in a pipeline, figure out the
common heap name and use that to allocate.

However, that pushes the problem down a bit, requiring drivers
(instead of userland) to know what heaps they can work with and what
the names might be (which again, your goal for standardizing the heap
names isn't a bad thing!). Though, this approach also runs into
trouble as it opens a question of: should it only encode strict
constraint satisfaction, or something more subtle, as while something
might work with multiple heaps, its possible it won't be performant
enough unless it picks a specific one on device A or a different one
on device B.  And getting that sort of device-specific details
embedded into a driver isn't great either.

> > But I also think that there is so much variety in both the devices and
> > uses that there is no way that all use cases and all devices can be
> > satisfied with such a static or even programmatic mapping. From my
> > perspective, there just is going to have to be some device specific
> > glue logic that maps use->heap name. Same reason we have fstab and the
> > passwd file.
>
> fstab and passwd can be generated at (first) boot time / install. fstab
> is also being somewhat less important with the auto-partition discovery.
> How would you generate that configuration file at boot?
>
> I'm not really asking this as a theoretical question. Being able to
> auto-discover which heap a driver/device would allocate from is central
> for the cgroup work I mentioned earlier.
>
> And I'm really not sure how distros or applications developpers are
> supposed to keep up with the raw volume of devices that go out every
> year, each and every one of them having different heap names, etc.
> Possibly different from one version of the firmware to another.

For generic distros, I don't have a good answer here. Historically the
focus has always been on single device usage, so having the driver do
the allocation was fine, and if you were using multiple devices you
could just copy the memory between the driver allocated buffers.  But
as we've moved to disaggregated IP blocks and device pipelines, all
those potential copies wreck performance and power.   I'm not sure
generic distros have the concept of a device pipeline very well
abstracted (obviously mesa and the wayland/X have had to deal with it,
and the video and camera side is dealing with it more and more).
Maybe a more established notion of use -> pipeline/device collections,
is needed as a starting point? Then using Christian's suggestion, one
could at least enumerate  use -> heap that would be functional. And
maybe device makers could then supplement explicit optimized mapping
overrides for their device?

I just think leaving individual applications (or even individual
frameworks like mesa) to embed assumptions about heap names ->
functionality is going to be a problematic approach.

thanks
-john

