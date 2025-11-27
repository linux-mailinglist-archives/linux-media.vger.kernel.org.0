Return-Path: <linux-media+bounces-47829-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 239D2C8E809
	for <lists+linux-media@lfdr.de>; Thu, 27 Nov 2025 14:37:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 712D73AB365
	for <lists+linux-media@lfdr.de>; Thu, 27 Nov 2025 13:37:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73DAF279DC8;
	Thu, 27 Nov 2025 13:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CeKkfLKK"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B5729A1;
	Thu, 27 Nov 2025 13:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764250642; cv=none; b=WsLTHnvvJP7qHueoGfmu17NHCluvOnzu5WUhdWdzTH1ZJ9xeG5ly7wQbmiX9CazXwXJ58jzzAy3oOyj+yGQ5hXIsYrgYPGofheL9fWEv+Yjqe/vuG1SNygXNdGVS1vlunm2667Mf5TUNV9XyOWAuZ9s8+pNrnntWFc5lcF8TngE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764250642; c=relaxed/simple;
	bh=I4PdYzRN+MTqsZDHBCDDkw07FlKUWJA4d9AsRMAWLio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t81Sm4FgNBb/0pH3ZcPTQeQrQunY/dW5AXhGComnYHnSoMTZhcoAaHubjfxBVKi8/zUGWSaJEwSXO7VSf+FZEWsGsU56/CvVjmZFZj7RhFXRkaVsv9zX3XhY4NQXq5+c/tbQFmC3NWyGsDTdHE1EP2Ig68O1BIeaBkc8hAI40UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CeKkfLKK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83865C4CEF8;
	Thu, 27 Nov 2025 13:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764250642;
	bh=I4PdYzRN+MTqsZDHBCDDkw07FlKUWJA4d9AsRMAWLio=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CeKkfLKKq6G2UJMAEwwq2lg7VIxz8nzuVel8G7pTAuyH6g3qCqjQ8JbVJCTgKB5Am
	 NCMVptKu378LkF7MM+L9dGF3qY6Pju+zikBlcD/BNdZgkdfPZcfhSndlNaMDRlZfcd
	 cIGOWkJaxaMGt6jRIXFnZd6JLo27vPLyU9BlbPlkZ/1fRNDi0nsotRreRw8EWTltxZ
	 WRA5KtbghLMHzz8Q81GXthn0Ikzfp+vFn20tyCC121ThWqzKt3GgD3JdXjuE4s3EAM
	 JkIKVKDFSw2nhbiITA524q66FbPbAuvlxU+b07DAfBkefVMCGnTnrhW26qvWO3Vhme
	 0YABbqiV2F/nA==
Date: Thu, 27 Nov 2025 14:37:17 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <phasta@kernel.org>, 
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
Message-ID: <q2kvwmnxomqlcx7zgvlvyhupduytfubcu5vghuf6ztrdaq55pb@gq4tg7qughun>
References: <20251126131914.149445-2-phasta@kernel.org>
 <20251126131914.149445-5-phasta@kernel.org>
 <nrrk4kug6a42fztx7ryuz5bk6uy7roiszjhiivlvtrw3uvunps@wn44moyetzff>
 <aSeTsINKklqqJyIs@lstrano-desk.jf.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSeTsINKklqqJyIs@lstrano-desk.jf.intel.com>

Hi Matt,

On Wed, Nov 26, 2025 at 03:56:32PM -0800, Matthew Brost wrote:
> On Wed, Nov 26, 2025 at 11:56:57PM +0100, Andi Shyti wrote:
> > > @@ -85,7 +85,6 @@ void xe_hw_fence_irq_finish(struct xe_hw_fence_irq *irq)
> > > @@ -93,9 +92,9 @@ void xe_hw_fence_irq_finish(struct xe_hw_fence_irq *irq)
> > >  		spin_lock_irqsave(&irq->lock, flags);
> > >  		list_for_each_entry_safe(fence, next, &irq->pending, irq_link) {
> > >  			list_del_init(&fence->irq_link);
> > > -			err = dma_fence_signal_locked(&fence->dma);
> > 
> > why don't we do
> > 
> > XE_WARN_ON(dma_fence_signal_locked(..))
> > 
> 
> IIRC the above statement can compile out. So the patch looks correct to me.

you have defined XE_WARN_ON as WARN_ON that should always
evaluate the content and, depending on the configuration, it
prints the logs or not.

What I don't like from this patch is that we end up checking
twice for the DMA_FENCE_FLAG_SIGNALED_BIT bit.

Thanks,
Andi

