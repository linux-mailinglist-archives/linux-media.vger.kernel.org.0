Return-Path: <linux-media+bounces-35038-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 664ECADC569
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 10:51:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6B861897B63
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 08:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3E67290D96;
	Tue, 17 Jun 2025 08:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u6ZgUUAJ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D402900BF;
	Tue, 17 Jun 2025 08:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750150185; cv=none; b=OQt00i2UiAfTMrYbQfegi+Toz2k5l8C9SQFJihxYIhtCcY8igNAUCti+utIPVD7qVPAX5/QzL2bBArVLO9gH7hfFL8Urbc+VQkSbCmNdiZgCbi2crPrwUhcm/DsVvS1cWuI6THseBW+bwh2xpMe4eUcE/WPvy1XTvzFG4z3VwF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750150185; c=relaxed/simple;
	bh=ME58dcb/DUx0DY2uIYh1f14eByaY7b2odEcs65D1CHI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DZ+4UL0EBh8sIYgmqKKSccbcrMp4FUjkrYtOR+neyvrnYT6de2odykhi+rkt7E3oSLs7xMSHmMhu4UnSV4gnS72+pkDQiJ3dZ6Vrhlp7bp3PDOklTI6Wfxb2MkqFs02e/QGGVkXqZKPuoYg3CL1r/XZr6FEf14ZciKnmrDp236A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u6ZgUUAJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 616ADC4CEEE;
	Tue, 17 Jun 2025 08:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750150184;
	bh=ME58dcb/DUx0DY2uIYh1f14eByaY7b2odEcs65D1CHI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=u6ZgUUAJK96S0DA07ufkJXXk3DEA0UWPzvHIqi+j9h7NSe3bhYmNCCJEv9q/ABNvt
	 uHHrT9V9ZpX83CBdgZhcSx1/aYvAuBBOGbm5HdjG63/MVtxQiI1YojTa+AEwMVfi8z
	 SEMiYa1tQ9uR/Dxory2GzqX/kdILNoJhcAX81zO6QOxJiiOx87A+mtH3nF5YDcAFFK
	 hib/bAszxVMhcoSv5WrtPFFDTA2035SIcopsWZAQF/6Q6IwzUP2NU6wCXC0pYPo/Fr
	 1VGh4MNykUkqcwPtohppnJFvGVmkityzFUKyicEey7OAawIYDmHNuJV9qsDBKbEt88
	 VGblK5Vf2KRfA==
Date: Tue, 17 Jun 2025 10:49:38 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Albert Esteve <aesteve@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Jason Wang <jasowang@redhat.com>, Xuan Zhuo
 <xuanzhuo@linux.alibaba.com>, Eugenio =?UTF-8?B?UMOpcmV6?=
 <eperezma@redhat.com>, gurchetansingh@google.com,
 daniel.almeida@collabora.com, adelva@google.com, changyeon@google.com,
 nicolas.dufresne@collabora.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, virtualization@lists.linux.dev
Subject: Re: [PATCH v3] media: add virtio-media driver
Message-ID: <20250617104938.09d21b7c@foz.lan>
In-Reply-To: <CAAVeFuJtp=UEEULeMSVpmYDmH81Y6OQgj6NCeuPUhabSRHw4dA@mail.gmail.com>
References: <20250412-virtio-media-v3-1-97dc94c18398@gmail.com>
	<20250526141316.7e907032@foz.lan>
	<DA6Q0LZPGS2D.2QCV889PQL2A7@gmail.com>
	<20250527111311.105246f2@sal.lan>
	<CAAVeFu+=RpEfu3i_Fh9_eq_g=cmDFF0gcurT0gU9AX1UX+UNVA@mail.gmail.com>
	<20250527153547.6603eaf4@sal.lan>
	<CAAVeFuJtp=UEEULeMSVpmYDmH81Y6OQgj6NCeuPUhabSRHw4dA@mail.gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Alex,

Em Tue, 27 May 2025 23:03:39 +0900
Alexandre Courbot <gnurou@gmail.com> escreveu:

> > > > Btw, I was looking at:
> > > >
> > > >         https://github.com/chromeos/virtio-media
> > > >
> > > > (I'm assuming that this is the QEMU counterpart, right?)  
> > >
> > > crosvm actually, but QEMU support is also being worked on.  
> >
> > Do you have already QEMU patches? The best is to have the Kernel driver
> > submitted altogether with QEMU, as Kernel developers need it to do the
> > tests. In my case, I never use crosvm, and I don't have any Chromebook
> > anymore.  
> 
> IIRC Albert Esteve was working on this, maybe he can share the current status.

Any news regards to it?

> Note that crosvm does not require a Chromebook, you can build and run
> it pretty easily on a regular PC. I have put together a document to
> help with that:
> 
> https://github.com/chromeos/virtio-media/blob/main/TRY_IT_OUT.md

I started looking on it today. Already installed crossvm (I had to
install libcap-devel to build it). Still, I'm not familiar with
crossvm, which is a little be painful. In particular, how can I
enable network on it and speedup it? With suggested parameters,
it picked only one CPU, and very few memory on it:

	# cat /proc/cpuinfo|grep processor
	processor       : 0

	# free
               total        used        free      shared  buff/cache   available
	Mem:          221876       34780      139712         272       56096      187096
	Swap:              0           0           0

I'd like to be able to compile things on it and use ssh/scp. So,
the VM needs more CPUs, more memory, more network and GPU.

Btw, on a quick test with v4l2-compliance, something looks weird:
I started a camera application at the host. Still, v4l2-compliance
said successfully excecuted mmap:

Streaming ioctls:
        test read/write: OK (Not Supported)
        test blocking wait: OK
        test MMAP (no poll): OK                           
        test MMAP (select): OK                            
        Vide[2025-06-17T08:44:49.177972817+00:00 ERROR virtio_media::ioctl] VIDIOC_REQBUFS: memory type DmaBuf is currently unsupported
[2025-06-17T08:44:49.178164554+00:00 ERROR virtio_media::ioctl] VIDIOC_REQBUFS: memory type DmaBuf is currently unsupported
o Capturtest MMAP (epoll): OK                             
        test USERPTR (no poll): OK (Not Supported)
        test USERPTR (select): OK (Not Supported)
        test DMABUF (no poll): OK (Not Supported)
        test DMABUF (select): OK (Not Supported)

Which doesn't make any sense, as the host OS should not allow access
to mmap while streaming.

Thanks,
Mauro

