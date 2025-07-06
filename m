Return-Path: <linux-media+bounces-36907-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6387CAFA679
	for <lists+linux-media@lfdr.de>; Sun,  6 Jul 2025 18:23:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF58B3AF156
	for <lists+linux-media@lfdr.de>; Sun,  6 Jul 2025 16:22:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C723028852B;
	Sun,  6 Jul 2025 16:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZMgIUihh"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A35A2CCC8;
	Sun,  6 Jul 2025 16:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751818983; cv=none; b=J2zr+yFbC7D09r4q61dSKP9QEn24lD/A1v/nrN2qIrGz5rdZzF7UfNANfc3/FIT6s3R1NhKS1FT5dGWJO38FEtm952tw3u3gDJibF9r5RK6ls2cRX+HaWpHQk+RfaBdEOJuWO0Ws69Cy2JYzfoJ0BG+alJXQa2AqaOifb9uyMOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751818983; c=relaxed/simple;
	bh=Guv47DylWzsx9F97ey3iXd5L9b7JYxNy+QvHlNNFANs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XNA8BAINJfcSOupD7xIr9tzn4Lnj0x73se/GJiW7a6FUcUTOg6Y1rBgC5n9gq0iV/5doF+ni1hyxpk6pxH5UQq4mP4KZR8tnHc5YQyURwdc2Vez4OFexw7RPLCHzTLbjudZlscYP69M2ccYHQ9H3M7DWDoVXt+z5td+1UoDWZ74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZMgIUihh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2F0AC4CEED;
	Sun,  6 Jul 2025 16:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751818982;
	bh=Guv47DylWzsx9F97ey3iXd5L9b7JYxNy+QvHlNNFANs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZMgIUihh6WHGyhLfN0mFj7vwfqcGrp+UQBTgrpH7SOwMp8fpBpnEPbiAYf82EGanG
	 SGiuYR935RHzwOHpZG2cSZNUZ9bfTV39Ry6Y+p87S126m7dr+eseOWiZtFj/GKzpTV
	 3zQCvuNTI0tiyNUew+RW31TMgRZT8fUS94Lgh+dYzumDlEzpHwsLYDDKyoDOxZxho3
	 Bn6G7Bza9SMh18h7eQ53XK3r9WoVbpBThCC3AO/QKuf2mxBX3358mSzCcRoOD1kcnW
	 tLP+DYn8jCfSzDRM4kPM8sCJu19W+XsQ1PVIaNwkMXZephjO18bWRB/WV4bLBwMvjq
	 9ZuhChUciOjdg==
Message-ID: <fe47fcf0-9d37-451d-8985-9d10a7491eeb@kernel.org>
Date: Sun, 6 Jul 2025 18:22:59 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: media: atomisp: Fix premature setting of
 HMM_BO_DEVICE_INITED flag
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>, andy@kernel.org,
 mchehab@kernel.org, sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org
Cc: linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 skhan@linuxfoundation.com, dan.carpenter@linaro.org
References: <20250628052536.43737-1-abdelrahmanfekry375@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250628052536.43737-1-abdelrahmanfekry375@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 28-Jun-25 7:25 AM, Abdelrahman Fekry wrote:
> The HMM_BO_DEVICE_INITED flag was being set in hmm_bo_device_init()
> before key initialization steps like kmem_cache_create(),
> kmem_cache_alloc(), and __bo_init().
> 
> This means that if any of these steps fail, the flag remains set,
> misleading other parts of the driver (e.g. hmm_bo_alloc())
> into thinking the device is initialized. This could lead
> to undefined behavior or invalid memory use.
> 
> Additionally, since __bo_init() is called from inside
> hmm_bo_device_init() after the flag was already set, its internal
> check for HMM_BO_DEVICE_INITED is redundant.
> 
> - Move the flag assignment to the end after all allocations succeed.
> - Remove redundant check of the flag inside __bo_init()
> 
> Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hansg@kernel.org>

I have adjusted the commit message with a link to the backtrace
you generated through fault-injection and I've merged this in my
media-atomisp branch:

https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

This patch will be included in my next pull-request
to Mauro (to media subsystem maintainer)

Regards,

Hans




> ---
>  drivers/staging/media/atomisp/pci/hmm/hmm_bo.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
> index 224ca8d42721..5d0cd5260d3a 100644
> --- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
> +++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
> @@ -37,8 +37,6 @@ static int __bo_init(struct hmm_bo_device *bdev, struct hmm_buffer_object *bo,
>  		     unsigned int pgnr)
>  {
>  	check_bodev_null_return(bdev, -EINVAL);
> -	var_equal_return(hmm_bo_device_inited(bdev), 0, -EINVAL,
> -			 "hmm_bo_device not inited yet.\n");
>  	/* prevent zero size buffer object */
>  	if (pgnr == 0) {
>  		dev_err(atomisp_dev, "0 size buffer is not allowed.\n");
> @@ -341,7 +339,6 @@ int hmm_bo_device_init(struct hmm_bo_device *bdev,
>  	spin_lock_init(&bdev->list_lock);
>  	mutex_init(&bdev->rbtree_mutex);
> 
> -	bdev->flag = HMM_BO_DEVICE_INITED;
> 
>  	INIT_LIST_HEAD(&bdev->entire_bo_list);
>  	bdev->allocated_rbtree = RB_ROOT;
> @@ -376,6 +373,8 @@ int hmm_bo_device_init(struct hmm_bo_device *bdev,
> 
>  	__bo_insert_to_free_rbtree(&bdev->free_rbtree, bo);
> 
> +	bdev->flag = HMM_BO_DEVICE_INITED;
> +
>  	return 0;
>  }
> 
> --
> 2.25.1
> 
> 


