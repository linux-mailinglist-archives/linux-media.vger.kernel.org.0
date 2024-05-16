Return-Path: <linux-media+bounces-11518-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C7F8C7485
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 12:18:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 471E01C22D12
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 10:18:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7CF6143C54;
	Thu, 16 May 2024 10:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="T6gfGK9B"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96753143754
	for <linux-media@vger.kernel.org>; Thu, 16 May 2024 10:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715854698; cv=none; b=Hlrjw8NczO8NRAxbvEwaG/XrPqRkyz519zZ9SjzJzLi0ZK0sX/SIhSAjDv+qlKLBoE72uYkGO/b/aJW4U3DV7c4XHL8xeQEvzaWUo1rVS4QBzrthf5l4PV+0e+zk/lcPoegOFO/HKmLlaal/XlXWVjslEizaEzs6JRPeC1pS+Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715854698; c=relaxed/simple;
	bh=/g8E/M0prGmmgcgPZCaW0A7ShyGn2zDAARpOKjGFQyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OuwYio+jcRM5gOWdOJJWeGkLvxTC7wtJuD808iDJI7oyd2GG7Vg4kwEP2Ly1JSPKJS1ASuhWp35uMeRXFhFg/psckWoq/4gJnf5uL7bzQ2YVt0JQVgUjRiHxK/wluThZMqHEottHADP3+Uq3vLMkie2zBIbBl5EyS8TJ3r6NlJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=T6gfGK9B; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4200e4b7bcbso7848875e9.1
        for <linux-media@vger.kernel.org>; Thu, 16 May 2024 03:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1715854695; x=1716459495; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8TJDXJKaQUdW/2WF0Ge4iVoqYkhg+zWynHOclwI6BcY=;
        b=T6gfGK9Be9gQ/EHkLKIcki22nEipVxQQ0DqN+T5nK+nUqewlfZdePHmv7u49jAHs/h
         lo2GyiBUTr8Fr5DsvXyqM83dvPDJPYFf7CIrQ3clkj3TKveczfsw1/QIHuBJgihSiowk
         TZvYy/sM9ZBJw4cxSavlUSs2KfBcIV8S6R2qI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715854695; x=1716459495;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8TJDXJKaQUdW/2WF0Ge4iVoqYkhg+zWynHOclwI6BcY=;
        b=UuhFEIRvHe7TiqE/8x1OEN/o8W55vgE5tzzc5Dhd9WSdVZWQddBF7RvHJNozjyGzz7
         87+on/EFGdA9BcPLbFVFNUGjZ1untUEOa5pC5pfdKLKc43j1kWz3MMqGc7rk66EiSFpB
         b+RFVoRDfn53WFKlocyiPxtYvXxxq+2N/5URHwMEqJ4w85i4noeYKzYpSjf7V13MkMsw
         IuVqNEn9I0Ff9eOAP/yWhhlSqCWhv/MO6P9PE8iEFZA9VKNIGjFHwJLplutRVmiFA7+p
         jd9gnU8XkXwD6mF/xVYOTqhghK52i5ExOxvKTv1Jx1ck9ibjdnNWjYQgmeVBwAKRNnQT
         PlRw==
X-Forwarded-Encrypted: i=1; AJvYcCXNNaMZVaUmMI/CCH1qgnhagpYlVzGJWeao+FwyM/lR8OA5tnJiXykGUY30exlAAFp/pUoi9r1bg01RA+Pn5UkWSTDxyvbNIG1b9rU=
X-Gm-Message-State: AOJu0Yx6j4pCPgN3dQRTiv5aKCMa7L0+863ZshRNxaPIHZlj38VL8xfB
	Zffe0gp6HM0DvezS+97Btk2Un14TXhwnIQB80gcwiJlgAzwDs+zYRisDOLw4aD0=
X-Google-Smtp-Source: AGHT+IG1TPzGwHl4apjazHkVeFsaJK8zkxRgSZYPHdggvbCW8ifvCjuF5EuKt5xYF73xI9ZzEUOQZA==
X-Received: by 2002:a05:600c:5116:b0:418:ef65:4b11 with SMTP id 5b1f17b1804b1-41feac59e8amr154465585e9.2.1715854694962;
        Thu, 16 May 2024 03:18:14 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4201088fe8csm183349845e9.32.2024.05.16.03.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 03:18:14 -0700 (PDT)
Date: Thu, 16 May 2024 12:18:12 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Daniel Stone <daniel@fooishbar.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Maxime Ripard <mripard@redhat.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Lennart Poettering <mzxreary@0pointer.de>,
	Robert Mader <robert.mader@collabora.com>,
	Sebastien Bacher <sebastien.bacher@canonical.com>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	linaro-mm-sig@lists.linaro.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Milan Zamazal <mzamazal@redhat.com>,
	Andrey Konovalov <andrey.konovalov.ynk@gmail.com>
Subject: Re: Safety of opening up /dev/dma_heap/* to physically present users
 (udev uaccess tag) ?
Message-ID: <ZkXdZBwPvZun33Fi@phenom.ffwll.local>
Mail-Followup-To: Daniel Stone <daniel@fooishbar.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Maxime Ripard <mripard@redhat.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Lennart Poettering <mzxreary@0pointer.de>,
	Robert Mader <robert.mader@collabora.com>,
	Sebastien Bacher <sebastien.bacher@canonical.com>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	linaro-mm-sig@lists.linaro.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Milan Zamazal <mzamazal@redhat.com>,
	Andrey Konovalov <andrey.konovalov.ynk@gmail.com>
References: <bb372250-e8b8-4458-bc99-dd8365b06991@redhat.com>
 <20240506-dazzling-nippy-rhino-eabccd@houat>
 <ZjjdUBYYKXJ1EPr5@phenom.ffwll.local>
 <cbe5a743-d8be-4b0e-99c4-e804fbadc099@redhat.com>
 <ZjoNTw-TkPnnWLTG@phenom.ffwll.local>
 <CAPj87rN3uSZoHpWLSQqz1SW9YMZNj9fkoA_EDEE_bzv-Tw8tSw@mail.gmail.com>
 <Zjs42PGvilLlF0Cg@phenom.ffwll.local>
 <CAPj87rN-wSbGSAoB8y3MXCS20_MAQvfpWSeUKYR6XzQ+Oh0FZA@mail.gmail.com>
 <Zjue98r4ZgGbMN5K@phenom.ffwll.local>
 <CAPj87rPywSjKLrv00N-0SrkDndPdYGCBeveO0adh4xGCp20h9g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPj87rPywSjKLrv00N-0SrkDndPdYGCBeveO0adh4xGCp20h9g@mail.gmail.com>
X-Operating-System: Linux phenom 6.6.15-amd64 

On Thu, May 09, 2024 at 10:23:16AM +0100, Daniel Stone wrote:
> Hi,
> 
> On Wed, 8 May 2024 at 16:49, Daniel Vetter <daniel@ffwll.ch> wrote:
> > On Wed, May 08, 2024 at 09:38:33AM +0100, Daniel Stone wrote:
> > > Right now, if your platform requires CMA for display, then the app
> > > needs access to the GPU render node and the display node too, in order
> > > to allocate buffers which the compositor can scan out directly. If it
> > > only has access to the render nodes and not the display node, it won't
> > > be able to allocate correctly, so its content will need a composition
> > > pass, i.e. performance penalty for sandboxing. But if it can allocate
> > > correctly, then hey, it can exhaust CMA just like heaps can.
> > >
> > > Personally I think we'd be better off just allowing access and
> > > figuring out cgroups later. It's not like the OOM story is great
> > > generally, and hey, you can get there with just render nodes ...
> >
> > Imo the right fix is to ask the compositor to allocate the buffers in this
> > case, and then maybe have some kind of revoke/purge behaviour on these
> > buffers. Compositor has an actual idea of who's a candidate for direct
> > scanout after all, not the app. Or well at least force migrate the memory
> > from cma to shmem.
> >
> > If you only whack cgroups on this issue you're still stuck in the world
> > where either all apps together can ddos the display or no one can
> > realistically direct scanout.
> 
> Mmm, back to DRI2. I can't say I'm wildly enthused about that, not
> least because a client using GPU/codec/etc for those buffers would
> have to communicate its requirements (alignment etc) forward to the
> compositor in order for the compositor to allocate for it. Obviously
> passing the constraints etc around isn't a solved problem yet, but it
> is at least contained down in clients rather than making it back and
> forth between client and compositor.

I don't think you need the compositor to allocate the buffer from the
requirements, you only need a protocol that a) allocates a buffer of a
given size from a given heap and b) has some kinda of revoke provisions so
that the compositor can claw back the memory again when it needs it.

> I'm extremely not-wild about the compositor migrating memory from CMA
> to shmem behind the client's back, and tbh I'm not sure how that would
> even work if the client has it pinned through whatever API it's
> imported into.

Other option is revoke on cma buffers that are allocated by clients, for
the case the compositor needs it.

> Anyway, like Laurent says, if we're deciding that heaps can't be used
> by generic apps (unlike DRM/V4L2/etc), then we need gralloc.

gralloc doesn't really fix this, it's just abstraction around how/where
you allocate?

Anyway the current plan is that we all pretend this issue of CMA allocated
buffers don't exist and we let clients allocate without limits. Given that
we don't even have cgroups to sort out the mess for anything else I
wouldn't worry too much ...
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

