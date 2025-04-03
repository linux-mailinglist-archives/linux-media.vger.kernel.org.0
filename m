Return-Path: <linux-media+bounces-29309-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AA4A7A0F7
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 12:26:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 708E9174EBE
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 10:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B60D248896;
	Thu,  3 Apr 2025 10:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WAxALzSe"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C05E18CC08;
	Thu,  3 Apr 2025 10:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743675953; cv=none; b=ijQOA3ozb40rW4VdbUIcCLDzZC98aMe0q9ufXsyMyVya39wyLr3XYuFU/fBLUAnEu3ovLdzYp2gZt0Pov1cwPnkF/svQwniEsRsk5FdEuwyP+hDyWGK9p67Hf4IpviexhPYuZ7w7bdT+U9AEYHrVxDBs7Ucm0pkd8iv2t4PBm88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743675953; c=relaxed/simple;
	bh=Y9/JjJAnyFciSb9gRCH9l+cicpwYPTr2yg3ZDp1TJSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=isM5uB7PSZPPIjRdXlDO2/+RmvtB9RhH6dF8Lpskfw+11WecirHf61BD44x/B6NUKCiO+qVBOrLJUzBvSSa4h210KwWdZ0QGWT+5KV8bouf09cmLNCDvisBPMi/uw3RTosu65Y/N06IRIJbFmmW1mB4FQ/S2CBfU1VrjhQes0+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WAxALzSe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF4C6C4CEE3;
	Thu,  3 Apr 2025 10:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743675953;
	bh=Y9/JjJAnyFciSb9gRCH9l+cicpwYPTr2yg3ZDp1TJSc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WAxALzSesz8VNaOY9otLdh3s16xHmTqb9sTdv49jH6Cb/gbWzB8mOcn/QHElPh1Ci
	 UV8gKr3iU2QVTH3M5dCwpMc9rPLZ68B01ebi8L5oUZqRT8bBEg3qFQ0GzOmtsG26Ca
	 cEELM2NjI1OMJG2esNzR9sEJ4K+CvBaU2e1Q93dwe3BMInQ1x6/yigYwmPCtBsTB75
	 Tvmh7HCZEILaJdy/h36a0GLLpuLiu/x6jkpPcgLrjFmWpfhDnjqR1t7MHRgv+hNISy
	 r7G0JzveWH0Tljon7pheRV0OBLNfvJfLOKWwYghFLbt+bxIZpT44RVC4+mRxMqH95D
	 Dj4CSnoFmz4bA==
Date: Thu, 3 Apr 2025 12:25:47 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: phasta@kernel.org
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] drm/nouveau: Prevent signalled fences in pending list
Message-ID: <Z-5iK-mIYPIhanX-@pollux>
References: <20250403101353.42880-2-phasta@kernel.org>
 <84b0db2de7a26aab00778bcaca15a0dffaa9c32a.camel@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <84b0db2de7a26aab00778bcaca15a0dffaa9c32a.camel@mailbox.org>

On Thu, Apr 03, 2025 at 12:17:29PM +0200, Philipp Stanner wrote:
> On Thu, 2025-04-03 at 12:13 +0200, Philipp Stanner wrote:
> > -static int
> > -nouveau_fence_signal(struct nouveau_fence *fence)
> > +static void
> > +nouveau_fence_cleanup_cb(struct dma_fence *dfence, struct
> > dma_fence_cb *cb)
> >  {
> > -	int drop = 0;
> > +	struct nouveau_fence_chan *fctx;
> > +	struct nouveau_fence *fence;
> > +
> > +	fence = container_of(dfence, struct nouveau_fence, base);
> > +	fctx = nouveau_fctx(fence);
> >  
> > -	dma_fence_signal_locked(&fence->base);
> >  	list_del(&fence->head);
> >  	rcu_assign_pointer(fence->channel, NULL);
> >  
> >  	if (test_bit(DMA_FENCE_FLAG_USER_BITS, &fence->base.flags))
> > {
> > -		struct nouveau_fence_chan *fctx =
> > nouveau_fctx(fence);
> > -
> >  		if (!--fctx->notify_ref)
> > -			drop = 1;
> > +			nvif_event_block(&fctx->event);
> >  	}
> >  
> >  	dma_fence_put(&fence->base);
> 
> What I realized while coding this v2 is that we might want to think
> about whether we really want the dma_fence_put() in the fence callback?
> 
> It should work fine, since it's exactly identical to the previous
> code's behavior – but effectively it means that the driver's reference
> will be dropped whenever it signals that fence.

Not quite, it's the reference of the fence context's pending list.

When the fence is emitted, dma_fence_init() is called, which initializes the
reference count to 1. Subsequently, another reference is taken, when the fence
is added to the pending list. Once the fence is signaled and hence removed from
the pending list, we can (and have to) drop this reference.

