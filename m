Return-Path: <linux-media+bounces-26583-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E756FA3F6E5
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 15:12:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C104817E698
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 14:12:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0546320E6FA;
	Fri, 21 Feb 2025 14:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b="BUi9cF2+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F6720C48B
	for <linux-media@vger.kernel.org>; Fri, 21 Feb 2025 14:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740147142; cv=none; b=qFKCO0cbjdhBVbJyJiH50Okg+M/MZjomQT1dMwKJl8XQbVypD0uoRYTvHHpbEnHxNtlB8JL73i9SzF+ivEGiSUecbTRipK7HP8yEWFP29qMKwH2yE0amDDLL41GB2tFvRm4Brb5xU29lnyNjVdErqYlBmOjcJTbwG+/dO0xg8/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740147142; c=relaxed/simple;
	bh=c0w7UdT7ZWmCjWsO5qjgXEeM8ReRbGDdHyMSS6JxZvs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pwYfzw38JlwtXA77KbpajDLDBn/eBOWBiubE5zEGXtR9hZNf/U42EuUyCLbm3Zdg6NRPRQ2vsOQJcQ6JdEwUiPtcyJlyM5uAuabGVbQT8CPbch4dCrikuWTRt1oSLZ2HBZDkYl4c24ae4vT0UwKLLyTUYX2STF49YqvHc0HC2kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org; spf=pass smtp.mailfrom=fooishbar.org; dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b=BUi9cF2+; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7c0b24cc566so175955885a.1
        for <linux-media@vger.kernel.org>; Fri, 21 Feb 2025 06:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1740147139; x=1740751939; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m9yE+NbJbzuXxkBEw/1a0dtqEVxR7Jj4LrNBop/jhXU=;
        b=BUi9cF2+dvIm3/U1zP+HvTbRQBeR/OCsnRnsq3fMgP12Y8IGRZ2DaeIjisHXFJkLzQ
         XrojHNJSt/z3j9Me4569WlmsXz8IPuKxEdElZlZ/dFqudJUoIifwfIiZnJXYOg8JZitx
         0uaKDN7obl1YqX7SJpAfALGiFgP8xX8s7qVL8+LJX7p8+qawnK/ZxMLtBxvPdEk4SY9R
         6lTkmjaBzhpag4xZzeMK9hWCGnXe+hB7nR+nH2KD7crg9GgAF5pE2dJdysoBrq2IRCaM
         KIVCqiPFKPnXeK610WOrheTa3HUxOaWNBbny1pS6otxHqa8MDYBkPpoGudMul3haP5T+
         P6Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740147139; x=1740751939;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m9yE+NbJbzuXxkBEw/1a0dtqEVxR7Jj4LrNBop/jhXU=;
        b=G1ckMWMnmxVuyLnC7KGryeqU0LwiUMyAzvYu9C+ZGn+bJ86xlhWNzPusjkkqmZ6Dll
         eAflXfe5Lukee3qyxNr6SkGEDKWFv74MlMeLnclBieyjmVm7CYu+UJECWaFqu3E8WXfd
         TshVzMv86vNYB2lTiwiuW82h0yA9ABoAL+cHmNIuNv2o5DX+v2W/xLuZOt9EkoP3nJyr
         H10sipkcaZL+KgVqSl+CQbqN9a+ZT0sxI8hcYSNBj/LnA+wnymGJ4eDZ2eXzhv/9OzRx
         MPbQov+VEKkfRWVZZdlehlvznlsK1SqPy46qfOyk1S+vtP6cnXeZty4KktOaqSAEEtJN
         tLLA==
X-Forwarded-Encrypted: i=1; AJvYcCXnpE8JO/GAD3ZrzFg0jG+qHK39RpZha/XmX4G+EPckvK64+oDG2ZSb2eFONE6BEW5kPa9rINTJKODNDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVzgiE77d5oMMkJZk5iA0w8hvGM+fh8SniF+M/P0anYBoWnwTL
	XBhDHlb2QA+LOXRvnlfEOQkk0DszAXKfe8kwwYJCQlplVKEBK06wriXY5b5EIY0q6qWHp4C1+WS
	aXyNc3ZXr6/HYkzlJAL1CXuaSJileEyaEKhwmYA==
X-Gm-Gg: ASbGnctltvqYKTwYjfhXCeTMRF2+br8kRadxdwI1FQkhHpWa7EgnD0smarFLsYl6FHF
	KzJAKPR2Aks8zD6+Kw/B2We+hvwvmI3ZJo9oMDph9T4n0s33lWF9H2+WhEKS19tvXImlKhSwCOu
	gU0DjtLA==
X-Google-Smtp-Source: AGHT+IFieBNTxJ4hx1OI2gSZB618IgbZaKxKQewYduWvvTgUefuy7AogKvIO9imSGUNujouK58RLbPzlVZ8deqdW1G0=
X-Received: by 2002:a05:620a:171e:b0:7c0:7eb4:6635 with SMTP id
 af79cd13be357-7c0ceeff2f5mr489949685a.20.1740147139124; Fri, 21 Feb 2025
 06:12:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241217100809.3962439-1-jens.wiklander@linaro.org>
 <20250212205613.4400a888@collabora.com> <CAFA6WYOaGEPj0xNEDBCoEmjJreEHChjQ2hyXRJ_CYoGhiBonfw@mail.gmail.com>
 <20250213093557.278f5d19@collabora.com> <CAFA6WYOJkSRsH-15QdqXNMd08Q=Dg4NkRd1Cr9LXA+5nozTF6g@mail.gmail.com>
 <20250213134008.4cbef142@collabora.com> <CAPj87rM5Y=-Jgf4mwukicF6Yb-vccn2fpG2X1jNq0upH2+cAEQ@mail.gmail.com>
 <CAHUa44G9hw-z6wzxg=HkVAxPKEW1yES5JTEqRWMvJUJAtcUDkQ@mail.gmail.com>
 <CAPj87rPHnME5Osgnf5-FSAu22mDpLj=dzvhi_NqEcOwr1ThgGw@mail.gmail.com>
 <CAHUa44Gs0D1fBD0=+EDgcQUMeDv4knci9trUkYEc1J98qFV7HQ@mail.gmail.com>
 <CAFA6WYOuTwRPEh3L7+hMyARB_E73xmp+OwhKyS-r4+ryS7=9sw@mail.gmail.com>
 <20250214164856.0d2ead8a@collabora.com> <CAFA6WYPc6EHQwcPuMZRm4C1P6SoDrCzEPUmju_meupB6NXQ1sg@mail.gmail.com>
 <CAPj87rN-OYTzh5=Gdv619UQD5=x=U6Yt=uV4N1kCs4Zao4RVAg@mail.gmail.com> <CAFA6WYMLLLSuz3y5J+DuRFAGrmwpZoWax5sasfAUhXoQXmrNNA@mail.gmail.com>
In-Reply-To: <CAFA6WYMLLLSuz3y5J+DuRFAGrmwpZoWax5sasfAUhXoQXmrNNA@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 21 Feb 2025 14:12:07 +0000
X-Gm-Features: AWEUYZmP2uYJ9getqaxkEL4eegweLIaIcbeabrpYDd9o5HHeksDQJ2ryFyndM6w
Message-ID: <CAPj87rN7J6u9NsviAdw8=OenEYc8t719Lds6u6-BhFKrtkLZ-A@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] TEE subsystem for restricted dma-buf allocations
To: Sumit Garg <sumit.garg@linaro.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
	Jens Wiklander <jens.wiklander@linaro.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
	"moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>, op-tee@lists.trustedfirmware.org, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Florent Tomasin <florent.tomasin@arm.com>
Content-Type: text/plain; charset="UTF-8"

Hi Sumit,

On Fri, 21 Feb 2025 at 11:24, Sumit Garg <sumit.garg@linaro.org> wrote:
> On Tue, 18 Feb 2025 at 21:52, Daniel Stone <daniel@fooishbar.org> wrote:
> > dma-heaps was created to solve the problem of having too many
> > 'allocate $n bytes from $specialplace' uAPIs. The proliferation was
> > painful and making it difficult for userspace to do what it needed to
> > do. Userspace doesn't _yet_ make full use of it, but the solution is
> > to make userspace make full use of it, not to go create entirely
> > separate allocation paths for unclear reasons.
> >
> > Besides, I'm writing this from a platform that implements SVP not via
> > TEE. I've worked on platforms which implement SVP without any TEE,
> > where the TEE implementation would be at best a no-op stub, and at
> > worst flat-out impossible.
>
> Can you elaborate the non-TEE use-case for Secure Video Path (SVP) a
> bit more? As to how the protected/encrypted media content pipeline
> works? Which architecture support does your use-case require? Is there
> any higher privileged level firmware interaction required to perform
> media content decryption into restricted memory? Do you plan to
> upstream corresponding support in near future?

You can see the MTK SVP patches on list which use the MTK SMC to mediate it.

There are TI Jacinto platforms which implement a 'secure' area
configured statically by (IIRC) BL2, with static permissions defined
for each AXI endpoint, e.g. CPU write + codec RW + dispc read. I've
heard of another SoC vendor doing the same, but I don't think I can
share those details. There is no TEE interaction.

I'm writing this message from an AMD laptop which implements
restricted content paths outside of TEE. I don't have the full picture
of how SVP is implemented on AMD systems, but I do know that I don't
have any TEE devices exposed.

> Let me try to elaborate on the Secure Video Path (SVP) flow requiring
> a TEE implementation (in general terms a higher privileged firmware
> managing the pipeline as the kernel/user-space has no access
> permissions to the plain text media content):
>
> - [...]

Yeah, I totally understand the TEE usecase. I think that TEE is a good
design to implement this. I think that TEE should be used for SVP
where it makes sense.

Please understand that I am _not_ arguing that no-one should use TEE for SVP!

> > So, again, let's
> > please turn this around: _why_ TEE? Who benefits from exposing this as
> > completely separate to the more generic uAPI that we specifically
> > designed to handle things like this?
>
> The bridging between DMA heaps and TEE would still require user-space
> to perform an IOCTL into TEE to register the DMA-bufs as you can see
> here [1]. Then it will rather be two handles for user-space to manage.

Yes, the decoder would need to do this. That's common though: if you
want to share a buffer between V4L2 and DRM, you have three handles:
the V4L2 buffer handle, the DRM GEM handle, and the dmabuf you use to
bridge the two.

> Similarly during restricted memory allocation/free we need another
> glue layer under DMA heaps to TEE subsystem.

Yep.

> The reason is simply which has been iterated over many times in the
> past threads that:
>
>     "If user-space has to interact with a TEE device for SVP use-case
> then why it's not better to ask TEE to allocate restricted DMA-bufs
> too"

The first word in your proposition is load-bearing.

Build out the usecase a little more here. You have a DRMed video
stream coming in, which you need to decode (involving TEE for this
usecase). You get a dmabuf handle to the decoded frame. You need to
pass the dmabuf across to the Wayland compositor. The compositor needs
to pass it to EGL/Vulkan to import and do composition, which in turn
passes it to the GPU DRM driver. The output of the composition is in
turn shared between the GPU DRM driver and the separate KMS DRM
driver, with the involvement of GBM.

For the platforms I'm interested in, the GPU DRM driver needs to
switch into protected mode, which has no involvement at all with TEE -
it's architecturally impossible to have TEE involved without moving
most of the GPU driver into TEE and destroying performance. The
display hardware also needs to engage protected mode, which again has
no involvement with TEE and again would need to have half the driver
moved into TEE for no benefit in order to do so. The Wayland
compositor also has no interest in TEE: it tells the GPU DRM driver
about the protected status of its buffers, and that's it.

What these components _are_ opinionated about, is the way buffers are
allocated and managed. We built out dmabuf modifiers for this usecase,
and we have a good negotiation protocol around that. We also really
care about buffer placement in some usecases - e.g. some display/codec
hardware requires buffers to be sourced from contiguous memory, other
hardware needs to know that when it shares buffers with another
device, it needs to place the buffers outside of inaccessible/slow
local RAM. So we built out dma-heaps, so every part of the component
in the stack can communicate their buffer-placement needs in the same
way as we do modifiers, and negotiate an acceptable allocation.

That's my starting point for this discussion. We have a mechanism to
deal with the fact that buffers need to be shared between different IP
blocks which have their own constraints on buffer placement, avoiding
the current problem of having every subsystem reinvent their own
allocation uAPI which was burying us in impedance mismatch and
confusion. That mechanism is dma-heaps. It seems like your starting
point from this discussion is that you've implemented a TEE-centric
design for SVP, and so all of userspace should bypass our existing
cross-subsystem special-purpose allocation mechanism, and write
specifically to one implementation. I believe that is a massive step
backwards and an immediate introduction of technical debt.

Again, having an implementation of SVP via TEE makes a huge amount of
sense. Having _most_ SVP implementations via TEE still makes a lot of
sense. Having _all_ SVP implementations eventually be via TEE would
still make sense. But even if we were at that point - which we aren't
- it still doesn't justify telling userspace 'use the generic dma-heap
uAPI for every device-specific allocation constraint, apart from SVP
which has a completely different way to allocate some bytes'.

Cheers,
Daniel

