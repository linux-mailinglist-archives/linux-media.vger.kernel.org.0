Return-Path: <linux-media+bounces-26085-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF7DA3302C
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 20:56:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0806A1644F7
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 19:56:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41163200106;
	Wed, 12 Feb 2025 19:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="B96uFBg0"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977351FCF62;
	Wed, 12 Feb 2025 19:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739390182; cv=none; b=nnlI0/fMhnzrh9Xxrx57pWUHlP1C5/Y2vL94sLlpXdBCWKaN9QXkK6/R/0M49SkEPZoJZCUuuSCHomXWeqvtgYETBOejT6p7HNjegiqAcPQaWjGhovGzGDSfLFwhTP36PxAMzy4ccCtGCzbSrSluOPuKcm+0vHdNfPzvvlLQOcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739390182; c=relaxed/simple;
	bh=+sniyVR/B0Yb/z8XD0mdxMuslgA/Q7KL56k8Ile7nZw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ERxltK2IYEaWd7ypKt6+HT07F4tdpaUj7hXBpIZTqr08orCwUKxH4fTOfxrM46MJ2Q7b66JBjZu5r9EgEzOLQJppNgSuVFmCDv7jC4BZQiMgohbnsiRuNx2DyKyr+iaODiYj8oghomzyD9/e3JLDFJ+OnG9nR7tbAW1TqOPUCD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=B96uFBg0; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739390178;
	bh=+sniyVR/B0Yb/z8XD0mdxMuslgA/Q7KL56k8Ile7nZw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=B96uFBg0BHhPOJvShbkADmFq5biDN9hj5Rox1Fr1rFqsdvJ3kl4eDTGXrogGQsFNX
	 t3fltvwSsY/s66iEaMaBKFBMWWDMKmbXGslowtM/eaB0OELNOphCO2QLH1cdCcUdWt
	 0GS8bs4kuAjQUTsZMBHwutDcZgq4LHED2RUrL7PhUNJNA8W/Py9+88KFCNDPiYxrch
	 QftG37m17MTm2ZtlSRTTIO3QBUXrtqPI2dCyxQO3z3iWzKYeUB9NNmmrgV+qCJH1az
	 eEohsKEBHzMlVlyuuXzRz4oNQSCpRbiWyr7Wq0FWa0U9kYQ1YN8nOy1UY5TyaMEIQi
	 JGRsF58P2DDLw==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B46F117E0E9E;
	Wed, 12 Feb 2025 20:56:17 +0100 (CET)
Date: Wed, 12 Feb 2025 20:56:13 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org,
 Olivier Masse <olivier.masse@nxp.com>, Thierry Reding
 <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Sumit Garg
 <sumit.garg@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, Florent Tomasin <florent.tomasin@arm.com>
Subject: Re: [PATCH v4 0/6] TEE subsystem for restricted dma-buf allocations
Message-ID: <20250212205613.4400a888@collabora.com>
In-Reply-To: <20241217100809.3962439-1-jens.wiklander@linaro.org>
References: <20241217100809.3962439-1-jens.wiklander@linaro.org>
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

+Florent, who's working on protected-mode support in Panthor.

Hi Jens,

On Tue, 17 Dec 2024 11:07:36 +0100
Jens Wiklander <jens.wiklander@linaro.org> wrote:

> Hi,
> 
> This patch set allocates the restricted DMA-bufs via the TEE subsystem.

We're currently working on protected-mode support for Panthor [1] and it
looks like your series (and the OP-TEE implementation that goes with
it) would allow us to have a fully upstream/open solution for the
protected content use case we're trying to support. I need a bit more
time to play with the implementation but this looks very promising
(especially the lend rstmem feature, which might help us allocate our
FW sections that are supposed to execute code accessing protected
content).

> 
> The TEE subsystem handles the DMA-buf allocations since it is the TEE
> (OP-TEE, AMD-TEE, TS-TEE, or perhaps a future QCOMTEE) which sets up the
> restrictions for the memory used for the DMA-bufs.
> 
> I've added a new IOCTL, TEE_IOC_RSTMEM_ALLOC, to allocate the restricted
> DMA-bufs. This IOCTL reaches the backend TEE driver, allowing it to choose
> how to allocate the restricted physical memory.

I'll probably have more questions soon, but here's one to start: any
particular reason you didn't go for a dma-heap to expose restricted
buffer allocation to userspace? I see you already have a cdev you can
take ioctl()s from, but my understanding was that dma-heap was the
standard solution for these device-agnostic/central allocators.

Regards,

Boris

[1]https://lwn.net/ml/all/cover.1738228114.git.florent.tomasin@arm.com/#t

