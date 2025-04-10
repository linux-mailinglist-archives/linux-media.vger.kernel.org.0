Return-Path: <linux-media+bounces-29918-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 73692A842F4
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 14:22:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0C6F8C037C
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 12:21:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA505284B5A;
	Thu, 10 Apr 2025 12:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NdthYEZk"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475A42836A2;
	Thu, 10 Apr 2025 12:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744287682; cv=none; b=CsxvFoFghb72JkD/XUjhJrJespO9hrBmw0WwinVuFjXMFUc/FJjy7mxD1psYXDN3SjbK01nhlFhzq03M8ERFtYBhyTet5L5iT9mdy8kY8Bmv7RuFzz7cmbKEiJrJAKukDIXcpZCzDZGSeAJ8Gt/3GKfftr5rrhgK1/ipg7wE2es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744287682; c=relaxed/simple;
	bh=gLkvAYSQ7cecej2XzIZRywC0M1m7Zb0gAcMol3kJqPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r1Ig7ZRfhx+EmVuRr7pXRUv7cQYN7lupx7UHFs7iEqG59q+9DHh2sDK2DHOZsSFZrjD62d2WXRea0/bbrEWTieft+watpoGn223JLg5gWum5mOmOKzG1mCzfXHdP1XPF0swUi/QnYEkZq0UBrxgVrb1qdrn2ZEK3SVe1RLz+hJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NdthYEZk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3A99C4CEDD;
	Thu, 10 Apr 2025 12:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744287679;
	bh=gLkvAYSQ7cecej2XzIZRywC0M1m7Zb0gAcMol3kJqPE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NdthYEZkMWyrP+LKXotbmMlg4KTU8eyWDHhd1oEb9behJSKObXe83ucgu1ExwQv9R
	 ebVsxRZCGqoboeakzE1jLZ2zPMFAmBl5CsGt74Ff9tjjvLvdOnSK7PEXRNZf+mErjZ
	 gzQaDXlVPKowrNeO2FDq0yZwHWegxa5uZwqwz6nuqEiRyO/sBYDv8c4OGaL0t4VzmN
	 FdnO4MrA4pze0MwCSVtZMTPemW2kqjJm9FAenr0KgAEd0IzLM7rdzKxWLQtnYTCzMq
	 AfI85JjO6lvwj8tlL0BT5/MEt2lp17zxOl2rj/uGDRrdpkCF3uTvrVkjsGJ0V199dP
	 rteTIbizdMJzw==
Date: Thu, 10 Apr 2025 14:21:14 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Philipp Stanner <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/3] drm/nouveau: Prevent signaled fences in pending list
Message-ID: <Z_e3uihgYFvwmQ7C@pollux>
References: <20250410092418.135258-2-phasta@kernel.org>
 <20250410092418.135258-3-phasta@kernel.org>
 <d03c618e-aa4b-423b-9c50-143b8a197cac@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d03c618e-aa4b-423b-9c50-143b8a197cac@amd.com>

On Thu, Apr 10, 2025 at 02:13:34PM +0200, Christian König wrote:
> Am 10.04.25 um 11:24 schrieb Philipp Stanner:
> > Nouveau currently relies on the assumption that dma_fences will only
> > ever get signaled through nouveau_fence_signal(), which takes care of
> > removing a signaled fence from the list nouveau_fence_chan.pending.
> >
> > This self-imposed rule is violated in nouveau_fence_done(), where
> > dma_fence_is_signaled() (somewhat surprisingly, considering its name)
> > can signal the fence without removing it from the list. This enables
> > accesses to already signaled fences through the list, which is a bug.
> >
> > In particular, it can race with nouveau_fence_context_kill(), which
> > would then attempt to set an error code on an already signaled fence,
> > which is illegal.
> >
> > In nouveau_fence_done(), the call to nouveau_fence_update() already
> > ensures to signal all ready fences. Thus, the signaling potentially
> > performed by dma_fence_is_signaled() is actually not necessary.
> >
> > Replace the call to dma_fence_is_signaled() with
> > nouveau_fence_base_is_signaled().
> >
> > Cc: <stable@vger.kernel.org> # 4.10+, precise commit not to be determined
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > ---
> >  drivers/gpu/drm/nouveau/nouveau_fence.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
> > index 7cc84472cece..33535987d8ed 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> > @@ -274,7 +274,7 @@ nouveau_fence_done(struct nouveau_fence *fence)
> >  			nvif_event_block(&fctx->event);
> >  		spin_unlock_irqrestore(&fctx->lock, flags);
> >  	}
> > -	return dma_fence_is_signaled(&fence->base);
> > +	return test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->base.flags);
> 
> See the code above that:
> 
>         if (fence->base.ops == &nouveau_fence_ops_legacy ||
>             fence->base.ops == &nouveau_fence_ops_uevent) {

I think this check is a bit pointless given that fence is already a struct
nouveau_fence. :)

