Return-Path: <linux-media+bounces-35183-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDF2ADF0AB
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 17:05:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C309189927C
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 15:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2FCC2EE5EC;
	Wed, 18 Jun 2025 15:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="giiLXpEG"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549F9191F91;
	Wed, 18 Jun 2025 15:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750259108; cv=none; b=kt7+2c+G0zZPH1bvXaRrNG7jXrr1l3Qu+dQ5rwoNe0rvT6CRFwt4FKMhQIh6XPXxtBbpG+ckLQV1eX9/whGOMldZHAzuO8V2vuuhLeNVoEP/TWVhFQCTiAwOPt6lyawa2zDEOJZP4PMuEesQVnzUXaHYrxVSFNJX99dMSupFngo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750259108; c=relaxed/simple;
	bh=VtnJIaye9QWf6eeuqfTnhsu07/8qvnT9KCncjjEmYjA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WuBsYl6HKX7WeLJVxufvP7W1oALU27ByJqEYyAWtNrkYhKJStaydEq3OwtrwNJ08RIdTAAhYq4yTLDLu1kFLKo+GtnB0kpsS4UlsEKWetEn0ZKRF59TFCNSTXSefnJaTv+qkp61i1cb740MYyaUnh241qWjxgicJqTByaJv3320=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=giiLXpEG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17CB0C4CEE7;
	Wed, 18 Jun 2025 15:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750259107;
	bh=VtnJIaye9QWf6eeuqfTnhsu07/8qvnT9KCncjjEmYjA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=giiLXpEGziW0Txa2s8skcjTpwLMgLTP22ItcbaGtflq+let6aaoXQ/KmS2kuoEMRQ
	 Tc//v6IJ3cwK2zqh9yK8NWUSsJ6pfYguqhR31SBVDHepwBIFBPYao53JZ6JwXI2bl4
	 64632URanrjYlyAvceyJikaBaOItbh4nCNUkxRdmtCr7T8bp2b7hprBNYU5F9linKx
	 wxdJS3CjBCDzNKwo1GVxBfw6ClK1LeyvqgdNS9wMBr2abZMeE8Y+v0Ak+qk6T361QR
	 FwGk3hE4GMzc7QbI392hO2kOogNrWjpqTRQpTpw1gzPyHwgfxg4el4AHPtwM64gX1W
	 ioE1C1tTliGdQ==
Date: Wed, 18 Jun 2025 17:05:00 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Alexandre Courbot" <gnurou@gmail.com>
Cc: "Albert Esteve" <aesteve@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, "Mauro Carvalho Chehab" <mchehab@kernel.org>, "Hans
 Verkuil" <hverkuil@xs4all.nl>, "Jason Wang" <jasowang@redhat.com>, "Xuan
 Zhuo" <xuanzhuo@linux.alibaba.com>, Eugenio =?UTF-8?B?UMOpcmV6?=
 <eperezma@redhat.com>, <gurchetansingh@google.com>,
 <daniel.almeida@collabora.com>, <adelva@google.com>,
 <changyeon@google.com>, <nicolas.dufresne@collabora.com>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <virtualization@lists.linux.dev>
Subject: Re: [PATCH v3] media: add virtio-media driver
Message-ID: <20250618170500.1e60aacf@sal.lan>
In-Reply-To: <DAPQ9L3FCLIF.24FIDLQST2S1O@gmail.com>
References: <20250412-virtio-media-v3-1-97dc94c18398@gmail.com>
	<20250526141316.7e907032@foz.lan>
	<DA6Q0LZPGS2D.2QCV889PQL2A7@gmail.com>
	<20250527111311.105246f2@sal.lan>
	<CAAVeFu+=RpEfu3i_Fh9_eq_g=cmDFF0gcurT0gU9AX1UX+UNVA@mail.gmail.com>
	<20250527153547.6603eaf4@sal.lan>
	<CAAVeFuJtp=UEEULeMSVpmYDmH81Y6OQgj6NCeuPUhabSRHw4dA@mail.gmail.com>
	<20250617104938.09d21b7c@foz.lan>
	<20250617110318.7c89d999@foz.lan>
	<20250617122034.3e570b4e@foz.lan>
	<DAPQ9L3FCLIF.24FIDLQST2S1O@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Wed, 18 Jun 2025 23:27:13 +0900
"Alexandre Courbot" <gnurou@gmail.com> escreveu:

> On Tue Jun 17, 2025 at 7:20 PM JST, Mauro Carvalho Chehab wrote:
> > Em Tue, 17 Jun 2025 11:03:18 +0200
> > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:
> >  
> >> Em Tue, 17 Jun 2025 10:49:38 +0200
> >> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:
> >>   
> >> > Hi Alex,
> >> > 
> >> > Em Tue, 27 May 2025 23:03:39 +0900
> >> > Alexandre Courbot <gnurou@gmail.com> escreveu:
> >> >     
> >> > > > > > Btw, I was looking at:
> >> > > > > >
> >> > > > > >         https://github.com/chromeos/virtio-media
> >> > > > > >
> >> > > > > > (I'm assuming that this is the QEMU counterpart, right?)        
> >> > > > >
> >> > > > > crosvm actually, but QEMU support is also being worked on.        
> >> > > >
> >> > > > Do you have already QEMU patches? The best is to have the Kernel driver
> >> > > > submitted altogether with QEMU, as Kernel developers need it to do the
> >> > > > tests. In my case, I never use crosvm, and I don't have any Chromebook
> >> > > > anymore.        
> >> > > 
> >> > > IIRC Albert Esteve was working on this, maybe he can share the current status.      
> >> > 
> >> > Any news regards to it?
> >> >     
> >> > > Note that crosvm does not require a Chromebook, you can build and run
> >> > > it pretty easily on a regular PC. I have put together a document to
> >> > > help with that:
> >> > > 
> >> > > https://github.com/chromeos/virtio-media/blob/main/TRY_IT_OUT.md      
> >> > 
> >> > I started looking on it today. Already installed crossvm (I had to
> >> > install libcap-devel to build it). Still, I'm not familiar with
> >> > crossvm, which is a little be painful. In particular, how can I
> >> > enable network on it and speedup it? With suggested parameters,
> >> > it picked only one CPU, and very few memory on it:
> >> > 
> >> > 	# cat /proc/cpuinfo|grep processor
> >> > 	processor       : 0
> >> > 
> >> > 	# free
> >> >                total        used        free      shared  buff/cache   available
> >> > 	Mem:          221876       34780      139712         272       56096      187096
> >> > 	Swap:              0           0           0
> >> > 
> >> > I'd like to be able to compile things on it and use ssh/scp. So,
> >> > the VM needs more CPUs, more memory, more network and GPU.  
> >
> > Found how to setup cpus and memory, but didn't find a way to setup
> > network without running it as root. The gpu parameter has several
> > options. Not sure what backend works well for media apps like qv4l2,
> > camorama, X11, ...  
> 
> I'm afraid getting GPU and graphics in general to work is more involved
> and tricky on a regular Linux setup (crosvm was primarily designed for
> ChromeOS). If you really need it I can do some more research; most of my
> tests have been done using v4l2-ctl or ffmpeg and saving the output on
> disk for later inspection.

It was actually easier than what I expected, but it had to run
as root. Due to that, I had to move it to a test machine that I
use just for such kind of tests. I updated it to the Ubuntu 
version 24.10, but crossvm refused to build even. I end needing
to install rust via rustup, as only version 1.81.0 had what it is
required to run with the needed features (network, media and gpu).

> >> > Btw, on a quick test with v4l2-compliance, something looks weird:
> >> > I started a camera application at the host. Still, v4l2-compliance
> >> > said successfully excecuted mmap:
> >> > 
> >> > Streaming ioctls:
> >> >         test read/write: OK (Not Supported)
> >> >         test blocking wait: OK
> >> >         test MMAP (no poll): OK                           
> >> >         test MMAP (select): OK                            
> >> >         Vide[2025-06-17T08:44:49.177972817+00:00 ERROR virtio_media::ioctl] VIDIOC_REQBUFS: memory type DmaBuf is currently unsupported
> >> > [2025-06-17T08:44:49.178164554+00:00 ERROR virtio_media::ioctl] VIDIOC_REQBUFS: memory type DmaBuf is currently unsupported
> >> > o Capturtest MMAP (epoll): OK                             
> >> >         test USERPTR (no poll): OK (Not Supported)
> >> >         test USERPTR (select): OK (Not Supported)
> >> >         test DMABUF (no poll): OK (Not Supported)
> >> >         test DMABUF (select): OK (Not Supported)
> >> > 
> >> > Which doesn't make any sense, as the host OS should not allow access
> >> > to mmap while streaming.    
> >> 
> >> Ah, this was with the "simple" device, not with the proxy one.
> >> With the proxy one, I'm getting:
> >> 
> >> # v4l2-ctl --all
> >> Driver Info:
> >>         Driver name      : virtio-media
> >>         Card type        : usb video: usb video
> >>         Bus info         : platform:virtio-media
> >>         Driver version   : 6.15.0
> >>         Capabilities     : 0x84200001
> >>                 Video Capture
> >>                 Streaming
> >>                 Extended Pix Format
> >>                 Device Capabilities
> >>         Device Caps      : 0x04200001
> >>                 Video Capture
> >>                 Streaming
> >>                 Extended Pix Format
> >> Priority: 2
> >> Video input : 0 (Camera 1: ok)
> >> Format Video Capture:
> >>         Width/Height      : 1280/720
> >>         Pixel Format      : 'MJPG' (Motion-JPEG)
> >>         Field             : None
> >>         Bytes per Line    : 0
> >>         Size Image        : 1843200
> >>         Colorspace        : sRGB
> >>         Transfer Function : Rec. 709
> >>         YCbCr/HSV Encoding: ITU-R 601
> >>         Quantization      : Default (maps to Full Range)
> >>         Flags             : 
> >> Crop Capability Video Capture:
> >>         Bounds      : Left 0, Top 0, Width 1280, Height 720
> >>         Default     : Left 0, Top 0, Width 1280, Height 720
> >>         Pixel Aspect: 1/1
> >> Selection Video Capture: crop_default, Left 0, Top 0, Width 1280, Height 720, Flags: 
> >> Selection Video Capture: crop_bounds, Left 0, Top 0, Width 1280, Height 720, Flags: 
> >> Streaming Parameters Video Capture:
> >>         Capabilities     : timeperframe
> >>         Frames per second: 30.000 (30/1)
> >>         Read buffers     : 0
> >> 
> >> User Controls
> >> 
> >>                      brightness 0x00980900 (int)    : min=-128 max=127 step=1 default=-11 value=-11
> >>                        contrast 0x00980901 (int)    : min=0 max=255 step=1 default=148 value=148
> >>                      saturation 0x00980902 (int)    : min=0 max=255 step=1 default=180 value=180
> >>                             hue 0x00980903 (int)    : min=-128 max=127 step=1 default=0 value=0
> >> 
> >> # v4l2-compliance -d0 -s
> >> 
> >> Streaming ioctls:
> >>         test read/write: OK (Not Supported)
> >>         test blocking wait: OK
> >>                 fail: v4l2-test-buffers.cpp(1345): node->streamon(q.g_type()) != EINVAL
> >>         test MMAP (no poll): FAIL
> >>                 fail: v4l2-test-buffers.cpp(1345): node->streamon(q.g_type()) != EINVAL
> >>         test MMAP (select): FAIL
> >>                 fail: v4l2-test-buffers.cpp(1345): node->streamon(q.g_type()) != EINVAL
> >>         test MMAP (epoll): FAIL
> >>         test USERPTR (no poll): OK (Not Supported)
> >>         test USERPTR (select): OK (Not Supported)
> >> [2025-06-17T08:55:20.768760714+00:00 ERROR virtio_media::ioctl] VIDIOC_REQBUFS: memory type DmaBuf is currently unsupported
> >>         test DMABUF (no poll): OK (Not Supported)
> >> [2025-06-17T08:55:20.769745707+00:00 ERROR virtio_media::ioctl] VIDIOC_REQBUFS: memory type DmaBuf is currently unsupported
> >>         test DMABUF (select): OK (Not Supported)
> >> 
> >> At the host, I'm getting:
> >> 
> >> Streaming ioctls:
> >>         test read/write: OK (Not Supported)
> >>         test blocking wait: OK
> >>                 fail: ../utils/v4l2-compliance/v4l2-test-buffers.cpp(1346): node->streamon(q.g_type()) != EINVAL
> >>         test MMAP (no poll): FAIL
> >>                 fail: ../utils/v4l2-compliance/v4l2-test-buffers.cpp(1346): node->streamon(q.g_type()) != EINVAL
> >>         test MMAP (select): FAIL
> >>                 fail: ../utils/v4l2-compliance/v4l2-test-buffers.cpp(1346): node->streamon(q.g_type()) != EINVAL
> >>         test MMAP (epoll): FAIL
> >>         test USERPTR (no poll): OK                        
> >>         test USERPTR (select): OK                         
> >>         test DMABUF: Cannot test, specify --expbuf-device  
> 
> These logs look ok to me: the MMAP tests are failing on the host, so
> they are also expected to fail on the guest (still I expect regular
> streaming to work on both). USERPTR is not supported on the guest, as
> per your request to not support this memory type in new drivers. DMABUF
> is not supported at all at the moment.

In the specific case of a virtio driver, while it is OK for the first
versions to support MMAP only, USERPTR support could make sense, as 
this is not a real driver for a certain hardware, but instead it is
replicating at the guest whatever the host driver has, which may or
may not have MMAP.

That's said, I don't recall any driver with USERPTR and without MMAP
those days. I did a quick check: VB2 devices always seem to have MMAP.

-

There is one case where only read ioctl is supported: pvrusb2, which
is probably not interesting enough those days, but IMHO, for the few
cases where a device can't be used at the guest due to the lack of a 
compatible streaming API, virtio-media should not expose it to the
guest and/or issue an error or warning.

> If the host cannot pass compliance, the guest will inevitably suffer
> from the same shortcomings. :) But at least on the devices I tested I
> was still able to stream something onto the disk and the result was
> correct.

Makes sense.

I'll do some tests later and check how it works with
a GUI app and some real devices.

Regards,
Mauro

