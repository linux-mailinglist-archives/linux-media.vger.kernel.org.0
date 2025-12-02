Return-Path: <linux-media+bounces-48098-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C74CC9CF45
	for <lists+linux-media@lfdr.de>; Tue, 02 Dec 2025 21:48:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9E6B0349F01
	for <lists+linux-media@lfdr.de>; Tue,  2 Dec 2025 20:48:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11D032F744F;
	Tue,  2 Dec 2025 20:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GhFzY/01"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6831B2F690D;
	Tue,  2 Dec 2025 20:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764708464; cv=none; b=uBmvfkDouEC4Zv7VFILaP3T84S50fDzVrzgtVvGzE2TJp4DqrODHgQx0wEXY3g9YsEOO6mt89ST1YlM5VmM+K3ax8SgoiL1kFrLngyQOTCP0P0fptPq4eJeO8TUN4GKnfxuRfzzayOeFSZ8Q9ptbxtYokwQDuQVeN4J00fvgsr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764708464; c=relaxed/simple;
	bh=l/Jj51vowNeSgGS/dVU8jWz01C1souuTfKbOaYrX4Zw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kDXyIYMVz6cVdBz23jchnqSBl1W/10cf8eNu/tQc0PWQhuEPeU0NfwJlbn7dcZzDGvpO437y56FPsczWBh/+QHbZCn+/3cotSb8W7JpQm/JOwJjBWMveRSGRqBeMyTzs14lr3IfktWjgIRInADLXJnhMm3djNF9/Sm4wj3Upygw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GhFzY/01; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ED27C4CEF1;
	Tue,  2 Dec 2025 20:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764708464;
	bh=l/Jj51vowNeSgGS/dVU8jWz01C1souuTfKbOaYrX4Zw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GhFzY/01zRShkLRPXj7D07dHNmqvz7x/CthRRa9Game+42RtJbNA84bYbyacAAj2H
	 hgZNPVj95sBKnLrN4fQe8t0L+8KUbTeZ6aTHaMmtXFOj0n7u51Rz6oN0OVu31qYUZn
	 sfSfUBmiNgQtIq5dkFrpRA9sAhpZXWHW07aPRNIzwxW2WUgIZTpgxO4qHgAmDZjpT2
	 DRGZK7OMMhXXkbONvZPpULEbovh27zcJoXZRaOz7Zi8xcsO/W+9bXruKY3+28dZSvj
	 nFD4qn7aFlmdSzkTIYi4UN4Hj4+i3hKPpfM0o/+ZAhUZaWJEuZ/NLpjFBvAhfryYoo
	 myO1V0GpMrMKg==
Date: Tue, 2 Dec 2025 21:47:39 +0100
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
	linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v2 4/8] drm/xe: Use dma_fence_check_and_signal_locked()
Message-ID: <fdb7dhdrquapw4cb7oa23rpzl6dkzbnotc3otxntruf3a5hvca@szamkxwcjvfc>
References: <20251201105011.19386-2-phasta@kernel.org>
 <20251201105011.19386-6-phasta@kernel.org>
 <aS3uycB40j2CptOf@lstrano-desk.jf.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aS3uycB40j2CptOf@lstrano-desk.jf.intel.com>

Hi Matt,

> > @@ -93,9 +92,8 @@ void xe_hw_fence_irq_finish(struct xe_hw_fence_irq *irq)
> >  		spin_lock_irqsave(&irq->lock, flags);
> >  		list_for_each_entry_safe(fence, next, &irq->pending, irq_link) {
> >  			list_del_init(&fence->irq_link);
> > -			err = dma_fence_signal_locked(&fence->dma);
> > +			XE_WARN_ON(dma_fence_check_and_signal_locked(&fence->dma));
> 
> I think XE_WARN_ON can compile out in certain builds. Best to leave warn on logic as is.

I don't think XE_WARN_ON compiles out. It should always evaluate
the content, then, depending on the build, it prints debug logs.

Andi

