Return-Path: <linux-media+bounces-48710-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C318BCB8EA7
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 14:46:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 16C3A3063387
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 13:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09FAE25F78F;
	Fri, 12 Dec 2025 13:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I9x3Z2U9"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E911EB19B;
	Fri, 12 Dec 2025 13:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765547177; cv=none; b=ur0QwTB/JTDNr0uDjTYGK6DnfzqB60OIzUhGF3RBr+NRYy4SrEhKgcoxdwWGEkPwxeuvf+gqevFQXfAFof0qzug8p6YSUzrO3q5DAXt5ZU7Qghxsag1GwhKRQRtaYw4HxUR45Y7+p6VoTQIiK/Vf8Me3lfeX50aA6+c75gNYM6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765547177; c=relaxed/simple;
	bh=5AjYJ+usLGldY0sqsj+QPEYvL8hFOcyY02OqJHrK/XQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W5OU3D+WVK9/bLw7W7xk1Ya59CGNzivjQKDL3X+YeIOst4d2/xjj1zQNY0vnh64uI8r/PjGt1GzCbNUEUekzvmfCtF5QdPyQosy4Zx3VSqqExdMv8e2+4NdtZoE7+HXF3fDEEidGNxZGmWYkJBbh+QjTLEXXWv9LI1YE2NnWXq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I9x3Z2U9; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765547176; x=1797083176;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=5AjYJ+usLGldY0sqsj+QPEYvL8hFOcyY02OqJHrK/XQ=;
  b=I9x3Z2U9zEC8b60hgJ8A5mXBoLi7A2r/ssGYhs8mgddBLGjfUSoVe7v2
   GKCtoPQWjobG+Ii6SRafNg3Q/rm0VbYXTrLYnOtGACXrVedV2ij4MZKp3
   G8YhO6wlAcxUyOi41p85MGgakzNirjN+C/dGqU//AROuWEWp8UnL4ozi2
   LB/+/jwUM1BQomhlQH10zUcrRh+0oLtABKHHg9t7jD/RK0UBycEukNJ1n
   doIVYvDj7Bud6IlzFi+VMvHevRyRl/hZRW7O8Qiqhgsh8yLpn8oKtgq9x
   xP+fjauQ2OSuLRWhR26JuSVgCdrtPm2XYFp8DULIcOttJTvYeYt4p602/
   A==;
X-CSE-ConnectionGUID: GVsTSBy5SN2/8N6EXT4FPA==
X-CSE-MsgGUID: aZkNmdlXRWyWg7YwnCOeFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67425410"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="67425410"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 05:46:16 -0800
X-CSE-ConnectionGUID: jf15fWK2RxefXMkCuR2kYw==
X-CSE-MsgGUID: SqFyhRDCQTuLY/wGZ1dcpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="228148011"
Received: from mfalkows-mobl.ger.corp.intel.com (HELO [10.246.17.246]) ([10.246.17.246])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 05:46:12 -0800
Message-ID: <d1f1bba5-3961-4420-8e99-8948089f374a@linux.intel.com>
Date: Fri, 12 Dec 2025 14:44:41 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm: Fix object leak in DRM_IOCTL_GEM_CHANGE_HANDLE
To: Karol Wachowski <karol.wachowski@linux.intel.com>, David.Francis@amd.com,
 christian.koenig@amd.com
Cc: felix.kuehling@amd.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 sumit.semwal@linaro.org, andrzej.kacprowski@linux.intel.com,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, stable@vger.kernel.org
References: <20251212134133.475218-1-karol.wachowski@linux.intel.com>
Content-Language: en-US
From: "Falkowski, Maciej" <maciej.falkowski@linux.intel.com>
In-Reply-To: <20251212134133.475218-1-karol.wachowski@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/12/2025 2:41 PM, Karol Wachowski wrote:

> Add missing drm_gem_object_put() call when drm_gem_object_lookup()
> successfully returns an object. This fixes a GEM object reference
> leak that can prevent driver modules from unloading when using
> prime buffers.
>
> Fixes: 53096728b891 ("drm: Add DRM prime interface to reassign GEM handle")
> Cc: <stable@vger.kernel.org> # v6.18+
> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
> ---
> Changes between v3 and v2:
>   - correctly add CC: tag this time
>
> Changes between v1 and v2:
>   - move setting ret value under if branch as suggested in review
>   - add Cc: stable 6.18+
> ---
>   drivers/gpu/drm/drm_gem.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index ca1956608261..bcc08a6aebf8 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -1010,8 +1010,10 @@ int drm_gem_change_handle_ioctl(struct drm_device *dev, void *data,
>   	if (!obj)
>   		return -ENOENT;
>   
> -	if (args->handle == args->new_handle)
> -		return 0;
> +	if (args->handle == args->new_handle) {
> +		ret = 0;
> +		goto out;
> +	}
>   
>   	mutex_lock(&file_priv->prime.lock);
>   
> @@ -1043,6 +1045,8 @@ int drm_gem_change_handle_ioctl(struct drm_device *dev, void *data,
>   
>   out_unlock:
>   	mutex_unlock(&file_priv->prime.lock);
> +out:
> +	drm_gem_object_put(obj);
>   
>   	return ret;
>   }
Reviewed-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>

