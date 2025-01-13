Return-Path: <linux-media+bounces-24689-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 51688A0B466
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2025 11:20:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 279763A1DF8
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2025 10:20:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D3F921ADB9;
	Mon, 13 Jan 2025 10:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EjhOTYmm"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89AE187554;
	Mon, 13 Jan 2025 10:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736763621; cv=none; b=iBj+DUBw8gIAjw//fxCZCVA0GDAIRB6dz3cWjyqysFGSkTqyIXAw2wCdwoqNUmVF9Niz83dG9+8Z76sOwpbF4nhkSAw3jribF5PO5AO+SkcSIUVmIdXkdcGyWrgRU0xZYhsi2unObaehHnFj+sX6oDbLvA9DIDOXtI/nQgKpM5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736763621; c=relaxed/simple;
	bh=16oofN4qwhzS8LEeINjrgxH2C44aM93J8ktG1xFg7rA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pedXhoPVWveEsgAspvWbj09ZgB/w72HjPMVCZPAKeXq7QFSDJcB9hudGqVQwYufoHjNehEe0ZY34Lr4hMrfmzAp9aJZUbcnkePJxpZBxxyusESViGFDnOyhn2bdxSd80sSkjbF8QMDTqGPjA/TdIjV+NMr4TAL5sSfxL3vlGOg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EjhOTYmm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52BC9C4CED6;
	Mon, 13 Jan 2025 10:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736763621;
	bh=16oofN4qwhzS8LEeINjrgxH2C44aM93J8ktG1xFg7rA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EjhOTYmmAyPKO3heeoShuA3AMFeWLhQUGVciofToWvEHui+pjQ7m3I9clR35Xq9Gv
	 rnuV0FhvIwwudrw6LO+bq/HwScqvX6/tPh9aPSHZur5gzNVvbuK5uNmKhGNB3S9/VN
	 2MRu9XuePYtU/ZYUJ6imghbfvirJp5E+TK2PvasOS7oYkTTFdXj78bDzhdCCEIFPb/
	 u6UZCIhzAYPWgCu6pYzNVufXzdG8I8sS1sObrXOy5kim7nG0pD8z+RyePBmdRR0e2s
	 Qp4m67p74emtJ0kXqLYNXSSBXnUxy4xHqeJ8rF/xktcPTBGFbxbPUDD34xWgqyTAYb
	 ZM42jz0w4H0vA==
Date: Mon, 13 Jan 2025 11:20:15 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Philipp Stanner <phasta@kernel.org>
Cc: Luben Tuikov <ltuikov89@gmail.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Philipp Stanner <pstanner@redhat.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 2/3] drm/sched: Adjust outdated docu for run_job()
Message-ID: <Z4To3x2dCGEi6hJX@pollux>
References: <20250109133710.39404-2-phasta@kernel.org>
 <20250109133710.39404-5-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109133710.39404-5-phasta@kernel.org>

On Thu, Jan 09, 2025 at 02:37:11PM +0100, Philipp Stanner wrote:
> The documentation for drm_sched_backend_ops.run_job() mentions a certain
> function called drm_sched_job_recovery(). This function does not exist.
> What's actually meant is drm_sched_resubmit_jobs(), which is by now also
> deprecated.
> 
> Remove the mention of the deprecated function.
> 
> Discourage the behavior of drm_sched_backend_ops.run_job() being called
> multiple times for the same job.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
>  include/drm/gpu_scheduler.h | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index d5cd2a78f27c..c4e65f9f7f22 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -421,9 +421,12 @@ struct drm_sched_backend_ops {
>  
>  	/**
>  	 * @run_job: Called to execute the job once all of the dependencies
> -	 * have been resolved. This may be called multiple times, if
> -	 * timedout_job() has happened and drm_sched_job_recovery() decides to
> -	 * try it again.
> +	 * have been resolved.
> +	 *
> +	 * The deprecated drm_sched_resubmit_jobs() (called from
> +	 * drm_sched_backend_ops.timedout_job()) can invoke this again with the
> +	 * same parameters. Doing this is strongly discouraged because it

Maybe "invoke this again for the same job"?

> +	 * violates dma_fence rules.

Does it? AFAIU it puts certain expectations on the driver, before a driver can
call this function, which likely leads to the driver to violate dma_fence rules,
right?

Maybe we should also list the exact rules that are (likely to be) violated to
allow drivers to fix it at their end more easily.

>  	 *
>  	 * @sched_job: the job to run
>  	 *
> -- 
> 2.47.1
> 

