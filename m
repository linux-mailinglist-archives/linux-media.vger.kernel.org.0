Return-Path: <linux-media+bounces-3887-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D1D831BC3
	for <lists+linux-media@lfdr.de>; Thu, 18 Jan 2024 15:50:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 509601F272B5
	for <lists+linux-media@lfdr.de>; Thu, 18 Jan 2024 14:50:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FB0B1E4B1;
	Thu, 18 Jan 2024 14:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="ZkFQR/oy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783B61DA39
	for <linux-media@vger.kernel.org>; Thu, 18 Jan 2024 14:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705589393; cv=none; b=Ol/YfE67PiTGl4eyYYQd34x3q6gVOQkHcp33H4ArNiHV/HAxrc4HfgdSuZv2Cjp8OvENr47a9Jx86LCC9r9MdFG852g9H263kKwjf3X0BLEAyjTFT3TP+nuxjgbcvspJ83YtqPSolZgku9TU415k0JkF+aIwKR/Yza542KJudyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705589393; c=relaxed/simple;
	bh=8JpvTZlqdFD2Rzqoo8GfNdFbMqPNFrBOmIJ6OpoVqiY=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:Date:
	 From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-Operating-System; b=pWcnVT8CIUeRGQh2CfBCqON7kXWlElNbpNu83XzQCaXBalAs4mZ7vmBskSdsFad6fCv0S8FrPv05ubZM7Tn3RjQ9LzXOtonuC/SJOB5svyI7nQH8aX3tRjzZ5Sk21awzfsn+GOu3BfEl73Y+O1tkoyvn2TDMrYmoSy6qknfMKPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=ZkFQR/oy; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-55760f84177so2654037a12.0
        for <linux-media@vger.kernel.org>; Thu, 18 Jan 2024 06:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1705589389; x=1706194189; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T0SV8U+IlkdLHr/XjT2iGav+KPgKzY+DGmeC0LEv1Zs=;
        b=ZkFQR/oyVoy41gAb57ROXbzZ6MgZ3L7Gput0qgWHRpbQhCd2nPA2ChO/cAwuuwDbCc
         OYsuYNq8AYRQi4AveMH+SyNPOzQB+IY5oaxvdiNJV/4GVo+9zz47WAPI84VWu+GTUqcs
         NWtlpM64EB1fD7tLaL1JIIXYjDGhHgz3IwE/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705589389; x=1706194189;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T0SV8U+IlkdLHr/XjT2iGav+KPgKzY+DGmeC0LEv1Zs=;
        b=ZUKWxspfZO/Df+4JDTo1HZHFcYBWsaAJN6CoJX1dho2PUtArPnxtP1Do2E7ZRWikCo
         Z+h26u9DJWieXKbqJgTxR22piO/42qyHtt9YmF/M3ozWIOF0/EkQHbNWp+knNloh+6JZ
         a0SIfDE0DlxjepMe+6gXdqF6qRZKIswLlxIPLh9YQSHGBgSvr5KmQmxlnud73AiYN+j/
         +uAXNBRAMLrngCvJ2j7DgyzS0tR31byUcW5KePdWKl5x+JfWC6BIlz5ZeWwbK+Jnn/Ag
         A8W/xrMgMujaS39LAtQWkIIU6nEwAV95is2gD/LGDFNq9R7pqiPP1Q8JWRlgNBkJMlBk
         s93Q==
X-Gm-Message-State: AOJu0YxugIWUAgcHO5jtLsWoy81YdTD9+/peoYaNm72I2FRXL+TpVkDV
	knEYSO2TO4p1TYKix67CGGxHqRBPa28OEx6RZ5Slu8o25teqWMSsmBlBjZYSJa0=
X-Google-Smtp-Source: AGHT+IEVM70e6beCogh7O7jcU8xaluhv/ktlLII9rfJtR4gxAiS0g3VAw/ikru3AEG+C2Wt7+UZAPw==
X-Received: by 2002:a17:906:4088:b0:a2e:9ff8:218d with SMTP id u8-20020a170906408800b00a2e9ff8218dmr1190541ejj.3.1705589388609;
        Thu, 18 Jan 2024 06:49:48 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id sa19-20020a1709076d1300b00a2eb5c46618sm2437136ejc.19.2024.01.18.06.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jan 2024 06:49:47 -0800 (PST)
Date: Thu, 18 Jan 2024 15:49:45 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: "T.J. Mercier" <tjmercier@google.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	Sandeep Patil <sspatil@android.com>,
	Laura Abbott <labbott@redhat.com>, android-mm@google.com,
	minchan@google.com, daniel@ffwll.ch,
	John Stultz <john.stultz@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@linaro.org>,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dma-buf: heaps: Don't track CMA dma-buf pages under
 RssFile
Message-ID: <Zak6iW8lktml7f2H@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	Sandeep Patil <sspatil@android.com>,
	Laura Abbott <labbott@redhat.com>, android-mm@google.com,
	minchan@google.com, John Stultz <john.stultz@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@linaro.org>,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20240117181141.286383-1-tjmercier@google.com>
 <20a68f86-27f0-48f4-a066-7dcf0092858e@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20a68f86-27f0-48f4-a066-7dcf0092858e@amd.com>
X-Operating-System: Linux phenom 6.5.0-4-amd64 

On Thu, Jan 18, 2024 at 11:02:22AM +0100, Christian König wrote:
> Am 17.01.24 um 19:11 schrieb T.J. Mercier:
> > DMA buffers allocated from the CMA dma-buf heap get counted under
> > RssFile for processes that map them and trigger page faults. In
> > addition to the incorrect accounting reported to userspace, reclaim
> > behavior was influenced by the MM_FILEPAGES counter until linux 6.8, but
> > this memory is not reclaimable. [1] Change the CMA dma-buf heap to set
> > VM_PFNMAP on the VMA so MM does not poke at the memory managed by this
> > dma-buf heap, and use vmf_insert_pfn to correct the RSS accounting.
> > 
> > The system dma-buf heap does not suffer from this issue since
> > remap_pfn_range is used during the mmap of the buffer, which also sets
> > VM_PFNMAP on the VMA.
> 
> Mhm, not an issue with this patch but Daniel wanted to add a check for
> VM_PFNMAP to dma_buf_mmap() which would have noted this earlier.
> 
> I don't fully remember the discussion but for some reason that was never
> committed. We should probably try that again.

Iirc the issue is that dma_mmap is not guaranteed to give you a VM_SPECIAL
mapping, at least on absolutely all architectures. That's why I defacto
dropped that idea, but it would indeed be really great if we could
resurrect it.

Maybe for x86 only? Or x86+armv8, I'm honestly not sure anymore which
exact cases ended up with a VM_NORMAL mapping ... Would need a pile of
digging.

I think all the other patches I've landed.
-Sima

> 
> > [1]https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/mm/vmscan.c?id=fb46e22a9e3863e08aef8815df9f17d0f4b9aede
> > 
> > Fixes: b61614ec318a ("dma-buf: heaps: Add CMA heap to dmabuf heaps")
> > Signed-off-by: T.J. Mercier<tjmercier@google.com>
> 
> Acked-by: Christian König <christian.koenig@amd.com>
> 
> > ---
> >   drivers/dma-buf/heaps/cma_heap.c | 7 +++----
> >   1 file changed, 3 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
> > index ee899f8e6721..4a63567e93ba 100644
> > --- a/drivers/dma-buf/heaps/cma_heap.c
> > +++ b/drivers/dma-buf/heaps/cma_heap.c
> > @@ -168,10 +168,7 @@ static vm_fault_t cma_heap_vm_fault(struct vm_fault *vmf)
> >   	if (vmf->pgoff > buffer->pagecount)
> >   		return VM_FAULT_SIGBUS;
> > -	vmf->page = buffer->pages[vmf->pgoff];
> > -	get_page(vmf->page);
> > -
> > -	return 0;
> > +	return vmf_insert_pfn(vma, vmf->address, page_to_pfn(buffer->pages[vmf->pgoff]));
> >   }
> >   static const struct vm_operations_struct dma_heap_vm_ops = {
> > @@ -185,6 +182,8 @@ static int cma_heap_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
> >   	if ((vma->vm_flags & (VM_SHARED | VM_MAYSHARE)) == 0)
> >   		return -EINVAL;
> > +	vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
> > +
> >   	vma->vm_ops = &dma_heap_vm_ops;
> >   	vma->vm_private_data = buffer;

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

