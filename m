Return-Path: <linux-media+bounces-32979-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B095AABEA06
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 04:47:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B3D681B66F4C
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 02:47:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A792E22C34A;
	Wed, 21 May 2025 02:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DypL6xK1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3241314F9F7
	for <linux-media@vger.kernel.org>; Wed, 21 May 2025 02:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747795615; cv=none; b=JF/wYODMmgfSouXfVMH+lRtnr15szexbha7pFwcE0F8mka+PaeDvrb9knI/3YZmyrsuFS9keFY4w0TUaRhcrHsuqBUhzV0Ratf8oH2xcoemMG9p/RzWc8NGp+xhCDmmcDBSiviIDc6Er6bU+Fx/63M1FI42IT+npG0FbwjhZ0u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747795615; c=relaxed/simple;
	bh=s0Yv5qpAybqDPz+g5ZEmMpZGSzKgHGyyNvk9T13DIOk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LPPIKaNkQ4GH8QLqGQjJVW41ZaAyG7sMfojL0QyQ2jbvCGPElEe57rNMWVdRbB5WR2yMx9DYxZdw4KB4dNf6bmgY86tePuChVczK93c32JXYYYEGJu3J2lISbqCUlDNtVWLWxv/YFMBm+KIeIWXorD0H3I2HH4YIy9EZ/z3QAwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DypL6xK1; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-32934448e8bso4934051fa.3
        for <linux-media@vger.kernel.org>; Tue, 20 May 2025 19:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747795611; x=1748400411; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nxt6arEcdTzqN2aNV7xZMthDenOsecbhCIniDpCb5w8=;
        b=DypL6xK1BLywsaU4fe8cPvIMG+7dD3qHaq8yz1alNmpjfQMo/zNWIvu/Ni1xhGSy8M
         T6L3HMmI9gcFBpeN8HI8/O8+AX5FG7gl3mEJvACKExL1TFEq+EQ589D/JIjlBdH8KMZn
         rwJH4VhzO7k8H2+NiGqcVw64qEzWfqUfwOaisWypKacxwCHlcVs8G4tcjVizcHgYBw2G
         ucQojIMv9ozfTzKWeQemfPd60/KESoa39kfvOAoUYD7GGTAKsJmS1pa/d42Hm829jHhh
         5QQ7RhYIRFne9dOnEeZoUOeByyb4OjdKPHRdTLwr3JhAWqNLBNQhLwDsFFQ6Dzy0C7GH
         OLHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747795611; x=1748400411;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nxt6arEcdTzqN2aNV7xZMthDenOsecbhCIniDpCb5w8=;
        b=dUr1v1RIK1s48OxsM65MGF7B5i6+wpHwK2vhhxnYOhP3t2NRL17u27jwLkPtyIKT0j
         jD4P1GpzLdY17eRXF/XaOkdoz5q6UOTXWwqlv8q6lOriAV+I/CRwyiYx/zPz5AaQ7C93
         h/h6936x2wHGJmsfPzTcKETbMhPZV/nR7ee7aHzd16r6i+7me2A0c81Dmx5i2mFdZIwR
         iobUOb59XT1BGaF3Ev63gABBqI4dAZOkISyxB8bOizV4o3ZUnTckK8QPCa2gGf2meus+
         HBTxRADsp4QQYIGE06UaDe7NQWFvoGzlK3wHdiIdmh4STkS6pxaOw/dFzeYAEkBSouaI
         KgZg==
X-Forwarded-Encrypted: i=1; AJvYcCVJ2F1jdoqs8Qt/hruylHGguzv+E70wDAB1qZBEKTdMk5PLUZ+O9bYT0iQX6Ctw2Rxix5idzRpsPPeCLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSx1T5l1r/x+LUdW3kunAgh0AvqFIA2Fyw+5TNhP/nvPF/Ko39
	JfcRoMkyg82rTBHaFRahjul3mE7GK/JI/N9g07F8l1zIEehIBvaklzL8/rfOAaIpR/uWZ1rkAyK
	xldDTZ9iRj+Rh243VKwGRZG1dsT17IH1yarc7Cdw=
X-Gm-Gg: ASbGncvojgZyWZqcR3oX8BCEB/1c9PVkibKEi9m2mpgk6VxDObTYs4YxS0xbz6Ju3zw
	+eckazIPGjvs/+5PBeIxniSa/eSlFAfbOhJMbyIofXUqM4a0vEwewexjhFYmAF5STCfnu3dtz/v
	FhVDv8+ihShBBqbXJfipZvJMRACl8rKaDbvbMoKFYWLe/r3PC8mzaRVobcBxhVs6Wi7lk/B14=
X-Google-Smtp-Source: AGHT+IHPiBTH/IUONoliZXjExrOKudiG9XvffXjRUKLNtiXlLaXy9m8H+bx6CRbSWTdibiF38hi9o5vXfOGfvKq6xdY=
X-Received: by 2002:a05:651c:54c:b0:30c:201a:149a with SMTP id
 38308e7fff4ca-328077a9f1bmr71629351fa.25.1747795611095; Tue, 20 May 2025
 19:46:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520-dma-buf-heap-names-doc-v1-1-ab31f74809ee@kernel.org>
In-Reply-To: <20250520-dma-buf-heap-names-doc-v1-1-ab31f74809ee@kernel.org>
From: John Stultz <jstultz@google.com>
Date: Tue, 20 May 2025 19:46:39 -0700
X-Gm-Features: AX0GCFvaIAnE0yZNsTcLxjSWVR6RvkV3hbcw5IoUnGn4QI2anEO8q4-VMGo9Bvw
Message-ID: <CANDhNCoQ=V5Uk0ThmeHdn20xmUucPb-mjCjX5pbM94EvzGRZMw@mail.gmail.com>
Subject: Re: [PATCH] Documentation: dma-buf: heaps: Add naming guidelines
To: Maxime Ripard <mripard@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	"T.J. Mercier" <tjmercier@google.com>, Jonathan Corbet <corbet@lwn.net>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 3:00=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> We've discussed a number of times of how some heap names are bad, but
> not really what makes a good heap name.
>
> Let's document what we expect the heap names to look like.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  Documentation/userspace-api/dma-buf-heaps.rst | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Documentatio=
n/userspace-api/dma-buf-heaps.rst
> index 535f49047ce6450796bf4380c989e109355efc05..b24618e360a9a9ba0bd85135d=
8c1760776f1a37f 100644
> --- a/Documentation/userspace-api/dma-buf-heaps.rst
> +++ b/Documentation/userspace-api/dma-buf-heaps.rst
> @@ -21,5 +21,24 @@ following heaps:
>     usually created either through the kernel commandline through the
>     `cma` parameter, a memory region Device-Tree node with the
>     `linux,cma-default` property set, or through the `CMA_SIZE_MBYTES` or
>     `CMA_SIZE_PERCENTAGE` Kconfig options. Depending on the platform, it
>     might be called ``reserved``, ``linux,cma``, or ``default-pool``.
> +
> +Naming Convention
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +A good heap name is a name that:
> +
> +- Is stable, and won't change from one version to the other;
> +
> +- Describes the memory region the heap will allocate from, and will
> +  uniquely identify it in a given platform;
> +
> +- Doesn't use implementation details, such as the allocator;
> +
> +- Can describe intended usage.
> +

Thanks again for sending this out. Sorry I've been spotty in some of
the discussions (I'm really trying to step back from this area).

I might only suggest you provide a bit more "why" to the list of
qualities you highlight here, just to communicate more of the
spirit/philosophy of how these might be judged or reviewed in the
future.

> +For example, assuming a platform with a reserved memory region located
> +at the RAM address 0x42000000, intended to allocate video framebuffers,
> +and backed by the CMA kernel allocator. Good names would be
> +`memory@42000000` or `video@42000000`, but `cma-video` wouldn't.

The point about avoiding the allocator details, just so I better
understand the criteria: Would distinguishing from a contiguous pool
vs non-contiguous in the name be considered ok? As it's a property of
the buffer returned, and one that is critically important for some
devices. Or do you intend that to be opaque, and the usage->heap
mapping logic to provide that itself? (Effectively avoiding folks from
being able to make potentially problematic assumptions from the name?)

Similarly, how would you suggest naming a heap that provides 32bit
allocations?   Similarly for "protected' allocations, which are being
proposed?

thanks
-john

