Return-Path: <linux-media+bounces-3883-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 72330831AEB
	for <lists+linux-media@lfdr.de>; Thu, 18 Jan 2024 14:56:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CE1B0B231DE
	for <lists+linux-media@lfdr.de>; Thu, 18 Jan 2024 13:56:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3787B25764;
	Thu, 18 Jan 2024 13:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="DCy5RD1X"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D2925613
	for <linux-media@vger.kernel.org>; Thu, 18 Jan 2024 13:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705586197; cv=none; b=Wfwt7n2QwU8UlI2+E16EdvaRiCEXQkXE9LqDfKwlgAAPI2C8YtRDKOTqOC+hEhXhdGurK5SXp9YbH8jv1hs9CMkKAe2rWy6qyFj4MmTfy8DTcKKFyAKi8inWcHnYdIji9oF7muHHfWkjM3KfDqUSskxs/iNmlk4u+PeCTbADwQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705586197; c=relaxed/simple;
	bh=XENZZjMay7uqo6mDnLdduSOCFOYnaOJgKY/1mLakCOY=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:Date:
	 From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-Operating-System; b=mdXIP1IyYzYoJEYHh1iQb7JpFZJuMS5hs3777Bxy4n7EXCu92EeXsDTKhX9bUHef3B0b/Y4GtQNJZjig3/xHwXLUNUlrpST5QaDl15f+J+BWOwLP2tqPQinsG6nL3On+32CyaqdB0Qf/kXrZCaGBQTUJSnLqnFOIiaoNAXTf+EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=DCy5RD1X; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a29b850ec66so378850566b.1
        for <linux-media@vger.kernel.org>; Thu, 18 Jan 2024 05:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1705586194; x=1706190994; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1IYPJn/a5Pq896DlCmoRRTPqo91KrrT2prswIwfhJB8=;
        b=DCy5RD1XI45COcXiZwojT9XkqPmRGlC6y7jizBLcLyoiCZc2SitiChNAux4cLHvYzh
         uUG99ViafNzFniDG4VK/EDJPJJl/lbMMVG0oKFsJvOWfdfiSVj4jE3DK7VkzUPojeqaF
         w0G1KBz1BNlz2lw3XRv8C8RoZUn7CJ9J33l3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705586194; x=1706190994;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1IYPJn/a5Pq896DlCmoRRTPqo91KrrT2prswIwfhJB8=;
        b=JXTD/ssr81WEoatOlj5S2uaAo1QTkBpXJsIiW2HaQno6UxyAVubLna7whaC/r/RQkV
         68PgkqA9Rv0UXqBo/dYp60GZuvaOj3AgV4glEcUohZBtf+cjCRw4nad9ZaSOKcl2fUrK
         bxPpRSRSJEC3lb6+x0siVicP2MZzakFBr/5Ox2pTbx6iQryUcyoCMCsx/kQ1e3Ut28+5
         7qmf7trX2I6Zjb6ndkYNAy1zdOxED9jq3WA0H75GnT83BoTZjGob9Y1TcWh5scrV4Ufj
         wltkfO1w+zgqO4gIqr6HWL1D8ca0ttkajDxxB8U7jrH5u9qrcQSeE8ArrgfM6jbJiNQa
         N5pg==
X-Gm-Message-State: AOJu0YxKrtkFSOX5ucbZz8n9rtjjldcWI1ox+RlXMQc7aznPss14Ft6g
	v+ovpuPzpHhqWGQdO1vvj2PEr3yhw8GGXTjkI0YavP5OKz8VBxIFhGnzjRFhUX8=
X-Google-Smtp-Source: AGHT+IES5ZV4QCCgLR09qpduhC7CspLXmDi36kNXcd6+V3t2Mgj+wn13qQd63yjm97zOLA50AfGm1A==
X-Received: by 2002:a17:906:817:b0:a2a:6916:60de with SMTP id e23-20020a170906081700b00a2a691660demr1148453ejd.4.1705586194329;
        Thu, 18 Jan 2024 05:56:34 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id cd6-20020a170906b34600b00a2c8e9918casm8557605ejb.198.2024.01.18.05.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jan 2024 05:56:33 -0800 (PST)
Date: Thu, 18 Jan 2024 14:56:31 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Daniel Vetter <daniel@ffwll.ch>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	linux-doc@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
	linaro-mm-sig@lists.linaro.org,
	Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>, linux-media@vger.kernel.org
Subject: Re: [PATCH v3 3/4] usb: gadget: functionfs: Add DMABUF import
 interface
Message-ID: <ZakuD-ns-5UJmrRi@phenom.ffwll.local>
Mail-Followup-To: Paul Cercueil <paul@crapouillou.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	linux-doc@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
	linaro-mm-sig@lists.linaro.org,
	Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>, linux-media@vger.kernel.org
References: <20240108120056.22165-1-paul@crapouillou.net>
 <20240108120056.22165-4-paul@crapouillou.net>
 <ZZvtEXL8DLPPdtPs@phenom.ffwll.local>
 <a44aca93adc60ce56a64c50797a029631900172e.camel@crapouillou.net>
 <ZZwU827NMHbx7bsO@phenom.ffwll.local>
 <2c0d4ef1b657c56ea2290fe16d757ce563a3e71b.camel@crapouillou.net>
 <ZZxKvR9gjH8D5qxj@phenom.ffwll.local>
 <31e56028b4d865c60b7c01b2a305b3dd8a21ff7a.camel@crapouillou.net>
 <ZZ1Dx1Jqbi61_Afb@phenom.ffwll.local>
 <c100b5f75b12de4a331dd36de3573483dbde915f.camel@crapouillou.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c100b5f75b12de4a331dd36de3573483dbde915f.camel@crapouillou.net>
X-Operating-System: Linux phenom 6.5.0-4-amd64 

On Mon, Jan 15, 2024 at 01:54:27PM +0100, Paul Cercueil wrote:
> Hi Daniel / Sima,
> 
> Le mardi 09 janvier 2024 à 14:01 +0100, Daniel Vetter a écrit :
> > On Tue, Jan 09, 2024 at 12:06:58PM +0100, Paul Cercueil wrote:
> > > Hi Daniel / Sima,
> > > 
> > > Le lundi 08 janvier 2024 à 20:19 +0100, Daniel Vetter a écrit :
> > > > On Mon, Jan 08, 2024 at 05:27:33PM +0100, Paul Cercueil wrote:
> > > > > Le lundi 08 janvier 2024 à 16:29 +0100, Daniel Vetter a écrit :
> > > > > > On Mon, Jan 08, 2024 at 03:21:21PM +0100, Paul Cercueil
> > > > > > wrote:
> > > > > > > Hi Daniel (Sima?),
> > > > > > > 
> > > > > > > Le lundi 08 janvier 2024 à 13:39 +0100, Daniel Vetter a
> > > > > > > écrit :
> > > > > > > > On Mon, Jan 08, 2024 at 01:00:55PM +0100, Paul Cercueil
> > > > > > > > wrote:
> > > > > > > > > +static void ffs_dmabuf_signal_done(struct
> > > > > > > > > ffs_dma_fence
> > > > > > > > > *dma_fence, int ret)
> > > > > > > > > +{
> > > > > > > > > +	struct ffs_dmabuf_priv *priv = dma_fence-
> > > > > > > > > >priv;
> > > > > > > > > +	struct dma_fence *fence = &dma_fence->base;
> > > > > > > > > +
> > > > > > > > > +	dma_fence_get(fence);
> > > > > > > > > +	fence->error = ret;
> > > > > > > > > +	dma_fence_signal(fence);
> > > > > > > > > +
> > > > > > > > > +	dma_buf_unmap_attachment(priv->attach,
> > > > > > > > > dma_fence-
> > > > > > > > > > sgt,
> > > > > > > > > dma_fence->dir);
> > > > > > > > > +	dma_fence_put(fence);
> > > > > > > > > +	ffs_dmabuf_put(priv->attach);
> > > > > > > > 
> > > > > > > > So this can in theory take the dma_resv lock, and if the
> > > > > > > > usb
> > > > > > > > completion
> > > > > > > > isn't an unlimited worker this could hold up completion
> > > > > > > > of
> > > > > > > > future
> > > > > > > > dma_fence, resulting in a deadlock.
> > > > > > > > 
> > > > > > > > Needs to be checked how usb works, and if stalling
> > > > > > > > indefinitely
> > > > > > > > in
> > > > > > > > the
> > > > > > > > io_complete callback can hold up the usb stack you need
> > > > > > > > to:
> > > > > > > > 
> > > > > > > > - drop a dma_fence_begin/end_signalling annotations in
> > > > > > > > here
> > > > > > > > - pull out the unref stuff into a separate preallocated
> > > > > > > > worker
> > > > > > > > (or at
> > > > > > > >   least the final unrefs for ffs_dma_buf).
> > > > > > > 
> > > > > > > Only ffs_dmabuf_put() can attempt to take the dma_resv and
> > > > > > > would
> > > > > > > have
> > > > > > > to be in a worker, right? Everything else would be inside
> > > > > > > the
> > > > > > > dma_fence_begin/end_signalling() annotations?
> > > > > > 
> > > > > > Yup. Also I noticed that unlike the iio patches you don't
> > > > > > have
> > > > > > the
> > > > > > dma_buf_unmap here in the completion path (or I'm blind?),
> > > > > > which
> > > > > > helps a
> > > > > > lot with avoiding trouble.
> > > > > 
> > > > > They both call dma_buf_unmap_attachment() in the "signal done"
> > > > > callback, the only difference I see is that it is called after
> > > > > the
> > > > > dma_fence_put() in the iio patches, while it's called before
> > > > > dma_fence_put() here.
> > > > 
> > > > I was indeed blind ...
> > > > 
> > > > So the trouble is this wont work because:
> > > > - dma_buf_unmap_attachment() requires dma_resv_lock. This is a
> > > > somewhat
> > > >   recent-ish change from 47e982d5195d ("dma-buf: Move
> > > >   dma_buf_map_attachment() to dynamic locking specification"), so
> > > > maybe
> > > >   old kernel or you don't have full lockdep enabled to get the
> > > > right
> > > >   splat.
> > > > 
> > > > - dma_fence critical section forbids dma_resv_lock
> > > > 
> > > > Which means you need to move this out, but then there's the
> > > > potential
> > > > cache management issue. Which current gpu drivers just kinda
> > > > ignore
> > > > because it doesn't matter for current use-case, they all cache
> > > > the
> > > > mapping
> > > > for about as long as the attachment exists. You might want to do
> > > > the
> > > > same,
> > > > unless that somehow breaks a use-case you have, I have no idea
> > > > about
> > > > that.
> > > > If something breaks with unmap_attachment moved out of the fence
> > > > handling
> > > > then I guess it's high time to add separate cache-management only
> > > > to
> > > > dma_buf (and that's probably going to be quite some wiring up,
> > > > not
> > > > sure
> > > > even how easy that would be to do nor what exactly the interface
> > > > should
> > > > look like).
> > > 
> > > Ok. Then I'll just cache the mapping for now, I think.
> > 
> > Yeah I think that's simplest. I did ponder a bit and I don't think
> > it'd be
> > too much pain to add the cache-management functions for device
> > attachments/mappings. But it would be quite some typing ...
> > -Sima
> 
> It looks like I actually do have some hardware which requires the cache
> management. If I cache the mappings in both my IIO and USB code, it
> works fine on my ZedBoard, but it doesn't work on my ZCU102.
> 
> (Or maybe it's something else? What I get from USB in that case is a
> stream of zeros, I'd expect it to be more like a stream of
> garbage/stale data).
> 
> So, change of plans; I will now unmap the attachment in the cleanup
> worker after the fence is signalled, and add a warning comment before
> the end of the fence critical section about the need to do cache
> management before the signal.
> 
> Does that work for you?

The trouble is, I'm not sure this works for you. If you rely on the
fences, and you have to do cache management in between dma operations,
then doing the unmap somewhen later will only mostly paper over the issue,
but not consistently.

I think that's really bad because the bugs this will cause are very hard
to track down and with the current infrastructure impossible to fix.

Imo cache the mappings, and then fix the cache management bug properly.

If you want an interim solution that isn't blocked on the dma-buf cache
management api addition, the only thing that works is doing the operations
synchronously in the ioctl call. Then you don't need fences, and you can
guarantee that the unmap has finished before userspace proceeds.

With the dma_fences you can't guarantee that, it's just pure luck.

Cheers, Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

