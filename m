Return-Path: <linux-media+bounces-6381-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4816870C38
	for <lists+linux-media@lfdr.de>; Mon,  4 Mar 2024 22:13:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1F52BB24474
	for <lists+linux-media@lfdr.de>; Mon,  4 Mar 2024 21:13:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A77541CAA3;
	Mon,  4 Mar 2024 21:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ACzs+vuK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E20110A3F
	for <linux-media@vger.kernel.org>; Mon,  4 Mar 2024 21:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709586776; cv=none; b=X25mBJtQ+Mip2+s6jlaJqnR40T3TIpXpUBuUH9+V7gNvMOi9BTdX/LI/fi4kGaeP6p31EG8q0OmBs98rg+bZYOqqqmFjHf7zZaQmGNTzqQ3QsEZ2OsJDt/GlNzaB2rWuOaNo9dPcDYuGe7KIG2nWRfNuX3S2fBW5AaEA7xUmXhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709586776; c=relaxed/simple;
	bh=sMzaZr1qmY+HAHv39SGk1Hn0C419USDJx4UMJYDB61M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dseTyqqDmqcSW9N7RvZRwfVXKfLI0b9cds8vAhR5F+6w8ZUPLCQ37RB/mWwGwPrkz/yDdm00KfuEt9ZR+EqNnoGOUlsQMul99DH1/fpwH1F6fEMtjJF3e321kwWKq2uOI8eEIZKmWZyFs79QChaTjwtXvF5dl3kZSIA3+4azGPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ACzs+vuK; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-412d84ffbfaso24215e9.0
        for <linux-media@vger.kernel.org>; Mon, 04 Mar 2024 13:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709586772; x=1710191572; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X0r8+n+LARCJYSSmQ0wD96KaQybb4EGOOQP6AJjmTDY=;
        b=ACzs+vuKY2cbzBojfTJLg7Dxf/amPKBf3augS+LqwnLY6125XGyvozZe7Tbhw028pi
         SVgaMeba7WXHhQ77nSk11R05gFEQItBxmauoD5Z0j2nnQ5yBkX7g0mVeVR+G6oKdjDmE
         Db0ZhIFqf3AkryqiEipdhWO+r34bnxZrK8hW4UbkPFHZZucBObhH/tO6Hkbil/R6MVLC
         F19jE2R5uEWzg7FSQ8dxcftT/JoCA1g4jFr8HbnSonKX0bWmO+JAzr/wsJh6PsWVxq5M
         53f6gvSKG53wTKtwMWfCSrUAtdtlKs/JF3ztmb/XiDjByd47u7KR502+NChN7ChKnK9L
         JyWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709586772; x=1710191572;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X0r8+n+LARCJYSSmQ0wD96KaQybb4EGOOQP6AJjmTDY=;
        b=ghJhvPa8XN705EL0BsYtZSxfft1Pz+4WttibewB0qaehxJqHvo/PuftrGouAY5aydP
         FvhJfGHehSZXiE8sLGrGzrmuABlj84pgXavsqLHZdrYIqFop0mEyO2p5+k+znuqUDKfK
         luZNfTQYm5NuWr9HdofMCF7wuwu83pHGG+2ZM2bNMDMNI9N85+HBu2tx5k5MFjqDn//+
         02o8k1gLV7i8UI9HtlSKrByjIgVEf4JnFrrOTDg8E9K+uyXgI6/w6om7vV1NcxYLx1bs
         z2TabyNhdY5Ipca5sstn+E0iDTXxsnwCm20K98MFQa43EepPfvA6drjCszpJwxNDVIVA
         6KHQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/LIbYcsJRcF/jl2DCxcvTalWCecUdh/XjyAci20wRy//VhT7j6ecqU2IjCLSFWOK3154gDCUnvFhM8T9t5IavGpKmiMcuXoMGOMo=
X-Gm-Message-State: AOJu0YwL/k3frIaci7pXj7O4yBqqtH8VMFfKV5UJoUVWZdjcZi9E0krX
	kwoYrOpdAx94bruZMfkyIl9Di+uOutt9sdMJ+iF+uv4FXrkUliwF19oFEK/Ukoqfkh4VOwyr4K6
	0Ytx8OLK1/VaWGkh1rcY4Wj0xKtu/VxX15PU=
X-Google-Smtp-Source: AGHT+IECNItZxLvJKd/Rw+CRnuwdWLqZljXefiZGSRl1nR5Qjt8q5oAPrO+7FrtSRttAa4RSVf8/eMwruC25X58qOdo=
X-Received: by 2002:a05:600c:1c18:b0:412:e492:7e5 with SMTP id
 j24-20020a05600c1c1800b00412e49207e5mr19489wms.1.1709586772388; Mon, 04 Mar
 2024 13:12:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228-nifty-flashy-shrew-905edc@houat> <CANDhNCquJn6bH3KxKf65BWiTYLVqSd9892-xtFDHHqqyrroCMQ@mail.gmail.com>
 <20240304-bizarre-quizzical-dugong-caec1a@houat>
In-Reply-To: <20240304-bizarre-quizzical-dugong-caec1a@houat>
From: John Stultz <jstultz@google.com>
Date: Mon, 4 Mar 2024 13:12:39 -0800
Message-ID: <CANDhNCohz2O6==F_S_NvWPkaOo4R+CAEToY06PZLuwrLimDxqQ@mail.gmail.com>
Subject: Re: ECC memory semantics for heaps
To: Maxime Ripard <mripard@redhat.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	"T.J. Mercier" <tjmercier@google.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 4, 2024 at 5:46=E2=80=AFAM Maxime Ripard <mripard@redhat.com> w=
rote:
> On Wed, Feb 28, 2024 at 08:17:55PM -0800, John Stultz wrote:
> > On Wed, Feb 28, 2024 at 7:24=E2=80=AFAM Maxime Ripard <mripard@redhat.c=
om> wrote:
> > >
> > > I'm currently working on a platform that seems to have togglable RAM =
ECC
> > > support. Enabling ECC reduces the memory capacity and memory bandwidt=
h,
> > > so while it's a good idea to protect most of the system, it's not wor=
th
> > > it for things like framebuffers that won't really be affected by a
> > > bitflip.
> > >
> > > It's currently setup by enabling ECC on the entire memory, and then
> > > having a region of memory where ECC is disabled and where we're suppo=
sed
> > > to allocate from for allocations that don't need it.
> > >
> > > My first thought to support this was to create a reserved memory regi=
on
> > > for the !ECC memory, and to create a heap to allocate buffers from th=
at
> > > region. That would leave the system protected by ECC, while enabling
> > > userspace to be nicer to the system by allocating buffers from the !E=
CC
> > > region if it doesn't need it.
> > >
> > > However, this creates basically a new combination compared to the one=
 we
> > > already have (ie, physically contiguous vs virtually contiguous), and=
 we
> > > probably would want to throw in cacheable vs non-cacheable too.
> > >
> > > If we had to provide new heaps for each variation, we would have 8 he=
aps
> > > (and 6 new ones), which could be fine I guess but would still increas=
e
> > > quite a lot the number of heaps we have so far.
> > >
> > > Is it something that would be a problem? If it is, do you see another
> > > way to support those kind of allocations (like providing hints throug=
h
> > > the ioctl maybe?)?
> >
> > So, the dma-buf heaps interface uses chardevs so that we can have a
> > lot of flexibility in the types of heaps (and don't have the risk of
> > bitmask exhaustion like ION had). So I don't see adding many
> > differently named heaps as particularly problematic.
>
> Ok
>
> > That said, if there are truly generic properties (cacheable vs
> > non-cachable is maybe one of those) which apply to most heaps, I'm
> > open to making use of the flags. But I want to avoid having per-heap
> > flags, it really needs to be a generic attribute.
> >
> > And I personally don't mind the idea of having things added as heaps
> > initially, and potentially upgrading them to flags if needed (allowing
> > heap drivers to optionally enumerate the old chardevs behind a config
> > option for backwards compatibility).
> >
> > How common is the hardware that is going to provide this configurable
> > ECC option
>
> In terms of number of SoCs with the feature, it's probably a handful. In
> terms of number of units shipped, we're in the fairly common range :)
>

Sure, I guess I was trying to get a sense of is this a feature we'll
likely be seeing commonly across hardware (such that internal kernel
allocators would be considering it as a flag), or is it more tied to a
single vendor such that enabling/isolating it in a driver is the right
place in the abstraction to put it.


> > and will you really want the option on all of the heap types?
>
> Aside from the cacheable/uncacheable discussion, yes. We could probably
> get away with only physically contiguous allocations at the moment
> though, I'll double check.

Ok, that will be useful to know.

> > Will there be any hardware constraint limitations caused by the
> > ECC/!ECC flags? (ie: Devices that can't use !ECC allocated buffers?)
>
> My understanding is that there's no device restriction. It will be a
> carved out memory so we will need to maintain a separate pool and it
> will be limited in size, but that's pretty much the only one afaik.

Ok.

> > If not, I wonder if it would make sense to have something more along
> > the lines using a fcntl()  like how F_SEAL_* is used with memfds?
> > With some of the discussion around "restricted"/"secure" heaps that
> > can change state, I've liked this idea of just allocating dmabufs from
> > normal heaps and then using fcntl or something similar to modify
> > properties of the buffer that are separate from the type of memory
> > that is needed to be allocated to satisfy device constraints.
>
> Sorry, I'm not super familiar with F_SEAL so I don't really follow what
> you have in mind here. Do you have any additional resources I could read
> to understand better what you're thinking about?

See the File Sealing section: https://man7.org/linux/man-pages/man2/fcntl.2=
.html

> Also, if we were to modify the ECC attributes after the dma-buf has been
> allocated by dma-buf, and if the !ECC memory is carved out only, then
> wouldn't that mean we would need to reallocate the backing buffer for
> that dma-buf?

So yea, having to work on a larger pool likely makes this not useful
here, so apologies for the tangent.

To explain myself, part of what I'm thinking of is, the dmabuf heaps
(and really ION before it) try to solve how to allocate a buffer type
that can be used across a number of devices that may have different
constraints. So the focus was on "types of memory" to satisfy the
constraint (contiguous, non-contiguous, secure/restricted, etc), which
come down to what pages actually get used.  However, outside of the
"constraint type" the buffer may have, there are other "properties"
that may affect performance (like cacheability, and some variants of
"restricted buffers" which can change over their lifetime).  With ION
vendors would mix these two together in their vendor heaps, and with
out-of-tree dmabuf heaps it is also common to tangle types and
properties together.

So I'm sort of stewing on how to best distinguish between heaps for
"types of memory/pages" (ie: what's *required* to share the buffer
between devices) vs these buffer properties (which affect performance)
that may apply to multiple memory types.
(And I'm also not 100% convinced that distinguishing between this is
necessary, but casually mixing them feels messy to me)

For buffers where those properties might change over time (like some
variants of restricted buffers), I think the fnctl/F_SEAL_* idea makes
sense to allow the buffer to become restricted.

For cacheability, it seems likely an allocation flag would be nicest,
but we don't have upstream users and not a lot of heap types yet, thus
the out-of-tree "system-uncached" heap which sort of mixes types and
properties.

With ECC I was trying to get a sense of where it would sit between
this "type of memory" vs a "buffer property".  If internal allocators
are likely to consider it in a way similar to CMA (and with the pool
granular control, it sounds like it), then yeah, it probably should be
a type of memory, so a new heap name is likely the way to go - but
there is still the question of how to best support the various
combinations of (contiguous, cacheable) along with ECC.  But if it
were something that was dynamically controllable at a finer grained
level in the future, maybe it would be something like a  buffer
property.

thanks
-john

