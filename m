Return-Path: <linux-media+bounces-44920-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AEEBEA056
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 17:40:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C67EC35E4A6
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 15:40:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A51D436CDF2;
	Fri, 17 Oct 2025 15:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="glaN3tjI"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03463335079;
	Fri, 17 Oct 2025 15:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760715469; cv=none; b=IJbMOwEjWgV/zM0wz5Ew7u3RD/9eGisjWCFIVvT7H8/Gl/qsrJM0XKpywq/p5BXFJUiB4JRX4gH6zuiP0kaEqz6f8fwtvkfvmNsLud+g+fCfo5v0ev6qAh63LtIqHh0EmL00ZzZPJoJ7ijG03348eQjCmPltL+t0grmqOWVk5cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760715469; c=relaxed/simple;
	bh=fMtsEtk+yymjMrBDxyIo4cPm8zug+9QHbs06gVATPdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gKiD/tUm2YUbS67zf8Rn8fV0Xh8Vzm/UDwbwIf6aeJucFQH+jcWx1gflsM4jzAX14EyNl+YlcO4WXJsUQs5/uQ6FsU/ngceD08k4KfMIExa0hZz1iZBDrVHEHK+EgbKaufK4iIkLjWpSmJS8Mof4tHGBC15bH3Rme/0afmXKVRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=glaN3tjI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 517C7C4CEE7;
	Fri, 17 Oct 2025 15:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760715468;
	bh=fMtsEtk+yymjMrBDxyIo4cPm8zug+9QHbs06gVATPdw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=glaN3tjI9nSulUo1uDQTr6u/p7SSb0kvNXzx2Zp6DuspOMCnukW5J3S0lElQsi5ps
	 NU7SnkAchBwn0irmQoYZSIpWoSv+3TbtNt64vMYO481yMyvMPzcpQx5t3VMgHBTJen
	 yhmZRIYfVW59jRSrc/uakK1ie2xa6NeGwPCM2lcZV0luckrXKLeKBnLy5oZLoxMgeE
	 nE8tsoajMLfPXrjbX5CC85UtPw+EVov/SnbBeW9yDHk1AvKLpY1AgL8tuGWDaqTD7R
	 9dIbQtOT1pb+aP2DhguS+sCRD1Zm5OVChREj1YubPcGAhuLirGmqnHkQktgznRurqh
	 J3MzLTnTQS+bw==
Date: Fri, 17 Oct 2025 10:37:46 -0500
From: Rob Herring <robh@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Oded Gabbay <ogabbay@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Daniel Stone <daniel@fooishbar.org>, Frank Li <Frank.li@nxp.com>,
	Sui Jingfeng <sui.jingfeng@linux.dev>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v5 2/2] accel: Add Arm Ethos-U NPU driver
Message-ID: <20251017153746.GA1579747-robh@kernel.org>
References: <20251016-ethos-v5-0-ba0aece0a006@kernel.org>
 <20251016-ethos-v5-2-ba0aece0a006@kernel.org>
 <aPHhXl6qdU1mMCNt@lstrano-desk.jf.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aPHhXl6qdU1mMCNt@lstrano-desk.jf.intel.com>

On Thu, Oct 16, 2025 at 11:25:34PM -0700, Matthew Brost wrote:
> On Thu, Oct 16, 2025 at 04:06:05PM -0500, Rob Herring (Arm) wrote:
> > Add a driver for Arm Ethos-U65/U85 NPUs. The Ethos-U NPU has a
> > relatively simple interface with single command stream to describe
> > buffers, operation settings, and network operations. It supports up to 8
> > memory regions (though no h/w bounds on a region). The Ethos NPUs
> > are designed to use an SRAM for scratch memory. Region 2 is reserved
> > for SRAM (like the downstream driver stack and compiler). Userspace
> > doesn't need access to the SRAM.

Thanks for the review.

[...]

> > +static struct dma_fence *ethosu_job_run(struct drm_sched_job *sched_job)
> > +{
> > +	struct ethosu_job *job = to_ethosu_job(sched_job);
> > +	struct ethosu_device *dev = job->dev;
> > +	struct dma_fence *fence = NULL;
> > +	int ret;
> > +
> > +	if (unlikely(job->base.s_fence->finished.error))
> > +		return NULL;
> > +
> > +	fence = ethosu_fence_create(dev);
> 
> Another reclaim issue: ethosu_fence_create allocates memory using
> GFP_KERNEL. Since we're already in the DMA fence signaling path
> (reclaim), this can lead to a deadlock.
> 
> Without too much thought, you likely want to move this allocation to
> ethosu_job_do_push, but before taking dev->sched_lock or calling
> drm_sched_job_arm.
> 
> We really should fix the DRM scheduler work queue to be tainted with
> reclaim. If I recall correctly, we'd need to update the work queue
> layer. Let me look into that—I've seen this type of bug several times,
> and lockdep should be able to catch it.

Likely the rocket driver suffers from the same issues...

> 
> > +	if (IS_ERR(fence))
> > +		return fence;
> > +
> > +	if (job->done_fence)
> > +		dma_fence_put(job->done_fence);
> > +	job->done_fence = dma_fence_get(fence);
> > +
> > +	ret = pm_runtime_get_sync(dev->base.dev);
> 
> I haven't looked at your PM design, but this generally looks quite
> dangerous with respect to reclaim. For example, if your PM resume paths
> allocate memory or take locks that allocate memory underneath, you're
> likely to run into issues.
> 
> A better approach would be to attach a PM reference to your job upon
> creation and release it upon job destruction. That would be safer and
> save you headaches in the long run.

Our PM is nothing more than clock enable/disable and register init. 

If the runtime PM API doesn't work and needs special driver wrappers, 
then I'm inclined to just not use it and manage clocks directly (as 
that's all it is doing).

> 
> This is what we do in Xe [1] [2].
> 
> Also, in general, this driver has been reviewed (RB’d), but it's not
> great that I spotted numerous issues within just five minutes. I suggest
> taking a step back and thoroughly evaluating everything this driver is
> doing.

Well, if it is hard to get simple drivers right, then it's a problem 
with the subsystem APIs IMO.

Rob

