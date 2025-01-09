Return-Path: <linux-media+bounces-24530-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2028FA07808
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 14:46:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7ABBB16968C
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 13:45:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC294218E85;
	Thu,  9 Jan 2025 13:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="OmKgHtVJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D14217729
	for <linux-media@vger.kernel.org>; Thu,  9 Jan 2025 13:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736430282; cv=none; b=FseChcbJqHAiaPGqPy9tGGHI3xuuDKijNWEW5QrPkqw4/w8MtA20peJ9HMNOfuRAm4S5GMQgZHhPKmIlaKZeVpvy5x0sd4c++WalAIKq81hEELkJmpp6JQmj5jvQC6PmV/fOoNC6b2xfUdA6hQ4kEdVmT5Oy8FpKdDsK3UeYztQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736430282; c=relaxed/simple;
	bh=lIwfF9h2bSPBYyanzgrYEGXhomOjymzmvS9gUNC7blg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fva1Q7FKQhHy/PYW6V3OLV7c4MwsjMGPvTWbY0jIWzw8oZcMbjr0j1saUiVb7Ckx6Wqu7+lsNQltTo0R5WlmJV02ZqUdjrXxlQ5Ls7GC3bLR1xhSCwVSTQrSYO0nP8JcB/J4xIPb2gu2rqqyzYP60PFJp+bzqJcwKZOO4bvqW2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net; spf=none smtp.mailfrom=ursulin.net; dkim=pass (2048-bit key) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b=OmKgHtVJ; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ursulin.net
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-385ef8b64b3so859400f8f.0
        for <linux-media@vger.kernel.org>; Thu, 09 Jan 2025 05:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1736430277; x=1737035077; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ypYU+D7GLRSD5sI3qSNi4VvY56rGppry2QtFbqjX3IY=;
        b=OmKgHtVJwAIADjL1iZ32wdK1a4D08kPKxsdLeNNzNLHQqT2HHqWJ4SNRzoiJQAh1KC
         SiMg0Q7ELFkVfowwSv2+qVHe472os+5cB/4mvBfnWGd/SUMM2xeLk4HBCG0xaxkoXbdy
         V+5Z3cH+9Z7332M1lZypV8oy/7egCFpQXsfTXC6ZF+FFaeHTiw7c1WLD1IrgeU3sxs1S
         u7G1Z95LSSLAl/gBs4ICcGN2jG99iCy4tWoJZArmgQHS6qUw7G3AXQ9h1ZvXlIhLtz/w
         3NMcstEK7ex8aT7gv9uR26MvBpqYw3xUk9USTKkPn1mGNwBw6Uxi2J8jLbsnTI+a/gY/
         OwzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736430277; x=1737035077;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ypYU+D7GLRSD5sI3qSNi4VvY56rGppry2QtFbqjX3IY=;
        b=g2hec5nCoSahKrLthz4UZJTLhf+ydFG+3DaJ/lgQr+Ntrax7L/5d9UkWFW4Ab6H/lm
         xnuzpwgKxzLzfjG76rAeobIAMU/kqDidYCS09Ghs8NWpE8FCtPLuIZuCHsmlvx1r3SKy
         iwU/sEI10YZd06wmg+SFC2osSqpFTz5vozNdw8OaxZX5P46V4PGG1vsXSVz61Dj2ucdy
         kOxWwRGHvN+yha00W8LNiSFbnYx7NK4ttcQEBey4sVPbpdipr/Kt0B0A8k3TFV4e4oz3
         B9f7YZqvQBPaHMHhzwrNGWGp3nV9QPphHTWUIOres3Nqc8WhQBjQIibYu3bHMuVycPiR
         hvTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSocgr+gaw8ebpVJX6p5zEkoN9vOl6ZhLsj/ym/nlJsPZjVi85mTv6FSwF24hEWz/LlKolT3ZQRxq3eA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyV2FdGZzcyds0I+Cf1k7sUFqfBKsTo7FafCye86sfZnVpQyqBP
	52E7d/Y9o+autv6WlHLWMW5tlxtmw4+Tw4Ynp1LqmoGpleKBNHF8QOXYbEgEoes=
X-Gm-Gg: ASbGncuQN7zwVSLxan0J2T/cnbDRjQqHdkBGHI68njPweVUCKb43tz5zupWmjsc09Ml
	5alaE4eNhUaU/lMqXalVmWo8Vdk5roR81+l7Gq4RCiTVEaWp5iPG1Zy36ue1EcVp2c4DzZyUhPX
	lb7dD5/mDCevDgGefZQSojtEQ2CLDaRy3S0VUNxlUFHZnszeWK/QdYA+xzXKoeNnSguxq/k84mr
	HwH1vf2n55N0EE8lFbYMiWXlhoCzZwjgotokTOTFBoAm+F/nuTW2m5b/XEQFq7t3BNPZAF4
X-Google-Smtp-Source: AGHT+IHYbRf/Xl1/HTWTTR0PbnhOKbUOwUNQEA9pSDIcGL1byIReR1tFyEabtoI22iqUyeZZOPtzbA==
X-Received: by 2002:a5d:6da6:0:b0:385:f527:be6d with SMTP id ffacd0b85a97d-38a8730fabamr5715141f8f.36.1736430277448;
        Thu, 09 Jan 2025 05:44:37 -0800 (PST)
Received: from [192.168.0.101] ([90.241.98.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38325esm1865623f8f.27.2025.01.09.05.44.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 05:44:37 -0800 (PST)
Message-ID: <036bda23-a6a0-46f6-844a-567805cd0f7e@ursulin.net>
Date: Thu, 9 Jan 2025 13:44:36 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/sched: Document run_job() refcount hazard
To: Philipp Stanner <phasta@kernel.org>, Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Philipp Stanner <pstanner@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20250109133710.39404-2-phasta@kernel.org>
 <20250109133710.39404-4-phasta@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20250109133710.39404-4-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 09/01/2025 13:37, Philipp Stanner wrote:
> From: Philipp Stanner <pstanner@redhat.com>
> 
> drm_sched_backend_ops.run_job() returns a dma_fence for the scheduler.
> That fence is signalled by the driver once the hardware completed the
> associated job. The scheduler does not increment the reference count on
> that fence, but implicitly expects to inherit this fence from run_job().
> 
> This is relatively subtle and prone to misunderstandings.
> 
> This implies that, to keep a reference for itself, a driver needs to
> call dma_fence_get() in addition to dma_fence_init() in that callback.
> 
> It's further complicated by the fact that the scheduler even decrements
> the refcount in drm_sched_run_job_work() since it created a new
> reference in drm_sched_fence_scheduled(). It does, however, still use
> its pointer to the fence after calling dma_fence_put() - which is safe
> because of the aforementioned new reference, but actually still violates
> the refcounting rules.
> 
> Improve the explanatory comment for that decrement.
> 
> Move the call to dma_fence_put() to the position behind the last usage
> of the fence.
> 
> Document the necessity to increment the reference count in
> drm_sched_backend_ops.run_job().
> 
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 10 +++++++---
>   include/drm/gpu_scheduler.h            | 19 +++++++++++++++----
>   2 files changed, 22 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 57da84908752..5f46c01eb01e 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1218,15 +1218,19 @@ static void drm_sched_run_job_work(struct work_struct *w)
>   	drm_sched_fence_scheduled(s_fence, fence);
>   
>   	if (!IS_ERR_OR_NULL(fence)) {
> -		/* Drop for original kref_init of the fence */
> -		dma_fence_put(fence);
> -
>   		r = dma_fence_add_callback(fence, &sched_job->cb,
>   					   drm_sched_job_done_cb);
>   		if (r == -ENOENT)
>   			drm_sched_job_done(sched_job, fence->error);
>   		else if (r)
>   			DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n", r);
> +
> +		/*
> +		 * s_fence took a new reference to fence in the call to
> +		 * drm_sched_fence_scheduled() above. The reference passed by
> +		 * run_job() above is now not needed any longer. Drop it.
> +		 */
> +		dma_fence_put(fence);
>   	} else {
>   		drm_sched_job_done(sched_job, IS_ERR(fence) ?
>   				   PTR_ERR(fence) : 0);
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 95e17504e46a..d5cd2a78f27c 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -420,10 +420,21 @@ struct drm_sched_backend_ops {
>   					 struct drm_sched_entity *s_entity);
>   
>   	/**
> -         * @run_job: Called to execute the job once all of the dependencies
> -         * have been resolved.  This may be called multiple times, if
> -	 * timedout_job() has happened and drm_sched_job_recovery()
> -	 * decides to try it again.
> +	 * @run_job: Called to execute the job once all of the dependencies
> +	 * have been resolved. This may be called multiple times, if
> +	 * timedout_job() has happened and drm_sched_job_recovery() decides to
> +	 * try it again.
> +	 *
> +	 * @sched_job: the job to run
> +	 *
> +	 * Returns: dma_fence the driver must signal once the hardware has
> +	 *	completed the job ("hardware fence").
> +	 *
> +	 * Note that the scheduler expects to 'inherit' its own reference to
> +	 * this fence from the callback. It does not invoke an extra
> +	 * dma_fence_get() on it. Consequently, this callback must take a
> +	 * reference for the scheduler, and additional ones for the driver's
> +	 * respective needs.

Another thing which would be really good to document here is what other 
things run_job can return apart from the fence.

For instance amdgpu can return an ERR_PTR but I haven't looked into 
other drivers.

Regards,

Tvrtko

>   	 */
>   	struct dma_fence *(*run_job)(struct drm_sched_job *sched_job);
>   

