Return-Path: <linux-media+bounces-49429-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E7763CDA560
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 20:20:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D1C0E3025A79
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 19:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D28E534A78D;
	Tue, 23 Dec 2025 19:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A61oFtow"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6630F349B09
	for <linux-media@vger.kernel.org>; Tue, 23 Dec 2025 19:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766517627; cv=pass; b=Di5n18/J3ipIfvD53Ch1FYgLARWRCVcLu0wz9Tj7bHoXVMhlW1DUrkRAZZRICwA7PDtUf5x3TFe2iSCYgWqtjUlFtkEp81zzlwV9r4Y9uli/MmJ/HT5PQfT+apV8OrNZa6OIVmQuHs6wxNieVy7h4c+9Sl070R3RPchZQU8d/Sk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766517627; c=relaxed/simple;
	bh=a5+xgM/+DEzFbXxJOlaWSbNM7nqa8vatKp2y4g04VfM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nYyP9hSOOkqAYyz6WKPsrQQzneNn7m5WUGJSpnVZeJSNE8kF72kk5gIqZR/IOtwvQ8PrB/iFm6anUr28chayLXZOsLzFP+zRi7fEQjkOPmutGS4jUjuZplrZrP7DyLYUZKhtEM5XFZ/TWPrAXvdYODrUHXl8wM79ZRu09kc2qWY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A61oFtow; arc=pass smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4779a4fb9bfso266865e9.0
        for <linux-media@vger.kernel.org>; Tue, 23 Dec 2025 11:20:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1766517624; cv=none;
        d=google.com; s=arc-20240605;
        b=Q1zH9V/BKu+MbIYajT6HSgURFfJjvvRbbYkUotKx+eIBUOFL2AJ0N32+LnSiGKg81V
         Sdt+GC72utIZ3XsoEuWSVTrsKxpCi4sAJPMkxW538aw8+MJmQHErIwkLoxXHBt8FkFX9
         4h1JF7JVEnfM9fleYUmYPUZozknYME1va4Wy7IbPreh77EtOqlQKf/8X9CpXUhiLAejb
         j8ojjph7D4hHHp+ef0S1GFvjMUgg1P/qqQieOzg0yZ1ct8DX6jHjl8sAT55faICYcMR7
         7JHiWAWlhiUZlZ7e5ZTW98CvpVImfOE0WUxTCp4MhBfH6CpAEBje/rmlOggv/3S7nckN
         2W1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a5+xgM/+DEzFbXxJOlaWSbNM7nqa8vatKp2y4g04VfM=;
        fh=2ZbOFCdHVrBG6WMIlBtTFDzeOsZDxtO7npE6NtTkI2E=;
        b=Wan06rAoQxzyryqzsPplunBghcte0n0n1DhicxR+W8CiscFYXrz4GjgbHSyNfChOYb
         0fQ5GzAnYYYfIrexrvhnJ8CuIcW2zc1/kWrEBBGXcDKB50WDJlBbXBqbRYBrGLYY4inR
         dvTJPWE60LutaySyMYssZv/rgnr5BFNAbxA0/njiliSJl1S8ZssEe0Lx2jlmEOaH+7ph
         yh5mRE0aaDb/ofOQMoS/z9DcXSkskoeaD19zxd9RMcz75TYGKt+stwbjTD8Lc8kqsxbT
         zjaZ0nylzLVwDSOz40zWb/7blex/IfWXviveLm3gheLKZbkRQe+enuYPHC+lrPYJkqMP
         D0bg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766517624; x=1767122424; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a5+xgM/+DEzFbXxJOlaWSbNM7nqa8vatKp2y4g04VfM=;
        b=A61oFtow/ZG8SJGI0uNIhsYrSwrYhfZYsyXLJnlSsoips8Wk9emIAKQAw4+3stISXA
         8aMUJWQDJGgSB9i9i1MtFB0mQyQuYkGtley+GuvHNXkxH7W2zZ2wZyP+rzPWpDzQ21cT
         hnoVYrMEVrMfhuXXCG6Zgm1g7XU9tqWkk/uKbr5tzOVS7Et5SWrfHki1p2f5MGnh5ZfG
         PBVwRtXfVcE9cu/TgqzsXDMByPVlCKW6koQyCQ1UaS8y7oudJ0E2ST13HUp3SbhyYnOS
         YSAxsTqW+pRGq4tb9bDp1X3Mr7MlTmHHOKaJ971Ifb7+jwinDN9pnYY83Qi+xDI5t9CT
         SeNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766517624; x=1767122424;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a5+xgM/+DEzFbXxJOlaWSbNM7nqa8vatKp2y4g04VfM=;
        b=syKvkegnVd5jKA2CE2lmw0Wzd+C9YCpXB9wp6S9w7kS9BY1w3NL84sXWKwAUql50Qk
         1g38A78urahw8ZIHY2cBPWcs8F90k3iwJzILw/Svn4buyWjQJbc4JFEcTI5xT8QFnKhw
         mGKL0zQlyCk9LjHLI4bhr0EVWEIHY/Pe6Z3Zp3+sngcp+K4lOpQIMvGplG6z1qcF9IJg
         77i+rmpUGMyBdXDzzDz02CYfFF2QdNgze/zlvvhuqRhZiC1KF/aoAIaJpV+u2qovCuXm
         G95ypKOIhrXfOpv5Jy9+SEzLw3k0QcG87nVxxlCAt1iGE7i5L7Ut5ePYp7WcCqyiBdpQ
         jyxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzw8fHkXBg3MfTjbx64yOfKhUmDg3V9qiPTNDYQa2xVaqoO02mhPsRJY1DzOUO7THXWjDzLTgOO6wx8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YypqVveogM1j1r0xagvA/kxUtBmELUMIGpYXZTBy1XACFcpp4Iy
	RevkO89rNi8f9nX7M6nDP4chSPQTRlPen5JdVHB4/r2aK3a36JfWC4QDOs7AtzoTY6+xSgeRXSP
	VlKZ9mGfHV93XjAlAWAWih++t8JnnEWrm/i3nP27xmRb0vRy9DAy/+kRh
X-Gm-Gg: AY/fxX4I3y4/R1fUSknBaULPI38d50rgOm3rp5MPjuPPZ9BkcW0YuAGaEjqfviWBl9T
	IBnhX3x1FqMe00OWtcr1Qnu2GqWqKy9uJt167hFaKqt4BAf95ja4AAxaR/muF/Xcd61tcIK1jwL
	PmsSiN9c2qh1Bjx4S8vgTXSDdRhHdttqIFTwr8f9NHN9I70j9ebzMOM5yPmohOGJhm9egBr4eWQ
	wpm9/nTTzJBozgbdmT17CvMaU718uWLH9fzJc5wFX4yxagC7AepcYkdr5CYXQBtM6TvFBfM72KV
	CoZuM/nsh+qIhuCpF//1AteornxXcLXKmwsq2A==
X-Google-Smtp-Source: AGHT+IEG4L2KtlFmlxwH8tyJw8U1LD9lfHo+uuj+XTeCuha19uVEvcigX9Mg2ksFjQLFcEDqzYU+ZZ2oCFS9tE7vZu8=
X-Received: by 2002:a05:600c:6013:b0:477:b358:c0cd with SMTP id
 5b1f17b1804b1-47d3c6f23e0mr76385e9.18.1766517623353; Tue, 23 Dec 2025
 11:20:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251211193106.755485-2-echanude@redhat.com> <CABdmKX2MPhw121ZG8V+f-XoOReUsCdmcug-cWDg=3WZcJ=NHHA@mail.gmail.com>
 <20251215-sepia-husky-of-eternity-ecf0ce@penduick> <CABdmKX1HgSzUPS1Ot93tpctgunfHt_F_XNROB6zzpu_u0oH2=A@mail.gmail.com>
 <20251219-precise-tody-of-fortitude-5a3839@houat>
In-Reply-To: <20251219-precise-tody-of-fortitude-5a3839@houat>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 24 Dec 2025 04:20:11 +0900
X-Gm-Features: AQt7F2rw01H7QxvGsejUIuV_ynmYDaCiSn7pNjMDztmbKKwMiJ0pZlidXREqHoc
Message-ID: <CABdmKX2_UOENujpW0dXe0Z0x+4V3onfGDmHf1DMOXfDha6ddOA@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: system_heap: account for system heap allocation
 in memcg
To: Maxime Ripard <mripard@redhat.com>
Cc: Eric Chanudet <echanude@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, Christian Koenig <christian.koenig@amd.com>, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
	"open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 19, 2025 at 7:19=E2=80=AFPM Maxime Ripard <mripard@redhat.com> =
wrote:
>
> Hi,
>
> On Tue, Dec 16, 2025 at 11:06:59AM +0900, T.J. Mercier wrote:
> > On Mon, Dec 15, 2025 at 7:51=E2=80=AFPM Maxime Ripard <mripard@redhat.c=
om> wrote:
> > > On Fri, Dec 12, 2025 at 08:25:19AM +0900, T.J. Mercier wrote:
> > > > On Fri, Dec 12, 2025 at 4:31=E2=80=AFAM Eric Chanudet <echanude@red=
hat.com> wrote:
> > > > >
> > > > > The system dma-buf heap lets userspace allocate buffers from the =
page
> > > > > allocator. However, these allocations are not accounted for in me=
mcg,
> > > > > allowing processes to escape limits that may be configured.
> > > > >
> > > > > Pass the __GFP_ACCOUNT for our allocations to account them into m=
emcg.
> > > >
> > > > We had a discussion just last night in the MM track at LPC about ho=
w
> > > > shared memory accounted in memcg is pretty broken. Without a way to
> > > > identify (and possibly transfer) ownership of a shared buffer, this
> > > > makes the accounting of shared memory, and zombie memcg problems
> > > > worse. :\
> > >
> > > Are there notes or a report from that discussion anywhere?
> >
> > The LPC vids haven't been clipped yet, and actually I can't even find
> > the recorded full live stream from Hall A2 on the first day. So I
> > don't think there's anything to look at, but I bet there's probably
> > nothing there you don't already know.
>
> Ack, thanks for looking at it still :)
>
> > > The way I see it, the dma-buf heaps *trivial* case is non-existent at
> > > the moment and that's definitely broken. Any application can bypass i=
ts
> > > cgroups limits trivially, and that's a pretty big hole in the system.
> >
> > Agree, but if we only charge the first allocator then limits can still
> > easily be bypassed assuming an app can cause an allocation outside of
> > its cgroup tree.
> >
> > I'm not sure using static memcg limits where a significant portion of
> > the memory can be shared is really feasible. Even with just pagecache
> > being charged to memcgs, we're having trouble defining a static memcg
> > limit that is really useful since it has to be high enough to
> > accomodate occasional spikes due to shared memory that might or might
> > not be charged (since it can only be charged to one memcg - it may be
> > spread around or it may all get charged to one memcg). So excessive
> > anonymous use has to get really bad before it gets punished.
> >
> > What I've been hearing lately is that folks are polling memory.stat or
> > PSI or other metrics and using that to take actions (memory.reclaim /
> > killing / adjust memory.high) at runtime rather than relying on
> > memory.high/max behavior with a static limit.
>
> But that's only side effects of a buffer being shared, right? (which,
> for a buffer sharing mechanism is still pretty important, but still)
>
> > > The shared ownership is indeed broken, but it's not more or less brok=
en
> > > than, say, memfd + udmabuf, and I'm sure plenty of others.
> >
> > One thing that's worse about system heap buffers is that unlike memfd
> > the memory isn't reclaimable. So without killing all users there's
> > currently no way to deal with the zombie issue. Harry's proposing
> > reparenting, but I don't think our current interfaces support that
> > because we'd have to mess with the page structs behind system heap
> > dmabufs to change the memcg during reparenting.
> >
> > Ah... but udmabuf pins the memfd pages, so you're right that memfd +
> > udmabuf isn't worse.
> >
> > > So we really improve the common case, but only make the "advanced"
> > > slightly more broken than it already is.
> > >
> > > Would you disagree?
> >
> > I think memcg limits in this case just wouldn't be usable because of
> > what I mentioned above. In our common case the allocator is in a
> > different cgroup tree than the real users of the buffer.
>
> So, my issue with this is that we want to fix not only dma-buf itself,
> but every device buffer allocation mechanism, so also v4l2, drm, etc.
>
> So we'll need a lot of infrastructure and rework outside of dma-buf to
> get there, and figuring out how to solve the shared buffer accounting is
> indeed one of them, but was so far considered kind the thing to do last
> last time we discussed.
>
> What I get from that discussion is that we now consider it a
> prerequisite, and given how that topic has been advancing so far, one
> that would take a couple of years at best to materialize into something
> useful and upstream.
>
> Thus, it blocks all the work around it for years.
>
> Would you be open to merging patches that work on it but only enabled
> through a kernel parameter for example (and possibly taint the kernel?)?
> That would allow to work towards that goal while not being blocked by
> the shared buffer accounting, and not affecting the general case either.
>
> Maxime

Hi Maxime,

A kernel param or a CONFIG sound like a good compromise to allow work
to progress. I'd be happy to add my R-B to that.

