Return-Path: <linux-media+bounces-33474-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 13385AC5114
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 16:39:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C066A16D6D9
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 14:39:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D1C527979A;
	Tue, 27 May 2025 14:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IZDpTc8I"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E2F15853B;
	Tue, 27 May 2025 14:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748356777; cv=none; b=Omr8LiVxt+CzYQNHHsX18cHAeHSXEEQ+c12/eULud8rfS/xLjpXtAAFblOCLQMQyplfoDnAv6f/p95DSqhtOgndJy4++hbN16GOq74kh4/rugbakVFZ6aOHLPyE1uQv/KBz7MPdbTAjEpTkgGVPqun+A5pQPBBtEV2byq5ysiCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748356777; c=relaxed/simple;
	bh=SIHiBuhpjPK/1AtoijPPLN7AI4IqXBz7Iaq9I7uU1FU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bz5o7p1BrTjel2yBWkAMf28VqfbR8gNQrVuQP81uNOJGwL6iy5Zr7tir8JWRHfp8kd8L0NCpWyE1V6HomybOGfFsIOfFNZ7EsyaNKfiR1ThEriRb8qHbToeNTlECvgLlxYcDavRM6Ezo4tpy03CARB5SWOVBrOa0ibV9lK3/g8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IZDpTc8I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6750FC4CEE9;
	Tue, 27 May 2025 14:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748356776;
	bh=SIHiBuhpjPK/1AtoijPPLN7AI4IqXBz7Iaq9I7uU1FU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=IZDpTc8IzRgKdv1zX5MrPbKN19+wzSY+NBMXsU73mRn/C3V3Rg33h1YJ+L7GLtJoj
	 sz/9XpbV2MrHGQhXcJLpoWsfafqcPlFqBE0/25wKCOpbyKizkz/3YgO1MPsMV1kEEN
	 WoAS2CAybUcKcs7GL6W9+UU6rQvemC+c01OdJecEX1hXlbNTpGU2MZ2rU3BHgJIls5
	 QvtGWeypR86j+6BvWwF3fwf/yAtA4PDbWsomHw0KNrRaoB9UfP2b5RGgH6isafP6x5
	 u4Y/f1asnKlT5GYOA7PVKZITQDCkDRGuJXTjizyqaFuiQaXGn7KZQPl2gHt95nGRw7
	 Jcz54BgLU9ttw==
Date: Tue, 27 May 2025 16:39:27 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Albert Esteve
 <aesteve@redhat.com>, Jason Wang <jasowang@redhat.com>, Xuan Zhuo
 <xuanzhuo@linux.alibaba.com>, Eugenio =?UTF-8?B?UMOpcmV6?=
 <eperezma@redhat.com>, gurchetansingh@google.com,
 daniel.almeida@collabora.com, adelva@google.com, changyeon@google.com,
 nicolas.dufresne@collabora.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, virtualization@lists.linux.dev, Alexandre
 Courbot <acourbot@google.com>
Subject: Re: [PATCH v3] media: add virtio-media driver
Message-ID: <20250527163927.02924adc@sal.lan>
In-Reply-To: <20250527102111-mutt-send-email-mst@kernel.org>
References: <20250412-virtio-media-v3-1-97dc94c18398@gmail.com>
	<20250526141316.7e907032@foz.lan>
	<20250527102111-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Tue, 27 May 2025 10:23:32 -0400
"Michael S. Tsirkin" <mst@redhat.com> escreveu:

> On Mon, May 26, 2025 at 02:13:16PM +0200, Mauro Carvalho Chehab wrote:
> > Hi Michael,
> > 
> > Em Sat, 12 Apr 2025 13:08:01 +0900
> > Alexandre Courbot <gnurou@gmail.com> escreveu:
> >   
> > > Add the first version of the virtio-media driver.
> > > 
> > > This driver acts roughly as a V4L2 relay between user-space and the
> > > virtio virtual device on the host, so it is relatively simple, yet
> > > unconventional. It doesn't use VB2 or other frameworks typically used in
> > > a V4L2 driver, and most of its complexity resides in correctly and
> > > efficiently building the virtio descriptor chain to pass to the host,
> > > avoiding copies whenever possible. This is done by
> > > scatterlist_builder.[ch].
> > > 
> > > virtio_media_ioctls.c proxies each supported ioctl to the host, using
> > > code generated through macros for ioctls that can be forwarded directly,
> > > which is most of them.
> > > 
> > > virtio_media_driver.c provides the expected driver hooks, and support
> > > for mmapping and polling.
> > > 
> > >  This version supports MMAP buffers, while USERPTR buffers can also be
> > >  enabled through a driver option. DMABUF support is still pending.  
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
> > 
> > In this particular case, we need to double-check if this won't cause
> > any issues, in special with regards to media locks and mutexes.
> > 
> > I'll try to look on it after this merge window, as it is too late
> > for it to be applied during this one.
> > 
> > Regards,
> > Mauro  
> 
> New drivers generally can be merged during the merge window,
> especially early. 

Sure, but this one was not reviewed or tested yet by media maintainers,
nor its submission came with the tests from the regression tool
we use (v4l2-compliance). In particular, we need to double-check
if it won't cause any issues with the complex set of mutexes and
spinlocks that we have within the core.

There is an additional concern related to V4L2: on media, only one
process is allowed to have exclusive streaming access to the
device: all other opens on the same device get permission denied
(by default - there is an optional ioctl that allows a process
to "abdicate" its streaming rights). We need to double-check how this
is implemented and how this would behavior when multiple VMs have
the driver installed and might try to use (or not), and how this
would affect the host access to the device.

There are also some coding style issues that cause our CI to
complain. Those are minor and could be fixed by a separate patch,
but better to have them placed altogether as otherwise our CI
will keep complaining about until the fix is merged.

On other words, this driver is not ready for merge yet.
We need some time to test and review it properly.

> It's up to you though.
> I can keep it in next for now, so it gets some coverage by
> tools scanning that tree.

Sure, feel free to keep it on next if you prefer so. Just
please don't submit it upstream while we don't review and
properly test it.

Thanks!
Mauro

