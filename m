Return-Path: <linux-media+bounces-27170-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C328A48647
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 18:10:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB2351889C47
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 17:06:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 289CB1DE3A8;
	Thu, 27 Feb 2025 17:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bCxsA/uB"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F3F1DDA2D;
	Thu, 27 Feb 2025 17:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740675938; cv=none; b=rhD2nQyVmlmdqVv7DuHa5SikmlVPgfEwneO/UhnhY3p5/MC6Y7Z5YrcSW960w5hqalK1JBY0ipodux8EI5FpokmTqMQCYJiwJO+o8dHa8MgW7zC72rQBFm27EwkL1be3sXnessVHKYm/bx52w9fekdM44RBsUxrW5TpQafGYFZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740675938; c=relaxed/simple;
	bh=6K6RMuFqw/0yA8o+/CTvB3vW+m44k9m9LPe8/wSzQGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GBg0Oqm/w14U/nS1BxflL29a772Sul68xmFAM4s1pgOYQygm7yZYmAwyDKcno45VXysSOw9UyBoQnb8x3g9IINf9RYJzjgCD+M1XmatZeil/Qvmf0uaN3rYLoRkDK1LPWTHwXTzD+s4WLSxv+lvUxo01UQDOufK8sEucsh5Z8aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bCxsA/uB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 206AF6A6;
	Thu, 27 Feb 2025 18:04:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740675846;
	bh=6K6RMuFqw/0yA8o+/CTvB3vW+m44k9m9LPe8/wSzQGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bCxsA/uBn8Roii7nvPfKx5n6xPZL7bvOmsR03e6MYuo5F1rEuUaT/IQcgdIergUH2
	 fSoNdeEwoNdwohz6Bhze9Yd9195IU04lOE1YT8YByG/hjsK46/0iL4n4NuxECjDjq+
	 tJiXr1m4A1pCk/YO9xgQnI8Wz31UosUIgtoGWbJ0=
Date: Thu, 27 Feb 2025 18:05:31 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Mikhail Rudenko <mike.rudenko@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Dafna Hirschfeld <dafna@fastmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: rkisp1: allow non-coherent video capture buffers
Message-ID: <dtfv2slbtj3ar2wvlcnd74p3xtlvggebkk3fj5ocm3eil7kyqw@al3brwf4y5dw>
References: <20250102-b4-rkisp-noncoherent-v1-1-bba164f7132c@gmail.com>
 <20250103152326.GP554@pendragon.ideasonboard.com>
 <87bjw9s4s3.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87bjw9s4s3.fsf@gmail.com>

Hi Mikhail

On Tue, Jan 14, 2025 at 07:00:39PM +0300, Mikhail Rudenko wrote:
>
> Hi Laurent,
>
> On 2025-01-03 at 17:23 +02, Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
>
> > On Thu, Jan 02, 2025 at 06:35:00PM +0300, Mikhail Rudenko wrote:
> >> Currently, the rkisp1 driver always uses coherent DMA allocations for
> >> video capture buffers. However, on some platforms, using non-coherent
> >> buffers can improve performance, especially when CPU processing of
> >> MMAP'ed video buffers is required.
> >>
> >> For example, on the Rockchip RK3399 running at maximum CPU frequency,
> >> the time to memcpy a frame from a 1280x720 XRGB32 MMAP'ed buffer to a
> >> malloc'ed userspace buffer decreases from 7.7 ms to 1.1 ms when using
> >> non-coherent DMA allocation. CPU usage also decreases accordingly.
> >
> > What's the time taken by the cache management operations ?
>
> Sorry for the late reply, your question turned out a little more
> interesting than I expected initially. :)
>
> When capturing using Yavta with MMAP buffers under the conditions mentioned
> in the commit message, ftrace gives 437.6 +- 1.1 us for
> dma_sync_sgtable_for_cpu and 409 +- 14 us for
> dma_sync_sgtable_for_device. Thus, it looks like using non-coherent
> buffers in this case is more CPU-efficient even when considering cache
> management overhead.
>
> When trying to do the same measurements with libcamera, I failed. In a
> typical libcamera use case when MMAP buffers are allocated from a
> device, exported as dmabufs and then used for capture on the same device
> with DMABUF memory type, cache management in kernel is skipped [1]
> [2]. Also, vb2_dc_dmabuf_ops_{begin,end}_cpu_access are no-ops [3], so
> DMA_BUF_IOCTL_SYNC from userspace does not work either.
>
> So it looks like to make this change really useful, the above issue of
> cache management for libcamera/DMABUF/videobuf2-dma-contig has to be
> solved. I'm not an expert in this area, so any advice is kindly welcome. :)

It would be shame if we let this discussion drop dead.. cache
management policies are relevant for performances, specifically for
cpu access, and your above 7.7ms vs 1.1 ms test clearly shows that.

>
> [1] https://git.linuxtv.org/media.git/tree/drivers/media/common/videobuf2/videobuf2-core.c?id=94794b5ce4d90ab134b0b101a02fddf6e74c437d#n411

I would like to know from Hans if the decision to disallow cache-hints
for dmabuf importers is a design choice or is deeply rooted in other
reasons I might be missing.

I'm asking because the idea is for libcamera to act solely as dma-buf
importer, the current alloc-export-then-import trick is an helper for
applications to work around the absence of a system allocator.

If the requirement to disable cache-hints for importers cannot be
lifted, for libcamera it means we would not be able to use it.


> [2] https://git.linuxtv.org/media.git/tree/drivers/media/common/videobuf2/videobuf2-core.c?id=94794b5ce4d90ab134b0b101a02fddf6e74c437d#n829
> [3] https://git.linuxtv.org/media.git/tree/drivers/media/common/videobuf2/videobuf2-dma-contig.c?id=94794b5ce4d90ab134b0b101a02fddf6e74c437d#n426
>
> --
> Best regards,
> Mikhail Rudenko
>

