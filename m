Return-Path: <linux-media+bounces-50723-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF3BD20F84
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 20:06:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3CC4D302F2E4
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 19:06:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E75B333BBB5;
	Wed, 14 Jan 2026 19:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="TrjKq+vQ"
X-Original-To: linux-media@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87193033ED;
	Wed, 14 Jan 2026 19:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768417601; cv=none; b=VxeN2GKUkMbSfoTIAHWbPs1CXIB6uwaZQdZAvxFVVJzTq8YsZ+zVfrfp54sE7Y3ISQ5FET7nZTaNir2BZxj+3WtDdnXe6pD8Js9pchcmL119s27oc/o4i0oRV10GtHpDf4VsuWpwN+cKpRMARd4UanTXguXmRuiUGMPtIEBQ5HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768417601; c=relaxed/simple;
	bh=BjbEvGKrM6/uTuvoCN82lSElypxjb3gXUCDtFhg8NqI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FGIv1cNp9snAL+rYCmzGR7f8ZHNbvItbjzhixvfHkq9FMaYKHlZuXw9PvRqriA/qsKEJrrzQjWltIlxgxS81uokci1L3IBzNdBgyQh+U/gEP8FKcGZQ78fPsOHcJaHgPDdc+Ija2IhP2taqeoolN/Zf5QTKoGiq9PMZ4bUgE4m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=TrjKq+vQ; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=MqYY9HoGox5VJhwTh0fKFFPWA1fKcL3f/K/VaXSx/pQ=; b=TrjKq+vQePymuAoxR+5z1RQxz6
	CLbbYgQCRyLwYwFhevpQgzdNUiSSmd2pWZTEav9dqY+vchO0hlVsJmIlU67i3o2S5055FUZkodK3z
	5KQfjqRoWWd6jIxr7+wyclxu/3HL+K2s5S2PNDMKzeuwh55Gi/4hv1t9U4EQQgpE8G865ra4Uqdbe
	TUMSZlgL4G/5Sk7wJLTQR7v02zb32YQcY1ri6RcKmgnWzfWtbs82DzxbmigDAOmxdnKAb1WzuSRqK
	EnBALR97rIR0sHT6uFrMor4EQ67y/KuyqV6tSeZg5ZjUx9orExAWeTnT9NYg6KqUgF/oCZYZKFQnM
	hYqZgedA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg6CS-0000000AQO2-1ik6;
	Wed, 14 Jan 2026 19:06:36 +0000
Message-ID: <6ec2b90e-c6e9-444d-926a-68d19f42acba@infradead.org>
Date: Wed, 14 Jan 2026 11:06:34 -0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] accel/thames: Add IOCTL for job submission
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Nishanth Menon <nm@ti.com>,
 "Andrew F. Davis" <afd@ti.com>, Randolph Sapp <rs@ti.com>,
 Jonathan Humphreys <j-humphreys@ti.com>, Andrei Aldea <a-aldea@ti.com>,
 Chirag Shilwant <c-shilwant@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Robert Nelson <robertcnelson@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20260114-thames-v2-0-e94a6636e050@tomeuvizoso.net>
 <20260114-thames-v2-4-e94a6636e050@tomeuvizoso.net>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260114-thames-v2-4-e94a6636e050@tomeuvizoso.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/14/26 12:46 AM, Tomeu Vizoso wrote:
> Using the DRM GPU scheduler infrastructure, with a scheduler for each
> core.
> 
> Contexts are created in all cores, and buffers mapped to all of them as
> well, so all cores are ready to execute any job.
> 
> The job submission code was initially based on Panfrost.
> 
> v2:
> - Add thames_accel.h UAPI header (Robert Nelson).
> 
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> ---
>  drivers/accel/thames/Makefile       |   1 +
>  drivers/accel/thames/thames_core.c  |   6 +
>  drivers/accel/thames/thames_drv.c   |  19 ++
>  drivers/accel/thames/thames_job.c   | 463 ++++++++++++++++++++++++++++++++++++
>  drivers/accel/thames/thames_job.h   |  51 ++++
>  drivers/accel/thames/thames_rpmsg.c |  52 ++++
>  include/uapi/drm/thames_accel.h     |  54 +++++
>  7 files changed, 646 insertions(+)
> 


> diff --git a/include/uapi/drm/thames_accel.h b/include/uapi/drm/thames_accel.h
> index 0a5a5e5f6637ab474e9effbb6db29c1dd95e56b5..5b35e50826ed95bfcc3709bef33416d2b6d11c70 100644
> --- a/include/uapi/drm/thames_accel.h
> +++ b/include/uapi/drm/thames_accel.h

> @@ -75,6 +78,55 @@ struct drm_thames_bo_mmap_offset {
>  	__u64 offset;
>  };
>  
> +/**
> + * struct drm_thames_job - A job to be run on the NPU
> + *
> + * The kernel will schedule the execution of this job taking into account its
> + * dependencies with other jobs. All tasks in the same job will be executed
> + * sequentially on the same core, to benefit from memory residency in SRAM.
> + */

Please make these comments full-fledged kernel-doc comments.
E.g.:

> +struct drm_thames_job {
> +	/** Input: BO handle for kernel. */

	/** @kernel: input: BO handle for kernel. */

> +	__u32 kernel;
> +
> +	/** Input: Size in bytes of the compiled kernel. */
> +	__u32 kernel_size;
> +
> +	/** Input: BO handle for params BO. */
> +	__u32 params;
> +
> +	/** Input: Size in bytes of the params BO. */
> +	__u32 params_size;
> +
> +	/** Input: Pointer to a u32 array of the BOs that are read by the job. */
> +	__u64 in_bo_handles;
> +
> +	/** Input: Pointer to a u32 array of the BOs that are written to by the job. */
> +	__u64 out_bo_handles;
> +
> +	/** Input: Number of input BO handles passed in (size is that times 4). */
> +	__u32 in_bo_handle_count;
> +
> +	/** Input: Number of output BO handles passed in (size is that times 4). */
> +	__u32 out_bo_handle_count;
> +};
> +
> +/**
> + * struct drm_thames_submit - ioctl argument for submitting commands to the NPU.
> + *
> + * The kernel will schedule the execution of these jobs in dependency order.
> + */

Same here.

> +struct drm_thames_submit {
> +	/** Input: Pointer to an array of struct drm_thames_job. */
> +	__u64 jobs;
> +
> +	/** Input: Number of jobs passed in. */
> +	__u32 job_count;
> +
> +	/** Reserved, must be zero. */
> +	__u32 pad;
> +};
> +


-- 
~Randy


