Return-Path: <linux-media+bounces-11784-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A3B8CCF90
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 11:45:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 61685B21173
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 09:45:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 627C613D503;
	Thu, 23 May 2024 09:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="NWhFxiDA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339E347A7C
	for <linux-media@vger.kernel.org>; Thu, 23 May 2024 09:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716457534; cv=none; b=eqZt9F5RW5yOxU8NlZN/uMlOcGrwV3ubw+i1A1pdUcaqIJV7viV2e6PB58zNC59jBl9aiaOcsHcZ2NpJ7t+JBq4ybJ/pSzc8rRLwNMpv6cUL7CKtJbuMTQ3py9sOoQeLWNo1a/rjoZLNTWLdIXzB2soiLCnbmTJxbQvH9nmJ+Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716457534; c=relaxed/simple;
	bh=AKnmMDa3xsyKPpyTzzjMqUtRMDJBkMsw9OnRetaowUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WOIUfypZ1oOovQSZ67w2IeslZZp2tM1ka99rJ3n95OGtTEhAVz7NVja8iMs3NaOL+CniXmKGdRM3brX2VB2QvQg/QKAB32DRzVeZszKhxRg1+yMTUk4L+I4SL2cVQP+ewml3afevPrvVofV4vQjO0CjUVz1cBKXF83Pdp9Xtt2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=NWhFxiDA; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-354c3a7f972so83461f8f.1
        for <linux-media@vger.kernel.org>; Thu, 23 May 2024 02:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1716457531; x=1717062331; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rua3OglaGtRzvLpfCStU07S245n5hB3FYrd8MuHxXyo=;
        b=NWhFxiDAYYBwWPPiW3sg1oDiha23tvxlJbw7fPOYY1LX5Ko4Fzw/AbG8uFksH4io0n
         1mIIPjYVHd8dH9qoTWUUU7CSaaNXaY6fBI1GMAgQdwnjey/NPn1/0r4qQYR1QfAnbxWM
         nM3eocl26+1ToWy2qU6/uRn1APAcQGZ722ig8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716457531; x=1717062331;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rua3OglaGtRzvLpfCStU07S245n5hB3FYrd8MuHxXyo=;
        b=MtoG1zhnRAjWoCC/kSCfEZXR2dF0blMxiiGU01TuZFnXvSicd3wUOqLHf1lrKyMWIn
         vtHqtfQHrYc9LMQRgkVD4S1lT/yBe5//JHjUguZntOnWLQSt4/yY3Qzcq+Onlc+rQPjf
         f6EfAXR8vUanQ82zoP57tUKGExDpIrY+kV5JE/DDvkrvexvvE6R5Tbkf5E6vmcAkueFT
         mtNtbR+MgwOt1Be5Qqj3Kzeg7aHZNLOWeXYVbFLEtpxykpQcvRzPhl1MrSASgC6onkF7
         h4s7mkU+6Iff3Azm74rX9Mzj/bknSBHvad9sSL3mgT+/zi4rTTvnnJr2iDc69yiqnJod
         e/FA==
X-Forwarded-Encrypted: i=1; AJvYcCVEH/D9hX5HLRJwE+qGL8SaTxEhtRWIIaBjMPk32q5V32kCRTCxM2MTWli09icteIfs4gYeqpt6FZ8sO1q/KJriDJhQTUTPtTpv/7k=
X-Gm-Message-State: AOJu0YyjYJVPA6W8Xp3bgTBdYuA3TRV+teXZQzGeeHHGb0dUJY0oYzx4
	m9cncWrukOd/Y3nxU9xKJV0oYZ2Lh9VhSkLrNTwR/gc1WW4MwlKsiRF8XDKDkzY=
X-Google-Smtp-Source: AGHT+IG15s9jGPIJ1Tt73n14VxOUlfIOXJ5tvzDkW3ed8IqDv2vSAEij8VrZEa4QLVo3Rsx8X1k4gA==
X-Received: by 2002:a05:600c:511e:b0:41b:e58c:e007 with SMTP id 5b1f17b1804b1-420fd386158mr32798045e9.4.1716457531398;
        Thu, 23 May 2024 02:45:31 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100f7b7f9sm20030635e9.27.2024.05.23.02.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 02:45:30 -0700 (PDT)
Date: Thu, 23 May 2024 11:45:28 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Maxime Ripard <mripard@kernel.org>
Cc: John Stultz <jstultz@google.com>, Rob Herring <robh@kernel.org>,
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
Message-ID: <Zk8QOB6F4pd__WvA@phenom.ffwll.local>
Mail-Followup-To: Maxime Ripard <mripard@kernel.org>,
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
 <20240522-coral-fennec-from-uranus-fb7263@houat>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240522-coral-fennec-from-uranus-fb7263@houat>
X-Operating-System: Linux phenom 6.8.9-amd64 

On Wed, May 22, 2024 at 03:18:02PM +0200, Maxime Ripard wrote:
> On Tue, May 21, 2024 at 02:06:19PM GMT, Daniel Vetter wrote:
> > On Thu, May 16, 2024 at 09:51:35AM -0700, John Stultz wrote:
> > > On Thu, May 16, 2024 at 3:56 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > On Wed, May 15, 2024 at 11:42:58AM -0700, John Stultz wrote:
> > > > > But it makes me a little nervous to add a new generic allocation flag
> > > > > for a feature most hardware doesn't support (yet, at least). So it's
> > > > > hard to weigh how common the actual usage will be across all the
> > > > > heaps.
> > > > >
> > > > > I apologize as my worry is mostly born out of seeing vendors really
> > > > > push opaque feature flags in their old ion heaps, so in providing a
> > > > > flags argument, it was mostly intended as an escape hatch for
> > > > > obviously common attributes. So having the first be something that
> > > > > seems reasonable, but isn't actually that common makes me fret some.
> > > > >
> > > > > So again, not an objection, just something for folks to stew on to
> > > > > make sure this is really the right approach.
> > > >
> > > > Another good reason to go with full heap names instead of opaque flags on
> > > > existing heaps is that with the former we can use symlinks in sysfs to
> > > > specify heaps, with the latter we need a new idea. We haven't yet gotten
> > > > around to implement this anywhere, but it's been in the dma-buf/heap todo
> > > > since forever, and I like it as a design approach. So would be a good idea
> > > > to not toss it. With that display would have symlinks to cma-ecc and cma,
> > > > and rendering maybe cma-ecc, shmem, cma heaps (in priority order) for a
> > > > SoC where the display needs contig memory for scanout.
> > > 
> > > So indeed that is a good point to keep in mind, but I also think it
> > > might re-inforce the choice of having ECC as a flag here.
> > > 
> > > Since my understanding of the sysfs symlinks to heaps idea is about
> > > being able to figure out a common heap from a collection of devices,
> > > it's really about the ability for the driver to access the type of
> > > memory. If ECC is just an attribute of the type of memory (as in this
> > > patch series), it being on or off won't necessarily affect
> > > compatibility of the buffer with the device.  Similarly "uncached"
> > > seems more of an attribute of memory type and not a type itself.
> > > Hardware that can access non-contiguous "system" buffers can access
> > > uncached system buffers.
> > 
> > Yeah, but in graphics there's a wide band where "shit performance" is
> > defacto "not useable (as intended at least)".
> 
> Right, but "not useable" is still kind of usage dependent, which
> reinforces the need for flags (and possibly some way to discover what
> the heap supports).
> 
> Like, if I just want to allocate a buffer for a single writeback frame,
> then I probably don't have the same requirements than a compositor that
> needs to output a frame at 120Hz.
> 
> The former probably doesn't care about the buffer attributes aside that
> it's accessible by the device. The latter probably can't make any kind
> of compromise over what kind of memory characteristics it uses.
> 
> If we look into the current discussions we have, a compositor would
> probably need a buffer without ECC, non-secure, and probably wouldn't
> care about caching and being physically contiguous.
> 
> Libcamera's SoftISP would probably require that the buffer is cacheable,
> non-secure, without ECC and might ask for physically contiguous buffers.
> 
> As we add more memory types / attributes, I think being able to discover
> and enforce a particular set of flags will be more and more important,
> even more so if we tie heaps to devices, because it just gives a hint
> about the memory being reachable from the device, but as you said, you
> can still get a buffer with shit performance that won't be what you
> want.
> 
> > So if we limit the symlink idea to just making sure zero-copy access is
> > possible, then we might not actually solve the real world problem we need
> > to solve. And so the symlinks become somewhat useless, and we need to
> > somewhere encode which flags you need to use with each symlink.
> > 
> > But I also see the argument that there's a bit a combinatorial explosion
> > possible. So I guess the question is where we want to handle it ...
> > 
> > Also wondering whether we should get the symlink/allocator idea off the
> > ground first, but given that that hasn't moved in a decade it might be too
> > much. But then the question is, what userspace are we going to use for all
> > these new heaps (or heaps with new flags)?
> 
> For ECC here, the compositors are the obvious target. Which loops backs
> into the discussion with John. Do you consider dma-buf code have the
> same uapi requirements as DRM?

Imo yes, otherwise we'll get really funny stuff like people bypass drm's
userspace requirement for e.g. content protected buffers by just shipping
the feature in a dma-buf heap ... Been there, done that.

Also I think especially with interop across components there's a huge
difference between a quick test program toy and the real thing. And
dma-buf heaps are kinda all about cross component interop.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

