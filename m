Return-Path: <linux-media+bounces-11522-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 993428C74E8
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 12:56:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1DDE5B22C22
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 10:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A128E145356;
	Thu, 16 May 2024 10:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="Fz/smocq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6135D143898
	for <linux-media@vger.kernel.org>; Thu, 16 May 2024 10:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715856994; cv=none; b=EVXoGOEJnZbAnUjeanmAEcu8TumjPZ8zbA4cju+XZCyXSiHFsSSndXweR/y4v5n/qdYYvAH7Ae6bV7FscLf2gGJ7Oq2OUVipPM1OK66VLfkAENF4H0bcr6Ra/gMzNMMgUoarkQ8i7w9HDeJN8N5gdyNHSjWeozoXW5m5z1hYRIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715856994; c=relaxed/simple;
	bh=BsLbCZn+JhmXnJxcv1qH56cu7tkHuVfRZhl7UEiWLEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z7A6llBkbYXimA4kCAgK0dMXG4a/bw81Ja0ihM8S9X0YvyPgaJQEL0t6nuteJ0zauyihnmrDY9bHmhtAjwfeJnX2w9f0+c0EVARkIQGpweXiv9YDx4Yi5DV78L6t/s5ztIXYmLu4k/BSE5SEjAAdMKeVXdxNaX8npig2DsmiCAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=Fz/smocq; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2e52962dbcfso14711fa.2
        for <linux-media@vger.kernel.org>; Thu, 16 May 2024 03:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1715856990; x=1716461790; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CYCaZIYD32X8OWqTmuj/FbQa01MUdFxdF5XvoFGLFW0=;
        b=Fz/smocqGZqvipuDuJ5GR6bdGTERMK1Tq5TyxPLD9dJVMnK0ANHuWKWjfXeDvUYH2O
         f8sJcJJc5Ru6hniW49DaMvZl9Oy/5jAIrwXyydOIuglZ+BJkcs6ayC5dX7fjZup4RCwb
         AD122Vh1lt9tdDezNiNNvx3SlhhpsnenfDcJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715856990; x=1716461790;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CYCaZIYD32X8OWqTmuj/FbQa01MUdFxdF5XvoFGLFW0=;
        b=ief3MX49wwYeavF9RNkO60ukxjMB8bkMPloAXDLde04BQ4GwrDhQrCAWbXz+okAe/h
         mWg/JlFVK5FaBiPZjH8iHljtr1EsGmXnju0r1YplkgUpCpw0nUskX3L9Rcomca+fyPD2
         z19m4EnRKhvNiL07q7shRznOMx7hvxg9TdO+6mZODNWOVg8TsQ2G+4fSCwz3QsIv107F
         IfVZGO3UuRbk2aIiRsiLdW5JLAjnvXdlDt/xmAI3FxEXPMjtueXm8ora1JTatmL+3sor
         Lco7iUeUE1r46Ev8YLONXjthNePLRx8KI/e+2S0sPgf7ehapq0lXWbqgPV5NAn2g9pg/
         KtrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgIFZ5wTOKvUqvUv6ILJtt6Psv80Yxugo702ZiCtM4CtnqlhRu+58P9qpKRc/EiJO8MFUOG4DKRNsf9/FNYtW+zySSmk22My6rInk=
X-Gm-Message-State: AOJu0YwPhiT84fPhEq/y9HwOuC6ufagDPLCg2CfP3bLm/xhnwHPViO1u
	iDZOhKtqKXehl7sCyeeZdI0Djr6jTAEbb0VYJSxqNgum/V5ggiN6lbYl91CK+c4=
X-Google-Smtp-Source: AGHT+IEjj4yl40IXE4RuRX4OV/v0GH5bFkfz02Pq4c/NaDR61cTtFuwAhcTUObONlIdIlDgvDa0lTA==
X-Received: by 2002:a2e:9b8b:0:b0:2e2:1647:8308 with SMTP id 38308e7fff4ca-2e51fd4b33emr121987831fa.2.1715856990407;
        Thu, 16 May 2024 03:56:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-351c6f295e2sm6725490f8f.39.2024.05.16.03.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 03:56:29 -0700 (PDT)
Date: Thu, 16 May 2024 12:56:27 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: John Stultz <jstultz@google.com>
Cc: Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
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
Message-ID: <ZkXmWwmdPsqAo7VU@phenom.ffwll.local>
Mail-Followup-To: John Stultz <jstultz@google.com>,
	Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
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
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANDhNCoOKwtpstFE2VDcUvzdXUWkZ-Zx+fz6xrdPWTyciVXMXQ@mail.gmail.com>
X-Operating-System: Linux phenom 6.6.15-amd64 

On Wed, May 15, 2024 at 11:42:58AM -0700, John Stultz wrote:
> On Wed, May 15, 2024 at 6:57 AM Maxime Ripard <mripard@kernel.org> wrote:
> > This series is the follow-up of the discussion that John and I had a few
> > months ago here:
> >
> > https://lore.kernel.org/all/CANDhNCquJn6bH3KxKf65BWiTYLVqSd9892-xtFDHHqqyrroCMQ@mail.gmail.com/
> >
> > The initial problem we were discussing was that I'm currently working on
> > a platform which has a memory layout with ECC enabled. However, enabling
> > the ECC has a number of drawbacks on that platform: lower performance,
> > increased memory usage, etc. So for things like framebuffers, the
> > trade-off isn't great and thus there's a memory region with ECC disabled
> > to allocate from for such use cases.
> >
> > After a suggestion from John, I chose to start using heap allocations
> > flags to allow for userspace to ask for a particular ECC setup. This is
> > then backed by a new heap type that runs from reserved memory chunks
> > flagged as such, and the existing DT properties to specify the ECC
> > properties.
> >
> > We could also easily extend this mechanism to support more flags, or
> > through a new ioctl to discover which flags a given heap supports.
> 
> Hey! Thanks for sending this along! I'm eager to see more heap related
> work being done upstream.
> 
> The only thing that makes me a bit hesitant, is the introduction of
> allocation flags (as opposed to a uniquely specified/named "ecc"
> heap).
> 
> We did talk about this earlier, and my earlier press that only if the
> ECC flag was general enough to apply to the majority of heaps then it
> makes sense as a flag, and your patch here does apply it to all the
> heaps. So I don't have an objection.
> 
> But it makes me a little nervous to add a new generic allocation flag
> for a feature most hardware doesn't support (yet, at least). So it's
> hard to weigh how common the actual usage will be across all the
> heaps.
> 
> I apologize as my worry is mostly born out of seeing vendors really
> push opaque feature flags in their old ion heaps, so in providing a
> flags argument, it was mostly intended as an escape hatch for
> obviously common attributes. So having the first be something that
> seems reasonable, but isn't actually that common makes me fret some.
> 
> So again, not an objection, just something for folks to stew on to
> make sure this is really the right approach.

Another good reason to go with full heap names instead of opaque flags on
existing heaps is that with the former we can use symlinks in sysfs to
specify heaps, with the latter we need a new idea. We haven't yet gotten
around to implement this anywhere, but it's been in the dma-buf/heap todo
since forever, and I like it as a design approach. So would be a good idea
to not toss it. With that display would have symlinks to cma-ecc and cma,
and rendering maybe cma-ecc, shmem, cma heaps (in priority order) for a
SoC where the display needs contig memory for scanout.

> Another thing to discuss, that I didn't see in your mail: Do we have
> an open-source user of this new flag?

I think one option might be to just start using these internally, but not
sure the dma-api would understand a fallback cadence of allocators (afaik
you can specify specific cma regions already, but that doesn't really
covere the case where you can fall back to pages and iommu to remap to
contig dma space) ... And I don't think abandonding the dma-api for
allocating cma buffers is going to be a popular proposal.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

