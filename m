Return-Path: <linux-media+bounces-11455-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC4B8C5C6D
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2024 22:45:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 047561F213BE
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2024 20:45:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B39111EA80;
	Tue, 14 May 2024 20:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZKCeN1KY"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F682365;
	Tue, 14 May 2024 20:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715719513; cv=none; b=LBV51L+wYGVxb8vtB5IMyUUjesSwjpM/pZUFW4RQyMrVRMUtjPtXA/FkLpJftlw7bwZbvTAfuvJlaRDH2EiAHCYbkbcU+M/cCNttU+kXc9OQE9e9/IdnZI9IHKyz/BarFfdl2UREvlr3ibEeJ4GAx7BzcbZ4ru4710GI3/XAoO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715719513; c=relaxed/simple;
	bh=7eNU9RHOlvYz9X+A7ir7zV3mJIxGAuNlcZEw26tqzm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sw9h2O0MbuNBxzBfloup0b11ZN/wWfNNPOrWRkScdaeEYBuDEJL/uwIlzveJE/xXCIj9IYwGnrv4JOMN9LogSdNYPUAIz4Ly0eUQqc7fgkyB+KkdsN79pxGGGgfdi8wjhMUeK2hQkXvT3xfobcgbHjbg/Chb6cGU4E/JT/1eIZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZKCeN1KY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 67BDB593;
	Tue, 14 May 2024 22:45:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715719501;
	bh=7eNU9RHOlvYz9X+A7ir7zV3mJIxGAuNlcZEw26tqzm0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZKCeN1KYkhnhY66NAPmiMzYSQv5LFSqkmeYl1k1qb/GRN9aUpl7rMKrEU+j7Cm41Q
	 zXPYNpFuuQHtCdgIB2YCll7gp29X8vuKMcZV3ud1ZyOIqFdL5sdSZAemoY7hCHXGJM
	 lFaSkTekTJXRBsv4JP2xf+TsKGCPrHKQJjY8jZ24=
Date: Tue, 14 May 2024 23:45:00 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Maxime Ripard <mripard@redhat.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Lennart Poettering <mzxreary@0pointer.de>,
	Robert Mader <robert.mader@collabora.com>,
	Sebastien Bacher <sebastien.bacher@canonical.com>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	linaro-mm-sig@lists.linaro.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Milan Zamazal <mzamazal@redhat.com>,
	Andrey Konovalov <andrey.konovalov.ynk@gmail.com>
Subject: Re: Safety of opening up /dev/dma_heap/* to physically present users
 (udev uaccess tag) ?
Message-ID: <20240514204500.GO32013@pendragon.ideasonboard.com>
References: <e7ilwp3vc32xze3iu2ejgqlgz44codsktnvyiufjhuf2zxcnnf@tnwzgzoxvbg2>
 <d2a512b2-e6b1-4675-b406-478074bbbe95@linaro.org>
 <Zjpmu_Xj6BPdkDPa@phenom.ffwll.local>
 <20240507183613.GB20390@pendragon.ideasonboard.com>
 <4f59a9d78662831123cc7e560218fa422e1c5eca.camel@collabora.com>
 <Zjs5eM-rRoh6WYYu@phenom.ffwll.local>
 <20240513-heretic-didactic-newt-1d6daf@penduick>
 <dacacb862275cd7a588c5fcc56fd6c1d85538d12.camel@collabora.com>
 <20240513-auspicious-toucanet-from-heaven-f313af@penduick>
 <643c6d3da9c7f45c32e01dd7179681117557ed4d.camel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <643c6d3da9c7f45c32e01dd7179681117557ed4d.camel@collabora.com>

On Mon, May 13, 2024 at 11:06:24AM -0400, Nicolas Dufresne wrote:
> Le lundi 13 mai 2024 à 15:51 +0200, Maxime Ripard a écrit :
> > On Mon, May 13, 2024 at 09:42:00AM -0400, Nicolas Dufresne wrote:
> > > Le lundi 13 mai 2024 à 10:29 +0200, Maxime Ripard a écrit :
> > > > On Wed, May 08, 2024 at 10:36:08AM +0200, Daniel Vetter wrote:
> > > > > On Tue, May 07, 2024 at 04:07:39PM -0400, Nicolas Dufresne wrote:
> > > > > > Le mardi 07 mai 2024 à 21:36 +0300, Laurent Pinchart a écrit :
> > > > > > > Shorter term, we have a problem to solve, and the best option we have
> > > > > > > found so far is to rely on dma-buf heaps as a backend for the frame
> > > > > > > buffer allocatro helper in libcamera for the use case described above.
> > > > > > > This won't work in 100% of the cases, clearly. It's a stop-gap measure
> > > > > > > until we can do better.
> > > > > > 
> > > > > > Considering the security concerned raised on this thread with dmabuf heap
> > > > > > allocation not be restricted by quotas, you'd get what you want quickly with
> > > > > > memfd + udmabuf instead (which is accounted already).
> > > > > > 
> > > > > > It was raised that distro don't enable udmabuf, but as stated there by Hans, in
> > > > > > any cases distro needs to take action to make the softISP works. This
> > > > > > alternative is easy and does not interfere in anyway with your future plan or
> > > > > > the libcamera API. You could even have both dmabuf heap (for Raspbian) and the
> > > > > > safer memfd+udmabuf for the distro with security concerns.
> > > > > > 
> > > > > > And for the long term plan, we can certainly get closer by fixing that issue
> > > > > > with accounting. This issue also applied to v4l2 io-ops, so it would be nice to
> > > > > > find common set of helpers to fix these exporters.
> > > > > 
> > > > > Yeah if this is just for softisp, then memfd + udmabuf is also what I was
> > > > > about to suggest. Not just as a stopgap, but as the real official thing.
> > > > > 
> > > > > udmabuf does kinda allow you to pin memory, but we can easily fix that by
> > > > > adding the right accounting and then either let mlock rlimits or cgroups
> > > > > kernel memory limits enforce good behavior.
> > > > 
> > > > I think the main drawback with memfd is that it'll be broken for devices
> > > > without an IOMMU, and while you said that it's uncommon for GPUs, it's
> > > > definitely not for codecs and display engines.
> > > 
> > > In the context of libcamera, the allocation and the alignment done to the video
> > > frame is done completely blindly. In that context, there is a lot more then just
> > > the allocation type that can go wrong and will lead to a memory copy. The upside
> > > of memfd, is that the read cache will help speeding up the copies if they are
> > > needed.
> > 
> > dma-heaps provide cacheable buffers too...
> 
> Yes, and why we have cache hints in V4L2 now. There is no clue that softISP code
> can read to make the right call. The required cache management in undefined
> until all the importer are known. I also don't think heaps currently care to
> adapt the dmabuf sync behaviour based on the different importers, or the
> addition of a new importer. On top of which, there is insufficient information
> on the device to really deduce what is needed.
> 
> > > Another important point is that this is only used if the application haven't
> > > provided frames. If your embedded application is non-generic, and you have
> > > permissions to access the right heap, the application can solve your specific
> > > issue. But in the generic Linux space, Linux kernel API are just insufficient
> > > for the "just work" scenario.
> > 
> > ... but they also provide semantics around the memory buffers that no
> > other allocation API do. There's at least the mediatek secure playback
> > series and another one that I've started to work on to allocate ECC
> > protected or unprotected buffers that are just the right use case for
> > the heaps, and the target frameworks aren't.
> 
> Let's agree we are both off topic now. The libcamera softISP is currently purely
> software, and cannot write to any form of protected memory. As for ECC, I would
> hope this usage will be coded in the application and that this application has
> been authorized to access the appropriate heaps.
> 
> And finally, none of this fixes the issue that the heap allocation are not being
> accounted properly and allow of an easy memory DoS. So uaccess should be granted
> with care, meaning that defaulting a "desktop" library to that, means it will
> most of the time not work at all.

I think that issue should be fixed, regardless of whether or not we end
up using dma heaps for libcamera. If we do use them, maybe there will be
a higher incentive for somebody involved in this conversation to tackle
that problem first :-) And maybe, as a result, the rest of the Linux
community will consider with a more open mind usage of dma heaps on
desktop systems.

-- 
Regards,

Laurent Pinchart

