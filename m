Return-Path: <linux-media+bounces-29320-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB73A7A306
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 14:42:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90AA93B1D4E
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 12:41:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB44F24DFE8;
	Thu,  3 Apr 2025 12:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dUq2VjJu"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B45F35942;
	Thu,  3 Apr 2025 12:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743684113; cv=none; b=he3Igdty8Aq609ecx8L0XscX77mlvrUp0vYJYgh9j96w6CoOVxYkUsk5CTadcEgmPC3DFhXHz1z9J2qnVvzTnUYXflIVRMFFsOMolG1WpmOmLinxOpSt8uraAb0+rb2n7Y9A0aCQfxfXeP0iXUFEgBOaUh4zRMLHycft0PB3s3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743684113; c=relaxed/simple;
	bh=LGx8mY/z+MPgpys1YPn8RJrMFyUgaEpjAl6F2S4oY7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uV5emc+Oe5kquymFJN/rdw1OaVz7R38fuu7+BfU5615LWXmwzyGYg5TsDfMwGbUZnXxZgkcKjizWqE7eQYa6Uj/oshgqqPnnAbcukb9qt8xCTfDOt+EZjR7wk0s/aoJ7KjbGEAJdDsdLhBMa3gQRZQ3VL16ut8Az4+2ayidIlAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dUq2VjJu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FB6EC4CEE3;
	Thu,  3 Apr 2025 12:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743684112;
	bh=LGx8mY/z+MPgpys1YPn8RJrMFyUgaEpjAl6F2S4oY7c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dUq2VjJu/2ZzI8SQwxnUdPnRgdLfkx1cCduzqAr4hMck8JkhiERImrf+Kb4uhBHx7
	 GogTOyt+MuGoLpyhKBXBCdewR6+RntWeSrOJ9UawXVVqO8Ai4z7pGG8+D+QODOV6v4
	 bYhdLQ7tgngK7k6boNzaaPr6Ds0o3xjzozvt5cg3SPuhxEBdwMvNypZ1XFhnHZjQpx
	 z4L1s1uZyGq+HZ5fWE7AVa+h4t/5IBIh7mPpzllUjk6f2iwgq5/oN2tplM6UhG919e
	 C9OHXj/aMdmd29c22D+PmSlC1IXHBUV1Vpaivdl0+R9RLGDO/FFQTJEHkqvfTtwnnA
	 zMU+OQftMMjXw==
Date: Thu, 3 Apr 2025 14:41:47 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: phasta@kernel.org, Lyude Paul <lyude@redhat.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] drm/nouveau: Prevent signalled fences in pending list
Message-ID: <Z-6CC3TFfXTrkQGY@pollux>
References: <20250403101353.42880-2-phasta@kernel.org>
 <84b0db2de7a26aab00778bcaca15a0dffaa9c32a.camel@mailbox.org>
 <Z-5iK-mIYPIhanX-@pollux>
 <28343002-1a64-4409-b6c5-f9764705d939@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <28343002-1a64-4409-b6c5-f9764705d939@amd.com>

On Thu, Apr 03, 2025 at 02:22:41PM +0200, Christian König wrote:
> Am 03.04.25 um 12:25 schrieb Danilo Krummrich:
> > On Thu, Apr 03, 2025 at 12:17:29PM +0200, Philipp Stanner wrote:
> >> On Thu, 2025-04-03 at 12:13 +0200, Philipp Stanner wrote:
> >>> -static int
> >>> -nouveau_fence_signal(struct nouveau_fence *fence)
> >>> +static void
> >>> +nouveau_fence_cleanup_cb(struct dma_fence *dfence, struct
> >>> dma_fence_cb *cb)
> >>>  {
> >>> -	int drop = 0;
> >>> +	struct nouveau_fence_chan *fctx;
> >>> +	struct nouveau_fence *fence;
> >>> +
> >>> +	fence = container_of(dfence, struct nouveau_fence, base);
> >>> +	fctx = nouveau_fctx(fence);
> >>>  
> >>> -	dma_fence_signal_locked(&fence->base);
> >>>  	list_del(&fence->head);
> >>>  	rcu_assign_pointer(fence->channel, NULL);
> >>>  
> >>>  	if (test_bit(DMA_FENCE_FLAG_USER_BITS, &fence->base.flags))
> >>> {
> >>> -		struct nouveau_fence_chan *fctx =
> >>> nouveau_fctx(fence);
> >>> -
> >>>  		if (!--fctx->notify_ref)
> >>> -			drop = 1;
> >>> +			nvif_event_block(&fctx->event);
> >>>  	}
> >>>  
> >>>  	dma_fence_put(&fence->base);
> >> What I realized while coding this v2 is that we might want to think
> >> about whether we really want the dma_fence_put() in the fence callback?
> >>
> >> It should work fine, since it's exactly identical to the previous
> >> code's behavior – but effectively it means that the driver's reference
> >> will be dropped whenever it signals that fence.
> > Not quite, it's the reference of the fence context's pending list.
> >
> > When the fence is emitted, dma_fence_init() is called, which initializes the
> > reference count to 1. Subsequently, another reference is taken, when the fence
> > is added to the pending list. Once the fence is signaled and hence removed from
> > the pending list, we can (and have to) drop this reference.
> 
> The general idea is that the caller must hold the reference until the signaling is completed.
> 
> So for signaling from the interrupt handler it means that you need to call dma_fence_put() for the list reference *after* you called dma_fence_signal_locked().
> 
> For signaling from the .enable_signaling or .signaled callback you need to remove the fence from the linked list and call dma_fence_put() *before* you return (because the caller is holding the potential last reference).
> 
> That's why I'm pretty sure that the approach with installing the callback won't work. As far as I know no other DMA fence implementation is doing that.

I think it works as long as no one calls dma_fence_singnal(), but only
dma_fence_signal_locked() on this fence (which is what nouveau does). For
dma_fence_signal_locked() it doesn't seem to matter if the last reference is
dropped from a callback. There also can't be other callbacks that suffer from
this, because they'd need to have their own reference.

But either way, as mentioned in my other reply, I agree that we should avoid the
callback approach in favor of your proposal, since it has its own footgun.

