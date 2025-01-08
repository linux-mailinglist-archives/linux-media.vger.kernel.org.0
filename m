Return-Path: <linux-media+bounces-24466-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C6AA064D4
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 19:45:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AAA8F7A3FE3
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 18:45:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99BA3202F67;
	Wed,  8 Jan 2025 18:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="Ao6Xr87n"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BE3202C4D
	for <linux-media@vger.kernel.org>; Wed,  8 Jan 2025 18:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736361900; cv=none; b=QmaZbyawT+q4jE77P2ucdLr31g970jeDCSv6zcXzVpmBY/am5apACog1NiogDZf6dluwO7LkQBdE4navIr+T49r+YV6werLB06/LhzOcmFqBC7+IX/yNRXStI+Urf4Gw7YiIhZZBSC2KGazqmJEQnWu1RMV/UP6uS5IEX8FNk4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736361900; c=relaxed/simple;
	bh=TZn4YgL0P0jymgz8iCPIR8t9GoOgia+W722ov869n5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KlzZVT1NxWXGOm8GM+B5LN5YuEvWKNS1DtwQ2L5EnACqQ1fDlu29yePFeVU/nBkPPhP2WH0yVe5hN/WCyYofodX+icIGQ51JVE2pQB3OO4q/N/N0eG5Ric9Q4c2ol94TwnuwTfmLKDD6M5G2HGcuTIk+yJ1zlEPs3/XuAgGABg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=Ao6Xr87n; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4364a37a1d7so1510275e9.3
        for <linux-media@vger.kernel.org>; Wed, 08 Jan 2025 10:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1736361897; x=1736966697; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=biUOjGlssGWN8EwLhBP7GU2aZtnSDMl8F0vAilAylCg=;
        b=Ao6Xr87nJH/yY+RXJVnQK5cX69sqxrJzFdf0TKcH7yFhdqudE7Fjllz6yScc0zsF9R
         Kq20O0LQKCGqo3FSeS5JPUf9cwAvrszij3NwVBwwpxAAhxBApHIAQzuYrr80tBtjD2I7
         ojdJOCYjIO/GlEQMGLbcokZRs/RHDwR1+oj0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736361897; x=1736966697;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=biUOjGlssGWN8EwLhBP7GU2aZtnSDMl8F0vAilAylCg=;
        b=PQjRO1mQwievG/Xc/LrHwCSKuhYB6Gg/nUV3UUG6D/Ctr3MNh+ngqk48xx+I7zW3hE
         eST/yEqH/N5Cnhnm3Db751BbCPqHfeXhvPc+mbZynF3H+jnVV7woJXUTPjf7gu6mt74r
         aBnTgtdhETO0P1yY3k87uB6dlReCH1NMg4F7Gg5Zq3JlvOIbMLLIdvsXtIKkhTE6Z9w1
         C3BILtXsh/HBPy8D/4E362rO6oas2UafHA4A8u9/AOz6ItUKv1WnkHJvk+vR64DVQUex
         NU+xY80MLo0nf235r1YnAwk4KdoQqf3vYG7z1hrQpmX6Eh6yoQXqQxd4ERPyE91PjyM9
         l6Aw==
X-Forwarded-Encrypted: i=1; AJvYcCWHnpN3OnRGCIUqUrUp3KW3J7Uk3/R0b8eCTH+z9VlXyZ7+3g2djpnGJv/dOFrSEUsOenUcCRp/+yHIaw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5RcLT5jRDAB2cJ74pbdwop1Y4dfgSPAwzVM0VHTt7UJv+qbHT
	POXIt9HxvPh13KHJkYH64YDf0OUan5cEAei1V64AAiaRTsWPttdP3NEAVTt87BQ=
X-Gm-Gg: ASbGncv6uVp0fnQupuHEOQd4njN4E1FugU+4hGnYR2V+c5yMjH2kJgJF6dVBeEkO9zj
	LhB6XbhsQQ91FNKaEfcpWYN7Ns4gmyKxYqoHVeLlY6QpTZVkoNxt2SCjMG49WI8Pa0nMY9RmTRm
	0Ln64Ssci+FV9iH27+QYncK/79vpnYm9f9ejBePO+NCTRyDyWgpEoeT121XU6TXIxPd+GX+fvnX
	F26ckWncsrkOE+jWOaj9mnIke2b+DwGUwmpxxDrZLwwAJUa7FQ7GOFqwanivUAwMHGl
X-Google-Smtp-Source: AGHT+IExRhiMjUcJ+d2lZABMI97n3eXtXXWT0vriTVE6jNdGuPQr09X4d5/VTHHP1nckqDkKCH5ntA==
X-Received: by 2002:a05:600c:5801:b0:436:30e4:459b with SMTP id 5b1f17b1804b1-436e26adf89mr31810775e9.18.1736361896818;
        Wed, 08 Jan 2025 10:44:56 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2ddca2dsm29220505e9.21.2025.01.08.10.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 10:44:56 -0800 (PST)
Date: Wed, 8 Jan 2025 19:44:54 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Christoph Hellwig <hch@lst.de>, Leon Romanovsky <leonro@nvidia.com>,
	Xu Yilun <yilun.xu@linux.intel.com>, kvm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
	pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
	vivek.kasireddy@intel.com, dan.j.williams@intel.com, aik@amd.com,
	yilun.xu@intel.com, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
	daniel.vetter@ffwll.ch, leon@kernel.org, baolu.lu@linux.intel.com,
	zhenzhong.duan@intel.com, tao1.su@intel.com
Subject: Re: [RFC PATCH 01/12] dma-buf: Introduce dma_buf_get_pfn_unlocked()
 kAPI
Message-ID: <Z37HpvHAfB0g9OQ-@phenom.ffwll.local>
Mail-Followup-To: Jason Gunthorpe <jgg@nvidia.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Christoph Hellwig <hch@lst.de>, Leon Romanovsky <leonro@nvidia.com>,
	Xu Yilun <yilun.xu@linux.intel.com>, kvm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
	pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
	vivek.kasireddy@intel.com, dan.j.williams@intel.com, aik@amd.com,
	yilun.xu@intel.com, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
	leon@kernel.org, baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
	tao1.su@intel.com
References: <20250107142719.179636-1-yilun.xu@linux.intel.com>
 <20250107142719.179636-2-yilun.xu@linux.intel.com>
 <b1f3c179-31a9-4592-a35b-b96d2e8e8261@amd.com>
 <20250108132358.GP5556@nvidia.com>
 <f3748173-2bbc-43fa-b62e-72e778999764@amd.com>
 <20250108145843.GR5556@nvidia.com>
 <5a858e00-6fea-4a7a-93be-f23b66e00835@amd.com>
 <20250108162227.GT5556@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250108162227.GT5556@nvidia.com>
X-Operating-System: Linux phenom 6.12.3-amd64 

On Wed, Jan 08, 2025 at 12:22:27PM -0400, Jason Gunthorpe wrote:
> On Wed, Jan 08, 2025 at 04:25:54PM +0100, Christian K�nig wrote:
> > Am 08.01.25 um 15:58 schrieb Jason Gunthorpe:
> > > I have imagined a staged approach were DMABUF gets a new API that
> > > works with the new DMA API to do importer mapping with "P2P source
> > > information" and a gradual conversion.
> > 
> > To make it clear as maintainer of that subsystem I would reject such a step
> > with all I have.
> 
> This is unexpected, so you want to just leave dmabuf broken? Do you
> have any plan to fix it, to fix the misuse of the DMA API, and all
> the problems I listed below? This is a big deal, it is causing real
> problems today.
> 
> If it going to be like this I think we will stop trying to use dmabuf
> and do something simpler for vfio/kvm/iommufd :(

As the gal who help edit the og dma-buf spec 13 years ago, I think adding
pfn isn't a terrible idea. By design, dma-buf is the "everything is
optional" interface. And in the beginning, even consistent locking was
optional, but we've managed to fix that by now :-/

Where I do agree with Christian is that stuffing pfn support into the
dma_buf_attachment interfaces feels a bit much wrong.

> > We have already gone down that road and it didn't worked at all and
> > was a really big pain to pull people back from it.
> 
> Nobody has really seriously tried to improve the DMA API before, so I
> don't think this is true at all.

Aside, I really hope this finally happens!

> > > 3) Importing devices need to know if they are working with PCI P2P
> > > addresses during mapping because they need to do things like turn on
> > > ATS on their DMA. As for multi-path we have the same hacks inside mlx5
> > > today that assume DMABUFs are always P2P because we cannot determine
> > > if things are P2P or not after being DMA mapped.
> > 
> > Why would you need ATS on PCI P2P and not for system memory accesses?
> 
> ATS has a significant performance cost. It is mandatory for PCI P2P,
> but ideally should be avoided for CPU memory.

Huh, I didn't know that. And yeah kinda means we've butchered the pci p2p
stuff a bit I guess ...

> > > 5) iommufd and kvm are both using CPU addresses without DMA. No
> > > exporter mapping is possible
> > 
> > We have customers using both KVM and XEN with DMA-buf, so I can clearly
> > confirm that this isn't true.
> 
> Today they are mmaping the dma-buf into a VMA and then using KVM's
> follow_pfn() flow to extract the CPU pfn from the PTE. Any mmapable
> dma-buf must have a CPU PFN.
> 
> Here Xu implements basically the same path, except without the VMA
> indirection, and it suddenly not OK? Illogical.

So the big difference is that for follow_pfn() you need mmu_notifier since
the mmap might move around, whereas with pfn smashed into
dma_buf_attachment you need dma_resv_lock rules, and the move_notify
callback if you go dynamic.

So I guess my first question is, which locking rules do you want here for
pfn importers?

If mmu notifiers is fine, then I think the current approach of follow_pfn
should be ok. But if you instead dma_resv_lock rules (or the cpu mmap
somehow is an issue itself), then I think the clean design is create a new
separate access mechanism just for that. It would be the 5th or so (kernel
vmap, userspace mmap, dma_buf_attach and driver private stuff like
virtio_dma_buf.c where you access your buffer with a uuid), so really not
a big deal.

And for non-contrived exporters we might be able to implement the other
access methods in terms of the pfn method generically, so this wouldn't
even be a terrible maintenance burden going forward. And meanwhile all the
contrived exporters just keep working as-is.

The other part is that cpu mmap is optional, and there's plenty of strange
exporters who don't implement. But you can dma map the attachment into
plenty devices. This tends to mostly be a thing on SoC devices with some
very funky memory. But I guess you don't care about these use-case, so
should be ok.

I couldn't come up with a good name for these pfn users, maybe
dma_buf_pfn_attachment? This does _not_ have a struct device, but maybe
some of these new p2p source specifiers (or a list of those which are
allowed, no idea how this would need to fit into the new dma api).

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

