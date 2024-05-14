Return-Path: <linux-media+bounces-11454-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DAF8C5C69
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2024 22:42:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D25F01F218A8
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2024 20:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE54F1EA74;
	Tue, 14 May 2024 20:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="g1jd9tkR"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C27A365;
	Tue, 14 May 2024 20:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715719356; cv=none; b=bDxN+WPLHFgRpMmUSkr8zOlkMIEX+fjfyVOwsoQIL49dcz3xoTOlBhkL1YtgR9tupzQ7OmV/StNDAZ4hOfePTe5kiM6naI9Fur5o7WT6sMhOhTQlBMTlE8yfZudcNybTk07WzboSL8u3UNM0We0HnfTrq3x7JEjTE9Hz37mebr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715719356; c=relaxed/simple;
	bh=sRKskYXnbDMTdnVd69iQ9BIfpmmR2Am8vZGZl3ZoXN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bjwLv/vmb3vmIf30QV2pdnDmHc6pSf1rld3etyNKNr4FTdAkNRrDsDAMwAeYc+wAG5vz7xiajO9paq3mWSaH2odMCpa1NvLxz2KAcLxtz84YdZMmAgdaRjRMpto5vLJ7JkKespkFR4ZpVYSV2A7sVhokVRWXXXWoibY0obOrn7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=g1jd9tkR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5EED227C;
	Tue, 14 May 2024 22:42:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715719344;
	bh=sRKskYXnbDMTdnVd69iQ9BIfpmmR2Am8vZGZl3ZoXN0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g1jd9tkRfyqvU9Gw+I1xqhrRXrWM9ZBrC46Dz6Ad+zlccA7faY92a3N1c+MiojGsx
	 ihWiDquADL23deZUdwviwXFnED5gB2LnHveH6LMaA1cL33+5NfvUSyADiAOPlPsDUj
	 IeN0svCby4JyUUJDVWu+UsDm/LUR6nya/A2YUBr8=
Date: Tue, 14 May 2024 23:42:23 +0300
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
Message-ID: <20240514204223.GN32013@pendragon.ideasonboard.com>
References: <3c0c7e7e-1530-411b-b7a4-9f13e0ff1f9e@redhat.com>
 <e7ilwp3vc32xze3iu2ejgqlgz44codsktnvyiufjhuf2zxcnnf@tnwzgzoxvbg2>
 <d2a512b2-e6b1-4675-b406-478074bbbe95@linaro.org>
 <Zjpmu_Xj6BPdkDPa@phenom.ffwll.local>
 <20240507183613.GB20390@pendragon.ideasonboard.com>
 <4f59a9d78662831123cc7e560218fa422e1c5eca.camel@collabora.com>
 <Zjs5eM-rRoh6WYYu@phenom.ffwll.local>
 <20240513-heretic-didactic-newt-1d6daf@penduick>
 <20240513083417.GA18630@pendragon.ideasonboard.com>
 <c4db22ad94696ed22282bf8dad15088d94ade5d6.camel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c4db22ad94696ed22282bf8dad15088d94ade5d6.camel@collabora.com>

On Mon, May 13, 2024 at 11:10:00AM -0400, Nicolas Dufresne wrote:
> Le lundi 13 mai 2024 à 11:34 +0300, Laurent Pinchart a écrit :
> > On Mon, May 13, 2024 at 10:29:22AM +0200, Maxime Ripard wrote:
> > > On Wed, May 08, 2024 at 10:36:08AM +0200, Daniel Vetter wrote:
> > > > On Tue, May 07, 2024 at 04:07:39PM -0400, Nicolas Dufresne wrote:
> > > > > Hi,
> > > > > 
> > > > > Le mardi 07 mai 2024 à 21:36 +0300, Laurent Pinchart a écrit :
> > > > > > Shorter term, we have a problem to solve, and the best option we have
> > > > > > found so far is to rely on dma-buf heaps as a backend for the frame
> > > > > > buffer allocatro helper in libcamera for the use case described above.
> > > > > > This won't work in 100% of the cases, clearly. It's a stop-gap measure
> > > > > > until we can do better.
> > > > > 
> > > > > Considering the security concerned raised on this thread with dmabuf heap
> > > > > allocation not be restricted by quotas, you'd get what you want quickly with
> > > > > memfd + udmabuf instead (which is accounted already).
> > > > > 
> > > > > It was raised that distro don't enable udmabuf, but as stated there by Hans, in
> > > > > any cases distro needs to take action to make the softISP works. This
> > > > > alternative is easy and does not interfere in anyway with your future plan or
> > > > > the libcamera API. You could even have both dmabuf heap (for Raspbian) and the
> > > > > safer memfd+udmabuf for the distro with security concerns.
> > > > > 
> > > > > And for the long term plan, we can certainly get closer by fixing that issue
> > > > > with accounting. This issue also applied to v4l2 io-ops, so it would be nice to
> > > > > find common set of helpers to fix these exporters.
> > > > 
> > > > Yeah if this is just for softisp, then memfd + udmabuf is also what I was
> > > > about to suggest. Not just as a stopgap, but as the real official thing.
> > > > 
> > > > udmabuf does kinda allow you to pin memory, but we can easily fix that by
> > > > adding the right accounting and then either let mlock rlimits or cgroups
> > > > kernel memory limits enforce good behavior.
> > > 
> > > I think the main drawback with memfd is that it'll be broken for devices
> > > without an IOMMU, and while you said that it's uncommon for GPUs, it's
> > > definitely not for codecs and display engines.
> > 
> > If the application wants to share buffers between the camera and a
> > display engine or codec, it should arguably not use the libcamera
> > FrameBufferAllocator, but allocate the buffers from the display or the
> > encoder. memfd wouldn't be used in that case.
> > 
> > We need to eat our own dogfood though. If we want to push the
> > responsibility for buffer allocation in the buffer sharing case to the
> > application, we need to modify the cam application to do so when using
> > the KMS backend.
> 
> Agreed, and the new dmabuf feedback on wayland can also be used on top of this.
> 
> You'll hit the same limitation as we hit in GStreamer, which is that KMS driver
> only offer allocation for render buffers and most of them are missing allocators
> for YUV buffers, even though they can import in these formats. (kms allocators,
> except dumb, which has other issues, are format aware).

My experience on Arm platforms is that the KMS drivers offer allocation
for scanout buffers, not render buffers, and mostly using the dumb
allocator API. If the KMS device can scan out YUV natively, YUV buffer
allocation should be supported. Am I missing something here ?

-- 
Regards,

Laurent Pinchart

