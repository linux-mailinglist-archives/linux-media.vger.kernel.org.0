Return-Path: <linux-media+bounces-26110-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F78A33A12
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2025 09:36:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1E513A92EE
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2025 08:36:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79F6F20C01C;
	Thu, 13 Feb 2025 08:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="RZNzLEyW"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9B720C008;
	Thu, 13 Feb 2025 08:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739435767; cv=none; b=gjykiplFykkZcd4u4Kb6xN5VtpICidq+aQDWpkKhQ9kWxrOtXXeF+T69/NGdcA1grE7X5NWto43t8/jnigRy7DUpvZxsyKPgSZJ4NiltLkeHpcgAHRBBMkwR5YcWIdXvPcst6yMbrvfRmQWqq5bUWTLfac2PcGIgF/dhho+5fJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739435767; c=relaxed/simple;
	bh=0ljVmsCU5Z5rev84vqt4fS5crKIkLIWMPKtmSDok3Cg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X+nriegd3bIeRw1NQtrENpsHmD3OxMSSD/qBNMYyueTw1FG5ur8mbFdNY8Dyv/ZExbDM0i2KpQfb4k+OoYhlkDDtgsTzzsm+l81QrzFF/jGgo/v9Oq4hRE2COp+Df95fyxqLQ0qJVmcPUPy3Do+vXl7ePynZLNN83daXYBn7HoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=RZNzLEyW; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739435763;
	bh=0ljVmsCU5Z5rev84vqt4fS5crKIkLIWMPKtmSDok3Cg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RZNzLEyW5od4bpV21W2GOLaB+EQf9NM3Vr/28YMK8Y3zqoCs/o8noc4abjJup+69D
	 h+CtGYYRujty8aJDL3vRiUwVdW1tB7UqrBGkQQjkAJSNqGufNsHtsV+p5eRSIrhwXA
	 5yU74D7snI9/gkHWlPM1XKv+X/lzlHZP+b8sIOrJzF1nUPCNY9xXA2rCd6GxHxhbTX
	 QXJj16DbEu5wehPijt0JmwzwJ42ROjvMo1lijGkdXdl5Nm7Igju1Mc+VhbE9ej2DLL
	 8FBAnNGeigkOXtznT1AUSH1ycFYkWmPnzRcUf6bd3BI9w9WuP/Pa1fyt3AUEbk9tSW
	 P8r0QvjF/v22g==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7D15417E0F44;
	Thu, 13 Feb 2025 09:36:02 +0100 (CET)
Date: Thu, 13 Feb 2025 09:35:57 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Sumit Garg <sumit.garg@linaro.org>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org,
 Olivier Masse <olivier.masse@nxp.com>, Thierry Reding
 <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com,
 Florent Tomasin <florent.tomasin@arm.com>
Subject: Re: [PATCH v4 0/6] TEE subsystem for restricted dma-buf allocations
Message-ID: <20250213093557.278f5d19@collabora.com>
In-Reply-To: <CAFA6WYOaGEPj0xNEDBCoEmjJreEHChjQ2hyXRJ_CYoGhiBonfw@mail.gmail.com>
References: <20241217100809.3962439-1-jens.wiklander@linaro.org>
	<20250212205613.4400a888@collabora.com>
	<CAFA6WYOaGEPj0xNEDBCoEmjJreEHChjQ2hyXRJ_CYoGhiBonfw@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 13 Feb 2025 12:11:52 +0530
Sumit Garg <sumit.garg@linaro.org> wrote:

> Hi Boris,
> 
> On Thu, 13 Feb 2025 at 01:26, Boris Brezillon
> <boris.brezillon@collabora.com> wrote:
> >
> > +Florent, who's working on protected-mode support in Panthor.
> >
> > Hi Jens,
> >
> > On Tue, 17 Dec 2024 11:07:36 +0100
> > Jens Wiklander <jens.wiklander@linaro.org> wrote:
> >  
> > > Hi,
> > >
> > > This patch set allocates the restricted DMA-bufs via the TEE subsystem.  
> >
> > We're currently working on protected-mode support for Panthor [1] and it
> > looks like your series (and the OP-TEE implementation that goes with
> > it) would allow us to have a fully upstream/open solution for the
> > protected content use case we're trying to support. I need a bit more
> > time to play with the implementation but this looks very promising
> > (especially the lend rstmem feature, which might help us allocate our
> > FW sections that are supposed to execute code accessing protected
> > content).  
> 
> Glad to hear that, if you can demonstrate an open source use case
> based on this series then it will help to land it. We really would
> love to see support for restricted DMA-buf consumers be it GPU, crypto
> accelerator, media pipeline etc.
> 
> >  
> > >
> > > The TEE subsystem handles the DMA-buf allocations since it is the TEE
> > > (OP-TEE, AMD-TEE, TS-TEE, or perhaps a future QCOMTEE) which sets up the
> > > restrictions for the memory used for the DMA-bufs.
> > >
> > > I've added a new IOCTL, TEE_IOC_RSTMEM_ALLOC, to allocate the restricted
> > > DMA-bufs. This IOCTL reaches the backend TEE driver, allowing it to choose
> > > how to allocate the restricted physical memory.  
> >
> > I'll probably have more questions soon, but here's one to start: any
> > particular reason you didn't go for a dma-heap to expose restricted
> > buffer allocation to userspace? I see you already have a cdev you can
> > take ioctl()s from, but my understanding was that dma-heap was the
> > standard solution for these device-agnostic/central allocators.  
> 
> This series started with the DMA heap approach only here [1] but later
> discussions [2] lead us here. To point out specifically:
> 
> - DMA heaps require reliance on DT to discover static restricted
> regions carve-outs whereas via the TEE implementation driver (eg.
> OP-TEE) those can be discovered dynamically.

Hm, the system heap [1] doesn't rely on any DT information AFAICT.
The dynamic allocation scheme, where the TEE implementation allocates a
chunk of protected memory for us would have a similar behavior, I guess.

> - Dynamic allocation of buffers and making them restricted requires
> vendor specific driver hooks with DMA heaps whereas the TEE subsystem
> abstracts that out with underlying TEE implementation (eg. OP-TEE)
> managing the dynamic buffer restriction.

Yeah, the lend rstmem feature is clearly something tee specific, and I
think that's okay to assume the user knows the protection request
should go through the tee subsystem in that case.

> - TEE subsystem already has a well defined user-space interface for
> managing shared memory buffers with TEE and restricted DMA buffers
> will be yet another interface managed along similar lines.

Okay, so the very reason I'm asking about the dma-buf heap interface is
because there might be cases where the protected/restricted allocation
doesn't go through the TEE (Mediatek has a TEE-free implementation
for instance, but I realize vendor implementations are probably not the
best selling point :-/). If we expose things as a dma-heap, we have
a solution where integrators can pick the dma-heap they think is
relevant for protected buffer allocations without the various drivers
(GPU, video codec, ...) having to implement a dispatch function for all
possible implementations. The same goes for userspace allocations,
where passing a dma-heap name, is simpler than supporting different
ioctl()s based on the allocation backend.

[1]https://elixir.bootlin.com/linux/v6.13.2/source/drivers/dma-buf/heaps/system_heap.c#L424

