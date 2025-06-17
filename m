Return-Path: <linux-media+bounces-35049-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE358ADC7F0
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 12:21:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C55A178E8C
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 10:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AE602C15AF;
	Tue, 17 Jun 2025 10:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PZP1Rv53"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8182C08C9;
	Tue, 17 Jun 2025 10:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750155640; cv=none; b=AZaaspAr3ql992yd4Pm/LBI0i7R4y0yQjVd5vHzKSVRyW63WdoV2F3p2J8UAzXDTwBOKePnNx7OJ+PTMqodtFnVnndsvG38lGTRDoS40W4kj8rrjFbaDLD0DegaA6naWKdRr4PmS+0aKhcEiZ0t4hpTgvX66qr0EaS6TfWoGxyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750155640; c=relaxed/simple;
	bh=tY7nTPnXXFdxXxarCnY/LfoaSsd0GkQK3b+J95lq57E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WpPw5Jy4s46vNRrdkjF4qjXYFSsk7BVjWq3VhPyoerGU3XCrnfhwi6LDU44wIrAPdj4mF2Zz34d8z7zhCJUpBdZ3fdDN1XjtGD8BNPN2Bs4ap6S/aWa9vu9mpib+0evv+SupIgfdOslRP1vU68LpxfeKLGxhx6/LTgE+J5eFHIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PZP1Rv53; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39FA4C4CEED;
	Tue, 17 Jun 2025 10:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750155640;
	bh=tY7nTPnXXFdxXxarCnY/LfoaSsd0GkQK3b+J95lq57E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PZP1Rv53BH9sXGaZ0SbKwiaG1DJDqGEToALHE7W5Gn18MSYZXAkzQEhmEBXeal46A
	 IZqW9jgLIs5vX7u9g8Jp3t2FY8P6OpYG8H2tETj3Hvpn9a6/HFDoY0tPrbH7+UOayZ
	 cSR6HAeuznEau8wEbbQO/3YWzI1pkcfqEcGslOiZCioCNljznps3mFFY1IcXsbMWaz
	 3xfGPU7yldc1YLKedWJRNqW1tUS+bce7B8h3X9EUdhxDA/PqMhWpJ3YHlDL8YV9UbW
	 w/W1UDfnKM1Oz05cVVtGEk0a4Uar3jXLEGr9YlJloPAGQ/b7ajPQuR19R+SrQvucGa
	 AZOnTutMOGLSA==
Date: Tue, 17 Jun 2025 12:20:34 +0200
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
Message-ID: <20250617122034.3e570b4e@foz.lan>
In-Reply-To: <20250617110318.7c89d999@foz.lan>
References: <20250412-virtio-media-v3-1-97dc94c18398@gmail.com>
	<20250526141316.7e907032@foz.lan>
	<DA6Q0LZPGS2D.2QCV889PQL2A7@gmail.com>
	<20250527111311.105246f2@sal.lan>
	<CAAVeFu+=RpEfu3i_Fh9_eq_g=cmDFF0gcurT0gU9AX1UX+UNVA@mail.gmail.com>
	<20250527153547.6603eaf4@sal.lan>
	<CAAVeFuJtp=UEEULeMSVpmYDmH81Y6OQgj6NCeuPUhabSRHw4dA@mail.gmail.com>
	<20250617104938.09d21b7c@foz.lan>
	<20250617110318.7c89d999@foz.lan>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Tue, 17 Jun 2025 11:03:18 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

> Em Tue, 17 Jun 2025 10:49:38 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:
> 
> > Hi Alex,
> > 
> > Em Tue, 27 May 2025 23:03:39 +0900
> > Alexandre Courbot <gnurou@gmail.com> escreveu:
> >   
> > > > > > Btw, I was looking at:
> > > > > >
> > > > > >         https://github.com/chromeos/virtio-media
> > > > > >
> > > > > > (I'm assuming that this is the QEMU counterpart, right?)      
> > > > >
> > > > > crosvm actually, but QEMU support is also being worked on.      
> > > >
> > > > Do you have already QEMU patches? The best is to have the Kernel driver
> > > > submitted altogether with QEMU, as Kernel developers need it to do the
> > > > tests. In my case, I never use crosvm, and I don't have any Chromebook
> > > > anymore.      
> > > 
> > > IIRC Albert Esteve was working on this, maybe he can share the current status.    
> > 
> > Any news regards to it?
> >   
> > > Note that crosvm does not require a Chromebook, you can build and run
> > > it pretty easily on a regular PC. I have put together a document to
> > > help with that:
> > > 
> > > https://github.com/chromeos/virtio-media/blob/main/TRY_IT_OUT.md    
> > 
> > I started looking on it today. Already installed crossvm (I had to
> > install libcap-devel to build it). Still, I'm not familiar with
> > crossvm, which is a little be painful. In particular, how can I
> > enable network on it and speedup it? With suggested parameters,
> > it picked only one CPU, and very few memory on it:
> > 
> > 	# cat /proc/cpuinfo|grep processor
> > 	processor       : 0
> > 
> > 	# free
> >                total        used        free      shared  buff/cache   available
> > 	Mem:          221876       34780      139712         272       56096      187096
> > 	Swap:              0           0           0
> > 
> > I'd like to be able to compile things on it and use ssh/scp. So,
> > the VM needs more CPUs, more memory, more network and GPU.

Found how to setup cpus and memory, but didn't find a way to setup
network without running it as root. The gpu parameter has several
options. Not sure what backend works well for media apps like qv4l2,
camorama, X11, ...

> > 
> > Btw, on a quick test with v4l2-compliance, something looks weird:
> > I started a camera application at the host. Still, v4l2-compliance
> > said successfully excecuted mmap:
> > 
> > Streaming ioctls:
> >         test read/write: OK (Not Supported)
> >         test blocking wait: OK
> >         test MMAP (no poll): OK                           
> >         test MMAP (select): OK                            
> >         Vide[2025-06-17T08:44:49.177972817+00:00 ERROR virtio_media::ioctl] VIDIOC_REQBUFS: memory type DmaBuf is currently unsupported
> > [2025-06-17T08:44:49.178164554+00:00 ERROR virtio_media::ioctl] VIDIOC_REQBUFS: memory type DmaBuf is currently unsupported
> > o Capturtest MMAP (epoll): OK                             
> >         test USERPTR (no poll): OK (Not Supported)
> >         test USERPTR (select): OK (Not Supported)
> >         test DMABUF (no poll): OK (Not Supported)
> >         test DMABUF (select): OK (Not Supported)
> > 
> > Which doesn't make any sense, as the host OS should not allow access
> > to mmap while streaming.  
> 
> Ah, this was with the "simple" device, not with the proxy one.
> With the proxy one, I'm getting:
> 
> # v4l2-ctl --all
> Driver Info:
>         Driver name      : virtio-media
>         Card type        : usb video: usb video
>         Bus info         : platform:virtio-media
>         Driver version   : 6.15.0
>         Capabilities     : 0x84200001
>                 Video Capture
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x04200001
>                 Video Capture
>                 Streaming
>                 Extended Pix Format
> Priority: 2
> Video input : 0 (Camera 1: ok)
> Format Video Capture:
>         Width/Height      : 1280/720
>         Pixel Format      : 'MJPG' (Motion-JPEG)
>         Field             : None
>         Bytes per Line    : 0
>         Size Image        : 1843200
>         Colorspace        : sRGB
>         Transfer Function : Rec. 709
>         YCbCr/HSV Encoding: ITU-R 601
>         Quantization      : Default (maps to Full Range)
>         Flags             : 
> Crop Capability Video Capture:
>         Bounds      : Left 0, Top 0, Width 1280, Height 720
>         Default     : Left 0, Top 0, Width 1280, Height 720
>         Pixel Aspect: 1/1
> Selection Video Capture: crop_default, Left 0, Top 0, Width 1280, Height 720, Flags: 
> Selection Video Capture: crop_bounds, Left 0, Top 0, Width 1280, Height 720, Flags: 
> Streaming Parameters Video Capture:
>         Capabilities     : timeperframe
>         Frames per second: 30.000 (30/1)
>         Read buffers     : 0
> 
> User Controls
> 
>                      brightness 0x00980900 (int)    : min=-128 max=127 step=1 default=-11 value=-11
>                        contrast 0x00980901 (int)    : min=0 max=255 step=1 default=148 value=148
>                      saturation 0x00980902 (int)    : min=0 max=255 step=1 default=180 value=180
>                             hue 0x00980903 (int)    : min=-128 max=127 step=1 default=0 value=0
> 
> # v4l2-compliance -d0 -s
> 
> Streaming ioctls:
>         test read/write: OK (Not Supported)
>         test blocking wait: OK
>                 fail: v4l2-test-buffers.cpp(1345): node->streamon(q.g_type()) != EINVAL
>         test MMAP (no poll): FAIL
>                 fail: v4l2-test-buffers.cpp(1345): node->streamon(q.g_type()) != EINVAL
>         test MMAP (select): FAIL
>                 fail: v4l2-test-buffers.cpp(1345): node->streamon(q.g_type()) != EINVAL
>         test MMAP (epoll): FAIL
>         test USERPTR (no poll): OK (Not Supported)
>         test USERPTR (select): OK (Not Supported)
> [2025-06-17T08:55:20.768760714+00:00 ERROR virtio_media::ioctl] VIDIOC_REQBUFS: memory type DmaBuf is currently unsupported
>         test DMABUF (no poll): OK (Not Supported)
> [2025-06-17T08:55:20.769745707+00:00 ERROR virtio_media::ioctl] VIDIOC_REQBUFS: memory type DmaBuf is currently unsupported
>         test DMABUF (select): OK (Not Supported)
> 
> At the host, I'm getting:
> 
> Streaming ioctls:
>         test read/write: OK (Not Supported)
>         test blocking wait: OK
>                 fail: ../utils/v4l2-compliance/v4l2-test-buffers.cpp(1346): node->streamon(q.g_type()) != EINVAL
>         test MMAP (no poll): FAIL
>                 fail: ../utils/v4l2-compliance/v4l2-test-buffers.cpp(1346): node->streamon(q.g_type()) != EINVAL
>         test MMAP (select): FAIL
>                 fail: ../utils/v4l2-compliance/v4l2-test-buffers.cpp(1346): node->streamon(q.g_type()) != EINVAL
>         test MMAP (epoll): FAIL
>         test USERPTR (no poll): OK                        
>         test USERPTR (select): OK                         
>         test DMABUF: Cannot test, specify --expbuf-device
> 
> The device I'm using for test is a UVC HDMI capture board:
> 
> 	Bus 005 Device 008: ID 534d:2109 MacroSilicon usb video
> 
> Thanks,
> Mauro



Thanks,
Mauro

