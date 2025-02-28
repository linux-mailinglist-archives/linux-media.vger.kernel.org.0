Return-Path: <linux-media+bounces-27210-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31764A496E2
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 11:19:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9B3F77AA981
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 10:18:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1B7325D916;
	Fri, 28 Feb 2025 10:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JLdgHBis"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59EEE25C71F;
	Fri, 28 Feb 2025 10:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740737916; cv=none; b=egSC6igY0hEvoT4N79dhv0M0MqXm+gVG+0pPlH0WOXnTa6Q0d9axGaE4XaohAdzx55tjm9VRDcLCI/B0RukzJKNJha6B/L5xNbzv5E7Tj8wncIX9695bjFo8KPXg1IFe//Cng0ksRy5yCuhS1N3TnvGcPRbJmXlq9lhUw1AGKYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740737916; c=relaxed/simple;
	bh=x8P7iYSS8zlM2MxoipbGfAAaEUD4PJmjBAoZcxc5kD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=szOXNBPcv7nor0k2a8A7FbJOGsRjaGO/xX0yTjWHRR5usHYJq2QSgvFDfd8A+iOxpn1wrXJ9AkbLn7uzY0jWiS5CBRPOYUb3gv/6yJ2FWPNVQGrHCc9B4xShBdLOMDgHqtmu5F/s6vCwPychZtWGHNObHGXgGSRyeTq4cpwpMLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JLdgHBis; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 75AB99FF;
	Fri, 28 Feb 2025 11:17:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740737822;
	bh=x8P7iYSS8zlM2MxoipbGfAAaEUD4PJmjBAoZcxc5kD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JLdgHBis3RLKhkT3eW8n714D7El9DRKo8B1AEoctvAa5Q2jchorf+TUWnERxqGPqf
	 MVpc40jDJ4R7HJ3v7PaaIQPhYTgJadDRTabMXTWVgWnJlI/9M4U6n0QUDdhb8EPmBB
	 GrRhSm9wKggZ143auapEEkNHipGQOP0W1v9J7Pgc=
Date: Fri, 28 Feb 2025 11:18:28 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Tomasz Figa <tfiga@chromium.org>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Mikhail Rudenko <mike.rudenko@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Dafna Hirschfeld <dafna@fastmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: rkisp1: allow non-coherent video capture buffers
Message-ID: <bgnkzjpegpmif7gohoijt42rku6jruovjsxscg75dprdz5ek2i@ntfh2yyjyiry>
References: <20250102-b4-rkisp-noncoherent-v1-1-bba164f7132c@gmail.com>
 <20250103152326.GP554@pendragon.ideasonboard.com>
 <87bjw9s4s3.fsf@gmail.com>
 <dtfv2slbtj3ar2wvlcnd74p3xtlvggebkk3fj5ocm3eil7kyqw@al3brwf4y5dw>
 <CAAFQd5DS2x3sX59EdkTEMuO=eXc=Q0jD44EUwMisP6ocWz11qg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAFQd5DS2x3sX59EdkTEMuO=eXc=Q0jD44EUwMisP6ocWz11qg@mail.gmail.com>

Hi Tomasz

On Fri, Feb 28, 2025 at 07:00:57PM +0900, Tomasz Figa wrote:
> Hi Jacopo,
>
> On Fri, Feb 28, 2025 at 2:11 AM Jacopo Mondi
> <jacopo.mondi@ideasonboard.com> wrote:
> >
> > Hi Mikhail
> >
> > On Tue, Jan 14, 2025 at 07:00:39PM +0300, Mikhail Rudenko wrote:
> > >
> > > Hi Laurent,
> > >
> > > On 2025-01-03 at 17:23 +02, Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
> > >
> > > > On Thu, Jan 02, 2025 at 06:35:00PM +0300, Mikhail Rudenko wrote:
> > > >> Currently, the rkisp1 driver always uses coherent DMA allocations for
> > > >> video capture buffers. However, on some platforms, using non-coherent
> > > >> buffers can improve performance, especially when CPU processing of
> > > >> MMAP'ed video buffers is required.
> > > >>
> > > >> For example, on the Rockchip RK3399 running at maximum CPU frequency,
> > > >> the time to memcpy a frame from a 1280x720 XRGB32 MMAP'ed buffer to a
> > > >> malloc'ed userspace buffer decreases from 7.7 ms to 1.1 ms when using
> > > >> non-coherent DMA allocation. CPU usage also decreases accordingly.
> > > >
> > > > What's the time taken by the cache management operations ?
> > >
> > > Sorry for the late reply, your question turned out a little more
> > > interesting than I expected initially. :)
> > >
> > > When capturing using Yavta with MMAP buffers under the conditions mentioned
> > > in the commit message, ftrace gives 437.6 +- 1.1 us for
> > > dma_sync_sgtable_for_cpu and 409 +- 14 us for
> > > dma_sync_sgtable_for_device. Thus, it looks like using non-coherent
> > > buffers in this case is more CPU-efficient even when considering cache
> > > management overhead.
> > >
> > > When trying to do the same measurements with libcamera, I failed. In a
> > > typical libcamera use case when MMAP buffers are allocated from a
> > > device, exported as dmabufs and then used for capture on the same device
> > > with DMABUF memory type, cache management in kernel is skipped [1]
> > > [2]. Also, vb2_dc_dmabuf_ops_{begin,end}_cpu_access are no-ops [3], so
> > > DMA_BUF_IOCTL_SYNC from userspace does not work either.
> > >
> > > So it looks like to make this change really useful, the above issue of
> > > cache management for libcamera/DMABUF/videobuf2-dma-contig has to be
> > > solved. I'm not an expert in this area, so any advice is kindly welcome. :)
> >
> > It would be shame if we let this discussion drop dead.. cache
> > management policies are relevant for performances, specifically for
> > cpu access, and your above 7.7ms vs 1.1 ms test clearly shows that.
> >
> > >
> > > [1] https://git.linuxtv.org/media.git/tree/drivers/media/common/videobuf2/videobuf2-core.c?id=94794b5ce4d90ab134b0b101a02fddf6e74c437d#n411
> >
> > I would like to know from Hans if the decision to disallow cache-hints
> > for dmabuf importers is a design choice or is deeply rooted in other
> > reasons I might be missing.
>
> When DMA-buf is used, the responsibility for cache management is
> solely on the CPU users' side, so cache-hints don't really apply. It's
> the exporter (=allocator) who determines the mapping policy of the
> buffer and provides necessary DMA_BUF_SYNC operations (can be no-op if
> the buffer is coherent).

This all makes sense.

I take it as, for libcamera, users of the FrameBufferAllocator helper
(which first exports MMAP buffers from the video device and the
imports them back as DMABUF) won't be able to control the cache
policies.

Now, in the long term, we want FrameBufferAllocator to go away and
have either buffers exported by the consumer (likely DRM) or by a
system wide buffer allocator (when we'll have one) and have the video
devices operate as pure importers. But for the time being the
"first export then import" use case is possibile and valid so I wonder
if we should consider measures to allow controlling caching policies
for this use case too.

>
> Best regards,
> Tomasz
>
> >
> > I'm asking because the idea is for libcamera to act solely as dma-buf
> > importer, the current alloc-export-then-import trick is an helper for
> > applications to work around the absence of a system allocator.
> >
> > If the requirement to disable cache-hints for importers cannot be
> > lifted, for libcamera it means we would not be able to use it.
> >
> >
> > > [2] https://git.linuxtv.org/media.git/tree/drivers/media/common/videobuf2/videobuf2-core.c?id=94794b5ce4d90ab134b0b101a02fddf6e74c437d#n829
> > > [3] https://git.linuxtv.org/media.git/tree/drivers/media/common/videobuf2/videobuf2-dma-contig.c?id=94794b5ce4d90ab134b0b101a02fddf6e74c437d#n426
> > >
> > > --
> > > Best regards,
> > > Mikhail Rudenko
> > >
> >

