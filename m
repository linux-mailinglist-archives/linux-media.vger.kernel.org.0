Return-Path: <linux-media+bounces-47838-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B0BC8FACE
	for <lists+linux-media@lfdr.de>; Thu, 27 Nov 2025 18:29:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 185DF4E8661
	for <lists+linux-media@lfdr.de>; Thu, 27 Nov 2025 17:28:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 335A12E62A8;
	Thu, 27 Nov 2025 17:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c0KfnE/y"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB422ECD1D;
	Thu, 27 Nov 2025 17:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764263971; cv=none; b=F8f3DtsGkYpRwZO/jGjNb33ORg8ARoW2AxlStofmqkEKZWN2iZ+mK2Py3T8cJYNfZfRGAdbdQnyaU6Pg5d1BLxZFzXKbfmUCjERdvaXgvZROYBb90Zp3CKQiCO335+mzAA30tGNUSke6AYiTMOw1YToCHJFTn5etIZ3vWXgZxd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764263971; c=relaxed/simple;
	bh=+8mv6i8YDqflMNXf6rSyL0ngsI4DSuUXQc+IAsMcIoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fd3Oxx/ktppvuYBnJlOshGrcf8Y4DBEIA3GTAkq01O1p3AmFHSHuxA0hNRVYlLdKK+jhxgqOnu3QWszcZILnMuZ6OflMhFxKdseQMrZFQznUB/ZnngbPem02vqpyXVDIYU2BAJIGRD4WN+ONSiI95+5qaBwtC3+0MIY10RaTRFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c0KfnE/y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECF0EC113D0;
	Thu, 27 Nov 2025 17:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764263970;
	bh=+8mv6i8YDqflMNXf6rSyL0ngsI4DSuUXQc+IAsMcIoc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c0KfnE/yW9mBtNrtCv44gXHVw6SA0/m6sGRU7msy3eAgPWadTZyvHIkYKGNDUnM7W
	 28ftgpbYM2BNqaIQH038Kl27gGXNVq7FV/E7oQRx3VLgZ6RFLtdff8s2iwtizMjgcg
	 xeQzJCXOCOTb0EatsXDdloTWKGrDRCysTipTKHEftdjOa1ssf4m16kgkv0UgbXYc+4
	 odbVSb8qMOxIkoimUTTcrsI13GEY0gYhIUAaRjZPomLyF0JlNFjl6w6aanfeYFQfA2
	 lkq/9R63TZDx3yK+SxPvcsaAr1pNoICpg/TmokPgvFqSNd8ZcRbmaDKmPvRKVOfZ9s
	 rAI1CjOpXsKAA==
Date: Thu, 27 Nov 2025 18:19:27 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: phasta@kernel.org
Cc: Matthew Brost <matthew.brost@intel.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan <gustavo@padovan.org>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Felix Kuehling <Felix.Kuehling@amd.com>, 
	Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>, 
	Matthew Auld <matthew.auld@intel.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Lucas De Marchi <lucas.demarchi@intel.com>, 
	Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 3/6] drm/gpu/xe: Ignore dma_fenc_signal() return code
Message-ID: <enlnwawk3qtcbgfm7dmuyefb4tx3hxsrmzozkabpeixxsi3y24@pukuuth2zlke>
References: <20251126131914.149445-2-phasta@kernel.org>
 <20251126131914.149445-5-phasta@kernel.org>
 <nrrk4kug6a42fztx7ryuz5bk6uy7roiszjhiivlvtrw3uvunps@wn44moyetzff>
 <aSeTsINKklqqJyIs@lstrano-desk.jf.intel.com>
 <q2kvwmnxomqlcx7zgvlvyhupduytfubcu5vghuf6ztrdaq55pb@gq4tg7qughun>
 <63274dd281ac94f2680a4aa91f541de82435fda5.camel@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <63274dd281ac94f2680a4aa91f541de82435fda5.camel@mailbox.org>

On Thu, Nov 27, 2025 at 02:51:39PM +0100, Philipp Stanner wrote:
> On Thu, 2025-11-27 at 14:37 +0100, Andi Shyti wrote:
> > On Wed, Nov 26, 2025 at 03:56:32PM -0800, Matthew Brost wrote:
> > > On Wed, Nov 26, 2025 at 11:56:57PM +0100, Andi Shyti wrote:
> > > > > @@ -85,7 +85,6 @@ void xe_hw_fence_irq_finish(struct xe_hw_fence_irq *irq)
> > > > > @@ -93,9 +92,9 @@ void xe_hw_fence_irq_finish(struct xe_hw_fence_irq *irq)
> > > > >  		spin_lock_irqsave(&irq->lock, flags);
> > > > >  		list_for_each_entry_safe(fence, next, &irq->pending, irq_link) {
> > > > >  			list_del_init(&fence->irq_link);
> > > > > -			err = dma_fence_signal_locked(&fence->dma);
> > > > 
> > > > why don't we do
> > > > 
> > > > XE_WARN_ON(dma_fence_signal_locked(..))
> 
> because it's impossible because the series is about removing the return
> codes from the dma_fence_signal_* functions.

oh yes, the last patch. Sorry, I went on reviewing and lost the
final target from sight.

> > > > 
> > > 
> > > IIRC the above statement can compile out. So the patch looks correct to me.
> > 
> > you have defined XE_WARN_ON as WARN_ON that should always
> > evaluate the content and, depending on the configuration, it
> > prints the logs or not.
> > 
> > What I don't like from this patch is that we end up checking
> > twice for the DMA_FENCE_FLAG_SIGNALED_BIT bit.
> 
> Depends on what you mean by "we". The Xe code checks it only once, with
> dma_fence_test_signaled_flag(). The dma_fence backend checks it yet
> again, as it always does, to avoid signaling a signaled fence.
> 
> That's not racy here, however, because the fence lock is already being
> held, as evidenced by the current usage of dma_fence_signal_locked().

I haven't said it's racy, I just didn't like that we are testing
for the DMA_FENCE_FLAG_SIGNALED_BIT twice. On the other hand,
with dma_fence_signal_locked() being void, I wouldn't know how to
do it better. So that I guess it's fine.

Andi

