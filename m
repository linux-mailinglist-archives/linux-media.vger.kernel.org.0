Return-Path: <linux-media+bounces-23883-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A9F9F92F9
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 14:18:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D11D1882758
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 13:18:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD2EE2156E0;
	Fri, 20 Dec 2024 13:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QZHwdAFA"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128801A8405;
	Fri, 20 Dec 2024 13:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734700709; cv=none; b=obPQVqBOvN0imnG8E3Dp0O9vS42zNq/9l3Cp42Zx98P3tbvURutoJZvLkr4WWVtshp3gQVeWh5jxP00PSArySTfvEDF1eRRcZPlimVPOcSS3l8EznXAq3/rRV841lhYhvgEZSWHaC/lc880Z3rIcpHhCkBvBcxCypfFIgRi0nO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734700709; c=relaxed/simple;
	bh=lJYxREEplA7hMrw7hlbqIoxsY2oAvj3/FsClJRaiW1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FbKdsK4Qu9+bUk608eN3f2MCXSvg8lo6K1ge+Ak5NesHUTDxOzJNQLRKXkMcHq3/LB02UfQ2Q7v7MuWoBVpv0yxvEzOvPDEdrpITOO7ZfPotrLwp4bIj5w2BkmfeYjpGqeX/zihY8oxqin0Jyfr/m3gLLNcjxXK2+Ik78qyBiZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QZHwdAFA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17982C4CECD;
	Fri, 20 Dec 2024 13:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734700706;
	bh=lJYxREEplA7hMrw7hlbqIoxsY2oAvj3/FsClJRaiW1Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QZHwdAFABn6Bf5wplvexw48kKzjX7VT/s8VBEJv6exj79gwKvLWID4WKiPYevMWKG
	 /oPc7Cig9XvgWaJkwmicammdH/dqo7szcp+jOypNk78O3p9DotFG0uypxE/Jjzoojt
	 MQQ29enyauowu9R0Gosq5OJLjAZ1n0aZSCDtJEowm7L/1+GgNyfarjwsPNOLLf8mqZ
	 tbPV7ziDdubzLjTlGNgFcACQ9u+V3vnifeP7uG2jOOxSDWEGhSZ6PCfnDFU5/3rRBm
	 knSRnxNlhQxdr9YVOGwmdpIjxRg9gGjiUI0Tx4aOtZ6BmDPpGbWnLfR8vixyv9V5aI
	 JfL59O8qSgocA==
Date: Fri, 20 Dec 2024 14:18:20 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Philipp Stanner <phasta@kernel.org>, Luben Tuikov <ltuikov89@gmail.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Philipp Stanner <pstanner@redhat.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Subject: Re: [PATCH] drm/sched: Document run_job() refcount hazard
Message-ID: <Z2VunIJ4ltfW_xqD@pollux>
References: <20241220124515.93169-2-phasta@kernel.org>
 <5c4c610e-26ec-447c-b4db-ad38e994720b@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5c4c610e-26ec-447c-b4db-ad38e994720b@amd.com>

On Fri, Dec 20, 2024 at 01:53:34PM +0100, Christian König wrote:
> Am 20.12.24 um 13:45 schrieb Philipp Stanner:
> > From: Philipp Stanner <pstanner@redhat.com>
> > 
> > drm_sched_backend_ops.run_job() returns a dma_fence for the scheduler.
> > That fence is signalled by the driver once the hardware completed the
> > associated job. The scheduler does not increment the reference count on
> > that fence, but implicitly expects to inherit this fence from run_job().
> > 
> > This is relatively subtle and prone to misunderstandings.
> > 
> > This implies that, to keep a reference for itself, a driver needs to
> > call dma_fence_get() in addition to dma_fence_init() in that callback.
> > 
> > It's further complicated by the fact that the scheduler even decrements
> > the refcount in drm_sched_run_job_work() since it created a new
> > reference in drm_sched_fence_scheduled(). It does, however, still use
> > its pointer to the fence after calling dma_fence_put() - which is safe
> > because of the aforementioned new reference, but actually still violates
> > the refcounting rules.
> > 
> > Improve the explanatory comment for that decrement.
> > 
> > Move the call to dma_fence_put() to the position behind the last usage
> > of the fence.
> > 
> > Document the necessity to increment the reference count in
> > drm_sched_backend_ops.run_job().
> > 
> > Cc: Christian König <christian.koenig@amd.com>
> > Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> > Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> > Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> > ---
> >   drivers/gpu/drm/scheduler/sched_main.c | 10 +++++++---
> >   include/drm/gpu_scheduler.h            | 20 ++++++++++++++++----
> >   2 files changed, 23 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > index 7ce25281c74c..d6f8df39d848 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > +	 *
> > +	 * @sched_job: the job to run
> > +	 *
> > +	 * Returns: dma_fence the driver must signal once the hardware has
> > +	 *	completed the job ("hardware fence").
> > +	 *
> > +	 * Note that the scheduler expects to 'inherit' its own reference to
> > +	 * this fence from the callback. It does not invoke an extra
> > +	 * dma_fence_get() on it. Consequently, this callback must return a
> > +	 * fence whose refcount is at least 2: One for the scheduler's
> > +	 * reference returned here, another one for the reference kept by the
> > +	 * driver.
> 
> Well the driver actually doesn't need any extra reference. The scheduler
> just needs to guarantee that this reference isn't dropped before it is
> signaled.

I think he means the reference the driver's fence context has to have in order
to signal that thing eventually.

> 
> Regards,
> Christian.
> 
> >   	 */
> >   	struct dma_fence *(*run_job)(struct drm_sched_job *sched_job);
> 

