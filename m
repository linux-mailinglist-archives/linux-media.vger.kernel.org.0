Return-Path: <linux-media+bounces-26123-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E72A34187
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2025 15:14:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C230A1894A58
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2025 14:09:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86C4121D3FD;
	Thu, 13 Feb 2025 14:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b="N3VjoQa0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20A923A9B0
	for <linux-media@vger.kernel.org>; Thu, 13 Feb 2025 14:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739455536; cv=none; b=mpzVYyTrqQiPJ5PSbpYwW6qBXb8DRtVlrMa1DUQV2Ev9t/RRASoNoume5Y2SnmzBkqziP7esky2H/nmmq5IF4yjRwvoL8SlksO1rAZxIpnM//9hbSdPvpxlXSl5uEv30PG5zOXVvtIC0XsvACMkJAY6kKc0YMzAZG45yY+hwxhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739455536; c=relaxed/simple;
	bh=xS258u4nZ8Oh1hovVFPvLu204SUXG1v2PhB8JQekrzU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jWX5EPMTIfJTe7rc2chF/nVH38Tkqjkd82brFRTYPq41XnWCIHKLwM07h9u9KFL/nVn3y0Z79X8+llZ153uAV0q9+szGKT9Ky+alCOgn+iO3lkZNcIitodchaSR/GKnFWMExhAiohxLBI0akwSdjup3Rl9bbvFefXqeAOHY+aDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org; spf=pass smtp.mailfrom=fooishbar.org; dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b=N3VjoQa0; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c05bb6dab7so94949985a.0
        for <linux-media@vger.kernel.org>; Thu, 13 Feb 2025 06:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1739455533; x=1740060333; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fiZcI5pNzRU07XzzU8EnwEz/jsrm+hKHSzrUBfY4xZU=;
        b=N3VjoQa0MULUdAyOJxAz+TTy3h9UxMiM6dSGwX/s4j44vFeLgIs7orav24SYoaEJHY
         9Qx1BN5HVrKmPV5JS/xo3mcl1vs71nfz8GWw8sbmfY78yO4E+5jcLTfhrG3Eq3f1zEL6
         scp63J/Lh4gm6WInS8Ikb0Ao2aWJikn9A+IDuE1OCPjSoGd+l5Apdsoq+cBwj2xqWaw+
         klbA317LL+wlLBz7AIYNuZcs8CPyRFtW/JgzF3p6YAFfKponp0tLyFqSx+KPaKWemVbN
         6zZgjIoy1lZUVQjp7o1hq5l20QURuo6asMe+f3ZrD8IlEqi+Wz+zLNH043lfvGnOyT6b
         bQpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739455533; x=1740060333;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fiZcI5pNzRU07XzzU8EnwEz/jsrm+hKHSzrUBfY4xZU=;
        b=CR3iRAs/gr9fyMFkXRV0AzDVc4aLJ40l28qth9ZAlKQ8hAsKbvl7ZG6f0iwDyeYmQC
         0L9ZgM3dlRbXUkhrxryEItavSe49pdkzdFiRGHR1069SPXy7P7WgtJRxbWkDBW8MkbL7
         kSjVSL2tge//LMSBk78vcmi12kSscFcMcNP3edRbbpdGZo5DRBi70Ih3gnviAwpERgKg
         tnc9pWnK9YkASaZSmOAr2jD6iKHm53cDOJE+F+vHNKS/piqqc8PVfKOrUAuw/A+0T3gj
         BY3Bso31ZOQXZct6S15YgbZNdAnzn9YwcTBmZPVnEeVxpuP9x5Bjk/qBcILu4a1/M5XS
         pjww==
X-Forwarded-Encrypted: i=1; AJvYcCWkjU8U474ZZmAAMufRavPfBajYlfpLfydg8XL3IZeR8jppcwepG/K3RPueys65T32uHr8DnRBekZqQPg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPBTFPSVRrXCfCQYh02PRwCXCk2ZqdJ0C+to9U3dEmsfnHHulk
	s/8QK4ukgMVWn6pFeTchILVATT23Qc72MV2HKifkiUE8JrhoUpTciYpydEeynm++Ta9sqLADkCg
	ZS48DVJcHp1CrBz4VITCHUF/zi+FmbLh9uptHHQ==
X-Gm-Gg: ASbGncvFbxOpUqa+FIm1fGjhDPg7ugMenf42ZdqNyZ6FL0aFZO50fqNXMxCeY56/Aot
	2P11WWI2wHVA7kHTLGpuJXVI7r1UyvSSJ3PVUZ81nJYYnVHUZqJ3UKR2Z9oJ9fcmP5HPAyQ==
X-Google-Smtp-Source: AGHT+IGMP88jINMPoFMOhhs/JAOS7v2yzIBooFPBVGpWjkqaheBF8kqUyMw9whWPj/OQ8rwmytDe/wVilf8O/rIqWwA=
X-Received: by 2002:a05:620a:6841:b0:7b6:d611:ce6f with SMTP id
 af79cd13be357-7c07a89294cmr506602985a.8.1739455533614; Thu, 13 Feb 2025
 06:05:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241217100809.3962439-1-jens.wiklander@linaro.org>
 <20250212205613.4400a888@collabora.com> <CAFA6WYOaGEPj0xNEDBCoEmjJreEHChjQ2hyXRJ_CYoGhiBonfw@mail.gmail.com>
 <20250213093557.278f5d19@collabora.com> <CAFA6WYOJkSRsH-15QdqXNMd08Q=Dg4NkRd1Cr9LXA+5nozTF6g@mail.gmail.com>
 <20250213134008.4cbef142@collabora.com>
In-Reply-To: <20250213134008.4cbef142@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 13 Feb 2025 14:05:22 +0000
X-Gm-Features: AWEUYZn29uWPvEYSBg2IY8QVofzDJvdO9H1dHkQQoSFoIsbJfLKOXfSzgdbP8WY
Message-ID: <CAPj87rM5Y=-Jgf4mwukicF6Yb-vccn2fpG2X1jNq0upH2+cAEQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] TEE subsystem for restricted dma-buf allocations
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Sumit Garg <sumit.garg@linaro.org>, Jens Wiklander <jens.wiklander@linaro.org>, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Florent Tomasin <florent.tomasin@arm.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Thu, 13 Feb 2025 at 12:40, Boris Brezillon
<boris.brezillon@collabora.com> wrote:
> On Thu, 13 Feb 2025 14:46:01 +0530 Sumit Garg <sumit.garg@linaro.org> wrote:
> > Yeah but all the prior vendor specific secure/restricted DMA heaps
> > relied on DT information.
>
> Right, but there's nothing in the DMA heap provider API forcing that.

Yeah. DMA heaps are just a way to allocate memory from a specific
place. It allows people to settle on having a single way to do
allocations from weird platform-specific places; the only weird
platform-specific part userspace needs to deal with is figuring out
the name to use. The rest is at least a unified API: the point of
dma-heaps was exactly to have a single coherent API for userspace, not
to create one API for ZONE_CMA and DT ranges and everyone else doing
their own thing.

> > Rather than that it's better
> > for the user to directly ask the TEE device to allocate restricted
> > memory without worrying about how the memory restriction gets
> > enforced.
>
> If the consensus is that restricted/protected memory allocation should
> always be routed to the TEE, sure, but I had the feeling this wasn't as
> clear as that. OTOH, using a dma-heap to expose the TEE-SDP
> implementation provides the same benefits, without making potential
> future non-TEE based implementations a pain for users. The dma-heap
> ioctl being common to all implementations, it just becomes a
> configuration matter if we want to change the heap we rely on for
> protected/restricted buffer allocation. And because heaps have
> unique/well-known names, users can still default to (or rely solely on)
> the TEE-SPD implementation if they want.
>
> > There have been several attempts with DMA heaps in the past which all
> > resulted in a very vendor specific vertically integrated solution. But
> > the solution with TEE subsystem aims to make it generic and vendor
> > agnostic.
>
> Just because all previous protected/restricted dma-heap effort
> failed to make it upstream, doesn't mean dma-heap is the wrong way of
> exposing this feature IMHO.

To be fair, having a TEE implementation does give us a much better
chance of having a sensible cross-vendor plan. And the fact it's
already (sort of accidentally and only on one platform AFAICT) ready
for a 'test' interface, where we can still exercise protected
allocation paths but without having to go through all the
platform-specific setup that is inaccessible to most people, is also
really great! That's probably been the biggest barrier to having this
tested outside of IHVs and OEMs.

But just because TEE is one good backend implementation, doesn't mean
it should be the userspace ABI. Why should userspace care that TEE has
mediated the allocation instead of it being a predefined range within
DT? How does userspace pick which TEE device to use?  What advantage
does userspace get from having to have a different codepath to get a
different handle to memory?  What about x86?

I think this proposal is looking at it from the wrong direction.
Instead of working upwards from the implementation to userspace, start
with userspace and work downwards. The interesting property to focus
on is allocating memory, not that EL1 is involved behind the scenes.

Cheers,
Daniel

