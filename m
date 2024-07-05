Return-Path: <linux-media+bounces-14687-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE1C928BD0
	for <lists+linux-media@lfdr.de>; Fri,  5 Jul 2024 17:35:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FD731F23A84
	for <lists+linux-media@lfdr.de>; Fri,  5 Jul 2024 15:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E16816C861;
	Fri,  5 Jul 2024 15:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="lf29z5tZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12764148FE3
	for <linux-media@vger.kernel.org>; Fri,  5 Jul 2024 15:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720193738; cv=none; b=ipGlNIdlmBkQXRjaVCxi7BvQbN8GBZpzT5FKJwGuN8aBQn6XLq8VLFReVqNeADAsSMzktPvUhBw8eNmwG233bv3FCMyAjykI4KTIRJFMkbUztSlswkv8RS2axfXeDjpIewdoDqC/ZFS5BsiFXnBeyUK9zVc/HKqyUGloAyQOusE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720193738; c=relaxed/simple;
	bh=sMQ1un7wRnduIdXmdxXJBYlSB5U5KZzM85nm28qm3O4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E3xmDGj3uYRZA8uwhXFiVzlmIK1CrpRWoNyBUleyTgnsUIvRSqQFnS7dBVa1ezoiRTDGYUzaS9w7c0CW2XvoMhpVljwQyhagPJRhTpTtm6xaGFGkuuqPAl9sDcz28bSGwd1BmW3iYBTsW+6651M0oRmuWmQ95ciBFFaui80gxyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=lf29z5tZ; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-424a3d36c28so1961095e9.0
        for <linux-media@vger.kernel.org>; Fri, 05 Jul 2024 08:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1720193735; x=1720798535; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YKIOErnN4ZSBK93fEaGuNPtZhO0OBRfZiH5pNgGd0zQ=;
        b=lf29z5tZyj6esZh8whoSm5U/7EFRbQ+2HcjwSYebg4bFd9gIN8mZoPX2UF7C1aWh0g
         Vs0PDuIbCjYmegX51Q0eer5hUsZMb8ROsn62PRNlTsZIJlKMMRHxmj5TsNuTIk31Ra/C
         nZrtMUiqXGKHXllF7hmVXhqtT4A4QJL64Ju4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720193735; x=1720798535;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YKIOErnN4ZSBK93fEaGuNPtZhO0OBRfZiH5pNgGd0zQ=;
        b=O35ehpQD21Tz3H7fdVPrqaMy5zgYBl6JEEt4kxDTWThqHlNrKATTiIEbzK2uCRa0go
         18I/fblz+1nP0E9Vfj8fptABfJohnTwdHa3L6CJaia+B16TrGxO27BaRVoaG0+9hIdqE
         NPaVbKpLAxNMFg7D3NCOt7KOohE55AQB/jiVVGAYZto7i9CIddDezbfSwFofkQhGaJvZ
         zZLZGiIzBjmPPrPGqihXwnzpT9IiMkfVzHJ0hqHm31uzt11lIGMNs4+ePr2caeZ3Ph4P
         GmpoSww4ZIUTzuykfsVaPCNMvCAm/6E0vJRQMw4D3whC51s5nCbUyoki2SwTTKbJLC9w
         FAlg==
X-Forwarded-Encrypted: i=1; AJvYcCUhT1e6GLe+hdPuZd40tZS65cofr9o2aX+cRf13DGwxEFflemnpmNLYJXOruDiwawF4jkskz3sBjw0b47DUJzOwnDm2xCPpf856UGU=
X-Gm-Message-State: AOJu0Yw6GJSVhvLApZoFb0Z2ZiOtMtrxuGXQjLN6eiO+p3rVz+rmQf0H
	FxX6kzZaL4U4OcAOiIIx2nO49c949FEN04E1v0FcZ4OS+2IAp1lon7EllYcmfB4=
X-Google-Smtp-Source: AGHT+IGsJ1mkZ0D80/UjIJ9jqd/HQtwk88TIn27ewYuZuyXXRnv9JvlWXptYv3VuFI8J6TfR4dnNdg==
X-Received: by 2002:a05:600c:1c9f:b0:425:7ac6:96f7 with SMTP id 5b1f17b1804b1-4264a35297dmr36017775e9.0.1720193735231;
        Fri, 05 Jul 2024 08:35:35 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a2ca492sm67724735e9.34.2024.07.05.08.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 08:35:34 -0700 (PDT)
Date: Fri, 5 Jul 2024 17:35:32 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, John Stultz <jstultz@google.com>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Mattijs Korpershoek <mkorpershoek@baylibre.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 0/8] dma-buf: heaps: Support carved-out heaps and ECC
 related-flags
Message-ID: <ZogSxHFPt8SpOa0w@phenom.ffwll.local>
Mail-Followup-To: Thierry Reding <thierry.reding@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	John Stultz <jstultz@google.com>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Mattijs Korpershoek <mkorpershoek@baylibre.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
References: <20240515-dma-buf-ecc-heap-v1-0-54cbbd049511@kernel.org>
 <CANDhNCoOKwtpstFE2VDcUvzdXUWkZ-Zx+fz6xrdPWTyciVXMXQ@mail.gmail.com>
 <ZkXmWwmdPsqAo7VU@phenom.ffwll.local>
 <CANDhNCo5hSC-sLwdkBi3e-Ja-MzdqcGGbn-4G3XNYwCzZUwscw@mail.gmail.com>
 <ZkyOOwpM57HIiO3v@phenom.ffwll.local>
 <qy7aczeu6kumv5utemoevi7omp5ryq55zmgzxh5hrz5orf2osp@wypg66awof4n>
 <20240628-resilient-resolute-rook-0fc531@houat>
 <3e37rhrcqogix5obsu2gq7jar7bcoamx4bbd376az5z3zdkwvm@jstirwdl5efm>
 <20240704-therapeutic-maroon-coucal-f61a63@houat>
 <wapv4gl2se34tq3isycb7bui5xi3x6kxjqtyz24qhjipnkbuqu@sv4w2crksuq5>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <wapv4gl2se34tq3isycb7bui5xi3x6kxjqtyz24qhjipnkbuqu@sv4w2crksuq5>
X-Operating-System: Linux phenom 6.9.7-amd64 

Just figured I'll jump in on one detail here.

On Fri, Jul 05, 2024 at 04:31:34PM +0200, Thierry Reding wrote:
> On Thu, Jul 04, 2024 at 02:24:49PM GMT, Maxime Ripard wrote:
> > On Fri, Jun 28, 2024 at 04:42:35PM GMT, Thierry Reding wrote:
> > > On Fri, Jun 28, 2024 at 03:08:46PM GMT, Maxime Ripard wrote:
> > > > Hi,
> > > > 
> > > > On Fri, Jun 28, 2024 at 01:29:17PM GMT, Thierry Reding wrote:
> > > > > On Tue, May 21, 2024 at 02:06:19PM GMT, Daniel Vetter wrote:
> > > > > > On Thu, May 16, 2024 at 09:51:35AM -0700, John Stultz wrote:
> > > > > > > On Thu, May 16, 2024 at 3:56 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > > > > > On Wed, May 15, 2024 at 11:42:58AM -0700, John Stultz wrote:
> > > > > > > > > But it makes me a little nervous to add a new generic allocation flag
> > > > > > > > > for a feature most hardware doesn't support (yet, at least). So it's
> > > > > > > > > hard to weigh how common the actual usage will be across all the
> > > > > > > > > heaps.
> > > > > > > > >
> > > > > > > > > I apologize as my worry is mostly born out of seeing vendors really
> > > > > > > > > push opaque feature flags in their old ion heaps, so in providing a
> > > > > > > > > flags argument, it was mostly intended as an escape hatch for
> > > > > > > > > obviously common attributes. So having the first be something that
> > > > > > > > > seems reasonable, but isn't actually that common makes me fret some.
> > > > > > > > >
> > > > > > > > > So again, not an objection, just something for folks to stew on to
> > > > > > > > > make sure this is really the right approach.
> > > > > > > >
> > > > > > > > Another good reason to go with full heap names instead of opaque flags on
> > > > > > > > existing heaps is that with the former we can use symlinks in sysfs to
> > > > > > > > specify heaps, with the latter we need a new idea. We haven't yet gotten
> > > > > > > > around to implement this anywhere, but it's been in the dma-buf/heap todo
> > > > > > > > since forever, and I like it as a design approach. So would be a good idea
> > > > > > > > to not toss it. With that display would have symlinks to cma-ecc and cma,
> > > > > > > > and rendering maybe cma-ecc, shmem, cma heaps (in priority order) for a
> > > > > > > > SoC where the display needs contig memory for scanout.
> > > > > > > 
> > > > > > > So indeed that is a good point to keep in mind, but I also think it
> > > > > > > might re-inforce the choice of having ECC as a flag here.
> > > > > > > 
> > > > > > > Since my understanding of the sysfs symlinks to heaps idea is about
> > > > > > > being able to figure out a common heap from a collection of devices,
> > > > > > > it's really about the ability for the driver to access the type of
> > > > > > > memory. If ECC is just an attribute of the type of memory (as in this
> > > > > > > patch series), it being on or off won't necessarily affect
> > > > > > > compatibility of the buffer with the device.  Similarly "uncached"
> > > > > > > seems more of an attribute of memory type and not a type itself.
> > > > > > > Hardware that can access non-contiguous "system" buffers can access
> > > > > > > uncached system buffers.
> > > > > > 
> > > > > > Yeah, but in graphics there's a wide band where "shit performance" is
> > > > > > defacto "not useable (as intended at least)".
> > > > > > 
> > > > > > So if we limit the symlink idea to just making sure zero-copy access is
> > > > > > possible, then we might not actually solve the real world problem we need
> > > > > > to solve. And so the symlinks become somewhat useless, and we need to
> > > > > > somewhere encode which flags you need to use with each symlink.
> > > > > > 
> > > > > > But I also see the argument that there's a bit a combinatorial explosion
> > > > > > possible. So I guess the question is where we want to handle it ...
> > > > > 
> > > > > Sorry for jumping into this discussion so late. But are we really
> > > > > concerned about this combinatorial explosion in practice? It may be
> > > > > theoretically possible to create any combination of these, but do we
> > > > > expect more than a couple of heaps to exist in any given system?
> > > > 
> > > > I don't worry too much about the number of heaps available in a given
> > > > system, it would indeed be fairly low.
> > > > 
> > > > My concern is about the semantics combinatorial explosion. So far, the
> > > > name has carried what semantics we were supposed to get from the buffer
> > > > we allocate from that heap.
> > > > 
> > > > The more variations and concepts we'll have, the more heap names we'll
> > > > need, and with confusing names since we wouldn't be able to change the
> > > > names of the heaps we already have.
> > > 
> > > What I was trying to say is that none of this matters if we make these
> > > names opaque. If these names are contextual for the given system it
> > > doesn't matter what the exact capabilities are. It only matters that
> > > their purpose is known and that's what applications will be interested
> > > in.
> > 
> > If the names are opaque, and we don't publish what the exact
> > capabilities are, how can an application figure out which heap to use in
> > the first place?
> 
> This would need to be based on conventions. The idea is to standardize
> on a set of names for specific, well-known use-cases.
> 
> > > > > Would it perhaps make more sense to let a platform override the heap
> > > > > name to make it more easily identifiable? Maybe this is a naive
> > > > > assumption, but aren't userspace applications and drivers not primarily
> > > > > interested in the "type" of heap rather than whatever specific flags
> > > > > have been set for it?
> > > > 
> > > > I guess it depends on what you call the type of a heap. Where we
> > > > allocate the memory from, sure, an application won't care about that.
> > > > How the buffer behaves on the other end is definitely something
> > > > applications are going to be interested in though.
> > > 
> > > Most of these heaps will be very specific, I would assume.
> > 
> > We don't have any specific heap upstream at the moment, only generic
> > ones.
> 
> But we're trying to add more specific ones, right?
> 
> > > For example a heap that is meant to be protected for protected video
> > > decoding is both going to be created in such a way as to allow that
> > > use-case (i.e. it doesn't make sense for it to be uncached, for
> > > example) and it's also not going to be useful for any other use-case
> > > (i.e. there's no reason to use that heap for GPU jobs or networking,
> > > or whatever).
> > 
> > Right. But also, libcamera has started to use dma-heaps to allocate
> > dma-capable buffers and do software processing on it before sending it
> > to some hardware controller.
> > 
> > Caches are critical here, and getting a non-cacheable buffer would be
> > a clear regression.
> 
> I understand that. My point is that maybe we shouldn't try to design a
> complex mechanism that allows full discoverability of everything that a
> heap supports or is capable of. Instead if the camera has specific
> requirements, it could look for a heap named "camera". Or if it can
> share a heap with other multimedia devices, maybe call the heap
> "multimedia".
> 
> The idea is that heaps for these use-cases are quite specific, so you
> would likely not find an arbitrary number of processes try to use the
> same heap.

Yeah the idea to sort this out was to have symlinks in sysfs from the
device to each heap. We could then have priorities for each such link, so
that applications can pick the "best" heap that will work with all
devices. Or also special links for special use-cases, like for a
display+render drm device you might want to have separate links for the
display and the render-only use-case.

I think trying to encode this all into the name of a heap without linking
it to the device is not going to work well in general.

We still have that entire "make sysfs symlinks work for dma-buf heaps" on
our todos, and that idea is almost as old as dma-buf itself :-/
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

