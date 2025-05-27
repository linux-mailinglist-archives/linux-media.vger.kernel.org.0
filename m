Return-Path: <linux-media+bounces-33443-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5511DAC4B4B
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 11:13:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD04A7AD7BB
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 09:12:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B9FE24EABD;
	Tue, 27 May 2025 09:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RdxIgbYz"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52761EF09D;
	Tue, 27 May 2025 09:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748337201; cv=none; b=OOdKqciwtSg18zXq8JquhzV49ZoQiZM0lMAzT59474yGyBFJslLyVeeq8LxZfoTnVzXwZKYcgAAOXEu3S1a77NVhwGpwz6Rap7XxTXRkvMRxkte5e33N1++UMX9EDfVoIZhZIpRiO+k++q1fsfCa17qquvZ8y0zUUd4PvKf/Vy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748337201; c=relaxed/simple;
	bh=GHEa/3EewNxTfyve9NOUlR4JsutG0Ky+D56r4P9yjYE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JWPZK1zZI4PDAQ5c3YMqmszCEUvB3ICmD+O5ogCOEGsKu4dLTKP9qc/JyK7WjDq1DfrWYkX7IrcRlwJa+o4FcIaSDUJfp+wfPw0ukupgXucMm2EN61C0j+aB9AZ52tTHNI3YZYiiIHSR/PrN4AzTkeaKVtWOzUqzXcqLjhBe/WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RdxIgbYz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE208C4CEEA;
	Tue, 27 May 2025 09:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748337200;
	bh=GHEa/3EewNxTfyve9NOUlR4JsutG0Ky+D56r4P9yjYE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RdxIgbYzJHmH0ve1BcXCbISj1dNK0UDFufvdbIYgU1SQi6LGqIZ/ZyJFzijubqOys
	 a07UZyb74bFBKpkD8SL94NrbT9rVprYDZktxc/N2o3JsZkBECKk6KQ+nAUDoFZngyM
	 d+E1q7nT0IFn2UTq5qPK698LdEgeKQYDk3j9extgk5h5tExDHkBKAQE/Ti9jt41OTs
	 tr+SSjqZMG+rPP+ncbVtF/LMIABHTaR/u1ZlDSefVsMllLkixQalm4uNbP1rk66E9u
	 AZt206y0isVn0T66pQpwbTNBxg2jHF1sG/WW+XW4sPdnPmD318EIFLou03SUd21BTT
	 HM6VbLpZ3c8qA==
Date: Tue, 27 May 2025 11:13:11 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Alexandre Courbot" <gnurou@gmail.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Hans Verkuil" <hverkuil@xs4all.nl>, "Albert Esteve"
 <aesteve@redhat.com>, "Jason Wang" <jasowang@redhat.com>, "Xuan Zhuo"
 <xuanzhuo@linux.alibaba.com>, Eugenio =?UTF-8?B?UMOpcmV6?=
 <eperezma@redhat.com>, <gurchetansingh@google.com>,
 <daniel.almeida@collabora.com>, <adelva@google.com>,
 <changyeon@google.com>, <nicolas.dufresne@collabora.com>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <virtualization@lists.linux.dev>, "Alexandre Courbot" <acourbot@google.com>
Subject: Re: [PATCH v3] media: add virtio-media driver
Message-ID: <20250527111311.105246f2@sal.lan>
In-Reply-To: <DA6Q0LZPGS2D.2QCV889PQL2A7@gmail.com>
References: <20250412-virtio-media-v3-1-97dc94c18398@gmail.com>
	<20250526141316.7e907032@foz.lan>
	<DA6Q0LZPGS2D.2QCV889PQL2A7@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Tue, 27 May 2025 15:14:50 +0900
"Alexandre Courbot" <gnurou@gmail.com> escreveu:

> Hi Mauro,
> 
> On Mon May 26, 2025 at 9:13 PM JST, Mauro Carvalho Chehab wrote:
> > Hi Michael,
> >
> > Em Sat, 12 Apr 2025 13:08:01 +0900
> > Alexandre Courbot <gnurou@gmail.com> escreveu:
> >  
> >> Add the first version of the virtio-media driver.
> >>
> >> This driver acts roughly as a V4L2 relay between user-space and the
> >> virtio virtual device on the host, so it is relatively simple, yet
> >> unconventional. It doesn't use VB2 or other frameworks typically used in
> >> a V4L2 driver, and most of its complexity resides in correctly and
> >> efficiently building the virtio descriptor chain to pass to the host,
> >> avoiding copies whenever possible. This is done by
> >> scatterlist_builder.[ch].
> >>
> >> virtio_media_ioctls.c proxies each supported ioctl to the host, using
> >> code generated through macros for ioctls that can be forwarded directly,
> >> which is most of them.
> >>
> >> virtio_media_driver.c provides the expected driver hooks, and support
> >> for mmapping and polling.
> >>
> >>  This version supports MMAP buffers, while USERPTR buffers can also be
> >>  enabled through a driver option. DMABUF support is still pending.  
> >
> > It sounds that you applied this one at the virtio tree, but it hasn't
> > being reviewed or acked by media maintainers.
> >
> > Please drop it.
> >
> > Alexandre,
> >
> > Please send media patches to media maintainers, c/c other subsystem
> > maintainers, as otherwise they might end being merged without a
> > proper review.  
> 
> Sorry about that, I put everyone in "To:" without giving it a second
> thought.
> 
> >
> > In this particular case, we need to double-check if this won't cause
> > any issues, in special with regards to media locks and mutexes.  
> 
> Agreed, I am not 100% confident about that part myself.
> 
> >
> > I'll try to look on it after this merge window, as it is too late
> > for it to be applied during this one.  
> 
> Appreciate that - given the high traffic on the list I was worried that
> this patch would eventually be overlooked. Not making it for this merge
> window should not be a problem, so please take the time you need.

Provided that your patch was caught by patchwork, it won't be lost:
	https://patchwork.linuxtv.org/project/linux-media/patch/20250412-virtio-media-v3-1-97dc94c18398@gmail.com/

Please notice that our CI got a number of checkpatch issues there. 
Please check and fix the non-false-positive ones.

Btw, I was looking at:

	https://github.com/chromeos/virtio-media

(I'm assuming that this is the QEMU counterpart, right?)

And I noticed something weird there:

	"Unsupported ioctls

	 A few ioctls are replaced by other, more suitable mechanisms. If being requested these ioctls, the device must return the same response as it would for an unknown ioctl, i.e. ENOTTY.

	    VIDIOC_QUERYCAP is replaced by reading the configuration area.
	    VIDIOC_DQBUF is replaced by a dedicated event.
	    VIDIOC_DQEVENT is replaced by a dedicated event."

While this could be ok for cromeOS, this will be broken for guests with 
Linux, as all Linux applications rely on VIDIOC_QUERYCAP and VIDIOC_DQBUF
to work. Please implement support for it, as otherwise we won't even be
able to test the driver with the v4l2-compliance tool (*).

(*) Passing at v4l2-compliance is a requirement for any media driver
    to be merged.

With regards to testing, what's the expected testing scenario?
My guess is that, as a virtio device, a possible test scenario would be
to have the UVC camera from the host OS mapped using virtio-camera into 
the guest OS, allowing a V4L2 application running at the guest to map the 
camera from the host, right?

Regards,
Mauro

