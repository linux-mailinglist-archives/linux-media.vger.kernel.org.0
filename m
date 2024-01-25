Return-Path: <linux-media+bounces-4196-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B578383CA70
	for <lists+linux-media@lfdr.de>; Thu, 25 Jan 2024 19:02:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60EBE28B2EB
	for <lists+linux-media@lfdr.de>; Thu, 25 Jan 2024 18:02:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C38713398E;
	Thu, 25 Jan 2024 18:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="ZQiM4rrs"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506DE130E52
	for <linux-media@vger.kernel.org>; Thu, 25 Jan 2024 18:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706205712; cv=none; b=s7P+oaRGnJi/vbbQM8/fPOn4u1bIyMWPmqqHlQpCpFsCBVstv/WuIwaOwo9pIP093iGUif1gU7KqI0H0UX6GFrH+hvMwHSj+qI6aakw9YJMISlZ57UF8bbPr837MejtF5Obz7y+XYheKS/kuw/Fe8G/RxAPtRsZNb2tP08XnQkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706205712; c=relaxed/simple;
	bh=XESnMHtt0LmQQMjkF2jzovqST8CyQYQtazuDlGZjIPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ByDT0B4z34LsjLZ1qCOfB1qTqZ9Q+pfFAh4Pvn8KfbM3zbRjUH8dRvnoXH7TcMkKv9/n34blA34qRZ/7jlDbNmWBrmGQtKbIPoJ3f7FuIxLK26yjw5pw5JMG4IMMH1rPKEOAfDBU6SVwJSu9xoavmxCK8m/UkLlKIHptr3otUOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=ZQiM4rrs; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a27e7b70152so186004066b.0
        for <linux-media@vger.kernel.org>; Thu, 25 Jan 2024 10:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1706205708; x=1706810508; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CFqyIQAenEPHTlUKCgxpUzsk/M5i7GUmHQ+F9rSmRts=;
        b=ZQiM4rrsV71gKzK4MwT1p7BKR+0lFdPC88FKE/+kM571NvuutBdNrAWN2F40x3JgWy
         MBZT/1WT0iqdgox/Mf/TAKYdhX6nJ0ZsJM1hxCy2ZeRE91w5v1mPvxNuqnkyW106Uifs
         dU6yRgG3yZOMnIBl3Wxiy57fJ9l6Hdx8XtaVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706205708; x=1706810508;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CFqyIQAenEPHTlUKCgxpUzsk/M5i7GUmHQ+F9rSmRts=;
        b=BoXELoPp/fRnqNxLO2by8uCBTY+pZDlqZt636w/E1IhHLdx64iQJP9mpSF4V0XVguw
         GrQu4TOZ5tbCJ+Ix/Xkot2SpQEJ4U7jXwbL6T5nglKX7ugaBwnwii8FWWtkgTmYVqegj
         vRgCNPt4uvNCk4epK5H1ngdSq0DTbM2p/WhIzcykCt6Kb3IzFZ6JniCDHINoq1H7Tghr
         f1cSER+S7dtv4yeXZqhadlhXZlMTdTQTzB1RgnxK5AGS+5oOvbRGNMaZu1CvSEJQT07Z
         j83CWfy7LqzFWmSRiQM3qmYJBoD3griKzHlBGmCD0tC9m0Q4Xo55K0wXqBYZ9b2KxgUh
         BX3Q==
X-Gm-Message-State: AOJu0YywcTk8sXQ4o3kBYuOYAoS6+ljExW4Bk8qvJHleI7T1yc0Dz7ID
	7v4j6zAtvNg7iCSU0BB8FjW55CiMmiigWD/R6NCgukWoDlwDNxW536t6/jfdAdk=
X-Google-Smtp-Source: AGHT+IGRjRpDyNOyGtuJwlJxMN3a/MkViwBNNJWcBYt6eYY1at9oh6gL4DpJYdHp/Lo+PN/TxtWMRw==
X-Received: by 2002:a17:906:5fd3:b0:a30:e4e7:c54b with SMTP id k19-20020a1709065fd300b00a30e4e7c54bmr1617880ejv.1.1706205706963;
        Thu, 25 Jan 2024 10:01:46 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id c26-20020a170906529a00b00a2f181266f6sm1261225ejm.148.2024.01.25.10.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 10:01:46 -0800 (PST)
Date: Thu, 25 Jan 2024 19:01:44 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Paul Cercueil <paul@crapouillou.net>,
	Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	linux-usb@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Linaro-mm-sig] [PATCH v5 1/6] dma-buf: Add
 dma_buf_{begin,end}_access()
Message-ID: <ZbKiCPhRvWaz4Icn@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	linux-usb@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20240119141402.44262-2-paul@crapouillou.net>
 <8035f515-591f-4c87-bf0a-23d5705d9b1c@gmail.com>
 <442f69f31ece6d441f3dc41c3dfeb4dcf52c00b8.camel@crapouillou.net>
 <0b6b8738-9ea3-44fa-a624-9297bd55778f@amd.com>
 <e4620acdf24628d904cedcb0030d78b14559f337.camel@crapouillou.net>
 <85a89505-edeb-4619-86c1-157f7abdd190@amd.com>
 <0fe2755fb320027234c086bcc88fd107855234c5.camel@crapouillou.net>
 <577501f9-9d1c-4f8d-9882-7c71090e5ef3@amd.com>
 <7928c0866ac5b2bfaaa56ad3422bedc9061e0f7b.camel@crapouillou.net>
 <2ac7562c-d221-409a-bfee-1b3cfcc0f1c6@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2ac7562c-d221-409a-bfee-1b3cfcc0f1c6@amd.com>
X-Operating-System: Linux phenom 6.6.11-amd64 

On Thu, Jan 25, 2024 at 04:00:16PM +0100, Christian König wrote:
> Am 24.01.24 um 11:58 schrieb Paul Cercueil:
> > [SNIP]
> > > > The problem was then that dma_buf_unmap_attachment cannot be called
> > > > before the dma_fence is signaled, and calling it after is already
> > > > too
> > > > late (because the fence would be signaled before the data is
> > > > sync'd).
> > >   Well what sync are you talking about? CPU sync? In DMA-buf that is
> > > handled differently.
> > >   For importers it's mandatory that they can be coherent with the
> > > exporter. That usually means they can snoop the CPU cache if the
> > > exporter can snoop the CPU cache.
> > I seem to have such a system where one device can snoop the CPU cache
> > and the other cannot. Therefore if I want to support it properly, I do
> > need cache flush/sync. I don't actually try to access the data using
> > the CPU (and when I do, I call the sync start/end ioctls).
> 
> Usually that isn't a problem as long as you don't access the data with the
> CPU.
> 
> [SNIP]
> 
> > > > (and I *think* there is a way to force coherency in the
> > > > Ultrascale's
> > > > interconnect - we're investigating it)
> > >   What you can do is that instead of using udmabuf or dma-heaps is
> > > that the device which can't provide coherency act as exporters of the
> > > buffers.
> > >   The exporter is allowed to call sync_for_cpu/sync_for_device on it's
> > > own buffers and also gets begin/end CPU access notfications. So you
> > > can then handle coherency between the exporter and the CPU.
> > But again that would only work if the importers would call
> > begin_cpu_access() / end_cpu_access(), which they don't, because they
> > don't actually access the data using the CPU.
> 
> Wow, that is a completely new use case then.
> 
> Neither DMA-buf nor the DMA subsystem in Linux actually supports this as far
> as I can see.
> 
> > Unless you mean that the exporter can call sync_for_cpu/sync_for_device
> > before/after every single DMA transfer so that the data appears
> > coherent to the importers, without them having to call
> > begin_cpu_access() / end_cpu_access().
> 
> Yeah, I mean the importers don't have to call begin_cpu_access() /
> end_cpu_access() if they don't do CPU access :)
> 
> What you can still do as exporter is to call sync_for_device() and
> sync_for_cpu() before and after each operation on your non-coherent device.
> Paired with the fence signaling that should still work fine then.
> 
> But taking a step back, this use case is not something even the low level
> DMA subsystem supports. That sync_for_cpu() does the right thing is
> coincident and not proper engineering.
> 
> What you need is a sync_device_to_device() which does the appropriate
> actions depending on which devices are involved.
> 
> > In which case - this would still demultiply the complexity; my USB-
> > functionfs interface here (and IIO interface in the separate patchset)
> > are not device-specific, so I'd rather keep them importers.
> > >   If you really don't have coherency between devices then that would
> > > be a really new use case and we would need much more agreement on how
> > > to do this.
> > [snip]
> > 
> > Agreed. Desiging a good generic solution would be better.
> > 
> > With that said...
> > 
> > Let's keep it out of this USB-functionfs interface for now. The
> > interface does work perfectly fine on platforms that don't have
> > coherency problems. The coherency issue in itself really is a
> > tangential issue.
> 
> Yeah, completely agree.
> 
> > So I will send a v6 where I don't try to force the cache coherency -
> > and instead assume that the attached devices are coherent between
> > themselves.
> > 
> > But it would be even better to have a way to detect non-coherency and
> > return an error on attach.
> 
> Take a look into the DMA subsystem. I'm pretty sure we already have
> something like this in there.
> 
> If nothing else helps you could take a look if the coherent memory access
> mask is non zero or something like that.

Jumping in way late and apolgies to everyone since yes I indeed suggested
this entire mess to Paul in some private thread.

And worse, I think we need it, it's just that we got away without it thus
far.

So way back at the og dma-buf kick-off dma coherency was discussed, and a
few things where noted:
- the dma api only supports device<->cpu coherency
- getting the full coherency model off the ground right away is probably
  too hard, so we made the decision that where it matters, relevant
  flushing needs to be done in dma_buf_map/unmap.

If you look at the earliest patches for dma-buf we had pretty clear
language that all dma-operations should be bracketed with map/unmap. Of
course that didn't work out for drm at all, and we had to first get
dma_resv_lock and dma_fence landed and then your dynamic exporter/importer
support in just to get the buffer migration functionality working, which
was only one of the things discussed that braketing everything with
map/unmap was supposed to take care of.

The other was coherency management. But looking through archives I think
this was already agreed to be postponed for later in the original kick-off
meeting and never further discussed on the mailing list.

This worked for a fairly long time, because thus far dma-buf was used on
fairly reaasonable architectures where all participating devices are
coherent enough.

We did have to add the cpu access flushing fairly quickly because there's
a lot of SoC chips (including intel) where that was necessary, but even
that was added later on, as an opt-in and without fixing every. See
fc13020e086b ("dma-buf: add support for kernel cpu access").

The ioctl to allow userspace to do flushing was added even later on, and
there the entire yolo opt-in situation is even worse. c11e391da2a8
("dma-buf: Add ioctls to allow userspace to flush") was only in 2016, 5
years after dma-buf landed.

It looks like it's finally time to add the device side flushing functions
we've talked about first over 12 years ago :-)

The reason this pops up now is that unlike other dma-buf users on maybe
somewhat more funky architectures, Paul's patches want to use dma_fence
for synchronization of the dma operations. Which means you cannot call the
full dma_buf_map/unmap dance because that takes dma_resv_lock, and
absolute no-go in a dma_fence critical path.

And yes in those 12 years the dma-api hasn't gained the device2device sync
support we'd need, but neither has it gained the multiple devices <-> cpu
sync support we'd strictly need for dma-buf. So yes this is all a terrible
hodge-podge of hacks, but if we'd require theoretically perfect code we'd
still have zero dma-buf support in upstream.

This also includes how we landed these extensions, none of them in the
past have landed with a "update all existing exporters/importers" rule. We
talked about that every time, and rejected it every time for imo pretty
good reasons - the perf impact tends to be way too harsh if you impose
over-flushing on everyone, including the reasonable platforms. And we
currently can't do less than overflushing with the current dma-api
interfaces because we dont have the specific flush functions we'd need. So
really this isn't doing a worse abuse of the dma-api than what we have.
It's definitely a bit wasteful since the functions we use do in theory
flush too much. But in practice on the these funky architectures they
flush enough.

There's also the very hard issue of actually trying to optimize flushes,
because a dma operation might only access part of a buffer, and you might
interleave read/write access by different devices in very innovative ways.
So I'm firmly on the "make it work first, then fast" side of things.

So dma-buf will continue to be a thing that's tested for specific combos,
and then we'll patch them. It's a decade-plus tradition at this point.

Which is all a very long winded way of saying that yes, I think we need
this, and we needed this 12 years ago already if we'd have aimed for
perfect.

I have a bunch of detail comments on the patch itself, but I guess we
first need to find consensus on whether it's a good idea in the first
place.

Cheers, Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

