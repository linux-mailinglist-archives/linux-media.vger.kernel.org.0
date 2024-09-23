Return-Path: <linux-media+bounces-18459-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1067A97E7F8
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2024 10:56:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3EAE51C21397
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2024 08:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56388194158;
	Mon, 23 Sep 2024 08:56:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D111535B7;
	Mon, 23 Sep 2024 08:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727081770; cv=none; b=KxTUqoZlBNXRz1HrlAnMwi2A9iM7vp47VXOhKbVOHar06AsrEdrI+7itCA36xYf6Rjntd3HUNyqs4EK0sRhYQT4m/z5aU9AJ2WNny+6ugh0uJpVa0nmCgj+wp+CclVrEA4zKoZ+H+KuFhUGt7LRscZ8sodXBeTZDDtSYf4sp7Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727081770; c=relaxed/simple;
	bh=njYXQemaQx/tCPelqnjQtrqSYGu8itQVDVmbS2OFB7w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gkh79O+2/DedOqhNpI1X1K1m5pwwfxC2gghPKY0lvANH71SpuU59xMtFZ97vEiYU4n17bXaat3JuEJBDWnAiEACw5iD3zwRS/5DjNHcoQi1dd9IPvF/05CKhKHQm0ButcfaOjtK7ynqF7AVUWlkwZiVXZfvrlLVoMDVPuKxXBZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D680FEC;
	Mon, 23 Sep 2024 01:56:36 -0700 (PDT)
Received: from [10.57.79.18] (unknown [10.57.79.18])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7F5C63F64C;
	Mon, 23 Sep 2024 01:56:03 -0700 (PDT)
Message-ID: <0316b8a2-8199-41bb-ad0c-99404c896272@arm.com>
Date: Mon, 23 Sep 2024 09:56:00 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/5] drm/panthor: record current and maximum device
 clock frequencies
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20240920234436.207563-1-adrian.larumbe@collabora.com>
 <20240920234436.207563-3-adrian.larumbe@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20240920234436.207563-3-adrian.larumbe@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/09/2024 00:43, Adrián Larumbe wrote:
> In order to support UM in calculating rates of GPU utilisation, the current
> operating and maximum GPU clock frequencies must be recorded during device
> initialisation, and also during OPP state transitions.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>

I thought I gave my r-b on v6 and I can't actually see any change:

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_devfreq.c | 18 +++++++++++++++++-
>  drivers/gpu/drm/panthor/panthor_device.h  |  6 ++++++
>  2 files changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/panthor/panthor_devfreq.c
> index c6d3c327cc24..9d0f891b9b53 100644
> --- a/drivers/gpu/drm/panthor/panthor_devfreq.c
> +++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
> @@ -62,14 +62,20 @@ static void panthor_devfreq_update_utilization(struct panthor_devfreq *pdevfreq)
>  static int panthor_devfreq_target(struct device *dev, unsigned long *freq,
>  				  u32 flags)
>  {
> +	struct panthor_device *ptdev = dev_get_drvdata(dev);
>  	struct dev_pm_opp *opp;
> +	int err;
>  
>  	opp = devfreq_recommended_opp(dev, freq, flags);
>  	if (IS_ERR(opp))
>  		return PTR_ERR(opp);
>  	dev_pm_opp_put(opp);
>  
> -	return dev_pm_opp_set_rate(dev, *freq);
> +	err = dev_pm_opp_set_rate(dev, *freq);
> +	if (!err)
> +		ptdev->current_frequency = *freq;
> +
> +	return err;
>  }
>  
>  static void panthor_devfreq_reset(struct panthor_devfreq *pdevfreq)
> @@ -130,6 +136,7 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
>  	struct panthor_devfreq *pdevfreq;
>  	struct dev_pm_opp *opp;
>  	unsigned long cur_freq;
> +	unsigned long freq = ULONG_MAX;
>  	int ret;
>  
>  	pdevfreq = drmm_kzalloc(&ptdev->base, sizeof(*ptdev->devfreq), GFP_KERNEL);
> @@ -161,6 +168,7 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
>  		return PTR_ERR(opp);
>  
>  	panthor_devfreq_profile.initial_freq = cur_freq;
> +	ptdev->current_frequency = cur_freq;
>  
>  	/* Regulator coupling only takes care of synchronizing/balancing voltage
>  	 * updates, but the coupled regulator needs to be enabled manually.
> @@ -204,6 +212,14 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
>  
>  	dev_pm_opp_put(opp);
>  
> +	/* Find the fastest defined rate  */
> +	opp = dev_pm_opp_find_freq_floor(dev, &freq);
> +	if (IS_ERR(opp))
> +		return PTR_ERR(opp);
> +	ptdev->fast_rate = freq;
> +
> +	dev_pm_opp_put(opp);
> +
>  	/*
>  	 * Setup default thresholds for the simple_ondemand governor.
>  	 * The values are chosen based on experiments.
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> index a48e30d0af30..2109905813e8 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -184,6 +184,12 @@ struct panthor_device {
>  
>  	/** @profile_mask: User-set profiling flags for job accounting. */
>  	u32 profile_mask;
> +
> +	/** @current_frequency: Device clock frequency at present. Set by DVFS*/
> +	unsigned long current_frequency;
> +
> +	/** @fast_rate: Maximum device clock frequency. Set by DVFS */
> +	unsigned long fast_rate;
>  };
>  
>  /**


